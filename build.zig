const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const nox_exe = b.addExecutable("nox", "example/nox.zig");
    nox_exe.addPackagePath("window", "src/main.zig");
    nox_exe.setBuildMode(mode);
    nox_exe.install();
    const run_nox_cmd = nox_exe.run();
    const run_nox_step = b.step("example-nox", "Run the example app that doesn't link X11 C library");
    run_nox_step.dependOn(&run_nox_cmd.step);

    const vulkan_loader = b.addStaticLibrary("vulkan", null);
    vulkan_loader.setTarget(target);
    vulkan_loader.force_pic = true;
    vulkan_loader.addIncludeDir("src/vulkan-loader/include");
    vulkan_loader.addIncludeDir("src");
    vulkan_loader.defineCMacro("API_NAME=Vulkan");
    vulkan_loader.defineCMacro("FALLBACK_CONFIG_DIRS=\"/etc/xdg\"");
    vulkan_loader.defineCMacro("FALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\"");
    vulkan_loader.defineCMacro("VK_USE_PLATFORM_XCB_KHR");
    // TODO patch vulkan-loader to make this configurable at runtime
    vulkan_loader.defineCMacro("SYSCONFDIR=\"/run/opengl-driver/share/\"");

    const cflags = [_][]const u8{"-std=c11"};
    const c_files = [_][]const u8{
        "src/vulkan-loader/cJSON.c",
        "src/vulkan-loader/debug_utils.c",
        "src/vulkan-loader/dev_ext_trampoline.c",
        "src/vulkan-loader/extension_manual.c",
        "src/vulkan-loader/loader.c",
        "src/vulkan-loader/murmurhash.c",
        "src/vulkan-loader/phys_dev_ext.c",
        "src/vulkan-loader/trampoline.c",
        "src/vulkan-loader/unknown_ext_chain.c",
        "src/vulkan-loader/wsi.c",
    };
    for (c_files) |c_file| {
        vulkan_loader.addCSourceFile(c_file, &cflags);
    }

    // a dummy .so file that we can link "static-window" against to trick the linker
    // into making a valid ELF executable that can be loaded with ld
    const dummy_so = b.addSharedLibrary("dummy", "src/dummy.zig", b.version(0, 0, 0));
    dummy_so.setBuildMode(mode);
    dummy_so.setTarget(target);
    dummy_so.install();

    const static_window_exe = b.addExecutable("static-window", "src/static-window.zig");
    // Uncommenting this is a hack that makes the window show up even before we've
    // worked out the PIE problems.
    //static_window_exe.linkLibC();
    // setting pie to true is causing a segfault somewhere in the call to NativeTargetInfo.detect(...)
    // commented out for now, not sure if we even need this
    //static_window_exe.pie = true;
    static_window_exe.setTarget(target);
    static_window_exe.setBuildMode(mode);
    static_window_exe.install();
    static_window_exe.linkLibrary(vulkan_loader);
    static_window_exe.linkLibrary(dummy_so);
}
