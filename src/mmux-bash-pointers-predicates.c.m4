/*
  Part of: MMUX Bash Pointers
  Contents: functions to validate the string representation of C language types
  Date: Sep 18, 2024

  Abstract

	This module  functions to  validate the string  representation of  C language
	types.

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


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, no typedefs.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE]]],[[[static int
mmux_bash_pointers_[[[]]]$1[[[]]]_p_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"[[[]]]$1[[[]]]_p"
{
#if ($2)
  mmux_libc_[[[]]]$1[[[]]]_t	data;

  return mmux_bash_pointers_parse_[[[]]]$1[[[]]](&data, argv[1], MMUX_BUILTIN_NAME);
#else
  fprintf(stderr, "MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_[[[]]]$1[[[]]]_p]]],
    [[[(2 == argc)]]],
    [[["$1[[[]]]_p STRING_REP"]]],
    [[["Return true if STRING_REP is a valid string representation for the C language type."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pointer]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[schar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sshort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ushort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[slong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ulong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[float]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[double]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint64]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint64]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ssize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[usize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintptr]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintptr]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[mode]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[off]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[gid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wint]]],		[[[1]]])

/* end of file */
