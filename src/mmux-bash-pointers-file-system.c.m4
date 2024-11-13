/*
  Part of: MMUX Bash Pointers
  Contents: implementation of file system interface builtins
  Date: Nov 13, 2024

  Abstract

	This module implements file system interface builtins.

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
 ** Hard links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_link]]])
{
  char const *	oldname;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[2]);
  {
    int		rv = link(oldname, newname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_linkat]]])
{
  int		oldfd;
  char const *	oldname;
  int		newfd;
  char const *	newname;
  int		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(oldfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(newfd,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[5]);
  {
    int		rv = linkat(oldfd, oldname, newfd, newname, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDFD OLDNAME NEWFD NEWNAME FLAGS"]]])


/** --------------------------------------------------------------------
 ** Symbolic links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_symlink]]])
{
  char const *	oldname;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[2]);
  {
    int		rv = symlink(oldname, newname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_readlink]]])
{
  char const *	filename;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(filename,	argv[2]);
  {
    ssize_t	provided_size = 0;

    while (true) {
      provided_size += 1024;
      {
	char	buffer[provided_size];
	ssize_t	required_size;

	memset(buffer, '\0', provided_size);
	required_size = readlink(filename, buffer, provided_size-1);

	if (required_size < 0) {
	  mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  return MMUX_FAILURE;
	} else if (required_size == provided_size) {
	  continue;
	} else {
	  return mmux_string_bind_to_bash_variable(argv[1], buffer, MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER REAL_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_canonicalize_file_name]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_CANONICALIZE_FILE_NAME]]],[[[
  char const *	in;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(in,	argv[2]);
  {
    char *	ou = canonicalize_file_name(in);

    if (ou) {
      mmux_bash_rv_t	rv = mmux_string_bind_to_bash_variable(argv[1], ou, MMUX_BASH_BUILTIN_STRING_NAME);
      free(ou);
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CANON_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_realpath]]])
{
  char const *	in;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(in,	argv[2]);
  {
    char *	ou = realpath(in, NULL);

    if (ou) {
      mmux_bash_rv_t	rv = mmux_string_bind_to_bash_variable(argv[1], ou, MMUX_BASH_BUILTIN_STRING_NAME);
      free(ou);
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CANON_PATHNAME_VAR PATHNAME"]]])


/** --------------------------------------------------------------------
 ** Deleting links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_unlink]]])
{
  char const *	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  {
    int		rv = unlink(pathname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_unlinkat]]])
{
  int		dirfd;
  char const *	pathname;
  int		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[3]);
  {
    int		rv = unlinkat(dirfd, pathname, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME FLAGS"]]])


/* end of file */
