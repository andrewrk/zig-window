# zig-window

## What it will be

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

## What it is now

It's just some zig code that uses the X11-lib API and makes a hello world window.
