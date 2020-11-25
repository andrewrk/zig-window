#ifndef _LIBC_BITS_H
#define _LIBC_BITS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdarg.h>
typedef long ssize_t;
typedef unsigned long pthread_t;
typedef unsigned uid_t;
typedef unsigned gid_t;
typedef __builtin_va_list __isoc_va_list;
typedef struct { union { int __i[sizeof(long)==8?10:6]; volatile int __vi[sizeof(long)==8?10:6]; volatile void *volatile __p[sizeof(long)==8?5:6]; } __u; } pthread_mutex_t;
typedef struct { unsigned __attr; } pthread_mutexattr_t;
typedef struct { union { int __i[12]; volatile int __vi[12]; void *__p[12*sizeof(int)/sizeof(void*)]; } __u; } pthread_cond_t;
typedef struct { unsigned __attr; } pthread_condattr_t;
typedef long long time_t;
struct timespec { time_t tv_sec; int :8*(sizeof(time_t)-sizeof(long))*(__BYTE_ORDER__==4321); long tv_nsec; int :8*(sizeof(time_t)-sizeof(long))*(__BYTE_ORDER__!=4321); };

struct tm {
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
    long __tm_gmtoff;
    const char *__tm_zone;
};

struct _IO_FILE;
typedef struct _IO_FILE FILE;

struct __dirstream;
typedef struct __dirstream DIR;

typedef unsigned long long ino_t;
typedef long long off_t;

struct dirent {
	ino_t d_ino;
	off_t d_off;
	unsigned short d_reclen;
	unsigned char d_type;
	char d_name[256];
};

extern __attribute__((weak)) FILE *const stdin;
extern __attribute__((weak)) FILE *const stdout;
extern __attribute__((weak)) FILE *const stderr;

#define F_OK 0
#define R_OK 4
#define W_OK 2
#define X_OK 1

#define RTLD_LAZY   1
#define RTLD_NOW    2
#define RTLD_NOLOAD 4
#define RTLD_NODELETE 4096
#define RTLD_GLOBAL 256
#define RTLD_LOCAL  0

#define RTLD_NEXT    ((void *)-1)
#define RTLD_DEFAULT ((void *)0)

#define RTLD_DI_LINKMAP 2

#undef SEEK_SET
#undef SEEK_CUR
#undef SEEK_END
#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

_Noreturn void __attribute__((weak)) abort (void);

long __attribute__((weak)) atol (const char *);
long long __attribute__((weak)) atoll (const char *);
double __attribute__((weak)) atof (const char *);

float __attribute__((weak)) strtof (const char *__restrict, char **__restrict);
double __attribute__((weak)) strtod (const char *__restrict, char **__restrict);
long double __attribute__((weak)) strtold (const char *__restrict, char **__restrict);

long __attribute__((weak)) strtol (const char *__restrict, char **__restrict, int);
unsigned long __attribute__((weak)) strtoul (const char *__restrict, char **__restrict, int);
long long __attribute__((weak)) strtoll (const char *__restrict, char **__restrict, int);
unsigned long long __attribute__((weak)) strtoull (const char *__restrict, char **__restrict, int);
void *__attribute__((weak)) malloc (size_t);
void *__attribute__((weak)) calloc (size_t, size_t);
void *__attribute__((weak)) realloc (void *, size_t);
void __attribute__((weak)) free (void *);
void *__attribute__((weak)) aligned_alloc(size_t, size_t);
void *__attribute__((weak)) memcpy (void *__restrict, const void *__restrict, size_t);
void *__attribute__((weak)) memmove (void *, const void *, size_t);
void *__attribute__((weak)) memset (void *, int, size_t);
int __attribute__((weak)) memcmp (const void *, const void *, size_t);
void *__attribute__((weak)) memchr (const void *, int, size_t);
char *__attribute__((weak)) strcpy (char *__restrict, const char *__restrict);
char *__attribute__((weak)) strncpy (char *__restrict, const char *__restrict, size_t);
char *__attribute__((weak)) strcat (char *__restrict, const char *__restrict);
char *__attribute__((weak)) strncat (char *__restrict, const char *__restrict, size_t);
int __attribute__((weak)) strcmp (const char *, const char *);
int __attribute__((weak)) strncmp (const char *, const char *, size_t);
int __attribute__((weak)) strcoll (const char *, const char *);
size_t __attribute__((weak)) strxfrm (char *__restrict, const char *__restrict, size_t);
char *__attribute__((weak)) strchr (const char *, int);
char *__attribute__((weak)) strrchr (const char *, int);
size_t __attribute__((weak)) strcspn (const char *, const char *);
size_t __attribute__((weak)) strspn (const char *, const char *);
char *__attribute__((weak)) strpbrk (const char *, const char *);
char *__attribute__((weak)) strstr (const char *, const char *);
char *__attribute__((weak)) strtok (char *__restrict, const char *__restrict);
char *__attribute__((weak)) strerror (int);
char *__attribute__((weak)) getenv (const char *);
int __attribute__((weak)) fputs(const char *__restrict, FILE *__restrict);
int __attribute__((weak)) puts(const char *);
int __attribute__((weak)) printf(const char *__restrict, ...);
int __attribute__((weak)) fprintf(FILE *__restrict, const char *__restrict, ...);
int __attribute__((weak)) sprintf(char *__restrict, const char *__restrict, ...);
int __attribute__((weak)) snprintf(char *__restrict, size_t, const char *__restrict, ...);
char * __attribute__((weak)) strchrnul(const char *, int);

int __attribute__((weak)) vprintf(const char *__restrict, __isoc_va_list);
int __attribute__((weak)) vfprintf(FILE *__restrict, const char *__restrict, __isoc_va_list);
int __attribute__((weak)) vsprintf(char *__restrict, const char *__restrict, __isoc_va_list);
int __attribute__((weak)) vsnprintf(char *__restrict, size_t, const char *__restrict, __isoc_va_list);

int __attribute__((weak)) fgetc(FILE *);
int __attribute__((weak)) getc(FILE *);
int __attribute__((weak)) getchar(void);
int __attribute__((weak)) ungetc(int, FILE *);
int __attribute__((weak)) fputc(int, FILE *);
int __attribute__((weak)) putc(int, FILE *);
int __attribute__((weak)) putchar(int);
FILE *__attribute__((weak)) fopen(const char *__restrict, const char *__restrict);
int __attribute__((weak)) fclose(FILE *);
int __attribute__((weak)) fseek(FILE *, long, int);
long __attribute__((weak)) ftell(FILE *);
void __attribute__((weak)) rewind(FILE *);
size_t __attribute__((weak)) fread(void *__restrict, size_t, size_t, FILE *__restrict);
size_t __attribute__((weak)) fwrite(const void *__restrict, size_t, size_t, FILE *__restrict);

int __attribute__((weak)) closedir(DIR *);
DIR *__attribute__((weak)) fdopendir(int);
DIR *__attribute__((weak)) opendir(const char *);
struct dirent *__attribute__((weak)) readdir(DIR *);

time_t __attribute__((weak)) time (time_t *);
struct tm *__attribute__((weak)) localtime (const time_t *);
time_t __attribute__((weak)) mktime (struct tm *);

int __attribute__((weak)) access(const char *, int);
char *__attribute__((weak)) dirname(char *);
char *__attribute__((weak)) basename(char *);
ssize_t __attribute__((weak)) readlink(const char *__restrict, char *__restrict, size_t);
ssize_t __attribute__((weak)) readlinkat(int, const char *__restrict, char *__restrict, size_t);
uid_t __attribute__((weak)) getuid(void);
uid_t __attribute__((weak)) geteuid(void);
gid_t __attribute__((weak)) getgid(void);
gid_t __attribute__((weak)) getegid(void);
int __attribute__((weak)) getgroups(int, gid_t []);
int __attribute__((weak)) setuid(uid_t);
int __attribute__((weak)) seteuid(uid_t);
int __attribute__((weak)) setgid(gid_t);
int __attribute__((weak)) setegid(gid_t);

int    __attribute__((weak)) dlclose(void *);
char  *__attribute__((weak)) dlerror(void);
void  *__attribute__((weak)) dlopen(const char *, int);
void  *__attribute__((weak)) dlsym(void *__restrict, const char *__restrict);

double __attribute__((weak)) pow(double, double);

pthread_t __attribute__((weak)) pthread_self(void);

int __attribute__((weak)) pthread_mutex_init(pthread_mutex_t *__restrict, const pthread_mutexattr_t *__restrict);
int __attribute__((weak)) pthread_mutex_lock(pthread_mutex_t *);
int __attribute__((weak)) pthread_mutex_unlock(pthread_mutex_t *);
int __attribute__((weak)) pthread_mutex_trylock(pthread_mutex_t *);
int __attribute__((weak)) pthread_mutex_timedlock(pthread_mutex_t *__restrict, const struct timespec *__restrict);
int __attribute__((weak)) pthread_mutex_destroy(pthread_mutex_t *);
int __attribute__((weak)) pthread_mutex_consistent(pthread_mutex_t *);

int __attribute__((weak)) pthread_cond_init(pthread_cond_t *__restrict, const pthread_condattr_t *__restrict);
int __attribute__((weak)) pthread_cond_destroy(pthread_cond_t *);
int __attribute__((weak)) pthread_cond_wait(pthread_cond_t *__restrict, pthread_mutex_t *__restrict);
int __attribute__((weak)) pthread_cond_timedwait(pthread_cond_t *__restrict, pthread_mutex_t *__restrict, const struct timespec *__restrict);
int __attribute__((weak)) pthread_cond_broadcast(pthread_cond_t *);
int __attribute__((weak)) pthread_cond_signal(pthread_cond_t *);

#ifdef NDEBUG
#define assert(x) (void)0
#else
#define assert(x) ((void)((x) || (abort(),0)))
#endif

#define alloca __builtin_alloca

#define UINT8_MAX  (0xff)
#define UINT16_MAX (0xffff)
#define UINT32_MAX (0xffffffffu)
#define UINT64_MAX (0xffffffffffffffffu)

#if __UINTPTR_MAX__ == UINT64_MAX
#define __PRI64  "l"
#define __PRIPTR "l"
#else
#define __PRI64  "ll"
#define __PRIPTR ""
#endif

#define PRId8  "d"
#define PRId16 "d"
#define PRId32 "d"
#define PRId64 __PRI64 "d"

#define PRIdLEAST8  "d"
#define PRIdLEAST16 "d"
#define PRIdLEAST32 "d"
#define PRIdLEAST64 __PRI64 "d"

#define PRIdFAST8  "d"
#define PRIdFAST16 "d"
#define PRIdFAST32 "d"
#define PRIdFAST64 __PRI64 "d"

#define PRIi8  "i"
#define PRIi16 "i"
#define PRIi32 "i"
#define PRIi64 __PRI64 "i"

#define PRIiLEAST8  "i"
#define PRIiLEAST16 "i"
#define PRIiLEAST32 "i"
#define PRIiLEAST64 __PRI64 "i"

#define PRIiFAST8  "i"
#define PRIiFAST16 "i"
#define PRIiFAST32 "i"
#define PRIiFAST64 __PRI64 "i"

#define PRIo8  "o"
#define PRIo16 "o"
#define PRIo32 "o"
#define PRIo64 __PRI64 "o"

#define PRIoLEAST8  "o"
#define PRIoLEAST16 "o"
#define PRIoLEAST32 "o"
#define PRIoLEAST64 __PRI64 "o"

#define PRIoFAST8  "o"
#define PRIoFAST16 "o"
#define PRIoFAST32 "o"
#define PRIoFAST64 __PRI64 "o"

#define PRIu8  "u"
#define PRIu16 "u"
#define PRIu32 "u"
#define PRIu64 __PRI64 "u"

static inline size_t strlen(const char *s) {
	const char *a = s;
	for (; *s; s++);
	return s-a;
}

#ifdef __cplusplus
}
#endif

#endif
