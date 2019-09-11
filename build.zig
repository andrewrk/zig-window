const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const nox_exe = b.addExecutable("nox", "example/nox.zig");
    nox_exe.addPackagePath("window", "src/main.zig");
    nox_exe.setBuildMode(mode);
    nox_exe.install();
    const run_nox_cmd = nox_exe.run();
    const run_nox_step = b.step("example-nox", "Run the example app that doesn't link X11 C library");
    run_nox_step.dependOn(&run_nox_cmd.step);

    const minimal_exe = b.addExecutable("minimal", "example/minimal.zig");
    minimal_exe.addPackagePath("x11", "src/x11.zig");
    minimal_exe.linkSystemLibrary("X11");
    minimal_exe.linkSystemLibrary("c");
    minimal_exe.setBuildMode(mode);
    const run_minimal_cmd = minimal_exe.run();
    const run_minimal_step = b.step("example-minimal", "Run the minimal example app");
    run_minimal_step.dependOn(&run_minimal_cmd.step);
}
