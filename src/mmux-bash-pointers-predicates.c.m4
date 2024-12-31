/*
  Part of: MMUX Bash Pointers
  Contents: functions to validate the string representation of C language types
  Date: Sep 18, 2024

  Abstract

	This module  functions to  validate the string  representation of  C language
	types.

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
 ** Type predicate builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPE_STRING_REP_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_string_is_$1]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	data MMUX_BASH_POINTERS_UNUSED;
  bool		rv = mmux_$1_parse(&data, argv[1], NULL);

  return (false == rv)? MMUX_SUCCESS : MMUX_FAILURE;
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_string_is_$1]]],
    [[[(2 == argc)]]],
    [[["mmux_string_is_$1 STRING_REP"]]],
    [[["Return true if STRING_REP is a valid string representation for the C language type."]]])
]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[pointer]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[schar]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uchar]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sshort]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[ushort]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sint]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uint]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[slong]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[ulong]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[float]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[double]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexd]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[sint8]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uint8]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sint16]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uint16]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sint32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uint32]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sint64]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uint64]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[ssize]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[usize]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sintmax]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uintmax]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[sintptr]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uintptr]]])

DEFINE_TYPE_STRING_REP_PREDICATE([[[ptrdiff]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[mode]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[off]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[pid]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[uid]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[gid]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[wchar]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[wint]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[time]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[socklen]]])
DEFINE_TYPE_STRING_REP_PREDICATE([[[rlim]]])


/** --------------------------------------------------------------------
 ** Arithmetic predicate builtins: zero, positive, negative, non-positive, non-negative, nan, infinite.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_ARITHMETIC_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_is_$3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
  mmux_$1_t	value;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, value, argv[1]);
  {
    return (mmux_$1_is_$3(value))? MMUX_SUCCESS : MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  mmux_libc_dprintfer("MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_is_$3]]],
    [[[(2 == argc)]]],
    [[["mmux_$1_is_$3 OP"]]],
    [[["Return true if OP is a valid representation of a $2 value for the C language type \"$1\"."]]])
]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED]]],[[[
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[zero]]],		[[[zero]]],	      [[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[nan]]],		[[[nan]]],	      [[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[infinite]]],		[[[infinite]]],	      [[[$2]]])
]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_ALL_ARITHMETIC_PREDICATES]]],[[[
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[$1]]],[[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[positive]]],		[[[positive]]],	      [[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[negative]]],		[[[negative]]],	      [[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[non-positive]]],	[[[non_positive]]],   [[[$2]]])
DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[non-negative]]],	[[[non_negative]]],   [[[$2]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_ALL_ARITHMETIC_PREDICATES([[[pointer]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[schar]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uchar]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sshort]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[ushort]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[slong]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[ulong]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[float]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[double]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexd]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexld]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_ALL_ARITHMETIC_PREDICATES_FOR_NONSIGNED([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint8]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint8]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint16]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint16]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint32]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint64]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint64]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[ssize]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[usize]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintmax]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintmax]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintptr]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintptr]]])

DEFINE_ALL_ARITHMETIC_PREDICATES([[[ptrdiff]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[mode]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[off]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[pid]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[uid]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[gid]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[wchar]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[wint]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[time]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[socklen]]])
DEFINE_ALL_ARITHMETIC_PREDICATES([[[rlim]]])

/* end of file */
