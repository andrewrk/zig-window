const std = @import("std");
const builtin = @import("builtin");
const mem = std.mem;
const os = std.os;
const event = std.event;
const posix = os.posix;
const assert = std.debug.assert;

use @import("xproto.zig");

pub const Display = struct {
    name: []u8,
};

pub const Connection = struct {
    fd: i32,
    setup: []u8,
    status: Status,

    pub const Status = enum {
        SetupFailed = 0,
        Ok = 1,
        Authenticate = 2,
    };
};

pub const Auth = struct {
    family: u16,
    address: []u8,
    number: []u8,
    name: []u8,
    data: []u8,
};

pub async fn openDefaultDisplay(loop: *event.Loop) !Connection {
    suspend {
        resume @handle();
    }
    const default_name = getDefaultDisplayName() orelse return error.UnknownDefaultDisplay;
    return await (async openDisplay(loop, default_name) catch unreachable);
}

pub fn getDefaultDisplayName() ?[]const u8 {
    return std.os.getEnvPosix("DISPLAY");
}

pub const OpenDisplayError = error{
    OutOfMemory,
    InvalidDisplayFormat,
    UnableToConnectToServer,
    SetupFailed,
    AuthFileUnavailable,

    // TODO get rid of some of these
    FileDescriptorAlreadyPresentInSet,
    OperationCausesCircularLoop,
    FileDescriptorNotRegistered,
    SystemResources,
    UserResourceLimitReached,
    FileDescriptorIncompatibleWithEpoll,
    Unexpected,
    Unimplemented,
    InputOutput,
    AccessDenied,
    EndOfStream,
    InvalidStatus,
};

pub async fn openDisplay(loop: *event.Loop, name: []const u8) OpenDisplayError!Connection {
    suspend {
        resume @handle();
    }
    const parsed = parseDisplay(name) catch |err| switch (err) {
        error.Overflow => return error.InvalidDisplayFormat,
        error.MissingColon => return error.InvalidDisplayFormat,
        error.MissingDisplayIndex => return error.InvalidDisplayFormat,
        error.InvalidCharacter => return error.InvalidDisplayFormat,
    };
    return try await (async connectToDisplay(loop, parsed, null) catch unreachable);
}

pub const ParsedDisplay = struct {
    host: []const u8,
    protocol: []const u8,
    display: u32,
    screen: u32,
};

pub fn parseDisplay(name: []const u8) !ParsedDisplay {
    var result = ParsedDisplay{
        .host = undefined,
        .protocol = name[0..0],
        .display = undefined,
        .screen = undefined,
    };
    const after_prot = if (mem.lastIndexOfScalar(u8, name, '/')) |slash_pos| blk: {
        result.protocol = name[0..slash_pos];
        break :blk name[slash_pos..];
    } else name;

    const colon = mem.lastIndexOfScalar(u8, after_prot, ':') orelse return error.MissingColon;
    var it = mem.split(after_prot[colon + 1 ..], ".");
    result.display = try std.fmt.parseInt(u32, it.next() orelse return error.MissingDisplayIndex, 10);
    result.screen = if (it.next()) |s| try std.fmt.parseInt(u32, s, 10) else 0;
    result.host = after_prot[0..colon];
    return result;
}

pub async fn open(loop: *event.Loop, host: []const u8, protocol: []const u8, display: u32) !i32 {
    suspend {
        resume @handle();
    }
    if (protocol.len != 0 and !mem.eql(u8, protocol, "unix")) {
        return error.UnsupportedProtocol;
    }

    var path_buf: [os.MAX_PATH_BYTES]u8 = undefined;
    const socket_path = std.fmt.bufPrint(path_buf[0..], "/tmp/.X11-unix/X{}", display) catch unreachable;

    return await (async event.net.connectUnixSocket(loop, socket_path) catch unreachable);
}

pub async fn connectToDisplay(loop: *event.Loop, parsed: ParsedDisplay, optional_auth: ?Auth) !Connection {
    suspend {
        resume @handle();
    }
    const fd = (await (async open(loop, parsed.host, parsed.protocol, parsed.display) catch unreachable)) catch return error.UnableToConnectToServer;
    errdefer os.close(fd);

    const auth = optional_auth orelse (await (async getAuth(
        loop,
        fd,
        parsed.display,
    ) catch unreachable)) catch |e| switch (e) {
        error.FileClosed => return error.AuthFileUnavailable,
        error.IsDir => return error.AuthFileUnavailable,
        error.SharingViolation => return error.AuthFileUnavailable,
        error.PathAlreadyExists => return error.AuthFileUnavailable,
        error.FileNotFound => return error.AuthFileUnavailable,
        error.PipeBusy => return error.AuthFileUnavailable,
        error.NameTooLong => return error.AuthFileUnavailable,
        error.InvalidUtf8 => return error.AuthFileUnavailable,
        error.BadPathName => return error.AuthFileUnavailable,
        error.FileTooBig => return error.AuthFileUnavailable,
        error.SymLinkLoop => return error.AuthFileUnavailable,
        error.ProcessFdQuotaExceeded => return error.AuthFileUnavailable,
        error.NoDevice => return error.AuthFileUnavailable,
        error.NoSpaceLeft => return error.AuthFileUnavailable,
        error.EndOfStream => return error.AuthFileUnavailable,
        error.InputOutput => return error.AuthFileUnavailable,
        error.NotDir => return error.AuthFileUnavailable,
        error.AccessDenied => return error.AuthFileUnavailable,
        error.HomeDirectoryNotFound => return error.AuthFileUnavailable,

        error.Unexpected => return error.Unexpected,

        error.SystemFdQuotaExceeded => return error.SystemResources,
        error.SystemResources => return error.AuthFileUnavailable,

        error.OutOfMemory => return error.OutOfMemory,
    };
    std.debug.warn("auth: {}\n", auth);
    return await (async connectToFd(loop, fd, auth) catch unreachable);
}

fn xpad(n: usize) usize {
    return @bitCast(usize, (-%@bitCast(isize, n)) & 3);
}

test "xpad" {
    assert(xpad(1) == 3);
    assert(xpad(2) == 2);
    assert(xpad(3) == 1);
    assert(xpad(4) == 0);
    assert(xpad(5) == 3);
    assert(xpad(6) == 2);
    assert(xpad(7) == 1);
    assert(xpad(8) == 0);
}

/// fd must be O_RDWR|O_NONBLOCK
pub async fn connectToFd(loop: *event.Loop, fd: i32, auth: ?Auth) !Connection {
    suspend {
        resume @handle();
    }
    var conn = Connection{
        .fd = fd,
        .setup = undefined,
        .status = undefined,
    };

    try await (async writeSetup(loop, fd, auth) catch unreachable);
    try await (async readSetup(loop, &conn) catch unreachable);

    // _xcb_ext_init(c) &&
    // _xcb_xid_init(c)
    return conn;
}

async fn readSetup(loop: *event.Loop, conn: *Connection) !void {
    suspend {
        resume @handle();
    }
    const stream = &event.net.InStream.init(loop, conn.fd).stream;

    const xcb_setup_generic_t = extern struct {
        status: u8,
        pad0: [5]u8,
        length: u16,
    };
    var header: xcb_setup_generic_t = undefined;
    try await (async stream.readStruct(xcb_setup_generic_t, &header) catch unreachable);

    conn.setup = try loop.allocator.alloc(u8, header.length * 4);
    errdefer loop.allocator.free(conn.setup);

    try await (async stream.readFull(conn.setup) catch unreachable);

    conn.status = switch (header.status) {
        0 => Connection.Status.SetupFailed,
        1 => Connection.Status.Ok,
        2 => Connection.Status.Authenticate,
        else => return error.InvalidStatus,
    };
}

async fn writeSetup(loop: *event.Loop, fd: i32, auth: ?Auth) !void {
    suspend {
        resume @handle();
    }
    const pad = [3]u8{ 0, 0, 0 };
    var parts: [6]posix.iovec_const = undefined;
    var parts_index: usize = 0;
    var setup_req = xcb_setup_request_t{
        .byte_order = if (builtin.endian == builtin.Endian.Big) 0x42 else 0x6c,
        .pad0 = 0,
        .protocol_major_version = X_PROTOCOL,
        .protocol_minor_version = X_PROTOCOL_REVISION,
        .authorization_protocol_name_len = 0,
        .authorization_protocol_data_len = 0,
        .pad1 = [2]u8{ 0, 0 },
    };
    parts[parts_index].iov_len = @sizeOf(xcb_setup_request_t);
    parts[parts_index].iov_base = @ptrCast([*]const u8, &setup_req);
    parts_index += 1;
    comptime assert(xpad(@sizeOf(xcb_setup_request_t)) == 0);

    if (auth) |a| {
        setup_req.authorization_protocol_name_len = @intCast(u16, a.name.len);
        parts[parts_index].iov_len = a.name.len;
        parts[parts_index].iov_base = a.name.ptr;
        parts_index += 1;
        parts[parts_index].iov_len = xpad(a.name.len);
        parts[parts_index].iov_base = &pad;
        parts_index += 1;

        setup_req.authorization_protocol_data_len = @intCast(u16, a.data.len);
        parts[parts_index].iov_len = a.data.len;
        parts[parts_index].iov_base = a.data.ptr;
        parts_index += 1;
        parts[parts_index].iov_len = xpad(a.data.len);
        parts[parts_index].iov_base = &pad;
        parts_index += 1;
    }

    assert(parts_index <= parts.len);

    return await (async event.net.writevPosix(loop, fd, &parts, parts_index) catch unreachable);
}

pub async fn getAuth(loop: *event.Loop, sockfd: i32, display: u32) !Auth {
    suspend {
        resume @handle();
    }
    std.debug.warn("getAuth\n");
    var xau_file_name_buf: ?[]u8 = null;
    defer if (xau_file_name_buf) |buf| loop.allocator.free(buf);

    const xau_file_name = std.os.getEnvPosix("XAUTHORITY") orelse blk: {
        const home = std.os.getEnvPosix("HOME") orelse return error.HomeDirectoryNotFound;
        const home_path = try os.path.join(loop.allocator, home, ".Xauthority");
        xau_file_name_buf = home_path; // so that it gets freed
        break :blk home_path;
    };

    std.debug.warn("opening {}\n", xau_file_name);
    const fd = try await (async event.fs.openRead(loop, xau_file_name) catch unreachable);
    std.debug.warn("opened {}\n", xau_file_name);
    var close_op = try event.fs.CloseOperation.start(loop);
    var close_op_consumed = false;
    defer if (!close_op_consumed) close_op.finish();

    const stream = &event.fs.InStream.init(loop, fd, 0).stream;

    const family = try await (async stream.readIntBe(u16) catch unreachable);
    const address = try await (async readCountedString(loop, stream) catch unreachable);
    errdefer loop.allocator.free(address);
    const number = try await (async readCountedString(loop, stream) catch unreachable);
    errdefer loop.allocator.free(number);
    const name = try await (async readCountedString(loop, stream) catch unreachable);
    errdefer loop.allocator.free(name);
    const data = try await (async readCountedString(loop, stream) catch unreachable);
    errdefer loop.allocator.free(data);

    return Auth{
        .family = family,
        .address = address,
        .number = number,
        .name = name,
        .data = data,
    };
}

async fn readCountedString(loop: *event.Loop, stream: var) ![]u8 {
    suspend {
        resume @handle();
    }
    const len = try await (async stream.readIntBe(u16) catch unreachable);
    const buf = try loop.allocator.alloc(u8, len);
    errdefer loop.allocator.free(buf);

    try await (async stream.readFull(buf) catch unreachable);
    return buf;
}
