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


/** --------------------------------------------------------------------
 ** Type accessors: pointers to C standard types.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_POINTER_ACCESSOR]]],[[[
static int
mmux_$1_pointer_ref_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_pointer_ref"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *		ptr;
  uint8_t *		ptr_byte;
  mmux_libc_$1_t *	ptr_value;
  ptrdiff_t		offset;
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = (mmux_libc_$1_t *)ptr_byte;

  value = *ptr_value;

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], value);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_pointer_ref]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_pointer_ref VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$1\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_array_ref_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_array_ref"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  void *		ptr;
  mmux_libc_$1_t *	ptr_value;
  ptrdiff_t		index;
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&index, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  ptr_value = (mmux_libc_$1_t *)ptr;
  value     = ptr_value[index];

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], value);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
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
DEFINE_POINTER_ACCESSOR([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_POINTER_ACCESSOR([[[ullong]]],		[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_POINTER_ACCESSOR([[[float]]])
DEFINE_POINTER_ACCESSOR([[[double]]])
DEFINE_POINTER_ACCESSOR([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_POINTER_ACCESSOR([[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_POINTER_ACCESSOR([[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_POINTER_ACCESSOR([[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_POINTER_ACCESSOR([[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_POINTER_ACCESSOR([[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_POINTER_ACCESSOR([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_POINTER_ACCESSOR([[[complexf]]])
DEFINE_POINTER_ACCESSOR([[[complexd]]])
DEFINE_POINTER_ACCESSOR([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_POINTER_ACCESSOR([[[complexf32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_POINTER_ACCESSOR([[[complexf64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_POINTER_ACCESSOR([[[complexf128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_POINTER_ACCESSOR([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_POINTER_ACCESSOR([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_POINTER_ACCESSOR([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

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

/* end of file */
