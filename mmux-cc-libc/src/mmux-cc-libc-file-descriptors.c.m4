/*
  Part of: MMUX CC Libc
  Contents: file descriptor functions
  Date: Dec  8, 2024

  Abstract

	This module implements file descriptor functions.

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


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-libc-internals.h>


/** --------------------------------------------------------------------
 ** Input/output: file descriptor core API.
 ** ----------------------------------------------------------------- */

static const mmux_libc_file_descriptor_t stdin_fd = { .value = 0 };
static const mmux_libc_file_descriptor_t stdou_fd = { .value = 1 };
static const mmux_libc_file_descriptor_t stder_fd = { .value = 2 };

mmux_libc_file_descriptor_t
mmux_libc_stdin (void)
{
  return stdin_fd;
}
mmux_libc_file_descriptor_t
mmux_libc_stdou (void)
{
  return stdou_fd;
}
mmux_libc_file_descriptor_t
mmux_libc_stder (void)
{
  return stder_fd;
}

bool
mmux_libc_dprintf (mmux_libc_file_descriptor_t fd, char const * template, ...)
{
  va_list	ap;
  int		rv;

  va_start(ap, template);
  {
    rv = vdprintf(fd.value, template, ap);
  }
  va_end(ap);
  return ((0 <= rv)? false : true);
}
bool
mmux_libc_dprintfou (char const * template, ...)
{
  va_list	ap;
  int		rv;

  va_start(ap, template);
  {
    rv = vdprintf(stdou_fd.value, template, ap);
  }
  va_end(ap);
  return ((0 <= rv)? false : true);
}
bool
mmux_libc_dprintfer (char const * template, ...)
{
  va_list	ap;
  int		rv;

  va_start(ap, template);
  {
    rv = vdprintf(stder_fd.value, template, ap);
  }
  va_end(ap);
  return ((0 <= rv)? false : true);
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_open (mmux_libc_file_descriptor_t * fd, char const * pathname, mmux_sint_t flags, mmux_sint_t mode)
{
  int	fdval = open(pathname, flags, mode);

  if (-1 != fdval) {
    fd->value = fdval;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_close (mmux_libc_file_descriptor_t fd)
{
  int	rv = close(fd.value);

  return ((-1 != rv)? false : true);
}
bool
mmux_libc_openat (mmux_libc_file_descriptor_t * fd, mmux_libc_file_descriptor_t dirfd,
		  char const * pathname, mmux_sint_t flags, mmux_sint_t mode)
{
  int	fdval = openat(dirfd.value, pathname, flags, mode);

  if (-1 != fdval) {
    fd->value = fdval;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_read (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd, mmux_pointer_t bufptr, mmux_usize_t buflen)
{
  ssize_t	nbytes_done = read(fd.value, bufptr, buflen);

  if (0 <= nbytes_done) {
    *nbytes_done_p = nbytes_done;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_write (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd, mmux_pointer_t bufptr, mmux_usize_t buflen)
{
  ssize_t	nbytes_done = write(fd.value, bufptr, buflen);

  if (0 <= nbytes_done) {
    *nbytes_done_p = nbytes_done;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_pread (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd, mmux_pointer_t bufptr, mmux_usize_t buflen,
		 mmux_off_t offset)
{
  ssize_t	nbytes_done = pread(fd.value, bufptr, buflen, offset);

  if (0 <= nbytes_done) {
    *nbytes_done_p = nbytes_done;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_pwrite (mmux_usize_t * nbytes_done_p, mmux_libc_file_descriptor_t fd, mmux_pointer_t bufptr, mmux_usize_t buflen,
		  mmux_off_t offset)
{
  ssize_t	nbytes_done = pwrite(fd.value, bufptr, buflen, offset);

  if (0 <= nbytes_done) {
    *nbytes_done_p = nbytes_done;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_lseek (mmux_libc_file_descriptor_t fd, mmux_off_t * offset_p, mmux_sint_t whence)
{
  mmux_off_t	offset = lseek(fd.value, *offset_p, whence);

  if (-1 != offset) {
    *offset_p = offset;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_dup (mmux_libc_file_descriptor_t * new_fd_p, mmux_libc_file_descriptor_t old_fd)
{
  mmux_libc_file_descriptor_t	new_fd = { .value = dup(old_fd.value) };

  if (-1 != new_fd.value) {
    *new_fd_p = new_fd;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_dup2 (mmux_libc_file_descriptor_t old_fd, mmux_libc_file_descriptor_t new_fd)
{
  int	rv = dup2(old_fd.value, new_fd.value);

  return ((-1 != rv)? false : true);
}
#ifdef HAVE_DUP3
bool
mmux_libc_dup3 (mmux_libc_file_descriptor_t old_fd, mmux_libc_file_descriptor_t new_fd, mmux_sint_t flags)
{
  int	rv = dup3(old_fd.value, new_fd.value, flags);

  return ((-1 != rv)? false : true);
}
#endif

/* ------------------------------------------------------------------ */

bool
mmux_libc_pipe (mmux_libc_file_descriptor_t fds[2])
{
  int		fdvals[2];
  int		rv = pipe(fdvals);

  if (-1 != rv) {
    fds[0].value = fdvals[0];
    fds[1].value = fdvals[1];
    return false;
  } else {
    return true;
  }
}


/** --------------------------------------------------------------------
 ** Input/output: file descriptor scatter-gather API.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER(iovec,		iov_base,	mmux_pointer_t);
DEFINE_STRUCT_SETTER_GETTER(iovec,		iov_len,	mmux_usize_t);
DEFINE_STRUCT_SETTER_GETTER(iovec_array,	iova_pointer,	mmux_pointer_t)
DEFINE_STRUCT_SETTER_GETTER(iovec_array,	iova_length,	mmux_usize_t)

bool
mmux_libc_iovec_dump (mmux_libc_file_descriptor_t fd, mmux_libc_iovec_t const * const iovec_p, char const * const struct_name)
{
  int	rv;

  rv = dprintf(fd.value, "%s->iov_base = %p\n", struct_name, iovec_p->iov_base);
  if (0 > rv) { return true; }

  {
    int		len = mmux_usize_sprint_size(iovec_p->iov_len);
    char	str[len];

    mmux_usize_sprint(str, len, iovec_p->iov_len);
    rv = dprintf(fd.value, "%s->iov_len = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  return false;
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_readv (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array)
{
  mmux_ssize_t	rv = readv(fd.value, iovec_array.iova_pointer, iovec_array.iova_length);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_writev (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array)
{
  mmux_ssize_t	rv = writev(fd.value, iovec_array.iova_pointer, iovec_array.iova_length);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_preadv (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array,
		  mmux_off_t offset)
{
  mmux_ssize_t	rv = preadv(fd.value, iovec_array.iova_pointer, iovec_array.iova_length, offset);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_pwritev (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array,
		   mmux_off_t offset)
{
  mmux_ssize_t	rv = pwritev(fd.value, iovec_array.iova_pointer, iovec_array.iova_length, offset);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_preadv2 (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array,
		   mmux_off_t offset, mmux_sint_t flags)
{
  mmux_ssize_t	rv = preadv2(fd.value, iovec_array.iova_pointer, iovec_array.iova_length, offset, flags);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_pwritev2 (mmux_usize_t * number_of_bytes_read_p, mmux_libc_file_descriptor_t fd, mmux_libc_iovec_array_t iovec_array,
		    mmux_off_t offset, mmux_sint_t flags)
{
  mmux_ssize_t	rv = pwritev2(fd.value, iovec_array.iova_pointer, iovec_array.iova_length, offset, flags);

  if (-1 != rv) {
    *number_of_bytes_read_p = rv;
    return false;
  } else {
    return true;
  }
}


/** --------------------------------------------------------------------
 ** Input/output: file locking.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER(flock,	l_type,		mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER(flock,	l_whence,	mmux_sshort_t)
DEFINE_STRUCT_SETTER_GETTER(flock,	l_start,	mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER(flock,	l_len,		mmux_off_t)
DEFINE_STRUCT_SETTER_GETTER(flock,	l_pid,		mmux_pid_t)

bool
mmux_libc_flag_to_symbol_struct_flock_l_type (char const * * const str_p, mmux_sint_t flag)
{
  /* We use the if statement, rather than  the switch statement, because there may be
     duplicates in the symbols. */
  if (F_RDLCK == flag) {
    *str_p = "F_RDLCK";
    return false;
  } else if (F_WRLCK == flag) {
    *str_p = "F_WRLCK";
    return false;
  } else if (F_UNLCK == flag) {
    *str_p = "F_UNLCK";
    return false;
  } else {
    *str_p = "unknown";
    return true;
  }
}
bool
mmux_libc_flock_dump (mmux_libc_file_descriptor_t fd, mmux_libc_flock_t const * const flock_p, char const * const struct_name)
{
  {
    int		rv = dprintf(fd.value, "%s = \"%p\"\n", struct_name, (mmux_pointer_t)flock_p);
    if (0 > rv) { return true; }
  }

  /* Print l_type. */
  {
    mmux_sint_t	required_nbytes = mmux_sshort_sprint_size(flock_p->l_type);
    int		rv;

    if (0 > required_nbytes) {
      return true;
    } else {
      char	str[required_nbytes];
      bool	error_when_true = mmux_sshort_sprint(str, required_nbytes, flock_p->l_type);

      if (error_when_true) {
	mmux_libc_dprintfer("%s: error converting \"l_type\" to string\n", __func__);
	return true;
      } else {
	char const *	symstr;

	mmux_libc_flag_to_symbol_struct_flock_l_type(&symstr, flock_p->l_type);
	rv = dprintf(fd.value, "%s.l_type = \"%s\" (%s)\n", struct_name, str, symstr);
	if (0 > rv) { return true; }
      }
    }
  }

  /* Print l_whence. */
  {
    mmux_sint_t	required_nbytes = mmux_sshort_sprint_size(flock_p->l_whence);
    int		rv;

    if (0 > required_nbytes) {
      mmux_libc_dprintfer("%s: error converting \"l_whence\" to string\n", __func__);
      return true;
    } else {
      char	str[required_nbytes];
      bool	error_when_true = mmux_sshort_sprint(str, required_nbytes, flock_p->l_whence);

      if (error_when_true) {
	mmux_libc_dprintfer("%s: error converting \"l_whence\" to string\n", __func__);
	return true;
      } else {
	char const *	symstr;

	switch (flock_p->l_whence) {
	case MMUX_VALUEOF_SEEK_SET:
	  symstr = "SEEK_SET";
	  break;
	case MMUX_VALUEOF_SEEK_END:
	  symstr = "SEEK_END";
	  break;
	case MMUX_VALUEOF_SEEK_CUR:
	  symstr = "SEEK_CUR";
	  break;
	default:
	  symstr = "unknown";
	  break;
	}

	rv = dprintf(fd.value, "%s.l_whence = \"%s\" (%s)\n", struct_name, str, symstr);
	if (0 > rv) { return true; }
      }
    }
  }

  /* Print l_start. */
  {
    mmux_sint_t	required_nbytes = mmux_off_sprint_size(flock_p->l_start);
    int		rv;

    if (0 > required_nbytes) {
      mmux_libc_dprintfer("%s: error converting \"l_start\" to string\n", __func__);
      return true;
    } else {
      char	str[required_nbytes];
      bool	error_when_true = mmux_off_sprint(str, required_nbytes, flock_p->l_start);

      if (error_when_true) {
	mmux_libc_dprintfer("%s: error converting \"l_start\" to string\n", __func__);
	return true;
      } else {
	rv = dprintf(fd.value, "%s.l_start = \"%s\"\n", struct_name, str);
	if (0 > rv) { return true; }
      }
    }
  }

  /* Print l_len. */
  {
    mmux_sint_t	required_nbytes = mmux_off_sprint_size(flock_p->l_len);
    int		rv;

    if (0 > required_nbytes) {
      mmux_libc_dprintfer("%s: error converting \"l_len\" to string\n", __func__);
      return true;
    } else {
      char	str[required_nbytes];
      bool	error_when_true = mmux_off_sprint(str, required_nbytes, flock_p->l_len);

      if (error_when_true) {
	mmux_libc_dprintfer("%s: error converting \"l_len\" to string\n", __func__);
	return true;
      } else {
	rv = dprintf(fd.value, "%s.l_len = \"%s\"\n", struct_name, str);
	if (0 > rv) { return true; }
      }
    }
  }

  /* Print l_pid. */
  {
    mmux_sint_t	required_nbytes = mmux_pid_sprint_size(flock_p->l_pid);
    int		rv;

    if (0 > required_nbytes) {
      mmux_libc_dprintfer("%s: error converting \"l_pid\" to string\n", __func__);
      return true;
    } else {
      char	str[required_nbytes];
      bool	error_when_true = mmux_pid_sprint(str, required_nbytes, flock_p->l_pid);

      if (error_when_true) {
	mmux_libc_dprintfer("%s: error converting \"l_pid\" to string\n", __func__);
	return true;
      } else {
	rv = dprintf(fd.value, "%s.l_pid = \"%s\"\n", struct_name, str);
	if (0 > rv) { return true; }
      }
    }
  }

  return false;
}


/** --------------------------------------------------------------------
 ** Fcntl.
 ** ----------------------------------------------------------------- */

bool
mmux_libc_fcntl (mmux_libc_file_descriptor_t fd, mmux_sint_t command, mmux_pointer_t parameter_p)
{
  switch (command) {

#ifdef MMUX_HAVE_LIBC_F_DUPFD
  case MMUX_LIBC_F_DUPFD: {
    mmux_libc_file_descriptor_t *	new_fd_p = parameter_p;
    mmux_sint_t				rv = fcntl(fd.value, command, new_fd_p->value);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_HAVE_LIBC_F_GETFD
  case MMUX_LIBC_F_GETFD: {
    mmux_sint_t	rv = fcntl(fd.value, command);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_SETFD
  case MMUX_LIBC_F_SETFD: {
    mmux_sint_t *	flags_p = parameter_p;
    mmux_sint_t		rv = fcntl(fd.value, command, *flags_p);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_HAVE_LIBC_F_GETFL
  case MMUX_LIBC_F_GETFL: {
    mmux_sint_t	rv = fcntl(fd.value, command);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_SETFL
  case MMUX_LIBC_F_SETFL: {
    mmux_sint_t *	flags_p = parameter_p;
    mmux_sint_t		rv = fcntl(fd.value, command, *flags_p);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_HAVE_LIBC_F_GETLK
  case MMUX_LIBC_F_GETLK: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_SETLK
  case MMUX_LIBC_F_SETLK: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_SETLKW
  case MMUX_LIBC_F_SETLKW: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_HAVE_LIBC_F_OFD_GETLK
  case MMUX_LIBC_F_OFD_GETLK: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_OFD_SETLK
  case MMUX_LIBC_F_OFD_SETLK: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_OFD_SETLKW
  case MMUX_LIBC_F_OFD_SETLKW: {
    mmux_libc_flock_t *		flock_pointer = parameter_p;
    mmux_sint_t			rv = fcntl(fd.value, command, flock_pointer);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_HAVE_LIBC_F_GETOWN
  case MMUX_LIBC_F_GETOWN: {
    mmux_pid_t	rv = fcntl(fd.value, command);

    if (-1 != rv) {
      mmux_pid_t *	pid_p = parameter_p;

      *pid_p = rv;
      return false;
    } else {
      return true;
    }
  }
#endif

#ifdef MMUX_HAVE_LIBC_F_SETOWN
  case MMUX_LIBC_F_SETOWN: {
    mmux_pid_t *	pid_p = parameter_p;
    mmux_sint_t		rv = fcntl(fd.value, command, *pid_p);

    return ((-1 != rv)? false : true);
  }
#endif

/* ------------------------------------------------------------------ */

  default:
    errno = MMUX_LIBC_EINVAL;
    return true;
  }
}

bool
mmux_libc_fcntl_command_flag_to_symbol (char const ** str_p, mmux_sint_t flag)
{
  /* We use the if statement, rather than  the switch statement, because there may be
     duplicates in the symbols. */
  if (F_DUPFD == flag) {
    *str_p = "F_DUPFD";
    return false;
  } else if (F_GETFD == flag) {
    *str_p = "F_GETFD";
    return false;
  } else if (F_GETFL == flag) {
    *str_p = "F_GETFL";
    return false;
  } else if (F_GETLK == flag) {
    *str_p = "F_GETLK";
    return false;
  } else if (F_GETOWN == flag) {
    *str_p = "F_GETOWN";
    return false;
  } else if (F_SETFD == flag) {
    *str_p = "F_SETFD";
    return false;
  } else if (F_SETFL == flag) {
    *str_p = "F_SETFL";
    return false;
  } else if (F_SETLKW == flag) {
    *str_p = "F_SETLKW";
    return false;
  } else if (F_SETLK == flag) {
    *str_p = "F_SETLK";
    return false;
  } else if (F_SETOWN == flag) {
    *str_p = "F_SETOWN";
    return false;
  } else {
    *str_p = "unknown";
    return true;
  }
}



/* end of file */
