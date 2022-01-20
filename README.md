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

Tested with Zig 0.7.0+479f259ea.

```
zig build -Dtarget=x86_64-linux
patchelf  --remove-needed libdummy.so.0 zig-out/bin/static-window
./zig-out/bin/static-window
```

The `-Dtarget` parameter is important if you want to put the binary up for
downloading - this makes Zig target the "baseline" CPU instead of using
the fancy cool features of your native CPU.

This should work just fine on other CPU architectures though; for example you
could change `x86_64` to `aarch64` for 64-bit ARM.

Removing the external dependency on `patchelf` is TODO.

Reported to work on these systems so far:

 * Ubuntu
 * Debian
 * NixOS
 * Arch Linux
 * clearlinux
 * glibc-based void linux
 * musl-based void linux

Please file an issue if you find that `vkcube` from your package manager works
but binaries produced by this project do not.
