/*
  Part of: MMUX Bash Pointers
  Contents: implementation of core file descriptor builtins
  Date: Oct  1, 2024

  Abstract

	This module implements core file descriptor builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms of the  GNU Lesser General Public  License as published by  the Free Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-pointers-internals.h"

m4_dnl $1 - name of the target variable
m4_dnl $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_POINTER]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

m4_dnl $1 - name of the target variable
m4_dnl $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

m4_dnl $1 - name of the target variable
m4_dnl $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MODE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_mode(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

m4_dnl $1 - name of the target variable
m4_dnl $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_USIZE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_usize(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

m4_dnl $1 - name of the target variable
m4_dnl $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_OFF]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_off(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])


static int
mmux_libc_open_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_open"
{
  int			flags;
  mode_t		mode = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[flags]]],[[[argv[3]]]]);
  if (5 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MODE([[[mode]]],[[[argv[4]]]]);
  }

  {
    int		rv = open(argv[2], flags, mode);
    if (-1 != rv) {
      return mmux_bash_pointers_store_result_in_variable_sint(argv[1], rv, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_open]]],
    [[[((4 == argc) || (5 == argc))]]],
    [[["mmux_libc_open FDVAR FILENAME FLAGS [MODE]"]]],
    [[["Open a file, store the file descriptor in FDVAR."]]])


static int
mmux_libc_close_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_close"
{
  int	fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],[[[argv[1]]]]);

  {
    int		rv = close(fd);
    if (-1 != rv) {
      return MMUX_SUCCESS;
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_close]]],
    [[[(2 == argc)]]],
    [[["mmux_libc_close FD"]]],
    [[["Close a file descriptor."]]])


static int
mmux_libc_read_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_read"
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
      return mmux_bash_pointers_store_result_in_variable_ssize(argv[1], done, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_read]]],
    [[[(5 == argc)]]],
    [[["mmux_libc_read DONEVAR FD BUFFER SIZE"]]],
    [[["Read SIZE bytes from FD and store them in BUFFER, store in DONEVAR the number of bytes read."]]])


static int
mmux_libc_write_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_write"
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
      return mmux_bash_pointers_store_result_in_variable_ssize(argv[1], done, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_write]]],
    [[[(5 == argc)]]],
    [[["mmux_libc_write DONEVAR FD BUFFER SIZE"]]],
    [[["Write SIZE bytes to FD from BUFFER, store in DONEVAR the number of bytes written."]]])


static int
mmux_libc_pread_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_pread"
{
  int			fd;
  void *		buffer;
  size_t		size;
  mmux_libc_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[5]]]]);

  {
    ssize_t	done = pread(fd, buffer, size, offset);
    if (-1 != done) {
      return mmux_bash_pointers_store_result_in_variable_ssize(argv[1], done, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_pread]]],
    [[[(6 == argc)]]],
    [[["mmux_libc_pread DONEVAR FD BUFFER SIZE OFFSET"]]],
    [[["Read SIZE bytes from FD, at OFFSET from the current position, and store them in BUFFER, store in DONEVAR the number of bytes read."]]])


static int
mmux_libc_pwrite_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_pwrite"
{
  int			fd;
  void *		buffer;
  size_t		size;
  mmux_libc_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER([[[buffer]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[size]]],		[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[5]]]]);

  {
    ssize_t	done = pwrite(fd, buffer, size, offset);
    if (-1 != done) {
      return mmux_bash_pointers_store_result_in_variable_ssize(argv[1], done, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_pwrite]]],
    [[[(6 == argc)]]],
    [[["mmux_libc_pwrite DONEVAR FD BUFFER SIZE OFFSET"]]],
    [[["Write SIZE bytes to FD, at OFFSET from the current position, from BUFFER, store in DONEVAR the number of bytes written."]]])


static int
mmux_libc_lseek_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_lseek"
{
  int			fd, whence;
  mmux_libc_off_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF([[[offset]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[whence]]],	[[[argv[4]]]]);

  {
    offset = lseek(fd, offset, whence);
    if (-1 != offset) {
      return mmux_bash_pointers_store_result_in_variable_off(argv[1], offset, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_lseek]]],
    [[[(5 == argc)]]],
    [[["mmux_libc_lseek OFFVAR FD OFFSET WHENCE"]]],
    [[["Change the file position of FD of OFFSET from WHENCE, store in OFFVAR the resulting file position."]]])


static int
mmux_libc_dup_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_dup"
{
  int	fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[fd]]], [[[argv[2]]]]);

  {
    fd = dup(fd);
    if (-1 != fd) {
      return mmux_bash_pointers_store_result_in_variable_sint(argv[1], fd, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_dup]]],
    [[[(3 == argc)]]],
    [[["mmux_libc_dup FDVAR FD"]]],
    [[["Duplicate the file descriptor FD, store the result in FDVAR."]]])


static int
mmux_libc_dup2_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_dup2"
{
  int	rv, old_fd, new_fd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[old_fd]]], [[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[new_fd]]], [[[argv[3]]]]);

  {
    rv = dup2(old_fd, new_fd);
    if (-1 != rv) {
      return mmux_bash_pointers_store_result_in_variable_sint(argv[1], rv, MMUX_BUILTIN_NAME);
    } else {
      return mmux_bash_pointers_consume_errno(MMUX_BUILTIN_NAME);
    }
  }

 argument_parse_error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_dup2]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_dup2 RVAR OLD_FD NEW_FD"]]],
    [[["Duplicate the file descriptor OLD_FD to NEW_FD, then close OLD_FD, store the result in RVAR."]]])


/* end of file */
