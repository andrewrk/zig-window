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
    vulkan_loader.pie = true;
    vulkan_loader.addIncludeDir("src/vulkan-loader/include");
    vulkan_loader.addIncludeDir("src");
    vulkan_loader.defineCMacro("API_NAME=Vulkan");
    vulkan_loader.defineCMacro("FALLBACK_CONFIG_DIRS=\"/etc/xdg\"");
    vulkan_loader.defineCMacro("FALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\"");
    vulkan_loader.defineCMacro("SYSCONFDIR=\"/run/opengl-driver/share/\""); // TODO
    vulkan_loader.defineCMacro("VK_USE_PLATFORM_XCB_KHR");

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

    const static_window_exe = b.addExecutable("static-window", "src/static-window.zig");
    // Uncommenting this is a hack that makes the window show up even before we've
    // worked out the PIE problems.
    //static_window_exe.linkLibC();
    static_window_exe.pie = true;
    static_window_exe.setTarget(target);
    static_window_exe.setBuildMode(mode);
    static_window_exe.install();
    static_window_exe.linkLibrary(vulkan_loader);
}
