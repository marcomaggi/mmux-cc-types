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
  int			flags;
  mode_t		mode = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM([[[fd_varname]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM([[[pathname]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[flags]]],			[[[argv[3]]]]);
  if (5 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MODE([[[mode]]],		[[[argv[4]]]]);
  }

  {
    int		fd = open(pathname, flags, mode);
    if (-1 != fd) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(fd_varname, fd, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) {
	close(fd);
      }
      return brv;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((4 == argc) || (5 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FDVAR FILENAME FLAGS [MODE]"]]],
    [[["Open a file, store the file descriptor in FDVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_openat]]])
{
  char const *	fd_varname;;
  int		dirfd, flags;
  char const *	pathname;
  mode_t	mode = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM([[[fd_varname]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[dirfd]]],			[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM([[[pathname]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[flags]]],			[[[argv[4]]]]);
  if (6 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MODE([[[mode]]],		[[[argv[5]]]]);
  }

  {
    int		fd = openat(dirfd, pathname, flags, mode);
    if (-1 != fd) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(fd_varname, fd, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) {
	close(fd);
      }
      return brv;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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
  int	fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],[[[argv[1]]]]);

  {
    int		rv = close(fd);
    if (-1 != rv) {
      return MMUX_SUCCESS;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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
  int		fd;
  void *	buffer;
  size_t	size;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);

  {
    ssize_t	done = read(fd, buffer, size);
    if (-1 != done) {
      return mmux_ssize_bind_to_bash_variable(argv[1], done, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE"]]],
    [[["Read SIZE bytes from FD and store them in BUFFER, store in DONEVAR the number of bytes read."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pread]]])
{
  int		fd;
  void *	buffer;
  size_t	size;
  mmux_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[5]]]]);

  {
    ssize_t	done = pread(fd, buffer, size, offset);
    if (-1 != done) {
      return mmux_ssize_bind_to_bash_variable(argv[1], done, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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
  int		fd;
  void *	buffer;
  size_t	size;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);

  {
    ssize_t	done = write(fd, buffer, size);
    if (-1 != done) {
      return mmux_ssize_bind_to_bash_variable(argv[1], done, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DONEVAR FD BUFFER SIZE"]]],
    [[["Write SIZE bytes to FD from BUFFER, store in DONEVAR the number of bytes written."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pwrite]]])
{
  int		fd;
  void *	buffer;
  size_t	size;
  mmux_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[5]]]]);

  {
    ssize_t	done = pwrite(fd, buffer, size, offset);
    if (-1 != done) {
      return mmux_ssize_bind_to_bash_variable(argv[1], done, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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
  int		fd, whence;
  mmux_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[whence]]],	[[[argv[4]]]]);

  {
    offset = lseek(fd, offset, whence);
    if (-1 != offset) {
      return mmux_off_bind_to_bash_variable(argv[1], offset, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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
  char const *	new_fd_varname;
  int		old_fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM([[[new_fd_varname]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[old_fd]]],		[[[argv[2]]]]);
  {
    int		new_fd = dup(old_fd);

    if (-1 != new_fd) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(new_fd_varname, new_fd, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) {
	close(new_fd);
      }
      return brv;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NEW_FD_VAR OLD_FD"]]],
    [[["Duplicate the file descriptor OLD_FD, store the result in NEW_FD_VAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_dup2]]])
{
  int	old_fd, new_fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[old_fd]]], [[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[new_fd]]], [[[argv[2]]]]);
  {
    int		rv = dup2(old_fd, new_fd);

    if (-1 != rv) {
      return MMUX_SUCCESS;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_FD NEW_FD"]]],
    [[["Duplicate the file descriptor OLD_FD to NEW_FD, then close OLD_FD."]]])


/** --------------------------------------------------------------------
 ** Piping.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pipe]]])
{
  char const *	reading_fd_varname;
  char const *	writing_fd_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(reading_fd_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(writing_fd_varname,	argv[2]);
  {
    int		fds[2];
    int		rv = pipe(fds);

    if (-1 != rv) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(reading_fd_varname, fds[0], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_sint_bind_to_bash_variable(writing_fd_varname, fds[1], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return MMUX_SUCCESS;

    error_binding_variables:
      close(fds[0]);
      close(fds[1]);
      return brv;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER READING_FDVAR WRITING_FDVAR"]]])


/** --------------------------------------------------------------------
 ** Stuff.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fcntl]]])
{
  int	fd, command;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[command]]],	[[[argv[3]]]]);

  switch (command) {
#if ((defined MMUX_HAVE_F_DUPFD) && (1 == MMUX_HAVE_F_DUPFD))
  case F_DUPFD:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, new_fd;

	MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[new_fd]]],	[[[argv[4]]]]);
	rv = fcntl(fd, command, new_fd);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_GETFD) && (1 == MMUX_HAVE_F_GETFD))
  case F_GETFD:
    {
      if (4 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv;

	rv = fcntl(fd, command);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_GETFL) && (1 == MMUX_HAVE_F_GETFL))
  case F_GETFL:
    {
      if (4 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv;

	rv = fcntl(fd, command);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_GETLK) && (1 == MMUX_HAVE_F_GETLK))
  case F_GETLK:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_GETOWN) && (1 == MMUX_HAVE_F_GETOWN))
  case F_GETOWN:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_SETFD) && (1 == MMUX_HAVE_F_SETFD))
  case F_SETFD:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, flags;

	MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[flags]]],	[[[argv[4]]]]);

	rv = fcntl(fd, command, flags);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_SETFL) && (1 == MMUX_HAVE_F_SETFL))
  case F_SETFL:
    {
      if (5 != argc) {
	return mmux_bash_builtin_wrong_num_of_args();
      } else {
	int	rv, flags;

	MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[flags]]],	[[[argv[4]]]]);

	rv = fcntl(fd, command, flags);
	if (-1 != rv) {
	  return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  return mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_SETLKW) && (1 == MMUX_HAVE_F_SETLKW))
  case F_SETLKW:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_SETLK) && (1 == MMUX_HAVE_F_SETLK))
  case F_SETLK:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
#if ((defined MMUX_HAVE_F_SETOWN) && (1 == MMUX_HAVE_F_SETOWN))
  case F_SETOWN:
    {
      goto mmux_error_parsing_builtin_argument;
    }
    break;
#endif
  default:
    fprintf(stderr, "%s: error: invalid command parameter \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME, argv[3]);
    goto mmux_error_parsing_builtin_argument;
  }

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RVAR FD COMMAND ARG ..."]]],
    [[["Call fcntl with the given arguments, store the result in RVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ioctl]]])
{
  int	fd, command;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[command]]],	[[[argv[3]]]]);

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
    fprintf(stderr, "%s: error: invalid command parameter \"%s\"\n", MMUX_BASH_BUILTIN_STRING_NAME, argv[3]);
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

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(fd_set_pointer_varname,	argv[1]);
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

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_ZERO(fd_set_pointer);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_SET]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[2]);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_SET(fd, fd_set_pointer);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_CLR]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[2]);
  {
    fd_set *	fd_set_pointer = pointer;

    FD_CLR(fd, fd_set_pointer);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD FD_SET_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_FD_ISSET]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[2]);
  {
    fd_set *	fd_set_pointer = pointer;
    int		rv             = FD_ISSET(fd, fd_set_pointer);

    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ready_fds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(nfds,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(read_fds_pointer,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(write_fds_pointer,	argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(except_fds_pointer,	argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(timeval_pointer,		argv[6]);
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER READY_FDS_VAR NFDS READ_FD_SET_POINTER WRITE_FD_SET_POINTER EXCEPT_FD_SET_POINTER TIMEVAL_POINTER"]]])


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

  return MMUX_SUCCESS;
}

/* end of file */
