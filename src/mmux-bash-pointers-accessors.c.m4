/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory accessors builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory accessor builtins.

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

m4_define([[[DEFINE_POINTER_ACCESSOR]]],[[[MMUX_BASH_BUILTIN_MAIN(mmux_$1_pointer_ref)
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *	ptr;
  ptrdiff_t	offset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_PTRDIFF(offset,	3);
  {
    uint8_t *	ptr_byte;
    mmux_$1_t *	ptr_value;
    mmux_$1_t	value;

    ptr_byte  = ptr;
    ptr_byte += offset;
    ptr_value = (mmux_$1_t *)ptr_byte;
    value     = *ptr_value;
    return mmux_$1_bind_to_bash_variable(argv[1], value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_pointer_ref]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_pointer_ref VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$1\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_array_ref]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *	ptr;
  ptrdiff_t	index;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_PTRDIFF(index,	3);
  {
    mmux_$1_t *	ptr_value;
    mmux_$1_t	value;

    ptr_value = (mmux_$1_t *)ptr;
    value     = ptr_value[index];
    return mmux_$1_bind_to_bash_variable(argv[1], value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_array_ref]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_array_ref VALUEVAR ARRAY INDEX"]]],
    [[["Retrieve a C language type \"$2\" value at INDEX in ARRAY, store it in the given VALUEVAR."]]])
]]])

DEFINE_POINTER_ACCESSOR([[[pointer]]])

DEFINE_POINTER_ACCESSOR([[[schar]]])
DEFINE_POINTER_ACCESSOR([[[uchar]]])
DEFINE_POINTER_ACCESSOR([[[sshort]]])
DEFINE_POINTER_ACCESSOR([[[ushort]]])
DEFINE_POINTER_ACCESSOR([[[sint]]])
DEFINE_POINTER_ACCESSOR([[[uint]]])
DEFINE_POINTER_ACCESSOR([[[slong]]])
DEFINE_POINTER_ACCESSOR([[[ulong]]])
DEFINE_POINTER_ACCESSOR([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_POINTER_ACCESSOR([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_POINTER_ACCESSOR([[[float]]])
DEFINE_POINTER_ACCESSOR([[[double]]])
DEFINE_POINTER_ACCESSOR([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_POINTER_ACCESSOR([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_POINTER_ACCESSOR([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_POINTER_ACCESSOR([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_POINTER_ACCESSOR([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_POINTER_ACCESSOR([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_POINTER_ACCESSOR([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_POINTER_ACCESSOR([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_POINTER_ACCESSOR([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_POINTER_ACCESSOR([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_POINTER_ACCESSOR([[[complexf]]])
DEFINE_POINTER_ACCESSOR([[[complexd]]])
DEFINE_POINTER_ACCESSOR([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_POINTER_ACCESSOR([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_POINTER_ACCESSOR([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_POINTER_ACCESSOR([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_POINTER_ACCESSOR([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_POINTER_ACCESSOR([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_POINTER_ACCESSOR([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_POINTER_ACCESSOR([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_POINTER_ACCESSOR([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_POINTER_ACCESSOR([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

DEFINE_POINTER_ACCESSOR([[[sint8]]])
DEFINE_POINTER_ACCESSOR([[[uint8]]])
DEFINE_POINTER_ACCESSOR([[[sint16]]])
DEFINE_POINTER_ACCESSOR([[[uint16]]])
DEFINE_POINTER_ACCESSOR([[[sint32]]])
DEFINE_POINTER_ACCESSOR([[[uint32]]])
DEFINE_POINTER_ACCESSOR([[[sint64]]])
DEFINE_POINTER_ACCESSOR([[[uint64]]])

DEFINE_POINTER_ACCESSOR([[[usize]]])
DEFINE_POINTER_ACCESSOR([[[ssize]]])

DEFINE_POINTER_ACCESSOR([[[sintmax]]])
DEFINE_POINTER_ACCESSOR([[[uintmax]]])
DEFINE_POINTER_ACCESSOR([[[sintptr]]])
DEFINE_POINTER_ACCESSOR([[[uintptr]]])
DEFINE_POINTER_ACCESSOR([[[ptrdiff]]])
DEFINE_POINTER_ACCESSOR([[[mode]]])
DEFINE_POINTER_ACCESSOR([[[off]]])
DEFINE_POINTER_ACCESSOR([[[pid]]])
DEFINE_POINTER_ACCESSOR([[[uid]]])
DEFINE_POINTER_ACCESSOR([[[gid]]])
DEFINE_POINTER_ACCESSOR([[[wchar]]])
DEFINE_POINTER_ACCESSOR([[[wint]]])
DEFINE_POINTER_ACCESSOR([[[time]]])
DEFINE_POINTER_ACCESSOR([[[socklen]]])
DEFINE_POINTER_ACCESSOR([[[rlim]]])

/* end of file */
