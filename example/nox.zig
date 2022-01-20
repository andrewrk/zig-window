const std = @import("std");
const window = @import("window");

var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};

pub fn main() anyerror!void {
    const gpa = general_purpose_allocator.allocator();
    defer _ = general_purpose_allocator.deinit();

    var conn = try window.openDefaultDisplay(gpa);
    switch (conn.status) {
        .Ok => {},
        else => {
            std.debug.print("unable to open default display: {s}\n", .{conn.setup});
            std.process.exit(1);
        },
    }
    defer conn.close();

    std.debug.print("OK\n", .{});
}
