pub const X_PROTOCOL = 11;
pub const X_PROTOCOL_REVISION = 0;
pub const xcb_setup_request_t = extern struct {
    byte_order: u8,
    pad0: u8,
    protocol_major_version: u16,
    protocol_minor_version: u16,
    authorization_protocol_name_len: u16,
    authorization_protocol_data_len: u16,
    pad1: [2]u8,
};
