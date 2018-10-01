const std = @import("std");
const math = std.math;
const X = @import("../src/x11.zig");
const cstr = std.cstr;
const assert = std.debug.assert;

pub fn main() !void {
    const display = X.OpenDisplay(null) orelse return error.OutOfMemory;
    defer assert(X.CloseDisplay(display) == 0);

    const screen_num = X.DefaultScreen(display);
    const display_width = try math.cast(u32, X.DisplayWidth(display, screen_num));
    const display_height = X.DisplayHeight(display, screen_num);

    const x = 0;
    const y = 0;
    var width = display_width / 3;
    var height = display_width / 3;

    const border_width = 0;

    const win = X.CreateSimpleWindow(
        display,
        X.RootWindow(display, screen_num),
        x,
        y,
        width,
        height,
        border_width,
        X.BlackPixel(display, screen_num),
        X.WhitePixel(display, screen_num),
    );

    const window_name = [1][*]const u8{c"window name"};
    var windowName: X.TextProperty = undefined;
    if (X.StringListToTextProperty(&window_name, 1, &windowName) == 0)
        return error.OutOfMemory;

    const icon_name = [1][*]const u8{c"icon name"};
    var iconName: X.TextProperty = undefined;
    if (X.StringListToTextProperty(&icon_name, 1, &iconName) == 0)
        return error.OutOfMemory;

    const size_hints = X.AllocSizeHints() orelse return error.OutOfMemory;
    const wm_hints = X.AllocWMHints() orelse return error.OutOfMemory;
    const class_hints = X.AllocClassHint() orelse return error.OutOfMemory;

    size_hints.flags = X.PPosition | X.PSize | X.PMinSize;
    size_hints.min_width = 200;
    size_hints.min_height = 200;

    wm_hints.flags = X.StateHint | X.InputHint;
    wm_hints.initial_state = X.NormalState;
    wm_hints.input = X.True;

    const appname = c"appname";
    class_hints.res_name = appname;
    class_hints.res_class = c"hellox";

    X.SetWMProperties(display, win, &windowName, &iconName, null, 0, size_hints, wm_hints, class_hints);

    _ = X.MapWindow(display, win);

    while (true) {
        const message = c"Hello, X Window System!";

        var report: X.Event = undefined;
        assert(X.NextEvent(display, &report) == 0);

        switch (report.@"type") {
            X.ConfigureNotify => {
                width = @intCast(u32, report.xconfigure.width);
                height = @intCast(u32, report.xconfigure.height);
            },
            else => {},
        }
    }
}
