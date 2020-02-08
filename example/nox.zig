const std = @import("std");
const window = @import("window");

pub const io_mode = .evented;

pub fn main() anyerror!void {
    const conn = try window.openDefaultDisplay(std.heap.page_allocator);
    switch (conn.status) {
        .Ok => {},
        else => {
            std.debug.warn("unable to open default display: {}\n", .{conn.setup});
            std.process.exit(1);
        },
    }
    std.debug.warn("OK\n", .{});
}
