const std = @import("std");
const window = @import("window");

var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};

pub fn main() anyerror!void {
    const gpa = &general_purpose_allocator.allocator;
    defer _ = general_purpose_allocator.deinit();

    var conn = try window.openDefaultDisplay(gpa);
    switch (conn.status) {
        .Ok => {},
        else => {
            std.debug.warn("unable to open default display: {}\n", .{conn.setup});
            std.process.exit(1);
        },
    }
    defer conn.close();

    std.debug.warn("OK\n", .{});
}
