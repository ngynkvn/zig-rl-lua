// TODO: refactor since `usingnamespace` is going away
pub usingnamespace @cImport({
    @cInclude("raylib.h");
});

/// Demonstrate the successful loading of raylib bindings
/// and prints the number of declarations available in the raylib namespace.
/// This serves as a basic test to ensure the C bindings are working correctly.
pub fn main() !void {
    const std = @import("std");
    std.debug.print("success!\n", .{});
    std.debug.print("raylib has {} decls.\n", .{
        @typeInfo(@This()).@"struct".decls.len,
    });
}
