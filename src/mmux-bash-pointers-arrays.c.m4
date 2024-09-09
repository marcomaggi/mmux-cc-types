/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory management builtins
  Date: Sep  9, 2024

  Abstract

	This module implements memory arrays accessor and mutator builtins.

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
 ** Arrays mutators.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_MUTATOR]]],[[[
static int
mmuxpointerspointerset[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-$1"
{
  $2 *		ptr;
  size_t	offset;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_$1(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  *(ptr + offset) = value;
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerset$1]]],[[[(4 != argc)]]],
    [[["pointer-set-$1 POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"$2\"."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[sint]]],		[[[signed   int]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[uint]]],		[[[unsigned int]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[slong]]],		[[[signed   long]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ulong]]],		[[[unsigned long]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[usize]]],		[[[size_t]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ssize]]],		[[[ssize_t]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[float]]],		[[[float]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[double]]],		[[[double]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ldouble]]],	[[[long double]]])


/** --------------------------------------------------------------------
 ** Arrays accessors.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_ACCESSOR]]],[[[
static int
mmuxpointerspointerref[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-$1"
{
  $2 *		ptr;
  size_t	offset;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  value = *(ptr + offset);

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
    char	str[64];
    int		flags = 0;

    snprintf(str, 1024, $3, value);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerref$1]]],[[[(4 != argc)]]],
    [[["pointer-ref-$1 VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$2\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint]]],		[[[signed   int]]],	[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint]]],		[[[unsigned int]]],	[[["%u"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[slong]]],		[[[signed   long]]],	[[["%ld"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ulong]]],		[[[unsigned long]]],	[[["%lu"]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[usize]]],		[[[size_t]]],		[[["%lu"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ssize]]],		[[[ssize_t]]],		[[["%ld"]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[float]]],		[[[float]]],		[[["%f"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[double]]],	[[[double]]],		[[["%lf"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ldouble]]],	[[[long double]]],	[[["%Lf"]]])

/* end of file */
