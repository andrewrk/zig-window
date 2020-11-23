# zig-window

## My Vision

A window client library. It gives you an API for creating windows, possibly
fullscreen, a graphics context, and events associated with the windows, such
as mouse and keyboard input.

 * No dependency on libc or any C libraries
 * Cross platform:
   * X11
   * Windows
   * MacOS
   * Wayland
 * Graphics contexts:
   * Vulkan
   * DirectX
   * Metal
   * OpenGL

## Current Status

It's a proof-of-concept of a Vulkan "Hello World" triangle, whose binaries
are portable across different Linux distributions, even ones that have
nonstandard dynamic linkers.

"how it works" writeup is TODO.

### Building

Tested with Zig 0.7.0+c7170e4a5.

```
zig build
./zig-cache/bin/static-window
```

Right now this is segfaulting for me after it reloads with the glibc dyld and
I'm working on figuring out why. There is a line you can uncomment in build.zig
to `linkLibC()` which is a hack that makes everything work.
