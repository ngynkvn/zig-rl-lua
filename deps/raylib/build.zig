const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const dependency = b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
    });

    const lib = dependency.artifact("raylib");
    b.installArtifact(dependency.artifact("raylib"));

    const module = b.addModule("raylib", .{
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
    });

    module.addIncludePath(lib.getEmittedIncludeTree());

    const test_build = b.addExecutable(.{
        .name = "test_exe",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
    });
    test_build.linkLibrary(lib);

    const run_test_exe = b.addRunArtifact(test_build);
    const check_step = b.step("check", "check for zls");
    check_step.dependOn(&lib.step);
    check_step.dependOn(&run_test_exe.step);
}
