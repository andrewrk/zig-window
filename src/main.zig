const std = @import("std");
const builtin = @import("builtin");
const mem = std.mem;
const os = std.os;
const fs = std.fs;
const net = std.net;
const assert = std.debug.assert;
const Allocator = std.mem.Allocator;
const File = std.fs.File;

usingnamespace @import("xproto.zig");

pub const Display = struct {
    name: []u8,
};

pub const Connection = struct {
    allocator: *Allocator,
    file: File,
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

    fn deinit(self: *Auth, allocator: *Allocator) void {
        allocator.free(self.address);
        allocator.free(self.number);
        allocator.free(self.name);
        allocator.free(self.data);
        self.* = undefined;
    }
};

pub fn openDefaultDisplay(allocator: *Allocator) !Connection {
    const default_name = getDefaultDisplayName() orelse return error.UnknownDefaultDisplay;
    return openDisplay(allocator, default_name);
}

pub fn getDefaultDisplayName() ?[]const u8 {
    return os.getenv("DISPLAY");
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

pub fn openDisplay(allocator: *Allocator, name: []const u8) OpenDisplayError!Connection {
    const parsed = parseDisplay(name) catch |err| switch (err) {
        error.Overflow => return error.InvalidDisplayFormat,
        error.MissingColon => return error.InvalidDisplayFormat,
        error.MissingDisplayIndex => return error.InvalidDisplayFormat,
        error.InvalidCharacter => return error.InvalidDisplayFormat,
    };
    return connectToDisplay(allocator, parsed, null);
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
    var it = mem.separate(after_prot[colon + 1 ..], ".");
    result.display = try std.fmt.parseInt(u32, it.next() orelse return error.MissingDisplayIndex, 10);
    result.screen = if (it.next()) |s| try std.fmt.parseInt(u32, s, 10) else 0;
    result.host = after_prot[0..colon];
    return result;
}

pub fn open(host: []const u8, protocol: []const u8, display: u32) !File {
    if (protocol.len != 0 and !mem.eql(u8, protocol, "unix")) {
        return error.UnsupportedProtocol;
    }

    var path_buf: [fs.MAX_PATH_BYTES]u8 = undefined;
    const socket_path = std.fmt.bufPrint(path_buf[0..], "/tmp/.X11-unix/X{}", display) catch unreachable;

    return net.connectUnixSocket(socket_path);
}

pub fn connectToDisplay(allocator: *Allocator, parsed: ParsedDisplay, optional_auth: ?Auth) !Connection {
    const file = open(parsed.host, parsed.protocol, parsed.display) catch return error.UnableToConnectToServer;
    errdefer file.close();

    var cleanup_auth = false;
    var auth = if (optional_auth) |a| a else blk: {
        cleanup_auth = true;
        break :blk getAuth(allocator, file, parsed.display) catch |e| switch (e) {
            error.WouldBlock => unreachable,
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
            error.OperationAborted => return error.AuthFileUnavailable,
            error.BrokenPipe => return error.AuthFileUnavailable,
            error.DeviceBusy => return error.AuthFileUnavailable,
            error.PermissionDenied => return error.AuthFileUnavailable,

            error.Unexpected => return error.Unexpected,

            error.SystemFdQuotaExceeded => return error.SystemResources,
            error.SystemResources => return error.AuthFileUnavailable,

            error.OutOfMemory => return error.OutOfMemory,
        };
    };
    defer if (cleanup_auth) auth.deinit(allocator);

    return connectToFile(allocator, file, auth);
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

/// file must be `O_RDWR`.
/// `O_NONBLOCK` may be set if `std.event.Loop.instance != null`.
pub fn connectToFile(allocator: *Allocator, file: File, auth: ?Auth) !Connection {
    var conn = Connection{
        .allocator = allocator,
        .file = file,
        .setup = undefined,
        .status = undefined,
    };

    try writeSetup(file, auth);
    try readSetup(allocator, &conn);

    return conn;
}

fn readSetup(allocator: *Allocator, conn: *Connection) !void {
    const stream = &conn.file.inStream().stream;

    const xcb_setup_generic_t = extern struct {
        status: u8,
        pad0: [5]u8,
        length: u16,
    };
    const header = try stream.readStruct(xcb_setup_generic_t);

    conn.setup = try allocator.alloc(u8, header.length * 4);
    errdefer allocator.free(conn.setup);

    try stream.readNoEof(conn.setup);

    conn.status = switch (header.status) {
        0 => Connection.Status.SetupFailed,
        1 => Connection.Status.Ok,
        2 => Connection.Status.Authenticate,
        else => return error.InvalidStatus,
    };
}

fn writeSetup(file: File, auth: ?Auth) !void {
    const pad = [3]u8{ 0, 0, 0 };
    var parts: [6]os.iovec_const = undefined;
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

    return file.writev_iovec(parts[0..parts_index]);
}

pub fn getAuth(allocator: *Allocator, sock: File, display: u32) !Auth {
    const xau_file = if (os.getenv("XAUTHORITY")) |xau_file_name| blk: {
        break :blk try fs.File.openRead(xau_file_name);
    } else blk: {
        const home = os.getenv("HOME") orelse return error.HomeDirectoryNotFound;
        var dir = try fs.Dir.open(allocator, home);
        defer dir.close();

        break :blk try dir.openRead(".Xauthority");
    };
    defer xau_file.close();

    const stream = &xau_file.inStream().stream;

    var hostname_buf: [os.HOST_NAME_MAX]u8 = undefined;
    const hostname = try os.gethostname(&hostname_buf);

    while (true) {
        var auth = blk: {
            const family = try stream.readIntBig(u16);
            const address = try readCountedString(allocator, stream);
            errdefer allocator.free(address);
            const number = try readCountedString(allocator, stream);
            errdefer allocator.free(number);
            const name = try readCountedString(allocator, stream);
            errdefer allocator.free(name);
            const data = try readCountedString(allocator, stream);
            errdefer allocator.free(data);

            break :blk Auth{
                .family = family,
                .address = address,
                .number = number,
                .name = name,
                .data = data,
            };
        };
        if (mem.eql(u8, hostname, auth.address)) {
            return auth;
        } else {
            auth.deinit(allocator);
            continue;
        }
    }

    return error.AuthNotFound;
}

fn readCountedString(allocator: *Allocator, stream: var) ![]u8 {
    const len = try stream.readIntBig(u16);
    const buf = try allocator.alloc(u8, len);
    errdefer allocator.free(buf);

    try stream.readNoEof(buf);
    return buf;
}
