/*
  Part of: MMUX Bash Pointers
  Contents: implementation of comparison builtins
  Date: Sep 19, 2024

  Abstract

	This module implements comparison builtins.

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
 ** Comparison builtins.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - the type stem
m4_dnl $2 - the function stem
m4_dnl $3 - preprocessor symbol for conditional definition
m4_define([[[MMUX_BASH_DEFINE_COMPARISON_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_$2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_$1_t	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 1, j = 2; j < argc; ++i, ++j) {
    if (! mmux_$1_$2(ops[i], ops[j])) {
      return MMUX_FAILURE;
    }
  }
  return MMUX_SUCCESS;
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_$2]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_$2 OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])
]]])

m4_dnl $1 - the type stem
m4_dnl $2 - preprocessor symbol for conditional definition
m4_define([[[MMUX_BASH_DEFINE_COMPARISON_BUILTINS]]],[[[
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[equal]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[greater]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[less]]],		[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[greater_equal]]],	[[[$2]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[$1]]],	[[[less_equal]]],	[[[$2]]])
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
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[sllong]]],			[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ullong]]],			[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[double]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[ldouble]]],			[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float32]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float64]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float128]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float32x]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float64x]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[float128x]]],			[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[decimal32]]],			[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[decimal64]]],			[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTINS([[[decimal128]]],			[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf]]],	[[[equal]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexd]]],	[[[equal]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexld]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf32]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf64]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf128]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf32x]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf64x]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexf128x]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexd32]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexd64]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
MMUX_BASH_DEFINE_COMPARISON_BUILTIN([[[complexd128]]],	[[[equal]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

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


/** --------------------------------------------------------------------
 ** Approximate comparison builtins for real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_equal_absmargin]]])
#undef  MMUX_MARGIN_VARNAME
#define MMUX_MARGIN_VARNAME	"ABSOLUTE_MARGIN_[[[]]]MMUX_M4_TOUPPER($1)"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
  mmux_$1_t	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  {
    mmux_$1_t	margin = MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN;

    /* Read the  margin from the  shell variable "ABSOLUTE_MARGIN_STEM", if  any.  If
       there is no such variable: just use the default value. */
    {
      char const *	margin_string;
      mmux_bash_rv_t	rv;

      rv = mmux_bash_get_shell_variable_string_value(&margin_string, MMUX_MARGIN_VARNAME, NULL);
      if (MMUX_SUCCESS == rv) {
	MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, margin, margin_string);
      }
    }

    for (int i = 2; i < argc; ++i) {
      if (! mmux_$1_equal_absmargin(ops[1], ops[i], margin)) {
	return MMUX_FAILURE;
      }
    }
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_absmargin]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_absmargin OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_equal_relepsilon]]])
#undef  MMUX_EPSILON_VARNAME
#define MMUX_EPSILON_VARNAME	"RELATIVE_EPSILON_[[[]]]MMUX_M4_TOUPPER($1)"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
  mmux_$1_t	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  {
    mmux_$1_t	epsilon = MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON;

    /* Read the epsilon from the  shell variable "ABSOLUTE_EPSILON_STEM", if any.  If
       there is no such variable: just use the default value. */
    {
      char const *	epsilon_string;
      mmux_bash_rv_t	rv;

      rv = mmux_bash_get_shell_variable_string_value(&epsilon_string, MMUX_EPSILON_VARNAME, NULL);
      if (MMUX_SUCCESS == rv) {
	MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, epsilon, epsilon_string);
      }
    }

    if (0) { fprintf(stderr, "%s: epsilon=%Lf\n", __func__, (long double)epsilon); }

    for (int i = 2; i < argc; ++i) {
      if (! mmux_$1_equal_relepsilon(ops[1], ops[i], epsilon)) {
	return MMUX_FAILURE;
      }
    }
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_relepsilon]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_relepsilon OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])
]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[double]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float128x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[decimal128]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Approximate comparison builtins for complex floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_equal_absmargin]]])
#undef  MMUX_MARGIN_VARNAME
#define MMUX_MARGIN_VARNAME	"ABSOLUTE_MARGIN_[[[]]]MMUX_M4_TOUPPER($1)"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
  mmux_$1_t	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  {
    mmux_$1_t	margin = mmux_$1_make_rectangular(MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN,
						  MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN);

    /* Read the  margin from the  shell variable "ABSOLUTE_MARGIN_STEM", if  any.  If
       there is no such variable: just use the default value. */
    {
      char const *	margin_string;
      mmux_bash_rv_t	rv;

      rv = mmux_bash_get_shell_variable_string_value(&margin_string, MMUX_MARGIN_VARNAME, NULL);
      if (MMUX_SUCCESS == rv) {
	MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, margin, margin_string);
      }
    }

    for (int i = 2; i < argc; ++i) {
      if (! mmux_$1_equal_absmargin(ops[1], ops[i], margin)) {
	return MMUX_FAILURE;
      }
    }
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_absmargin]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_absmargin OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_equal_relepsilon]]])
#undef  MMUX_EPSILON_VARNAME
#define MMUX_EPSILON_VARNAME	"RELATIVE_EPSILON_[[[]]]MMUX_M4_TOUPPER($1)"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
  mmux_$1_t	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  {
    mmux_$1_t	epsilon = mmux_$1_make_rectangular(MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON,
						   MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON);

    /* Read the epsilon from the  shell variable "ABSOLUTE_EPSILON_STEM", if any.  If
       there is no such variable: just use the default value. */
    {
      char const *	epsilon_string;
      mmux_bash_rv_t	rv;

      rv = mmux_bash_get_shell_variable_string_value(&epsilon_string, MMUX_EPSILON_VARNAME, NULL);
      if (MMUX_SUCCESS == rv) {
	MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, epsilon, epsilon_string);
      }
    }

    for (int i = 2; i < argc; ++i) {
      if (! mmux_$1_equal_relepsilon(ops[1], ops[i], epsilon)) {
	return MMUX_FAILURE;
      }
    }
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[m4_dnl
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_relepsilon]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_relepsilon OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])
]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexd]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

/* end of file */
