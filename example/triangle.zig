const std = @import("std");
const math = std.math;
const X = @import("../src/x11.zig");
const cstr = std.cstr;
const assert = std.debug.assert;

pub fn main() !void {
    const size_hints = X.AllocSizeHints() ?? return error.OutOfMemory;
    const wm_hints = X.AllocWMHints() ?? return error.OutOfMemory;
    const class_hints = X.AllocClassHint() ?? return error.OutOfMemory;
    const display = X.OpenDisplay(null) ?? return error.OutOfMemory;
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

    _ = X.SelectInput(
        display,
        win,
        X.ExposureMask | X.KeyPressMask | X.ButtonPressMask | X.StructureNotifyMask,
    );

    const font_info = X.LoadQueryFont(display, c"9x15") ?? return error.OutOfMemory;
    defer assert(X.UnloadFont(display, font_info.fid) == 0);

    var values: X.GCValues = undefined;
    const gc = X.CreateGC(display, win, 0, &values);
    defer assert(X.FreeGC(display, gc) == 0);

    _ = X.SetFont(display, gc, font_info.fid);
    _ = X.SetForeground(display, gc, X.BlackPixel(display, screen_num));

    _ = X.MapWindow(display, win);

    while (true) {
        const message = c"Hello, X Window System!";

        var report: X.Event = undefined;
        assert(X.NextEvent(display, &report) == 0);

        switch (report.@"type") {
            X.Expose => {
                if (report.xexpose.count != 0)
                    continue;

                const length = u32(X.TextWidth(font_info, message, c_int(cstr.len(message))));
                const msg_x = (width - length) / 2;

                const font_height = u32(font_info.ascent) + u32(font_info.descent);
                const msg_y = (height + font_height) / 2;

                assert(X.DrawString(
                    display,
                    win,
                    gc,
                    c_int(msg_x),
                    c_int(msg_y),
                    message,
                    c_int(cstr.len(message)),
                ) == 0);
            },
            X.ConfigureNotify => {
                width = u32(report.xconfigure.width);
                height = u32(report.xconfigure.height);
            },
            X.ButtonPress, X.KeyPress => {
                return;
            },
            else => {},
        }
    }
}
