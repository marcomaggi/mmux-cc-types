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

m4_define([[[MMUX_BASH_DEFINE_POINTER_ACCESSOR]]],[[[
static int
mmux_$1_pointer_ref_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
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
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = (mmux_libc_$1_t *)ptr_byte;

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
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_pointer_ref]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_pointer_ref VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$1\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[pointer]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[schar]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uchar]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sshort]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ushort]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[slong]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ulong]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[float]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[double]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[complex]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint8]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint8]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint16]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint16]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint32]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint32]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sint64]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uint64]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[usize]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ssize]]])

MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sintmax]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uintmax]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[sintptr]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uintptr]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[ptrdiff]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[mode]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[off]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[pid]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[uid]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[gid]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[wchar]]])
MMUX_BASH_DEFINE_POINTER_ACCESSOR([[[wint]]])


/** --------------------------------------------------------------------
 ** Type accessors: pointers to arrays of C standard types.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_ARRAY_ACCESSOR]]],[[[
static int
mmux_$1_array_ref_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
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
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&index, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  ptr_value = (mmux_libc_$1_t *)ptr;
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
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_array_ref]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_array_ref VALUEVAR ARRAY INDEX"]]],
    [[["Retrieve a C language type \"$2\" value at INDEX in ARRAY, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[pointer]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[schar]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uchar]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sshort]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ushort]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[slong]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ulong]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[float]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[double]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[complex]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint8]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint8]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint16]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint16]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint32]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint32]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sint64]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uint64]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[usize]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ssize]]])

MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sintmax]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uintmax]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[sintptr]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uintptr]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[ptrdiff]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[mode]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[off]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[pid]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[uid]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[gid]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[wchar]]])
MMUX_BASH_DEFINE_ARRAY_ACCESSOR([[[wint]]])

/* end of file */
