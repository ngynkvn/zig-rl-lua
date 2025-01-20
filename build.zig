const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "zig-rl-lua",
        .root_module = exe_mod,
    });
    b.installArtifact(exe);
    {
        const raylib_dep = b.dependency("raylib", .{
            .target = target,
            .optimize = optimize,
        });
        const lib = raylib_dep.artifact("raylib");
        const module = raylib_dep.module("raylib");
        b.installArtifact(lib);
        exe.linkLibrary(lib);
        exe_mod.addImport("raylib", module);
    }

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });
    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);

    const check_step = b.step("check", "");
    check_step.dependOn(&exe.step);
    check_step.dependOn(test_step);

    // TODO:
    // - Asset embedding
    // - Debug/Release specific features
    // - Platform-specific configurations
}
