/*
  Part of: MMUX CC Libc
  Contents: public header file
  Date: Dec 14, 2024

  Abstract

	This header file declares function prototypes.

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

#ifndef MMUX_CC_LIBC_FUNCTIONS_H
#define MMUX_CC_LIBC_FUNCTIONS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <stdarg.h>


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
 ** Memory.
 ** ----------------------------------------------------------------- */

#define mmux_libc_malloc(P_P,LEN)		mmux_libc_malloc_((mmux_pointer_t *)(P_P),(LEN))
#define mmux_libc_calloc(P_P,INUM,ILEN)		mmux_libc_calloc_((mmux_pointer_t *)(P_P),(INUM),(ILEN))
#define mmux_libc_realloc(P_P,LEN)		mmux_libc_realloc_((mmux_pointer_t *)(P_P),(LEN))
#define mmux_libc_reallocarray(P_P,INUM,ILEN)	mmux_libc_reallocarray_((mmux_pointer_t *)(P_P),(INUM),(ILEN))

mmux_cc_libc_decl bool mmux_libc_malloc_ (mmux_pointer_t * P_p, mmux_usize_t len)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_calloc_ (mmux_pointer_t * P_p, mmux_usize_t item_num, mmux_usize_t item_len)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_realloc_ (mmux_pointer_t * P_p, mmux_usize_t newlen)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_reallocarray_ (mmux_pointer_t * P_p, mmux_usize_t item_num, mmux_usize_t item_len)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_free (mmux_pointer_t p)
  __attribute__((__nonnull__));

mmux_cc_libc_decl bool mmux_libc_memset (mmux_pointer_t ptr, mmux_uint8_t octet, mmux_usize_t len)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_memzero (mmux_pointer_t ptr, mmux_usize_t len)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_memcpy (mmux_pointer_t dst_ptr, mmux_pointer_t src_ptr, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_mempcpy (mmux_pointer_t * result_p, mmux_pointer_t dst_ptr, mmux_pointer_t src_ptr, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2,3)));

mmux_cc_libc_decl bool mmux_libc_memccpy (mmux_pointer_t * result_p, mmux_pointer_t dst_ptr, mmux_pointer_t src_ptr,
					  mmux_uint8_t octet, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2,3)));

mmux_cc_libc_decl bool mmux_libc_memmove (mmux_pointer_t dst_ptr, mmux_pointer_t src_ptr, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_memcmp (mmux_sint_t * result_p, mmux_pointer_t dst_ptr, mmux_pointer_t src_ptr, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2,3)));

mmux_cc_libc_decl bool mmux_libc_memchr (mmux_pointer_t * result_p, mmux_pointer_t ptr, mmux_octet_t octet, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_rawmemchr (mmux_pointer_t * result_p, mmux_pointer_t ptr, mmux_octet_t octet)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_memrchr (mmux_pointer_t * result_p, mmux_pointer_t ptr, mmux_octet_t octet, mmux_usize_t nbytes)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_memmem (mmux_pointer_t * result_p,
					 mmux_pointer_t haystack_ptr, mmux_usize_t haystack_len,
					 mmux_pointer_t needle_ptr,   mmux_usize_t needle_len)
  __attribute__((__nonnull__(1,2,4)));


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_timeval_t.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(timeval,	tv_sec,		mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(timeval,	tv_usec,	mmux_slong_t)

mmux_cc_libc_decl bool mmux_libc_timeval_set (mmux_libc_timeval_t * timeval_p, mmux_time_t seconds, mmux_slong_t microseconds)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_timeval_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timeval_t const * timeval_p,
					       char const * struct_name)
  __attribute__((__nonnull__(2)));


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_timespec_t.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(timespec,	ts_sec,		mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(timespec,	ts_nsec,	mmux_slong_t)

mmux_cc_libc_decl bool mmux_libc_timespec_set (mmux_libc_timespec_t * timespec_p, mmux_time_t seconds, mmux_slong_t nanoseconds)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_timespec_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timespec_t const * timespec_p,
					       char const * struct_name)
  __attribute__((__nonnull__(2)));


/** --------------------------------------------------------------------
 ** Times and dates: mmux_libc_tm_t.
 ** ----------------------------------------------------------------- */

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

mmux_cc_libc_decl bool mmux_libc_tm_reset (mmux_libc_tm_t * tm_p)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Times and dates: functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_time      (mmux_time_t * result_p)
       __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_localtime (mmux_libc_tm_t * * result_p, mmux_time_t T)
       __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gmtime    (mmux_libc_tm_t * * result_p, mmux_time_t T)
       __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_ctime     (char const * * result_p, mmux_time_t T)
       __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_mktime    (mmux_time_t * result_p, mmux_libc_tm_t * tm_p)
       __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_timegm    (mmux_time_t * result_p, mmux_libc_tm_t * tm_p)
       __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_asctime   (char const * * result_p, mmux_libc_tm_t * tm_p)
       __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_strftime (char * bufptr, mmux_usize_t * buflen_p, char const * template, mmux_libc_tm_t * tm_p)
  __attribute__((__nonnull__(1,2,3,4)));

mmux_cc_libc_decl bool mmux_libc_strptime (char ** first_unprocessed_after_timestamp_p,
					   char const * input_string, char const * template, mmux_libc_tm_t * tm_p)
  __attribute__((__nonnull__(2,3,4)));

mmux_cc_libc_decl bool mmux_libc_sleep     (mmux_uint_t * result_p, mmux_uint_t seconds)
       __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_nanosleep (mmux_libc_timespec_t * requested_time, mmux_libc_timespec_t * remaining_time)
  __attribute__((__nonnull__(1,2)));


/** --------------------------------------------------------------------
 ** Input/output: file descriptor core API.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_make_fd (mmux_libc_file_descriptor_t * result_p, mmux_sint_t fd_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_stdin (mmux_libc_file_descriptor_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_stdou (mmux_libc_file_descriptor_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_stder (mmux_libc_file_descriptor_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_at_fdcwd (mmux_libc_file_descriptor_t * result_p)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_fd_parse (mmux_libc_fd_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_fd_sprint (char * ptr, mmux_usize_t len, mmux_libc_fd_t fd)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_fd_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_fd_t fd)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_dprintf (mmux_libc_file_descriptor_t fd, char const * template, ...)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_dprintfou (char const * template, ...)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_dprintfer (char const * template, ...)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_open (mmux_libc_file_descriptor_t * fd, char const * pathname, mmux_sint_t flags, mmux_mode_t mode)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_openat (mmux_libc_file_descriptor_t * fd, mmux_libc_file_descriptor_t dirfd,
					 char const * pathname, mmux_sint_t flags, mmux_mode_t mode)
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

mmux_cc_libc_decl bool mmux_libc_close_pipe (mmux_libc_file_descriptor_t fds[2]);


/** --------------------------------------------------------------------
 ** Input/output: selecting file descriptors.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_FD_ZERO  (mmux_libc_fd_set_t * fd_set_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_FD_SET   (mmux_libc_file_descriptor_t fd, mmux_libc_fd_set_t * fd_set_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_FD_CLR   (mmux_libc_file_descriptor_t fd, mmux_libc_fd_set_t * fd_set_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_FD_ISSET (bool * result_p, mmux_libc_file_descriptor_t fd, mmux_libc_fd_set_t const * fd_set_p)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_select (mmux_uint_t * nfds_ready,
					 mmux_uint_t maximum_nfds_to_check,
					 mmux_libc_fd_set_t * read_fd_set_p,
					 mmux_libc_fd_set_t * write_fd_set_p,
					 mmux_libc_fd_set_t * except_fd_set_p,
					 mmux_libc_timeval_t * timeout_p);


/** --------------------------------------------------------------------
 ** Input/output: file descriptor scatter-gather API.
 ** ----------------------------------------------------------------- */

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

DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_type,		mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_whence,	mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_start,	mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_len,		mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(flock,	l_pid,		mmux_libc_pid_t)

mmux_cc_libc_decl bool mmux_libc_flock_dump (mmux_libc_file_descriptor_t fd, mmux_libc_flock_t const * flock_p, char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_flag_to_symbol_struct_flock_l_type (char const ** str_p, mmux_sint_t flag)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Input/output: file locking API.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_copy_file_range (mmux_usize_t * number_of_bytes_copied_p,
						  mmux_libc_file_descriptor_t input_fd, mmux_sint64_t * input_position_p,
						  mmux_libc_file_descriptor_t ouput_fd, mmux_sint64_t * ouput_position_p,
						  mmux_usize_t number_of_bytes_to_copy, mmux_sint_t flags)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Input/output: control.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_fcntl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);
mmux_cc_libc_decl bool mmux_libc_fcntl_command_flag_to_symbol (char const ** str_p, mmux_sint_t flag);

mmux_cc_libc_decl bool mmux_libc_ioctl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);


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

mmux_cc_libc_decl bool mmux_libc_fpathconf (mmux_slong_t * result_p, mmux_libc_file_descriptor_t fd, mmux_sint_t parameter)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(rlimit,	rlim_cur,	mmux_rlim_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(rlimit,	rlim_max,	mmux_rlim_t)

mmux_cc_libc_decl bool mmux_libc_rlimit_dump (mmux_libc_file_descriptor_t fd, mmux_libc_rlimit_t * rlimit_pointer,
					      char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_getrlimit (mmux_sint_t resource, mmux_libc_rlimit_t * rlimit_p)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_setrlimit (mmux_sint_t resource, mmux_libc_rlimit_t * rlimit_p)
  __attribute__((__nonnull__(2)));
mmux_cc_libc_decl bool mmux_libc_prlimit (mmux_libc_pid_t pid, mmux_sint_t resource,
					  mmux_libc_rlimit_t * new_rlimit_p, mmux_libc_rlimit_t * old_rlimit_p)
  __attribute__((__nonnull__(3,4)));


/** --------------------------------------------------------------------
 ** Processes.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_make_pid (mmux_libc_pid_t * result_p, mmux_pid_t pid_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_pid_parse (mmux_libc_pid_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_pid_sprint (char * ptr, mmux_usize_t len, mmux_libc_pid_t pid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_pid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_pid_t pid)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_getpid  (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getppid (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gettid (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Persona.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_name,	char const *)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_passwd,	char const *)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_uid,		mmux_libc_uid_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_gid,		mmux_libc_gid_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_gecos,	char const *)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_dir,		char const *)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(passwd,	pw_shell,	char const *)

mmux_cc_libc_decl bool mmux_libc_passwd_dump (mmux_libc_file_descriptor_t fd, mmux_libc_passwd_t const * passw_p,
					      char const * struct_name)
  __attribute__((__nonnull__(2)));

DEFINE_STRUCT_SETTER_GETTER_PROTOS(group,	gr_name,	char const *)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(group,	gr_gid,		mmux_libc_gid_t)

mmux_cc_libc_decl bool mmux_libc_gr_mem_set (mmux_libc_group_t * const P, mmux_asciizcp_t * value)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gr_mem_ref (mmux_asciizcp_t * * result_p, mmux_libc_group_t const * const P)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_group_dump (mmux_libc_file_descriptor_t fd, mmux_libc_group_t const * passw_p,
					     char const * struct_name)
  __attribute__((__nonnull__(2)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_make_uid (mmux_libc_uid_t * result_p, mmux_uid_t uid_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_uid_parse (mmux_libc_uid_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_uid_sprint (char * ptr, mmux_usize_t len, mmux_libc_uid_t uid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_uid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_uid_t uid)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_make_gid (mmux_libc_gid_t * result_p, mmux_gid_t gid_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gid_parse (mmux_libc_gid_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_gid_sprint (char * ptr, mmux_usize_t len, mmux_libc_gid_t gid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_gid_t gid)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_getuid (mmux_libc_uid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getgid (mmux_libc_gid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_geteuid (mmux_libc_uid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getegid (mmux_libc_gid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getgroups_size (mmux_usize_t * ngroups_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getgroups (mmux_usize_t * ngroups_p, mmux_libc_gid_t * groups_p)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_getgrouplist_size (mmux_usize_t * result_ngroups_p, char const * username, mmux_libc_gid_t gid)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_getgrouplist (char const * username, mmux_libc_gid_t gid,
					       mmux_usize_t * ngroups_p, mmux_libc_gid_t * groups_p)
  __attribute__((__nonnull__(1,3,4)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_setuid   (mmux_libc_uid_t uid);
mmux_cc_libc_decl bool mmux_libc_seteuid  (mmux_libc_uid_t uid);
mmux_cc_libc_decl bool mmux_libc_setreuid (mmux_libc_uid_t uid, mmux_libc_uid_t euid);

mmux_cc_libc_decl bool mmux_libc_setgid   (mmux_libc_gid_t gid);
mmux_cc_libc_decl bool mmux_libc_setegid  (mmux_libc_gid_t gid);
mmux_cc_libc_decl bool mmux_libc_setregid (mmux_libc_gid_t gid, mmux_libc_gid_t egid);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_getlogin (char const * * username_p);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_getpwuid (mmux_libc_passwd_t * * result_passwd_pp, mmux_libc_uid_t uid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getpwnam (mmux_libc_passwd_t * * result_passwd_pp, char const * username)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_getgrgid (mmux_libc_group_t * * result_group_pp, mmux_libc_gid_t gid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getgrnam (mmux_libc_group_t * * result_group_pp, char const * username)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_group_member (bool * result_is_member_p, mmux_libc_gid_t gid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_setpwent (void);
mmux_cc_libc_decl bool mmux_libc_endpwent (void);
mmux_cc_libc_decl bool mmux_libc_getpwent (mmux_libc_passwd_t * * result_passwd_pp)
  __attribute__((__nonnull__(1)));
mmux_cc_libc_decl bool mmux_libc_setgrent (void);
mmux_cc_libc_decl bool mmux_libc_endgrent (void);
mmux_cc_libc_decl bool mmux_libc_getgrent (mmux_libc_group_t * * result_group_pp)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** File system.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_make_file_system_pathname (mmux_libc_file_system_pathname_t * pathname_p,
							    mmux_asciizcp_t asciiz_pathname)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_file_system_pathname_asciizp_ref (mmux_asciizcp_t * asciiz_pathname_p,
								   mmux_libc_file_system_pathname_t pathname)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_file_system_pathname_free (mmux_libc_file_system_pathname_t pathname);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_link (mmux_libc_file_system_pathname_t oldname, mmux_libc_file_system_pathname_t newname);

mmux_cc_libc_decl bool mmux_libc_linkat (mmux_libc_file_descriptor_t oldfd, mmux_libc_file_system_pathname_t oldname,
					 mmux_libc_file_descriptor_t newfd, mmux_libc_file_system_pathname_t newname,
					 mmux_sint_t flags);

mmux_cc_libc_decl bool mmux_libc_symlink (mmux_libc_file_system_pathname_t oldname, mmux_libc_file_system_pathname_t newname);

mmux_cc_libc_decl bool mmux_libc_readlink (mmux_usize_t * required_nbytes_p, mmux_libc_file_system_pathname_t linkname,
					   mmux_asciizp_t buffer, mmux_usize_t provided_nbytes)
  __attribute__((__nonnull__(1,3)));

mmux_cc_libc_decl bool mmux_libc_readlink_malloc (mmux_libc_file_system_pathname_t * result_pathname_p,
						  mmux_libc_file_system_pathname_t linkname)
  __attribute__((__nonnull__(1)));

/* The argument "linkname" can be NULL on some versions of Linux. */
mmux_cc_libc_decl bool mmux_libc_readlinkat (mmux_usize_t * required_nbytes_p, mmux_libc_file_descriptor_t dirfd,
					     mmux_libc_file_system_pathname_t linkname,
					     mmux_asciizp_t buffer, mmux_usize_t provided_nbytes)
  __attribute__((__nonnull__(1,4)));

/* The argument "linkname" can be NULL on some versions of Linux. */
mmux_cc_libc_decl bool mmux_libc_readlinkat_malloc (mmux_libc_file_system_pathname_t * result_pathname_p,
						    mmux_libc_file_descriptor_t dirfd,
						    mmux_libc_file_system_pathname_t linkname)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_canonicalize_file_name (mmux_libc_file_system_pathname_t * result_pathname_p,
							 mmux_libc_file_system_pathname_t input_pathname)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_realpath (mmux_libc_file_system_pathname_t * result_pathname_p,
					   mmux_libc_file_system_pathname_t input_pathname)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_unlink (mmux_libc_file_system_pathname_t pathname);

mmux_cc_libc_decl bool mmux_libc_unlinkat (mmux_libc_file_descriptor_t dirfd,
					   mmux_libc_file_system_pathname_t pathname, mmux_sint_t flags);

mmux_cc_libc_decl bool mmux_libc_rmdir (mmux_libc_file_system_pathname_t pathname);

mmux_cc_libc_decl bool mmux_libc_remove (mmux_libc_file_system_pathname_t pathname);

mmux_cc_libc_decl bool mmux_libc_rename (mmux_libc_file_system_pathname_t oldname, mmux_libc_file_system_pathname_t newname);

mmux_cc_libc_decl bool mmux_libc_renameat (mmux_libc_file_descriptor_t olddirfd, mmux_libc_file_system_pathname_t oldname,
					   mmux_libc_file_descriptor_t newdirfd, mmux_libc_file_system_pathname_t newname);

mmux_cc_libc_decl bool mmux_libc_renameat2 (mmux_libc_file_descriptor_t olddirfd, mmux_libc_file_system_pathname_t oldname,
					    mmux_libc_file_descriptor_t newdirfd, mmux_libc_file_system_pathname_t newname,
					    mmux_uint_t flags);

mmux_cc_libc_decl bool mmux_libc_mkdir (mmux_libc_file_system_pathname_t pathname, mmux_mode_t mode);

mmux_cc_libc_decl bool mmux_libc_mkdirat (mmux_libc_file_descriptor_t dirfd, mmux_libc_file_system_pathname_t pathname, mmux_mode_t mode);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_chown (mmux_libc_file_system_pathname_t pathname, mmux_libc_uid_t uid, mmux_libc_gid_t gid);

mmux_cc_libc_decl bool mmux_libc_fchown (mmux_libc_file_descriptor_t fd, mmux_libc_uid_t uid, mmux_libc_gid_t gid);

mmux_cc_libc_decl bool mmux_libc_lchown (mmux_libc_file_system_pathname_t pathname, mmux_libc_uid_t uid, mmux_libc_gid_t gid);

mmux_cc_libc_decl bool mmux_libc_fchownat (mmux_libc_file_descriptor_t dirfd, mmux_libc_file_system_pathname_t pathname,
					   mmux_libc_uid_t uid, mmux_libc_gid_t gid, mmux_sint_t flags);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_umask (mmux_mode_t * old_mask_p, mmux_mode_t new_mask)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getumask (mmux_mode_t * current_mask_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_chmod (mmux_libc_file_system_pathname_t pathname, mmux_mode_t mode);

mmux_cc_libc_decl bool mmux_libc_fchmod (mmux_libc_file_descriptor_t fd, mmux_mode_t mode);

mmux_cc_libc_decl bool mmux_libc_fchmodat (mmux_libc_file_descriptor_t dirfd, mmux_libc_file_system_pathname_t pathname,
					   mmux_mode_t mode, mmux_sint_t flags);

mmux_cc_libc_decl bool mmux_libc_access (mmux_libc_file_system_pathname_t pathname, mmux_sint_t how);

mmux_cc_libc_decl bool mmux_libc_faccessat (mmux_libc_file_descriptor_t dirfd, mmux_libc_file_system_pathname_t pathname,
					    mmux_sint_t how, mmux_sint_t flags);

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_truncate (mmux_libc_file_system_pathname_t pathname, mmux_off_t len);

mmux_cc_libc_decl bool mmux_libc_ftruncate (mmux_libc_file_descriptor_t fd, mmux_off_t len);

/* ------------------------------------------------------------------ */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_mode,	mmux_mode_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_ino,		mmux_uintmax_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_dev,		mmux_uintmax_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_nlink,	mmux_uintmax_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_uid,		mmux_libc_uid_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_gid,		mmux_libc_gid_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_size,	mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_atime_sec,	mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_atime_nsec,	mmux_slong_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_mtime_sec,	mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_mtime_nsec,	mmux_slong_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_ctime_sec,	mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_ctime_nsec,	mmux_slong_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_blocks,	mmux_uintmax_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(stat,	st_blksize,	mmux_uint_t)

mmux_cc_libc_decl bool mmux_libc_stat_dump (mmux_libc_file_descriptor_t fd, mmux_libc_stat_t const * stat_p,
					    char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_stat (mmux_libc_file_system_pathname_t pathname, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_fstat (mmux_libc_file_descriptor_t fd, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_lstat (mmux_libc_file_system_pathname_t pathname, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_fstatat (mmux_libc_file_descriptor_t dirfd, mmux_libc_file_system_pathname_t pathname,
					  mmux_libc_stat_t * stat_p, mmux_sint_t flags)
  __attribute__((__nonnull__(3)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_S_TYPEISMQ (bool * result_p, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_S_TYPEISSEM (bool * result_p, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_S_TYPEISSHM (bool * result_p, mmux_libc_stat_t * stat_p)
  __attribute__((__nonnull__(1,2)));

/* ------------------------------------------------------------------ */

mmux_cc_libc_decl bool mmux_libc_S_ISDIR (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISCHR (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISBLK (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISREG (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISFIFO (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISLNK (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_S_ISSOCK (bool * result_p, mmux_mode_t mode)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

DEFINE_STRUCT_SETTER_GETTER_PROTOS(utimbuf, actime,  mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER_PROTOS(utimbuf, modtime, mmux_time_t)

mmux_cc_libc_decl bool mmux_libc_utimbuf_dump (mmux_libc_file_descriptor_t fd, mmux_libc_utimbuf_t const * utimbuf_p,
					       char const * struct_name)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_utime (mmux_libc_file_system_pathname_t pathname, mmux_libc_utimbuf_t * utimbuf_p)
  __attribute__((__nonnull__(2)));

mmux_cc_libc_decl bool mmux_libc_utimes (mmux_libc_file_system_pathname_t pathname,
					 mmux_libc_timeval_t * access_timeval_pointer, mmux_libc_timeval_t * modification_timeval_pointer)
  __attribute__((__nonnull__(2,3)));

mmux_cc_libc_decl bool mmux_libc_lutimes (mmux_libc_file_system_pathname_t pathname,
					  mmux_libc_timeval_t * access_timeval_pointer, mmux_libc_timeval_t * modification_timeval_pointer)
  __attribute__((__nonnull__(2,3)));

mmux_cc_libc_decl bool mmux_libc_futimes (mmux_libc_file_descriptor_t fd,
					  mmux_libc_timeval_t * access_timeval_pointer, mmux_libc_timeval_t * modification_timeval_pointer)
  __attribute__((__nonnull__(2,3)));


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_LIBC_FUNCTIONS_H */

/* end of file */
