const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;
const Allocator = mem.Allocator;
const maxInt = std.math.maxInt;

const c = @import("./vulkan.zig");

const DlHandle = opaque {
    fn sym(handle: *DlHandle, symbol: [*:0]const u8, comptime Fn: type) ?Fn {
        const addr = handle.symAddr(symbol);
        if (addr == 0) return null;
        return @intToPtr(Fn, addr);
    }
    fn symAddr(handle: *DlHandle, symbol: [*:0]const u8) usize {
        const dlsym = @extern(DlSymFn, .{
            .name = "dlsym",
            .linkage = .Weak,
        }).?;
        return dlsym(handle, symbol);
    }
};
const DlOpenFn = fn (name: [*:0]const u8, flags: c_int) callconv(.C) ?*DlHandle;
const DlSymFn = fn (handle: *DlHandle, symbol: [*:0]const u8) callconv(.C) usize;
const DlErrorFn = fn () callconv(.C) [*:0]const u8;
const ExitFn = fn (code: c_int) callconv(.C) noreturn;
const LibCStartMainFn = fn (
    main: fn (c_int, [*:null]const ?[*:0]const u8, [*:null]const ?[*:0]const u8) callconv(.C) c_int,
    argc: c_int,
    argv: [*:null]const ?[*:0]const u8,
) c_int;

fn libc_main(
    argc: c_int,
    argv: [*:null]const ?[*:0]const u8,
    envp: [*:null]const ?[*:0]const u8,
) callconv(.C) c_int {
    const result = main2() catch |err| {
        std.log.err("{}", .{@errorName(err)});
        if (@errorReturnTrace()) |trace| {
            std.debug.dumpStackTrace(trace.*);
        }
        return 1;
    };
    return 0;
}

var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
var global_arena: std.heap.ArenaAllocator = undefined;
var dlopen: DlOpenFn = undefined;

pub fn main() anyerror!void {
    const gpa = &general_purpose_allocator.allocator;
    defer _ = general_purpose_allocator.deinit();

    global_arena = std.heap.ArenaAllocator.init(gpa);
    defer global_arena.deinit();
    const arena = &global_arena.allocator;

    std.log.debug("detecting whether we are running in the dynamic linker", .{});
    dlopen = @extern(DlOpenFn, .{
        .name = "dlopen",
        .linkage = .Weak,
    }) orelse {
        std.log.debug("we're not. detecting the dynamic linker path", .{});

        const info = try std.zig.system.NativeTargetInfo.detect(arena, .{});
        std.log.debug("prepare to execve reload", .{});
        const dyld_path = info.dynamic_linker.get() orelse @panic("OS has no dynamic linker");
        std.log.debug("dyld_path={}", .{dyld_path});
        const dyld_z = arena.dupeZ(u8, dyld_path) catch @panic("out of memory");

        const argv = arena.allocSentinel(?[*:0]const u8, std.os.argv.len + 1, null) catch @panic("out of memory");
        argv[0] = dyld_z;
        for (std.os.argv) |arg, i| {
            argv[i + 1] = arg;
        }

        // Create a new set of environemnt variables so we can set LD_PRELOAD
        // NOTE: we tried using the --preload option but not all loaders support it (i.e. Ubuntu/Debian)
        //
        // future improvement, restore the original LD_PRELOAD value on next invocation if we are going
        // to start any children processes
        //
        const envp = arena.alloc(?[*:0]const u8, std.os.environ.len + 2) catch @panic("out of memory");
        for (std.os.environ) |evar, i| {
            envp[i] = evar;
        }
        var envp_len = std.os.environ.len;

        const lib_names = "libdl.so.2 libpthread.so.0";

        for (envp[0..envp_len]) |evar_ptr, i| {
            const evar = std.mem.span(evar_ptr.?);
            if (std.mem.startsWith(u8, evar, "LD_PRELOAD=")) {
                envp[i] = try std.fmt.allocPrintZ(arena, "{s} {s}", .{ evar, lib_names });
                std.log.debug("changing environment variable '{}' to '{}'", .{ evar, envp[i] });
                break;
            }
        } else {
            envp[envp_len] = "LD_PRELOAD=" ++ lib_names;
            std.log.debug("setting environment variable '{}'", .{envp[envp_len]});
            envp_len += 1;
        }
        envp[envp_len] = null;
        return std.os.execveZ(dyld_z, argv, @ptrCast([*:null]const ?[*:0]const u8, envp.ptr));
    };

    std.log.debug("got dlopen. detect libc", .{});

    const info = try std.zig.system.NativeTargetInfo.detect(arena, .{});
    if (info.target.abi.isMusl()) {
        const __libc_start_main = @extern(LibCStartMainFn, .{
            .name = "__libc_start_main",
            .linkage = .Weak,
        }).?;
        const exit = @extern(ExitFn, .{
            .name = "exit",
            .linkage = .Weak,
        }).?;
        std.log.debug("musl. invoke __libc_start_main", .{});
        const argv_ptr = @ptrCast([*:null]const ?[*:0]const u8, std.os.argv.ptr);
        exit(__libc_start_main(libc_main, @intCast(c_int, std.os.argv.len), argv_ptr));
    } else {
        return main2();
    }
}

fn main2() anyerror!void {
    const gpa = &general_purpose_allocator.allocator;
    const arena = &global_arena.allocator;

    std.log.debug("initialize vulkan", .{});

    // This loads shared libraries, so that when we dlopen libxcb.so.1, it will have
    // already been loaded by the vulkan driver. This requires a patch to Vulkan-Loader
    // to use RTLD_GLOBAL instead of RTLD_LOCAL.
    try createInstance(gpa);

    std.log.debug("vulkan initialized, dlopening xcb", .{});

    const dlerror = @extern(DlErrorFn, .{
        .name = "dlerror",
        .linkage = .Weak,
    }).?;

    const xcb = dlopen("libxcb.so.1", std.c.RTLD_LAZY | std.c.RTLD_LOCAL) orelse {
        std.debug.panic("unable to load xcb: {s}", .{dlerror()});
    };
    const xcb_connect = xcb.sym(
        "xcb_connect",
        fn (displayname: ?[*:0]const u8, screenp: *c_int) callconv(.C) ?*xcb_connection_t,
    ).?;
    const xcb_get_setup = xcb.sym(
        "xcb_get_setup",
        fn (c: *xcb_connection_t) callconv(.C) *const xcb_setup_t,
    ).?;
    const xcb_connection_has_error = xcb.sym(
        "xcb_connection_has_error",
        fn (c: *xcb_connection_t) callconv(.C) c_int,
    ).?;
    const xcb_setup_roots_iterator = xcb.sym(
        "xcb_setup_roots_iterator",
        fn (R: *const xcb_setup_t) callconv(.C) xcb_screen_iterator_t,
    ).?;
    const xcb_screen_next = xcb.sym(
        "xcb_screen_next",
        fn (i: *xcb_screen_iterator_t) callconv(.C) void,
    ).?;
    const xcb_generate_id = xcb.sym(
        "xcb_generate_id",
        fn (c: *xcb_connection_t) callconv(.C) u32,
    ).?;
    const xcb_create_window = xcb.sym(
        "xcb_create_window",
        fn (
            c: *xcb_connection_t,
            depth: u8,
            wid: xcb_window_t,
            parent: xcb_window_t,
            x: i16,
            y: i16,
            width: u16,
            height: u16,
            border_width: u16,
            _class: u16,
            visual: xcb_visualid_t,
            value_mask: u32,
            value_list: ?*const c_void,
        ) callconv(.C) xcb_void_cookie_t,
    ).?;
    const xcb_intern_atom = xcb.sym("xcb_intern_atom", XcbInternAtomFn).?;
    const xcb_intern_atom_reply = xcb.sym("xcb_intern_atom_reply", XcbInternAtomReplyFn).?;
    const xcb_change_property = xcb.sym(
        "xcb_change_property",
        fn (
            c: *xcb_connection_t,
            mode: u8,
            window: xcb_window_t,
            property: xcb_atom_t,
            type: xcb_atom_t,
            format: u8,
            data_len: u32,
            data: ?*const c_void,
        ) callconv(.C) xcb_void_cookie_t,
    ).?;
    const xcb_map_window = xcb.sym(
        "xcb_map_window",
        fn (c: *xcb_connection_t, window: xcb_window_t) callconv(.C) xcb_void_cookie_t,
    ).?;

    std.log.debug("connecting to X11", .{});

    var scr: c_int = undefined;
    const connection = xcb_connect(null, &scr).?;
    if (xcb_connection_has_error(connection) != 0) {
        std.debug.panic("Could not find a compatible Vulkan ICD", .{});
    }
    const setup = xcb_get_setup(connection);
    var iter = xcb_setup_roots_iterator(setup);
    while (scr > 0) : (scr -= 1) {
        xcb_screen_next(&iter);
    }
    const screen = iter.data;

    std.log.debug("opening window", .{});
    const window = xcb_generate_id(connection);
    const value_mask = XCB_CW_BACK_PIXEL | XCB_CW_EVENT_MASK;
    const value_list = [_]u32{
        screen.black_pixel,
        XCB_EVENT_MASK_KEY_RELEASE |
            XCB_EVENT_MASK_KEY_PRESS |
            XCB_EVENT_MASK_EXPOSURE |
            XCB_EVENT_MASK_STRUCTURE_NOTIFY |
            XCB_EVENT_MASK_POINTER_MOTION |
            XCB_EVENT_MASK_BUTTON_PRESS |
            XCB_EVENT_MASK_BUTTON_RELEASE,
    };
    const fullscreen = false;
    if (fullscreen) {
        // TODO
    }

    _ = xcb_create_window(
        connection,
        XCB_COPY_FROM_PARENT,
        window,
        screen.root,
        0,
        0,
        WIDTH,
        HEIGHT,
        0,
        @enumToInt(xcb_window_class_t.INPUT_OUTPUT),
        screen.root_visual,
        value_mask,
        &value_list,
    );

    // Send notification when window is destroyed.
    const reply = intern_atom_helper(xcb_intern_atom, xcb_intern_atom_reply, connection, true, "WM_PROTOCOLS");
    const atom_wm_delete_window = intern_atom_helper(xcb_intern_atom, xcb_intern_atom_reply, connection, false, "WM_DELETE_WINDOW");
    _ = xcb_change_property(
        connection,
        @enumToInt(xcb_prop_mode_t.REPLACE),
        window,
        reply.atom,
        4,
        32,
        1,
        &atom_wm_delete_window.atom,
    );

    const title = "window title";
    const name = "windowName";
    _ = xcb_change_property(
        connection,
        @enumToInt(xcb_prop_mode_t.REPLACE),
        window,
        @enumToInt(xcb_atom_enum_t.WM_NAME),
        @enumToInt(xcb_atom_enum_t.STRING),
        8,
        title.len,
        title,
    );

    // Set the WM_CLASS property to display
    // title in dash tooltip and application menu
    // on GNOME and other desktop environments
    var wm_class_buf: [100]u8 = undefined;
    const wm_class = std.fmt.bufPrint(&wm_class_buf, "{s}\x00{s}\x00", .{ name, title }) catch unreachable;
    _ = xcb_change_property(
        connection,
        @enumToInt(xcb_prop_mode_t.REPLACE),
        window,
        @enumToInt(xcb_atom_enum_t.WM_CLASS),
        @enumToInt(xcb_atom_enum_t.STRING),
        8,
        @intCast(u32, wm_class.len),
        wm_class.ptr,
    );
    if (fullscreen) {
        // TODO
    }
    _ = xcb_map_window(connection, window);

    try initVulkan(gpa, connection, window);

    std.log.debug("main loop", .{});

    while (true) {
        try drawFrame();
    }
    try checkSuccess(c.vkDeviceWaitIdle(global_device));

    cleanup();
}

fn cleanup() void {
    var i: usize = 0;
    while (i < MAX_FRAMES_IN_FLIGHT) : (i += 1) {
        c.vkDestroySemaphore(global_device, renderFinishedSemaphores[i], null);
        c.vkDestroySemaphore(global_device, imageAvailableSemaphores[i], null);
        c.vkDestroyFence(global_device, inFlightFences[i], null);
    }

    c.vkDestroyCommandPool(global_device, commandPool, null);

    for (swapChainFramebuffers) |framebuffer| {
        c.vkDestroyFramebuffer(global_device, framebuffer, null);
    }

    c.vkDestroyPipeline(global_device, graphicsPipeline, null);
    c.vkDestroyPipelineLayout(global_device, pipelineLayout, null);
    c.vkDestroyRenderPass(global_device, renderPass, null);

    for (swapChainImageViews) |imageView| {
        c.vkDestroyImageView(global_device, imageView, null);
    }

    c.vkDestroySwapchainKHR(global_device, swapChain, null);
    c.vkDestroyDevice(global_device, null);

    if (enableValidationLayers) {
        DestroyDebugReportCallbackEXT(null);
    }

    c.vkDestroySurfaceKHR(instance, surface, null);
    c.vkDestroyInstance(instance, null);
}

fn intern_atom_helper(
    xcb_intern_atom: XcbInternAtomFn,
    xcb_intern_atom_reply: XcbInternAtomReplyFn,
    conn: *xcb_connection_t,
    only_if_exists: bool,
    name: [:0]const u8,
) *xcb_intern_atom_reply_t {
    const cookie = xcb_intern_atom(
        conn,
        @boolToInt(only_if_exists),
        @intCast(u16, name.len),
        name.ptr,
    );
    return xcb_intern_atom_reply(conn, cookie, null);
}

const XcbInternAtomFn = fn (
    c: *xcb_connection_t,
    only_if_exists: u8,
    name_len: u16,
    name: [*:0]const u8,
) callconv(.C) xcb_intern_atom_cookie_t;

const XcbInternAtomReplyFn = fn (
    c: *xcb_connection_t,
    cookie: xcb_intern_atom_cookie_t,
    e: ?**xcb_generic_error_t,
) callconv(.C) *xcb_intern_atom_reply_t;

const xcb_connection_t = opaque {};
const xcb_keycode_t = u8;
const xcb_window_t = u32;
const xcb_colormap_t = u32;
const xcb_visualid_t = u32;
const xcb_atom_t = u32;

const XCB_CW_BACK_PIXMAP = 1;
const XCB_CW_BACK_PIXEL = 2;
const XCB_CW_BORDER_PIXMAP = 4;
const XCB_CW_BORDER_PIXEL = 8;
const XCB_CW_BIT_GRAVITY = 16;
const XCB_CW_WIN_GRAVITY = 32;
const XCB_CW_BACKING_STORE = 64;
const XCB_CW_BACKING_PLANES = 128;
const XCB_CW_BACKING_PIXEL = 256;
const XCB_CW_OVERRIDE_REDIRECT = 512;
const XCB_CW_SAVE_UNDER = 1024;
const XCB_CW_EVENT_MASK = 2048;
const XCB_CW_DONT_PROPAGATE = 4096;
const XCB_CW_COLORMAP = 8192;
const XCB_CW_CURSOR = 16384;

const XCB_EVENT_MASK_NO_EVENT = 0;
const XCB_EVENT_MASK_KEY_PRESS = 1;
const XCB_EVENT_MASK_KEY_RELEASE = 2;
const XCB_EVENT_MASK_BUTTON_PRESS = 4;
const XCB_EVENT_MASK_BUTTON_RELEASE = 8;
const XCB_EVENT_MASK_ENTER_WINDOW = 16;
const XCB_EVENT_MASK_LEAVE_WINDOW = 32;
const XCB_EVENT_MASK_POINTER_MOTION = 64;
const XCB_EVENT_MASK_POINTER_MOTION_HINT = 128;
const XCB_EVENT_MASK_BUTTON_1_MOTION = 256;
const XCB_EVENT_MASK_BUTTON_2_MOTION = 512;
const XCB_EVENT_MASK_BUTTON_3_MOTION = 1024;
const XCB_EVENT_MASK_BUTTON_4_MOTION = 2048;
const XCB_EVENT_MASK_BUTTON_5_MOTION = 4096;
const XCB_EVENT_MASK_BUTTON_MOTION = 8192;
const XCB_EVENT_MASK_KEYMAP_STATE = 16384;
const XCB_EVENT_MASK_EXPOSURE = 32768;
const XCB_EVENT_MASK_VISIBILITY_CHANGE = 65536;
const XCB_EVENT_MASK_STRUCTURE_NOTIFY = 131072;
const XCB_EVENT_MASK_RESIZE_REDIRECT = 262144;
const XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288;
const XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576;
const XCB_EVENT_MASK_FOCUS_CHANGE = 2097152;
const XCB_EVENT_MASK_PROPERTY_CHANGE = 4194304;
const XCB_EVENT_MASK_COLOR_MAP_CHANGE = 8388608;
const XCB_EVENT_MASK_OWNER_GRAB_BUTTON = 16777216;

const XCB_COPY_FROM_PARENT: c_long = 0;

const xcb_intern_atom_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    atom: xcb_atom_t,
};

const xcb_generic_error_t = extern struct {
    response_type: u8,
    error_code: u8,
    sequence: u16,
    resource_id: u32,
    minor_code: u16,
    major_code: u8,
    pad0: u8,
    pad: [5]u32,
    full_sequence: u32,
};

const xcb_intern_atom_cookie_t = extern struct {
    sequence: c_uint,
};

const xcb_void_cookie_t = extern struct {
    sequence: c_uint,
};

const xcb_setup_t = extern struct {
    status: u8,
    pad0: u8,
    protocol_major_version: u16,
    protocol_minor_version: u16,
    length: u16,
    release_number: u32,
    resource_id_base: u32,
    resource_id_mask: u32,
    motion_buffer_size: u32,
    vendor_len: u16,
    maximum_request_length: u16,
    roots_len: u8,
    pixmap_formats_len: u8,
    image_byte_order: u8,
    bitmap_format_bit_order: u8,
    bitmap_format_scanline_unit: u8,
    bitmap_format_scanline_pad: u8,
    min_keycode: xcb_keycode_t,
    max_keycode: xcb_keycode_t,
    pad1: [4]u8,
};

const xcb_screen_iterator_t = extern struct {
    data: *xcb_screen_t,
    rem: c_int,
    index: c_int,
};
const xcb_screen_t = extern struct {
    root: xcb_window_t,
    default_colormap: xcb_colormap_t,
    white_pixel: u32,
    black_pixel: u32,
    current_input_masks: u32,
    width_in_pixels: u16,
    height_in_pixels: u16,
    width_in_millimeters: u16,
    height_in_millimeters: u16,
    min_installed_maps: u16,
    max_installed_maps: u16,
    root_visual: xcb_visualid_t,
    backing_stores: u8,
    save_unders: u8,
    root_depth: u8,
    allowed_depths_len: u8,
};

pub const xcb_prop_mode_t = extern enum(c_int) {
    REPLACE = 0,
    PREPEND = 1,
    APPEND = 2,
    _,
};

const xcb_atom_enum_t = extern enum(c_int) {
    NONE = 0,
    ANY = 0,
    PRIMARY = 1,
    SECONDARY = 2,
    ARC = 3,
    ATOM = 4,
    BITMAP = 5,
    CARDINAL = 6,
    COLORMAP = 7,
    CURSOR = 8,
    CUT_BUFFER0 = 9,
    CUT_BUFFER1 = 10,
    CUT_BUFFER2 = 11,
    CUT_BUFFER3 = 12,
    CUT_BUFFER4 = 13,
    CUT_BUFFER5 = 14,
    CUT_BUFFER6 = 15,
    CUT_BUFFER7 = 16,
    DRAWABLE = 17,
    FONT = 18,
    INTEGER = 19,
    PIXMAP = 20,
    POINT = 21,
    RECTANGLE = 22,
    RESOURCE_MANAGER = 23,
    RGB_COLOR_MAP = 24,
    RGB_BEST_MAP = 25,
    RGB_BLUE_MAP = 26,
    RGB_DEFAULT_MAP = 27,
    RGB_GRAY_MAP = 28,
    RGB_GREEN_MAP = 29,
    RGB_RED_MAP = 30,
    STRING = 31,
    VISUALID = 32,
    WINDOW = 33,
    WM_COMMAND = 34,
    WM_HINTS = 35,
    WM_CLIENT_MACHINE = 36,
    WM_ICON_NAME = 37,
    WM_ICON_SIZE = 38,
    WM_NAME = 39,
    WM_NORMAL_HINTS = 40,
    WM_SIZE_HINTS = 41,
    WM_ZOOM_HINTS = 42,
    MIN_SPACE = 43,
    NORM_SPACE = 44,
    MAX_SPACE = 45,
    END_SPACE = 46,
    SUPERSCRIPT_X = 47,
    SUPERSCRIPT_Y = 48,
    SUBSCRIPT_X = 49,
    SUBSCRIPT_Y = 50,
    UNDERLINE_POSITION = 51,
    UNDERLINE_THICKNESS = 52,
    STRIKEOUT_ASCENT = 53,
    STRIKEOUT_DESCENT = 54,
    ITALIC_ANGLE = 55,
    X_HEIGHT = 56,
    QUAD_WIDTH = 57,
    WEIGHT = 58,
    POINT_SIZE = 59,
    RESOLUTION = 60,
    COPYRIGHT = 61,
    NOTICE = 62,
    FONT_NAME = 63,
    FAMILY_NAME = 64,
    FULL_NAME = 65,
    CAP_HEIGHT = 66,
    WM_CLASS = 67,
    WM_TRANSIENT_FOR = 68,
    _,
};

const xcb_window_class_t = extern enum(c_int) {
    COPY_FROM_PARENT = 0,
    INPUT_OUTPUT = 1,
    INPUT_ONLY = 2,
    _,
};

const VkXcbSurfaceCreateInfoKHR = extern struct {
    sType: c.VkStructureType,
    pNext: ?*const c_void,
    flags: VkXcbSurfaceCreateFlagsKHR,
    connection: *xcb_connection_t,
    window: xcb_window_t,
};

const VkXcbSurfaceCreateFlagsKHR = c.VkFlags;

extern fn vkCreateXcbSurfaceKHR(
    instance: c.VkInstance,
    pCreateInfo: *const VkXcbSurfaceCreateInfoKHR,
    pAllocator: ?*const c.VkAllocationCallbacks,
    pSurface: *c.VkSurfaceKHR,
) c.VkResult;

const WIDTH = 800;
const HEIGHT = 600;

const MAX_FRAMES_IN_FLIGHT = 2;

const enableValidationLayers = false; // std.debug.runtime_safety;
const validationLayers = [_][*:0]const u8{"VK_LAYER_LUNARG_standard_validation"};
const deviceExtensions = [_][*:0]const u8{c.VK_KHR_SWAPCHAIN_EXTENSION_NAME};

var currentFrame: usize = 0;
var instance: c.VkInstance = undefined;
var callback: c.VkDebugReportCallbackEXT = undefined;
var surface: c.VkSurfaceKHR = undefined;
var physicalDevice: c.VkPhysicalDevice = undefined;
var global_device: c.VkDevice = undefined;
var graphicsQueue: c.VkQueue = undefined;
var presentQueue: c.VkQueue = undefined;
var swapChainImages: []c.VkImage = undefined;
var swapChain: c.VkSwapchainKHR = undefined;
var swapChainImageFormat: c.VkFormat = undefined;
var swapChainExtent: c.VkExtent2D = undefined;
var swapChainImageViews: []c.VkImageView = undefined;
var renderPass: c.VkRenderPass = undefined;
var pipelineLayout: c.VkPipelineLayout = undefined;
var graphicsPipeline: c.VkPipeline = undefined;
var swapChainFramebuffers: []c.VkFramebuffer = undefined;
var commandPool: c.VkCommandPool = undefined;
var commandBuffers: []c.VkCommandBuffer = undefined;

var imageAvailableSemaphores: [MAX_FRAMES_IN_FLIGHT]c.VkSemaphore = undefined;
var renderFinishedSemaphores: [MAX_FRAMES_IN_FLIGHT]c.VkSemaphore = undefined;
var inFlightFences: [MAX_FRAMES_IN_FLIGHT]c.VkFence = undefined;

const QueueFamilyIndices = struct {
    graphicsFamily: ?u32,
    presentFamily: ?u32,

    fn init() QueueFamilyIndices {
        return QueueFamilyIndices{
            .graphicsFamily = null,
            .presentFamily = null,
        };
    }

    fn isComplete(self: QueueFamilyIndices) bool {
        return self.graphicsFamily != null and self.presentFamily != null;
    }
};

const SwapChainSupportDetails = struct {
    capabilities: c.VkSurfaceCapabilitiesKHR,
    formats: std.ArrayList(c.VkSurfaceFormatKHR),
    presentModes: std.ArrayList(c.VkPresentModeKHR),

    fn init(allocator: *Allocator) SwapChainSupportDetails {
        var result = SwapChainSupportDetails{
            .capabilities = undefined,
            .formats = std.ArrayList(c.VkSurfaceFormatKHR).init(allocator),
            .presentModes = std.ArrayList(c.VkPresentModeKHR).init(allocator),
        };
        const slice = mem.sliceAsBytes(@as(*[1]c.VkSurfaceCapabilitiesKHR, &result.capabilities)[0..1]);
        std.mem.set(u8, slice, 0);
        return result;
    }

    fn deinit(self: *SwapChainSupportDetails) void {
        self.formats.deinit();
        self.presentModes.deinit();
    }
};

fn initVulkan(allocator: *Allocator, connection: *xcb_connection_t, window: xcb_window_t) !void {
    try setupDebugCallback();
    try createSurface(connection, window);
    try pickPhysicalDevice(allocator);
    try createLogicalDevice(allocator);
    try createSwapChain(allocator);
    try createImageViews(allocator);
    try createRenderPass();
    try createGraphicsPipeline(allocator);
    try createFramebuffers(allocator);
    try createCommandPool(allocator);
    try createCommandBuffers(allocator);
    try createSyncObjects();
}

fn createInstance(allocator: *Allocator) !void {
    if (enableValidationLayers) {
        if (!(try checkValidationLayerSupport(allocator))) {
            return error.ValidationLayerRequestedButNotAvailable;
        }
    }

    const appInfo = c.VkApplicationInfo{
        .sType = c.VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .pApplicationName = "Hello Triangle",
        .applicationVersion = c.VK_MAKE_VERSION(1, 0, 0),
        .pEngineName = "No Engine",
        .engineVersion = c.VK_MAKE_VERSION(1, 0, 0),
        .apiVersion = c.VK_API_VERSION_1_0,
        .pNext = null,
    };

    var extensions = std.ArrayList([*]const u8).init(allocator);
    defer extensions.deinit();

    try extensions.append("VK_KHR_surface");
    try extensions.append("VK_KHR_xcb_surface");

    if (enableValidationLayers) {
        try extensions.append(c.VK_EXT_DEBUG_REPORT_EXTENSION_NAME);
    }

    const createInfo = c.VkInstanceCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
        .pApplicationInfo = &appInfo,
        .enabledExtensionCount = @intCast(u32, extensions.items.len),
        .ppEnabledExtensionNames = extensions.items.ptr,
        .enabledLayerCount = if (enableValidationLayers) @intCast(u32, validationLayers.len) else 0,
        .ppEnabledLayerNames = if (enableValidationLayers) &validationLayers else null,
        .pNext = null,
        .flags = 0,
    };

    try checkSuccess(c.vkCreateInstance(&createInfo, null, &instance));
}

fn checkSuccess(result: c.VkResult) !void {
    switch (result) {
        .VK_SUCCESS => {},
        .VK_NOT_READY => return error.VulkanNotReady,
        .VK_TIMEOUT => return error.VulkanTimeout,
        .VK_EVENT_SET => return error.VulkanEventSet,
        .VK_EVENT_RESET => return error.VulkanEventReset,
        .VK_INCOMPLETE => return error.VulkanIncomplete,
        .VK_ERROR_OUT_OF_HOST_MEMORY => return error.VulkanOutOfHostMemory,
        .VK_ERROR_OUT_OF_DEVICE_MEMORY => return error.VulkanOutOfDeviceMemory,
        .VK_ERROR_INITIALIZATION_FAILED => return error.VulkanInitializationFailed,
        .VK_ERROR_DEVICE_LOST => return error.VulkanDeviceLost,
        .VK_ERROR_MEMORY_MAP_FAILED => return error.VulkanMemoryMapFailed,
        .VK_ERROR_LAYER_NOT_PRESENT => return error.VulkanLayerNotPresent,
        .VK_ERROR_EXTENSION_NOT_PRESENT => return error.VulkanExtensionNotPresent,
        .VK_ERROR_FEATURE_NOT_PRESENT => return error.VulkanFeatureNotPresent,
        .VK_ERROR_INCOMPATIBLE_DRIVER => return error.VulkanIncompatibleDriver,
        .VK_ERROR_TOO_MANY_OBJECTS => return error.VulkanTooManyObjects,
        .VK_ERROR_FORMAT_NOT_SUPPORTED => return error.VulkanFormatNotSupported,
        .VK_ERROR_FRAGMENTED_POOL => return error.VulkanFragmentedPool,
        .VK_ERROR_OUT_OF_POOL_MEMORY => return error.VulkanOutOfPoolMemory,
        .VK_ERROR_INVALID_EXTERNAL_HANDLE => return error.VulkanInvalidExternalHandle,
        .VK_ERROR_SURFACE_LOST_KHR => return error.VulkanSurfaceLost,
        .VK_ERROR_NATIVE_WINDOW_IN_USE_KHR => return error.VulkanNativeWindowInUse,
        .VK_SUBOPTIMAL_KHR => return error.VulkanSuboptimal,
        .VK_ERROR_OUT_OF_DATE_KHR => return error.VulkanOutOfDate,
        .VK_ERROR_INCOMPATIBLE_DISPLAY_KHR => return error.VulkanIncompatibleDisplay,
        .VK_ERROR_VALIDATION_FAILED_EXT => return error.VulkanValidationFailed,
        .VK_ERROR_INVALID_SHADER_NV => return error.VulkanInvalidShader,
        .VK_ERROR_FRAGMENTATION_EXT => return error.VulkanFragmentation,
        .VK_ERROR_NOT_PERMITTED_EXT => return error.VulkanNotPermitted,
        else => return error.VulkanUnexpected,
    }
}

fn checkValidationLayerSupport(allocator: *Allocator) !bool {
    var layerCount: u32 = undefined;

    try checkSuccess(c.vkEnumerateInstanceLayerProperties(&layerCount, null));

    const availableLayers = try allocator.alloc(c.VkLayerProperties, layerCount);
    defer allocator.free(availableLayers);

    try checkSuccess(c.vkEnumerateInstanceLayerProperties(&layerCount, availableLayers.ptr));

    for (validationLayers) |layerName| {
        var layerFound = false;

        for (availableLayers) |layerProperties| {
            if (std.cstr.cmp(layerName, @ptrCast([*:0]const u8, &layerProperties.layerName)) == 0) {
                layerFound = true;
                break;
            }
        }

        if (!layerFound) {
            return false;
        }
    }

    return true;
}

fn setupDebugCallback() error{FailedToSetUpDebugCallback}!void {
    if (!enableValidationLayers) return;

    var createInfo = c.VkDebugReportCallbackCreateInfoEXT{
        .sType = c.VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
        .flags = c.VK_DEBUG_REPORT_ERROR_BIT_EXT | c.VK_DEBUG_REPORT_WARNING_BIT_EXT,
        .pfnCallback = debugCallback,
        .pNext = null,
        .pUserData = null,
    };

    if (CreateDebugReportCallbackEXT(&createInfo, null, &callback) != c.VK_SUCCESS) {
        return error.FailedToSetUpDebugCallback;
    }
}

fn createSurface(connection: *xcb_connection_t, window: xcb_window_t) !void {
    var surfaceCreateInfo = VkXcbSurfaceCreateInfoKHR{
        .sType = .VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR,
        .connection = connection,
        .window = window,
        .pNext = null,
        .flags = 0,
    };
    try checkSuccess(vkCreateXcbSurfaceKHR(instance, &surfaceCreateInfo, null, &surface));
}

fn createCommandBuffers(allocator: *Allocator) !void {
    commandBuffers = try allocator.alloc(c.VkCommandBuffer, swapChainFramebuffers.len);

    const allocInfo = c.VkCommandBufferAllocateInfo{
        .sType = c.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
        .commandPool = commandPool,
        .level = c.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        .commandBufferCount = @intCast(u32, commandBuffers.len),
        .pNext = null,
    };

    try checkSuccess(c.vkAllocateCommandBuffers(global_device, &allocInfo, commandBuffers.ptr));

    for (commandBuffers) |command_buffer, i| {
        const beginInfo = c.VkCommandBufferBeginInfo{
            .sType = c.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
            .flags = c.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT,
            .pNext = null,
            .pInheritanceInfo = null,
        };

        try checkSuccess(c.vkBeginCommandBuffer(commandBuffers[i], &beginInfo));

        const clearColor = [1]c.VkClearValue{c.VkClearValue{
            .color = c.VkClearColorValue{ .float32 = [_]f32{ 0.0, 0.0, 0.0, 1.0 } },
        }};

        const renderPassInfo = c.VkRenderPassBeginInfo{
            .sType = c.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
            .renderPass = renderPass,
            .framebuffer = swapChainFramebuffers[i],
            .renderArea = c.VkRect2D{
                .offset = c.VkOffset2D{ .x = 0, .y = 0 },
                .extent = swapChainExtent,
            },
            .clearValueCount = 1,
            .pClearValues = @as(*const [1]c.VkClearValue, &clearColor),

            .pNext = null,
        };

        c.vkCmdBeginRenderPass(commandBuffers[i], &renderPassInfo, c.VK_SUBPASS_CONTENTS_INLINE);
        {
            c.vkCmdBindPipeline(commandBuffers[i], c.VK_PIPELINE_BIND_POINT_GRAPHICS, graphicsPipeline);
            c.vkCmdDraw(commandBuffers[i], 3, 1, 0, 0);
        }
        c.vkCmdEndRenderPass(commandBuffers[i]);

        try checkSuccess(c.vkEndCommandBuffer(commandBuffers[i]));
    }
}

fn createSyncObjects() !void {
    const semaphoreInfo = c.VkSemaphoreCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO,
        .pNext = null,
        .flags = 0,
    };

    const fenceInfo = c.VkFenceCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
        .flags = c.VK_FENCE_CREATE_SIGNALED_BIT,
        .pNext = null,
    };

    var i: usize = 0;
    while (i < MAX_FRAMES_IN_FLIGHT) : (i += 1) {
        try checkSuccess(c.vkCreateSemaphore(global_device, &semaphoreInfo, null, &imageAvailableSemaphores[i]));
        try checkSuccess(c.vkCreateSemaphore(global_device, &semaphoreInfo, null, &renderFinishedSemaphores[i]));
        try checkSuccess(c.vkCreateFence(global_device, &fenceInfo, null, &inFlightFences[i]));
    }
}

fn createCommandPool(allocator: *Allocator) !void {
    const queueFamilyIndices = try findQueueFamilies(allocator, physicalDevice);

    const poolInfo = c.VkCommandPoolCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO,
        .queueFamilyIndex = queueFamilyIndices.graphicsFamily.?,

        .pNext = null,
        .flags = 0,
    };

    try checkSuccess(c.vkCreateCommandPool(global_device, &poolInfo, null, &commandPool));
}

fn createFramebuffers(allocator: *Allocator) !void {
    swapChainFramebuffers = try allocator.alloc(c.VkFramebuffer, swapChainImageViews.len);

    for (swapChainImageViews) |swap_chain_image_view, i| {
        const attachments = [_]c.VkImageView{swap_chain_image_view};

        const framebufferInfo = c.VkFramebufferCreateInfo{
            .sType = c.VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO,
            .renderPass = renderPass,
            .attachmentCount = 1,
            .pAttachments = &attachments,
            .width = swapChainExtent.width,
            .height = swapChainExtent.height,
            .layers = 1,

            .pNext = null,
            .flags = 0,
        };

        try checkSuccess(c.vkCreateFramebuffer(global_device, &framebufferInfo, null, &swapChainFramebuffers[i]));
    }
}

fn createShaderModule(code: []align(@alignOf(u32)) const u8) !c.VkShaderModule {
    const createInfo = c.VkShaderModuleCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        .codeSize = code.len,
        .pCode = mem.bytesAsSlice(u32, code).ptr,

        .pNext = null,
        .flags = 0,
    };

    var shaderModule: c.VkShaderModule = undefined;
    try checkSuccess(c.vkCreateShaderModule(global_device, &createInfo, null, &shaderModule));

    return shaderModule;
}

fn createGraphicsPipeline(allocator: *Allocator) !void {
    const vertShaderCode align(4) = @embedFile("../shaders/vert.spv").*;
    const fragShaderCode align(4) = @embedFile("../shaders/frag.spv").*;

    const vertShaderModule = try createShaderModule(&vertShaderCode);
    const fragShaderModule = try createShaderModule(&fragShaderCode);

    const vertShaderStageInfo = c.VkPipelineShaderStageCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        .stage = c.VK_SHADER_STAGE_VERTEX_BIT,
        .module = vertShaderModule,
        .pName = "main",

        .pNext = null,
        .flags = 0,
        .pSpecializationInfo = null,
    };

    const fragShaderStageInfo = c.VkPipelineShaderStageCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        .stage = c.VK_SHADER_STAGE_FRAGMENT_BIT,
        .module = fragShaderModule,
        .pName = "main",
        .pNext = null,
        .flags = 0,

        .pSpecializationInfo = null,
    };

    const shaderStages = [_]c.VkPipelineShaderStageCreateInfo{ vertShaderStageInfo, fragShaderStageInfo };

    const vertexInputInfo = c.VkPipelineVertexInputStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
        .vertexBindingDescriptionCount = 0,
        .vertexAttributeDescriptionCount = 0,

        .pVertexBindingDescriptions = null,
        .pVertexAttributeDescriptions = null,
        .pNext = null,
        .flags = 0,
    };

    const inputAssembly = c.VkPipelineInputAssemblyStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
        .topology = c.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
        .primitiveRestartEnable = c.VK_FALSE,
        .pNext = null,
        .flags = 0,
    };

    const viewport = [_]c.VkViewport{c.VkViewport{
        .x = 0.0,
        .y = 0.0,
        .width = @intToFloat(f32, swapChainExtent.width),
        .height = @intToFloat(f32, swapChainExtent.height),
        .minDepth = 0.0,
        .maxDepth = 1.0,
    }};

    const scissor = [_]c.VkRect2D{c.VkRect2D{
        .offset = c.VkOffset2D{ .x = 0, .y = 0 },
        .extent = swapChainExtent,
    }};

    const viewportState = c.VkPipelineViewportStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
        .viewportCount = 1,
        .pViewports = &viewport,
        .scissorCount = 1,
        .pScissors = &scissor,

        .pNext = null,
        .flags = 0,
    };

    const rasterizer = c.VkPipelineRasterizationStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
        .depthClampEnable = c.VK_FALSE,
        .rasterizerDiscardEnable = c.VK_FALSE,
        .polygonMode = c.VK_POLYGON_MODE_FILL,
        .lineWidth = 1.0,
        .cullMode = @intCast(u32, @enumToInt(c.VK_CULL_MODE_BACK_BIT)),
        .frontFace = c.VK_FRONT_FACE_CLOCKWISE,
        .depthBiasEnable = c.VK_FALSE,

        .pNext = null,
        .flags = 0,
        .depthBiasConstantFactor = 0,
        .depthBiasClamp = 0,
        .depthBiasSlopeFactor = 0,
    };

    const multisampling = c.VkPipelineMultisampleStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
        .sampleShadingEnable = c.VK_FALSE,
        .rasterizationSamples = c.VK_SAMPLE_COUNT_1_BIT,
        .pNext = null,
        .flags = 0,
        .minSampleShading = 0,
        .pSampleMask = null,
        .alphaToCoverageEnable = 0,
        .alphaToOneEnable = 0,
    };

    const colorBlendAttachment = c.VkPipelineColorBlendAttachmentState{
        .colorWriteMask = c.VK_COLOR_COMPONENT_R_BIT | c.VK_COLOR_COMPONENT_G_BIT | c.VK_COLOR_COMPONENT_B_BIT | c.VK_COLOR_COMPONENT_A_BIT,
        .blendEnable = c.VK_FALSE,

        .srcColorBlendFactor = c.VK_BLEND_FACTOR_ZERO,
        .dstColorBlendFactor = c.VK_BLEND_FACTOR_ZERO,
        .colorBlendOp = c.VK_BLEND_OP_ADD,
        .srcAlphaBlendFactor = c.VK_BLEND_FACTOR_ZERO,
        .dstAlphaBlendFactor = c.VK_BLEND_FACTOR_ZERO,
        .alphaBlendOp = c.VK_BLEND_OP_ADD,
    };

    const colorBlending = c.VkPipelineColorBlendStateCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
        .logicOpEnable = c.VK_FALSE,
        .logicOp = c.VK_LOGIC_OP_COPY,
        .attachmentCount = 1,
        .pAttachments = &colorBlendAttachment,
        .blendConstants = [_]f32{ 0, 0, 0, 0 },

        .pNext = null,
        .flags = 0,
    };

    const pipelineLayoutInfo = c.VkPipelineLayoutCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
        .setLayoutCount = 0,
        .pushConstantRangeCount = 0,
        .pNext = null,
        .flags = 0,
        .pSetLayouts = null,
        .pPushConstantRanges = null,
    };

    try checkSuccess(c.vkCreatePipelineLayout(global_device, &pipelineLayoutInfo, null, &pipelineLayout));

    const pipelineInfo = [_]c.VkGraphicsPipelineCreateInfo{c.VkGraphicsPipelineCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
        .stageCount = @intCast(u32, shaderStages.len),
        .pStages = &shaderStages,
        .pVertexInputState = &vertexInputInfo,
        .pInputAssemblyState = &inputAssembly,
        .pViewportState = &viewportState,
        .pRasterizationState = &rasterizer,
        .pMultisampleState = &multisampling,
        .pColorBlendState = &colorBlending,
        .layout = pipelineLayout,
        .renderPass = renderPass,
        .subpass = 0,
        .basePipelineHandle = null,

        .pNext = null,
        .flags = 0,
        .pTessellationState = null,
        .pDepthStencilState = null,
        .pDynamicState = null,
        .basePipelineIndex = 0,
    }};

    try checkSuccess(c.vkCreateGraphicsPipelines(
        global_device,
        null,
        @intCast(u32, pipelineInfo.len),
        &pipelineInfo,
        null,
        @as(*[1]c.VkPipeline, &graphicsPipeline),
    ));

    c.vkDestroyShaderModule(global_device, fragShaderModule, null);
    c.vkDestroyShaderModule(global_device, vertShaderModule, null);
}

fn createRenderPass() !void {
    const colorAttachment = c.VkAttachmentDescription{
        .format = swapChainImageFormat,
        .samples = c.VK_SAMPLE_COUNT_1_BIT,
        .loadOp = c.VK_ATTACHMENT_LOAD_OP_CLEAR,
        .storeOp = c.VK_ATTACHMENT_STORE_OP_STORE,
        .stencilLoadOp = c.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
        .stencilStoreOp = c.VK_ATTACHMENT_STORE_OP_DONT_CARE,
        .initialLayout = c.VK_IMAGE_LAYOUT_UNDEFINED,
        .finalLayout = c.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
        .flags = 0,
    };

    const colorAttachmentRef = [1]c.VkAttachmentReference{c.VkAttachmentReference{
        .attachment = 0,
        .layout = c.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
    }};

    const subpass = [_]c.VkSubpassDescription{c.VkSubpassDescription{
        .pipelineBindPoint = c.VK_PIPELINE_BIND_POINT_GRAPHICS,
        .colorAttachmentCount = 1,
        .pColorAttachments = @as(*const [1]c.VkAttachmentReference, &colorAttachmentRef),

        .flags = 0,
        .inputAttachmentCount = 0,
        .pInputAttachments = null,
        .pResolveAttachments = null,
        .pDepthStencilAttachment = null,
        .preserveAttachmentCount = 0,
        .pPreserveAttachments = null,
    }};

    const dependency = [_]c.VkSubpassDependency{c.VkSubpassDependency{
        .srcSubpass = c.VK_SUBPASS_EXTERNAL,
        .dstSubpass = 0,
        .srcStageMask = c.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
        .srcAccessMask = 0,
        .dstStageMask = c.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
        .dstAccessMask = c.VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | c.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,

        .dependencyFlags = 0,
    }};

    const renderPassInfo = c.VkRenderPassCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO,
        .attachmentCount = 1,
        .pAttachments = @ptrCast(*const [1]c.VkAttachmentDescription, &colorAttachment),
        .subpassCount = 1,
        .pSubpasses = &subpass,
        .dependencyCount = 1,
        .pDependencies = &dependency,

        .pNext = null,
        .flags = 0,
    };

    try checkSuccess(c.vkCreateRenderPass(global_device, &renderPassInfo, null, &renderPass));
}

fn createImageViews(allocator: *Allocator) !void {
    swapChainImageViews = try allocator.alloc(c.VkImageView, swapChainImages.len);
    errdefer allocator.free(swapChainImageViews);

    for (swapChainImages) |swap_chain_image, i| {
        const createInfo = c.VkImageViewCreateInfo{
            .sType = c.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
            .image = swap_chain_image,
            .viewType = c.VK_IMAGE_VIEW_TYPE_2D,
            .format = swapChainImageFormat,
            .components = c.VkComponentMapping{
                .r = c.VK_COMPONENT_SWIZZLE_IDENTITY,
                .g = c.VK_COMPONENT_SWIZZLE_IDENTITY,
                .b = c.VK_COMPONENT_SWIZZLE_IDENTITY,
                .a = c.VK_COMPONENT_SWIZZLE_IDENTITY,
            },
            .subresourceRange = c.VkImageSubresourceRange{
                .aspectMask = c.VK_IMAGE_ASPECT_COLOR_BIT,
                .baseMipLevel = 0,
                .levelCount = 1,
                .baseArrayLayer = 0,
                .layerCount = 1,
            },

            .pNext = null,
            .flags = 0,
        };

        try checkSuccess(c.vkCreateImageView(global_device, &createInfo, null, &swapChainImageViews[i]));
    }
}

fn chooseSwapSurfaceFormat(availableFormats: []c.VkSurfaceFormatKHR) c.VkSurfaceFormatKHR {
    if (availableFormats.len == 1 and availableFormats[0].format == c.VK_FORMAT_UNDEFINED) {
        return c.VkSurfaceFormatKHR{
            .format = c.VK_FORMAT_B8G8R8A8_UNORM,
            .colorSpace = c.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
        };
    }

    for (availableFormats) |availableFormat| {
        if (availableFormat.format == c.VK_FORMAT_B8G8R8A8_UNORM and
            availableFormat.colorSpace == c.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR)
        {
            return availableFormat;
        }
    }

    return availableFormats[0];
}

fn chooseSwapPresentMode(availablePresentModes: []c.VkPresentModeKHR) c.VkPresentModeKHR {
    var bestMode: c.VkPresentModeKHR = c.VK_PRESENT_MODE_FIFO_KHR;

    for (availablePresentModes) |availablePresentMode| {
        if (availablePresentMode == c.VK_PRESENT_MODE_MAILBOX_KHR) {
            return availablePresentMode;
        } else if (availablePresentMode == c.VK_PRESENT_MODE_IMMEDIATE_KHR) {
            bestMode = availablePresentMode;
        }
    }

    return bestMode;
}

fn chooseSwapExtent(capabilities: c.VkSurfaceCapabilitiesKHR) c.VkExtent2D {
    if (capabilities.currentExtent.width != maxInt(u32)) {
        return capabilities.currentExtent;
    } else {
        var actualExtent = c.VkExtent2D{
            .width = WIDTH,
            .height = HEIGHT,
        };

        actualExtent.width = std.math.max(capabilities.minImageExtent.width, std.math.min(capabilities.maxImageExtent.width, actualExtent.width));
        actualExtent.height = std.math.max(capabilities.minImageExtent.height, std.math.min(capabilities.maxImageExtent.height, actualExtent.height));

        return actualExtent;
    }
}

fn createSwapChain(allocator: *Allocator) !void {
    var swapChainSupport = try querySwapChainSupport(allocator, physicalDevice);
    defer swapChainSupport.deinit();

    const surfaceFormat = chooseSwapSurfaceFormat(swapChainSupport.formats.items);
    const presentMode = chooseSwapPresentMode(swapChainSupport.presentModes.items);
    const extent = chooseSwapExtent(swapChainSupport.capabilities);

    var imageCount: u32 = swapChainSupport.capabilities.minImageCount + 1;
    if (swapChainSupport.capabilities.maxImageCount > 0 and
        imageCount > swapChainSupport.capabilities.maxImageCount)
    {
        imageCount = swapChainSupport.capabilities.maxImageCount;
    }

    const indices = try findQueueFamilies(allocator, physicalDevice);
    const queueFamilyIndices = [_]u32{ indices.graphicsFamily.?, indices.presentFamily.? };

    const different_families = indices.graphicsFamily.? != indices.presentFamily.?;

    var createInfo = c.VkSwapchainCreateInfoKHR{
        .sType = c.VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
        .surface = surface,

        .minImageCount = imageCount,
        .imageFormat = surfaceFormat.format,
        .imageColorSpace = surfaceFormat.colorSpace,
        .imageExtent = extent,
        .imageArrayLayers = 1,
        .imageUsage = c.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,

        .imageSharingMode = if (different_families) c.VK_SHARING_MODE_CONCURRENT else c.VK_SHARING_MODE_EXCLUSIVE,
        .queueFamilyIndexCount = if (different_families) @as(u32, 2) else @as(u32, 0),
        .pQueueFamilyIndices = if (different_families) &queueFamilyIndices else &([_]u32{ 0, 0 }),

        .preTransform = swapChainSupport.capabilities.currentTransform,
        .compositeAlpha = c.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
        .presentMode = presentMode,
        .clipped = c.VK_TRUE,

        .oldSwapchain = null,

        .pNext = null,
        .flags = 0,
    };

    try checkSuccess(c.vkCreateSwapchainKHR(global_device, &createInfo, null, &swapChain));

    try checkSuccess(c.vkGetSwapchainImagesKHR(global_device, swapChain, &imageCount, null));
    swapChainImages = try allocator.alloc(c.VkImage, imageCount);
    try checkSuccess(c.vkGetSwapchainImagesKHR(global_device, swapChain, &imageCount, swapChainImages.ptr));

    swapChainImageFormat = surfaceFormat.format;
    swapChainExtent = extent;
}

fn createLogicalDevice(allocator: *Allocator) !void {
    const indices = try findQueueFamilies(allocator, physicalDevice);

    var queueCreateInfos = std.ArrayList(c.VkDeviceQueueCreateInfo).init(allocator);
    defer queueCreateInfos.deinit();
    const all_queue_families = [_]u32{ indices.graphicsFamily.?, indices.presentFamily.? };
    const uniqueQueueFamilies = if (indices.graphicsFamily.? == indices.presentFamily.?)
        all_queue_families[0..1]
    else
        all_queue_families[0..2];

    var queuePriority: f32 = 1.0;
    for (uniqueQueueFamilies) |queueFamily| {
        const queueCreateInfo = c.VkDeviceQueueCreateInfo{
            .sType = c.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
            .queueFamilyIndex = queueFamily,
            .queueCount = 1,
            .pQueuePriorities = &queuePriority,
            .pNext = null,
            .flags = 0,
        };
        try queueCreateInfos.append(queueCreateInfo);
    }

    const deviceFeatures = c.VkPhysicalDeviceFeatures{
        .robustBufferAccess = 0,
        .fullDrawIndexUint32 = 0,
        .imageCubeArray = 0,
        .independentBlend = 0,
        .geometryShader = 0,
        .tessellationShader = 0,
        .sampleRateShading = 0,
        .dualSrcBlend = 0,
        .logicOp = 0,
        .multiDrawIndirect = 0,
        .drawIndirectFirstInstance = 0,
        .depthClamp = 0,
        .depthBiasClamp = 0,
        .fillModeNonSolid = 0,
        .depthBounds = 0,
        .wideLines = 0,
        .largePoints = 0,
        .alphaToOne = 0,
        .multiViewport = 0,
        .samplerAnisotropy = 0,
        .textureCompressionETC2 = 0,
        .textureCompressionASTC_LDR = 0,
        .textureCompressionBC = 0,
        .occlusionQueryPrecise = 0,
        .pipelineStatisticsQuery = 0,
        .vertexPipelineStoresAndAtomics = 0,
        .fragmentStoresAndAtomics = 0,
        .shaderTessellationAndGeometryPointSize = 0,
        .shaderImageGatherExtended = 0,
        .shaderStorageImageExtendedFormats = 0,
        .shaderStorageImageMultisample = 0,
        .shaderStorageImageReadWithoutFormat = 0,
        .shaderStorageImageWriteWithoutFormat = 0,
        .shaderUniformBufferArrayDynamicIndexing = 0,
        .shaderSampledImageArrayDynamicIndexing = 0,
        .shaderStorageBufferArrayDynamicIndexing = 0,
        .shaderStorageImageArrayDynamicIndexing = 0,
        .shaderClipDistance = 0,
        .shaderCullDistance = 0,
        .shaderFloat64 = 0,
        .shaderInt64 = 0,
        .shaderInt16 = 0,
        .shaderResourceResidency = 0,
        .shaderResourceMinLod = 0,
        .sparseBinding = 0,
        .sparseResidencyBuffer = 0,
        .sparseResidencyImage2D = 0,
        .sparseResidencyImage3D = 0,
        .sparseResidency2Samples = 0,
        .sparseResidency4Samples = 0,
        .sparseResidency8Samples = 0,
        .sparseResidency16Samples = 0,
        .sparseResidencyAliased = 0,
        .variableMultisampleRate = 0,
        .inheritedQueries = 0,
    };

    const createInfo = c.VkDeviceCreateInfo{
        .sType = c.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,

        .queueCreateInfoCount = @intCast(u32, queueCreateInfos.items.len),
        .pQueueCreateInfos = queueCreateInfos.items.ptr,

        .pEnabledFeatures = &deviceFeatures,

        .enabledExtensionCount = @intCast(u32, deviceExtensions.len),
        .ppEnabledExtensionNames = &deviceExtensions,
        .enabledLayerCount = if (enableValidationLayers) @intCast(u32, validationLayers.len) else 0,
        .ppEnabledLayerNames = if (enableValidationLayers) &validationLayers else null,

        .pNext = null,
        .flags = 0,
    };

    try checkSuccess(c.vkCreateDevice(physicalDevice, &createInfo, null, &global_device));

    c.vkGetDeviceQueue(global_device, indices.graphicsFamily.?, 0, &graphicsQueue);
    c.vkGetDeviceQueue(global_device, indices.presentFamily.?, 0, &presentQueue);
}

fn pickPhysicalDevice(allocator: *Allocator) !void {
    var deviceCount: u32 = 0;
    try checkSuccess(c.vkEnumeratePhysicalDevices(instance, &deviceCount, null));

    if (deviceCount == 0) {
        return error.FailedToFindGPUsWithVulkanSupport;
    }

    const devices = try allocator.alloc(c.VkPhysicalDevice, deviceCount);
    defer allocator.free(devices);
    try checkSuccess(c.vkEnumeratePhysicalDevices(instance, &deviceCount, devices.ptr));

    physicalDevice = for (devices) |device| {
        if (try isDeviceSuitable(allocator, device)) {
            break device;
        }
    } else return error.FailedToFindSuitableGPU;
}

fn findQueueFamilies(allocator: *Allocator, device: c.VkPhysicalDevice) !QueueFamilyIndices {
    var indices = QueueFamilyIndices.init();

    var queueFamilyCount: u32 = 0;
    c.vkGetPhysicalDeviceQueueFamilyProperties(device, &queueFamilyCount, null);

    const queueFamilies = try allocator.alloc(c.VkQueueFamilyProperties, queueFamilyCount);
    defer allocator.free(queueFamilies);
    c.vkGetPhysicalDeviceQueueFamilyProperties(device, &queueFamilyCount, queueFamilies.ptr);

    var i: u32 = 0;
    for (queueFamilies) |queueFamily| {
        if (queueFamily.queueCount > 0 and
            queueFamily.queueFlags & c.VK_QUEUE_GRAPHICS_BIT != 0)
        {
            indices.graphicsFamily = i;
        }

        var presentSupport: c.VkBool32 = 0;
        try checkSuccess(c.vkGetPhysicalDeviceSurfaceSupportKHR(device, i, surface, &presentSupport));

        if (queueFamily.queueCount > 0 and presentSupport != 0) {
            indices.presentFamily = i;
        }

        if (indices.isComplete()) {
            break;
        }

        i += 1;
    }

    return indices;
}

fn isDeviceSuitable(allocator: *Allocator, device: c.VkPhysicalDevice) !bool {
    const indices = try findQueueFamilies(allocator, device);

    const extensionsSupported = try checkDeviceExtensionSupport(allocator, device);

    var swapChainAdequate = false;
    if (extensionsSupported) {
        var swapChainSupport = try querySwapChainSupport(allocator, device);
        defer swapChainSupport.deinit();
        swapChainAdequate = swapChainSupport.formats.items.len != 0 and swapChainSupport.presentModes.items.len != 0;
    }

    return indices.isComplete() and extensionsSupported and swapChainAdequate;
}

fn querySwapChainSupport(allocator: *Allocator, device: c.VkPhysicalDevice) !SwapChainSupportDetails {
    var details = SwapChainSupportDetails.init(allocator);

    try checkSuccess(c.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(device, surface, &details.capabilities));

    var formatCount: u32 = undefined;
    try checkSuccess(c.vkGetPhysicalDeviceSurfaceFormatsKHR(device, surface, &formatCount, null));

    if (formatCount != 0) {
        try details.formats.resize(formatCount);
        try checkSuccess(c.vkGetPhysicalDeviceSurfaceFormatsKHR(device, surface, &formatCount, details.formats.items.ptr));
    }

    var presentModeCount: u32 = undefined;
    try checkSuccess(c.vkGetPhysicalDeviceSurfacePresentModesKHR(device, surface, &presentModeCount, null));

    if (presentModeCount != 0) {
        try details.presentModes.resize(presentModeCount);
        try checkSuccess(c.vkGetPhysicalDeviceSurfacePresentModesKHR(device, surface, &presentModeCount, details.presentModes.items.ptr));
    }

    return details;
}

fn checkDeviceExtensionSupport(allocator: *Allocator, device: c.VkPhysicalDevice) !bool {
    var extensionCount: u32 = undefined;
    try checkSuccess(c.vkEnumerateDeviceExtensionProperties(device, null, &extensionCount, null));

    const availableExtensions = try allocator.alloc(c.VkExtensionProperties, extensionCount);
    defer allocator.free(availableExtensions);
    try checkSuccess(c.vkEnumerateDeviceExtensionProperties(device, null, &extensionCount, availableExtensions.ptr));

    const CStrHashMap = std.HashMap(
        [*:0]const u8,
        void,
        hash_cstr,
        eql_cstr,
        std.hash_map.DefaultMaxLoadPercentage,
    );
    var requiredExtensions = CStrHashMap.init(allocator);
    defer requiredExtensions.deinit();
    for (deviceExtensions) |device_ext| {
        _ = try requiredExtensions.put(device_ext, {});
    }

    for (availableExtensions) |extension| {
        _ = requiredExtensions.remove(@ptrCast([*:0]const u8, &extension.extensionName));
    }

    return requiredExtensions.count() == 0;
}

// TODO https://github.com/ziglang/zig/issues/661
// Doesn't work on Windows until the above is fixed, because
// this function needs to be stdcallcc on Windows.
fn debugCallback(
    flags: c.VkDebugReportFlagsEXT,
    objType: c.VkDebugReportObjectTypeEXT,
    obj: u64,
    location: usize,
    code: i32,
    layerPrefix: [*:0]const u8,
    msg: [*:0]const u8,
    userData: ?*c_void,
) callconv(.C) c.VkBool32 {
    std.debug.warn("validation layer: {s}\n", .{msg});
    return c.VK_FALSE;
}

fn DestroyDebugReportCallbackEXT(
    pAllocator: ?*const c.VkAllocationCallbacks,
) void {
    const func = @ptrCast(c.PFN_vkDestroyDebugReportCallbackEXT, c.vkGetInstanceProcAddr(
        instance,
        "vkDestroyDebugReportCallbackEXT",
    )) orelse unreachable;
    func(instance, callback, pAllocator);
}

fn CreateDebugReportCallbackEXT(
    pCreateInfo: *const c.VkDebugReportCallbackCreateInfoEXT,
    pAllocator: ?*const c.VkAllocationCallbacks,
    pCallback: *c.VkDebugReportCallbackEXT,
) c.VkResult {
    const func = @ptrCast(c.PFN_vkCreateDebugReportCallbackEXT, c.vkGetInstanceProcAddr(
        instance,
        "vkCreateDebugReportCallbackEXT",
    )) orelse return c.VK_ERROR_EXTENSION_NOT_PRESENT;
    return func(instance, pCreateInfo, pAllocator, pCallback);
}

/// caller must free returned memory
fn getRequiredExtensions(allocator: *Allocator) ![][*]const u8 {
    var glfwExtensionCount: u32 = 0;
    var glfwExtensions: [*]const [*]const u8 = c.glfwGetRequiredInstanceExtensions(&glfwExtensionCount);

    var extensions = std.ArrayList([*]const u8).init(allocator);
    errdefer extensions.deinit();

    try extensions.appendSlice(glfwExtensions[0..glfwExtensionCount]);

    if (enableValidationLayers) {
        try extensions.append(c.VK_EXT_DEBUG_REPORT_EXTENSION_NAME);
    }

    return extensions.toOwnedSlice();
}

fn drawFrame() !void {
    try checkSuccess(c.vkWaitForFences(global_device, 1, @as(*[1]c.VkFence, &inFlightFences[currentFrame]), c.VK_TRUE, maxInt(u64)));
    try checkSuccess(c.vkResetFences(global_device, 1, @as(*[1]c.VkFence, &inFlightFences[currentFrame])));

    var imageIndex: u32 = undefined;
    try checkSuccess(c.vkAcquireNextImageKHR(global_device, swapChain, maxInt(u64), imageAvailableSemaphores[currentFrame], null, &imageIndex));

    var waitSemaphores = [_]c.VkSemaphore{imageAvailableSemaphores[currentFrame]};
    var waitStages = [_]c.VkPipelineStageFlags{c.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT};

    const signalSemaphores = [_]c.VkSemaphore{renderFinishedSemaphores[currentFrame]};

    var submitInfo = [_]c.VkSubmitInfo{c.VkSubmitInfo{
        .sType = c.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .waitSemaphoreCount = 1,
        .pWaitSemaphores = &waitSemaphores,
        .pWaitDstStageMask = &waitStages,
        .commandBufferCount = 1,
        .pCommandBuffers = commandBuffers.ptr + imageIndex,
        .signalSemaphoreCount = 1,
        .pSignalSemaphores = &signalSemaphores,

        .pNext = null,
    }};

    try checkSuccess(c.vkQueueSubmit(graphicsQueue, 1, &submitInfo, inFlightFences[currentFrame]));

    const swapChains = [_]c.VkSwapchainKHR{swapChain};
    const presentInfo = c.VkPresentInfoKHR{
        .sType = c.VK_STRUCTURE_TYPE_PRESENT_INFO_KHR,

        .waitSemaphoreCount = 1,
        .pWaitSemaphores = &signalSemaphores,

        .swapchainCount = 1,
        .pSwapchains = &swapChains,

        .pImageIndices = @ptrCast(*[1]u32, &imageIndex),

        .pNext = null,
        .pResults = null,
    };

    try checkSuccess(c.vkQueuePresentKHR(presentQueue, &presentInfo));

    currentFrame = (currentFrame + 1) % MAX_FRAMES_IN_FLIGHT;
}

fn hash_cstr(a: [*:0]const u8) u64 {
    // FNV 32-bit hash
    var h: u32 = 2166136261;
    var i: usize = 0;
    while (a[i] != 0) : (i += 1) {
        h ^= a[i];
        h *%= 16777619;
    }
    return h;
}

fn eql_cstr(a: [*:0]const u8, b: [*:0]const u8) bool {
    return std.cstr.cmp(a, b) == 0;
}
