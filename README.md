# Zig + raylib + Lua

(my three favorite things atm!)

This is a very simple, barebones starter project geared towards game programming using [Zig][zig], [raylib][rl], and [Lua][lua].

Some Lua features, such as JIT compilation, still don't work.
However, the project can compile and is running on an M1 Mac with Zig version `0.14.0dev.2802+257054a14`.

There might be more work needed to make this project compile for Windows and Linux

# Getting Started

Simply `zig build run`.
The zig build system should automatically fetch our aforementioned dependencies, after compilation we'll be met with a white raylib window.

![hello world](https://github.com/user-attachments/assets/0791b0a3-16a7-4bfd-a5a2-822f6630a8b2)

# Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

# License

This project is licensed under the MIT License - see the LICENSE file for details.

# Acknowledgments

- [raylib](https://www.raylib.com/) - A simple and easy-to-use library to enjoy videogames programming
- [ziglua] - Lua bindings for Zig
- [Zig] - A general-purpose programming language and toolchain

[zig]: https://ziglang.org/
[ziglua]: https://github.com/natecraddock/ziglua

> [!NOTE]
> I *am* using personal forks for raylib and ziglua to build the dependencies. There were some small fixes
> that had to be addressed in order to be compatible with the latest master build. That can be found
> [here](https://github.com/ngynkvn/raylib) and [here](https://github.com/ngynkvn/ziglua)
