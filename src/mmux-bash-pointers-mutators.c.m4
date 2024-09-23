/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory mutator builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory mutator builtins.

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
 ** Type accessors: pointers to C standard types.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_POINTER_MUTATOR]]],[[[
static int
mmux_$1_pointer_set_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_pointer_set"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *		ptr;
  uint8_t *		ptr_byte;
  mmux_libc_$1_t *	ptr_value;
  ptrdiff_t		offset;
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_$1(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = (mmux_libc_$1_t *)ptr_byte;

  *ptr_value = value;
  return EXECUTION_SUCCESS;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: mutator \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_pointer_set]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_pointer_set POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"$1\"."]]])
]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[pointer]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[schar]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uchar]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sshort]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ushort]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sint]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uint]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[slong]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ulong]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[double]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complex]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sint8]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uint8]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sint16]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uint16]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sint32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uint32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sint64]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uint64]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[usize]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ssize]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sintmax]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uintmax]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sintptr]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uintptr]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ptrdiff]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[mode]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[off]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[pid]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[uid]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[gid]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[wchar]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[wint]]])


/** --------------------------------------------------------------------
 ** Type accessors: pointers to arrays of C standard types.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_ARRAY_MUTATOR]]],[[[
static int
mmux_$1_array_set_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_array_set"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *		ptr;
  mmux_libc_$1_t *	ptr_value;
  ptrdiff_t		index;
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&index, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_$1(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  ptr_value        = (mmux_libc_$1_t *)ptr;
  ptr_value[index] = value;
  return EXECUTION_SUCCESS;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: mutator \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_array_set]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_array_set ARRAY INDEX VALUE"]]],
    [[["Store VALUE at INDEX in ARRAY, VALUE must fit a C language type \"$1\"."]]])
]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[pointer]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[schar]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uchar]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sshort]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ushort]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sint]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uint]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[slong]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ulong]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[float]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[double]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[complex]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sint8]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uint8]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sint16]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uint16]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sint32]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uint32]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sint64]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uint64]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[usize]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ssize]]])

MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sintmax]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uintmax]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[sintptr]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uintptr]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[ptrdiff]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[mode]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[off]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[pid]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[uid]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[gid]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[wchar]]])
MMUX_BASH_DEFINE_ARRAY_MUTATOR([[[wint]]])

/* end of file */
