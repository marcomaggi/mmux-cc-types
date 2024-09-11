/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory accessors builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory accessor builtins.

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


m4_define([[[MMUX_BASH_POINTERS_DEFINE_ACCESSOR]]],[[[
static int
mmuxpointerspointerref[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-$1"
{
#if ($3)
  void *	ptr;
  uint8_t *	ptr_byte;
  $2 *		ptr_value;
  size_t	offset;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = ($2 *)ptr_byte;

  value = *ptr_value;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];
    int		flags = 0;

    rv = mmux_bash_pointers_sprint_$1(str,LEN,value);
    if (EXECUTION_SUCCESS == rv) {
      /* NOTE I  do not know what  FLAGS is for, but  setting it to zero  seems fine.
	 (Marco Maggi; Sep 9, 2024) */
      v = bind_variable(argv[1], str, flags);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerref$1]]],[[[(4 != argc)]]],
    [[["pointer-ref-$1 VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$2\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[pointer]]],	[[[void *]]],			[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[schar]]],		[[[signed char]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uchar]]],		[[[unsigned char]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint]]],		[[[signed   int]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint]]],		[[[unsigned int]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[slong]]],		[[[signed   long]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ulong]]],		[[[unsigned long]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sllong]]],	[[[signed   long long]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ullong]]],	[[[unsigned long long]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[float]]],		[[[float]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[double]]],	[[[double]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ldouble]]],	[[[long double]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[complex]]],	[[[double complex]]],		[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint8]]],		[[[int8_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint8]]],		[[[uint8_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint16]]],	[[[int16_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint16]]],	[[[uint16_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint32]]],	[[[int32_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint32]]],	[[[uint32_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint64]]],	[[[int64_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint64]]],	[[[uint64_t]]],			[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[usize]]],		[[[size_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ssize]]],		[[[ssize_t]]],			[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[intmax]]],	[[[intmax_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[intptr]]],	[[[intptr_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uintptr]]],	[[[uintptr_t]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ptrdiff]]],	[[[ptrdiff_t]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[mode]]],		[[[mode_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[off]]],		[[[off_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[pid]]],		[[[pid_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uid]]],		[[[uid_t]]],			[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[gid]]],		[[[gid_t]]],			[[[1]]])

/* end of file */
