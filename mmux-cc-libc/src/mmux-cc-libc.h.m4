/*
  Part of: MMUX CC Libc
  Contents: public header file
  Date: Dec  8, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_LIBC_H
#define MMUX_CC_LIBC_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

/* The  macro MMUX_CC_LIBC_UNUSED  indicates that  a function,  function argument  or
   variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_CC_LIBC_UNUSED;
   int foo (char unused_argument MMUX_CC_LIBC_UNUSED);
   int unused_variable MMUX_CC_LIBC_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_CC_LIBC_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_CC_LIBC_UNUSED		/* empty */
#endif

#ifndef __GNUC__
#  define __attribute__(...)	/* empty */
#endif

#ifndef __GNUC__
#  define __builtin_expect(...)	/* empty */
#endif

#if defined _WIN32 || defined __CYGWIN__
#  ifdef BUILDING_DLL
#    ifdef __GNUC__
#      define mmux_cc_libc_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_cc_libc_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_cc_libc_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_cc_libc_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_cc_libc_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_cc_libc_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_cc_libc_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_cc_libc_decl		extern
#    define mmux_cc_libc_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <stdarg.h>
#include <stdbool.h>
#include <mmux-cc-libc-config.h>
#include <mmux-cc-libc-constants.h>
#include <mmux-cc-types.h>


/** --------------------------------------------------------------------
 ** Initialisation functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_cc_libc_init (void);


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl char const *	mmux_cc_libc_version_string		(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_current	(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_revision	(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Preliminary type definitions.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_file_descriptor_t { mmux_sint_t value; } mmux_libc_file_descriptor_t;


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_timeval_t.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_timeval_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_TIMEVAL]; } mmux_libc_timeval_t;

DEFINE_STRUCT_SETTER_GETTER_PROTOS(timeval,	tv_sec,		mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(timeval,	tv_usec,	mmux_slong_t)

__attribute__((__nonnull__(1))) static inline mmux_time_t
mmux_libc_timeval_seconds_ref (mmux_libc_timeval_t const * timeval_p)
{
  return mmux_libc_tv_sec_ref(timeval_p);
}
__attribute__((__nonnull__(1))) static inline void
mmux_libc_timeval_seconds_set (mmux_libc_timeval_t * timeval_p, mmux_time_t seconds)
{
  mmux_libc_tv_sec_set(timeval_p, seconds);
}

__attribute__((__nonnull__(1))) static inline mmux_time_t
mmux_libc_timeval_microseconds_ref (mmux_libc_timeval_t const * timeval_p)
{
  return mmux_libc_tv_usec_ref(timeval_p);
}
__attribute__((__nonnull__(1))) static inline void
mmux_libc_timeval_microseconds_set (mmux_libc_timeval_t * timeval_p, mmux_slong_t microseconds)
{
  mmux_libc_tv_usec_set(timeval_p, microseconds);
}

mmux_cc_libc_decl bool mmux_libc_timeval_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timeval_t const * timeval_p,
					       char const * struct_name)
  __attribute__((__nonnull__(2)));


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_timespec_t.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_timespec_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_TIMESPEC]; } mmux_libc_timespec_t;

DEFINE_STRUCT_SETTER_GETTER_PROTOS(timespec,	ts_sec,		mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(timespec,	ts_nsec,	mmux_slong_t)

__attribute__((__nonnull__(1))) static inline mmux_time_t
mmux_libc_timespec_seconds_ref (mmux_libc_timespec_t const * timespec_p)
{
  return mmux_libc_ts_sec_ref(timespec_p);
}
__attribute__((__nonnull__(1))) static inline void
mmux_libc_timespec_seconds_set (mmux_libc_timespec_t * timespec_p, mmux_time_t seconds)
{
  mmux_libc_ts_sec_set(timespec_p, seconds);
}

__attribute__((__nonnull__(1))) static inline mmux_time_t
mmux_libc_timespec_nanoseconds_ref (mmux_libc_timespec_t const * timespec_p)
{
  return mmux_libc_ts_nsec_ref(timespec_p);
}
__attribute__((__nonnull__(1))) static inline void
mmux_libc_timespec_nanoseconds_set (mmux_libc_timespec_t * timespec_p, mmux_slong_t nanoseconds)
{
  mmux_libc_ts_nsec_set(timespec_p, nanoseconds);
}

mmux_cc_libc_decl bool mmux_libc_timespec_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timespec_t const * timespec_p,
					       char const * struct_name)
  __attribute__((__nonnull__(2)));


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_tm_t.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_tm_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_TM]; } mmux_libc_tm_t;

DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_sec,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_min,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_hour,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_mday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_mon,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_year,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_wday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_yday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_isdst,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_gmtoff,	mmux_slong_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(tm,	tm_zone,	char const *)

mmux_cc_libc_decl bool mmux_libc_tm_dump (mmux_libc_file_descriptor_t fd, mmux_libc_tm_t const * tm_p,
					  char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl void mmux_libc_tm_reset (mmux_libc_tm_t * tm_p)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Times and dates: functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_nanosleep (mmux_libc_timespec_t * requested_time, mmux_libc_timespec_t * remaining_time)
  __attribute__((__nonnull__(1,2)));


/** --------------------------------------------------------------------
 ** Input/output: file descriptor core API.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl mmux_libc_file_descriptor_t mmux_libc_stdin (void);
mmux_cc_libc_decl mmux_libc_file_descriptor_t mmux_libc_stdou (void);
mmux_cc_libc_decl mmux_libc_file_descriptor_t mmux_libc_stder (void);

#define MMUX_LIBC_STDIN		(mmux_libc_stdin())
#define MMUX_LIBC_STDOU		(mmux_libc_stdou())
#define MMUX_LIBC_STDER		(mmux_libc_stder())

mmux_cc_libc_decl bool mmux_libc_dprintf (mmux_libc_file_descriptor_t fd, char const * template, ...)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_dprintfou (char const * template, ...)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_dprintfer (char const * template, ...)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_open (mmux_libc_file_descriptor_t * fd, char const * pathname, mmux_sint_t flags, mmux_sint_t mode)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_openat (mmux_libc_file_descriptor_t * fd, mmux_libc_file_descriptor_t dirfd,
					 char const * pathname, mmux_sint_t flags, mmux_sint_t mode)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_close (mmux_libc_file_descriptor_t fd);

mmux_cc_libc_decl bool mmux_libc_read (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd,
				       mmux_pointer_t bufptr, mmux_usize_t buflen)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_write (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd,
					mmux_pointer_t bufptr, mmux_usize_t buflen)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_pread (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd,
					mmux_pointer_t bufptr, mmux_usize_t buflen, mmux_off_t offset)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_pwrite (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd,
					 mmux_pointer_t bufptr, mmux_usize_t buflen, mmux_off_t offset)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_lseek (mmux_libc_file_descriptor_t fd, mmux_off_t * offset_p, mmux_sint_t whence)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_dup (mmux_libc_file_descriptor_t * new_fd_p, mmux_libc_file_descriptor_t old_fd)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_dup2 (mmux_libc_file_descriptor_t old_fd, mmux_libc_file_descriptor_t new_fd);
mmux_cc_libc_decl bool mmux_libc_dup3 (mmux_libc_file_descriptor_t old_fd, mmux_libc_file_descriptor_t new_fd, mmux_sint_t flags);

mmux_cc_libc_decl bool mmux_libc_pipe (mmux_libc_file_descriptor_t fds[2]);


/** --------------------------------------------------------------------
 ** Input/output: file descriptor scatter-gather API.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_iovec_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_IOVEC]; } mmux_libc_iovec_t;

typedef struct mmux_libc_iovec_array_t {
  mmux_libc_iovec_t *	iova_pointer;
  mmux_usize_t		iova_length;
} mmux_libc_iovec_array_t;


DEFINE_STRUCT_SETTER_GETTER_PROTOS(iovec,	iov_base,	mmux_pointer_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(iovec,	iov_len,	mmux_usize_t)

DEFINE_STRUCT_SETTER_GETTER_PROTOS(iovec_array,	iova_pointer,	mmux_pointer_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(iovec_array,	iova_length,	mmux_usize_t)

mmux_cc_libc_decl bool mmux_libc_readv (mmux_usize_t * nbytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_writev (mmux_usize_t * nbytes_written_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_preadv (mmux_usize_t * nbytes_read_p, mmux_libc_file_descriptor_t fd,
					 mmux_libc_iovec_array_t iovec_array, mmux_off_t offset)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_pwritev (mmux_usize_t * nbytes_written_p, mmux_libc_file_descriptor_t fd,
					  mmux_libc_iovec_array_t iovec_array, mmux_off_t offset)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_preadv2 (mmux_usize_t * nbytes_read_p, mmux_libc_file_descriptor_t fd,
					  mmux_libc_iovec_array_t iovec_array, mmux_off_t offset, mmux_sint_t flags)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_pwritev2 (mmux_usize_t * nbytes_written_p, mmux_libc_file_descriptor_t fd,
					   mmux_libc_iovec_array_t iovec_array, mmux_off_t offset, mmux_sint_t flags)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_iovec_dump (mmux_libc_file_descriptor_t fd, mmux_libc_iovec_t const * iovec_p, char const * struct_name);


/** --------------------------------------------------------------------
 ** Input/output: file locking API.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_flock_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_FLOCK]; } mmux_libc_flock_t;

DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_type,		mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_whence,	mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_start,	mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_len,		mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_pid,		mmux_pid_t)

mmux_cc_libc_decl bool mmux_libc_flock_dump (mmux_libc_file_descriptor_t fd, mmux_libc_flock_t const * flock_p, char const * struct_name);
mmux_cc_libc_decl bool mmux_libc_flag_to_symbol_struct_flock_l_type (char const ** const str_p, mmux_sint_t flag);


/** --------------------------------------------------------------------
 ** Input/output: selecting file descriptors.
 ** ----------------------------------------------------------------- */

typedef struct mmux_libc_fd_set_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_FD_SET]; } mmux_libc_fd_set_t;


mmux_cc_libc_decl bool mmux_libc_fd_set_dump (mmux_libc_file_descriptor_t fd, mmux_libc_fd_set_t const * fd_set_p, char const * struct_name);


/** --------------------------------------------------------------------
 ** System configuration.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_sysconf (mmux_slong_t * result_p, mmux_sint_t parameter)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_confstr_size (mmux_usize_t * required_nbytes_p, mmux_sint_t parameter);
mmux_cc_libc_decl bool mmux_libc_confstr (mmux_sint_t parameter, char * bufptr, mmux_usize_t buflen)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_pathconf (mmux_slong_t * result_p, char const * pathname, mmux_sint_t parameter)
  __attribute__((__nonnull__(1,2)));

/* ------------------------------------------------------------------ */

typedef struct mmux_libc_rlimit_t { mmux_uint8_t value[MMUX_LIBC_SIZEOF_RLIMIT]; } mmux_libc_rlimit_t;

DEFINE_STRUCT_SETTER_GETTER_PROTOS(rlimit,	rlim_cur,	mmux_rlim_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(rlimit,	rlim_max,	mmux_rlim_t)

mmux_cc_libc_decl bool mmux_libc_rlimit_dump (mmux_libc_file_descriptor_t fd, mmux_libc_rlimit_t * rlimit_pointer,
					      char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_getrlimit (mmux_sint_t resource, mmux_libc_rlimit_t * rlimit_p)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_setrlimit (mmux_sint_t resource, mmux_libc_rlimit_t * rlimit_p)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_prlimit (mmux_pid_t pid, mmux_sint_t resource,
					  mmux_libc_rlimit_t * new_rlimit_p, mmux_libc_rlimit_t * old_rlimit_p)
  __attribute__((__nonnull__(3,4)));


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_fcntl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);
mmux_cc_libc_decl bool mmux_libc_fcntl_command_flag_to_symbol (char const ** const str_p, mmux_sint_t flag);

mmux_cc_libc_decl bool mmux_libc_ioctl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_LIBC_H */

/* end of file */
