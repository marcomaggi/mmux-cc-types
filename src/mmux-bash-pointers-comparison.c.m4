/*
  Part of: MMUX Bash Pointers
  Contents: implementation of comparison builtins
  Date: Sep 19, 2024

  Abstract

	This module implements comparison builtins.

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
 ** Comparison core functions.
 ** ----------------------------------------------------------------- */

#undef  DECL
#define DECL		__attribute__((__const__)) static inline

m4_define([[[MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS]]],[[[
#if ($2)
DECL bool mmux_$1_equal         (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 == op2)? true : false; }
DECL bool mmux_$1_greater       (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 >  op2)? true : false; }
DECL bool mmux_$1_lesser        (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 <  op2)? true : false; }
DECL bool mmux_$1_greater_equal (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 >= op2)? true : false; }
DECL bool mmux_$1_lesser_equal  (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 <= op2)? true : false; }
#endif
]]])

m4_define([[[MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS]]],[[[
#if ($2)
DECL bool mmux_$1_equal         (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 == op2)?              true : false; }
DECL bool mmux_$1_greater       (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
DECL bool mmux_$1_lesser        (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (        isless(op1,op2))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
DECL bool mmux_$1_lesser_equal  (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
#endif
]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[pointer]]],	[[[1]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sshort]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ushort]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[float]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[double]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint16]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint16]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint32]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint32]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint64]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint64]]],	[[[1]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[off]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[pid]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uid]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[gid]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[wint]]],		[[[1]]])

DECL bool
mmux_complex_equal (mmux_libc_complex_t op1, mmux_libc_complex_t op2)
{
  return (op1 == op2)? true : false;
}


/** --------------------------------------------------------------------
 ** Addition builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_COMPARISON_BUILTIN]]],[[[
static int
mmux_$1_$2_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_$2"
{
#if ($3)
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 1, j = 2; j < argc; ++i, ++j) {
    /* if (1) { fprintf(stderr, "%s: comparing %ld %ld\n", __func__, (mmux_libc_slong_t)ops[i], (mmux_libc_slong_t)ops[j]); } */
    if (! mmux_$1_$2(ops[i], ops[j])) {
      return EXECUTION_FAILURE;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_$2]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_$2 OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])
]]])

m4_define([[[MMUX_BASH_DEFINE_COMPARISON_BUILTINS]]],[[[
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[equal]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[greater]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[lesser]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[greater_equal]]],	[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[lesser_equal]]],	[[[$2]]])
]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[pointer]]],		[[[1]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sshort]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ushort]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[double]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complex]]], [[[equal]]],	[[[1]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint16]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint16]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint32]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint32]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint64]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint64]]],		[[[1]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[off]]],			[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[pid]]],			[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uid]]],			[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[gid]]],			[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[wint]]],		[[[1]]])

/* end of file */
