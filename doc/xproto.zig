pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = ?[*]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulong;
pub const register_t = c_long;
pub fn __uint16_identity(__x: __uint16_t) __uint16_t {
    return __x;
}
pub fn __uint32_identity(__x: __uint32_t) __uint32_t {
    return __x;
}
pub fn __uint64_identity(__x: __uint64_t) __uint64_t {
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: ?[*]fd_set, noalias __writefds: ?[*]fd_set, noalias __exceptfds: ?[*]fd_set, noalias __timeout: ?[*]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: ?[*]fd_set, noalias __writefds: ?[*]fd_set, noalias __exceptfds: ?[*]fd_set, noalias __timeout: ?[*]const struct_timespec, noalias __sigmask: ?[*]const __sigset_t) c_int;
pub extern fn gnu_dev_major(__dev: __dev_t) c_uint;
pub extern fn gnu_dev_minor(__dev: __dev_t) c_uint;
pub extern fn gnu_dev_makedev(__major: c_uint, __minor: c_uint) __dev_t;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: ?[*]struct___pthread_internal_list,
    __next: ?[*]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_cond_s = extern struct {
    @"": extern union {
        __wseq: c_ulonglong,
        __wseq32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    @"": extern union {
        __g1_start: c_ulonglong,
        __g1_start32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const int_least8_t = i8;
pub const int_least16_t = c_short;
pub const int_least32_t = c_int;
pub const int_least64_t = c_long;
pub const uint_least8_t = u8;
pub const uint_least16_t = c_ushort;
pub const uint_least32_t = c_uint;
pub const uint_least64_t = c_ulong;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const struct_iovec = extern struct {
    iov_base: ?*c_void,
    iov_len: usize,
};
pub extern fn readv(__fd: c_int, __iovec: ?[*]const struct_iovec, __count: c_int) isize;
pub extern fn writev(__fd: c_int, __iovec: ?[*]const struct_iovec, __count: c_int) isize;
pub extern fn preadv(__fd: c_int, __iovec: ?[*]const struct_iovec, __count: c_int, __offset: __off_t) isize;
pub extern fn pwritev(__fd: c_int, __iovec: ?[*]const struct_iovec, __count: c_int, __offset: __off_t) isize;
pub const struct_sched_param = extern struct {
    sched_priority: c_int,
};
pub const __cpu_mask = c_ulong;
pub const cpu_set_t = extern struct {
    __bits: [16]__cpu_mask,
};
pub extern fn __sched_cpucount(__setsize: usize, __setp: ?[*]const cpu_set_t) c_int;
pub extern fn __sched_cpualloc(__count: usize) ?[*]cpu_set_t;
pub extern fn __sched_cpufree(__set: ?[*]cpu_set_t) void;
pub extern fn sched_setparam(__pid: __pid_t, __param: ?[*]const struct_sched_param) c_int;
pub extern fn sched_getparam(__pid: __pid_t, __param: ?[*]struct_sched_param) c_int;
pub extern fn sched_setscheduler(__pid: __pid_t, __policy: c_int, __param: ?[*]const struct_sched_param) c_int;
pub extern fn sched_getscheduler(__pid: __pid_t) c_int;
pub extern fn sched_yield() c_int;
pub extern fn sched_get_priority_max(__algorithm: c_int) c_int;
pub extern fn sched_get_priority_min(__algorithm: c_int) c_int;
pub extern fn sched_rr_get_interval(__pid: __pid_t, __t: ?[*]struct_timespec) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int,
    tm_min: c_int,
    tm_hour: c_int,
    tm_mday: c_int,
    tm_mon: c_int,
    tm_year: c_int,
    tm_wday: c_int,
    tm_yday: c_int,
    tm_isdst: c_int,
    tm_gmtoff: c_long,
    tm_zone: ?[*]const u8,
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec,
    it_value: struct_timespec,
};
pub const struct_sigevent = @OpaqueType();
pub const struct___locale_data = @OpaqueType();
pub const struct___locale_struct = extern struct {
    __locales: [13](?*struct___locale_data),
    __ctype_b: ?[*]const c_ushort,
    __ctype_tolower: ?[*]const c_int,
    __ctype_toupper: ?[*]const c_int,
    __names: [13](?[*]const u8),
};
pub const __locale_t = ?[*]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: ?[*]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: ?[*]struct_tm) time_t;
pub extern fn strftime(noalias __s: ?[*]u8, __maxsize: usize, noalias __format: ?[*]const u8, noalias __tp: ?[*]const struct_tm) usize;
pub extern fn strftime_l(noalias __s: ?[*]u8, __maxsize: usize, noalias __format: ?[*]const u8, noalias __tp: ?[*]const struct_tm, __loc: locale_t) usize;
pub extern fn gmtime(__timer: ?[*]const time_t) ?[*]struct_tm;
pub extern fn localtime(__timer: ?[*]const time_t) ?[*]struct_tm;
pub extern fn gmtime_r(noalias __timer: ?[*]const time_t, noalias __tp: ?[*]struct_tm) ?[*]struct_tm;
pub extern fn localtime_r(noalias __timer: ?[*]const time_t, noalias __tp: ?[*]struct_tm) ?[*]struct_tm;
pub extern fn asctime(__tp: ?[*]const struct_tm) ?[*]u8;
pub extern fn ctime(__timer: ?[*]const time_t) ?[*]u8;
pub extern fn asctime_r(noalias __tp: ?[*]const struct_tm, noalias __buf: ?[*]u8) ?[*]u8;
pub extern fn ctime_r(noalias __timer: ?[*]const time_t, noalias __buf: ?[*]u8) ?[*]u8;
pub extern var __tzname: [2](?[*]u8);
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2](?[*]u8);
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn stime(__when: ?[*]const time_t) c_int;
pub extern fn timegm(__tp: ?[*]struct_tm) time_t;
pub extern fn timelocal(__tp: ?[*]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: ?[*]const struct_timespec, __remaining: ?[*]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: ?[*]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: ?[*]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: ?[*]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: ?[*]const struct_timespec, __rem: ?[*]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: ?[*]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: ?*struct_sigevent, noalias __timerid: ?[*]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: ?[*]const struct_itimerspec, noalias __ovalue: ?[*]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: ?[*]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: ?[*]struct_timespec, __base: c_int) c_int;
pub const __jmp_buf = [8]c_long;
pub const PTHREAD_CREATE_JOINABLE = 0;
pub const PTHREAD_CREATE_DETACHED = 1;
pub const PTHREAD_MUTEX_TIMED_NP = 0;
pub const PTHREAD_MUTEX_RECURSIVE_NP = 1;
pub const PTHREAD_MUTEX_ERRORCHECK_NP = 2;
pub const PTHREAD_MUTEX_ADAPTIVE_NP = 3;
pub const PTHREAD_MUTEX_NORMAL = 0;
pub const PTHREAD_MUTEX_RECURSIVE = 1;
pub const PTHREAD_MUTEX_ERRORCHECK = 2;
pub const PTHREAD_MUTEX_DEFAULT = 0;
pub const PTHREAD_MUTEX_STALLED = 0;
pub const PTHREAD_MUTEX_STALLED_NP = 0;
pub const PTHREAD_MUTEX_ROBUST = 1;
pub const PTHREAD_MUTEX_ROBUST_NP = 1;
pub const PTHREAD_PRIO_NONE = 0;
pub const PTHREAD_PRIO_INHERIT = 1;
pub const PTHREAD_PRIO_PROTECT = 2;
pub const PTHREAD_RWLOCK_PREFER_READER_NP = 0;
pub const PTHREAD_RWLOCK_PREFER_WRITER_NP = 1;
pub const PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = 2;
pub const PTHREAD_RWLOCK_DEFAULT_NP = 0;
pub const PTHREAD_INHERIT_SCHED = 0;
pub const PTHREAD_EXPLICIT_SCHED = 1;
pub const PTHREAD_SCOPE_SYSTEM = 0;
pub const PTHREAD_SCOPE_PROCESS = 1;
pub const PTHREAD_PROCESS_PRIVATE = 0;
pub const PTHREAD_PROCESS_SHARED = 1;
pub const struct__pthread_cleanup_buffer = extern struct {
    __routine: ?extern fn(?*c_void) void,
    __arg: ?*c_void,
    __canceltype: c_int,
    __prev: ?[*]struct__pthread_cleanup_buffer,
};
pub const PTHREAD_CANCEL_ENABLE = 0;
pub const PTHREAD_CANCEL_DISABLE = 1;
pub const PTHREAD_CANCEL_DEFERRED = 0;
pub const PTHREAD_CANCEL_ASYNCHRONOUS = 1;
pub extern fn pthread_create(noalias __newthread: ?[*]pthread_t, noalias __attr: ?[*]const pthread_attr_t, __start_routine: ?extern fn(?*c_void) ?*c_void, noalias __arg: ?*c_void) c_int;
pub extern fn pthread_exit(__retval: ?*c_void) noreturn;
pub extern fn pthread_join(__th: pthread_t, __thread_return: ?[*](?*c_void)) c_int;
pub extern fn pthread_detach(__th: pthread_t) c_int;
pub extern fn pthread_self() pthread_t;
pub extern fn pthread_equal(__thread1: pthread_t, __thread2: pthread_t) c_int;
pub extern fn pthread_attr_init(__attr: ?[*]pthread_attr_t) c_int;
pub extern fn pthread_attr_destroy(__attr: ?[*]pthread_attr_t) c_int;
pub extern fn pthread_attr_getdetachstate(__attr: ?[*]const pthread_attr_t, __detachstate: ?[*]c_int) c_int;
pub extern fn pthread_attr_setdetachstate(__attr: ?[*]pthread_attr_t, __detachstate: c_int) c_int;
pub extern fn pthread_attr_getguardsize(__attr: ?[*]const pthread_attr_t, __guardsize: ?[*]usize) c_int;
pub extern fn pthread_attr_setguardsize(__attr: ?[*]pthread_attr_t, __guardsize: usize) c_int;
pub extern fn pthread_attr_getschedparam(noalias __attr: ?[*]const pthread_attr_t, noalias __param: ?[*]struct_sched_param) c_int;
pub extern fn pthread_attr_setschedparam(noalias __attr: ?[*]pthread_attr_t, noalias __param: ?[*]const struct_sched_param) c_int;
pub extern fn pthread_attr_getschedpolicy(noalias __attr: ?[*]const pthread_attr_t, noalias __policy: ?[*]c_int) c_int;
pub extern fn pthread_attr_setschedpolicy(__attr: ?[*]pthread_attr_t, __policy: c_int) c_int;
pub extern fn pthread_attr_getinheritsched(noalias __attr: ?[*]const pthread_attr_t, noalias __inherit: ?[*]c_int) c_int;
pub extern fn pthread_attr_setinheritsched(__attr: ?[*]pthread_attr_t, __inherit: c_int) c_int;
pub extern fn pthread_attr_getscope(noalias __attr: ?[*]const pthread_attr_t, noalias __scope: ?[*]c_int) c_int;
pub extern fn pthread_attr_setscope(__attr: ?[*]pthread_attr_t, __scope: c_int) c_int;
pub extern fn pthread_attr_getstackaddr(noalias __attr: ?[*]const pthread_attr_t, noalias __stackaddr: ?[*](?*c_void)) c_int;
pub extern fn pthread_attr_setstackaddr(__attr: ?[*]pthread_attr_t, __stackaddr: ?*c_void) c_int;
pub extern fn pthread_attr_getstacksize(noalias __attr: ?[*]const pthread_attr_t, noalias __stacksize: ?[*]usize) c_int;
pub extern fn pthread_attr_setstacksize(__attr: ?[*]pthread_attr_t, __stacksize: usize) c_int;
pub extern fn pthread_attr_getstack(noalias __attr: ?[*]const pthread_attr_t, noalias __stackaddr: ?[*](?*c_void), noalias __stacksize: ?[*]usize) c_int;
pub extern fn pthread_attr_setstack(__attr: ?[*]pthread_attr_t, __stackaddr: ?*c_void, __stacksize: usize) c_int;
pub extern fn pthread_setschedparam(__target_thread: pthread_t, __policy: c_int, __param: ?[*]const struct_sched_param) c_int;
pub extern fn pthread_getschedparam(__target_thread: pthread_t, noalias __policy: ?[*]c_int, noalias __param: ?[*]struct_sched_param) c_int;
pub extern fn pthread_setschedprio(__target_thread: pthread_t, __prio: c_int) c_int;
pub extern fn pthread_once(__once_control: ?[*]pthread_once_t, __init_routine: ?extern fn() void) c_int;
pub extern fn pthread_setcancelstate(__state: c_int, __oldstate: ?[*]c_int) c_int;
pub extern fn pthread_setcanceltype(__type: c_int, __oldtype: ?[*]c_int) c_int;
pub extern fn pthread_cancel(__th: pthread_t) c_int;
pub extern fn pthread_testcancel() void;
pub const __pthread_unwind_buf_t = extern struct {
    __cancel_jmp_buf: [1]extern struct {
        __cancel_jmp_buf: __jmp_buf,
        __mask_was_saved: c_int,
    },
    __pad: [4](?*c_void),
};
pub const struct___pthread_cleanup_frame = extern struct {
    __cancel_routine: ?extern fn(?*c_void) void,
    __cancel_arg: ?*c_void,
    __do_it: c_int,
    __cancel_type: c_int,
};
pub extern fn __pthread_register_cancel(__buf: ?[*]__pthread_unwind_buf_t) void;
pub extern fn __pthread_unregister_cancel(__buf: ?[*]__pthread_unwind_buf_t) void;
pub extern fn __pthread_unwind_next(__buf: ?[*]__pthread_unwind_buf_t) noreturn;
pub const struct___jmp_buf_tag = @OpaqueType();
pub extern fn __sigsetjmp(__env: ?*struct___jmp_buf_tag, __savemask: c_int) c_int;
pub extern fn pthread_mutex_init(__mutex: ?[*]pthread_mutex_t, __mutexattr: ?[*]const pthread_mutexattr_t) c_int;
pub extern fn pthread_mutex_destroy(__mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_trylock(__mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_lock(__mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_timedlock(noalias __mutex: ?[*]pthread_mutex_t, noalias __abstime: ?[*]const struct_timespec) c_int;
pub extern fn pthread_mutex_unlock(__mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_getprioceiling(noalias __mutex: ?[*]const pthread_mutex_t, noalias __prioceiling: ?[*]c_int) c_int;
pub extern fn pthread_mutex_setprioceiling(noalias __mutex: ?[*]pthread_mutex_t, __prioceiling: c_int, noalias __old_ceiling: ?[*]c_int) c_int;
pub extern fn pthread_mutex_consistent(__mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_mutexattr_init(__attr: ?[*]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_destroy(__attr: ?[*]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_getpshared(noalias __attr: ?[*]const pthread_mutexattr_t, noalias __pshared: ?[*]c_int) c_int;
pub extern fn pthread_mutexattr_setpshared(__attr: ?[*]pthread_mutexattr_t, __pshared: c_int) c_int;
pub extern fn pthread_mutexattr_gettype(noalias __attr: ?[*]const pthread_mutexattr_t, noalias __kind: ?[*]c_int) c_int;
pub extern fn pthread_mutexattr_settype(__attr: ?[*]pthread_mutexattr_t, __kind: c_int) c_int;
pub extern fn pthread_mutexattr_getprotocol(noalias __attr: ?[*]const pthread_mutexattr_t, noalias __protocol: ?[*]c_int) c_int;
pub extern fn pthread_mutexattr_setprotocol(__attr: ?[*]pthread_mutexattr_t, __protocol: c_int) c_int;
pub extern fn pthread_mutexattr_getprioceiling(noalias __attr: ?[*]const pthread_mutexattr_t, noalias __prioceiling: ?[*]c_int) c_int;
pub extern fn pthread_mutexattr_setprioceiling(__attr: ?[*]pthread_mutexattr_t, __prioceiling: c_int) c_int;
pub extern fn pthread_mutexattr_getrobust(__attr: ?[*]const pthread_mutexattr_t, __robustness: ?[*]c_int) c_int;
pub extern fn pthread_mutexattr_setrobust(__attr: ?[*]pthread_mutexattr_t, __robustness: c_int) c_int;
pub extern fn pthread_rwlock_init(noalias __rwlock: ?[*]pthread_rwlock_t, noalias __attr: ?[*]const pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlock_destroy(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_rdlock(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_tryrdlock(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_timedrdlock(noalias __rwlock: ?[*]pthread_rwlock_t, noalias __abstime: ?[*]const struct_timespec) c_int;
pub extern fn pthread_rwlock_wrlock(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_trywrlock(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_timedwrlock(noalias __rwlock: ?[*]pthread_rwlock_t, noalias __abstime: ?[*]const struct_timespec) c_int;
pub extern fn pthread_rwlock_unlock(__rwlock: ?[*]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlockattr_init(__attr: ?[*]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_destroy(__attr: ?[*]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_getpshared(noalias __attr: ?[*]const pthread_rwlockattr_t, noalias __pshared: ?[*]c_int) c_int;
pub extern fn pthread_rwlockattr_setpshared(__attr: ?[*]pthread_rwlockattr_t, __pshared: c_int) c_int;
pub extern fn pthread_rwlockattr_getkind_np(noalias __attr: ?[*]const pthread_rwlockattr_t, noalias __pref: ?[*]c_int) c_int;
pub extern fn pthread_rwlockattr_setkind_np(__attr: ?[*]pthread_rwlockattr_t, __pref: c_int) c_int;
pub extern fn pthread_cond_init(noalias __cond: ?[*]pthread_cond_t, noalias __cond_attr: ?[*]const pthread_condattr_t) c_int;
pub extern fn pthread_cond_destroy(__cond: ?[*]pthread_cond_t) c_int;
pub extern fn pthread_cond_signal(__cond: ?[*]pthread_cond_t) c_int;
pub extern fn pthread_cond_broadcast(__cond: ?[*]pthread_cond_t) c_int;
pub extern fn pthread_cond_wait(noalias __cond: ?[*]pthread_cond_t, noalias __mutex: ?[*]pthread_mutex_t) c_int;
pub extern fn pthread_cond_timedwait(noalias __cond: ?[*]pthread_cond_t, noalias __mutex: ?[*]pthread_mutex_t, noalias __abstime: ?[*]const struct_timespec) c_int;
pub extern fn pthread_condattr_init(__attr: ?[*]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_destroy(__attr: ?[*]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_getpshared(noalias __attr: ?[*]const pthread_condattr_t, noalias __pshared: ?[*]c_int) c_int;
pub extern fn pthread_condattr_setpshared(__attr: ?[*]pthread_condattr_t, __pshared: c_int) c_int;
pub extern fn pthread_condattr_getclock(noalias __attr: ?[*]const pthread_condattr_t, noalias __clock_id: ?[*]__clockid_t) c_int;
pub extern fn pthread_condattr_setclock(__attr: ?[*]pthread_condattr_t, __clock_id: __clockid_t) c_int;
pub extern fn pthread_spin_init(__lock: ?[*]volatile pthread_spinlock_t, __pshared: c_int) c_int;
pub extern fn pthread_spin_destroy(__lock: ?[*]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_lock(__lock: ?[*]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_trylock(__lock: ?[*]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_unlock(__lock: ?[*]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_barrier_init(noalias __barrier: ?[*]pthread_barrier_t, noalias __attr: ?[*]const pthread_barrierattr_t, __count: c_uint) c_int;
pub extern fn pthread_barrier_destroy(__barrier: ?[*]pthread_barrier_t) c_int;
pub extern fn pthread_barrier_wait(__barrier: ?[*]pthread_barrier_t) c_int;
pub extern fn pthread_barrierattr_init(__attr: ?[*]pthread_barrierattr_t) c_int;
pub extern fn pthread_barrierattr_destroy(__attr: ?[*]pthread_barrierattr_t) c_int;
pub extern fn pthread_barrierattr_getpshared(noalias __attr: ?[*]const pthread_barrierattr_t, noalias __pshared: ?[*]c_int) c_int;
pub extern fn pthread_barrierattr_setpshared(__attr: ?[*]pthread_barrierattr_t, __pshared: c_int) c_int;
pub extern fn pthread_key_create(__key: ?[*]pthread_key_t, __destr_function: ?extern fn(?*c_void) void) c_int;
pub extern fn pthread_key_delete(__key: pthread_key_t) c_int;
pub extern fn pthread_getspecific(__key: pthread_key_t) ?*c_void;
pub extern fn pthread_setspecific(__key: pthread_key_t, __pointer: ?*const c_void) c_int;
pub extern fn pthread_getcpuclockid(__thread_id: pthread_t, __clock_id: ?[*]__clockid_t) c_int;
pub extern fn pthread_atfork(__prepare: ?extern fn() void, __parent: ?extern fn() void, __child: ?extern fn() void) c_int;
pub const struct_xcb_connection_t = @OpaqueType();
pub const xcb_connection_t = struct_xcb_connection_t;
pub const xcb_generic_iterator_t = extern struct {
    data: ?*c_void,
    rem: c_int,
    index: c_int,
};
pub const xcb_generic_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
};
pub const xcb_generic_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    pad: [7]u32,
    full_sequence: u32,
};
pub const xcb_ge_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    event_type: u16,
    pad1: u16,
    pad: [5]u32,
    full_sequence: u32,
};
pub const xcb_generic_error_t = extern struct {
    response_type: u8,
    error_code: u8,
    sequence: u16,
    resource_id: u32,
    minor_code: u16,
    major_code: u8,
    pad0: u8,
    pad: [5]u32,
    full_sequence: u32,
};
pub const xcb_void_cookie_t = extern struct {
    sequence: c_uint,
};
pub const struct_xcb_auth_info_t = extern struct {
    namelen: c_int,
    name: ?[*]u8,
    datalen: c_int,
    data: ?[*]u8,
};
pub const xcb_auth_info_t = struct_xcb_auth_info_t;
pub extern fn xcb_flush(c: ?*xcb_connection_t) c_int;
pub extern fn xcb_get_maximum_request_length(c: ?*xcb_connection_t) u32;
pub extern fn xcb_prefetch_maximum_request_length(c: ?*xcb_connection_t) void;
pub extern fn xcb_wait_for_event(c: ?*xcb_connection_t) ?[*]xcb_generic_event_t;
pub extern fn xcb_poll_for_event(c: ?*xcb_connection_t) ?[*]xcb_generic_event_t;
pub extern fn xcb_poll_for_queued_event(c: ?*xcb_connection_t) ?[*]xcb_generic_event_t;
pub const struct_xcb_special_event = @OpaqueType();
pub const xcb_special_event_t = struct_xcb_special_event;
pub extern fn xcb_poll_for_special_event(c: ?*xcb_connection_t, se: ?*xcb_special_event_t) ?[*]xcb_generic_event_t;
pub extern fn xcb_wait_for_special_event(c: ?*xcb_connection_t, se: ?*xcb_special_event_t) ?[*]xcb_generic_event_t;
pub const struct_xcb_extension_t = @OpaqueType();
pub const xcb_extension_t = struct_xcb_extension_t;
pub extern fn xcb_register_for_special_xge(c: ?*xcb_connection_t, ext: ?*xcb_extension_t, eid: u32, stamp: ?[*]u32) ?*xcb_special_event_t;
pub extern fn xcb_unregister_for_special_event(c: ?*xcb_connection_t, se: ?*xcb_special_event_t) void;
pub extern fn xcb_request_check(c: ?*xcb_connection_t, cookie: xcb_void_cookie_t) ?[*]xcb_generic_error_t;
pub extern fn xcb_discard_reply(c: ?*xcb_connection_t, sequence: c_uint) void;
pub extern fn xcb_discard_reply64(c: ?*xcb_connection_t, sequence: u64) void;
pub const struct_xcb_query_extension_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    present: u8,
    major_opcode: u8,
    first_event: u8,
    first_error: u8,
};
pub extern fn xcb_get_extension_data(c: ?*xcb_connection_t, ext: ?*xcb_extension_t) ?[*]const struct_xcb_query_extension_reply_t;
pub extern fn xcb_prefetch_extension_data(c: ?*xcb_connection_t, ext: ?*xcb_extension_t) void;
pub const xcb_keycode_t = u8;
pub const struct_xcb_setup_t = extern struct {
    status: u8,
    pad0: u8,
    protocol_major_version: u16,
    protocol_minor_version: u16,
    length: u16,
    release_number: u32,
    resource_id_base: u32,
    resource_id_mask: u32,
    motion_buffer_size: u32,
    vendor_len: u16,
    maximum_request_length: u16,
    roots_len: u8,
    pixmap_formats_len: u8,
    image_byte_order: u8,
    bitmap_format_bit_order: u8,
    bitmap_format_scanline_unit: u8,
    bitmap_format_scanline_pad: u8,
    min_keycode: xcb_keycode_t,
    max_keycode: xcb_keycode_t,
    pad1: [4]u8,
};
pub extern fn xcb_get_setup(c: ?*xcb_connection_t) ?[*]const struct_xcb_setup_t;
pub extern fn xcb_get_file_descriptor(c: ?*xcb_connection_t) c_int;
pub extern fn xcb_connection_has_error(c: ?*xcb_connection_t) c_int;
pub extern fn xcb_connect_to_fd(fd: c_int, auth_info: ?[*]xcb_auth_info_t) ?*xcb_connection_t;
pub extern fn xcb_disconnect(c: ?*xcb_connection_t) void;
pub extern fn xcb_parse_display(name: ?[*]const u8, host: ?[*](?[*]u8), display: ?[*]c_int, screen: ?[*]c_int) c_int;
pub extern fn xcb_connect(displayname: ?[*]const u8, screenp: ?[*]c_int) ?*xcb_connection_t;
pub extern fn xcb_connect_to_display_with_auth_info(display: ?[*]const u8, auth: ?[*]xcb_auth_info_t, screen: ?[*]c_int) ?*xcb_connection_t;
pub extern fn xcb_generate_id(c: ?*xcb_connection_t) u32;
pub const struct_xcb_char2b_t = extern struct {
    byte1: u8,
    byte2: u8,
};
pub const xcb_char2b_t = struct_xcb_char2b_t;
pub const struct_xcb_char2b_iterator_t = extern struct {
    data: ?[*]xcb_char2b_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_char2b_iterator_t = struct_xcb_char2b_iterator_t;
pub const xcb_window_t = u32;
pub const struct_xcb_window_iterator_t = extern struct {
    data: ?[*]xcb_window_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_window_iterator_t = struct_xcb_window_iterator_t;
pub const xcb_pixmap_t = u32;
pub const struct_xcb_pixmap_iterator_t = extern struct {
    data: ?[*]xcb_pixmap_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_pixmap_iterator_t = struct_xcb_pixmap_iterator_t;
pub const xcb_cursor_t = u32;
pub const struct_xcb_cursor_iterator_t = extern struct {
    data: ?[*]xcb_cursor_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_cursor_iterator_t = struct_xcb_cursor_iterator_t;
pub const xcb_font_t = u32;
pub const struct_xcb_font_iterator_t = extern struct {
    data: ?[*]xcb_font_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_font_iterator_t = struct_xcb_font_iterator_t;
pub const xcb_gcontext_t = u32;
pub const struct_xcb_gcontext_iterator_t = extern struct {
    data: ?[*]xcb_gcontext_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_gcontext_iterator_t = struct_xcb_gcontext_iterator_t;
pub const xcb_colormap_t = u32;
pub const struct_xcb_colormap_iterator_t = extern struct {
    data: ?[*]xcb_colormap_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_colormap_iterator_t = struct_xcb_colormap_iterator_t;
pub const xcb_atom_t = u32;
pub const struct_xcb_atom_iterator_t = extern struct {
    data: ?[*]xcb_atom_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_atom_iterator_t = struct_xcb_atom_iterator_t;
pub const xcb_drawable_t = u32;
pub const struct_xcb_drawable_iterator_t = extern struct {
    data: ?[*]xcb_drawable_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_drawable_iterator_t = struct_xcb_drawable_iterator_t;
pub const xcb_fontable_t = u32;
pub const struct_xcb_fontable_iterator_t = extern struct {
    data: ?[*]xcb_fontable_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_fontable_iterator_t = struct_xcb_fontable_iterator_t;
pub const xcb_bool32_t = u32;
pub const struct_xcb_bool32_iterator_t = extern struct {
    data: ?[*]xcb_bool32_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_bool32_iterator_t = struct_xcb_bool32_iterator_t;
pub const xcb_visualid_t = u32;
pub const struct_xcb_visualid_iterator_t = extern struct {
    data: ?[*]xcb_visualid_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_visualid_iterator_t = struct_xcb_visualid_iterator_t;
pub const xcb_timestamp_t = u32;
pub const struct_xcb_timestamp_iterator_t = extern struct {
    data: ?[*]xcb_timestamp_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_timestamp_iterator_t = struct_xcb_timestamp_iterator_t;
pub const xcb_keysym_t = u32;
pub const struct_xcb_keysym_iterator_t = extern struct {
    data: ?[*]xcb_keysym_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_keysym_iterator_t = struct_xcb_keysym_iterator_t;
pub const struct_xcb_keycode_iterator_t = extern struct {
    data: ?[*]xcb_keycode_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_keycode_iterator_t = struct_xcb_keycode_iterator_t;
pub const xcb_keycode32_t = u32;
pub const struct_xcb_keycode32_iterator_t = extern struct {
    data: ?[*]xcb_keycode32_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_keycode32_iterator_t = struct_xcb_keycode32_iterator_t;
pub const xcb_button_t = u8;
pub const struct_xcb_button_iterator_t = extern struct {
    data: ?[*]xcb_button_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_button_iterator_t = struct_xcb_button_iterator_t;
pub const struct_xcb_point_t = extern struct {
    x: i16,
    y: i16,
};
pub const xcb_point_t = struct_xcb_point_t;
pub const struct_xcb_point_iterator_t = extern struct {
    data: ?[*]xcb_point_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_point_iterator_t = struct_xcb_point_iterator_t;
pub const struct_xcb_rectangle_t = extern struct {
    x: i16,
    y: i16,
    width: u16,
    height: u16,
};
pub const xcb_rectangle_t = struct_xcb_rectangle_t;
pub const struct_xcb_rectangle_iterator_t = extern struct {
    data: ?[*]xcb_rectangle_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_rectangle_iterator_t = struct_xcb_rectangle_iterator_t;
pub const struct_xcb_arc_t = extern struct {
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    angle1: i16,
    angle2: i16,
};
pub const xcb_arc_t = struct_xcb_arc_t;
pub const struct_xcb_arc_iterator_t = extern struct {
    data: ?[*]xcb_arc_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_arc_iterator_t = struct_xcb_arc_iterator_t;
pub const struct_xcb_format_t = extern struct {
    depth: u8,
    bits_per_pixel: u8,
    scanline_pad: u8,
    pad0: [5]u8,
};
pub const xcb_format_t = struct_xcb_format_t;
pub const struct_xcb_format_iterator_t = extern struct {
    data: ?[*]xcb_format_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_format_iterator_t = struct_xcb_format_iterator_t;
pub const XCB_VISUAL_CLASS_STATIC_GRAY = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_STATIC_GRAY;
pub const XCB_VISUAL_CLASS_GRAY_SCALE = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_GRAY_SCALE;
pub const XCB_VISUAL_CLASS_STATIC_COLOR = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_STATIC_COLOR;
pub const XCB_VISUAL_CLASS_PSEUDO_COLOR = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_PSEUDO_COLOR;
pub const XCB_VISUAL_CLASS_TRUE_COLOR = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_TRUE_COLOR;
pub const XCB_VISUAL_CLASS_DIRECT_COLOR = enum_xcb_visual_class_t.XCB_VISUAL_CLASS_DIRECT_COLOR;
pub const enum_xcb_visual_class_t = extern enum {
    XCB_VISUAL_CLASS_STATIC_GRAY = 0,
    XCB_VISUAL_CLASS_GRAY_SCALE = 1,
    XCB_VISUAL_CLASS_STATIC_COLOR = 2,
    XCB_VISUAL_CLASS_PSEUDO_COLOR = 3,
    XCB_VISUAL_CLASS_TRUE_COLOR = 4,
    XCB_VISUAL_CLASS_DIRECT_COLOR = 5,
};
pub const xcb_visual_class_t = enum_xcb_visual_class_t;
pub const struct_xcb_visualtype_t = extern struct {
    visual_id: xcb_visualid_t,
    _class: u8,
    bits_per_rgb_value: u8,
    colormap_entries: u16,
    red_mask: u32,
    green_mask: u32,
    blue_mask: u32,
    pad0: [4]u8,
};
pub const xcb_visualtype_t = struct_xcb_visualtype_t;
pub const struct_xcb_visualtype_iterator_t = extern struct {
    data: ?[*]xcb_visualtype_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_visualtype_iterator_t = struct_xcb_visualtype_iterator_t;
pub const struct_xcb_depth_t = extern struct {
    depth: u8,
    pad0: u8,
    visuals_len: u16,
    pad1: [4]u8,
};
pub const xcb_depth_t = struct_xcb_depth_t;
pub const struct_xcb_depth_iterator_t = extern struct {
    data: ?[*]xcb_depth_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_depth_iterator_t = struct_xcb_depth_iterator_t;
pub const XCB_EVENT_MASK_NO_EVENT = enum_xcb_event_mask_t.XCB_EVENT_MASK_NO_EVENT;
pub const XCB_EVENT_MASK_KEY_PRESS = enum_xcb_event_mask_t.XCB_EVENT_MASK_KEY_PRESS;
pub const XCB_EVENT_MASK_KEY_RELEASE = enum_xcb_event_mask_t.XCB_EVENT_MASK_KEY_RELEASE;
pub const XCB_EVENT_MASK_BUTTON_PRESS = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_PRESS;
pub const XCB_EVENT_MASK_BUTTON_RELEASE = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_RELEASE;
pub const XCB_EVENT_MASK_ENTER_WINDOW = enum_xcb_event_mask_t.XCB_EVENT_MASK_ENTER_WINDOW;
pub const XCB_EVENT_MASK_LEAVE_WINDOW = enum_xcb_event_mask_t.XCB_EVENT_MASK_LEAVE_WINDOW;
pub const XCB_EVENT_MASK_POINTER_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_POINTER_MOTION;
pub const XCB_EVENT_MASK_POINTER_MOTION_HINT = enum_xcb_event_mask_t.XCB_EVENT_MASK_POINTER_MOTION_HINT;
pub const XCB_EVENT_MASK_BUTTON_1_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_1_MOTION;
pub const XCB_EVENT_MASK_BUTTON_2_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_2_MOTION;
pub const XCB_EVENT_MASK_BUTTON_3_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_3_MOTION;
pub const XCB_EVENT_MASK_BUTTON_4_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_4_MOTION;
pub const XCB_EVENT_MASK_BUTTON_5_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_5_MOTION;
pub const XCB_EVENT_MASK_BUTTON_MOTION = enum_xcb_event_mask_t.XCB_EVENT_MASK_BUTTON_MOTION;
pub const XCB_EVENT_MASK_KEYMAP_STATE = enum_xcb_event_mask_t.XCB_EVENT_MASK_KEYMAP_STATE;
pub const XCB_EVENT_MASK_EXPOSURE = enum_xcb_event_mask_t.XCB_EVENT_MASK_EXPOSURE;
pub const XCB_EVENT_MASK_VISIBILITY_CHANGE = enum_xcb_event_mask_t.XCB_EVENT_MASK_VISIBILITY_CHANGE;
pub const XCB_EVENT_MASK_STRUCTURE_NOTIFY = enum_xcb_event_mask_t.XCB_EVENT_MASK_STRUCTURE_NOTIFY;
pub const XCB_EVENT_MASK_RESIZE_REDIRECT = enum_xcb_event_mask_t.XCB_EVENT_MASK_RESIZE_REDIRECT;
pub const XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = enum_xcb_event_mask_t.XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY;
pub const XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = enum_xcb_event_mask_t.XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT;
pub const XCB_EVENT_MASK_FOCUS_CHANGE = enum_xcb_event_mask_t.XCB_EVENT_MASK_FOCUS_CHANGE;
pub const XCB_EVENT_MASK_PROPERTY_CHANGE = enum_xcb_event_mask_t.XCB_EVENT_MASK_PROPERTY_CHANGE;
pub const XCB_EVENT_MASK_COLOR_MAP_CHANGE = enum_xcb_event_mask_t.XCB_EVENT_MASK_COLOR_MAP_CHANGE;
pub const XCB_EVENT_MASK_OWNER_GRAB_BUTTON = enum_xcb_event_mask_t.XCB_EVENT_MASK_OWNER_GRAB_BUTTON;
pub const enum_xcb_event_mask_t = extern enum {
    XCB_EVENT_MASK_NO_EVENT = 0,
    XCB_EVENT_MASK_KEY_PRESS = 1,
    XCB_EVENT_MASK_KEY_RELEASE = 2,
    XCB_EVENT_MASK_BUTTON_PRESS = 4,
    XCB_EVENT_MASK_BUTTON_RELEASE = 8,
    XCB_EVENT_MASK_ENTER_WINDOW = 16,
    XCB_EVENT_MASK_LEAVE_WINDOW = 32,
    XCB_EVENT_MASK_POINTER_MOTION = 64,
    XCB_EVENT_MASK_POINTER_MOTION_HINT = 128,
    XCB_EVENT_MASK_BUTTON_1_MOTION = 256,
    XCB_EVENT_MASK_BUTTON_2_MOTION = 512,
    XCB_EVENT_MASK_BUTTON_3_MOTION = 1024,
    XCB_EVENT_MASK_BUTTON_4_MOTION = 2048,
    XCB_EVENT_MASK_BUTTON_5_MOTION = 4096,
    XCB_EVENT_MASK_BUTTON_MOTION = 8192,
    XCB_EVENT_MASK_KEYMAP_STATE = 16384,
    XCB_EVENT_MASK_EXPOSURE = 32768,
    XCB_EVENT_MASK_VISIBILITY_CHANGE = 65536,
    XCB_EVENT_MASK_STRUCTURE_NOTIFY = 131072,
    XCB_EVENT_MASK_RESIZE_REDIRECT = 262144,
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288,
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576,
    XCB_EVENT_MASK_FOCUS_CHANGE = 2097152,
    XCB_EVENT_MASK_PROPERTY_CHANGE = 4194304,
    XCB_EVENT_MASK_COLOR_MAP_CHANGE = 8388608,
    XCB_EVENT_MASK_OWNER_GRAB_BUTTON = 16777216,
};
pub const xcb_event_mask_t = enum_xcb_event_mask_t;
pub const XCB_BACKING_STORE_NOT_USEFUL = enum_xcb_backing_store_t.XCB_BACKING_STORE_NOT_USEFUL;
pub const XCB_BACKING_STORE_WHEN_MAPPED = enum_xcb_backing_store_t.XCB_BACKING_STORE_WHEN_MAPPED;
pub const XCB_BACKING_STORE_ALWAYS = enum_xcb_backing_store_t.XCB_BACKING_STORE_ALWAYS;
pub const enum_xcb_backing_store_t = extern enum {
    XCB_BACKING_STORE_NOT_USEFUL = 0,
    XCB_BACKING_STORE_WHEN_MAPPED = 1,
    XCB_BACKING_STORE_ALWAYS = 2,
};
pub const xcb_backing_store_t = enum_xcb_backing_store_t;
pub const struct_xcb_screen_t = extern struct {
    root: xcb_window_t,
    default_colormap: xcb_colormap_t,
    white_pixel: u32,
    black_pixel: u32,
    current_input_masks: u32,
    width_in_pixels: u16,
    height_in_pixels: u16,
    width_in_millimeters: u16,
    height_in_millimeters: u16,
    min_installed_maps: u16,
    max_installed_maps: u16,
    root_visual: xcb_visualid_t,
    backing_stores: u8,
    save_unders: u8,
    root_depth: u8,
    allowed_depths_len: u8,
};
pub const xcb_screen_t = struct_xcb_screen_t;
pub const struct_xcb_screen_iterator_t = extern struct {
    data: ?[*]xcb_screen_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_screen_iterator_t = struct_xcb_screen_iterator_t;
pub const struct_xcb_setup_request_t = extern struct {
    byte_order: u8,
    pad0: u8,
    protocol_major_version: u16,
    protocol_minor_version: u16,
    authorization_protocol_name_len: u16,
    authorization_protocol_data_len: u16,
    pad1: [2]u8,
};
pub const xcb_setup_request_t = struct_xcb_setup_request_t;
pub const struct_xcb_setup_request_iterator_t = extern struct {
    data: ?[*]xcb_setup_request_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_setup_request_iterator_t = struct_xcb_setup_request_iterator_t;
pub const struct_xcb_setup_failed_t = extern struct {
    status: u8,
    reason_len: u8,
    protocol_major_version: u16,
    protocol_minor_version: u16,
    length: u16,
};
pub const xcb_setup_failed_t = struct_xcb_setup_failed_t;
pub const struct_xcb_setup_failed_iterator_t = extern struct {
    data: ?[*]xcb_setup_failed_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_setup_failed_iterator_t = struct_xcb_setup_failed_iterator_t;
pub const struct_xcb_setup_authenticate_t = extern struct {
    status: u8,
    pad0: [5]u8,
    length: u16,
};
pub const xcb_setup_authenticate_t = struct_xcb_setup_authenticate_t;
pub const struct_xcb_setup_authenticate_iterator_t = extern struct {
    data: ?[*]xcb_setup_authenticate_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_setup_authenticate_iterator_t = struct_xcb_setup_authenticate_iterator_t;
pub const XCB_IMAGE_ORDER_LSB_FIRST = enum_xcb_image_order_t.XCB_IMAGE_ORDER_LSB_FIRST;
pub const XCB_IMAGE_ORDER_MSB_FIRST = enum_xcb_image_order_t.XCB_IMAGE_ORDER_MSB_FIRST;
pub const enum_xcb_image_order_t = extern enum {
    XCB_IMAGE_ORDER_LSB_FIRST = 0,
    XCB_IMAGE_ORDER_MSB_FIRST = 1,
};
pub const xcb_image_order_t = enum_xcb_image_order_t;
pub const xcb_setup_t = struct_xcb_setup_t;
pub const struct_xcb_setup_iterator_t = extern struct {
    data: ?[*]xcb_setup_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_setup_iterator_t = struct_xcb_setup_iterator_t;
pub const XCB_MOD_MASK_SHIFT = enum_xcb_mod_mask_t.XCB_MOD_MASK_SHIFT;
pub const XCB_MOD_MASK_LOCK = enum_xcb_mod_mask_t.XCB_MOD_MASK_LOCK;
pub const XCB_MOD_MASK_CONTROL = enum_xcb_mod_mask_t.XCB_MOD_MASK_CONTROL;
pub const XCB_MOD_MASK_1 = enum_xcb_mod_mask_t.XCB_MOD_MASK_1;
pub const XCB_MOD_MASK_2 = enum_xcb_mod_mask_t.XCB_MOD_MASK_2;
pub const XCB_MOD_MASK_3 = enum_xcb_mod_mask_t.XCB_MOD_MASK_3;
pub const XCB_MOD_MASK_4 = enum_xcb_mod_mask_t.XCB_MOD_MASK_4;
pub const XCB_MOD_MASK_5 = enum_xcb_mod_mask_t.XCB_MOD_MASK_5;
pub const XCB_MOD_MASK_ANY = enum_xcb_mod_mask_t.XCB_MOD_MASK_ANY;
pub const enum_xcb_mod_mask_t = extern enum {
    XCB_MOD_MASK_SHIFT = 1,
    XCB_MOD_MASK_LOCK = 2,
    XCB_MOD_MASK_CONTROL = 4,
    XCB_MOD_MASK_1 = 8,
    XCB_MOD_MASK_2 = 16,
    XCB_MOD_MASK_3 = 32,
    XCB_MOD_MASK_4 = 64,
    XCB_MOD_MASK_5 = 128,
    XCB_MOD_MASK_ANY = 32768,
};
pub const xcb_mod_mask_t = enum_xcb_mod_mask_t;
pub const XCB_KEY_BUT_MASK_SHIFT = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_SHIFT;
pub const XCB_KEY_BUT_MASK_LOCK = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_LOCK;
pub const XCB_KEY_BUT_MASK_CONTROL = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_CONTROL;
pub const XCB_KEY_BUT_MASK_MOD_1 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_MOD_1;
pub const XCB_KEY_BUT_MASK_MOD_2 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_MOD_2;
pub const XCB_KEY_BUT_MASK_MOD_3 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_MOD_3;
pub const XCB_KEY_BUT_MASK_MOD_4 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_MOD_4;
pub const XCB_KEY_BUT_MASK_MOD_5 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_MOD_5;
pub const XCB_KEY_BUT_MASK_BUTTON_1 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_BUTTON_1;
pub const XCB_KEY_BUT_MASK_BUTTON_2 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_BUTTON_2;
pub const XCB_KEY_BUT_MASK_BUTTON_3 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_BUTTON_3;
pub const XCB_KEY_BUT_MASK_BUTTON_4 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_BUTTON_4;
pub const XCB_KEY_BUT_MASK_BUTTON_5 = enum_xcb_key_but_mask_t.XCB_KEY_BUT_MASK_BUTTON_5;
pub const enum_xcb_key_but_mask_t = extern enum {
    XCB_KEY_BUT_MASK_SHIFT = 1,
    XCB_KEY_BUT_MASK_LOCK = 2,
    XCB_KEY_BUT_MASK_CONTROL = 4,
    XCB_KEY_BUT_MASK_MOD_1 = 8,
    XCB_KEY_BUT_MASK_MOD_2 = 16,
    XCB_KEY_BUT_MASK_MOD_3 = 32,
    XCB_KEY_BUT_MASK_MOD_4 = 64,
    XCB_KEY_BUT_MASK_MOD_5 = 128,
    XCB_KEY_BUT_MASK_BUTTON_1 = 256,
    XCB_KEY_BUT_MASK_BUTTON_2 = 512,
    XCB_KEY_BUT_MASK_BUTTON_3 = 1024,
    XCB_KEY_BUT_MASK_BUTTON_4 = 2048,
    XCB_KEY_BUT_MASK_BUTTON_5 = 4096,
};
pub const xcb_key_but_mask_t = enum_xcb_key_but_mask_t;
pub const XCB_WINDOW_NONE = enum_xcb_window_enum_t.XCB_WINDOW_NONE;
pub const enum_xcb_window_enum_t = extern enum {
    XCB_WINDOW_NONE = 0,
};
pub const xcb_window_enum_t = enum_xcb_window_enum_t;
pub const struct_xcb_key_press_event_t = extern struct {
    response_type: u8,
    detail: xcb_keycode_t,
    sequence: u16,
    time: xcb_timestamp_t,
    root: xcb_window_t,
    event: xcb_window_t,
    child: xcb_window_t,
    root_x: i16,
    root_y: i16,
    event_x: i16,
    event_y: i16,
    state: u16,
    same_screen: u8,
    pad0: u8,
};
pub const xcb_key_press_event_t = struct_xcb_key_press_event_t;
pub const xcb_key_release_event_t = xcb_key_press_event_t;
pub const XCB_BUTTON_MASK_1 = enum_xcb_button_mask_t.XCB_BUTTON_MASK_1;
pub const XCB_BUTTON_MASK_2 = enum_xcb_button_mask_t.XCB_BUTTON_MASK_2;
pub const XCB_BUTTON_MASK_3 = enum_xcb_button_mask_t.XCB_BUTTON_MASK_3;
pub const XCB_BUTTON_MASK_4 = enum_xcb_button_mask_t.XCB_BUTTON_MASK_4;
pub const XCB_BUTTON_MASK_5 = enum_xcb_button_mask_t.XCB_BUTTON_MASK_5;
pub const XCB_BUTTON_MASK_ANY = enum_xcb_button_mask_t.XCB_BUTTON_MASK_ANY;
pub const enum_xcb_button_mask_t = extern enum {
    XCB_BUTTON_MASK_1 = 256,
    XCB_BUTTON_MASK_2 = 512,
    XCB_BUTTON_MASK_3 = 1024,
    XCB_BUTTON_MASK_4 = 2048,
    XCB_BUTTON_MASK_5 = 4096,
    XCB_BUTTON_MASK_ANY = 32768,
};
pub const xcb_button_mask_t = enum_xcb_button_mask_t;
pub const struct_xcb_button_press_event_t = extern struct {
    response_type: u8,
    detail: xcb_button_t,
    sequence: u16,
    time: xcb_timestamp_t,
    root: xcb_window_t,
    event: xcb_window_t,
    child: xcb_window_t,
    root_x: i16,
    root_y: i16,
    event_x: i16,
    event_y: i16,
    state: u16,
    same_screen: u8,
    pad0: u8,
};
pub const xcb_button_press_event_t = struct_xcb_button_press_event_t;
pub const xcb_button_release_event_t = xcb_button_press_event_t;
pub const XCB_MOTION_NORMAL = enum_xcb_motion_t.XCB_MOTION_NORMAL;
pub const XCB_MOTION_HINT = enum_xcb_motion_t.XCB_MOTION_HINT;
pub const enum_xcb_motion_t = extern enum {
    XCB_MOTION_NORMAL = 0,
    XCB_MOTION_HINT = 1,
};
pub const xcb_motion_t = enum_xcb_motion_t;
pub const struct_xcb_motion_notify_event_t = extern struct {
    response_type: u8,
    detail: u8,
    sequence: u16,
    time: xcb_timestamp_t,
    root: xcb_window_t,
    event: xcb_window_t,
    child: xcb_window_t,
    root_x: i16,
    root_y: i16,
    event_x: i16,
    event_y: i16,
    state: u16,
    same_screen: u8,
    pad0: u8,
};
pub const xcb_motion_notify_event_t = struct_xcb_motion_notify_event_t;
pub const XCB_NOTIFY_DETAIL_ANCESTOR = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_ANCESTOR;
pub const XCB_NOTIFY_DETAIL_VIRTUAL = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_VIRTUAL;
pub const XCB_NOTIFY_DETAIL_INFERIOR = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_INFERIOR;
pub const XCB_NOTIFY_DETAIL_NONLINEAR = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_NONLINEAR;
pub const XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL;
pub const XCB_NOTIFY_DETAIL_POINTER = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_POINTER;
pub const XCB_NOTIFY_DETAIL_POINTER_ROOT = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_POINTER_ROOT;
pub const XCB_NOTIFY_DETAIL_NONE = enum_xcb_notify_detail_t.XCB_NOTIFY_DETAIL_NONE;
pub const enum_xcb_notify_detail_t = extern enum {
    XCB_NOTIFY_DETAIL_ANCESTOR = 0,
    XCB_NOTIFY_DETAIL_VIRTUAL = 1,
    XCB_NOTIFY_DETAIL_INFERIOR = 2,
    XCB_NOTIFY_DETAIL_NONLINEAR = 3,
    XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4,
    XCB_NOTIFY_DETAIL_POINTER = 5,
    XCB_NOTIFY_DETAIL_POINTER_ROOT = 6,
    XCB_NOTIFY_DETAIL_NONE = 7,
};
pub const xcb_notify_detail_t = enum_xcb_notify_detail_t;
pub const XCB_NOTIFY_MODE_NORMAL = enum_xcb_notify_mode_t.XCB_NOTIFY_MODE_NORMAL;
pub const XCB_NOTIFY_MODE_GRAB = enum_xcb_notify_mode_t.XCB_NOTIFY_MODE_GRAB;
pub const XCB_NOTIFY_MODE_UNGRAB = enum_xcb_notify_mode_t.XCB_NOTIFY_MODE_UNGRAB;
pub const XCB_NOTIFY_MODE_WHILE_GRABBED = enum_xcb_notify_mode_t.XCB_NOTIFY_MODE_WHILE_GRABBED;
pub const enum_xcb_notify_mode_t = extern enum {
    XCB_NOTIFY_MODE_NORMAL = 0,
    XCB_NOTIFY_MODE_GRAB = 1,
    XCB_NOTIFY_MODE_UNGRAB = 2,
    XCB_NOTIFY_MODE_WHILE_GRABBED = 3,
};
pub const xcb_notify_mode_t = enum_xcb_notify_mode_t;
pub const struct_xcb_enter_notify_event_t = extern struct {
    response_type: u8,
    detail: u8,
    sequence: u16,
    time: xcb_timestamp_t,
    root: xcb_window_t,
    event: xcb_window_t,
    child: xcb_window_t,
    root_x: i16,
    root_y: i16,
    event_x: i16,
    event_y: i16,
    state: u16,
    mode: u8,
    same_screen_focus: u8,
};
pub const xcb_enter_notify_event_t = struct_xcb_enter_notify_event_t;
pub const xcb_leave_notify_event_t = xcb_enter_notify_event_t;
pub const struct_xcb_focus_in_event_t = extern struct {
    response_type: u8,
    detail: u8,
    sequence: u16,
    event: xcb_window_t,
    mode: u8,
    pad0: [3]u8,
};
pub const xcb_focus_in_event_t = struct_xcb_focus_in_event_t;
pub const xcb_focus_out_event_t = xcb_focus_in_event_t;
pub const struct_xcb_keymap_notify_event_t = extern struct {
    response_type: u8,
    keys: [31]u8,
};
pub const xcb_keymap_notify_event_t = struct_xcb_keymap_notify_event_t;
pub const struct_xcb_expose_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    window: xcb_window_t,
    x: u16,
    y: u16,
    width: u16,
    height: u16,
    count: u16,
    pad1: [2]u8,
};
pub const xcb_expose_event_t = struct_xcb_expose_event_t;
pub const struct_xcb_graphics_exposure_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    drawable: xcb_drawable_t,
    x: u16,
    y: u16,
    width: u16,
    height: u16,
    minor_opcode: u16,
    count: u16,
    major_opcode: u8,
    pad1: [3]u8,
};
pub const xcb_graphics_exposure_event_t = struct_xcb_graphics_exposure_event_t;
pub const struct_xcb_no_exposure_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    drawable: xcb_drawable_t,
    minor_opcode: u16,
    major_opcode: u8,
    pad1: u8,
};
pub const xcb_no_exposure_event_t = struct_xcb_no_exposure_event_t;
pub const XCB_VISIBILITY_UNOBSCURED = enum_xcb_visibility_t.XCB_VISIBILITY_UNOBSCURED;
pub const XCB_VISIBILITY_PARTIALLY_OBSCURED = enum_xcb_visibility_t.XCB_VISIBILITY_PARTIALLY_OBSCURED;
pub const XCB_VISIBILITY_FULLY_OBSCURED = enum_xcb_visibility_t.XCB_VISIBILITY_FULLY_OBSCURED;
pub const enum_xcb_visibility_t = extern enum {
    XCB_VISIBILITY_UNOBSCURED = 0,
    XCB_VISIBILITY_PARTIALLY_OBSCURED = 1,
    XCB_VISIBILITY_FULLY_OBSCURED = 2,
};
pub const xcb_visibility_t = enum_xcb_visibility_t;
pub const struct_xcb_visibility_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    window: xcb_window_t,
    state: u8,
    pad1: [3]u8,
};
pub const xcb_visibility_notify_event_t = struct_xcb_visibility_notify_event_t;
pub const struct_xcb_create_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    parent: xcb_window_t,
    window: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    border_width: u16,
    override_redirect: u8,
    pad1: u8,
};
pub const xcb_create_notify_event_t = struct_xcb_create_notify_event_t;
pub const struct_xcb_destroy_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
};
pub const xcb_destroy_notify_event_t = struct_xcb_destroy_notify_event_t;
pub const struct_xcb_unmap_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    from_configure: u8,
    pad1: [3]u8,
};
pub const xcb_unmap_notify_event_t = struct_xcb_unmap_notify_event_t;
pub const struct_xcb_map_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    override_redirect: u8,
    pad1: [3]u8,
};
pub const xcb_map_notify_event_t = struct_xcb_map_notify_event_t;
pub const struct_xcb_map_request_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    parent: xcb_window_t,
    window: xcb_window_t,
};
pub const xcb_map_request_event_t = struct_xcb_map_request_event_t;
pub const struct_xcb_reparent_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    parent: xcb_window_t,
    x: i16,
    y: i16,
    override_redirect: u8,
    pad1: [3]u8,
};
pub const xcb_reparent_notify_event_t = struct_xcb_reparent_notify_event_t;
pub const struct_xcb_configure_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    above_sibling: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    border_width: u16,
    override_redirect: u8,
    pad1: u8,
};
pub const xcb_configure_notify_event_t = struct_xcb_configure_notify_event_t;
pub const struct_xcb_configure_request_event_t = extern struct {
    response_type: u8,
    stack_mode: u8,
    sequence: u16,
    parent: xcb_window_t,
    window: xcb_window_t,
    sibling: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    border_width: u16,
    value_mask: u16,
};
pub const xcb_configure_request_event_t = struct_xcb_configure_request_event_t;
pub const struct_xcb_gravity_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    x: i16,
    y: i16,
};
pub const xcb_gravity_notify_event_t = struct_xcb_gravity_notify_event_t;
pub const struct_xcb_resize_request_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    window: xcb_window_t,
    width: u16,
    height: u16,
};
pub const xcb_resize_request_event_t = struct_xcb_resize_request_event_t;
pub const XCB_PLACE_ON_TOP = enum_xcb_place_t.XCB_PLACE_ON_TOP;
pub const XCB_PLACE_ON_BOTTOM = enum_xcb_place_t.XCB_PLACE_ON_BOTTOM;
pub const enum_xcb_place_t = extern enum {
    XCB_PLACE_ON_TOP = 0,
    XCB_PLACE_ON_BOTTOM = 1,
};
pub const xcb_place_t = enum_xcb_place_t;
pub const struct_xcb_circulate_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    event: xcb_window_t,
    window: xcb_window_t,
    pad1: [4]u8,
    place: u8,
    pad2: [3]u8,
};
pub const xcb_circulate_notify_event_t = struct_xcb_circulate_notify_event_t;
pub const xcb_circulate_request_event_t = xcb_circulate_notify_event_t;
pub const XCB_PROPERTY_NEW_VALUE = enum_xcb_property_t.XCB_PROPERTY_NEW_VALUE;
pub const XCB_PROPERTY_DELETE = enum_xcb_property_t.XCB_PROPERTY_DELETE;
pub const enum_xcb_property_t = extern enum {
    XCB_PROPERTY_NEW_VALUE = 0,
    XCB_PROPERTY_DELETE = 1,
};
pub const xcb_property_t = enum_xcb_property_t;
pub const struct_xcb_property_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    window: xcb_window_t,
    atom: xcb_atom_t,
    time: xcb_timestamp_t,
    state: u8,
    pad1: [3]u8,
};
pub const xcb_property_notify_event_t = struct_xcb_property_notify_event_t;
pub const struct_xcb_selection_clear_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    time: xcb_timestamp_t,
    owner: xcb_window_t,
    selection: xcb_atom_t,
};
pub const xcb_selection_clear_event_t = struct_xcb_selection_clear_event_t;
pub const XCB_TIME_CURRENT_TIME = enum_xcb_time_t.XCB_TIME_CURRENT_TIME;
pub const enum_xcb_time_t = extern enum {
    XCB_TIME_CURRENT_TIME = 0,
};
pub const xcb_time_t = enum_xcb_time_t;
pub const XCB_ATOM_NONE = enum_xcb_atom_enum_t.XCB_ATOM_NONE;
pub const XCB_ATOM_ANY = enum_xcb_atom_enum_t.XCB_ATOM_ANY;
pub const XCB_ATOM_PRIMARY = enum_xcb_atom_enum_t.XCB_ATOM_PRIMARY;
pub const XCB_ATOM_SECONDARY = enum_xcb_atom_enum_t.XCB_ATOM_SECONDARY;
pub const XCB_ATOM_ARC = enum_xcb_atom_enum_t.XCB_ATOM_ARC;
pub const XCB_ATOM_ATOM = enum_xcb_atom_enum_t.XCB_ATOM_ATOM;
pub const XCB_ATOM_BITMAP = enum_xcb_atom_enum_t.XCB_ATOM_BITMAP;
pub const XCB_ATOM_CARDINAL = enum_xcb_atom_enum_t.XCB_ATOM_CARDINAL;
pub const XCB_ATOM_COLORMAP = enum_xcb_atom_enum_t.XCB_ATOM_COLORMAP;
pub const XCB_ATOM_CURSOR = enum_xcb_atom_enum_t.XCB_ATOM_CURSOR;
pub const XCB_ATOM_CUT_BUFFER0 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER0;
pub const XCB_ATOM_CUT_BUFFER1 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER1;
pub const XCB_ATOM_CUT_BUFFER2 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER2;
pub const XCB_ATOM_CUT_BUFFER3 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER3;
pub const XCB_ATOM_CUT_BUFFER4 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER4;
pub const XCB_ATOM_CUT_BUFFER5 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER5;
pub const XCB_ATOM_CUT_BUFFER6 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER6;
pub const XCB_ATOM_CUT_BUFFER7 = enum_xcb_atom_enum_t.XCB_ATOM_CUT_BUFFER7;
pub const XCB_ATOM_DRAWABLE = enum_xcb_atom_enum_t.XCB_ATOM_DRAWABLE;
pub const XCB_ATOM_FONT = enum_xcb_atom_enum_t.XCB_ATOM_FONT;
pub const XCB_ATOM_INTEGER = enum_xcb_atom_enum_t.XCB_ATOM_INTEGER;
pub const XCB_ATOM_PIXMAP = enum_xcb_atom_enum_t.XCB_ATOM_PIXMAP;
pub const XCB_ATOM_POINT = enum_xcb_atom_enum_t.XCB_ATOM_POINT;
pub const XCB_ATOM_RECTANGLE = enum_xcb_atom_enum_t.XCB_ATOM_RECTANGLE;
pub const XCB_ATOM_RESOURCE_MANAGER = enum_xcb_atom_enum_t.XCB_ATOM_RESOURCE_MANAGER;
pub const XCB_ATOM_RGB_COLOR_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_COLOR_MAP;
pub const XCB_ATOM_RGB_BEST_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_BEST_MAP;
pub const XCB_ATOM_RGB_BLUE_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_BLUE_MAP;
pub const XCB_ATOM_RGB_DEFAULT_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_DEFAULT_MAP;
pub const XCB_ATOM_RGB_GRAY_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_GRAY_MAP;
pub const XCB_ATOM_RGB_GREEN_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_GREEN_MAP;
pub const XCB_ATOM_RGB_RED_MAP = enum_xcb_atom_enum_t.XCB_ATOM_RGB_RED_MAP;
pub const XCB_ATOM_STRING = enum_xcb_atom_enum_t.XCB_ATOM_STRING;
pub const XCB_ATOM_VISUALID = enum_xcb_atom_enum_t.XCB_ATOM_VISUALID;
pub const XCB_ATOM_WINDOW = enum_xcb_atom_enum_t.XCB_ATOM_WINDOW;
pub const XCB_ATOM_WM_COMMAND = enum_xcb_atom_enum_t.XCB_ATOM_WM_COMMAND;
pub const XCB_ATOM_WM_HINTS = enum_xcb_atom_enum_t.XCB_ATOM_WM_HINTS;
pub const XCB_ATOM_WM_CLIENT_MACHINE = enum_xcb_atom_enum_t.XCB_ATOM_WM_CLIENT_MACHINE;
pub const XCB_ATOM_WM_ICON_NAME = enum_xcb_atom_enum_t.XCB_ATOM_WM_ICON_NAME;
pub const XCB_ATOM_WM_ICON_SIZE = enum_xcb_atom_enum_t.XCB_ATOM_WM_ICON_SIZE;
pub const XCB_ATOM_WM_NAME = enum_xcb_atom_enum_t.XCB_ATOM_WM_NAME;
pub const XCB_ATOM_WM_NORMAL_HINTS = enum_xcb_atom_enum_t.XCB_ATOM_WM_NORMAL_HINTS;
pub const XCB_ATOM_WM_SIZE_HINTS = enum_xcb_atom_enum_t.XCB_ATOM_WM_SIZE_HINTS;
pub const XCB_ATOM_WM_ZOOM_HINTS = enum_xcb_atom_enum_t.XCB_ATOM_WM_ZOOM_HINTS;
pub const XCB_ATOM_MIN_SPACE = enum_xcb_atom_enum_t.XCB_ATOM_MIN_SPACE;
pub const XCB_ATOM_NORM_SPACE = enum_xcb_atom_enum_t.XCB_ATOM_NORM_SPACE;
pub const XCB_ATOM_MAX_SPACE = enum_xcb_atom_enum_t.XCB_ATOM_MAX_SPACE;
pub const XCB_ATOM_END_SPACE = enum_xcb_atom_enum_t.XCB_ATOM_END_SPACE;
pub const XCB_ATOM_SUPERSCRIPT_X = enum_xcb_atom_enum_t.XCB_ATOM_SUPERSCRIPT_X;
pub const XCB_ATOM_SUPERSCRIPT_Y = enum_xcb_atom_enum_t.XCB_ATOM_SUPERSCRIPT_Y;
pub const XCB_ATOM_SUBSCRIPT_X = enum_xcb_atom_enum_t.XCB_ATOM_SUBSCRIPT_X;
pub const XCB_ATOM_SUBSCRIPT_Y = enum_xcb_atom_enum_t.XCB_ATOM_SUBSCRIPT_Y;
pub const XCB_ATOM_UNDERLINE_POSITION = enum_xcb_atom_enum_t.XCB_ATOM_UNDERLINE_POSITION;
pub const XCB_ATOM_UNDERLINE_THICKNESS = enum_xcb_atom_enum_t.XCB_ATOM_UNDERLINE_THICKNESS;
pub const XCB_ATOM_STRIKEOUT_ASCENT = enum_xcb_atom_enum_t.XCB_ATOM_STRIKEOUT_ASCENT;
pub const XCB_ATOM_STRIKEOUT_DESCENT = enum_xcb_atom_enum_t.XCB_ATOM_STRIKEOUT_DESCENT;
pub const XCB_ATOM_ITALIC_ANGLE = enum_xcb_atom_enum_t.XCB_ATOM_ITALIC_ANGLE;
pub const XCB_ATOM_X_HEIGHT = enum_xcb_atom_enum_t.XCB_ATOM_X_HEIGHT;
pub const XCB_ATOM_QUAD_WIDTH = enum_xcb_atom_enum_t.XCB_ATOM_QUAD_WIDTH;
pub const XCB_ATOM_WEIGHT = enum_xcb_atom_enum_t.XCB_ATOM_WEIGHT;
pub const XCB_ATOM_POINT_SIZE = enum_xcb_atom_enum_t.XCB_ATOM_POINT_SIZE;
pub const XCB_ATOM_RESOLUTION = enum_xcb_atom_enum_t.XCB_ATOM_RESOLUTION;
pub const XCB_ATOM_COPYRIGHT = enum_xcb_atom_enum_t.XCB_ATOM_COPYRIGHT;
pub const XCB_ATOM_NOTICE = enum_xcb_atom_enum_t.XCB_ATOM_NOTICE;
pub const XCB_ATOM_FONT_NAME = enum_xcb_atom_enum_t.XCB_ATOM_FONT_NAME;
pub const XCB_ATOM_FAMILY_NAME = enum_xcb_atom_enum_t.XCB_ATOM_FAMILY_NAME;
pub const XCB_ATOM_FULL_NAME = enum_xcb_atom_enum_t.XCB_ATOM_FULL_NAME;
pub const XCB_ATOM_CAP_HEIGHT = enum_xcb_atom_enum_t.XCB_ATOM_CAP_HEIGHT;
pub const XCB_ATOM_WM_CLASS = enum_xcb_atom_enum_t.XCB_ATOM_WM_CLASS;
pub const XCB_ATOM_WM_TRANSIENT_FOR = enum_xcb_atom_enum_t.XCB_ATOM_WM_TRANSIENT_FOR;
pub const enum_xcb_atom_enum_t = extern enum {
    XCB_ATOM_NONE = 0,
    XCB_ATOM_ANY = 0,
    XCB_ATOM_PRIMARY = 1,
    XCB_ATOM_SECONDARY = 2,
    XCB_ATOM_ARC = 3,
    XCB_ATOM_ATOM = 4,
    XCB_ATOM_BITMAP = 5,
    XCB_ATOM_CARDINAL = 6,
    XCB_ATOM_COLORMAP = 7,
    XCB_ATOM_CURSOR = 8,
    XCB_ATOM_CUT_BUFFER0 = 9,
    XCB_ATOM_CUT_BUFFER1 = 10,
    XCB_ATOM_CUT_BUFFER2 = 11,
    XCB_ATOM_CUT_BUFFER3 = 12,
    XCB_ATOM_CUT_BUFFER4 = 13,
    XCB_ATOM_CUT_BUFFER5 = 14,
    XCB_ATOM_CUT_BUFFER6 = 15,
    XCB_ATOM_CUT_BUFFER7 = 16,
    XCB_ATOM_DRAWABLE = 17,
    XCB_ATOM_FONT = 18,
    XCB_ATOM_INTEGER = 19,
    XCB_ATOM_PIXMAP = 20,
    XCB_ATOM_POINT = 21,
    XCB_ATOM_RECTANGLE = 22,
    XCB_ATOM_RESOURCE_MANAGER = 23,
    XCB_ATOM_RGB_COLOR_MAP = 24,
    XCB_ATOM_RGB_BEST_MAP = 25,
    XCB_ATOM_RGB_BLUE_MAP = 26,
    XCB_ATOM_RGB_DEFAULT_MAP = 27,
    XCB_ATOM_RGB_GRAY_MAP = 28,
    XCB_ATOM_RGB_GREEN_MAP = 29,
    XCB_ATOM_RGB_RED_MAP = 30,
    XCB_ATOM_STRING = 31,
    XCB_ATOM_VISUALID = 32,
    XCB_ATOM_WINDOW = 33,
    XCB_ATOM_WM_COMMAND = 34,
    XCB_ATOM_WM_HINTS = 35,
    XCB_ATOM_WM_CLIENT_MACHINE = 36,
    XCB_ATOM_WM_ICON_NAME = 37,
    XCB_ATOM_WM_ICON_SIZE = 38,
    XCB_ATOM_WM_NAME = 39,
    XCB_ATOM_WM_NORMAL_HINTS = 40,
    XCB_ATOM_WM_SIZE_HINTS = 41,
    XCB_ATOM_WM_ZOOM_HINTS = 42,
    XCB_ATOM_MIN_SPACE = 43,
    XCB_ATOM_NORM_SPACE = 44,
    XCB_ATOM_MAX_SPACE = 45,
    XCB_ATOM_END_SPACE = 46,
    XCB_ATOM_SUPERSCRIPT_X = 47,
    XCB_ATOM_SUPERSCRIPT_Y = 48,
    XCB_ATOM_SUBSCRIPT_X = 49,
    XCB_ATOM_SUBSCRIPT_Y = 50,
    XCB_ATOM_UNDERLINE_POSITION = 51,
    XCB_ATOM_UNDERLINE_THICKNESS = 52,
    XCB_ATOM_STRIKEOUT_ASCENT = 53,
    XCB_ATOM_STRIKEOUT_DESCENT = 54,
    XCB_ATOM_ITALIC_ANGLE = 55,
    XCB_ATOM_X_HEIGHT = 56,
    XCB_ATOM_QUAD_WIDTH = 57,
    XCB_ATOM_WEIGHT = 58,
    XCB_ATOM_POINT_SIZE = 59,
    XCB_ATOM_RESOLUTION = 60,
    XCB_ATOM_COPYRIGHT = 61,
    XCB_ATOM_NOTICE = 62,
    XCB_ATOM_FONT_NAME = 63,
    XCB_ATOM_FAMILY_NAME = 64,
    XCB_ATOM_FULL_NAME = 65,
    XCB_ATOM_CAP_HEIGHT = 66,
    XCB_ATOM_WM_CLASS = 67,
    XCB_ATOM_WM_TRANSIENT_FOR = 68,
};
pub const xcb_atom_enum_t = enum_xcb_atom_enum_t;
pub const struct_xcb_selection_request_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    time: xcb_timestamp_t,
    owner: xcb_window_t,
    requestor: xcb_window_t,
    selection: xcb_atom_t,
    target: xcb_atom_t,
    property: xcb_atom_t,
};
pub const xcb_selection_request_event_t = struct_xcb_selection_request_event_t;
pub const struct_xcb_selection_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    time: xcb_timestamp_t,
    requestor: xcb_window_t,
    selection: xcb_atom_t,
    target: xcb_atom_t,
    property: xcb_atom_t,
};
pub const xcb_selection_notify_event_t = struct_xcb_selection_notify_event_t;
pub const XCB_COLORMAP_STATE_UNINSTALLED = enum_xcb_colormap_state_t.XCB_COLORMAP_STATE_UNINSTALLED;
pub const XCB_COLORMAP_STATE_INSTALLED = enum_xcb_colormap_state_t.XCB_COLORMAP_STATE_INSTALLED;
pub const enum_xcb_colormap_state_t = extern enum {
    XCB_COLORMAP_STATE_UNINSTALLED = 0,
    XCB_COLORMAP_STATE_INSTALLED = 1,
};
pub const xcb_colormap_state_t = enum_xcb_colormap_state_t;
pub const XCB_COLORMAP_NONE = enum_xcb_colormap_enum_t.XCB_COLORMAP_NONE;
pub const enum_xcb_colormap_enum_t = extern enum {
    XCB_COLORMAP_NONE = 0,
};
pub const xcb_colormap_enum_t = enum_xcb_colormap_enum_t;
pub const struct_xcb_colormap_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    window: xcb_window_t,
    colormap: xcb_colormap_t,
    _new: u8,
    state: u8,
    pad1: [2]u8,
};
pub const xcb_colormap_notify_event_t = struct_xcb_colormap_notify_event_t;
pub const union_xcb_client_message_data_t = extern union {
    data8: [20]u8,
    data16: [10]u16,
    data32: [5]u32,
};
pub const xcb_client_message_data_t = union_xcb_client_message_data_t;
pub const struct_xcb_client_message_data_iterator_t = extern struct {
    data: ?[*]xcb_client_message_data_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_client_message_data_iterator_t = struct_xcb_client_message_data_iterator_t;
pub const struct_xcb_client_message_event_t = extern struct {
    response_type: u8,
    format: u8,
    sequence: u16,
    window: xcb_window_t,
    type: xcb_atom_t,
    data: xcb_client_message_data_t,
};
pub const xcb_client_message_event_t = struct_xcb_client_message_event_t;
pub const XCB_MAPPING_MODIFIER = enum_xcb_mapping_t.XCB_MAPPING_MODIFIER;
pub const XCB_MAPPING_KEYBOARD = enum_xcb_mapping_t.XCB_MAPPING_KEYBOARD;
pub const XCB_MAPPING_POINTER = enum_xcb_mapping_t.XCB_MAPPING_POINTER;
pub const enum_xcb_mapping_t = extern enum {
    XCB_MAPPING_MODIFIER = 0,
    XCB_MAPPING_KEYBOARD = 1,
    XCB_MAPPING_POINTER = 2,
};
pub const xcb_mapping_t = enum_xcb_mapping_t;
pub const struct_xcb_mapping_notify_event_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    request: u8,
    first_keycode: xcb_keycode_t,
    count: u8,
    pad1: u8,
};
pub const xcb_mapping_notify_event_t = struct_xcb_mapping_notify_event_t;
pub const struct_xcb_ge_generic_event_t = extern struct {
    response_type: u8,
    extension: u8,
    sequence: u16,
    length: u32,
    event_type: u16,
    pad0: [22]u8,
    full_sequence: u32,
};
pub const xcb_ge_generic_event_t = struct_xcb_ge_generic_event_t;
pub const struct_xcb_request_error_t = extern struct {
    response_type: u8,
    error_code: u8,
    sequence: u16,
    bad_value: u32,
    minor_opcode: u16,
    major_opcode: u8,
    pad0: u8,
};
pub const xcb_request_error_t = struct_xcb_request_error_t;
pub const struct_xcb_value_error_t = extern struct {
    response_type: u8,
    error_code: u8,
    sequence: u16,
    bad_value: u32,
    minor_opcode: u16,
    major_opcode: u8,
    pad0: u8,
};
pub const xcb_value_error_t = struct_xcb_value_error_t;
pub const xcb_window_error_t = xcb_value_error_t;
pub const xcb_pixmap_error_t = xcb_value_error_t;
pub const xcb_atom_error_t = xcb_value_error_t;
pub const xcb_cursor_error_t = xcb_value_error_t;
pub const xcb_font_error_t = xcb_value_error_t;
pub const xcb_match_error_t = xcb_request_error_t;
pub const xcb_drawable_error_t = xcb_value_error_t;
pub const xcb_access_error_t = xcb_request_error_t;
pub const xcb_alloc_error_t = xcb_request_error_t;
pub const xcb_colormap_error_t = xcb_value_error_t;
pub const xcb_g_context_error_t = xcb_value_error_t;
pub const xcb_id_choice_error_t = xcb_value_error_t;
pub const xcb_name_error_t = xcb_request_error_t;
pub const xcb_length_error_t = xcb_request_error_t;
pub const xcb_implementation_error_t = xcb_request_error_t;
pub const XCB_WINDOW_CLASS_COPY_FROM_PARENT = enum_xcb_window_class_t.XCB_WINDOW_CLASS_COPY_FROM_PARENT;
pub const XCB_WINDOW_CLASS_INPUT_OUTPUT = enum_xcb_window_class_t.XCB_WINDOW_CLASS_INPUT_OUTPUT;
pub const XCB_WINDOW_CLASS_INPUT_ONLY = enum_xcb_window_class_t.XCB_WINDOW_CLASS_INPUT_ONLY;
pub const enum_xcb_window_class_t = extern enum {
    XCB_WINDOW_CLASS_COPY_FROM_PARENT = 0,
    XCB_WINDOW_CLASS_INPUT_OUTPUT = 1,
    XCB_WINDOW_CLASS_INPUT_ONLY = 2,
};
pub const xcb_window_class_t = enum_xcb_window_class_t;
pub const XCB_CW_BACK_PIXMAP = enum_xcb_cw_t.XCB_CW_BACK_PIXMAP;
pub const XCB_CW_BACK_PIXEL = enum_xcb_cw_t.XCB_CW_BACK_PIXEL;
pub const XCB_CW_BORDER_PIXMAP = enum_xcb_cw_t.XCB_CW_BORDER_PIXMAP;
pub const XCB_CW_BORDER_PIXEL = enum_xcb_cw_t.XCB_CW_BORDER_PIXEL;
pub const XCB_CW_BIT_GRAVITY = enum_xcb_cw_t.XCB_CW_BIT_GRAVITY;
pub const XCB_CW_WIN_GRAVITY = enum_xcb_cw_t.XCB_CW_WIN_GRAVITY;
pub const XCB_CW_BACKING_STORE = enum_xcb_cw_t.XCB_CW_BACKING_STORE;
pub const XCB_CW_BACKING_PLANES = enum_xcb_cw_t.XCB_CW_BACKING_PLANES;
pub const XCB_CW_BACKING_PIXEL = enum_xcb_cw_t.XCB_CW_BACKING_PIXEL;
pub const XCB_CW_OVERRIDE_REDIRECT = enum_xcb_cw_t.XCB_CW_OVERRIDE_REDIRECT;
pub const XCB_CW_SAVE_UNDER = enum_xcb_cw_t.XCB_CW_SAVE_UNDER;
pub const XCB_CW_EVENT_MASK = enum_xcb_cw_t.XCB_CW_EVENT_MASK;
pub const XCB_CW_DONT_PROPAGATE = enum_xcb_cw_t.XCB_CW_DONT_PROPAGATE;
pub const XCB_CW_COLORMAP = enum_xcb_cw_t.XCB_CW_COLORMAP;
pub const XCB_CW_CURSOR = enum_xcb_cw_t.XCB_CW_CURSOR;
pub const enum_xcb_cw_t = extern enum {
    XCB_CW_BACK_PIXMAP = 1,
    XCB_CW_BACK_PIXEL = 2,
    XCB_CW_BORDER_PIXMAP = 4,
    XCB_CW_BORDER_PIXEL = 8,
    XCB_CW_BIT_GRAVITY = 16,
    XCB_CW_WIN_GRAVITY = 32,
    XCB_CW_BACKING_STORE = 64,
    XCB_CW_BACKING_PLANES = 128,
    XCB_CW_BACKING_PIXEL = 256,
    XCB_CW_OVERRIDE_REDIRECT = 512,
    XCB_CW_SAVE_UNDER = 1024,
    XCB_CW_EVENT_MASK = 2048,
    XCB_CW_DONT_PROPAGATE = 4096,
    XCB_CW_COLORMAP = 8192,
    XCB_CW_CURSOR = 16384,
};
pub const xcb_cw_t = enum_xcb_cw_t;
pub const XCB_BACK_PIXMAP_NONE = enum_xcb_back_pixmap_t.XCB_BACK_PIXMAP_NONE;
pub const XCB_BACK_PIXMAP_PARENT_RELATIVE = enum_xcb_back_pixmap_t.XCB_BACK_PIXMAP_PARENT_RELATIVE;
pub const enum_xcb_back_pixmap_t = extern enum {
    XCB_BACK_PIXMAP_NONE = 0,
    XCB_BACK_PIXMAP_PARENT_RELATIVE = 1,
};
pub const xcb_back_pixmap_t = enum_xcb_back_pixmap_t;
pub const XCB_GRAVITY_BIT_FORGET = enum_xcb_gravity_t.XCB_GRAVITY_BIT_FORGET;
pub const XCB_GRAVITY_WIN_UNMAP = enum_xcb_gravity_t.XCB_GRAVITY_WIN_UNMAP;
pub const XCB_GRAVITY_NORTH_WEST = enum_xcb_gravity_t.XCB_GRAVITY_NORTH_WEST;
pub const XCB_GRAVITY_NORTH = enum_xcb_gravity_t.XCB_GRAVITY_NORTH;
pub const XCB_GRAVITY_NORTH_EAST = enum_xcb_gravity_t.XCB_GRAVITY_NORTH_EAST;
pub const XCB_GRAVITY_WEST = enum_xcb_gravity_t.XCB_GRAVITY_WEST;
pub const XCB_GRAVITY_CENTER = enum_xcb_gravity_t.XCB_GRAVITY_CENTER;
pub const XCB_GRAVITY_EAST = enum_xcb_gravity_t.XCB_GRAVITY_EAST;
pub const XCB_GRAVITY_SOUTH_WEST = enum_xcb_gravity_t.XCB_GRAVITY_SOUTH_WEST;
pub const XCB_GRAVITY_SOUTH = enum_xcb_gravity_t.XCB_GRAVITY_SOUTH;
pub const XCB_GRAVITY_SOUTH_EAST = enum_xcb_gravity_t.XCB_GRAVITY_SOUTH_EAST;
pub const XCB_GRAVITY_STATIC = enum_xcb_gravity_t.XCB_GRAVITY_STATIC;
pub const enum_xcb_gravity_t = extern enum {
    XCB_GRAVITY_BIT_FORGET = 0,
    XCB_GRAVITY_WIN_UNMAP = 0,
    XCB_GRAVITY_NORTH_WEST = 1,
    XCB_GRAVITY_NORTH = 2,
    XCB_GRAVITY_NORTH_EAST = 3,
    XCB_GRAVITY_WEST = 4,
    XCB_GRAVITY_CENTER = 5,
    XCB_GRAVITY_EAST = 6,
    XCB_GRAVITY_SOUTH_WEST = 7,
    XCB_GRAVITY_SOUTH = 8,
    XCB_GRAVITY_SOUTH_EAST = 9,
    XCB_GRAVITY_STATIC = 10,
};
pub const xcb_gravity_t = enum_xcb_gravity_t;
pub const struct_xcb_create_window_value_list_t = extern struct {
    background_pixmap: xcb_pixmap_t,
    background_pixel: u32,
    border_pixmap: xcb_pixmap_t,
    border_pixel: u32,
    bit_gravity: u32,
    win_gravity: u32,
    backing_store: u32,
    backing_planes: u32,
    backing_pixel: u32,
    override_redirect: xcb_bool32_t,
    save_under: xcb_bool32_t,
    event_mask: u32,
    do_not_propogate_mask: u32,
    colormap: xcb_colormap_t,
    cursor: xcb_cursor_t,
};
pub const xcb_create_window_value_list_t = struct_xcb_create_window_value_list_t;
pub const struct_xcb_create_window_request_t = extern struct {
    major_opcode: u8,
    depth: u8,
    length: u16,
    wid: xcb_window_t,
    parent: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    border_width: u16,
    _class: u16,
    visual: xcb_visualid_t,
    value_mask: u32,
};
pub const xcb_create_window_request_t = struct_xcb_create_window_request_t;
pub const struct_xcb_change_window_attributes_value_list_t = extern struct {
    background_pixmap: xcb_pixmap_t,
    background_pixel: u32,
    border_pixmap: xcb_pixmap_t,
    border_pixel: u32,
    bit_gravity: u32,
    win_gravity: u32,
    backing_store: u32,
    backing_planes: u32,
    backing_pixel: u32,
    override_redirect: xcb_bool32_t,
    save_under: xcb_bool32_t,
    event_mask: u32,
    do_not_propogate_mask: u32,
    colormap: xcb_colormap_t,
    cursor: xcb_cursor_t,
};
pub const xcb_change_window_attributes_value_list_t = struct_xcb_change_window_attributes_value_list_t;
pub const struct_xcb_change_window_attributes_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    value_mask: u32,
};
pub const xcb_change_window_attributes_request_t = struct_xcb_change_window_attributes_request_t;
pub const XCB_MAP_STATE_UNMAPPED = enum_xcb_map_state_t.XCB_MAP_STATE_UNMAPPED;
pub const XCB_MAP_STATE_UNVIEWABLE = enum_xcb_map_state_t.XCB_MAP_STATE_UNVIEWABLE;
pub const XCB_MAP_STATE_VIEWABLE = enum_xcb_map_state_t.XCB_MAP_STATE_VIEWABLE;
pub const enum_xcb_map_state_t = extern enum {
    XCB_MAP_STATE_UNMAPPED = 0,
    XCB_MAP_STATE_UNVIEWABLE = 1,
    XCB_MAP_STATE_VIEWABLE = 2,
};
pub const xcb_map_state_t = enum_xcb_map_state_t;
pub const struct_xcb_get_window_attributes_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_window_attributes_cookie_t = struct_xcb_get_window_attributes_cookie_t;
pub const struct_xcb_get_window_attributes_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_get_window_attributes_request_t = struct_xcb_get_window_attributes_request_t;
pub const struct_xcb_get_window_attributes_reply_t = extern struct {
    response_type: u8,
    backing_store: u8,
    sequence: u16,
    length: u32,
    visual: xcb_visualid_t,
    _class: u16,
    bit_gravity: u8,
    win_gravity: u8,
    backing_planes: u32,
    backing_pixel: u32,
    save_under: u8,
    map_is_installed: u8,
    map_state: u8,
    override_redirect: u8,
    colormap: xcb_colormap_t,
    all_event_masks: u32,
    your_event_mask: u32,
    do_not_propagate_mask: u16,
    pad0: [2]u8,
};
pub const xcb_get_window_attributes_reply_t = struct_xcb_get_window_attributes_reply_t;
pub const struct_xcb_destroy_window_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_destroy_window_request_t = struct_xcb_destroy_window_request_t;
pub const struct_xcb_destroy_subwindows_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_destroy_subwindows_request_t = struct_xcb_destroy_subwindows_request_t;
pub const XCB_SET_MODE_INSERT = enum_xcb_set_mode_t.XCB_SET_MODE_INSERT;
pub const XCB_SET_MODE_DELETE = enum_xcb_set_mode_t.XCB_SET_MODE_DELETE;
pub const enum_xcb_set_mode_t = extern enum {
    XCB_SET_MODE_INSERT = 0,
    XCB_SET_MODE_DELETE = 1,
};
pub const xcb_set_mode_t = enum_xcb_set_mode_t;
pub const struct_xcb_change_save_set_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_change_save_set_request_t = struct_xcb_change_save_set_request_t;
pub const struct_xcb_reparent_window_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    parent: xcb_window_t,
    x: i16,
    y: i16,
};
pub const xcb_reparent_window_request_t = struct_xcb_reparent_window_request_t;
pub const struct_xcb_map_window_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_map_window_request_t = struct_xcb_map_window_request_t;
pub const struct_xcb_map_subwindows_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_map_subwindows_request_t = struct_xcb_map_subwindows_request_t;
pub const struct_xcb_unmap_window_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_unmap_window_request_t = struct_xcb_unmap_window_request_t;
pub const struct_xcb_unmap_subwindows_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_unmap_subwindows_request_t = struct_xcb_unmap_subwindows_request_t;
pub const XCB_CONFIG_WINDOW_X = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_X;
pub const XCB_CONFIG_WINDOW_Y = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_Y;
pub const XCB_CONFIG_WINDOW_WIDTH = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_WIDTH;
pub const XCB_CONFIG_WINDOW_HEIGHT = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_HEIGHT;
pub const XCB_CONFIG_WINDOW_BORDER_WIDTH = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_BORDER_WIDTH;
pub const XCB_CONFIG_WINDOW_SIBLING = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_SIBLING;
pub const XCB_CONFIG_WINDOW_STACK_MODE = enum_xcb_config_window_t.XCB_CONFIG_WINDOW_STACK_MODE;
pub const enum_xcb_config_window_t = extern enum {
    XCB_CONFIG_WINDOW_X = 1,
    XCB_CONFIG_WINDOW_Y = 2,
    XCB_CONFIG_WINDOW_WIDTH = 4,
    XCB_CONFIG_WINDOW_HEIGHT = 8,
    XCB_CONFIG_WINDOW_BORDER_WIDTH = 16,
    XCB_CONFIG_WINDOW_SIBLING = 32,
    XCB_CONFIG_WINDOW_STACK_MODE = 64,
};
pub const xcb_config_window_t = enum_xcb_config_window_t;
pub const XCB_STACK_MODE_ABOVE = enum_xcb_stack_mode_t.XCB_STACK_MODE_ABOVE;
pub const XCB_STACK_MODE_BELOW = enum_xcb_stack_mode_t.XCB_STACK_MODE_BELOW;
pub const XCB_STACK_MODE_TOP_IF = enum_xcb_stack_mode_t.XCB_STACK_MODE_TOP_IF;
pub const XCB_STACK_MODE_BOTTOM_IF = enum_xcb_stack_mode_t.XCB_STACK_MODE_BOTTOM_IF;
pub const XCB_STACK_MODE_OPPOSITE = enum_xcb_stack_mode_t.XCB_STACK_MODE_OPPOSITE;
pub const enum_xcb_stack_mode_t = extern enum {
    XCB_STACK_MODE_ABOVE = 0,
    XCB_STACK_MODE_BELOW = 1,
    XCB_STACK_MODE_TOP_IF = 2,
    XCB_STACK_MODE_BOTTOM_IF = 3,
    XCB_STACK_MODE_OPPOSITE = 4,
};
pub const xcb_stack_mode_t = enum_xcb_stack_mode_t;
pub const struct_xcb_configure_window_value_list_t = extern struct {
    x: i32,
    y: i32,
    width: u32,
    height: u32,
    border_width: u32,
    sibling: xcb_window_t,
    stack_mode: u32,
};
pub const xcb_configure_window_value_list_t = struct_xcb_configure_window_value_list_t;
pub const struct_xcb_configure_window_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    value_mask: u16,
    pad1: [2]u8,
};
pub const xcb_configure_window_request_t = struct_xcb_configure_window_request_t;
pub const XCB_CIRCULATE_RAISE_LOWEST = enum_xcb_circulate_t.XCB_CIRCULATE_RAISE_LOWEST;
pub const XCB_CIRCULATE_LOWER_HIGHEST = enum_xcb_circulate_t.XCB_CIRCULATE_LOWER_HIGHEST;
pub const enum_xcb_circulate_t = extern enum {
    XCB_CIRCULATE_RAISE_LOWEST = 0,
    XCB_CIRCULATE_LOWER_HIGHEST = 1,
};
pub const xcb_circulate_t = enum_xcb_circulate_t;
pub const struct_xcb_circulate_window_request_t = extern struct {
    major_opcode: u8,
    direction: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_circulate_window_request_t = struct_xcb_circulate_window_request_t;
pub const struct_xcb_get_geometry_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_geometry_cookie_t = struct_xcb_get_geometry_cookie_t;
pub const struct_xcb_get_geometry_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
};
pub const xcb_get_geometry_request_t = struct_xcb_get_geometry_request_t;
pub const struct_xcb_get_geometry_reply_t = extern struct {
    response_type: u8,
    depth: u8,
    sequence: u16,
    length: u32,
    root: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    border_width: u16,
    pad0: [2]u8,
};
pub const xcb_get_geometry_reply_t = struct_xcb_get_geometry_reply_t;
pub const struct_xcb_query_tree_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_tree_cookie_t = struct_xcb_query_tree_cookie_t;
pub const struct_xcb_query_tree_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_query_tree_request_t = struct_xcb_query_tree_request_t;
pub const struct_xcb_query_tree_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    root: xcb_window_t,
    parent: xcb_window_t,
    children_len: u16,
    pad1: [14]u8,
};
pub const xcb_query_tree_reply_t = struct_xcb_query_tree_reply_t;
pub const struct_xcb_intern_atom_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_intern_atom_cookie_t = struct_xcb_intern_atom_cookie_t;
pub const struct_xcb_intern_atom_request_t = extern struct {
    major_opcode: u8,
    only_if_exists: u8,
    length: u16,
    name_len: u16,
    pad0: [2]u8,
};
pub const xcb_intern_atom_request_t = struct_xcb_intern_atom_request_t;
pub const struct_xcb_intern_atom_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    atom: xcb_atom_t,
};
pub const xcb_intern_atom_reply_t = struct_xcb_intern_atom_reply_t;
pub const struct_xcb_get_atom_name_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_atom_name_cookie_t = struct_xcb_get_atom_name_cookie_t;
pub const struct_xcb_get_atom_name_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    atom: xcb_atom_t,
};
pub const xcb_get_atom_name_request_t = struct_xcb_get_atom_name_request_t;
pub const struct_xcb_get_atom_name_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    name_len: u16,
    pad1: [22]u8,
};
pub const xcb_get_atom_name_reply_t = struct_xcb_get_atom_name_reply_t;
pub const XCB_PROP_MODE_REPLACE = enum_xcb_prop_mode_t.XCB_PROP_MODE_REPLACE;
pub const XCB_PROP_MODE_PREPEND = enum_xcb_prop_mode_t.XCB_PROP_MODE_PREPEND;
pub const XCB_PROP_MODE_APPEND = enum_xcb_prop_mode_t.XCB_PROP_MODE_APPEND;
pub const enum_xcb_prop_mode_t = extern enum {
    XCB_PROP_MODE_REPLACE = 0,
    XCB_PROP_MODE_PREPEND = 1,
    XCB_PROP_MODE_APPEND = 2,
};
pub const xcb_prop_mode_t = enum_xcb_prop_mode_t;
pub const struct_xcb_change_property_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
    window: xcb_window_t,
    property: xcb_atom_t,
    type: xcb_atom_t,
    format: u8,
    pad0: [3]u8,
    data_len: u32,
};
pub const xcb_change_property_request_t = struct_xcb_change_property_request_t;
pub const struct_xcb_delete_property_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    property: xcb_atom_t,
};
pub const xcb_delete_property_request_t = struct_xcb_delete_property_request_t;
pub const XCB_GET_PROPERTY_TYPE_ANY = enum_xcb_get_property_type_t.XCB_GET_PROPERTY_TYPE_ANY;
pub const enum_xcb_get_property_type_t = extern enum {
    XCB_GET_PROPERTY_TYPE_ANY = 0,
};
pub const xcb_get_property_type_t = enum_xcb_get_property_type_t;
pub const struct_xcb_get_property_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_property_cookie_t = struct_xcb_get_property_cookie_t;
pub const struct_xcb_get_property_request_t = extern struct {
    major_opcode: u8,
    _delete: u8,
    length: u16,
    window: xcb_window_t,
    property: xcb_atom_t,
    type: xcb_atom_t,
    long_offset: u32,
    long_length: u32,
};
pub const xcb_get_property_request_t = struct_xcb_get_property_request_t;
pub const struct_xcb_get_property_reply_t = extern struct {
    response_type: u8,
    format: u8,
    sequence: u16,
    length: u32,
    type: xcb_atom_t,
    bytes_after: u32,
    value_len: u32,
    pad0: [12]u8,
};
pub const xcb_get_property_reply_t = struct_xcb_get_property_reply_t;
pub const struct_xcb_list_properties_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_properties_cookie_t = struct_xcb_list_properties_cookie_t;
pub const struct_xcb_list_properties_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_list_properties_request_t = struct_xcb_list_properties_request_t;
pub const struct_xcb_list_properties_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    atoms_len: u16,
    pad1: [22]u8,
};
pub const xcb_list_properties_reply_t = struct_xcb_list_properties_reply_t;
pub const struct_xcb_set_selection_owner_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    owner: xcb_window_t,
    selection: xcb_atom_t,
    time: xcb_timestamp_t,
};
pub const xcb_set_selection_owner_request_t = struct_xcb_set_selection_owner_request_t;
pub const struct_xcb_get_selection_owner_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_selection_owner_cookie_t = struct_xcb_get_selection_owner_cookie_t;
pub const struct_xcb_get_selection_owner_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    selection: xcb_atom_t,
};
pub const xcb_get_selection_owner_request_t = struct_xcb_get_selection_owner_request_t;
pub const struct_xcb_get_selection_owner_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    owner: xcb_window_t,
};
pub const xcb_get_selection_owner_reply_t = struct_xcb_get_selection_owner_reply_t;
pub const struct_xcb_convert_selection_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    requestor: xcb_window_t,
    selection: xcb_atom_t,
    target: xcb_atom_t,
    property: xcb_atom_t,
    time: xcb_timestamp_t,
};
pub const xcb_convert_selection_request_t = struct_xcb_convert_selection_request_t;
pub const XCB_SEND_EVENT_DEST_POINTER_WINDOW = enum_xcb_send_event_dest_t.XCB_SEND_EVENT_DEST_POINTER_WINDOW;
pub const XCB_SEND_EVENT_DEST_ITEM_FOCUS = enum_xcb_send_event_dest_t.XCB_SEND_EVENT_DEST_ITEM_FOCUS;
pub const enum_xcb_send_event_dest_t = extern enum {
    XCB_SEND_EVENT_DEST_POINTER_WINDOW = 0,
    XCB_SEND_EVENT_DEST_ITEM_FOCUS = 1,
};
pub const xcb_send_event_dest_t = enum_xcb_send_event_dest_t;
pub const struct_xcb_send_event_request_t = extern struct {
    major_opcode: u8,
    propagate: u8,
    length: u16,
    destination: xcb_window_t,
    event_mask: u32,
    event: [32]u8,
};
pub const xcb_send_event_request_t = struct_xcb_send_event_request_t;
pub const XCB_GRAB_MODE_SYNC = enum_xcb_grab_mode_t.XCB_GRAB_MODE_SYNC;
pub const XCB_GRAB_MODE_ASYNC = enum_xcb_grab_mode_t.XCB_GRAB_MODE_ASYNC;
pub const enum_xcb_grab_mode_t = extern enum {
    XCB_GRAB_MODE_SYNC = 0,
    XCB_GRAB_MODE_ASYNC = 1,
};
pub const xcb_grab_mode_t = enum_xcb_grab_mode_t;
pub const XCB_GRAB_STATUS_SUCCESS = enum_xcb_grab_status_t.XCB_GRAB_STATUS_SUCCESS;
pub const XCB_GRAB_STATUS_ALREADY_GRABBED = enum_xcb_grab_status_t.XCB_GRAB_STATUS_ALREADY_GRABBED;
pub const XCB_GRAB_STATUS_INVALID_TIME = enum_xcb_grab_status_t.XCB_GRAB_STATUS_INVALID_TIME;
pub const XCB_GRAB_STATUS_NOT_VIEWABLE = enum_xcb_grab_status_t.XCB_GRAB_STATUS_NOT_VIEWABLE;
pub const XCB_GRAB_STATUS_FROZEN = enum_xcb_grab_status_t.XCB_GRAB_STATUS_FROZEN;
pub const enum_xcb_grab_status_t = extern enum {
    XCB_GRAB_STATUS_SUCCESS = 0,
    XCB_GRAB_STATUS_ALREADY_GRABBED = 1,
    XCB_GRAB_STATUS_INVALID_TIME = 2,
    XCB_GRAB_STATUS_NOT_VIEWABLE = 3,
    XCB_GRAB_STATUS_FROZEN = 4,
};
pub const xcb_grab_status_t = enum_xcb_grab_status_t;
pub const XCB_CURSOR_NONE = enum_xcb_cursor_enum_t.XCB_CURSOR_NONE;
pub const enum_xcb_cursor_enum_t = extern enum {
    XCB_CURSOR_NONE = 0,
};
pub const xcb_cursor_enum_t = enum_xcb_cursor_enum_t;
pub const struct_xcb_grab_pointer_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_grab_pointer_cookie_t = struct_xcb_grab_pointer_cookie_t;
pub const struct_xcb_grab_pointer_request_t = extern struct {
    major_opcode: u8,
    owner_events: u8,
    length: u16,
    grab_window: xcb_window_t,
    event_mask: u16,
    pointer_mode: u8,
    keyboard_mode: u8,
    confine_to: xcb_window_t,
    cursor: xcb_cursor_t,
    time: xcb_timestamp_t,
};
pub const xcb_grab_pointer_request_t = struct_xcb_grab_pointer_request_t;
pub const struct_xcb_grab_pointer_reply_t = extern struct {
    response_type: u8,
    status: u8,
    sequence: u16,
    length: u32,
};
pub const xcb_grab_pointer_reply_t = struct_xcb_grab_pointer_reply_t;
pub const struct_xcb_ungrab_pointer_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    time: xcb_timestamp_t,
};
pub const xcb_ungrab_pointer_request_t = struct_xcb_ungrab_pointer_request_t;
pub const XCB_BUTTON_INDEX_ANY = enum_xcb_button_index_t.XCB_BUTTON_INDEX_ANY;
pub const XCB_BUTTON_INDEX_1 = enum_xcb_button_index_t.XCB_BUTTON_INDEX_1;
pub const XCB_BUTTON_INDEX_2 = enum_xcb_button_index_t.XCB_BUTTON_INDEX_2;
pub const XCB_BUTTON_INDEX_3 = enum_xcb_button_index_t.XCB_BUTTON_INDEX_3;
pub const XCB_BUTTON_INDEX_4 = enum_xcb_button_index_t.XCB_BUTTON_INDEX_4;
pub const XCB_BUTTON_INDEX_5 = enum_xcb_button_index_t.XCB_BUTTON_INDEX_5;
pub const enum_xcb_button_index_t = extern enum {
    XCB_BUTTON_INDEX_ANY = 0,
    XCB_BUTTON_INDEX_1 = 1,
    XCB_BUTTON_INDEX_2 = 2,
    XCB_BUTTON_INDEX_3 = 3,
    XCB_BUTTON_INDEX_4 = 4,
    XCB_BUTTON_INDEX_5 = 5,
};
pub const xcb_button_index_t = enum_xcb_button_index_t;
pub const struct_xcb_grab_button_request_t = extern struct {
    major_opcode: u8,
    owner_events: u8,
    length: u16,
    grab_window: xcb_window_t,
    event_mask: u16,
    pointer_mode: u8,
    keyboard_mode: u8,
    confine_to: xcb_window_t,
    cursor: xcb_cursor_t,
    button: u8,
    pad0: u8,
    modifiers: u16,
};
pub const xcb_grab_button_request_t = struct_xcb_grab_button_request_t;
pub const struct_xcb_ungrab_button_request_t = extern struct {
    major_opcode: u8,
    button: u8,
    length: u16,
    grab_window: xcb_window_t,
    modifiers: u16,
    pad0: [2]u8,
};
pub const xcb_ungrab_button_request_t = struct_xcb_ungrab_button_request_t;
pub const struct_xcb_change_active_pointer_grab_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cursor: xcb_cursor_t,
    time: xcb_timestamp_t,
    event_mask: u16,
    pad1: [2]u8,
};
pub const xcb_change_active_pointer_grab_request_t = struct_xcb_change_active_pointer_grab_request_t;
pub const struct_xcb_grab_keyboard_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_grab_keyboard_cookie_t = struct_xcb_grab_keyboard_cookie_t;
pub const struct_xcb_grab_keyboard_request_t = extern struct {
    major_opcode: u8,
    owner_events: u8,
    length: u16,
    grab_window: xcb_window_t,
    time: xcb_timestamp_t,
    pointer_mode: u8,
    keyboard_mode: u8,
    pad0: [2]u8,
};
pub const xcb_grab_keyboard_request_t = struct_xcb_grab_keyboard_request_t;
pub const struct_xcb_grab_keyboard_reply_t = extern struct {
    response_type: u8,
    status: u8,
    sequence: u16,
    length: u32,
};
pub const xcb_grab_keyboard_reply_t = struct_xcb_grab_keyboard_reply_t;
pub const struct_xcb_ungrab_keyboard_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    time: xcb_timestamp_t,
};
pub const xcb_ungrab_keyboard_request_t = struct_xcb_ungrab_keyboard_request_t;
pub const XCB_GRAB_ANY = enum_xcb_grab_t.XCB_GRAB_ANY;
pub const enum_xcb_grab_t = extern enum {
    XCB_GRAB_ANY = 0,
};
pub const xcb_grab_t = enum_xcb_grab_t;
pub const struct_xcb_grab_key_request_t = extern struct {
    major_opcode: u8,
    owner_events: u8,
    length: u16,
    grab_window: xcb_window_t,
    modifiers: u16,
    key: xcb_keycode_t,
    pointer_mode: u8,
    keyboard_mode: u8,
    pad0: [3]u8,
};
pub const xcb_grab_key_request_t = struct_xcb_grab_key_request_t;
pub const struct_xcb_ungrab_key_request_t = extern struct {
    major_opcode: u8,
    key: xcb_keycode_t,
    length: u16,
    grab_window: xcb_window_t,
    modifiers: u16,
    pad0: [2]u8,
};
pub const xcb_ungrab_key_request_t = struct_xcb_ungrab_key_request_t;
pub const XCB_ALLOW_ASYNC_POINTER = enum_xcb_allow_t.XCB_ALLOW_ASYNC_POINTER;
pub const XCB_ALLOW_SYNC_POINTER = enum_xcb_allow_t.XCB_ALLOW_SYNC_POINTER;
pub const XCB_ALLOW_REPLAY_POINTER = enum_xcb_allow_t.XCB_ALLOW_REPLAY_POINTER;
pub const XCB_ALLOW_ASYNC_KEYBOARD = enum_xcb_allow_t.XCB_ALLOW_ASYNC_KEYBOARD;
pub const XCB_ALLOW_SYNC_KEYBOARD = enum_xcb_allow_t.XCB_ALLOW_SYNC_KEYBOARD;
pub const XCB_ALLOW_REPLAY_KEYBOARD = enum_xcb_allow_t.XCB_ALLOW_REPLAY_KEYBOARD;
pub const XCB_ALLOW_ASYNC_BOTH = enum_xcb_allow_t.XCB_ALLOW_ASYNC_BOTH;
pub const XCB_ALLOW_SYNC_BOTH = enum_xcb_allow_t.XCB_ALLOW_SYNC_BOTH;
pub const enum_xcb_allow_t = extern enum {
    XCB_ALLOW_ASYNC_POINTER = 0,
    XCB_ALLOW_SYNC_POINTER = 1,
    XCB_ALLOW_REPLAY_POINTER = 2,
    XCB_ALLOW_ASYNC_KEYBOARD = 3,
    XCB_ALLOW_SYNC_KEYBOARD = 4,
    XCB_ALLOW_REPLAY_KEYBOARD = 5,
    XCB_ALLOW_ASYNC_BOTH = 6,
    XCB_ALLOW_SYNC_BOTH = 7,
};
pub const xcb_allow_t = enum_xcb_allow_t;
pub const struct_xcb_allow_events_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
    time: xcb_timestamp_t,
};
pub const xcb_allow_events_request_t = struct_xcb_allow_events_request_t;
pub const struct_xcb_grab_server_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_grab_server_request_t = struct_xcb_grab_server_request_t;
pub const struct_xcb_ungrab_server_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_ungrab_server_request_t = struct_xcb_ungrab_server_request_t;
pub const struct_xcb_query_pointer_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_pointer_cookie_t = struct_xcb_query_pointer_cookie_t;
pub const struct_xcb_query_pointer_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_query_pointer_request_t = struct_xcb_query_pointer_request_t;
pub const struct_xcb_query_pointer_reply_t = extern struct {
    response_type: u8,
    same_screen: u8,
    sequence: u16,
    length: u32,
    root: xcb_window_t,
    child: xcb_window_t,
    root_x: i16,
    root_y: i16,
    win_x: i16,
    win_y: i16,
    mask: u16,
    pad0: [2]u8,
};
pub const xcb_query_pointer_reply_t = struct_xcb_query_pointer_reply_t;
pub const struct_xcb_timecoord_t = extern struct {
    time: xcb_timestamp_t,
    x: i16,
    y: i16,
};
pub const xcb_timecoord_t = struct_xcb_timecoord_t;
pub const struct_xcb_timecoord_iterator_t = extern struct {
    data: ?[*]xcb_timecoord_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_timecoord_iterator_t = struct_xcb_timecoord_iterator_t;
pub const struct_xcb_get_motion_events_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_motion_events_cookie_t = struct_xcb_get_motion_events_cookie_t;
pub const struct_xcb_get_motion_events_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    start: xcb_timestamp_t,
    stop: xcb_timestamp_t,
};
pub const xcb_get_motion_events_request_t = struct_xcb_get_motion_events_request_t;
pub const struct_xcb_get_motion_events_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    events_len: u32,
    pad1: [20]u8,
};
pub const xcb_get_motion_events_reply_t = struct_xcb_get_motion_events_reply_t;
pub const struct_xcb_translate_coordinates_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_translate_coordinates_cookie_t = struct_xcb_translate_coordinates_cookie_t;
pub const struct_xcb_translate_coordinates_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    src_window: xcb_window_t,
    dst_window: xcb_window_t,
    src_x: i16,
    src_y: i16,
};
pub const xcb_translate_coordinates_request_t = struct_xcb_translate_coordinates_request_t;
pub const struct_xcb_translate_coordinates_reply_t = extern struct {
    response_type: u8,
    same_screen: u8,
    sequence: u16,
    length: u32,
    child: xcb_window_t,
    dst_x: i16,
    dst_y: i16,
};
pub const xcb_translate_coordinates_reply_t = struct_xcb_translate_coordinates_reply_t;
pub const struct_xcb_warp_pointer_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    src_window: xcb_window_t,
    dst_window: xcb_window_t,
    src_x: i16,
    src_y: i16,
    src_width: u16,
    src_height: u16,
    dst_x: i16,
    dst_y: i16,
};
pub const xcb_warp_pointer_request_t = struct_xcb_warp_pointer_request_t;
pub const XCB_INPUT_FOCUS_NONE = enum_xcb_input_focus_t.XCB_INPUT_FOCUS_NONE;
pub const XCB_INPUT_FOCUS_POINTER_ROOT = enum_xcb_input_focus_t.XCB_INPUT_FOCUS_POINTER_ROOT;
pub const XCB_INPUT_FOCUS_PARENT = enum_xcb_input_focus_t.XCB_INPUT_FOCUS_PARENT;
pub const XCB_INPUT_FOCUS_FOLLOW_KEYBOARD = enum_xcb_input_focus_t.XCB_INPUT_FOCUS_FOLLOW_KEYBOARD;
pub const enum_xcb_input_focus_t = extern enum {
    XCB_INPUT_FOCUS_NONE = 0,
    XCB_INPUT_FOCUS_POINTER_ROOT = 1,
    XCB_INPUT_FOCUS_PARENT = 2,
    XCB_INPUT_FOCUS_FOLLOW_KEYBOARD = 3,
};
pub const xcb_input_focus_t = enum_xcb_input_focus_t;
pub const struct_xcb_set_input_focus_request_t = extern struct {
    major_opcode: u8,
    revert_to: u8,
    length: u16,
    focus: xcb_window_t,
    time: xcb_timestamp_t,
};
pub const xcb_set_input_focus_request_t = struct_xcb_set_input_focus_request_t;
pub const struct_xcb_get_input_focus_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_input_focus_cookie_t = struct_xcb_get_input_focus_cookie_t;
pub const struct_xcb_get_input_focus_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_input_focus_request_t = struct_xcb_get_input_focus_request_t;
pub const struct_xcb_get_input_focus_reply_t = extern struct {
    response_type: u8,
    revert_to: u8,
    sequence: u16,
    length: u32,
    focus: xcb_window_t,
};
pub const xcb_get_input_focus_reply_t = struct_xcb_get_input_focus_reply_t;
pub const struct_xcb_query_keymap_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_keymap_cookie_t = struct_xcb_query_keymap_cookie_t;
pub const struct_xcb_query_keymap_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_query_keymap_request_t = struct_xcb_query_keymap_request_t;
pub const struct_xcb_query_keymap_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    keys: [32]u8,
};
pub const xcb_query_keymap_reply_t = struct_xcb_query_keymap_reply_t;
pub const struct_xcb_open_font_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    fid: xcb_font_t,
    name_len: u16,
    pad1: [2]u8,
};
pub const xcb_open_font_request_t = struct_xcb_open_font_request_t;
pub const struct_xcb_close_font_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    font: xcb_font_t,
};
pub const xcb_close_font_request_t = struct_xcb_close_font_request_t;
pub const XCB_FONT_DRAW_LEFT_TO_RIGHT = enum_xcb_font_draw_t.XCB_FONT_DRAW_LEFT_TO_RIGHT;
pub const XCB_FONT_DRAW_RIGHT_TO_LEFT = enum_xcb_font_draw_t.XCB_FONT_DRAW_RIGHT_TO_LEFT;
pub const enum_xcb_font_draw_t = extern enum {
    XCB_FONT_DRAW_LEFT_TO_RIGHT = 0,
    XCB_FONT_DRAW_RIGHT_TO_LEFT = 1,
};
pub const xcb_font_draw_t = enum_xcb_font_draw_t;
pub const struct_xcb_fontprop_t = extern struct {
    name: xcb_atom_t,
    value: u32,
};
pub const xcb_fontprop_t = struct_xcb_fontprop_t;
pub const struct_xcb_fontprop_iterator_t = extern struct {
    data: ?[*]xcb_fontprop_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_fontprop_iterator_t = struct_xcb_fontprop_iterator_t;
pub const struct_xcb_charinfo_t = extern struct {
    left_side_bearing: i16,
    right_side_bearing: i16,
    character_width: i16,
    ascent: i16,
    descent: i16,
    attributes: u16,
};
pub const xcb_charinfo_t = struct_xcb_charinfo_t;
pub const struct_xcb_charinfo_iterator_t = extern struct {
    data: ?[*]xcb_charinfo_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_charinfo_iterator_t = struct_xcb_charinfo_iterator_t;
pub const struct_xcb_query_font_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_font_cookie_t = struct_xcb_query_font_cookie_t;
pub const struct_xcb_query_font_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    font: xcb_fontable_t,
};
pub const xcb_query_font_request_t = struct_xcb_query_font_request_t;
pub const struct_xcb_query_font_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    min_bounds: xcb_charinfo_t,
    pad1: [4]u8,
    max_bounds: xcb_charinfo_t,
    pad2: [4]u8,
    min_char_or_byte2: u16,
    max_char_or_byte2: u16,
    default_char: u16,
    properties_len: u16,
    draw_direction: u8,
    min_byte1: u8,
    max_byte1: u8,
    all_chars_exist: u8,
    font_ascent: i16,
    font_descent: i16,
    char_infos_len: u32,
};
pub const xcb_query_font_reply_t = struct_xcb_query_font_reply_t;
pub const struct_xcb_query_text_extents_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_text_extents_cookie_t = struct_xcb_query_text_extents_cookie_t;
pub const struct_xcb_query_text_extents_request_t = extern struct {
    major_opcode: u8,
    odd_length: u8,
    length: u16,
    font: xcb_fontable_t,
};
pub const xcb_query_text_extents_request_t = struct_xcb_query_text_extents_request_t;
pub const struct_xcb_query_text_extents_reply_t = extern struct {
    response_type: u8,
    draw_direction: u8,
    sequence: u16,
    length: u32,
    font_ascent: i16,
    font_descent: i16,
    overall_ascent: i16,
    overall_descent: i16,
    overall_width: i32,
    overall_left: i32,
    overall_right: i32,
};
pub const xcb_query_text_extents_reply_t = struct_xcb_query_text_extents_reply_t;
pub const struct_xcb_str_t = extern struct {
    name_len: u8,
};
pub const xcb_str_t = struct_xcb_str_t;
pub const struct_xcb_str_iterator_t = extern struct {
    data: ?[*]xcb_str_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_str_iterator_t = struct_xcb_str_iterator_t;
pub const struct_xcb_list_fonts_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_fonts_cookie_t = struct_xcb_list_fonts_cookie_t;
pub const struct_xcb_list_fonts_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    max_names: u16,
    pattern_len: u16,
};
pub const xcb_list_fonts_request_t = struct_xcb_list_fonts_request_t;
pub const struct_xcb_list_fonts_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    names_len: u16,
    pad1: [22]u8,
};
pub const xcb_list_fonts_reply_t = struct_xcb_list_fonts_reply_t;
pub const struct_xcb_list_fonts_with_info_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_fonts_with_info_cookie_t = struct_xcb_list_fonts_with_info_cookie_t;
pub const struct_xcb_list_fonts_with_info_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    max_names: u16,
    pattern_len: u16,
};
pub const xcb_list_fonts_with_info_request_t = struct_xcb_list_fonts_with_info_request_t;
pub const struct_xcb_list_fonts_with_info_reply_t = extern struct {
    response_type: u8,
    name_len: u8,
    sequence: u16,
    length: u32,
    min_bounds: xcb_charinfo_t,
    pad0: [4]u8,
    max_bounds: xcb_charinfo_t,
    pad1: [4]u8,
    min_char_or_byte2: u16,
    max_char_or_byte2: u16,
    default_char: u16,
    properties_len: u16,
    draw_direction: u8,
    min_byte1: u8,
    max_byte1: u8,
    all_chars_exist: u8,
    font_ascent: i16,
    font_descent: i16,
    replies_hint: u32,
};
pub const xcb_list_fonts_with_info_reply_t = struct_xcb_list_fonts_with_info_reply_t;
pub const struct_xcb_set_font_path_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    font_qty: u16,
    pad1: [2]u8,
};
pub const xcb_set_font_path_request_t = struct_xcb_set_font_path_request_t;
pub const struct_xcb_get_font_path_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_font_path_cookie_t = struct_xcb_get_font_path_cookie_t;
pub const struct_xcb_get_font_path_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_font_path_request_t = struct_xcb_get_font_path_request_t;
pub const struct_xcb_get_font_path_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    path_len: u16,
    pad1: [22]u8,
};
pub const xcb_get_font_path_reply_t = struct_xcb_get_font_path_reply_t;
pub const struct_xcb_create_pixmap_request_t = extern struct {
    major_opcode: u8,
    depth: u8,
    length: u16,
    pid: xcb_pixmap_t,
    drawable: xcb_drawable_t,
    width: u16,
    height: u16,
};
pub const xcb_create_pixmap_request_t = struct_xcb_create_pixmap_request_t;
pub const struct_xcb_free_pixmap_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    pixmap: xcb_pixmap_t,
};
pub const xcb_free_pixmap_request_t = struct_xcb_free_pixmap_request_t;
pub const XCB_GC_FUNCTION = enum_xcb_gc_t.XCB_GC_FUNCTION;
pub const XCB_GC_PLANE_MASK = enum_xcb_gc_t.XCB_GC_PLANE_MASK;
pub const XCB_GC_FOREGROUND = enum_xcb_gc_t.XCB_GC_FOREGROUND;
pub const XCB_GC_BACKGROUND = enum_xcb_gc_t.XCB_GC_BACKGROUND;
pub const XCB_GC_LINE_WIDTH = enum_xcb_gc_t.XCB_GC_LINE_WIDTH;
pub const XCB_GC_LINE_STYLE = enum_xcb_gc_t.XCB_GC_LINE_STYLE;
pub const XCB_GC_CAP_STYLE = enum_xcb_gc_t.XCB_GC_CAP_STYLE;
pub const XCB_GC_JOIN_STYLE = enum_xcb_gc_t.XCB_GC_JOIN_STYLE;
pub const XCB_GC_FILL_STYLE = enum_xcb_gc_t.XCB_GC_FILL_STYLE;
pub const XCB_GC_FILL_RULE = enum_xcb_gc_t.XCB_GC_FILL_RULE;
pub const XCB_GC_TILE = enum_xcb_gc_t.XCB_GC_TILE;
pub const XCB_GC_STIPPLE = enum_xcb_gc_t.XCB_GC_STIPPLE;
pub const XCB_GC_TILE_STIPPLE_ORIGIN_X = enum_xcb_gc_t.XCB_GC_TILE_STIPPLE_ORIGIN_X;
pub const XCB_GC_TILE_STIPPLE_ORIGIN_Y = enum_xcb_gc_t.XCB_GC_TILE_STIPPLE_ORIGIN_Y;
pub const XCB_GC_FONT = enum_xcb_gc_t.XCB_GC_FONT;
pub const XCB_GC_SUBWINDOW_MODE = enum_xcb_gc_t.XCB_GC_SUBWINDOW_MODE;
pub const XCB_GC_GRAPHICS_EXPOSURES = enum_xcb_gc_t.XCB_GC_GRAPHICS_EXPOSURES;
pub const XCB_GC_CLIP_ORIGIN_X = enum_xcb_gc_t.XCB_GC_CLIP_ORIGIN_X;
pub const XCB_GC_CLIP_ORIGIN_Y = enum_xcb_gc_t.XCB_GC_CLIP_ORIGIN_Y;
pub const XCB_GC_CLIP_MASK = enum_xcb_gc_t.XCB_GC_CLIP_MASK;
pub const XCB_GC_DASH_OFFSET = enum_xcb_gc_t.XCB_GC_DASH_OFFSET;
pub const XCB_GC_DASH_LIST = enum_xcb_gc_t.XCB_GC_DASH_LIST;
pub const XCB_GC_ARC_MODE = enum_xcb_gc_t.XCB_GC_ARC_MODE;
pub const enum_xcb_gc_t = extern enum {
    XCB_GC_FUNCTION = 1,
    XCB_GC_PLANE_MASK = 2,
    XCB_GC_FOREGROUND = 4,
    XCB_GC_BACKGROUND = 8,
    XCB_GC_LINE_WIDTH = 16,
    XCB_GC_LINE_STYLE = 32,
    XCB_GC_CAP_STYLE = 64,
    XCB_GC_JOIN_STYLE = 128,
    XCB_GC_FILL_STYLE = 256,
    XCB_GC_FILL_RULE = 512,
    XCB_GC_TILE = 1024,
    XCB_GC_STIPPLE = 2048,
    XCB_GC_TILE_STIPPLE_ORIGIN_X = 4096,
    XCB_GC_TILE_STIPPLE_ORIGIN_Y = 8192,
    XCB_GC_FONT = 16384,
    XCB_GC_SUBWINDOW_MODE = 32768,
    XCB_GC_GRAPHICS_EXPOSURES = 65536,
    XCB_GC_CLIP_ORIGIN_X = 131072,
    XCB_GC_CLIP_ORIGIN_Y = 262144,
    XCB_GC_CLIP_MASK = 524288,
    XCB_GC_DASH_OFFSET = 1048576,
    XCB_GC_DASH_LIST = 2097152,
    XCB_GC_ARC_MODE = 4194304,
};
pub const xcb_gc_t = enum_xcb_gc_t;
pub const XCB_GX_CLEAR = enum_xcb_gx_t.XCB_GX_CLEAR;
pub const XCB_GX_AND = enum_xcb_gx_t.XCB_GX_AND;
pub const XCB_GX_AND_REVERSE = enum_xcb_gx_t.XCB_GX_AND_REVERSE;
pub const XCB_GX_COPY = enum_xcb_gx_t.XCB_GX_COPY;
pub const XCB_GX_AND_INVERTED = enum_xcb_gx_t.XCB_GX_AND_INVERTED;
pub const XCB_GX_NOOP = enum_xcb_gx_t.XCB_GX_NOOP;
pub const XCB_GX_XOR = enum_xcb_gx_t.XCB_GX_XOR;
pub const XCB_GX_OR = enum_xcb_gx_t.XCB_GX_OR;
pub const XCB_GX_NOR = enum_xcb_gx_t.XCB_GX_NOR;
pub const XCB_GX_EQUIV = enum_xcb_gx_t.XCB_GX_EQUIV;
pub const XCB_GX_INVERT = enum_xcb_gx_t.XCB_GX_INVERT;
pub const XCB_GX_OR_REVERSE = enum_xcb_gx_t.XCB_GX_OR_REVERSE;
pub const XCB_GX_COPY_INVERTED = enum_xcb_gx_t.XCB_GX_COPY_INVERTED;
pub const XCB_GX_OR_INVERTED = enum_xcb_gx_t.XCB_GX_OR_INVERTED;
pub const XCB_GX_NAND = enum_xcb_gx_t.XCB_GX_NAND;
pub const XCB_GX_SET = enum_xcb_gx_t.XCB_GX_SET;
pub const enum_xcb_gx_t = extern enum {
    XCB_GX_CLEAR = 0,
    XCB_GX_AND = 1,
    XCB_GX_AND_REVERSE = 2,
    XCB_GX_COPY = 3,
    XCB_GX_AND_INVERTED = 4,
    XCB_GX_NOOP = 5,
    XCB_GX_XOR = 6,
    XCB_GX_OR = 7,
    XCB_GX_NOR = 8,
    XCB_GX_EQUIV = 9,
    XCB_GX_INVERT = 10,
    XCB_GX_OR_REVERSE = 11,
    XCB_GX_COPY_INVERTED = 12,
    XCB_GX_OR_INVERTED = 13,
    XCB_GX_NAND = 14,
    XCB_GX_SET = 15,
};
pub const xcb_gx_t = enum_xcb_gx_t;
pub const XCB_LINE_STYLE_SOLID = enum_xcb_line_style_t.XCB_LINE_STYLE_SOLID;
pub const XCB_LINE_STYLE_ON_OFF_DASH = enum_xcb_line_style_t.XCB_LINE_STYLE_ON_OFF_DASH;
pub const XCB_LINE_STYLE_DOUBLE_DASH = enum_xcb_line_style_t.XCB_LINE_STYLE_DOUBLE_DASH;
pub const enum_xcb_line_style_t = extern enum {
    XCB_LINE_STYLE_SOLID = 0,
    XCB_LINE_STYLE_ON_OFF_DASH = 1,
    XCB_LINE_STYLE_DOUBLE_DASH = 2,
};
pub const xcb_line_style_t = enum_xcb_line_style_t;
pub const XCB_CAP_STYLE_NOT_LAST = enum_xcb_cap_style_t.XCB_CAP_STYLE_NOT_LAST;
pub const XCB_CAP_STYLE_BUTT = enum_xcb_cap_style_t.XCB_CAP_STYLE_BUTT;
pub const XCB_CAP_STYLE_ROUND = enum_xcb_cap_style_t.XCB_CAP_STYLE_ROUND;
pub const XCB_CAP_STYLE_PROJECTING = enum_xcb_cap_style_t.XCB_CAP_STYLE_PROJECTING;
pub const enum_xcb_cap_style_t = extern enum {
    XCB_CAP_STYLE_NOT_LAST = 0,
    XCB_CAP_STYLE_BUTT = 1,
    XCB_CAP_STYLE_ROUND = 2,
    XCB_CAP_STYLE_PROJECTING = 3,
};
pub const xcb_cap_style_t = enum_xcb_cap_style_t;
pub const XCB_JOIN_STYLE_MITER = enum_xcb_join_style_t.XCB_JOIN_STYLE_MITER;
pub const XCB_JOIN_STYLE_ROUND = enum_xcb_join_style_t.XCB_JOIN_STYLE_ROUND;
pub const XCB_JOIN_STYLE_BEVEL = enum_xcb_join_style_t.XCB_JOIN_STYLE_BEVEL;
pub const enum_xcb_join_style_t = extern enum {
    XCB_JOIN_STYLE_MITER = 0,
    XCB_JOIN_STYLE_ROUND = 1,
    XCB_JOIN_STYLE_BEVEL = 2,
};
pub const xcb_join_style_t = enum_xcb_join_style_t;
pub const XCB_FILL_STYLE_SOLID = enum_xcb_fill_style_t.XCB_FILL_STYLE_SOLID;
pub const XCB_FILL_STYLE_TILED = enum_xcb_fill_style_t.XCB_FILL_STYLE_TILED;
pub const XCB_FILL_STYLE_STIPPLED = enum_xcb_fill_style_t.XCB_FILL_STYLE_STIPPLED;
pub const XCB_FILL_STYLE_OPAQUE_STIPPLED = enum_xcb_fill_style_t.XCB_FILL_STYLE_OPAQUE_STIPPLED;
pub const enum_xcb_fill_style_t = extern enum {
    XCB_FILL_STYLE_SOLID = 0,
    XCB_FILL_STYLE_TILED = 1,
    XCB_FILL_STYLE_STIPPLED = 2,
    XCB_FILL_STYLE_OPAQUE_STIPPLED = 3,
};
pub const xcb_fill_style_t = enum_xcb_fill_style_t;
pub const XCB_FILL_RULE_EVEN_ODD = enum_xcb_fill_rule_t.XCB_FILL_RULE_EVEN_ODD;
pub const XCB_FILL_RULE_WINDING = enum_xcb_fill_rule_t.XCB_FILL_RULE_WINDING;
pub const enum_xcb_fill_rule_t = extern enum {
    XCB_FILL_RULE_EVEN_ODD = 0,
    XCB_FILL_RULE_WINDING = 1,
};
pub const xcb_fill_rule_t = enum_xcb_fill_rule_t;
pub const XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN = enum_xcb_subwindow_mode_t.XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN;
pub const XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS = enum_xcb_subwindow_mode_t.XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS;
pub const enum_xcb_subwindow_mode_t = extern enum {
    XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0,
    XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS = 1,
};
pub const xcb_subwindow_mode_t = enum_xcb_subwindow_mode_t;
pub const XCB_ARC_MODE_CHORD = enum_xcb_arc_mode_t.XCB_ARC_MODE_CHORD;
pub const XCB_ARC_MODE_PIE_SLICE = enum_xcb_arc_mode_t.XCB_ARC_MODE_PIE_SLICE;
pub const enum_xcb_arc_mode_t = extern enum {
    XCB_ARC_MODE_CHORD = 0,
    XCB_ARC_MODE_PIE_SLICE = 1,
};
pub const xcb_arc_mode_t = enum_xcb_arc_mode_t;
pub const struct_xcb_create_gc_value_list_t = extern struct {
    function: u32,
    plane_mask: u32,
    foreground: u32,
    background: u32,
    line_width: u32,
    line_style: u32,
    cap_style: u32,
    join_style: u32,
    fill_style: u32,
    fill_rule: u32,
    tile: xcb_pixmap_t,
    stipple: xcb_pixmap_t,
    tile_stipple_x_origin: i32,
    tile_stipple_y_origin: i32,
    font: xcb_font_t,
    subwindow_mode: u32,
    graphics_exposures: xcb_bool32_t,
    clip_x_origin: i32,
    clip_y_origin: i32,
    clip_mask: xcb_pixmap_t,
    dash_offset: u32,
    dashes: u32,
    arc_mode: u32,
};
pub const xcb_create_gc_value_list_t = struct_xcb_create_gc_value_list_t;
pub const struct_xcb_create_gc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cid: xcb_gcontext_t,
    drawable: xcb_drawable_t,
    value_mask: u32,
};
pub const xcb_create_gc_request_t = struct_xcb_create_gc_request_t;
pub const struct_xcb_change_gc_value_list_t = extern struct {
    function: u32,
    plane_mask: u32,
    foreground: u32,
    background: u32,
    line_width: u32,
    line_style: u32,
    cap_style: u32,
    join_style: u32,
    fill_style: u32,
    fill_rule: u32,
    tile: xcb_pixmap_t,
    stipple: xcb_pixmap_t,
    tile_stipple_x_origin: i32,
    tile_stipple_y_origin: i32,
    font: xcb_font_t,
    subwindow_mode: u32,
    graphics_exposures: xcb_bool32_t,
    clip_x_origin: i32,
    clip_y_origin: i32,
    clip_mask: xcb_pixmap_t,
    dash_offset: u32,
    dashes: u32,
    arc_mode: u32,
};
pub const xcb_change_gc_value_list_t = struct_xcb_change_gc_value_list_t;
pub const struct_xcb_change_gc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    gc: xcb_gcontext_t,
    value_mask: u32,
};
pub const xcb_change_gc_request_t = struct_xcb_change_gc_request_t;
pub const struct_xcb_copy_gc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    src_gc: xcb_gcontext_t,
    dst_gc: xcb_gcontext_t,
    value_mask: u32,
};
pub const xcb_copy_gc_request_t = struct_xcb_copy_gc_request_t;
pub const struct_xcb_set_dashes_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    gc: xcb_gcontext_t,
    dash_offset: u16,
    dashes_len: u16,
};
pub const xcb_set_dashes_request_t = struct_xcb_set_dashes_request_t;
pub const XCB_CLIP_ORDERING_UNSORTED = enum_xcb_clip_ordering_t.XCB_CLIP_ORDERING_UNSORTED;
pub const XCB_CLIP_ORDERING_Y_SORTED = enum_xcb_clip_ordering_t.XCB_CLIP_ORDERING_Y_SORTED;
pub const XCB_CLIP_ORDERING_YX_SORTED = enum_xcb_clip_ordering_t.XCB_CLIP_ORDERING_YX_SORTED;
pub const XCB_CLIP_ORDERING_YX_BANDED = enum_xcb_clip_ordering_t.XCB_CLIP_ORDERING_YX_BANDED;
pub const enum_xcb_clip_ordering_t = extern enum {
    XCB_CLIP_ORDERING_UNSORTED = 0,
    XCB_CLIP_ORDERING_Y_SORTED = 1,
    XCB_CLIP_ORDERING_YX_SORTED = 2,
    XCB_CLIP_ORDERING_YX_BANDED = 3,
};
pub const xcb_clip_ordering_t = enum_xcb_clip_ordering_t;
pub const struct_xcb_set_clip_rectangles_request_t = extern struct {
    major_opcode: u8,
    ordering: u8,
    length: u16,
    gc: xcb_gcontext_t,
    clip_x_origin: i16,
    clip_y_origin: i16,
};
pub const xcb_set_clip_rectangles_request_t = struct_xcb_set_clip_rectangles_request_t;
pub const struct_xcb_free_gc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    gc: xcb_gcontext_t,
};
pub const xcb_free_gc_request_t = struct_xcb_free_gc_request_t;
pub const struct_xcb_clear_area_request_t = extern struct {
    major_opcode: u8,
    exposures: u8,
    length: u16,
    window: xcb_window_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
};
pub const xcb_clear_area_request_t = struct_xcb_clear_area_request_t;
pub const struct_xcb_copy_area_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    src_drawable: xcb_drawable_t,
    dst_drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    src_x: i16,
    src_y: i16,
    dst_x: i16,
    dst_y: i16,
    width: u16,
    height: u16,
};
pub const xcb_copy_area_request_t = struct_xcb_copy_area_request_t;
pub const struct_xcb_copy_plane_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    src_drawable: xcb_drawable_t,
    dst_drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    src_x: i16,
    src_y: i16,
    dst_x: i16,
    dst_y: i16,
    width: u16,
    height: u16,
    bit_plane: u32,
};
pub const xcb_copy_plane_request_t = struct_xcb_copy_plane_request_t;
pub const XCB_COORD_MODE_ORIGIN = enum_xcb_coord_mode_t.XCB_COORD_MODE_ORIGIN;
pub const XCB_COORD_MODE_PREVIOUS = enum_xcb_coord_mode_t.XCB_COORD_MODE_PREVIOUS;
pub const enum_xcb_coord_mode_t = extern enum {
    XCB_COORD_MODE_ORIGIN = 0,
    XCB_COORD_MODE_PREVIOUS = 1,
};
pub const xcb_coord_mode_t = enum_xcb_coord_mode_t;
pub const struct_xcb_poly_point_request_t = extern struct {
    major_opcode: u8,
    coordinate_mode: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_point_request_t = struct_xcb_poly_point_request_t;
pub const struct_xcb_poly_line_request_t = extern struct {
    major_opcode: u8,
    coordinate_mode: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_line_request_t = struct_xcb_poly_line_request_t;
pub const struct_xcb_segment_t = extern struct {
    x1: i16,
    y1: i16,
    x2: i16,
    y2: i16,
};
pub const xcb_segment_t = struct_xcb_segment_t;
pub const struct_xcb_segment_iterator_t = extern struct {
    data: ?[*]xcb_segment_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_segment_iterator_t = struct_xcb_segment_iterator_t;
pub const struct_xcb_poly_segment_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_segment_request_t = struct_xcb_poly_segment_request_t;
pub const struct_xcb_poly_rectangle_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_rectangle_request_t = struct_xcb_poly_rectangle_request_t;
pub const struct_xcb_poly_arc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_arc_request_t = struct_xcb_poly_arc_request_t;
pub const XCB_POLY_SHAPE_COMPLEX = enum_xcb_poly_shape_t.XCB_POLY_SHAPE_COMPLEX;
pub const XCB_POLY_SHAPE_NONCONVEX = enum_xcb_poly_shape_t.XCB_POLY_SHAPE_NONCONVEX;
pub const XCB_POLY_SHAPE_CONVEX = enum_xcb_poly_shape_t.XCB_POLY_SHAPE_CONVEX;
pub const enum_xcb_poly_shape_t = extern enum {
    XCB_POLY_SHAPE_COMPLEX = 0,
    XCB_POLY_SHAPE_NONCONVEX = 1,
    XCB_POLY_SHAPE_CONVEX = 2,
};
pub const xcb_poly_shape_t = enum_xcb_poly_shape_t;
pub const struct_xcb_fill_poly_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    shape: u8,
    coordinate_mode: u8,
    pad1: [2]u8,
};
pub const xcb_fill_poly_request_t = struct_xcb_fill_poly_request_t;
pub const struct_xcb_poly_fill_rectangle_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_fill_rectangle_request_t = struct_xcb_poly_fill_rectangle_request_t;
pub const struct_xcb_poly_fill_arc_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
};
pub const xcb_poly_fill_arc_request_t = struct_xcb_poly_fill_arc_request_t;
pub const XCB_IMAGE_FORMAT_XY_BITMAP = enum_xcb_image_format_t.XCB_IMAGE_FORMAT_XY_BITMAP;
pub const XCB_IMAGE_FORMAT_XY_PIXMAP = enum_xcb_image_format_t.XCB_IMAGE_FORMAT_XY_PIXMAP;
pub const XCB_IMAGE_FORMAT_Z_PIXMAP = enum_xcb_image_format_t.XCB_IMAGE_FORMAT_Z_PIXMAP;
pub const enum_xcb_image_format_t = extern enum {
    XCB_IMAGE_FORMAT_XY_BITMAP = 0,
    XCB_IMAGE_FORMAT_XY_PIXMAP = 1,
    XCB_IMAGE_FORMAT_Z_PIXMAP = 2,
};
pub const xcb_image_format_t = enum_xcb_image_format_t;
pub const struct_xcb_put_image_request_t = extern struct {
    major_opcode: u8,
    format: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    width: u16,
    height: u16,
    dst_x: i16,
    dst_y: i16,
    left_pad: u8,
    depth: u8,
    pad0: [2]u8,
};
pub const xcb_put_image_request_t = struct_xcb_put_image_request_t;
pub const struct_xcb_get_image_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_image_cookie_t = struct_xcb_get_image_cookie_t;
pub const struct_xcb_get_image_request_t = extern struct {
    major_opcode: u8,
    format: u8,
    length: u16,
    drawable: xcb_drawable_t,
    x: i16,
    y: i16,
    width: u16,
    height: u16,
    plane_mask: u32,
};
pub const xcb_get_image_request_t = struct_xcb_get_image_request_t;
pub const struct_xcb_get_image_reply_t = extern struct {
    response_type: u8,
    depth: u8,
    sequence: u16,
    length: u32,
    visual: xcb_visualid_t,
    pad0: [20]u8,
};
pub const xcb_get_image_reply_t = struct_xcb_get_image_reply_t;
pub const struct_xcb_poly_text_8_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    x: i16,
    y: i16,
};
pub const xcb_poly_text_8_request_t = struct_xcb_poly_text_8_request_t;
pub const struct_xcb_poly_text_16_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    x: i16,
    y: i16,
};
pub const xcb_poly_text_16_request_t = struct_xcb_poly_text_16_request_t;
pub const struct_xcb_image_text_8_request_t = extern struct {
    major_opcode: u8,
    string_len: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    x: i16,
    y: i16,
};
pub const xcb_image_text_8_request_t = struct_xcb_image_text_8_request_t;
pub const struct_xcb_image_text_16_request_t = extern struct {
    major_opcode: u8,
    string_len: u8,
    length: u16,
    drawable: xcb_drawable_t,
    gc: xcb_gcontext_t,
    x: i16,
    y: i16,
};
pub const xcb_image_text_16_request_t = struct_xcb_image_text_16_request_t;
pub const XCB_COLORMAP_ALLOC_NONE = enum_xcb_colormap_alloc_t.XCB_COLORMAP_ALLOC_NONE;
pub const XCB_COLORMAP_ALLOC_ALL = enum_xcb_colormap_alloc_t.XCB_COLORMAP_ALLOC_ALL;
pub const enum_xcb_colormap_alloc_t = extern enum {
    XCB_COLORMAP_ALLOC_NONE = 0,
    XCB_COLORMAP_ALLOC_ALL = 1,
};
pub const xcb_colormap_alloc_t = enum_xcb_colormap_alloc_t;
pub const struct_xcb_create_colormap_request_t = extern struct {
    major_opcode: u8,
    alloc: u8,
    length: u16,
    mid: xcb_colormap_t,
    window: xcb_window_t,
    visual: xcb_visualid_t,
};
pub const xcb_create_colormap_request_t = struct_xcb_create_colormap_request_t;
pub const struct_xcb_free_colormap_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
};
pub const xcb_free_colormap_request_t = struct_xcb_free_colormap_request_t;
pub const struct_xcb_copy_colormap_and_free_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    mid: xcb_colormap_t,
    src_cmap: xcb_colormap_t,
};
pub const xcb_copy_colormap_and_free_request_t = struct_xcb_copy_colormap_and_free_request_t;
pub const struct_xcb_install_colormap_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
};
pub const xcb_install_colormap_request_t = struct_xcb_install_colormap_request_t;
pub const struct_xcb_uninstall_colormap_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
};
pub const xcb_uninstall_colormap_request_t = struct_xcb_uninstall_colormap_request_t;
pub const struct_xcb_list_installed_colormaps_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_installed_colormaps_cookie_t = struct_xcb_list_installed_colormaps_cookie_t;
pub const struct_xcb_list_installed_colormaps_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
};
pub const xcb_list_installed_colormaps_request_t = struct_xcb_list_installed_colormaps_request_t;
pub const struct_xcb_list_installed_colormaps_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    cmaps_len: u16,
    pad1: [22]u8,
};
pub const xcb_list_installed_colormaps_reply_t = struct_xcb_list_installed_colormaps_reply_t;
pub const struct_xcb_alloc_color_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_alloc_color_cookie_t = struct_xcb_alloc_color_cookie_t;
pub const struct_xcb_alloc_color_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
    red: u16,
    green: u16,
    blue: u16,
    pad1: [2]u8,
};
pub const xcb_alloc_color_request_t = struct_xcb_alloc_color_request_t;
pub const struct_xcb_alloc_color_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    red: u16,
    green: u16,
    blue: u16,
    pad1: [2]u8,
    pixel: u32,
};
pub const xcb_alloc_color_reply_t = struct_xcb_alloc_color_reply_t;
pub const struct_xcb_alloc_named_color_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_alloc_named_color_cookie_t = struct_xcb_alloc_named_color_cookie_t;
pub const struct_xcb_alloc_named_color_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
    name_len: u16,
    pad1: [2]u8,
};
pub const xcb_alloc_named_color_request_t = struct_xcb_alloc_named_color_request_t;
pub const struct_xcb_alloc_named_color_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    pixel: u32,
    exact_red: u16,
    exact_green: u16,
    exact_blue: u16,
    visual_red: u16,
    visual_green: u16,
    visual_blue: u16,
};
pub const xcb_alloc_named_color_reply_t = struct_xcb_alloc_named_color_reply_t;
pub const struct_xcb_alloc_color_cells_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_alloc_color_cells_cookie_t = struct_xcb_alloc_color_cells_cookie_t;
pub const struct_xcb_alloc_color_cells_request_t = extern struct {
    major_opcode: u8,
    contiguous: u8,
    length: u16,
    cmap: xcb_colormap_t,
    colors: u16,
    planes: u16,
};
pub const xcb_alloc_color_cells_request_t = struct_xcb_alloc_color_cells_request_t;
pub const struct_xcb_alloc_color_cells_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    pixels_len: u16,
    masks_len: u16,
    pad1: [20]u8,
};
pub const xcb_alloc_color_cells_reply_t = struct_xcb_alloc_color_cells_reply_t;
pub const struct_xcb_alloc_color_planes_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_alloc_color_planes_cookie_t = struct_xcb_alloc_color_planes_cookie_t;
pub const struct_xcb_alloc_color_planes_request_t = extern struct {
    major_opcode: u8,
    contiguous: u8,
    length: u16,
    cmap: xcb_colormap_t,
    colors: u16,
    reds: u16,
    greens: u16,
    blues: u16,
};
pub const xcb_alloc_color_planes_request_t = struct_xcb_alloc_color_planes_request_t;
pub const struct_xcb_alloc_color_planes_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    pixels_len: u16,
    pad1: [2]u8,
    red_mask: u32,
    green_mask: u32,
    blue_mask: u32,
    pad2: [8]u8,
};
pub const xcb_alloc_color_planes_reply_t = struct_xcb_alloc_color_planes_reply_t;
pub const struct_xcb_free_colors_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
    plane_mask: u32,
};
pub const xcb_free_colors_request_t = struct_xcb_free_colors_request_t;
pub const XCB_COLOR_FLAG_RED = enum_xcb_color_flag_t.XCB_COLOR_FLAG_RED;
pub const XCB_COLOR_FLAG_GREEN = enum_xcb_color_flag_t.XCB_COLOR_FLAG_GREEN;
pub const XCB_COLOR_FLAG_BLUE = enum_xcb_color_flag_t.XCB_COLOR_FLAG_BLUE;
pub const enum_xcb_color_flag_t = extern enum {
    XCB_COLOR_FLAG_RED = 1,
    XCB_COLOR_FLAG_GREEN = 2,
    XCB_COLOR_FLAG_BLUE = 4,
};
pub const xcb_color_flag_t = enum_xcb_color_flag_t;
pub const struct_xcb_coloritem_t = extern struct {
    pixel: u32,
    red: u16,
    green: u16,
    blue: u16,
    flags: u8,
    pad0: u8,
};
pub const xcb_coloritem_t = struct_xcb_coloritem_t;
pub const struct_xcb_coloritem_iterator_t = extern struct {
    data: ?[*]xcb_coloritem_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_coloritem_iterator_t = struct_xcb_coloritem_iterator_t;
pub const struct_xcb_store_colors_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
};
pub const xcb_store_colors_request_t = struct_xcb_store_colors_request_t;
pub const struct_xcb_store_named_color_request_t = extern struct {
    major_opcode: u8,
    flags: u8,
    length: u16,
    cmap: xcb_colormap_t,
    pixel: u32,
    name_len: u16,
    pad0: [2]u8,
};
pub const xcb_store_named_color_request_t = struct_xcb_store_named_color_request_t;
pub const struct_xcb_rgb_t = extern struct {
    red: u16,
    green: u16,
    blue: u16,
    pad0: [2]u8,
};
pub const xcb_rgb_t = struct_xcb_rgb_t;
pub const struct_xcb_rgb_iterator_t = extern struct {
    data: ?[*]xcb_rgb_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_rgb_iterator_t = struct_xcb_rgb_iterator_t;
pub const struct_xcb_query_colors_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_colors_cookie_t = struct_xcb_query_colors_cookie_t;
pub const struct_xcb_query_colors_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
};
pub const xcb_query_colors_request_t = struct_xcb_query_colors_request_t;
pub const struct_xcb_query_colors_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    colors_len: u16,
    pad1: [22]u8,
};
pub const xcb_query_colors_reply_t = struct_xcb_query_colors_reply_t;
pub const struct_xcb_lookup_color_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_lookup_color_cookie_t = struct_xcb_lookup_color_cookie_t;
pub const struct_xcb_lookup_color_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cmap: xcb_colormap_t,
    name_len: u16,
    pad1: [2]u8,
};
pub const xcb_lookup_color_request_t = struct_xcb_lookup_color_request_t;
pub const struct_xcb_lookup_color_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    exact_red: u16,
    exact_green: u16,
    exact_blue: u16,
    visual_red: u16,
    visual_green: u16,
    visual_blue: u16,
};
pub const xcb_lookup_color_reply_t = struct_xcb_lookup_color_reply_t;
pub const XCB_PIXMAP_NONE = enum_xcb_pixmap_enum_t.XCB_PIXMAP_NONE;
pub const enum_xcb_pixmap_enum_t = extern enum {
    XCB_PIXMAP_NONE = 0,
};
pub const xcb_pixmap_enum_t = enum_xcb_pixmap_enum_t;
pub const struct_xcb_create_cursor_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cid: xcb_cursor_t,
    source: xcb_pixmap_t,
    mask: xcb_pixmap_t,
    fore_red: u16,
    fore_green: u16,
    fore_blue: u16,
    back_red: u16,
    back_green: u16,
    back_blue: u16,
    x: u16,
    y: u16,
};
pub const xcb_create_cursor_request_t = struct_xcb_create_cursor_request_t;
pub const XCB_FONT_NONE = enum_xcb_font_enum_t.XCB_FONT_NONE;
pub const enum_xcb_font_enum_t = extern enum {
    XCB_FONT_NONE = 0,
};
pub const xcb_font_enum_t = enum_xcb_font_enum_t;
pub const struct_xcb_create_glyph_cursor_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cid: xcb_cursor_t,
    source_font: xcb_font_t,
    mask_font: xcb_font_t,
    source_char: u16,
    mask_char: u16,
    fore_red: u16,
    fore_green: u16,
    fore_blue: u16,
    back_red: u16,
    back_green: u16,
    back_blue: u16,
};
pub const xcb_create_glyph_cursor_request_t = struct_xcb_create_glyph_cursor_request_t;
pub const struct_xcb_free_cursor_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cursor: xcb_cursor_t,
};
pub const xcb_free_cursor_request_t = struct_xcb_free_cursor_request_t;
pub const struct_xcb_recolor_cursor_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    cursor: xcb_cursor_t,
    fore_red: u16,
    fore_green: u16,
    fore_blue: u16,
    back_red: u16,
    back_green: u16,
    back_blue: u16,
};
pub const xcb_recolor_cursor_request_t = struct_xcb_recolor_cursor_request_t;
pub const XCB_QUERY_SHAPE_OF_LARGEST_CURSOR = enum_xcb_query_shape_of_t.XCB_QUERY_SHAPE_OF_LARGEST_CURSOR;
pub const XCB_QUERY_SHAPE_OF_FASTEST_TILE = enum_xcb_query_shape_of_t.XCB_QUERY_SHAPE_OF_FASTEST_TILE;
pub const XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE = enum_xcb_query_shape_of_t.XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE;
pub const enum_xcb_query_shape_of_t = extern enum {
    XCB_QUERY_SHAPE_OF_LARGEST_CURSOR = 0,
    XCB_QUERY_SHAPE_OF_FASTEST_TILE = 1,
    XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE = 2,
};
pub const xcb_query_shape_of_t = enum_xcb_query_shape_of_t;
pub const struct_xcb_query_best_size_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_best_size_cookie_t = struct_xcb_query_best_size_cookie_t;
pub const struct_xcb_query_best_size_request_t = extern struct {
    major_opcode: u8,
    _class: u8,
    length: u16,
    drawable: xcb_drawable_t,
    width: u16,
    height: u16,
};
pub const xcb_query_best_size_request_t = struct_xcb_query_best_size_request_t;
pub const struct_xcb_query_best_size_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    width: u16,
    height: u16,
};
pub const xcb_query_best_size_reply_t = struct_xcb_query_best_size_reply_t;
pub const struct_xcb_query_extension_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_query_extension_cookie_t = struct_xcb_query_extension_cookie_t;
pub const struct_xcb_query_extension_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    name_len: u16,
    pad1: [2]u8,
};
pub const xcb_query_extension_request_t = struct_xcb_query_extension_request_t;
pub const xcb_query_extension_reply_t = struct_xcb_query_extension_reply_t;
pub const struct_xcb_list_extensions_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_extensions_cookie_t = struct_xcb_list_extensions_cookie_t;
pub const struct_xcb_list_extensions_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_list_extensions_request_t = struct_xcb_list_extensions_request_t;
pub const struct_xcb_list_extensions_reply_t = extern struct {
    response_type: u8,
    names_len: u8,
    sequence: u16,
    length: u32,
    pad0: [24]u8,
};
pub const xcb_list_extensions_reply_t = struct_xcb_list_extensions_reply_t;
pub const struct_xcb_change_keyboard_mapping_request_t = extern struct {
    major_opcode: u8,
    keycode_count: u8,
    length: u16,
    first_keycode: xcb_keycode_t,
    keysyms_per_keycode: u8,
    pad0: [2]u8,
};
pub const xcb_change_keyboard_mapping_request_t = struct_xcb_change_keyboard_mapping_request_t;
pub const struct_xcb_get_keyboard_mapping_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_keyboard_mapping_cookie_t = struct_xcb_get_keyboard_mapping_cookie_t;
pub const struct_xcb_get_keyboard_mapping_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    first_keycode: xcb_keycode_t,
    count: u8,
};
pub const xcb_get_keyboard_mapping_request_t = struct_xcb_get_keyboard_mapping_request_t;
pub const struct_xcb_get_keyboard_mapping_reply_t = extern struct {
    response_type: u8,
    keysyms_per_keycode: u8,
    sequence: u16,
    length: u32,
    pad0: [24]u8,
};
pub const xcb_get_keyboard_mapping_reply_t = struct_xcb_get_keyboard_mapping_reply_t;
pub const XCB_KB_KEY_CLICK_PERCENT = enum_xcb_kb_t.XCB_KB_KEY_CLICK_PERCENT;
pub const XCB_KB_BELL_PERCENT = enum_xcb_kb_t.XCB_KB_BELL_PERCENT;
pub const XCB_KB_BELL_PITCH = enum_xcb_kb_t.XCB_KB_BELL_PITCH;
pub const XCB_KB_BELL_DURATION = enum_xcb_kb_t.XCB_KB_BELL_DURATION;
pub const XCB_KB_LED = enum_xcb_kb_t.XCB_KB_LED;
pub const XCB_KB_LED_MODE = enum_xcb_kb_t.XCB_KB_LED_MODE;
pub const XCB_KB_KEY = enum_xcb_kb_t.XCB_KB_KEY;
pub const XCB_KB_AUTO_REPEAT_MODE = enum_xcb_kb_t.XCB_KB_AUTO_REPEAT_MODE;
pub const enum_xcb_kb_t = extern enum {
    XCB_KB_KEY_CLICK_PERCENT = 1,
    XCB_KB_BELL_PERCENT = 2,
    XCB_KB_BELL_PITCH = 4,
    XCB_KB_BELL_DURATION = 8,
    XCB_KB_LED = 16,
    XCB_KB_LED_MODE = 32,
    XCB_KB_KEY = 64,
    XCB_KB_AUTO_REPEAT_MODE = 128,
};
pub const xcb_kb_t = enum_xcb_kb_t;
pub const XCB_LED_MODE_OFF = enum_xcb_led_mode_t.XCB_LED_MODE_OFF;
pub const XCB_LED_MODE_ON = enum_xcb_led_mode_t.XCB_LED_MODE_ON;
pub const enum_xcb_led_mode_t = extern enum {
    XCB_LED_MODE_OFF = 0,
    XCB_LED_MODE_ON = 1,
};
pub const xcb_led_mode_t = enum_xcb_led_mode_t;
pub const XCB_AUTO_REPEAT_MODE_OFF = enum_xcb_auto_repeat_mode_t.XCB_AUTO_REPEAT_MODE_OFF;
pub const XCB_AUTO_REPEAT_MODE_ON = enum_xcb_auto_repeat_mode_t.XCB_AUTO_REPEAT_MODE_ON;
pub const XCB_AUTO_REPEAT_MODE_DEFAULT = enum_xcb_auto_repeat_mode_t.XCB_AUTO_REPEAT_MODE_DEFAULT;
pub const enum_xcb_auto_repeat_mode_t = extern enum {
    XCB_AUTO_REPEAT_MODE_OFF = 0,
    XCB_AUTO_REPEAT_MODE_ON = 1,
    XCB_AUTO_REPEAT_MODE_DEFAULT = 2,
};
pub const xcb_auto_repeat_mode_t = enum_xcb_auto_repeat_mode_t;
pub const struct_xcb_change_keyboard_control_value_list_t = extern struct {
    key_click_percent: i32,
    bell_percent: i32,
    bell_pitch: i32,
    bell_duration: i32,
    led: u32,
    led_mode: u32,
    key: xcb_keycode32_t,
    auto_repeat_mode: u32,
};
pub const xcb_change_keyboard_control_value_list_t = struct_xcb_change_keyboard_control_value_list_t;
pub const struct_xcb_change_keyboard_control_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    value_mask: u32,
};
pub const xcb_change_keyboard_control_request_t = struct_xcb_change_keyboard_control_request_t;
pub const struct_xcb_get_keyboard_control_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_keyboard_control_cookie_t = struct_xcb_get_keyboard_control_cookie_t;
pub const struct_xcb_get_keyboard_control_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_keyboard_control_request_t = struct_xcb_get_keyboard_control_request_t;
pub const struct_xcb_get_keyboard_control_reply_t = extern struct {
    response_type: u8,
    global_auto_repeat: u8,
    sequence: u16,
    length: u32,
    led_mask: u32,
    key_click_percent: u8,
    bell_percent: u8,
    bell_pitch: u16,
    bell_duration: u16,
    pad0: [2]u8,
    auto_repeats: [32]u8,
};
pub const xcb_get_keyboard_control_reply_t = struct_xcb_get_keyboard_control_reply_t;
pub const struct_xcb_bell_request_t = extern struct {
    major_opcode: u8,
    percent: i8,
    length: u16,
};
pub const xcb_bell_request_t = struct_xcb_bell_request_t;
pub const struct_xcb_change_pointer_control_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    acceleration_numerator: i16,
    acceleration_denominator: i16,
    threshold: i16,
    do_acceleration: u8,
    do_threshold: u8,
};
pub const xcb_change_pointer_control_request_t = struct_xcb_change_pointer_control_request_t;
pub const struct_xcb_get_pointer_control_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_pointer_control_cookie_t = struct_xcb_get_pointer_control_cookie_t;
pub const struct_xcb_get_pointer_control_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_pointer_control_request_t = struct_xcb_get_pointer_control_request_t;
pub const struct_xcb_get_pointer_control_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    acceleration_numerator: u16,
    acceleration_denominator: u16,
    threshold: u16,
    pad1: [18]u8,
};
pub const xcb_get_pointer_control_reply_t = struct_xcb_get_pointer_control_reply_t;
pub const XCB_BLANKING_NOT_PREFERRED = enum_xcb_blanking_t.XCB_BLANKING_NOT_PREFERRED;
pub const XCB_BLANKING_PREFERRED = enum_xcb_blanking_t.XCB_BLANKING_PREFERRED;
pub const XCB_BLANKING_DEFAULT = enum_xcb_blanking_t.XCB_BLANKING_DEFAULT;
pub const enum_xcb_blanking_t = extern enum {
    XCB_BLANKING_NOT_PREFERRED = 0,
    XCB_BLANKING_PREFERRED = 1,
    XCB_BLANKING_DEFAULT = 2,
};
pub const xcb_blanking_t = enum_xcb_blanking_t;
pub const XCB_EXPOSURES_NOT_ALLOWED = enum_xcb_exposures_t.XCB_EXPOSURES_NOT_ALLOWED;
pub const XCB_EXPOSURES_ALLOWED = enum_xcb_exposures_t.XCB_EXPOSURES_ALLOWED;
pub const XCB_EXPOSURES_DEFAULT = enum_xcb_exposures_t.XCB_EXPOSURES_DEFAULT;
pub const enum_xcb_exposures_t = extern enum {
    XCB_EXPOSURES_NOT_ALLOWED = 0,
    XCB_EXPOSURES_ALLOWED = 1,
    XCB_EXPOSURES_DEFAULT = 2,
};
pub const xcb_exposures_t = enum_xcb_exposures_t;
pub const struct_xcb_set_screen_saver_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    timeout: i16,
    interval: i16,
    prefer_blanking: u8,
    allow_exposures: u8,
};
pub const xcb_set_screen_saver_request_t = struct_xcb_set_screen_saver_request_t;
pub const struct_xcb_get_screen_saver_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_screen_saver_cookie_t = struct_xcb_get_screen_saver_cookie_t;
pub const struct_xcb_get_screen_saver_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_screen_saver_request_t = struct_xcb_get_screen_saver_request_t;
pub const struct_xcb_get_screen_saver_reply_t = extern struct {
    response_type: u8,
    pad0: u8,
    sequence: u16,
    length: u32,
    timeout: u16,
    interval: u16,
    prefer_blanking: u8,
    allow_exposures: u8,
    pad1: [18]u8,
};
pub const xcb_get_screen_saver_reply_t = struct_xcb_get_screen_saver_reply_t;
pub const XCB_HOST_MODE_INSERT = enum_xcb_host_mode_t.XCB_HOST_MODE_INSERT;
pub const XCB_HOST_MODE_DELETE = enum_xcb_host_mode_t.XCB_HOST_MODE_DELETE;
pub const enum_xcb_host_mode_t = extern enum {
    XCB_HOST_MODE_INSERT = 0,
    XCB_HOST_MODE_DELETE = 1,
};
pub const xcb_host_mode_t = enum_xcb_host_mode_t;
pub const XCB_FAMILY_INTERNET = enum_xcb_family_t.XCB_FAMILY_INTERNET;
pub const XCB_FAMILY_DECNET = enum_xcb_family_t.XCB_FAMILY_DECNET;
pub const XCB_FAMILY_CHAOS = enum_xcb_family_t.XCB_FAMILY_CHAOS;
pub const XCB_FAMILY_SERVER_INTERPRETED = enum_xcb_family_t.XCB_FAMILY_SERVER_INTERPRETED;
pub const XCB_FAMILY_INTERNET_6 = enum_xcb_family_t.XCB_FAMILY_INTERNET_6;
pub const enum_xcb_family_t = extern enum {
    XCB_FAMILY_INTERNET = 0,
    XCB_FAMILY_DECNET = 1,
    XCB_FAMILY_CHAOS = 2,
    XCB_FAMILY_SERVER_INTERPRETED = 5,
    XCB_FAMILY_INTERNET_6 = 6,
};
pub const xcb_family_t = enum_xcb_family_t;
pub const struct_xcb_change_hosts_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
    family: u8,
    pad0: u8,
    address_len: u16,
};
pub const xcb_change_hosts_request_t = struct_xcb_change_hosts_request_t;
pub const struct_xcb_host_t = extern struct {
    family: u8,
    pad0: u8,
    address_len: u16,
};
pub const xcb_host_t = struct_xcb_host_t;
pub const struct_xcb_host_iterator_t = extern struct {
    data: ?[*]xcb_host_t,
    rem: c_int,
    index: c_int,
};
pub const xcb_host_iterator_t = struct_xcb_host_iterator_t;
pub const struct_xcb_list_hosts_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_list_hosts_cookie_t = struct_xcb_list_hosts_cookie_t;
pub const struct_xcb_list_hosts_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_list_hosts_request_t = struct_xcb_list_hosts_request_t;
pub const struct_xcb_list_hosts_reply_t = extern struct {
    response_type: u8,
    mode: u8,
    sequence: u16,
    length: u32,
    hosts_len: u16,
    pad0: [22]u8,
};
pub const xcb_list_hosts_reply_t = struct_xcb_list_hosts_reply_t;
pub const XCB_ACCESS_CONTROL_DISABLE = enum_xcb_access_control_t.XCB_ACCESS_CONTROL_DISABLE;
pub const XCB_ACCESS_CONTROL_ENABLE = enum_xcb_access_control_t.XCB_ACCESS_CONTROL_ENABLE;
pub const enum_xcb_access_control_t = extern enum {
    XCB_ACCESS_CONTROL_DISABLE = 0,
    XCB_ACCESS_CONTROL_ENABLE = 1,
};
pub const xcb_access_control_t = enum_xcb_access_control_t;
pub const struct_xcb_set_access_control_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
};
pub const xcb_set_access_control_request_t = struct_xcb_set_access_control_request_t;
pub const XCB_CLOSE_DOWN_DESTROY_ALL = enum_xcb_close_down_t.XCB_CLOSE_DOWN_DESTROY_ALL;
pub const XCB_CLOSE_DOWN_RETAIN_PERMANENT = enum_xcb_close_down_t.XCB_CLOSE_DOWN_RETAIN_PERMANENT;
pub const XCB_CLOSE_DOWN_RETAIN_TEMPORARY = enum_xcb_close_down_t.XCB_CLOSE_DOWN_RETAIN_TEMPORARY;
pub const enum_xcb_close_down_t = extern enum {
    XCB_CLOSE_DOWN_DESTROY_ALL = 0,
    XCB_CLOSE_DOWN_RETAIN_PERMANENT = 1,
    XCB_CLOSE_DOWN_RETAIN_TEMPORARY = 2,
};
pub const xcb_close_down_t = enum_xcb_close_down_t;
pub const struct_xcb_set_close_down_mode_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
};
pub const xcb_set_close_down_mode_request_t = struct_xcb_set_close_down_mode_request_t;
pub const XCB_KILL_ALL_TEMPORARY = enum_xcb_kill_t.XCB_KILL_ALL_TEMPORARY;
pub const enum_xcb_kill_t = extern enum {
    XCB_KILL_ALL_TEMPORARY = 0,
};
pub const xcb_kill_t = enum_xcb_kill_t;
pub const struct_xcb_kill_client_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    resource: u32,
};
pub const xcb_kill_client_request_t = struct_xcb_kill_client_request_t;
pub const struct_xcb_rotate_properties_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
    window: xcb_window_t,
    atoms_len: u16,
    delta: i16,
};
pub const xcb_rotate_properties_request_t = struct_xcb_rotate_properties_request_t;
pub const XCB_SCREEN_SAVER_RESET = enum_xcb_screen_saver_t.XCB_SCREEN_SAVER_RESET;
pub const XCB_SCREEN_SAVER_ACTIVE = enum_xcb_screen_saver_t.XCB_SCREEN_SAVER_ACTIVE;
pub const enum_xcb_screen_saver_t = extern enum {
    XCB_SCREEN_SAVER_RESET = 0,
    XCB_SCREEN_SAVER_ACTIVE = 1,
};
pub const xcb_screen_saver_t = enum_xcb_screen_saver_t;
pub const struct_xcb_force_screen_saver_request_t = extern struct {
    major_opcode: u8,
    mode: u8,
    length: u16,
};
pub const xcb_force_screen_saver_request_t = struct_xcb_force_screen_saver_request_t;
pub const XCB_MAPPING_STATUS_SUCCESS = enum_xcb_mapping_status_t.XCB_MAPPING_STATUS_SUCCESS;
pub const XCB_MAPPING_STATUS_BUSY = enum_xcb_mapping_status_t.XCB_MAPPING_STATUS_BUSY;
pub const XCB_MAPPING_STATUS_FAILURE = enum_xcb_mapping_status_t.XCB_MAPPING_STATUS_FAILURE;
pub const enum_xcb_mapping_status_t = extern enum {
    XCB_MAPPING_STATUS_SUCCESS = 0,
    XCB_MAPPING_STATUS_BUSY = 1,
    XCB_MAPPING_STATUS_FAILURE = 2,
};
pub const xcb_mapping_status_t = enum_xcb_mapping_status_t;
pub const struct_xcb_set_pointer_mapping_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_set_pointer_mapping_cookie_t = struct_xcb_set_pointer_mapping_cookie_t;
pub const struct_xcb_set_pointer_mapping_request_t = extern struct {
    major_opcode: u8,
    map_len: u8,
    length: u16,
};
pub const xcb_set_pointer_mapping_request_t = struct_xcb_set_pointer_mapping_request_t;
pub const struct_xcb_set_pointer_mapping_reply_t = extern struct {
    response_type: u8,
    status: u8,
    sequence: u16,
    length: u32,
};
pub const xcb_set_pointer_mapping_reply_t = struct_xcb_set_pointer_mapping_reply_t;
pub const struct_xcb_get_pointer_mapping_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_pointer_mapping_cookie_t = struct_xcb_get_pointer_mapping_cookie_t;
pub const struct_xcb_get_pointer_mapping_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_pointer_mapping_request_t = struct_xcb_get_pointer_mapping_request_t;
pub const struct_xcb_get_pointer_mapping_reply_t = extern struct {
    response_type: u8,
    map_len: u8,
    sequence: u16,
    length: u32,
    pad0: [24]u8,
};
pub const xcb_get_pointer_mapping_reply_t = struct_xcb_get_pointer_mapping_reply_t;
pub const XCB_MAP_INDEX_SHIFT = enum_xcb_map_index_t.XCB_MAP_INDEX_SHIFT;
pub const XCB_MAP_INDEX_LOCK = enum_xcb_map_index_t.XCB_MAP_INDEX_LOCK;
pub const XCB_MAP_INDEX_CONTROL = enum_xcb_map_index_t.XCB_MAP_INDEX_CONTROL;
pub const XCB_MAP_INDEX_1 = enum_xcb_map_index_t.XCB_MAP_INDEX_1;
pub const XCB_MAP_INDEX_2 = enum_xcb_map_index_t.XCB_MAP_INDEX_2;
pub const XCB_MAP_INDEX_3 = enum_xcb_map_index_t.XCB_MAP_INDEX_3;
pub const XCB_MAP_INDEX_4 = enum_xcb_map_index_t.XCB_MAP_INDEX_4;
pub const XCB_MAP_INDEX_5 = enum_xcb_map_index_t.XCB_MAP_INDEX_5;
pub const enum_xcb_map_index_t = extern enum {
    XCB_MAP_INDEX_SHIFT = 0,
    XCB_MAP_INDEX_LOCK = 1,
    XCB_MAP_INDEX_CONTROL = 2,
    XCB_MAP_INDEX_1 = 3,
    XCB_MAP_INDEX_2 = 4,
    XCB_MAP_INDEX_3 = 5,
    XCB_MAP_INDEX_4 = 6,
    XCB_MAP_INDEX_5 = 7,
};
pub const xcb_map_index_t = enum_xcb_map_index_t;
pub const struct_xcb_set_modifier_mapping_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_set_modifier_mapping_cookie_t = struct_xcb_set_modifier_mapping_cookie_t;
pub const struct_xcb_set_modifier_mapping_request_t = extern struct {
    major_opcode: u8,
    keycodes_per_modifier: u8,
    length: u16,
};
pub const xcb_set_modifier_mapping_request_t = struct_xcb_set_modifier_mapping_request_t;
pub const struct_xcb_set_modifier_mapping_reply_t = extern struct {
    response_type: u8,
    status: u8,
    sequence: u16,
    length: u32,
};
pub const xcb_set_modifier_mapping_reply_t = struct_xcb_set_modifier_mapping_reply_t;
pub const struct_xcb_get_modifier_mapping_cookie_t = extern struct {
    sequence: c_uint,
};
pub const xcb_get_modifier_mapping_cookie_t = struct_xcb_get_modifier_mapping_cookie_t;
pub const struct_xcb_get_modifier_mapping_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_get_modifier_mapping_request_t = struct_xcb_get_modifier_mapping_request_t;
pub const struct_xcb_get_modifier_mapping_reply_t = extern struct {
    response_type: u8,
    keycodes_per_modifier: u8,
    sequence: u16,
    length: u32,
    pad0: [24]u8,
};
pub const xcb_get_modifier_mapping_reply_t = struct_xcb_get_modifier_mapping_reply_t;
pub const struct_xcb_no_operation_request_t = extern struct {
    major_opcode: u8,
    pad0: u8,
    length: u16,
};
pub const xcb_no_operation_request_t = struct_xcb_no_operation_request_t;
pub extern fn xcb_char2b_next(i: ?[*]xcb_char2b_iterator_t) void;
pub extern fn xcb_char2b_end(i: xcb_char2b_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_window_next(i: ?[*]xcb_window_iterator_t) void;
pub extern fn xcb_window_end(i: xcb_window_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_pixmap_next(i: ?[*]xcb_pixmap_iterator_t) void;
pub extern fn xcb_pixmap_end(i: xcb_pixmap_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_cursor_next(i: ?[*]xcb_cursor_iterator_t) void;
pub extern fn xcb_cursor_end(i: xcb_cursor_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_font_next(i: ?[*]xcb_font_iterator_t) void;
pub extern fn xcb_font_end(i: xcb_font_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_gcontext_next(i: ?[*]xcb_gcontext_iterator_t) void;
pub extern fn xcb_gcontext_end(i: xcb_gcontext_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_colormap_next(i: ?[*]xcb_colormap_iterator_t) void;
pub extern fn xcb_colormap_end(i: xcb_colormap_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_atom_next(i: ?[*]xcb_atom_iterator_t) void;
pub extern fn xcb_atom_end(i: xcb_atom_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_drawable_next(i: ?[*]xcb_drawable_iterator_t) void;
pub extern fn xcb_drawable_end(i: xcb_drawable_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_fontable_next(i: ?[*]xcb_fontable_iterator_t) void;
pub extern fn xcb_fontable_end(i: xcb_fontable_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_bool32_next(i: ?[*]xcb_bool32_iterator_t) void;
pub extern fn xcb_bool32_end(i: xcb_bool32_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_visualid_next(i: ?[*]xcb_visualid_iterator_t) void;
pub extern fn xcb_visualid_end(i: xcb_visualid_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_timestamp_next(i: ?[*]xcb_timestamp_iterator_t) void;
pub extern fn xcb_timestamp_end(i: xcb_timestamp_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_keysym_next(i: ?[*]xcb_keysym_iterator_t) void;
pub extern fn xcb_keysym_end(i: xcb_keysym_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_keycode_next(i: ?[*]xcb_keycode_iterator_t) void;
pub extern fn xcb_keycode_end(i: xcb_keycode_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_keycode32_next(i: ?[*]xcb_keycode32_iterator_t) void;
pub extern fn xcb_keycode32_end(i: xcb_keycode32_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_button_next(i: ?[*]xcb_button_iterator_t) void;
pub extern fn xcb_button_end(i: xcb_button_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_point_next(i: ?[*]xcb_point_iterator_t) void;
pub extern fn xcb_point_end(i: xcb_point_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_rectangle_next(i: ?[*]xcb_rectangle_iterator_t) void;
pub extern fn xcb_rectangle_end(i: xcb_rectangle_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_arc_next(i: ?[*]xcb_arc_iterator_t) void;
pub extern fn xcb_arc_end(i: xcb_arc_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_format_next(i: ?[*]xcb_format_iterator_t) void;
pub extern fn xcb_format_end(i: xcb_format_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_visualtype_next(i: ?[*]xcb_visualtype_iterator_t) void;
pub extern fn xcb_visualtype_end(i: xcb_visualtype_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_depth_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_depth_visuals(R: ?[*]const xcb_depth_t) ?[*]xcb_visualtype_t;
pub extern fn xcb_depth_visuals_length(R: ?[*]const xcb_depth_t) c_int;
pub extern fn xcb_depth_visuals_iterator(R: ?[*]const xcb_depth_t) xcb_visualtype_iterator_t;
pub extern fn xcb_depth_next(i: ?[*]xcb_depth_iterator_t) void;
pub extern fn xcb_depth_end(i: xcb_depth_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_screen_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_screen_allowed_depths_length(R: ?[*]const xcb_screen_t) c_int;
pub extern fn xcb_screen_allowed_depths_iterator(R: ?[*]const xcb_screen_t) xcb_depth_iterator_t;
pub extern fn xcb_screen_next(i: ?[*]xcb_screen_iterator_t) void;
pub extern fn xcb_screen_end(i: xcb_screen_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_request_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_setup_request_authorization_protocol_name(R: ?[*]const xcb_setup_request_t) ?[*]u8;
pub extern fn xcb_setup_request_authorization_protocol_name_length(R: ?[*]const xcb_setup_request_t) c_int;
pub extern fn xcb_setup_request_authorization_protocol_name_end(R: ?[*]const xcb_setup_request_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_request_authorization_protocol_data(R: ?[*]const xcb_setup_request_t) ?[*]u8;
pub extern fn xcb_setup_request_authorization_protocol_data_length(R: ?[*]const xcb_setup_request_t) c_int;
pub extern fn xcb_setup_request_authorization_protocol_data_end(R: ?[*]const xcb_setup_request_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_request_next(i: ?[*]xcb_setup_request_iterator_t) void;
pub extern fn xcb_setup_request_end(i: xcb_setup_request_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_failed_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_setup_failed_reason(R: ?[*]const xcb_setup_failed_t) ?[*]u8;
pub extern fn xcb_setup_failed_reason_length(R: ?[*]const xcb_setup_failed_t) c_int;
pub extern fn xcb_setup_failed_reason_end(R: ?[*]const xcb_setup_failed_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_failed_next(i: ?[*]xcb_setup_failed_iterator_t) void;
pub extern fn xcb_setup_failed_end(i: xcb_setup_failed_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_authenticate_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_setup_authenticate_reason(R: ?[*]const xcb_setup_authenticate_t) ?[*]u8;
pub extern fn xcb_setup_authenticate_reason_length(R: ?[*]const xcb_setup_authenticate_t) c_int;
pub extern fn xcb_setup_authenticate_reason_end(R: ?[*]const xcb_setup_authenticate_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_authenticate_next(i: ?[*]xcb_setup_authenticate_iterator_t) void;
pub extern fn xcb_setup_authenticate_end(i: xcb_setup_authenticate_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_setup_vendor(R: ?[*]const xcb_setup_t) ?[*]u8;
pub extern fn xcb_setup_vendor_length(R: ?[*]const xcb_setup_t) c_int;
pub extern fn xcb_setup_vendor_end(R: ?[*]const xcb_setup_t) xcb_generic_iterator_t;
pub extern fn xcb_setup_pixmap_formats(R: ?[*]const xcb_setup_t) ?[*]xcb_format_t;
pub extern fn xcb_setup_pixmap_formats_length(R: ?[*]const xcb_setup_t) c_int;
pub extern fn xcb_setup_pixmap_formats_iterator(R: ?[*]const xcb_setup_t) xcb_format_iterator_t;
pub extern fn xcb_setup_roots_length(R: ?[*]const xcb_setup_t) c_int;
pub extern fn xcb_setup_roots_iterator(R: ?[*]const xcb_setup_t) xcb_screen_iterator_t;
pub extern fn xcb_setup_next(i: ?[*]xcb_setup_iterator_t) void;
pub extern fn xcb_setup_end(i: xcb_setup_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_client_message_data_next(i: ?[*]xcb_client_message_data_iterator_t) void;
pub extern fn xcb_client_message_data_end(i: xcb_client_message_data_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_create_window_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u32, _aux: ?[*]const xcb_create_window_value_list_t) c_int;
pub extern fn xcb_create_window_value_list_unpack(_buffer: ?*const c_void, value_mask: u32, _aux: ?[*]xcb_create_window_value_list_t) c_int;
pub extern fn xcb_create_window_value_list_sizeof(_buffer: ?*const c_void, value_mask: u32) c_int;
pub extern fn xcb_create_window_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_create_window_checked(c: ?*xcb_connection_t, depth: u8, wid: xcb_window_t, parent: xcb_window_t, x: i16, y: i16, width: u16, height: u16, border_width: u16, _class: u16, visual: xcb_visualid_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_create_window(c: ?*xcb_connection_t, depth: u8, wid: xcb_window_t, parent: xcb_window_t, x: i16, y: i16, width: u16, height: u16, border_width: u16, _class: u16, visual: xcb_visualid_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_create_window_aux_checked(c: ?*xcb_connection_t, depth: u8, wid: xcb_window_t, parent: xcb_window_t, x: i16, y: i16, width: u16, height: u16, border_width: u16, _class: u16, visual: xcb_visualid_t, value_mask: u32, value_list: ?[*]const xcb_create_window_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_create_window_aux(c: ?*xcb_connection_t, depth: u8, wid: xcb_window_t, parent: xcb_window_t, x: i16, y: i16, width: u16, height: u16, border_width: u16, _class: u16, visual: xcb_visualid_t, value_mask: u32, value_list: ?[*]const xcb_create_window_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_create_window_value_list(R: ?[*]const xcb_create_window_request_t) ?*c_void;
pub extern fn xcb_change_window_attributes_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u32, _aux: ?[*]const xcb_change_window_attributes_value_list_t) c_int;
pub extern fn xcb_change_window_attributes_value_list_unpack(_buffer: ?*const c_void, value_mask: u32, _aux: ?[*]xcb_change_window_attributes_value_list_t) c_int;
pub extern fn xcb_change_window_attributes_value_list_sizeof(_buffer: ?*const c_void, value_mask: u32) c_int;
pub extern fn xcb_change_window_attributes_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_window_attributes_checked(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_window_attributes(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_window_attributes_aux_checked(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u32, value_list: ?[*]const xcb_change_window_attributes_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_window_attributes_aux(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u32, value_list: ?[*]const xcb_change_window_attributes_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_window_attributes_value_list(R: ?[*]const xcb_change_window_attributes_request_t) ?*c_void;
pub extern fn xcb_get_window_attributes(c: ?*xcb_connection_t, window: xcb_window_t) xcb_get_window_attributes_cookie_t;
pub extern fn xcb_get_window_attributes_unchecked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_get_window_attributes_cookie_t;
pub extern fn xcb_get_window_attributes_reply(c: ?*xcb_connection_t, cookie: xcb_get_window_attributes_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_window_attributes_reply_t;
pub extern fn xcb_destroy_window_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_destroy_window(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_destroy_subwindows_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_destroy_subwindows(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_change_save_set_checked(c: ?*xcb_connection_t, mode: u8, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_change_save_set(c: ?*xcb_connection_t, mode: u8, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_reparent_window_checked(c: ?*xcb_connection_t, window: xcb_window_t, parent: xcb_window_t, x: i16, y: i16) xcb_void_cookie_t;
pub extern fn xcb_reparent_window(c: ?*xcb_connection_t, window: xcb_window_t, parent: xcb_window_t, x: i16, y: i16) xcb_void_cookie_t;
pub extern fn xcb_map_window_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_map_window(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_map_subwindows_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_map_subwindows(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_unmap_window_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_unmap_window(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_unmap_subwindows_checked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_unmap_subwindows(c: ?*xcb_connection_t, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_configure_window_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u16, _aux: ?[*]const xcb_configure_window_value_list_t) c_int;
pub extern fn xcb_configure_window_value_list_unpack(_buffer: ?*const c_void, value_mask: u16, _aux: ?[*]xcb_configure_window_value_list_t) c_int;
pub extern fn xcb_configure_window_value_list_sizeof(_buffer: ?*const c_void, value_mask: u16) c_int;
pub extern fn xcb_configure_window_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_configure_window_checked(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u16, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_configure_window(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u16, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_configure_window_aux_checked(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u16, value_list: ?[*]const xcb_configure_window_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_configure_window_aux(c: ?*xcb_connection_t, window: xcb_window_t, value_mask: u16, value_list: ?[*]const xcb_configure_window_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_configure_window_value_list(R: ?[*]const xcb_configure_window_request_t) ?*c_void;
pub extern fn xcb_circulate_window_checked(c: ?*xcb_connection_t, direction: u8, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_circulate_window(c: ?*xcb_connection_t, direction: u8, window: xcb_window_t) xcb_void_cookie_t;
pub extern fn xcb_get_geometry(c: ?*xcb_connection_t, drawable: xcb_drawable_t) xcb_get_geometry_cookie_t;
pub extern fn xcb_get_geometry_unchecked(c: ?*xcb_connection_t, drawable: xcb_drawable_t) xcb_get_geometry_cookie_t;
pub extern fn xcb_get_geometry_reply(c: ?*xcb_connection_t, cookie: xcb_get_geometry_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_geometry_reply_t;
pub extern fn xcb_query_tree_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_query_tree(c: ?*xcb_connection_t, window: xcb_window_t) xcb_query_tree_cookie_t;
pub extern fn xcb_query_tree_unchecked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_query_tree_cookie_t;
pub extern fn xcb_query_tree_children(R: ?[*]const xcb_query_tree_reply_t) ?[*]xcb_window_t;
pub extern fn xcb_query_tree_children_length(R: ?[*]const xcb_query_tree_reply_t) c_int;
pub extern fn xcb_query_tree_children_end(R: ?[*]const xcb_query_tree_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_query_tree_reply(c: ?*xcb_connection_t, cookie: xcb_query_tree_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_tree_reply_t;
pub extern fn xcb_intern_atom_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_intern_atom(c: ?*xcb_connection_t, only_if_exists: u8, name_len: u16, name: ?[*]const u8) xcb_intern_atom_cookie_t;
pub extern fn xcb_intern_atom_unchecked(c: ?*xcb_connection_t, only_if_exists: u8, name_len: u16, name: ?[*]const u8) xcb_intern_atom_cookie_t;
pub extern fn xcb_intern_atom_reply(c: ?*xcb_connection_t, cookie: xcb_intern_atom_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_intern_atom_reply_t;
pub extern fn xcb_get_atom_name_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_atom_name(c: ?*xcb_connection_t, atom: xcb_atom_t) xcb_get_atom_name_cookie_t;
pub extern fn xcb_get_atom_name_unchecked(c: ?*xcb_connection_t, atom: xcb_atom_t) xcb_get_atom_name_cookie_t;
pub extern fn xcb_get_atom_name_name(R: ?[*]const xcb_get_atom_name_reply_t) ?[*]u8;
pub extern fn xcb_get_atom_name_name_length(R: ?[*]const xcb_get_atom_name_reply_t) c_int;
pub extern fn xcb_get_atom_name_name_end(R: ?[*]const xcb_get_atom_name_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_atom_name_reply(c: ?*xcb_connection_t, cookie: xcb_get_atom_name_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_atom_name_reply_t;
pub extern fn xcb_change_property_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_property_checked(c: ?*xcb_connection_t, mode: u8, window: xcb_window_t, property: xcb_atom_t, type_0: xcb_atom_t, format: u8, data_len: u32, data: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_property(c: ?*xcb_connection_t, mode: u8, window: xcb_window_t, property: xcb_atom_t, type_0: xcb_atom_t, format: u8, data_len: u32, data: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_property_data(R: ?[*]const xcb_change_property_request_t) ?*c_void;
pub extern fn xcb_change_property_data_length(R: ?[*]const xcb_change_property_request_t) c_int;
pub extern fn xcb_change_property_data_end(R: ?[*]const xcb_change_property_request_t) xcb_generic_iterator_t;
pub extern fn xcb_delete_property_checked(c: ?*xcb_connection_t, window: xcb_window_t, property: xcb_atom_t) xcb_void_cookie_t;
pub extern fn xcb_delete_property(c: ?*xcb_connection_t, window: xcb_window_t, property: xcb_atom_t) xcb_void_cookie_t;
pub extern fn xcb_get_property_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_property(c: ?*xcb_connection_t, _delete: u8, window: xcb_window_t, property: xcb_atom_t, type_0: xcb_atom_t, long_offset: u32, long_length: u32) xcb_get_property_cookie_t;
pub extern fn xcb_get_property_unchecked(c: ?*xcb_connection_t, _delete: u8, window: xcb_window_t, property: xcb_atom_t, type_0: xcb_atom_t, long_offset: u32, long_length: u32) xcb_get_property_cookie_t;
pub extern fn xcb_get_property_value(R: ?[*]const xcb_get_property_reply_t) ?*c_void;
pub extern fn xcb_get_property_value_length(R: ?[*]const xcb_get_property_reply_t) c_int;
pub extern fn xcb_get_property_value_end(R: ?[*]const xcb_get_property_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_property_reply(c: ?*xcb_connection_t, cookie: xcb_get_property_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_property_reply_t;
pub extern fn xcb_list_properties_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_properties(c: ?*xcb_connection_t, window: xcb_window_t) xcb_list_properties_cookie_t;
pub extern fn xcb_list_properties_unchecked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_list_properties_cookie_t;
pub extern fn xcb_list_properties_atoms(R: ?[*]const xcb_list_properties_reply_t) ?[*]xcb_atom_t;
pub extern fn xcb_list_properties_atoms_length(R: ?[*]const xcb_list_properties_reply_t) c_int;
pub extern fn xcb_list_properties_atoms_end(R: ?[*]const xcb_list_properties_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_list_properties_reply(c: ?*xcb_connection_t, cookie: xcb_list_properties_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_properties_reply_t;
pub extern fn xcb_set_selection_owner_checked(c: ?*xcb_connection_t, owner: xcb_window_t, selection: xcb_atom_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_set_selection_owner(c: ?*xcb_connection_t, owner: xcb_window_t, selection: xcb_atom_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_get_selection_owner(c: ?*xcb_connection_t, selection: xcb_atom_t) xcb_get_selection_owner_cookie_t;
pub extern fn xcb_get_selection_owner_unchecked(c: ?*xcb_connection_t, selection: xcb_atom_t) xcb_get_selection_owner_cookie_t;
pub extern fn xcb_get_selection_owner_reply(c: ?*xcb_connection_t, cookie: xcb_get_selection_owner_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_selection_owner_reply_t;
pub extern fn xcb_convert_selection_checked(c: ?*xcb_connection_t, requestor: xcb_window_t, selection: xcb_atom_t, target: xcb_atom_t, property: xcb_atom_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_convert_selection(c: ?*xcb_connection_t, requestor: xcb_window_t, selection: xcb_atom_t, target: xcb_atom_t, property: xcb_atom_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_send_event_checked(c: ?*xcb_connection_t, propagate: u8, destination: xcb_window_t, event_mask: u32, event: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_send_event(c: ?*xcb_connection_t, propagate: u8, destination: xcb_window_t, event_mask: u32, event: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_grab_pointer(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, event_mask: u16, pointer_mode: u8, keyboard_mode: u8, confine_to: xcb_window_t, cursor: xcb_cursor_t, time_0: xcb_timestamp_t) xcb_grab_pointer_cookie_t;
pub extern fn xcb_grab_pointer_unchecked(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, event_mask: u16, pointer_mode: u8, keyboard_mode: u8, confine_to: xcb_window_t, cursor: xcb_cursor_t, time_0: xcb_timestamp_t) xcb_grab_pointer_cookie_t;
pub extern fn xcb_grab_pointer_reply(c: ?*xcb_connection_t, cookie: xcb_grab_pointer_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_grab_pointer_reply_t;
pub extern fn xcb_ungrab_pointer_checked(c: ?*xcb_connection_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_ungrab_pointer(c: ?*xcb_connection_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_grab_button_checked(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, event_mask: u16, pointer_mode: u8, keyboard_mode: u8, confine_to: xcb_window_t, cursor: xcb_cursor_t, button: u8, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_grab_button(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, event_mask: u16, pointer_mode: u8, keyboard_mode: u8, confine_to: xcb_window_t, cursor: xcb_cursor_t, button: u8, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_ungrab_button_checked(c: ?*xcb_connection_t, button: u8, grab_window: xcb_window_t, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_ungrab_button(c: ?*xcb_connection_t, button: u8, grab_window: xcb_window_t, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_change_active_pointer_grab_checked(c: ?*xcb_connection_t, cursor: xcb_cursor_t, time_0: xcb_timestamp_t, event_mask: u16) xcb_void_cookie_t;
pub extern fn xcb_change_active_pointer_grab(c: ?*xcb_connection_t, cursor: xcb_cursor_t, time_0: xcb_timestamp_t, event_mask: u16) xcb_void_cookie_t;
pub extern fn xcb_grab_keyboard(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, time_0: xcb_timestamp_t, pointer_mode: u8, keyboard_mode: u8) xcb_grab_keyboard_cookie_t;
pub extern fn xcb_grab_keyboard_unchecked(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, time_0: xcb_timestamp_t, pointer_mode: u8, keyboard_mode: u8) xcb_grab_keyboard_cookie_t;
pub extern fn xcb_grab_keyboard_reply(c: ?*xcb_connection_t, cookie: xcb_grab_keyboard_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_grab_keyboard_reply_t;
pub extern fn xcb_ungrab_keyboard_checked(c: ?*xcb_connection_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_ungrab_keyboard(c: ?*xcb_connection_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_grab_key_checked(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, modifiers: u16, key: xcb_keycode_t, pointer_mode: u8, keyboard_mode: u8) xcb_void_cookie_t;
pub extern fn xcb_grab_key(c: ?*xcb_connection_t, owner_events: u8, grab_window: xcb_window_t, modifiers: u16, key: xcb_keycode_t, pointer_mode: u8, keyboard_mode: u8) xcb_void_cookie_t;
pub extern fn xcb_ungrab_key_checked(c: ?*xcb_connection_t, key: xcb_keycode_t, grab_window: xcb_window_t, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_ungrab_key(c: ?*xcb_connection_t, key: xcb_keycode_t, grab_window: xcb_window_t, modifiers: u16) xcb_void_cookie_t;
pub extern fn xcb_allow_events_checked(c: ?*xcb_connection_t, mode: u8, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_allow_events(c: ?*xcb_connection_t, mode: u8, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_grab_server_checked(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub extern fn xcb_grab_server(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub extern fn xcb_ungrab_server_checked(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub extern fn xcb_ungrab_server(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub extern fn xcb_query_pointer(c: ?*xcb_connection_t, window: xcb_window_t) xcb_query_pointer_cookie_t;
pub extern fn xcb_query_pointer_unchecked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_query_pointer_cookie_t;
pub extern fn xcb_query_pointer_reply(c: ?*xcb_connection_t, cookie: xcb_query_pointer_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_pointer_reply_t;
pub extern fn xcb_timecoord_next(i: ?[*]xcb_timecoord_iterator_t) void;
pub extern fn xcb_timecoord_end(i: xcb_timecoord_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_get_motion_events_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_motion_events(c: ?*xcb_connection_t, window: xcb_window_t, start: xcb_timestamp_t, stop: xcb_timestamp_t) xcb_get_motion_events_cookie_t;
pub extern fn xcb_get_motion_events_unchecked(c: ?*xcb_connection_t, window: xcb_window_t, start: xcb_timestamp_t, stop: xcb_timestamp_t) xcb_get_motion_events_cookie_t;
pub extern fn xcb_get_motion_events_events(R: ?[*]const xcb_get_motion_events_reply_t) ?[*]xcb_timecoord_t;
pub extern fn xcb_get_motion_events_events_length(R: ?[*]const xcb_get_motion_events_reply_t) c_int;
pub extern fn xcb_get_motion_events_events_iterator(R: ?[*]const xcb_get_motion_events_reply_t) xcb_timecoord_iterator_t;
pub extern fn xcb_get_motion_events_reply(c: ?*xcb_connection_t, cookie: xcb_get_motion_events_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_motion_events_reply_t;
pub extern fn xcb_translate_coordinates(c: ?*xcb_connection_t, src_window: xcb_window_t, dst_window: xcb_window_t, src_x: i16, src_y: i16) xcb_translate_coordinates_cookie_t;
pub extern fn xcb_translate_coordinates_unchecked(c: ?*xcb_connection_t, src_window: xcb_window_t, dst_window: xcb_window_t, src_x: i16, src_y: i16) xcb_translate_coordinates_cookie_t;
pub extern fn xcb_translate_coordinates_reply(c: ?*xcb_connection_t, cookie: xcb_translate_coordinates_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_translate_coordinates_reply_t;
pub extern fn xcb_warp_pointer_checked(c: ?*xcb_connection_t, src_window: xcb_window_t, dst_window: xcb_window_t, src_x: i16, src_y: i16, src_width: u16, src_height: u16, dst_x: i16, dst_y: i16) xcb_void_cookie_t;
pub extern fn xcb_warp_pointer(c: ?*xcb_connection_t, src_window: xcb_window_t, dst_window: xcb_window_t, src_x: i16, src_y: i16, src_width: u16, src_height: u16, dst_x: i16, dst_y: i16) xcb_void_cookie_t;
pub extern fn xcb_set_input_focus_checked(c: ?*xcb_connection_t, revert_to: u8, focus: xcb_window_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_set_input_focus(c: ?*xcb_connection_t, revert_to: u8, focus: xcb_window_t, time_0: xcb_timestamp_t) xcb_void_cookie_t;
pub extern fn xcb_get_input_focus(c: ?*xcb_connection_t) xcb_get_input_focus_cookie_t;
pub extern fn xcb_get_input_focus_unchecked(c: ?*xcb_connection_t) xcb_get_input_focus_cookie_t;
pub extern fn xcb_get_input_focus_reply(c: ?*xcb_connection_t, cookie: xcb_get_input_focus_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_input_focus_reply_t;
pub extern fn xcb_query_keymap(c: ?*xcb_connection_t) xcb_query_keymap_cookie_t;
pub extern fn xcb_query_keymap_unchecked(c: ?*xcb_connection_t) xcb_query_keymap_cookie_t;
pub extern fn xcb_query_keymap_reply(c: ?*xcb_connection_t, cookie: xcb_query_keymap_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_keymap_reply_t;
pub extern fn xcb_open_font_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_open_font_checked(c: ?*xcb_connection_t, fid: xcb_font_t, name_len: u16, name: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_open_font(c: ?*xcb_connection_t, fid: xcb_font_t, name_len: u16, name: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_open_font_name(R: ?[*]const xcb_open_font_request_t) ?[*]u8;
pub extern fn xcb_open_font_name_length(R: ?[*]const xcb_open_font_request_t) c_int;
pub extern fn xcb_open_font_name_end(R: ?[*]const xcb_open_font_request_t) xcb_generic_iterator_t;
pub extern fn xcb_close_font_checked(c: ?*xcb_connection_t, font: xcb_font_t) xcb_void_cookie_t;
pub extern fn xcb_close_font(c: ?*xcb_connection_t, font: xcb_font_t) xcb_void_cookie_t;
pub extern fn xcb_fontprop_next(i: ?[*]xcb_fontprop_iterator_t) void;
pub extern fn xcb_fontprop_end(i: xcb_fontprop_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_charinfo_next(i: ?[*]xcb_charinfo_iterator_t) void;
pub extern fn xcb_charinfo_end(i: xcb_charinfo_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_query_font_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_query_font(c: ?*xcb_connection_t, font: xcb_fontable_t) xcb_query_font_cookie_t;
pub extern fn xcb_query_font_unchecked(c: ?*xcb_connection_t, font: xcb_fontable_t) xcb_query_font_cookie_t;
pub extern fn xcb_query_font_properties(R: ?[*]const xcb_query_font_reply_t) ?[*]xcb_fontprop_t;
pub extern fn xcb_query_font_properties_length(R: ?[*]const xcb_query_font_reply_t) c_int;
pub extern fn xcb_query_font_properties_iterator(R: ?[*]const xcb_query_font_reply_t) xcb_fontprop_iterator_t;
pub extern fn xcb_query_font_char_infos(R: ?[*]const xcb_query_font_reply_t) ?[*]xcb_charinfo_t;
pub extern fn xcb_query_font_char_infos_length(R: ?[*]const xcb_query_font_reply_t) c_int;
pub extern fn xcb_query_font_char_infos_iterator(R: ?[*]const xcb_query_font_reply_t) xcb_charinfo_iterator_t;
pub extern fn xcb_query_font_reply(c: ?*xcb_connection_t, cookie: xcb_query_font_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_font_reply_t;
pub extern fn xcb_query_text_extents_sizeof(_buffer: ?*const c_void, string_len: u32) c_int;
pub extern fn xcb_query_text_extents(c: ?*xcb_connection_t, font: xcb_fontable_t, string_len: u32, string: ?[*]const xcb_char2b_t) xcb_query_text_extents_cookie_t;
pub extern fn xcb_query_text_extents_unchecked(c: ?*xcb_connection_t, font: xcb_fontable_t, string_len: u32, string: ?[*]const xcb_char2b_t) xcb_query_text_extents_cookie_t;
pub extern fn xcb_query_text_extents_reply(c: ?*xcb_connection_t, cookie: xcb_query_text_extents_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_text_extents_reply_t;
pub extern fn xcb_str_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_str_name(R: ?[*]const xcb_str_t) ?[*]u8;
pub extern fn xcb_str_name_length(R: ?[*]const xcb_str_t) c_int;
pub extern fn xcb_str_name_end(R: ?[*]const xcb_str_t) xcb_generic_iterator_t;
pub extern fn xcb_str_next(i: ?[*]xcb_str_iterator_t) void;
pub extern fn xcb_str_end(i: xcb_str_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_list_fonts_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_fonts(c: ?*xcb_connection_t, max_names: u16, pattern_len: u16, pattern: ?[*]const u8) xcb_list_fonts_cookie_t;
pub extern fn xcb_list_fonts_unchecked(c: ?*xcb_connection_t, max_names: u16, pattern_len: u16, pattern: ?[*]const u8) xcb_list_fonts_cookie_t;
pub extern fn xcb_list_fonts_names_length(R: ?[*]const xcb_list_fonts_reply_t) c_int;
pub extern fn xcb_list_fonts_names_iterator(R: ?[*]const xcb_list_fonts_reply_t) xcb_str_iterator_t;
pub extern fn xcb_list_fonts_reply(c: ?*xcb_connection_t, cookie: xcb_list_fonts_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_fonts_reply_t;
pub extern fn xcb_list_fonts_with_info_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_fonts_with_info(c: ?*xcb_connection_t, max_names: u16, pattern_len: u16, pattern: ?[*]const u8) xcb_list_fonts_with_info_cookie_t;
pub extern fn xcb_list_fonts_with_info_unchecked(c: ?*xcb_connection_t, max_names: u16, pattern_len: u16, pattern: ?[*]const u8) xcb_list_fonts_with_info_cookie_t;
pub extern fn xcb_list_fonts_with_info_properties(R: ?[*]const xcb_list_fonts_with_info_reply_t) ?[*]xcb_fontprop_t;
pub extern fn xcb_list_fonts_with_info_properties_length(R: ?[*]const xcb_list_fonts_with_info_reply_t) c_int;
pub extern fn xcb_list_fonts_with_info_properties_iterator(R: ?[*]const xcb_list_fonts_with_info_reply_t) xcb_fontprop_iterator_t;
pub extern fn xcb_list_fonts_with_info_name(R: ?[*]const xcb_list_fonts_with_info_reply_t) ?[*]u8;
pub extern fn xcb_list_fonts_with_info_name_length(R: ?[*]const xcb_list_fonts_with_info_reply_t) c_int;
pub extern fn xcb_list_fonts_with_info_name_end(R: ?[*]const xcb_list_fonts_with_info_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_list_fonts_with_info_reply(c: ?*xcb_connection_t, cookie: xcb_list_fonts_with_info_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_fonts_with_info_reply_t;
pub extern fn xcb_set_font_path_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_set_font_path_checked(c: ?*xcb_connection_t, font_qty: u16, font: ?[*]const xcb_str_t) xcb_void_cookie_t;
pub extern fn xcb_set_font_path(c: ?*xcb_connection_t, font_qty: u16, font: ?[*]const xcb_str_t) xcb_void_cookie_t;
pub extern fn xcb_set_font_path_font_length(R: ?[*]const xcb_set_font_path_request_t) c_int;
pub extern fn xcb_set_font_path_font_iterator(R: ?[*]const xcb_set_font_path_request_t) xcb_str_iterator_t;
pub extern fn xcb_get_font_path_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_font_path(c: ?*xcb_connection_t) xcb_get_font_path_cookie_t;
pub extern fn xcb_get_font_path_unchecked(c: ?*xcb_connection_t) xcb_get_font_path_cookie_t;
pub extern fn xcb_get_font_path_path_length(R: ?[*]const xcb_get_font_path_reply_t) c_int;
pub extern fn xcb_get_font_path_path_iterator(R: ?[*]const xcb_get_font_path_reply_t) xcb_str_iterator_t;
pub extern fn xcb_get_font_path_reply(c: ?*xcb_connection_t, cookie: xcb_get_font_path_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_font_path_reply_t;
pub extern fn xcb_create_pixmap_checked(c: ?*xcb_connection_t, depth: u8, pid: xcb_pixmap_t, drawable: xcb_drawable_t, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_create_pixmap(c: ?*xcb_connection_t, depth: u8, pid: xcb_pixmap_t, drawable: xcb_drawable_t, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_free_pixmap_checked(c: ?*xcb_connection_t, pixmap: xcb_pixmap_t) xcb_void_cookie_t;
pub extern fn xcb_free_pixmap(c: ?*xcb_connection_t, pixmap: xcb_pixmap_t) xcb_void_cookie_t;
pub extern fn xcb_create_gc_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u32, _aux: ?[*]const xcb_create_gc_value_list_t) c_int;
pub extern fn xcb_create_gc_value_list_unpack(_buffer: ?*const c_void, value_mask: u32, _aux: ?[*]xcb_create_gc_value_list_t) c_int;
pub extern fn xcb_create_gc_value_list_sizeof(_buffer: ?*const c_void, value_mask: u32) c_int;
pub extern fn xcb_create_gc_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_create_gc_checked(c: ?*xcb_connection_t, cid: xcb_gcontext_t, drawable: xcb_drawable_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_create_gc(c: ?*xcb_connection_t, cid: xcb_gcontext_t, drawable: xcb_drawable_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_create_gc_aux_checked(c: ?*xcb_connection_t, cid: xcb_gcontext_t, drawable: xcb_drawable_t, value_mask: u32, value_list: ?[*]const xcb_create_gc_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_create_gc_aux(c: ?*xcb_connection_t, cid: xcb_gcontext_t, drawable: xcb_drawable_t, value_mask: u32, value_list: ?[*]const xcb_create_gc_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_create_gc_value_list(R: ?[*]const xcb_create_gc_request_t) ?*c_void;
pub extern fn xcb_change_gc_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u32, _aux: ?[*]const xcb_change_gc_value_list_t) c_int;
pub extern fn xcb_change_gc_value_list_unpack(_buffer: ?*const c_void, value_mask: u32, _aux: ?[*]xcb_change_gc_value_list_t) c_int;
pub extern fn xcb_change_gc_value_list_sizeof(_buffer: ?*const c_void, value_mask: u32) c_int;
pub extern fn xcb_change_gc_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_gc_checked(c: ?*xcb_connection_t, gc: xcb_gcontext_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_gc(c: ?*xcb_connection_t, gc: xcb_gcontext_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_gc_aux_checked(c: ?*xcb_connection_t, gc: xcb_gcontext_t, value_mask: u32, value_list: ?[*]const xcb_change_gc_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_gc_aux(c: ?*xcb_connection_t, gc: xcb_gcontext_t, value_mask: u32, value_list: ?[*]const xcb_change_gc_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_gc_value_list(R: ?[*]const xcb_change_gc_request_t) ?*c_void;
pub extern fn xcb_copy_gc_checked(c: ?*xcb_connection_t, src_gc: xcb_gcontext_t, dst_gc: xcb_gcontext_t, value_mask: u32) xcb_void_cookie_t;
pub extern fn xcb_copy_gc(c: ?*xcb_connection_t, src_gc: xcb_gcontext_t, dst_gc: xcb_gcontext_t, value_mask: u32) xcb_void_cookie_t;
pub extern fn xcb_set_dashes_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_set_dashes_checked(c: ?*xcb_connection_t, gc: xcb_gcontext_t, dash_offset: u16, dashes_len: u16, dashes: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_set_dashes(c: ?*xcb_connection_t, gc: xcb_gcontext_t, dash_offset: u16, dashes_len: u16, dashes: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_set_dashes_dashes(R: ?[*]const xcb_set_dashes_request_t) ?[*]u8;
pub extern fn xcb_set_dashes_dashes_length(R: ?[*]const xcb_set_dashes_request_t) c_int;
pub extern fn xcb_set_dashes_dashes_end(R: ?[*]const xcb_set_dashes_request_t) xcb_generic_iterator_t;
pub extern fn xcb_set_clip_rectangles_sizeof(_buffer: ?*const c_void, rectangles_len: u32) c_int;
pub extern fn xcb_set_clip_rectangles_checked(c: ?*xcb_connection_t, ordering: u8, gc: xcb_gcontext_t, clip_x_origin: i16, clip_y_origin: i16, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_set_clip_rectangles(c: ?*xcb_connection_t, ordering: u8, gc: xcb_gcontext_t, clip_x_origin: i16, clip_y_origin: i16, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_set_clip_rectangles_rectangles(R: ?[*]const xcb_set_clip_rectangles_request_t) ?[*]xcb_rectangle_t;
pub extern fn xcb_set_clip_rectangles_rectangles_length(R: ?[*]const xcb_set_clip_rectangles_request_t) c_int;
pub extern fn xcb_set_clip_rectangles_rectangles_iterator(R: ?[*]const xcb_set_clip_rectangles_request_t) xcb_rectangle_iterator_t;
pub extern fn xcb_free_gc_checked(c: ?*xcb_connection_t, gc: xcb_gcontext_t) xcb_void_cookie_t;
pub extern fn xcb_free_gc(c: ?*xcb_connection_t, gc: xcb_gcontext_t) xcb_void_cookie_t;
pub extern fn xcb_clear_area_checked(c: ?*xcb_connection_t, exposures: u8, window: xcb_window_t, x: i16, y: i16, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_clear_area(c: ?*xcb_connection_t, exposures: u8, window: xcb_window_t, x: i16, y: i16, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_copy_area_checked(c: ?*xcb_connection_t, src_drawable: xcb_drawable_t, dst_drawable: xcb_drawable_t, gc: xcb_gcontext_t, src_x: i16, src_y: i16, dst_x: i16, dst_y: i16, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_copy_area(c: ?*xcb_connection_t, src_drawable: xcb_drawable_t, dst_drawable: xcb_drawable_t, gc: xcb_gcontext_t, src_x: i16, src_y: i16, dst_x: i16, dst_y: i16, width: u16, height: u16) xcb_void_cookie_t;
pub extern fn xcb_copy_plane_checked(c: ?*xcb_connection_t, src_drawable: xcb_drawable_t, dst_drawable: xcb_drawable_t, gc: xcb_gcontext_t, src_x: i16, src_y: i16, dst_x: i16, dst_y: i16, width: u16, height: u16, bit_plane: u32) xcb_void_cookie_t;
pub extern fn xcb_copy_plane(c: ?*xcb_connection_t, src_drawable: xcb_drawable_t, dst_drawable: xcb_drawable_t, gc: xcb_gcontext_t, src_x: i16, src_y: i16, dst_x: i16, dst_y: i16, width: u16, height: u16, bit_plane: u32) xcb_void_cookie_t;
pub extern fn xcb_poly_point_sizeof(_buffer: ?*const c_void, points_len: u32) c_int;
pub extern fn xcb_poly_point_checked(c: ?*xcb_connection_t, coordinate_mode: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_poly_point(c: ?*xcb_connection_t, coordinate_mode: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_poly_point_points(R: ?[*]const xcb_poly_point_request_t) ?[*]xcb_point_t;
pub extern fn xcb_poly_point_points_length(R: ?[*]const xcb_poly_point_request_t) c_int;
pub extern fn xcb_poly_point_points_iterator(R: ?[*]const xcb_poly_point_request_t) xcb_point_iterator_t;
pub extern fn xcb_poly_line_sizeof(_buffer: ?*const c_void, points_len: u32) c_int;
pub extern fn xcb_poly_line_checked(c: ?*xcb_connection_t, coordinate_mode: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_poly_line(c: ?*xcb_connection_t, coordinate_mode: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_poly_line_points(R: ?[*]const xcb_poly_line_request_t) ?[*]xcb_point_t;
pub extern fn xcb_poly_line_points_length(R: ?[*]const xcb_poly_line_request_t) c_int;
pub extern fn xcb_poly_line_points_iterator(R: ?[*]const xcb_poly_line_request_t) xcb_point_iterator_t;
pub extern fn xcb_segment_next(i: ?[*]xcb_segment_iterator_t) void;
pub extern fn xcb_segment_end(i: xcb_segment_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_poly_segment_sizeof(_buffer: ?*const c_void, segments_len: u32) c_int;
pub extern fn xcb_poly_segment_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, segments_len: u32, segments: ?[*]const xcb_segment_t) xcb_void_cookie_t;
pub extern fn xcb_poly_segment(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, segments_len: u32, segments: ?[*]const xcb_segment_t) xcb_void_cookie_t;
pub extern fn xcb_poly_segment_segments(R: ?[*]const xcb_poly_segment_request_t) ?[*]xcb_segment_t;
pub extern fn xcb_poly_segment_segments_length(R: ?[*]const xcb_poly_segment_request_t) c_int;
pub extern fn xcb_poly_segment_segments_iterator(R: ?[*]const xcb_poly_segment_request_t) xcb_segment_iterator_t;
pub extern fn xcb_poly_rectangle_sizeof(_buffer: ?*const c_void, rectangles_len: u32) c_int;
pub extern fn xcb_poly_rectangle_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_poly_rectangle(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_poly_rectangle_rectangles(R: ?[*]const xcb_poly_rectangle_request_t) ?[*]xcb_rectangle_t;
pub extern fn xcb_poly_rectangle_rectangles_length(R: ?[*]const xcb_poly_rectangle_request_t) c_int;
pub extern fn xcb_poly_rectangle_rectangles_iterator(R: ?[*]const xcb_poly_rectangle_request_t) xcb_rectangle_iterator_t;
pub extern fn xcb_poly_arc_sizeof(_buffer: ?*const c_void, arcs_len: u32) c_int;
pub extern fn xcb_poly_arc_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, arcs_len: u32, arcs: ?[*]const xcb_arc_t) xcb_void_cookie_t;
pub extern fn xcb_poly_arc(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, arcs_len: u32, arcs: ?[*]const xcb_arc_t) xcb_void_cookie_t;
pub extern fn xcb_poly_arc_arcs(R: ?[*]const xcb_poly_arc_request_t) ?[*]xcb_arc_t;
pub extern fn xcb_poly_arc_arcs_length(R: ?[*]const xcb_poly_arc_request_t) c_int;
pub extern fn xcb_poly_arc_arcs_iterator(R: ?[*]const xcb_poly_arc_request_t) xcb_arc_iterator_t;
pub extern fn xcb_fill_poly_sizeof(_buffer: ?*const c_void, points_len: u32) c_int;
pub extern fn xcb_fill_poly_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, shape: u8, coordinate_mode: u8, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_fill_poly(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, shape: u8, coordinate_mode: u8, points_len: u32, points: ?[*]const xcb_point_t) xcb_void_cookie_t;
pub extern fn xcb_fill_poly_points(R: ?[*]const xcb_fill_poly_request_t) ?[*]xcb_point_t;
pub extern fn xcb_fill_poly_points_length(R: ?[*]const xcb_fill_poly_request_t) c_int;
pub extern fn xcb_fill_poly_points_iterator(R: ?[*]const xcb_fill_poly_request_t) xcb_point_iterator_t;
pub extern fn xcb_poly_fill_rectangle_sizeof(_buffer: ?*const c_void, rectangles_len: u32) c_int;
pub extern fn xcb_poly_fill_rectangle_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_poly_fill_rectangle(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, rectangles_len: u32, rectangles: ?[*]const xcb_rectangle_t) xcb_void_cookie_t;
pub extern fn xcb_poly_fill_rectangle_rectangles(R: ?[*]const xcb_poly_fill_rectangle_request_t) ?[*]xcb_rectangle_t;
pub extern fn xcb_poly_fill_rectangle_rectangles_length(R: ?[*]const xcb_poly_fill_rectangle_request_t) c_int;
pub extern fn xcb_poly_fill_rectangle_rectangles_iterator(R: ?[*]const xcb_poly_fill_rectangle_request_t) xcb_rectangle_iterator_t;
pub extern fn xcb_poly_fill_arc_sizeof(_buffer: ?*const c_void, arcs_len: u32) c_int;
pub extern fn xcb_poly_fill_arc_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, arcs_len: u32, arcs: ?[*]const xcb_arc_t) xcb_void_cookie_t;
pub extern fn xcb_poly_fill_arc(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, arcs_len: u32, arcs: ?[*]const xcb_arc_t) xcb_void_cookie_t;
pub extern fn xcb_poly_fill_arc_arcs(R: ?[*]const xcb_poly_fill_arc_request_t) ?[*]xcb_arc_t;
pub extern fn xcb_poly_fill_arc_arcs_length(R: ?[*]const xcb_poly_fill_arc_request_t) c_int;
pub extern fn xcb_poly_fill_arc_arcs_iterator(R: ?[*]const xcb_poly_fill_arc_request_t) xcb_arc_iterator_t;
pub extern fn xcb_put_image_sizeof(_buffer: ?*const c_void, data_len: u32) c_int;
pub extern fn xcb_put_image_checked(c: ?*xcb_connection_t, format: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, width: u16, height: u16, dst_x: i16, dst_y: i16, left_pad: u8, depth: u8, data_len: u32, data: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_put_image(c: ?*xcb_connection_t, format: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, width: u16, height: u16, dst_x: i16, dst_y: i16, left_pad: u8, depth: u8, data_len: u32, data: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_put_image_data(R: ?[*]const xcb_put_image_request_t) ?[*]u8;
pub extern fn xcb_put_image_data_length(R: ?[*]const xcb_put_image_request_t) c_int;
pub extern fn xcb_put_image_data_end(R: ?[*]const xcb_put_image_request_t) xcb_generic_iterator_t;
pub extern fn xcb_get_image_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_image(c: ?*xcb_connection_t, format: u8, drawable: xcb_drawable_t, x: i16, y: i16, width: u16, height: u16, plane_mask: u32) xcb_get_image_cookie_t;
pub extern fn xcb_get_image_unchecked(c: ?*xcb_connection_t, format: u8, drawable: xcb_drawable_t, x: i16, y: i16, width: u16, height: u16, plane_mask: u32) xcb_get_image_cookie_t;
pub extern fn xcb_get_image_data(R: ?[*]const xcb_get_image_reply_t) ?[*]u8;
pub extern fn xcb_get_image_data_length(R: ?[*]const xcb_get_image_reply_t) c_int;
pub extern fn xcb_get_image_data_end(R: ?[*]const xcb_get_image_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_image_reply(c: ?*xcb_connection_t, cookie: xcb_get_image_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_image_reply_t;
pub extern fn xcb_poly_text_8_sizeof(_buffer: ?*const c_void, items_len: u32) c_int;
pub extern fn xcb_poly_text_8_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, items_len: u32, items: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_poly_text_8(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, items_len: u32, items: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_poly_text_8_items(R: ?[*]const xcb_poly_text_8_request_t) ?[*]u8;
pub extern fn xcb_poly_text_8_items_length(R: ?[*]const xcb_poly_text_8_request_t) c_int;
pub extern fn xcb_poly_text_8_items_end(R: ?[*]const xcb_poly_text_8_request_t) xcb_generic_iterator_t;
pub extern fn xcb_poly_text_16_sizeof(_buffer: ?*const c_void, items_len: u32) c_int;
pub extern fn xcb_poly_text_16_checked(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, items_len: u32, items: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_poly_text_16(c: ?*xcb_connection_t, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, items_len: u32, items: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_poly_text_16_items(R: ?[*]const xcb_poly_text_16_request_t) ?[*]u8;
pub extern fn xcb_poly_text_16_items_length(R: ?[*]const xcb_poly_text_16_request_t) c_int;
pub extern fn xcb_poly_text_16_items_end(R: ?[*]const xcb_poly_text_16_request_t) xcb_generic_iterator_t;
pub extern fn xcb_image_text_8_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_image_text_8_checked(c: ?*xcb_connection_t, string_len: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, string: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_image_text_8(c: ?*xcb_connection_t, string_len: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, string: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_image_text_8_string(R: ?[*]const xcb_image_text_8_request_t) ?[*]u8;
pub extern fn xcb_image_text_8_string_length(R: ?[*]const xcb_image_text_8_request_t) c_int;
pub extern fn xcb_image_text_8_string_end(R: ?[*]const xcb_image_text_8_request_t) xcb_generic_iterator_t;
pub extern fn xcb_image_text_16_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_image_text_16_checked(c: ?*xcb_connection_t, string_len: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, string: ?[*]const xcb_char2b_t) xcb_void_cookie_t;
pub extern fn xcb_image_text_16(c: ?*xcb_connection_t, string_len: u8, drawable: xcb_drawable_t, gc: xcb_gcontext_t, x: i16, y: i16, string: ?[*]const xcb_char2b_t) xcb_void_cookie_t;
pub extern fn xcb_image_text_16_string(R: ?[*]const xcb_image_text_16_request_t) ?[*]xcb_char2b_t;
pub extern fn xcb_image_text_16_string_length(R: ?[*]const xcb_image_text_16_request_t) c_int;
pub extern fn xcb_image_text_16_string_iterator(R: ?[*]const xcb_image_text_16_request_t) xcb_char2b_iterator_t;
pub extern fn xcb_create_colormap_checked(c: ?*xcb_connection_t, alloc: u8, mid: xcb_colormap_t, window: xcb_window_t, visual: xcb_visualid_t) xcb_void_cookie_t;
pub extern fn xcb_create_colormap(c: ?*xcb_connection_t, alloc: u8, mid: xcb_colormap_t, window: xcb_window_t, visual: xcb_visualid_t) xcb_void_cookie_t;
pub extern fn xcb_free_colormap_checked(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_free_colormap(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_copy_colormap_and_free_checked(c: ?*xcb_connection_t, mid: xcb_colormap_t, src_cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_copy_colormap_and_free(c: ?*xcb_connection_t, mid: xcb_colormap_t, src_cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_install_colormap_checked(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_install_colormap(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_uninstall_colormap_checked(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_uninstall_colormap(c: ?*xcb_connection_t, cmap: xcb_colormap_t) xcb_void_cookie_t;
pub extern fn xcb_list_installed_colormaps_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_installed_colormaps(c: ?*xcb_connection_t, window: xcb_window_t) xcb_list_installed_colormaps_cookie_t;
pub extern fn xcb_list_installed_colormaps_unchecked(c: ?*xcb_connection_t, window: xcb_window_t) xcb_list_installed_colormaps_cookie_t;
pub extern fn xcb_list_installed_colormaps_cmaps(R: ?[*]const xcb_list_installed_colormaps_reply_t) ?[*]xcb_colormap_t;
pub extern fn xcb_list_installed_colormaps_cmaps_length(R: ?[*]const xcb_list_installed_colormaps_reply_t) c_int;
pub extern fn xcb_list_installed_colormaps_cmaps_end(R: ?[*]const xcb_list_installed_colormaps_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_list_installed_colormaps_reply(c: ?*xcb_connection_t, cookie: xcb_list_installed_colormaps_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_installed_colormaps_reply_t;
pub extern fn xcb_alloc_color(c: ?*xcb_connection_t, cmap: xcb_colormap_t, red: u16, green: u16, blue: u16) xcb_alloc_color_cookie_t;
pub extern fn xcb_alloc_color_unchecked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, red: u16, green: u16, blue: u16) xcb_alloc_color_cookie_t;
pub extern fn xcb_alloc_color_reply(c: ?*xcb_connection_t, cookie: xcb_alloc_color_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_alloc_color_reply_t;
pub extern fn xcb_alloc_named_color_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_alloc_named_color(c: ?*xcb_connection_t, cmap: xcb_colormap_t, name_len: u16, name: ?[*]const u8) xcb_alloc_named_color_cookie_t;
pub extern fn xcb_alloc_named_color_unchecked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, name_len: u16, name: ?[*]const u8) xcb_alloc_named_color_cookie_t;
pub extern fn xcb_alloc_named_color_reply(c: ?*xcb_connection_t, cookie: xcb_alloc_named_color_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_alloc_named_color_reply_t;
pub extern fn xcb_alloc_color_cells_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_alloc_color_cells(c: ?*xcb_connection_t, contiguous: u8, cmap: xcb_colormap_t, colors: u16, planes: u16) xcb_alloc_color_cells_cookie_t;
pub extern fn xcb_alloc_color_cells_unchecked(c: ?*xcb_connection_t, contiguous: u8, cmap: xcb_colormap_t, colors: u16, planes: u16) xcb_alloc_color_cells_cookie_t;
pub extern fn xcb_alloc_color_cells_pixels(R: ?[*]const xcb_alloc_color_cells_reply_t) ?[*]u32;
pub extern fn xcb_alloc_color_cells_pixels_length(R: ?[*]const xcb_alloc_color_cells_reply_t) c_int;
pub extern fn xcb_alloc_color_cells_pixels_end(R: ?[*]const xcb_alloc_color_cells_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_alloc_color_cells_masks(R: ?[*]const xcb_alloc_color_cells_reply_t) ?[*]u32;
pub extern fn xcb_alloc_color_cells_masks_length(R: ?[*]const xcb_alloc_color_cells_reply_t) c_int;
pub extern fn xcb_alloc_color_cells_masks_end(R: ?[*]const xcb_alloc_color_cells_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_alloc_color_cells_reply(c: ?*xcb_connection_t, cookie: xcb_alloc_color_cells_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_alloc_color_cells_reply_t;
pub extern fn xcb_alloc_color_planes_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_alloc_color_planes(c: ?*xcb_connection_t, contiguous: u8, cmap: xcb_colormap_t, colors: u16, reds: u16, greens: u16, blues: u16) xcb_alloc_color_planes_cookie_t;
pub extern fn xcb_alloc_color_planes_unchecked(c: ?*xcb_connection_t, contiguous: u8, cmap: xcb_colormap_t, colors: u16, reds: u16, greens: u16, blues: u16) xcb_alloc_color_planes_cookie_t;
pub extern fn xcb_alloc_color_planes_pixels(R: ?[*]const xcb_alloc_color_planes_reply_t) ?[*]u32;
pub extern fn xcb_alloc_color_planes_pixels_length(R: ?[*]const xcb_alloc_color_planes_reply_t) c_int;
pub extern fn xcb_alloc_color_planes_pixels_end(R: ?[*]const xcb_alloc_color_planes_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_alloc_color_planes_reply(c: ?*xcb_connection_t, cookie: xcb_alloc_color_planes_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_alloc_color_planes_reply_t;
pub extern fn xcb_free_colors_sizeof(_buffer: ?*const c_void, pixels_len: u32) c_int;
pub extern fn xcb_free_colors_checked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, plane_mask: u32, pixels_len: u32, pixels: ?[*]const u32) xcb_void_cookie_t;
pub extern fn xcb_free_colors(c: ?*xcb_connection_t, cmap: xcb_colormap_t, plane_mask: u32, pixels_len: u32, pixels: ?[*]const u32) xcb_void_cookie_t;
pub extern fn xcb_free_colors_pixels(R: ?[*]const xcb_free_colors_request_t) ?[*]u32;
pub extern fn xcb_free_colors_pixels_length(R: ?[*]const xcb_free_colors_request_t) c_int;
pub extern fn xcb_free_colors_pixels_end(R: ?[*]const xcb_free_colors_request_t) xcb_generic_iterator_t;
pub extern fn xcb_coloritem_next(i: ?[*]xcb_coloritem_iterator_t) void;
pub extern fn xcb_coloritem_end(i: xcb_coloritem_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_store_colors_sizeof(_buffer: ?*const c_void, items_len: u32) c_int;
pub extern fn xcb_store_colors_checked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, items_len: u32, items: ?[*]const xcb_coloritem_t) xcb_void_cookie_t;
pub extern fn xcb_store_colors(c: ?*xcb_connection_t, cmap: xcb_colormap_t, items_len: u32, items: ?[*]const xcb_coloritem_t) xcb_void_cookie_t;
pub extern fn xcb_store_colors_items(R: ?[*]const xcb_store_colors_request_t) ?[*]xcb_coloritem_t;
pub extern fn xcb_store_colors_items_length(R: ?[*]const xcb_store_colors_request_t) c_int;
pub extern fn xcb_store_colors_items_iterator(R: ?[*]const xcb_store_colors_request_t) xcb_coloritem_iterator_t;
pub extern fn xcb_store_named_color_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_store_named_color_checked(c: ?*xcb_connection_t, flags: u8, cmap: xcb_colormap_t, pixel: u32, name_len: u16, name: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_store_named_color(c: ?*xcb_connection_t, flags: u8, cmap: xcb_colormap_t, pixel: u32, name_len: u16, name: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_store_named_color_name(R: ?[*]const xcb_store_named_color_request_t) ?[*]u8;
pub extern fn xcb_store_named_color_name_length(R: ?[*]const xcb_store_named_color_request_t) c_int;
pub extern fn xcb_store_named_color_name_end(R: ?[*]const xcb_store_named_color_request_t) xcb_generic_iterator_t;
pub extern fn xcb_rgb_next(i: ?[*]xcb_rgb_iterator_t) void;
pub extern fn xcb_rgb_end(i: xcb_rgb_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_query_colors_sizeof(_buffer: ?*const c_void, pixels_len: u32) c_int;
pub extern fn xcb_query_colors(c: ?*xcb_connection_t, cmap: xcb_colormap_t, pixels_len: u32, pixels: ?[*]const u32) xcb_query_colors_cookie_t;
pub extern fn xcb_query_colors_unchecked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, pixels_len: u32, pixels: ?[*]const u32) xcb_query_colors_cookie_t;
pub extern fn xcb_query_colors_colors(R: ?[*]const xcb_query_colors_reply_t) ?[*]xcb_rgb_t;
pub extern fn xcb_query_colors_colors_length(R: ?[*]const xcb_query_colors_reply_t) c_int;
pub extern fn xcb_query_colors_colors_iterator(R: ?[*]const xcb_query_colors_reply_t) xcb_rgb_iterator_t;
pub extern fn xcb_query_colors_reply(c: ?*xcb_connection_t, cookie: xcb_query_colors_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_colors_reply_t;
pub extern fn xcb_lookup_color_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_lookup_color(c: ?*xcb_connection_t, cmap: xcb_colormap_t, name_len: u16, name: ?[*]const u8) xcb_lookup_color_cookie_t;
pub extern fn xcb_lookup_color_unchecked(c: ?*xcb_connection_t, cmap: xcb_colormap_t, name_len: u16, name: ?[*]const u8) xcb_lookup_color_cookie_t;
pub extern fn xcb_lookup_color_reply(c: ?*xcb_connection_t, cookie: xcb_lookup_color_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_lookup_color_reply_t;
pub extern fn xcb_create_cursor_checked(c: ?*xcb_connection_t, cid: xcb_cursor_t, source: xcb_pixmap_t, mask: xcb_pixmap_t, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16, x: u16, y: u16) xcb_void_cookie_t;
pub extern fn xcb_create_cursor(c: ?*xcb_connection_t, cid: xcb_cursor_t, source: xcb_pixmap_t, mask: xcb_pixmap_t, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16, x: u16, y: u16) xcb_void_cookie_t;
pub extern fn xcb_create_glyph_cursor_checked(c: ?*xcb_connection_t, cid: xcb_cursor_t, source_font: xcb_font_t, mask_font: xcb_font_t, source_char: u16, mask_char: u16, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16) xcb_void_cookie_t;
pub extern fn xcb_create_glyph_cursor(c: ?*xcb_connection_t, cid: xcb_cursor_t, source_font: xcb_font_t, mask_font: xcb_font_t, source_char: u16, mask_char: u16, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16) xcb_void_cookie_t;
pub extern fn xcb_free_cursor_checked(c: ?*xcb_connection_t, cursor: xcb_cursor_t) xcb_void_cookie_t;
pub extern fn xcb_free_cursor(c: ?*xcb_connection_t, cursor: xcb_cursor_t) xcb_void_cookie_t;
pub extern fn xcb_recolor_cursor_checked(c: ?*xcb_connection_t, cursor: xcb_cursor_t, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16) xcb_void_cookie_t;
pub extern fn xcb_recolor_cursor(c: ?*xcb_connection_t, cursor: xcb_cursor_t, fore_red: u16, fore_green: u16, fore_blue: u16, back_red: u16, back_green: u16, back_blue: u16) xcb_void_cookie_t;
pub extern fn xcb_query_best_size(c: ?*xcb_connection_t, _class: u8, drawable: xcb_drawable_t, width: u16, height: u16) xcb_query_best_size_cookie_t;
pub extern fn xcb_query_best_size_unchecked(c: ?*xcb_connection_t, _class: u8, drawable: xcb_drawable_t, width: u16, height: u16) xcb_query_best_size_cookie_t;
pub extern fn xcb_query_best_size_reply(c: ?*xcb_connection_t, cookie: xcb_query_best_size_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_best_size_reply_t;
pub extern fn xcb_query_extension_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_query_extension(c: ?*xcb_connection_t, name_len: u16, name: ?[*]const u8) xcb_query_extension_cookie_t;
pub extern fn xcb_query_extension_unchecked(c: ?*xcb_connection_t, name_len: u16, name: ?[*]const u8) xcb_query_extension_cookie_t;
pub extern fn xcb_query_extension_reply(c: ?*xcb_connection_t, cookie: xcb_query_extension_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_query_extension_reply_t;
pub extern fn xcb_list_extensions_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_extensions(c: ?*xcb_connection_t) xcb_list_extensions_cookie_t;
pub extern fn xcb_list_extensions_unchecked(c: ?*xcb_connection_t) xcb_list_extensions_cookie_t;
pub extern fn xcb_list_extensions_names_length(R: ?[*]const xcb_list_extensions_reply_t) c_int;
pub extern fn xcb_list_extensions_names_iterator(R: ?[*]const xcb_list_extensions_reply_t) xcb_str_iterator_t;
pub extern fn xcb_list_extensions_reply(c: ?*xcb_connection_t, cookie: xcb_list_extensions_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_extensions_reply_t;
pub extern fn xcb_change_keyboard_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_keyboard_mapping_checked(c: ?*xcb_connection_t, keycode_count: u8, first_keycode: xcb_keycode_t, keysyms_per_keycode: u8, keysyms: ?[*]const xcb_keysym_t) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_mapping(c: ?*xcb_connection_t, keycode_count: u8, first_keycode: xcb_keycode_t, keysyms_per_keycode: u8, keysyms: ?[*]const xcb_keysym_t) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_mapping_keysyms(R: ?[*]const xcb_change_keyboard_mapping_request_t) ?[*]xcb_keysym_t;
pub extern fn xcb_change_keyboard_mapping_keysyms_length(R: ?[*]const xcb_change_keyboard_mapping_request_t) c_int;
pub extern fn xcb_change_keyboard_mapping_keysyms_end(R: ?[*]const xcb_change_keyboard_mapping_request_t) xcb_generic_iterator_t;
pub extern fn xcb_get_keyboard_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_keyboard_mapping(c: ?*xcb_connection_t, first_keycode: xcb_keycode_t, count: u8) xcb_get_keyboard_mapping_cookie_t;
pub extern fn xcb_get_keyboard_mapping_unchecked(c: ?*xcb_connection_t, first_keycode: xcb_keycode_t, count: u8) xcb_get_keyboard_mapping_cookie_t;
pub extern fn xcb_get_keyboard_mapping_keysyms(R: ?[*]const xcb_get_keyboard_mapping_reply_t) ?[*]xcb_keysym_t;
pub extern fn xcb_get_keyboard_mapping_keysyms_length(R: ?[*]const xcb_get_keyboard_mapping_reply_t) c_int;
pub extern fn xcb_get_keyboard_mapping_keysyms_end(R: ?[*]const xcb_get_keyboard_mapping_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_keyboard_mapping_reply(c: ?*xcb_connection_t, cookie: xcb_get_keyboard_mapping_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_keyboard_mapping_reply_t;
pub extern fn xcb_change_keyboard_control_value_list_serialize(_buffer: ?[*](?*c_void), value_mask: u32, _aux: ?[*]const xcb_change_keyboard_control_value_list_t) c_int;
pub extern fn xcb_change_keyboard_control_value_list_unpack(_buffer: ?*const c_void, value_mask: u32, _aux: ?[*]xcb_change_keyboard_control_value_list_t) c_int;
pub extern fn xcb_change_keyboard_control_value_list_sizeof(_buffer: ?*const c_void, value_mask: u32) c_int;
pub extern fn xcb_change_keyboard_control_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_keyboard_control_checked(c: ?*xcb_connection_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_control(c: ?*xcb_connection_t, value_mask: u32, value_list: ?*const c_void) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_control_aux_checked(c: ?*xcb_connection_t, value_mask: u32, value_list: ?[*]const xcb_change_keyboard_control_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_control_aux(c: ?*xcb_connection_t, value_mask: u32, value_list: ?[*]const xcb_change_keyboard_control_value_list_t) xcb_void_cookie_t;
pub extern fn xcb_change_keyboard_control_value_list(R: ?[*]const xcb_change_keyboard_control_request_t) ?*c_void;
pub extern fn xcb_get_keyboard_control(c: ?*xcb_connection_t) xcb_get_keyboard_control_cookie_t;
pub extern fn xcb_get_keyboard_control_unchecked(c: ?*xcb_connection_t) xcb_get_keyboard_control_cookie_t;
pub extern fn xcb_get_keyboard_control_reply(c: ?*xcb_connection_t, cookie: xcb_get_keyboard_control_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_keyboard_control_reply_t;
pub extern fn xcb_bell_checked(c: ?*xcb_connection_t, percent: i8) xcb_void_cookie_t;
pub extern fn xcb_bell(c: ?*xcb_connection_t, percent: i8) xcb_void_cookie_t;
pub extern fn xcb_change_pointer_control_checked(c: ?*xcb_connection_t, acceleration_numerator: i16, acceleration_denominator: i16, threshold: i16, do_acceleration: u8, do_threshold: u8) xcb_void_cookie_t;
pub extern fn xcb_change_pointer_control(c: ?*xcb_connection_t, acceleration_numerator: i16, acceleration_denominator: i16, threshold: i16, do_acceleration: u8, do_threshold: u8) xcb_void_cookie_t;
pub extern fn xcb_get_pointer_control(c: ?*xcb_connection_t) xcb_get_pointer_control_cookie_t;
pub extern fn xcb_get_pointer_control_unchecked(c: ?*xcb_connection_t) xcb_get_pointer_control_cookie_t;
pub extern fn xcb_get_pointer_control_reply(c: ?*xcb_connection_t, cookie: xcb_get_pointer_control_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_pointer_control_reply_t;
pub extern fn xcb_set_screen_saver_checked(c: ?*xcb_connection_t, timeout: i16, interval: i16, prefer_blanking: u8, allow_exposures: u8) xcb_void_cookie_t;
pub extern fn xcb_set_screen_saver(c: ?*xcb_connection_t, timeout: i16, interval: i16, prefer_blanking: u8, allow_exposures: u8) xcb_void_cookie_t;
pub extern fn xcb_get_screen_saver(c: ?*xcb_connection_t) xcb_get_screen_saver_cookie_t;
pub extern fn xcb_get_screen_saver_unchecked(c: ?*xcb_connection_t) xcb_get_screen_saver_cookie_t;
pub extern fn xcb_get_screen_saver_reply(c: ?*xcb_connection_t, cookie: xcb_get_screen_saver_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_screen_saver_reply_t;
pub extern fn xcb_change_hosts_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_change_hosts_checked(c: ?*xcb_connection_t, mode: u8, family: u8, address_len: u16, address: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_change_hosts(c: ?*xcb_connection_t, mode: u8, family: u8, address_len: u16, address: ?[*]const u8) xcb_void_cookie_t;
pub extern fn xcb_change_hosts_address(R: ?[*]const xcb_change_hosts_request_t) ?[*]u8;
pub extern fn xcb_change_hosts_address_length(R: ?[*]const xcb_change_hosts_request_t) c_int;
pub extern fn xcb_change_hosts_address_end(R: ?[*]const xcb_change_hosts_request_t) xcb_generic_iterator_t;
pub extern fn xcb_host_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_host_address(R: ?[*]const xcb_host_t) ?[*]u8;
pub extern fn xcb_host_address_length(R: ?[*]const xcb_host_t) c_int;
pub extern fn xcb_host_address_end(R: ?[*]const xcb_host_t) xcb_generic_iterator_t;
pub extern fn xcb_host_next(i: ?[*]xcb_host_iterator_t) void;
pub extern fn xcb_host_end(i: xcb_host_iterator_t) xcb_generic_iterator_t;
pub extern fn xcb_list_hosts_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_list_hosts(c: ?*xcb_connection_t) xcb_list_hosts_cookie_t;
pub extern fn xcb_list_hosts_unchecked(c: ?*xcb_connection_t) xcb_list_hosts_cookie_t;
pub extern fn xcb_list_hosts_hosts_length(R: ?[*]const xcb_list_hosts_reply_t) c_int;
pub extern fn xcb_list_hosts_hosts_iterator(R: ?[*]const xcb_list_hosts_reply_t) xcb_host_iterator_t;
pub extern fn xcb_list_hosts_reply(c: ?*xcb_connection_t, cookie: xcb_list_hosts_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_list_hosts_reply_t;
pub extern fn xcb_set_access_control_checked(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_set_access_control(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_set_close_down_mode_checked(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_set_close_down_mode(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_kill_client_checked(c: ?*xcb_connection_t, resource: u32) xcb_void_cookie_t;
pub extern fn xcb_kill_client(c: ?*xcb_connection_t, resource: u32) xcb_void_cookie_t;
pub extern fn xcb_rotate_properties_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_rotate_properties_checked(c: ?*xcb_connection_t, window: xcb_window_t, atoms_len: u16, delta: i16, atoms: ?[*]const xcb_atom_t) xcb_void_cookie_t;
pub extern fn xcb_rotate_properties(c: ?*xcb_connection_t, window: xcb_window_t, atoms_len: u16, delta: i16, atoms: ?[*]const xcb_atom_t) xcb_void_cookie_t;
pub extern fn xcb_rotate_properties_atoms(R: ?[*]const xcb_rotate_properties_request_t) ?[*]xcb_atom_t;
pub extern fn xcb_rotate_properties_atoms_length(R: ?[*]const xcb_rotate_properties_request_t) c_int;
pub extern fn xcb_rotate_properties_atoms_end(R: ?[*]const xcb_rotate_properties_request_t) xcb_generic_iterator_t;
pub extern fn xcb_force_screen_saver_checked(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_force_screen_saver(c: ?*xcb_connection_t, mode: u8) xcb_void_cookie_t;
pub extern fn xcb_set_pointer_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_set_pointer_mapping(c: ?*xcb_connection_t, map_len: u8, map: ?[*]const u8) xcb_set_pointer_mapping_cookie_t;
pub extern fn xcb_set_pointer_mapping_unchecked(c: ?*xcb_connection_t, map_len: u8, map: ?[*]const u8) xcb_set_pointer_mapping_cookie_t;
pub extern fn xcb_set_pointer_mapping_reply(c: ?*xcb_connection_t, cookie: xcb_set_pointer_mapping_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_set_pointer_mapping_reply_t;
pub extern fn xcb_get_pointer_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_pointer_mapping(c: ?*xcb_connection_t) xcb_get_pointer_mapping_cookie_t;
pub extern fn xcb_get_pointer_mapping_unchecked(c: ?*xcb_connection_t) xcb_get_pointer_mapping_cookie_t;
pub extern fn xcb_get_pointer_mapping_map(R: ?[*]const xcb_get_pointer_mapping_reply_t) ?[*]u8;
pub extern fn xcb_get_pointer_mapping_map_length(R: ?[*]const xcb_get_pointer_mapping_reply_t) c_int;
pub extern fn xcb_get_pointer_mapping_map_end(R: ?[*]const xcb_get_pointer_mapping_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_pointer_mapping_reply(c: ?*xcb_connection_t, cookie: xcb_get_pointer_mapping_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_pointer_mapping_reply_t;
pub extern fn xcb_set_modifier_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_set_modifier_mapping(c: ?*xcb_connection_t, keycodes_per_modifier: u8, keycodes: ?[*]const xcb_keycode_t) xcb_set_modifier_mapping_cookie_t;
pub extern fn xcb_set_modifier_mapping_unchecked(c: ?*xcb_connection_t, keycodes_per_modifier: u8, keycodes: ?[*]const xcb_keycode_t) xcb_set_modifier_mapping_cookie_t;
pub extern fn xcb_set_modifier_mapping_reply(c: ?*xcb_connection_t, cookie: xcb_set_modifier_mapping_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_set_modifier_mapping_reply_t;
pub extern fn xcb_get_modifier_mapping_sizeof(_buffer: ?*const c_void) c_int;
pub extern fn xcb_get_modifier_mapping(c: ?*xcb_connection_t) xcb_get_modifier_mapping_cookie_t;
pub extern fn xcb_get_modifier_mapping_unchecked(c: ?*xcb_connection_t) xcb_get_modifier_mapping_cookie_t;
pub extern fn xcb_get_modifier_mapping_keycodes(R: ?[*]const xcb_get_modifier_mapping_reply_t) ?[*]xcb_keycode_t;
pub extern fn xcb_get_modifier_mapping_keycodes_length(R: ?[*]const xcb_get_modifier_mapping_reply_t) c_int;
pub extern fn xcb_get_modifier_mapping_keycodes_end(R: ?[*]const xcb_get_modifier_mapping_reply_t) xcb_generic_iterator_t;
pub extern fn xcb_get_modifier_mapping_reply(c: ?*xcb_connection_t, cookie: xcb_get_modifier_mapping_cookie_t, e: ?[*](?[*]xcb_generic_error_t)) ?[*]xcb_get_modifier_mapping_reply_t;
pub extern fn xcb_no_operation_checked(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub extern fn xcb_no_operation(c: ?*xcb_connection_t) xcb_void_cookie_t;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const XCB_CLIENT_MESSAGE = 33;
pub const XCB_CHANGE_ACTIVE_POINTER_GRAB = 30;
pub const XCB_GRAVITY_NOTIFY = 24;
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const XCB_BUTTON_PRESS = 4;
pub const XCB_GET_INPUT_FOCUS = 43;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"7.0.0 (branches/release_70 342558) (llvm/branches/release_70 342545)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __INTMAX_FMTd__ = c"ld";
pub const XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const UINTMAX_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const INT_LEAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const WINT_MIN = if (@typeId(@typeOf(u)) == @import("builtin").TypeId.Pointer) @ptrCast(0, u) else if (@typeId(@typeOf(u)) == @import("builtin").TypeId.Int) @intToPtr(0, u) else 0(u);
pub const XCB_UNGRAB_SERVER = 37;
pub const __MMX__ = 1;
pub const INTPTR_MAX = c_long(9223372036854775807);
pub const CLOCK_PROCESS_CPUTIME_ID = 2;
pub const _THREAD_SHARED_TYPES_H = 1;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __ptr_t = [*]void;
pub const __WCHAR_WIDTH__ = 32;
pub const XCB_COPY_GC = 57;
pub const TIMER_ABSTIME = 1;
pub const __USE_MISC = 1;
pub const __SIZEOF_PTHREAD_ATTR_T = 56;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2;
pub const UIO_MAXIOV = __IOV_MAX;
pub const __IOV_MAX = 1024;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const CLOCK_THREAD_CPUTIME_ID = 3;
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4;
pub const __INT8_MAX__ = 127;
pub const XCB_UNGRAB_POINTER = 27;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const XCB_UNMAP_WINDOW = 10;
pub const __PTHREAD_MUTEX_HAVE_PREV = 1;
pub const XCB_SET_DASHES = 58;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const _SYS_CDEFS_H = 1;
pub const _ATFILE_SOURCE = 1;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __USE_POSIX199309 = 1;
pub const XCB_SET_FONT_PATH = 51;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const XCB_GET_KEYBOARD_CONTROL = 103;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const XCB_SELECTION_REQUEST = 30;
pub const __WCHAR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-__WCHAR_MAX, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-__WCHAR_MAX, -1) else (-__WCHAR_MAX)(-1);
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __LDBL_DENORM_MIN__ = 0.000000;
pub const _BITS_UIO_LIM_H = 1;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub const __INT64_C_SUFFIX__ = L;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const XCB_CHANGE_WINDOW_ATTRIBUTES = 2;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const _BITS_SCHED_H = 1;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __USE_ATFILE = 1;
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const XCB_GET_SELECTION_OWNER = 23;
pub const __FLT16_HAS_DENORM__ = 1;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const _BITS_WCHAR_H = 1;
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const XCB_DRAWABLE = 9;
pub const __UINT8_FMTo__ = c"hho";
pub const UINT_LEAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __VERSION__ = c"4.2.1 Compatible Clang 7.0.0 (branches/release_70 342558) (llvm/branches/release_70 342545)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const XCB_BUTTON_RELEASE = 5;
pub const XCB_SET_ACCESS_CONTROL = 111;
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const CLOCK_REALTIME = 0;
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __clockid_t_defined = 1;
pub const __UINT_LEAST8_MAX__ = 255;
pub const XCB_CHANGE_HOSTS = 109;
pub const UINT8_MAX = 255;
pub const XCB_GET_FONT_PATH = 52;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __UINT16_MAX__ = 65535;
pub const XCB_MAP_SUBWINDOWS = 9;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __x86_64 = 1;
pub const __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;
pub const XCB_SEND_EVENT = 25;
pub const __SIZEOF_WINT_T__ = 4;
pub const XCB_CHANGE_POINTER_CONTROL = 105;
pub const __UINTMAX_FMTo__ = c"lo";
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const __WINT_UNSIGNED__ = 1;
pub const PTHREAD_CANCELED = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast([*]void, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr([*]void, -1) else ([*]void)(-1);
pub const SIG_ATOMIC_MAX = 2147483647;
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;
pub const __POINTER_WIDTH__ = 64;
pub const PTRDIFF_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __FLT16_DIG__ = 3;
pub const __SIZEOF_LONG__ = 8;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __NO_INLINE__ = 1;
pub const _TIME_H = 1;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const _BITS_PTHREADTYPES_COMMON_H = 1;
pub const XCB_SELECTION_CLEAR = 29;
pub const __UINTMAX_FMTu__ = c"lu";
pub const INT_FAST8_MAX = 127;
pub const __FLT_RADIX__ = 2;
pub const __GLIBC_MINOR__ = 27;
pub const _STDINT_H = 1;
pub const XCB_COLORMAP = 12;
pub const XCB_LEAVE_NOTIFY = 8;
pub const _BITS_BYTESWAP_H = 1;
pub const _BITS_SETJMP_H = 1;
pub const XCB_COPY_COLORMAP_AND_FREE = 80;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const XCB_FREE_COLORMAP = 79;
pub const __UINTMAX_WIDTH__ = 64;
pub const XCB_QUERY_COLORS = 91;
pub const __PTHREAD_MUTEX_USE_UNION = 0;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const XCB_UNGRAB_KEYBOARD = 32;
pub const __sched_priority = sched_priority;
pub const INT_LEAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub const __INT_FAST16_TYPE__ = short;
pub const XCB_QUERY_POINTER = 38;
pub const XCB_CURSOR = 6;
pub const XCB_CHANGE_PROPERTY = 18;
pub const XCB_UNGRAB_BUTTON = 29;
pub const XCB_CREATE_COLORMAP = 78;
pub const __LDBL_MIN__ = 0.000000;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const _DEFAULT_SOURCE = 1;
pub const XCB_PIXMAP = 4;
pub const __FD_SETSIZE = 1024;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const XCB_QUERY_EXTENSION = 98;
pub const __clang_minor__ = 0;
pub const INTMAX_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const XCB_MAP_REQUEST = 20;
pub const __SIZEOF_FLOAT128__ = 16;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const INT_FAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __DBL_MAX__ = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878;
pub const __UINT64_FMTx__ = c"lx";
pub const XCB_KEY_PRESS = 2;
pub const CLOCK_TAI = 11;
pub const __SLONG32_TYPE = int;
pub const XCB_KEY_RELEASE = 3;
pub const _DEBUG = 1;
pub const X_PROTOCOL = 11;
pub const INT32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __restrict_arr = __restrict;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const XCB_FREE_CURSOR = 95;
pub const __UINT8_FMTX__ = c"hhX";
pub const __iovec_defined = 1;
pub const XCB_SELECTION_NOTIFY = 31;
pub const XCB_DESTROY_SUBWINDOWS = 5;
pub const UINT_FAST8_MAX = 255;
pub const __UINTPTR_WIDTH__ = 64;
pub const XCB_CREATE_CURSOR = 93;
pub const XCB_WINDOW = 3;
pub const __time_t_defined = 1;
pub const XCB_MAPPING_NOTIFY = 34;
pub const XCB_INTERN_ATOM = 16;
pub const __k8 = 1;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const XCB_IMAGE_TEXT_8 = 76;
pub const __INT16_FMTd__ = c"hd";
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const XCB_INSTALL_COLORMAP = 81;
pub const __INTMAX_WIDTH__ = 64;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __USE_POSIX = 1;
pub const XCB_FORCE_SCREEN_SAVER = 115;
pub const __SIZE_FMTo__ = c"lo";
pub const __PDP_ENDIAN = 3412;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const XCB_SET_CLIP_RECTANGLES = 59;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __FLT_MIN_EXP__ = -125;
pub const XCB_ALLOC_COLOR_CELLS = 86;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const XCB_RECOLOR_CURSOR = 96;
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const INT_LEAST8_MIN = -128;
pub const __STDC_NO_THREADS__ = 1;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const XCB_POLY_FILL_RECTANGLE = 70;
pub const __GXX_ABI_VERSION = 1002;
pub const INTPTR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __FLT_MANT_DIG__ = 24;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const __STDC__ = 1;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __SIZE_WIDTH__ = 64;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __INT_LEAST64_FMTi__ = c"li";
pub const X_PROTOCOL_REVISION = 0;
pub const __INT_FAST16_MAX__ = 32767;
pub const XCB_LIST_INSTALLED_COLORMAPS = 83;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __have_pthread_attr_t = 1;
pub const __INT_MAX__ = 2147483647;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __DBL_DENORM_MIN__ = 0.000000;
pub const __clang_major__ = 7;
pub const __FLT16_MANT_DIG__ = 11;
pub const XCB_GET_KEYBOARD_MAPPING = 101;
pub const XCB_POLY_RECTANGLE = 67;
pub const XCB_LIST_FONTS_WITH_INFO = 50;
pub const UINTPTR_MAX = c_ulong(18446744073709551615);
pub const XCB_CIRCULATE_NOTIFY = 26;
pub const __FLT_DENORM_MIN__ = 0.000000;
pub const __BIG_ENDIAN = 4321;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const SIG_ATOMIC_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const XCB_IMPLEMENTATION = 17;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __GLIBC_USE_LIB_EXT2 = 0;
pub const __SIZEOF_PTHREAD_MUTEX_T = 40;
pub const __UINT8_FMTu__ = c"hhu";
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const XCB_CONFIGURE_REQUEST = 23;
pub const __UINT16_FMTu__ = c"hu";
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const SIZE_MAX = c_ulong(18446744073709551615);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __clang_patchlevel__ = 0;
pub const X_TCP_PORT = 6000;
pub const XCB_CONVERT_SELECTION = 24;
pub const __FXSR__ = 1;
pub const __UINT32_FMTx__ = c"x";
pub const XCB_REQUEST = 1;
pub const XCB_QUERY_KEYMAP = 44;
pub const __UINT32_FMTu__ = c"u";
pub const __SIZEOF_PTHREAD_COND_T = 48;
pub const XCB_COLORMAP_NOTIFY = 32;
pub const _BITS_UINTN_IDENTITY_H = 1;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const XCB_CLOSE_FONT = 46;
pub const XCB_ATOM = 5;
pub const XCB_DESTROY_NOTIFY = 17;
pub const __USE_ISOC11 = 1;
pub const XCB_ALLOW_EVENTS = 35;
pub const __tune_k8__ = 1;
pub const UINT32_MAX = c_uint(4294967295);
pub const __x86_64__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __clock_t_defined = 1;
pub const __UINT32_FMTo__ = c"o";
pub const _SCHED_H = 1;
pub const _SYS_SELECT_H = 1;
pub const XCB_SET_SCREEN_SAVER = 107;
pub const _SYS_TYPES_H = 1;
pub const UINT64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __INT_LEAST16_TYPE__ = short;
pub const XCB_GET_SCREEN_SAVER = 108;
pub const XCB_QUERY_BEST_SIZE = 97;
pub const XCB_FOCUS_OUT = 10;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const XCB_POLY_LINE = 65;
pub const __SIZEOF_INT__ = 4;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const INT8_MIN = -128;
pub const XCB_CIRCULATE_REQUEST = 27;
pub const XCB_GET_POINTER_MAPPING = 117;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const XCB_G_CONTEXT = 13;
pub const __amd64 = 1;
pub const XCB_CHANGE_KEYBOARD_CONTROL = 102;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const TIME_UTC = 1;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const __glibc_c99_flexarr_available = 1;
pub const __linux = 1;
pub const __sigset_t_defined = 1;
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = 4;
pub const WCHAR_MIN = __WCHAR_MIN;
pub const __clang__ = 1;
pub const INT_FAST16_MAX = c_long(9223372036854775807);
pub const _BITS_TIME_H = 1;
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const __ATOMIC_ACQ_REL = 4;
pub const CLOCK_MONOTONIC = 1;
pub const XCB_STORE_COLORS = 89;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const _ENDIAN_H = 1;
pub const __GLIBC__ = 2;
pub const UINT_FAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __WORDSIZE = 64;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const _BITS_TYPES_LOCALE_T_H = 1;
pub const _SYS_UIO_H = 1;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __itimerspec_defined = 1;
pub const __INT32_FMTi__ = c"i";
pub const XCB_POLY_ARC = 68;
pub const __DBL_HAS_INFINITY__ = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const _STDC_PREDEF_H = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const __SIZEOF_FLOAT__ = 4;
pub const INT_FAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const __INT_LEAST32_FMTi__ = c"i";
pub const XCB_SET_MODIFIER_MAPPING = 118;
pub const __LDBL_EPSILON__ = 0.000000;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const CLOCK_REALTIME_COARSE = 5;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __FD_ZERO_STOS = c"stosq";
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const XCB_FREE_GC = 60;
pub const __SIZEOF_DOUBLE__ = 8;
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const SCHED_OTHER = 0;
pub const XCB_GET_GEOMETRY = 14;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const __SIZE_FMTX__ = c"lX";
pub const XCB_CREATE_PIXMAP = 53;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CPU_SETSIZE = 1024;
pub const CLOCK_BOOTTIME = 7;
pub const XCB_CREATE_WINDOW = 1;
pub const _BITS_TYPES_H = 1;
pub const _SYS_SYSMACROS_H = 1;
pub const XCB_WARP_POINTER = 41;
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const XCB_FOCUS_IN = 9;
pub const __DBL_MIN_EXP__ = -1021;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const XCB_CHANGE_KEYBOARD_MAPPING = 100;
pub const __PID_T_TYPE = __S32_TYPE;
pub const XCB_LIST_FONTS = 49;
pub const XCB_CONFIGURE_NOTIFY = 22;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub const __ATOMIC_RELAXED = 0;
pub const __SIZEOF_SHORT__ = 2;
pub const __UINT16_FMTX__ = c"hX";
pub const __UINT_FAST16_MAX__ = 65535;
pub const __timeval_defined = 1;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const PTRDIFF_MAX = c_long(9223372036854775807);
pub const __WINT_MAX__ = c_uint(4294967295);
pub const XCB_BELL = 104;
pub const __STDC_ISO_10646__ = c_long(201706);
pub const XCB_CLEAR_AREA = 61;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const PTHREAD_ONCE_INIT = 0;
pub const __STDC_HOSTED__ = 1;
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const __USE_POSIX2 = 1;
pub const __FLT16_MIN_EXP__ = -14;
pub const __USE_XOPEN2K = 1;
pub const __USE_FORTIFY_LEVEL = 0;
pub const __ELF__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __PTHREAD_MUTEX_LOCK_ELISION = 1;
pub const XCB_POLY_SEGMENT = 66;
pub const __USE_XOPEN2K8 = 1;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const CLOCK_MONOTONIC_RAW = 4;
pub const INT16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub const XCB_ID_CHOICE = 14;
pub const XCB_ALLOC_COLOR = 84;
pub const __UINT64_FMTX__ = c"lX";
pub const XCB_CREATE_GLYPH_CURSOR = 94;
pub const __DBL_MANT_DIG__ = 53;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __USE_ISOC95 = 1;
pub const XCB_CONN_CLOSED_PARSE_ERR = 5;
pub const __UID_T_TYPE = __U32_TYPE;
pub const XCB_UNGRAB_KEY = 34;
pub const __timespec_defined = 1;
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const XCB_NAME = 15;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const UINT16_MAX = 65535;
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const XCB_GET_POINTER_CONTROL = 106;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __warnattr = msg;
pub const __STD_TYPE = typedef;
pub const XCB_ALLOC_NAMED_COLOR = 85;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const XCB_CONN_CLOSED_FDPASSING_FAILED = 7;
pub const XCB_VISIBILITY_NOTIFY = 15;
pub const __LDBL_MAX__ = inf;
pub const _LP64 = 1;
pub const FD_SETSIZE = __FD_SETSIZE;
pub const linux = 1;
pub const XCB_ENTER_NOTIFY = 7;
pub const __FLT_DIG__ = 6;
pub const XCB_GRAB_BUTTON = 28;
pub const __INT16_MAX__ = 32767;
pub const __FLT_MAX_10_EXP__ = 38;
pub const XCB_POLY_FILL_ARC = 71;
pub const _FEATURES_H = 1;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const XCB_GET_MOTION_EVENTS = 39;
pub const XCB_CONFIGURE_WINDOW = 12;
pub const __SHRT_MAX__ = 32767;
pub const CLOCK_BOOTTIME_ALARM = 9;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const _PTHREAD_H = 1;
pub const XCB_REPARENT_WINDOW = 7;
pub const __INT32_FMTd__ = c"d";
pub const __DBL_MIN__ = 0.000000;
pub const __S32_TYPE = int;
pub const __INTPTR_WIDTH__ = 64;
pub const XCB_MAP_WINDOW = 8;
pub const __FLT16_MAX_10_EXP__ = 4;
pub const __INT_FAST32_TYPE__ = int;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const _POSIX_SOURCE = 1;
pub const __LITTLE_ENDIAN = 1234;
pub const XCB_DESTROY_WINDOW = 4;
pub const __gnu_linux__ = 1;
pub const XCB_FREE_COLORS = 88;
pub const XCB_GET_MODIFIER_MAPPING = 119;
pub const XCB_GET_PROPERTY = 20;
pub const __timer_t_defined = 1;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const INT_FAST8_MIN = -128;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const XCB_COPY_AREA = 62;
pub const XCB_CHANGE_SAVE_SET = 6;
pub const XCB_ALLOC = 11;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const XCB_ALLOC_COLOR_PLANES = 87;
pub const _BITS_STDINT_INTN_H = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const __KEY_T_TYPE = __S32_TYPE;
pub const XCB_QUERY_TEXT_EXTENTS = 48;
pub const __USE_POSIX199506 = 1;
pub const __INT32_TYPE__ = int;
pub const __FLT_MIN__ = 0.000000;
pub const __INT8_FMTd__ = c"hhd";
pub const INT64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const __FLT_MAX_EXP__ = 128;
pub const XCB_MOTION_NOTIFY = 6;
pub const XCB_KILL_CLIENT = 113;
pub const __INT_FAST64_FMTi__ = c"li";
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const XCB_GRAB_SERVER = 36;
pub const XCB_GRAB_KEYBOARD = 31;
pub const XCB_SET_SELECTION_OWNER = 22;
pub const __LDBL_REDIR_DECL = name;
pub const XCB_FILL_POLY = 69;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const XCB_MATCH = 8;
pub const XCB_MAP_NOTIFY = 19;
pub const __SIZE_FMTx__ = c"lx";
pub const XCB_IMAGE_TEXT_16 = 77;
pub const XCB_LIST_EXTENSIONS = 99;
pub const __DBL_EPSILON__ = 0.000000;
pub const XCB_VALUE = 2;
pub const XCB_UNMAP_NOTIFY = 18;
pub const INT_FAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const XCB_GET_IMAGE = 73;
pub const XCB_SET_INPUT_FOCUS = 42;
pub const XCB_FREE_PIXMAP = 54;
pub const INT32_MAX = 2147483647;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __CHAR_BIT__ = 8;
pub const XCB_REPARENT_NOTIFY = 21;
pub const __INT16_FMTi__ = c"hi";
pub const INT_LEAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __GNUC_MINOR__ = 2;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const XCB_UNMAP_SUBWINDOWS = 11;
pub const NFDBITS = __NFDBITS;
pub const __FLT_EPSILON__ = 0.000000;
pub const INT_FAST32_MAX = c_long(9223372036854775807);
pub const __llvm__ = 1;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const XCB_GRAB_POINTER = 26;
pub const __INT_FAST32_FMTi__ = c"i";
pub const CLOCKS_PER_SEC = if (@typeId(@typeOf(1000000)) == @import("builtin").TypeId.Pointer) @ptrCast(__clock_t, 1000000) else if (@typeId(@typeOf(1000000)) == @import("builtin").TypeId.Int) @intToPtr(__clock_t, 1000000) else __clock_t(1000000);
pub const INT16_MAX = 32767;
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const XCB_ROTATE_PROPERTIES = 114;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const NULL = if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Pointer) @ptrCast([*]void, 0) else if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Int) @intToPtr([*]void, 0) else ([*]void)(0);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __UINT32_FMTX__ = c"X";
pub const __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;
pub const UINT_LEAST8_MAX = 255;
pub const SCHED_FIFO = 1;
pub const __UINT32_C_SUFFIX__ = U;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const XCB_POLY_POINT = 64;
pub const XCB_PUT_IMAGE = 72;
pub const __BIT_TYPES_DEFINED__ = 1;
pub const _BITS_SYSMACROS_H = 1;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const XCB_KEYMAP_NOTIFY = 11;
pub const __STDC_UTF_16__ = 1;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const XCB_EXPOSE = 12;
pub const __ATOMIC_RELEASE = 3;
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const XCB_CREATE_NOTIFY = 16;
pub const XCB_GE_GENERIC = 35;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __SIZEOF_PTHREAD_BARRIER_T = 32;
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;
pub const XCB_COPY_PLANE = 63;
pub const __INT16_TYPE__ = short;
pub const __SSE2_MATH__ = 1;
pub const UINT_LEAST16_MAX = 65535;
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = 0;
pub const UINT_LEAST32_MAX = c_uint(4294967295);
pub const __INT_FAST8_MAX__ = 127;
pub const XCB_CHANGE_GC = 56;
pub const XCB_CREATE_GC = 55;
pub const XCB_STORE_NAMED_COLOR = 90;
pub const __STDC_IEC_559__ = 1;
pub const __USE_ISOC99 = 1;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const __UINT64_FMTu__ = c"lu";
pub const __struct_tm_defined = 1;
pub const __SSE2__ = 1;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const XCB_NO_EXPOSURE = 14;
pub const __INTMAX_FMTi__ = c"li";
pub const XCB_LENGTH = 16;
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const XCB_POLY_TEXT_16 = 75;
pub const XCB_CIRCULATE_WINDOW = 13;
pub const _BITS_TYPES___LOCALE_T_H = 1;
pub const _POSIX_C_SOURCE = c_long(200809);
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const SCHED_RR = 2;
pub const __FLT16_MIN_10_EXP__ = -13;
pub const WINT_MAX = c_uint(4294967295);
pub const XCB_ACCESS = 10;
pub const UINT_FAST16_MAX = c_ulong(18446744073709551615);
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const XCB_DELETE_PROPERTY = 19;
pub const __ATOMIC_SEQ_CST = 5;
pub const XCB_SET_CLOSE_DOWN_MODE = 112;
pub const XCB_NO_OPERATION = 127;
pub const XCB_LIST_HOSTS = 110;
pub const XCB_LIST_PROPERTIES = 21;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const XCB_TRANSLATE_COORDINATES = 40;
pub const __GNUC_STDC_INLINE__ = 1;
pub const XCB_LOOKUP_COLOR = 92;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __UINT16_FMTo__ = c"ho";
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __SIZEOF_PTHREAD_CONDATTR_T = 4;
pub const INT_LEAST8_MAX = 127;
pub const __SIZEOF_POINTER__ = 8;
pub const __TIMER_T_TYPE = [*]void;
pub const __unix = 1;
pub const __GLIBC_USE_IEC_60559_BFP_EXT = 0;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const __FLT_MAX__ = 340282346999999984391321947108527833088.000000;
pub const XCB_GRAPHICS_EXPOSURE = 13;
pub const XCB_OPEN_FONT = 45;
pub const XCB_CONN_ERROR = 1;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __k8__ = 1;
pub const XCB_RESIZE_REQUEST = 25;
pub const __ATOMIC_CONSUME = 1;
pub const __unix__ = 1;
pub const XCB_QUERY_FONT = 47;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __GNU_LIBRARY__ = 6;
pub const XCB_GET_ATOM_NAME = 17;
pub const __FLT_MIN_10_EXP__ = -37;
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const __attribute_alloc_size__ = params;
pub const __INT_LEAST8_MAX__ = 127;
pub const XCB_POLY_TEXT_8 = 74;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const INT8_MAX = 127;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const XCB_UNINSTALL_COLORMAP = 82;
pub const UINT_FAST32_MAX = c_ulong(18446744073709551615);
pub const __SIZEOF_PTHREAD_RWLOCK_T = 56;
pub const XCB_GET_WINDOW_ATTRIBUTES = 3;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const _BITS_CPU_SET_H = 1;
pub const __linux__ = 1;
pub const __LP64__ = 1;
pub const __SYSCALL_WORDSIZE = 64;
pub const __PTRDIFF_FMTi__ = c"li";
pub const _BITS_TYPESIZES_H = 1;
pub const XCB_PROPERTY_NOTIFY = 28;
pub const _BITS_PTHREADTYPES_ARCH_H = 1;
pub const XCB_FONT = 7;
pub const XCB_SET_POINTER_MAPPING = 116;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = 4;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const PTHREAD_BARRIER_SERIAL_THREAD = -1;
pub const XCB_QUERY_TREE = 15;
pub const __INO_T_MATCHES_INO64_T = 1;
pub const INT_LEAST16_MAX = 32767;
pub const INT_LEAST32_MAX = 2147483647;
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WCHAR_MAX__ = 2147483647;
pub const XCB_GRAB_KEY = 33;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const _BITS_STDINT_UINTN_H = 1;
pub const __UINTMAX_FMTX__ = c"lX";
pub const XCB_CONN_CLOSED_INVALID_SCREEN = 6;
pub const CLOCK_MONOTONIC_COARSE = 6;
pub const CLOCK_REALTIME_ALARM = 8;
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const iovec = struct_iovec;
pub const sched_param = struct_sched_param;
pub const tm = struct_tm;
pub const itimerspec = struct_itimerspec;
pub const sigevent = struct_sigevent;
pub const __locale_data = struct___locale_data;
pub const __locale_struct = struct___locale_struct;
pub const _pthread_cleanup_buffer = struct__pthread_cleanup_buffer;
pub const __pthread_cleanup_frame = struct___pthread_cleanup_frame;
pub const __jmp_buf_tag = struct___jmp_buf_tag;
pub const xcb_special_event = struct_xcb_special_event;
