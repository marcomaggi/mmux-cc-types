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

m4_define([[[MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DECL bool mmux_$1_equal         (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 == op2)? true : false; }
]]])]]])

m4_define([[[MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL bool mmux_$1_greater       (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 >  op2)? true : false; }
DECL bool mmux_$1_lesser        (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 <  op2)? true : false; }
DECL bool mmux_$1_greater_equal (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 >= op2)? true : false; }
DECL bool mmux_$1_lesser_equal  (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 <= op2)? true : false; }
]]])]]])

m4_define([[[MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL bool mmux_$1_greater       (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
DECL bool mmux_$1_lesser        (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (        isless(op1,op2))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
DECL bool mmux_$1_lesser_equal  (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
]]])]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[pointer]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[schar]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uchar]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sshort]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ushort]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[slong]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ulong]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[float]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[double]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_FLOAT_FUNCTIONS([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint8]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint8]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint16]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint16]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint32]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint32]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sint64]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uint64]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[usize]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ssize]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sintmax]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uintmax]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[sintptr]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uintptr]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[ptrdiff]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[mode]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[off]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[pid]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[uid]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[gid]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[wchar]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_INTEGER_FUNCTIONS([[[wint]]])

MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS([[[complexf]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS([[[complexd]]])
MMUX_BASH_DEFINE_CORE_COMPARISON_EQUAL_FUNCTIONS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Addition builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_COMPARISON_BUILTIN]]],[[[
static int
mmux_$1_$2_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_$2"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 1, j = 2; j < argc; ++i, ++j) {
    if (! mmux_$1_$2(ops[i], ops[j])) {
      return EXECUTION_FAILURE;
    }
  }
  return EXECUTION_SUCCESS;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
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

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[pointer]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[schar]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uchar]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sshort]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ushort]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[slong]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ulong]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sllong]]],			[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ullong]]],			[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[double]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ldouble]]],			[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf]]],  [[[equal]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexd]]],  [[[equal]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexld]]], [[[equal]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint8]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint8]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint16]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint16]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sint64]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uint64]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[usize]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ssize]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sintmax]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uintmax]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sintptr]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uintptr]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ptrdiff]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[mode]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[off]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[pid]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[uid]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[gid]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[wchar]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[wint]]])

/* end of file */
