const std = @import("std");
const event = std.event;
const window = @import("../src/main.zig");

pub fn main() !void {
    var da = std.heap.DirectAllocator.init();
    defer da.deinit();

    const allocator = &da.allocator;

    var loop: event.Loop = undefined;
    try loop.initMultiThreaded(allocator);
    defer loop.deinit();

    const handle = try async<allocator> asyncMainCantFail(&loop);
    defer cancel handle;

    loop.run();
}

async fn asyncMainCantFail(loop: *event.Loop) void {
    suspend {
        resume @handle();
    }
    (await (async asyncMain(loop) catch unreachable)) catch unreachable;
    std.debug.warn("async main no problem\n");
}

async fn asyncMain(loop: *event.Loop) !void {
    suspend {
        resume @handle();
    }
    const conn = try await try async window.openDefaultDisplay(loop);
    switch (conn.status) {
        window.Connection.Status.Ok => {},
        else => std.debug.warn("unable to open default display: {}\n", conn.setup),
    }
}
