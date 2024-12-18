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

mmux_cc_libc_decl bool mmux_libc_getpid  (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_getppid (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_gettid (mmux_libc_pid_t * result_p)
  __attribute__((__nonnull__(1)));


/** --------------------------------------------------------------------
 ** Persona.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_make_uid (mmux_libc_uid_t * result_p, mmux_uid_t uid_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_make_gid (mmux_libc_gid_t * result_p, mmux_gid_t gid_num)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_uid_parse (mmux_libc_uid_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_libc_decl bool mmux_libc_uid_sprint (char * ptr, mmux_usize_t len, mmux_libc_uid_t uid)
  __attribute__((__nonnull__(1)));

mmux_cc_libc_decl bool mmux_libc_uid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_uid_t uid)
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


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_libc_fcntl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);
mmux_cc_libc_decl bool mmux_libc_fcntl_command_flag_to_symbol (char const ** str_p, mmux_sint_t flag);

mmux_cc_libc_decl bool mmux_libc_ioctl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_LIBC_FUNCTIONS_H */

/* end of file */
