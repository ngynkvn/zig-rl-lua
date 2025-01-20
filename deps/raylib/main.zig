// TODO: refactor since `usingnamespace` is going away
pub usingnamespace @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const std = @import("std");
    std.debug.print("success!\n", .{});
    std.debug.print("raylib has {} decls.\n", .{
        @typeInfo(@This()).@"struct".decls.len,
    });
}
