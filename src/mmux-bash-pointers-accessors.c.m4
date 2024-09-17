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


m4_define([[[MMUX_BASH_DEFINE_POINTER_ACCESSOR]]],[[[
static int
mmux_bash_pointers_pointer_ref_[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-$1"
{
#if ($3)
  void *		ptr;
  uint8_t *		ptr_byte;
  mmux_libc_$1_t *	ptr_value;
  ptrdiff_t		offset;
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&offset, argv[3], MMUX_BUILTIN_NAME);
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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_pointer_ref_$1]]],
    [[[(4 == argc)]]],
    [[["pointer-ref-$1 VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$2\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[pointer]]],	[[[void *]]],			[[[1]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[schar]]],		[[[signed char]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uchar]]],		[[[unsigned char]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sshort]]],		[[[signed   short int]]],	[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ushort]]],		[[[unsigned short int]]],	[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint]]],		[[[signed   int]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint]]],		[[[unsigned int]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[slong]]],		[[[signed   long]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ulong]]],		[[[unsigned long]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sllong]]],		[[[signed   long long]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ullong]]],		[[[unsigned long long]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[float]]],		[[[float]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[double]]],		[[[double]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ldouble]]],	[[[long double]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[complex]]],	[[[double complex]]],		[[[1]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint8]]],		[[[int8_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint8]]],		[[[uint8_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint16]]],		[[[int16_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint16]]],		[[[uint16_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint32]]],		[[[int32_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint32]]],		[[[uint32_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint64]]],		[[[int64_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint64]]],		[[[uint64_t]]],			[[[1]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[usize]]],		[[[size_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ssize]]],		[[[ssize_t]]],			[[[1]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sintmax]]],	[[[intmax_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uintmax]]],	[[[uintmax_t]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sintptr]]],	[[[intptr_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uintptr]]],	[[[uintptr_t]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ptrdiff]]],	[[[ptrdiff_t]]],		[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[mode]]],		[[[mode_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[off]]],		[[[off_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[pid]]],		[[[pid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uid]]],		[[[uid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[gid]]],		[[[gid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[wchar]]],		[[[wchar_t]]],			[[[1]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[wint]]],		[[[wint_t]]],			[[[1]]])


m4_define([[[MMUX_BASH_DEFINE_ARRAY_ACCESSOR]]],[[[
static int
mmux_bash_pointers_array_ref_[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"array-ref-$1"
{
#if ($3)
  void *	ptr;
  $2 *		ptr_value;
  ptrdiff_t	index;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&index, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr_value = ($2 *)ptr;
  value     = ptr_value[index];

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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_array_ref_$1]]],
    [[[(4 == argc)]]],
    [[["array-ref-$1 VALUEVAR ARRAY INDEX"]]],
    [[["Retrieve a C language type \"$2\" value at INDEX in ARRAY, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[pointer]]],	[[[void *]]],			[[[1]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[schar]]],	[[[signed char]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uchar]]],	[[[unsigned char]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sshort]]],	[[[signed   short int]]],	[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ushort]]],	[[[unsigned short int]]],	[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint]]],	[[[signed   int]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint]]],	[[[unsigned int]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[slong]]],	[[[signed   long]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ulong]]],	[[[unsigned long]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sllong]]],	[[[signed   long long]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ullong]]],	[[[unsigned long long]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[float]]],	[[[float]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[double]]],	[[[double]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ldouble]]],	[[[long double]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[complex]]],	[[[double complex]]],		[[[1]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint8]]],	[[[int8_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint8]]],	[[[uint8_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint16]]],	[[[int16_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint16]]],	[[[uint16_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint32]]],	[[[int32_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint32]]],	[[[uint32_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint64]]],	[[[int64_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint64]]],	[[[uint64_t]]],			[[[1]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[usize]]],	[[[size_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ssize]]],	[[[ssize_t]]],			[[[1]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sintmax]]],	[[[intmax_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uintmax]]],	[[[uintmax_t]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sintptr]]],	[[[intptr_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uintptr]]],	[[[uintptr_t]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ptrdiff]]],	[[[ptrdiff_t]]],		[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[mode]]],	[[[mode_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[off]]],	[[[off_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[pid]]],	[[[pid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uid]]],	[[[uid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[gid]]],	[[[gid_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[wchar]]],	[[[wchar_t]]],			[[[1]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[wint]]],	[[[wint_t]]],			[[[1]]])

/* end of file */
