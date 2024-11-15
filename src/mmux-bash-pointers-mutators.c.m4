/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory mutator builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory mutator builtins.

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
 ** Type accessors: pointers to C standard types.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_POINTER_MUTATOR]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_pointer_set]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *	ptr;
  ptrdiff_t	offset;
  mmux_$1_t	value;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_PTRDIFF(offset,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, value,	argv[3]);
  {
    uint8_t *		ptr_byte;
    mmux_$1_t *		ptr_value;

    ptr_byte  = ptr;
    ptr_byte += offset;
    ptr_value = (mmux_$1_t *)ptr_byte;

    *ptr_value = value;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: mutator \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_pointer_set]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_pointer_set POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"$1\"."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_array_set]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *	ptr;
  ptrdiff_t	index;
  mmux_$1_t	value;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_PTRDIFF(index,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, value,	argv[3]);
  {
    mmux_$1_t *	ptr_value;
    ptr_value        = (mmux_$1_t *)ptr;
    ptr_value[index] = value;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: mutator \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_array_set]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_array_set ARRAY INDEX VALUE"]]],
    [[["Store VALUE at INDEX in ARRAY, VALUE must fit a C language type \"$1\"."]]])
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
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[double]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexd]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

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
MMUX_BASH_DEFINE_POINTER_MUTATOR([[[time]]])

/* end of file */
