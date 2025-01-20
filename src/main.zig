const std = @import("std");
const rl = @import("raylib");

// config.zig
const WINDOW_WIDTH = 800;
const WINDOW_HEIGHT = 450;
const TARGET_FPS = 60;

// Placeholder state
const GameState = struct {};

pub fn main() !void {
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
