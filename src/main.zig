const std = @import("std");
const rl = @import("raylib");
const ziglua = @import("ziglua");
const Lua = ziglua.Lua;

// config.zig
const WINDOW_WIDTH = 800;
const WINDOW_HEIGHT = 450;
const TARGET_FPS = 60;

// Placeholder state
const GameState = struct {};

// Small example of how to prepare the main raylib window and a Lua VM
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.print("{}", .{gpa.deinit()});

    const allocator = gpa.allocator();

    // Initialize the Lua vm
    var lua = try Lua.init(allocator);
    defer lua.deinit();

    // Add an integer to the Lua stack and retrieve it
    lua.pushInteger(42);
    std.debug.print("{}\n", .{try lua.toInteger(1)});

    rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "raylib game");
    defer rl.CloseWindow();
    rl.SetTargetFPS(TARGET_FPS);

    var game = GameState{};
    game = game;
    while (!rl.WindowShouldClose()) {
        // Update
        {
            // TODO: Add input handling and game logic
        }

        // Render
        rl.BeginDrawing();
        defer rl.EndDrawing();
        rl.ClearBackground(rl.RAYWHITE);
        // TODO: rendering
        rl.DrawText("Hello, Raylib!", 190, 200, 20, rl.LIGHTGRAY);
    }
}

test "basic game state" {
    const state = GameState{};
    _ = state;
}
