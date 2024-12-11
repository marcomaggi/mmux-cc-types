/*
  Part of: MMUX Bash Pointers
  Contents: implementation of core file descriptor builtins
  Date: Oct  1, 2024

  Abstract

	This module implements core file descriptor builtins.

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

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Opening.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_open]]])
{
  char const *		fd_varname;
  char const *		pathname;
  mmux_sint_t		flags;
  mmux_mode_t		mode = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(fd_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,		3);
  if (5 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	4);
  }

  {
    mmux_libc_file_descriptor_t		fd;
    mmux_bash_rv_t			brv;

    if (mmux_libc_open(&fd, pathname, flags, mode)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }

    brv = mmux_fd_bind_to_bash_variable(fd_varname, fd, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) {
      mmux_libc_close(fd);
    }
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((4 == argc) || (5 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FDVAR FILENAME FLAGS [MODE]"]]],
    [[["Open a file, store the file descriptor in FDVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_openat]]])
{
  char const *			fd_varname;
  mmux_libc_file_descriptor_t	dirfd;
  int				flags;
  char const *			pathname;
  mode_t			mode = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(fd_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(dirfd,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,		4);
  if (6 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	5);
  }
  {
    mmux_libc_file_descriptor_t		fd;
    mmux_bash_rv_t			brv;

    if (mmux_libc_openat(&fd, dirfd, pathname, flags, mode)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }

    brv = mmux_fd_bind_to_bash_variable(fd_varname, fd, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) {
      mmux_libc_close(fd);
    }
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((5 == argc) || (6 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FDVAR DIRFD FILENAME FLAGS [MODE]"]]],
    [[["Open a file, store the file descriptor in FDVAR."]]])


/** --------------------------------------------------------------------
 ** Closing.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_close]]])
{
  mmux_libc_file_descriptor_t	fd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,	1);
  {
    if (mmux_libc_close(fd)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD"]]],
    [[["Close a file descriptor."]]])


/** --------------------------------------------------------------------
 ** Reading.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_read]]])
{
  char const *			donevar;
  mmux_libc_file_descriptor_t	fd;
  mmux_pointer_t		buffer;
  mmux_usize_t			size;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(donevar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,		4);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_read(&nbytes_done, fd, buffer, size)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return mmux_usize_bind_to_bash_variable(donevar, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE"]]],
    [[["Read SIZE bytes from FD and store them in BUFFER, store in DONEVAR the number of bytes read."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pread]]])
{
  char const *			donevar;
  mmux_libc_file_descriptor_t	fd;
  mmux_pointer_t		buffer;
  mmux_usize_t			size;
  mmux_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(donevar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,	5);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_pread(&nbytes_done, fd, buffer, size, offset)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return mmux_usize_bind_to_bash_variable(donevar, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE OFFSET"]]],
    [[["Read SIZE bytes from FD, at OFFSET from the current position, and store them in BUFFER, store in DONEVAR the number of bytes read."]]])


/** --------------------------------------------------------------------
 ** Writing.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_write]]])
{
  char const *			donevar;
  mmux_libc_file_descriptor_t	fd;
  mmux_pointer_t		buffer;
  mmux_usize_t			size;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(donevar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,		4);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_write(&nbytes_done, fd, buffer, size)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return mmux_usize_bind_to_bash_variable(donevar, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE"]]],
    [[["Write SIZE bytes to FD from BUFFER, store in DONEVAR the number of bytes written."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pwrite]]])
{
  char const *			donevar;
  mmux_libc_file_descriptor_t	fd;
  mmux_pointer_t		buffer;
  mmux_usize_t			size;
  mmux_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(donevar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,	5);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_pwrite(&nbytes_done, fd, buffer, size, offset)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return mmux_usize_bind_to_bash_variable(donevar, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE OFFSET"]]],
    [[["Write SIZE bytes to FD, at OFFSET from the current position, from BUFFER, store in DONEVAR the number of bytes written."]]])


/** --------------------------------------------------------------------
 ** Seeking.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lseek]]])
{
  char const *			offvar;
  mmux_libc_file_descriptor_t	fd;
  mmux_sint_t			whence;
  mmux_off_t			offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(offvar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(whence,		4);
  {
    if (mmux_libc_lseek(fd, &offset, whence)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return mmux_off_bind_to_bash_variable(offvar, offset, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OFFVAR FD OFFSET WHENCE"]]],
    [[["Change the file position of FD of OFFSET from WHENCE, store in OFFVAR the resulting file position."]]])


/** --------------------------------------------------------------------
 ** Duplicating.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_dup]]])
{
  char const *			new_fd_varname;
  mmux_libc_file_descriptor_t	old_fd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(new_fd_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(old_fd,			2);
  {
    mmux_libc_file_descriptor_t		new_fd;
    mmux_bash_rv_t			brv;

    if (mmux_libc_dup(&new_fd, old_fd)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }

    brv = mmux_fd_bind_to_bash_variable(new_fd_varname, new_fd, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) {
      mmux_libc_close(new_fd);
    }
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NEW_FD_VAR OLD_FD"]]],
    [[["Duplicate the file descriptor OLD_FD, store the result in NEW_FD_VAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_dup2]]])
{
  mmux_libc_file_descriptor_t	old_fd;
  mmux_libc_file_descriptor_t	new_fd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(old_fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(new_fd,	2);
  {
    if (mmux_libc_dup2(old_fd, new_fd)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_FD NEW_FD"]]],
    [[["Duplicate the file descriptor OLD_FD to NEW_FD, then close OLD_FD."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_dup3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_DUP3]]],[[[
  mmux_libc_file_descriptor_t	old_fd;
  mmux_libc_file_descriptor_t	new_fd;
  mmux_sint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(old_fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(new_fd,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	3);
  {
    if (mmux_libc_dup3(old_fd, new_fd, flags)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_SUCCESS;
  }
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_FD NEW_FD FLAGS"]]],
    [[["Duplicate the file descriptor OLD_FD to NEW_FD, then close OLD_FD."]]])


/** --------------------------------------------------------------------
 ** Piping.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pipe]]])
{
  char const *	reading_fd_varname;
  char const *	writing_fd_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(reading_fd_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(writing_fd_varname,	2);
  {
    mmux_libc_file_descriptor_t	fds[2];

    if (mmux_libc_pipe(fds)) {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }

    {
      mmux_bash_rv_t	brv;

      brv = mmux_fd_bind_to_bash_variable(reading_fd_varname, fds[0], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_fd_bind_to_bash_variable(writing_fd_varname, fds[1], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return MMUX_SUCCESS;

    error_binding_variables:
      mmux_libc_close(fds[0]);
      mmux_libc_close(fds[1]);
      return brv;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER READING_FDVAR WRITING_FDVAR"]]])


/** --------------------------------------------------------------------
 ** Interface to "fcntl".
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fcntl]]])
{
  char const *			resultvar;
  mmux_libc_file_descriptor_t	fd;
  mmux_sint_t			command;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(resultvar,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(command,		3);

  switch (command) {
#ifdef MMUX_HAVE_LIBC_F_DUPFD
  case MMUX_LIBC_F_DUPFD:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	mmux_libc_file_descriptor_t	new_fd;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(new_fd,	4);
	if (mmux_libc_fcntl(fd, command, &new_fd)) {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
	return mmux_fd_bind_to_bash_variable(resultvar, new_fd, MMUX_BASH_BUILTIN_STRING_NAME);
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_GETFD
  case MMUX_LIBC_F_GETFD:
    {
      if (4 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv;

	rv = fcntl(fd.value, command);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_GETFL
  case MMUX_LIBC_F_GETFL:
    {
      if (4 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv;

	rv = fcntl(fd.value, command);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_GETLK
  case MMUX_LIBC_F_GETLK:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	mmux_libc_flock_t *	flock_pointer;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	4);
	{
	  int	rv = fcntl(fd.value, command, flock_pointer);
	  if (-1 != rv) {
	    return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	  } else {
	    return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  }
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_GETOWN
  case MMUX_LIBC_F_GETOWN:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_SETFD
  case MMUX_LIBC_F_SETFD:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, flags;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	4);

	rv = fcntl(fd.value, command, flags);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_SETFL
  case MMUX_LIBC_F_SETFL:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, flags;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	4);

	rv = fcntl(fd.value, command, flags);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_SETLKW
  case MMUX_LIBC_F_SETLKW:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	mmux_libc_flock_t *	flock_pointer;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	4);
	{
	  int	rv = fcntl(fd.value, command, flock_pointer);

	  if (-1 != rv) {
	    return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	  } else {
	    return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  }
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_SETLK
  case MMUX_LIBC_F_SETLK:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	mmux_libc_flock_t *	flock_pointer;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	4);
	{
	  int	rv = fcntl(fd.value, command, flock_pointer);

	  if (-1 != rv) {
	    return mmux_sint_bind_to_bash_variable(resultvar, rv, MMUX_BASH_BUILTIN_STRING_NAME);
	  } else {
	    return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  }
	}
      }
    }
    break;
#endif
#ifdef MMUX_HAVE_LIBC_F_SETOWN
  case MMUX_LIBC_F_SETOWN:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
  default:
    mmux_libc_dprintfer("%s: error: invalid command parameter \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME, argv[3]);
    goto mmux_error_parsing_builtin_argument;
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RVAR FD COMMAND ARG ..."]]],
    [[["Call fcntl with the given arguments, store the result in RVAR."]]])


/** --------------------------------------------------------------------
 ** Interface to "ioctl".
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ioctl]]])
{
  int	fd, command;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(command,	3);

  switch (command) {
#if ((defined MMUX_HAVE_SIOCATMARK) && (1 == MMUX_HAVE_SIOCATMARK))
  case SIOCATMARK:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, atmark;

	rv = ioctl(fd, command, &atmark);
	if (-1 != rv) {
	  mmux_sint_bind_to_bash_variable(argv[4], atmark, MMUX_BASH_BUILTIN_STRING_NAME);
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
  default:
    mmux_libc_dprintfer("%s: error: invalid command parameter \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME, argv[3]);
    goto mmux_error_parsing_builtin_argument;
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RVAR FD COMMAND ARG ..."]]],
    [[["Call ioctl with the given arguments, store the result in RVAR."]]])


/** --------------------------------------------------------------------
 ** Selecting.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fd_set_malloc]]])
{
  char const *	fd_set_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(fd_set_pointer_varname,	1);
  {
    fd_set *	fd_set_pointer = malloc(sizeof(fd_set));

    if (fd_set_pointer) {
      mmux_bash_rv_t	rv;

      FD_ZERO(fd_set_pointer);
      rv = mmux_pointer_bind_to_bash_variable(fd_set_pointer_varname, fd_set_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) {
	free(fd_set_pointer);
      }
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD_SET_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fd_set_malloc_triplet]]])
{
  char const *	fd_set_pointer_varname[3];

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(fd_set_pointer_varname[0],	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(fd_set_pointer_varname[1],	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(fd_set_pointer_varname[2],	argv[3]);
  {
    fd_set *	fd_set_pointer = malloc(3 * sizeof(fd_set));

    if (fd_set_pointer) {
      mmux_bash_rv_t	rv;

      for (int i=0; i<3; ++i) {
	FD_ZERO(&(fd_set_pointer[i]));
	rv = mmux_pointer_bind_to_bash_variable(fd_set_pointer_varname[i], &(fd_set_pointer[i]), MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != rv) { goto error_binding_variable; }
      }
      return rv;

    error_binding_variable:
      free(fd_set_pointer);
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER READ_FD_SET_POINTER_VAR WRIT_FD_SET_POINTER_VAR EXEC_FD_SET_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_ZERO]]])
{
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_ZERO(fd_set_pointer);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_SET]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_SET(fd, fd_set_pointer);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_CLR]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_CLR(fd, fd_set_pointer);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_ISSET]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    fd_set *	fd_set_pointer = pointer;
    int		rv             = FD_ISSET(fd, fd_set_pointer);

    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_select]]])
{
  char const *		ready_fds_varname;
  mmux_sint_t		nfds;
  mmux_pointer_t	read_fds_pointer;
  mmux_pointer_t	write_fds_pointer;
  mmux_pointer_t	except_fds_pointer;
  mmux_pointer_t	timeval_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ready_fds_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(nfds,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(read_fds_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(write_fds_pointer,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(except_fds_pointer,	5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(timeval_pointer,	6);
  {
    int		rv = select(nfds,
			    (fd_set *)read_fds_pointer,
			    (fd_set *)write_fds_pointer,
			    (fd_set *)except_fds_pointer,
			    (struct timeval *)timeval_pointer);

    if (-1 != rv) {
      return mmux_sint_bind_to_bash_variable(ready_fds_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER READY_FDS_VAR NFDS READ_FD_SET_POINTER WRITE_FD_SET_POINTER EXCEPT_FD_SET_POINTER TIMEVAL_POINTER"]]])


/** --------------------------------------------------------------------
 ** Struct iovec.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_iovec_calloc]]])
{
  char const *		iovec_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(iovec_pointer_varname,	1);
  {
    mmux_libc_iovec_t *	iovec_pointer = calloc(1, sizeof(mmux_libc_iovec_t));

    if (iovec_pointer) {
      if (4 == argc) {
	mmux_pointer_t	iov_base_value;
	mmux_usize_t	iov_len_value;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(iov_base_value,	2);
	MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iov_len_value,	3);
	mmux_libc_iov_base_set(iovec_pointer, iov_base_value);
	mmux_libc_iov_len_set (iovec_pointer, iov_len_value);
      }
      {
	int	rv = mmux_pointer_bind_to_bash_variable(iovec_pointer_varname, iovec_pointer, MMUX_BASH_BUILTIN_STRING_NAME);

	if (MMUX_SUCCESS != rv) {
	  free(iovec_pointer);
	}
	return rv;
      }
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IOVEC_POINTER_VAR [IOV_BASE IOV_LEN]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_iovec_array_calloc]]])
{
  char const *	iovec_array_pointer_varname;
  mmux_usize_t	iovec_array_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(iovec_array_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array_length,		2);
  {
    mmux_libc_iovec_t *	iovec_array_pointer = calloc(iovec_array_length, sizeof(mmux_libc_iovec_t));

    if (iovec_array_pointer) {
      int	rv = mmux_pointer_bind_to_bash_variable(iovec_array_pointer_varname, iovec_array_pointer, MMUX_BASH_BUILTIN_STRING_NAME);

      if (MMUX_SUCCESS != rv) {
	free(iovec_array_pointer);
      }
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IOVEC_ARRAY_POINTER_VAR IOVEC_ARRAY_LENGTH"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_IOVEC_FIELD_SETTER_GETTER]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_ref]]])
{
  char const *		$1_varname;
  mmux_libc_iovec_t *	iovec_array_pointer;
  mmux_uint_t		iovec_array_index = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM($1_varname,			1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array_pointer,	2);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT(iovec_array_index,		3);
  }
  {
    return mmux_$2_bind_to_bash_variable($1_varname,
					 mmux_libc_$1_ref(&(iovec_array_pointer[iovec_array_index])),
					 MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MMUX_M4_TOUPPER($1)_VAR IOVEC_POINTER [IOVEC_ARRAY_INDEX]"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_set]]])
{
  mmux_libc_iovec_t *	iovec_array_pointer;
  mmux_uint_t		iovec_array_index = 0;
  mmux_$2_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array_pointer,	1);
  $3(value, 2);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT(iovec_array_index,		3);
  }
  {
    mmux_libc_$1_set(&(iovec_array_pointer[iovec_array_index]), value);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IOVEC_POINTER MMUX_M4_TOUPPER($1) [IOVEC_ARRAY_INDEX]"]]])
]]])

DEFINE_IOVEC_FIELD_SETTER_GETTER([[[iov_base]]],	[[[pointer]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER]]])
DEFINE_IOVEC_FIELD_SETTER_GETTER([[[iov_len]]],		[[[usize]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_iovec_dump]]])
{
  mmux_libc_iovec_t *	iovec_pointer;
  char const *		struct_name = "struct iovec";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    bool	rv = mmux_libc_iovec_dump(MMUX_LIBC_STDOU, iovec_pointer, struct_name);

    return (false == rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IOVEC_POINTER [STRUCT_NAME]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_readv]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_readv(&nbytes_done, fd, iovec_array)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_writev]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_writev(&nbytes_done, fd, iovec_array)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_preadv]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;
  mmux_off_t			offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,				5);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_preadv(&nbytes_done, fd, iovec_array, offset)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH OFFSET"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pwritev]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;
  mmux_off_t			offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,				5);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_pwritev(&nbytes_done, fd, iovec_array, offset)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH OFFSET"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_preadv2]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;
  mmux_off_t			offset;
  mmux_sint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,				5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,				6);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_preadv2(&nbytes_done, fd, iovec_array, offset, flags)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH OFFSET FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pwritev2]]])
{
  char const *			done_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_libc_iovec_array_t	iovec_array;
  mmux_off_t			offset;
  mmux_sint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(done_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(fd,					2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(iovec_array.iova_pointer,3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(iovec_array.iova_length,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(offset,				5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,				6);
  {
    mmux_usize_t	nbytes_done;

    if (mmux_libc_pwritev2(&nbytes_done, fd, iovec_array, offset, flags)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return mmux_usize_bind_to_bash_variable(done_varname, nbytes_done, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD IOVEC_ARRAY_POINTER IOVEC_ARRAY_LENGTH OFFSET FLAGS"]]])


/** --------------------------------------------------------------------
 ** Copying file ranges.
 ** ----------------------------------------------------------------- */

MMUX_BASH_CONDITIONAL_CODE([[[HAVE_COPY_FILE_RANGE]]],[[[
static bool
mmux_libc_copy_file_range (mmux_ssize_t * number_of_bytes_copied_p,
			   mmux_libc_file_descriptor_t input_fd, mmux_sint64_t * input_position_p,
			   mmux_libc_file_descriptor_t ouput_fd, mmux_sint64_t * ouput_position_p,
			   mmux_usize_t number_of_bytes_to_copy, mmux_sint_t flags)
{
  mmux_ssize_t	number_of_bytes_copied = copy_file_range(input_fd.value, input_position_p,
							 ouput_fd.value, ouput_position_p,
							 number_of_bytes_to_copy, flags);

  if (-1 != number_of_bytes_copied) {
    *number_of_bytes_copied_p = number_of_bytes_copied;
    return false;
  } else {
    return true;
  }
}
]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_copy_file_range]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_COPY_FILE_RANGE]]],[[[
  char const *	assoc_array_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(assoc_array_varname,	1);
  {
    mmux_bash_assoc_array_variable_t	assoc_array_variable;
    mmux_bash_rv_t			brv;

    brv = mmux_bash_assoc_array_find_existent(&assoc_array_variable, assoc_array_varname, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) {
      return brv;
    } else {
      mmux_ssize_t			number_of_bytes_copied;
      mmux_libc_file_descriptor_t	input_fd;
      mmux_sint64_t			input_position;
      mmux_sint64_t *			input_position_p;
      mmux_libc_file_descriptor_t	ouput_fd;
      mmux_sint64_t			ouput_position;
      mmux_sint64_t *			ouput_position_p;
      mmux_usize_t			number_of_bytes_to_copy;
      mmux_sint_t			flags;

      /* Extract from the array the value of "input_fd". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "INPUT_FD";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) {
	  return brv;
	} else {
	  bool	true_when_error = mmux_sint_parse(&input_fd.value, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "sint", assoc_array_value);
	    return MMUX_FAILURE;
	  }
	}
      }

      /* Extract from the array the value of "input_position". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "INPUT_POSITION";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, NULL);
	if (MMUX_SUCCESS != brv) {
	  /* The input position is not set: this is fine. */
	  input_position   = 0;
	  input_position_p = NULL;
	} else {
	  bool	true_when_error = mmux_sint64_parse(&input_position, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "sint64", assoc_array_value);
	    return MMUX_FAILURE;
	  } else {
	    input_position_p = &input_position;
	  }
	}
      }

      /* Extract from the array the value of "ouput_fd". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "OUPUT_FD";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) {
	  return brv;
	} else {
	  bool	true_when_error = mmux_sint_parse(&ouput_fd.value, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "sint", assoc_array_value);
	    return MMUX_FAILURE;
	  }
	}
      }

      /* Extract from the array the value of "ouput_position". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "OUPUT_POSITION";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, NULL);
	if (MMUX_SUCCESS != brv) {
	  /* The input position is not set: this is fine. */
	  ouput_position   = 0;
	  ouput_position_p = NULL;
	} else {
	  bool	true_when_error = mmux_sint64_parse(&ouput_position, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "sint64", assoc_array_value);
	    return MMUX_FAILURE;
	  } else {
	    ouput_position_p = &ouput_position;
	  }
	}
      }

      /* Extract from the array the value of "number_of_bytes_to_copy". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "NUMBER_OF_BYTES_TO_COPY";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) {
	  return brv;
	} else {
	  /* NOTE The  GLIBC documentation  in Texinfo  format states  the this  is a
	     "ssize_t"; the manual page states that this is a "size_t".  We stay with
	     the manual page.  (Marco Maggi; Dec 5, 2024) */
	  bool	true_when_error = mmux_usize_parse(&number_of_bytes_to_copy, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "usize", assoc_array_value);
	    return MMUX_FAILURE;
	  }
	}
      }

      /* Extract from the array the value of "flags". */
      {
	mmux_bash_assoc_array_key_t	assoc_array_key = "FLAGS";
	char const *			assoc_array_value;

	brv = mmux_bash_assoc_array_ref(assoc_array_variable, assoc_array_key, &assoc_array_value, NULL);
	if (MMUX_SUCCESS != brv) {
	  /* The flags key is not set: this is fine. */
	  flags = 0;
	} else {
	  /* NOTE The  GLIBC documentation  in Texinfo  format states  the this  is a
	     "ssize_t"; the manual page states that this is a "size_t".  We stay with
	     the manual page.  (Marco Maggi; Dec 5, 2024) */
	  bool	true_when_error = mmux_sint_parse(&flags, assoc_array_value, NULL);

	  if (true_when_error) {
	    mmux_libc_dprintfer("%s: error parsing \"%s[%s]\": expected %s value, got: \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME,
		    assoc_array_varname, assoc_array_key, "usize", assoc_array_value);
	    return MMUX_FAILURE;
	  }
	}
      }

      {
	bool	error_if_true = mmux_libc_copy_file_range(&number_of_bytes_copied,
							  input_fd, input_position_p,
							  ouput_fd, ouput_position_p,
							  number_of_bytes_to_copy, flags);

	if (error_if_true) {
	  mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  return MMUX_FAILURE;
	} else {
	  /* Bind in the array the key "NUMBER_OF_BYTES_COPIED". */
	  {
	    mmux_sint_t		required_nbytes = mmux_sint_sprint_size(number_of_bytes_copied);

	    if (0 > required_nbytes) {
	      mmux_libc_dprintfer("%s: error converting \"number_of_bytes_copied\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	      return MMUX_FAILURE;
	    } else {
	      mmux_bash_assoc_array_key_t	assoc_array_key = "NUMBER_OF_BYTES_COPIED";
	      char				assoc_array_value[required_nbytes];
	      bool	error_when_true = mmux_sint_sprint(assoc_array_value, required_nbytes, number_of_bytes_copied);

	      if (error_when_true) {
		mmux_libc_dprintfer("%s: error converting \"number_of_bytes_copied\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
		return MMUX_FAILURE;
	      } else {
		brv = mmux_bash_assoc_array_bind(assoc_array_variable, assoc_array_key, assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
		if (MMUX_SUCCESS != brv) { return brv; }
	      }
	    }
	  }

	  /* When required: update value bound to the key "INPUT_POSITION". */
	  if (NULL != input_position_p) {
	    mmux_sint_t		required_nbytes = mmux_sint64_sprint_size(*input_position_p);

	    if (0 > required_nbytes) {
	      mmux_libc_dprintfer("%s: error converting \"input_position\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	      return MMUX_FAILURE;
	    } else {
	      mmux_bash_assoc_array_key_t	assoc_array_key = "INPUT_POSITION";
	      char				assoc_array_value[required_nbytes];
	      bool	error_when_true = mmux_sint_sprint(assoc_array_value, required_nbytes, *input_position_p);

	      if (error_when_true) {
		mmux_libc_dprintfer("%s: error converting \"input_position\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
		return MMUX_FAILURE;
	      } else {
		brv = mmux_bash_assoc_array_bind(assoc_array_variable, assoc_array_key, assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
		if (MMUX_SUCCESS != brv) { return brv; }
	      }
	    }
	  }

	  /* When required: update value bound to the key "OUPUT_POSITION". */
	  if (NULL != ouput_position_p) {
	    mmux_sint_t		required_nbytes = mmux_sint64_sprint_size(*ouput_position_p);

	    if (0 > required_nbytes) {
	      mmux_libc_dprintfer("%s: error converting \"ouput_position\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	      return MMUX_FAILURE;
	    } else {
	      mmux_bash_assoc_array_key_t	assoc_array_key = "OUPUT_POSITION";
	      char				assoc_array_value[required_nbytes];
	      bool	error_when_true = mmux_sint_sprint(assoc_array_value, required_nbytes, *ouput_position_p);

	      if (error_when_true) {
		mmux_libc_dprintfer("%s: error converting \"ouput_position\" to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
		return MMUX_FAILURE;
	      } else {
		brv = mmux_bash_assoc_array_bind(assoc_array_variable, assoc_array_key, assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
		if (MMUX_SUCCESS != brv) { return brv; }
	      }
	    }
	  }

	  return MMUX_SUCCESS;
	}
      }
    }
  }
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ARRAY_VARNAME"]]])


/** --------------------------------------------------------------------
 ** Struct flock.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_flock_calloc]]])
{
  char const *		flock_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(flock_pointer_varname,	1);
  {
    mmux_libc_flock_t	flock_struct;

    memset(&flock_struct, '\0', sizeof(mmux_libc_flock_t));
    if (2 != argc) {
      mmux_sshort_t	l_type;
      mmux_sshort_t	l_whence;
      mmux_off_t	l_start;
      mmux_off_t	l_len;
      mmux_pid_t	l_pid;

      MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT(l_type,	2);
      MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT(l_whence,	3);
      MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(l_start,	4);
      MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(l_len,		5);
      MMUX_BASH_PARSE_BUILTIN_ARGNUM_PID(l_pid,		6);

      mmux_libc_l_type_set	(&flock_struct, l_type);
      mmux_libc_l_whence_set	(&flock_struct, l_whence);
      mmux_libc_l_start_set	(&flock_struct, l_start);
      mmux_libc_l_len_set	(&flock_struct, l_len);
      mmux_libc_l_pid_set	(&flock_struct, l_pid);
    }

    {
      mmux_libc_flock_t *	flock_pointer = calloc(1, sizeof(mmux_libc_flock_t));

      *flock_pointer = flock_struct;
      return mmux_pointer_bind_to_bash_variable(flock_pointer_varname, (mmux_pointer_t)flock_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (7 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FLOCK_POINTER_VAR [L_TYPE L_WHENCE L_START L_LEN L_PID]"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_FLOCK_SETTER_GETTER]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_ref]]])
{
  char const *		$1_varname;
  mmux_libc_flock_t *	flock_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM($1_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	2);
  {
    return mmux_$2_bind_to_bash_variable($1_varname, mmux_libc_$1_ref(flock_pointer), MMUX_BASH_BUILTIN_STRING_NAME);
  }
 }
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MMUX_M4_TOUPPER($1)_var FLOCK_POINTER"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_set]]])
{
  mmux_libc_flock_t *	flock_pointer;
  mmux_$2_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	1);
  $3(value,							2);
  {
    mmux_libc_$1_set(flock_pointer, value);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FLOCK_POINTER MMUX_M4_TOUPPER($1)"]]])
]]])

DEFINE_FLOCK_SETTER_GETTER(l_type,	sshort,		[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])
DEFINE_FLOCK_SETTER_GETTER(l_whence,	sshort,		[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])
DEFINE_FLOCK_SETTER_GETTER(l_start,	off,		[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF]]])
DEFINE_FLOCK_SETTER_GETTER(l_len,	off,		[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF]]])
DEFINE_FLOCK_SETTER_GETTER(l_pid,	pid,		[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_PID]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_flock_dump]]])
{
  mmux_libc_flock_t *	flock_pointer;
  char const *		struct_name = "struct flock";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(flock_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    bool	rv = mmux_libc_flock_dump(MMUX_LIBC_STDOU, flock_pointer, struct_name);

    return (false == rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FLOCK_POINTER [STRUCT_NAME]"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_file_descriptors_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_FD_SETSIZE", FD_SETSIZE, NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_fd_set_SIZEOF", sizeof(fd_set), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_iovec_SIZEOF", sizeof(mmux_libc_iovec_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_flock_SIZEOF", sizeof(mmux_libc_flock_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
