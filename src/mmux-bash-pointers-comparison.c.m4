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
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

static inline float  mmux_fmaxf (float X, float Y) { return (X >= Y)? X : Y; }
bool
mmux_float_equal_absmargin (mmux_libc_float_t op1, mmux_libc_float_t op2, mmux_libc_float_t margin)
{
  return (fabsf(op1 - op2) <= fabsf(margin))? true : false;
}
bool
mmux_float_equal_relepsilon (mmux_libc_float_t op1, mmux_libc_float_t op2, mmux_libc_float_t epsilon)
{
  return (fabsf(op1 - op2) <= (epsilon * mmux_fmaxf(fabsf(op1), fabsf(op2))))? true : false;
}
bool
mmux_complexf_equal_absmargin (mmux_libc_complexf_t op1, mmux_libc_complexf_t op2, mmux_libc_complexf_t margin)
{
  mmux_libc_complexf_part_t	re1 = mmux_bash_pointers_complexf_real_part(op1);
  mmux_libc_complexf_part_t	im1 = mmux_bash_pointers_complexf_imag_part(op1);
  mmux_libc_complexf_part_t	re2 = mmux_bash_pointers_complexf_real_part(op2);
  mmux_libc_complexf_part_t	im2 = mmux_bash_pointers_complexf_imag_part(op2);
  mmux_libc_complexf_part_t	ret = mmux_bash_pointers_complexf_real_part(margin);
  mmux_libc_complexf_part_t	imt = mmux_bash_pointers_complexf_imag_part(margin);

  return (mmux_float_equal_absmargin(re1, re2, ret) && mmux_float_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_complexf_equal_relepsilon (mmux_libc_complexf_t op1, mmux_libc_complexf_t op2, mmux_libc_complexf_t epsilon)
{
  mmux_libc_complexf_part_t	re1 = mmux_bash_pointers_complexf_real_part(op1);
  mmux_libc_complexf_part_t	im1 = mmux_bash_pointers_complexf_imag_part(op1);
  mmux_libc_complexf_part_t	re2 = mmux_bash_pointers_complexf_real_part(op2);
  mmux_libc_complexf_part_t	im2 = mmux_bash_pointers_complexf_imag_part(op2);
  mmux_libc_complexf_part_t	ret = mmux_bash_pointers_complexf_real_part(epsilon);
  mmux_libc_complexf_part_t	imt = mmux_bash_pointers_complexf_imag_part(epsilon);

  return (mmux_float_equal_relepsilon(re1, re2, ret) && mmux_float_equal_relepsilon(im1, im2, imt))? true : false;
}

/* ------------------------------------------------------------------ */

static inline double mmux_fmax  (double X, double Y) { return (X >= Y)? X : Y; }
bool
mmux_double_equal_absmargin (mmux_libc_double_t op1, mmux_libc_double_t op2, mmux_libc_double_t margin)
{
  return (fabs(op1 - op2) <= fabs(margin))? true : false;
}
bool
mmux_double_equal_relepsilon (mmux_libc_double_t op1, mmux_libc_double_t op2, mmux_libc_double_t epsilon)
{
  return (fabs(op1 - op2) <= (epsilon * mmux_fmax(fabs(op1), fabs(op2))))? true : false;
}
bool
mmux_complexd_equal_absmargin (mmux_libc_complexd_t op1, mmux_libc_complexd_t op2, mmux_libc_complexd_t margin)
{
  mmux_libc_complexd_part_t	re1 = mmux_bash_pointers_complexd_real_part(op1);
  mmux_libc_complexd_part_t	im1 = mmux_bash_pointers_complexd_imag_part(op1);
  mmux_libc_complexd_part_t	re2 = mmux_bash_pointers_complexd_real_part(op2);
  mmux_libc_complexd_part_t	im2 = mmux_bash_pointers_complexd_imag_part(op2);
  mmux_libc_complexd_part_t	ret = mmux_bash_pointers_complexd_real_part(margin);
  mmux_libc_complexd_part_t	imt = mmux_bash_pointers_complexd_imag_part(margin);

  return (mmux_double_equal_absmargin(re1, re2, ret) && mmux_double_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_complexd_equal_relepsilon (mmux_libc_complexd_t op1, mmux_libc_complexd_t op2, mmux_libc_complexd_t epsilon)
{
  mmux_libc_complexd_part_t	re1 = mmux_bash_pointers_complexd_real_part(op1);
  mmux_libc_complexd_part_t	im1 = mmux_bash_pointers_complexd_imag_part(op1);
  mmux_libc_complexd_part_t	re2 = mmux_bash_pointers_complexd_real_part(op2);
  mmux_libc_complexd_part_t	im2 = mmux_bash_pointers_complexd_imag_part(op2);
  mmux_libc_complexd_part_t	ret = mmux_bash_pointers_complexd_real_part(epsilon);
  mmux_libc_complexd_part_t	imt = mmux_bash_pointers_complexd_imag_part(epsilon);

  return (mmux_double_equal_relepsilon(re1, re2, ret) && mmux_double_equal_relepsilon(im1, im2, imt))? true : false;
}

/* ------------------------------------------------------------------ */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[
static inline long double mmux_fmaxl (long double X, long double Y) { return (X >= Y)? X : Y; }
bool
mmux_ldouble_equal_absmargin (mmux_libc_ldouble_t op1, mmux_libc_ldouble_t op2, mmux_libc_ldouble_t margin)
{
  return (fabsl(op1 - op2) <= fabsl(margin))? true : false;
}
bool
mmux_ldouble_equal_relepsilon (mmux_libc_ldouble_t op1, mmux_libc_ldouble_t op2, mmux_libc_ldouble_t epsilon)
{
  return (fabsl(op1 - op2) <= (epsilon * mmux_fmaxl(fabsl(op1), fabsl(op2))))? true : false;
}
bool
mmux_complexld_equal_absmargin (mmux_libc_complexld_t op1, mmux_libc_complexld_t op2, mmux_libc_complexld_t margin)
{
  mmux_libc_complexld_part_t	re1 = mmux_bash_pointers_complexld_real_part(op1);
  mmux_libc_complexld_part_t	im1 = mmux_bash_pointers_complexld_imag_part(op1);
  mmux_libc_complexld_part_t	re2 = mmux_bash_pointers_complexld_real_part(op2);
  mmux_libc_complexld_part_t	im2 = mmux_bash_pointers_complexld_imag_part(op2);
  mmux_libc_complexld_part_t	ret = mmux_bash_pointers_complexld_real_part(margin);
  mmux_libc_complexld_part_t	imt = mmux_bash_pointers_complexld_imag_part(margin);

  return (mmux_ldouble_equal_absmargin(re1, re2, ret) && mmux_ldouble_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_complexld_equal_relepsilon (mmux_libc_complexld_t op1, mmux_libc_complexld_t op2, mmux_libc_complexld_t epsilon)
{
  mmux_libc_complexld_part_t	re1 = mmux_bash_pointers_complexld_real_part(op1);
  mmux_libc_complexld_part_t	im1 = mmux_bash_pointers_complexld_imag_part(op1);
  mmux_libc_complexld_part_t	re2 = mmux_bash_pointers_complexld_real_part(op2);
  mmux_libc_complexld_part_t	im2 = mmux_bash_pointers_complexld_imag_part(op2);
  mmux_libc_complexld_part_t	ret = mmux_bash_pointers_complexld_real_part(epsilon);
  mmux_libc_complexld_part_t	imt = mmux_bash_pointers_complexld_imag_part(epsilon);

  return (mmux_ldouble_equal_relepsilon(re1, re2, ret) && mmux_ldouble_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])


/** --------------------------------------------------------------------
 ** Comparison builtins.
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


/** --------------------------------------------------------------------
 ** Approximate comparison builtins for real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS]]],[[[
static int
mmux_$1_equal_absmargin_main (int argc,  char * argv[])

#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_equal_absmargin"

m4_dnl This is an m4 macro, rather than a CPP definition, because we need to use the
m4_dnl toupper macro; m4 interprets "#" characters as comments, so the following:
m4_dnl
m4_dnl    #define NAME        mmux_toupper($1)
m4_dnl
m4_dnl will leave the macro use not expanded.
m4_define([[[MMUX_MARGIN_VARNAME]]],[[["ABSOLUTE_MARGIN_[[[]]]mmux_toupper($1)"]]])

{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  mmux_libc_$1_t	margin = MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN;
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  {
    SHELL_VAR *		margin_shell_variable = find_variable(MMUX_MARGIN_VARNAME);

    if (0) {
      if (margin_shell_variable) {
	fprintf(stderr, "%s: found margin shell variable: %s\n", __func__, MMUX_MARGIN_VARNAME);
      } else {
	fprintf(stderr, "%s: NOT found margin shell variable: %s\n", __func__, MMUX_MARGIN_VARNAME);
      }
    }

    /* FIXME Should  also check that  the variable is not  an array?  Or  a function?
       (Marco Maggi; Sep 25, 2024) */
    if (margin_shell_variable && var_isset(margin_shell_variable)) {
      char const * const	margin_asciiz = get_variable_value(margin_shell_variable);

      rv = mmux_bash_pointers_parse_$1(&margin, margin_asciiz, MMUX_BUILTIN_NAME);
      /* FIXME Should warn  that the error is in the  margin variable. (Marco Maggi;
	 Sep 25, 2024) */
      if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
    }
  }

  if (0) { fprintf(stderr, "%s: margin=%Lf\n", __func__, (long double)margin); }

  for (int i = 2; i < argc; ++i) {
    if (! mmux_$1_equal_absmargin(ops[1], ops[i], margin)) {
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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_absmargin]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_absmargin OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_equal_relepsilon_main (int argc,  char * argv[])

#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_equal_relepsilon"

m4_dnl This is an m4 macro, rather than a CPP definition, because we need to use the
m4_dnl toupper macro; m4 interprets "#" characters as comments, so the following:
m4_dnl
m4_dnl    #define NAME        mmux_toupper($1)
m4_dnl
m4_dnl will leave the macro use not expanded.
m4_define([[[MMUX_EPSILON_VARNAME]]],[[["RELATIVE_EPSILON_[[[]]]mmux_toupper($1)"]]])

{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  mmux_libc_$1_t	epsilon = MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON;
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  {
    SHELL_VAR *		epsilon_shell_variable = find_variable(MMUX_EPSILON_VARNAME);

    if (0) {
      if (epsilon_shell_variable) {
	fprintf(stderr, "%s: found epsilon shell variable: %s\n", __func__, MMUX_EPSILON_VARNAME);
      } else {
	fprintf(stderr, "%s: NOT found epsilon shell variable: %s\n", __func__, MMUX_EPSILON_VARNAME);
      }
    }

    /* FIXME Should  also check that  the variable is not  an array?  Or  a function?
       (Marco Maggi; Sep 25, 2024) */
    if (epsilon_shell_variable && var_isset(epsilon_shell_variable)) {
      char const * const	epsilon_asciiz = get_variable_value(epsilon_shell_variable);

      rv = mmux_bash_pointers_parse_$1(&epsilon, epsilon_asciiz, MMUX_BUILTIN_NAME);
      /* FIXME Should warn  that the error is in the  epsilon variable. (Marco Maggi;
	 Sep 25, 2024) */
      if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
    }
  }

  if (0) { fprintf(stderr, "%s: epsilon=%Lf\n", __func__, (long double)epsilon); }

  for (int i = 2; i < argc; ++i) {
    if (! mmux_$1_equal_relepsilon(ops[1], ops[i], epsilon)) {
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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_relepsilon]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_relepsilon OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[float]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[double]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_REAL_BUILTINS([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Approximate comparison builtins for complex floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS]]],[[[
static int
mmux_$1_equal_absmargin_main (int argc,  char * argv[])

#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_equal_absmargin"

m4_dnl This is an m4 macro, rather than a CPP definition, because we need to use the
m4_dnl toupper macro; m4 interprets "#" characters as comments, so the following:
m4_dnl
m4_dnl    #define NAME        mmux_toupper($1)
m4_dnl
m4_dnl will leave the macro use not expanded.
m4_define([[[MMUX_MARGIN_VARNAME]]],[[["ABSOLUTE_MARGIN_[[[]]]mmux_toupper($1)"]]])

{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  mmux_libc_$1_t	margin = mmux_bash_pointers_rectangular_$1(MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN,
								      MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN);
  SHELL_VAR *		margin_shell_variable;
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  margin_shell_variable = find_variable(MMUX_MARGIN_VARNAME);
  if (margin_shell_variable && var_isset(margin_shell_variable)) {
    rv = mmux_bash_pointers_parse_$1(&margin, value_cell(margin_shell_variable), MMUX_BUILTIN_NAME);
    /* FIXME Should warn  that the error is in the  margin variable. (Marco Maggi;
       Sep 25, 2024) */
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    if (! mmux_$1_equal_absmargin(ops[1], ops[i], margin)) {
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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_absmargin]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_absmargin OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_equal_relepsilon_main (int argc,  char * argv[])

#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_equal_relepsilon"

m4_dnl This is an m4 macro, rather than a CPP definition, because we need to use the
m4_dnl toupper macro; m4 interprets "#" characters as comments, so the following:
m4_dnl
m4_dnl    #define NAME        mmux_toupper($1)
m4_dnl
m4_dnl will leave the macro use not expanded.
m4_define([[[MMUX_EPSILON_VARNAME]]],[[["RELATIVE_EPSILON_[[[]]]mmux_toupper($1)"]]])

{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[m4_dnl
  mmux_libc_$1_t	ops[argc]; /* we allocate one more of these, not a problem */
  mmux_libc_$1_t	epsilon = mmux_bash_pointers_rectangular_$1(MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON,
								      MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON);
  SHELL_VAR *		epsilon_shell_variable;
  int			rv;

  for (int i = 1; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  epsilon_shell_variable = find_variable(MMUX_EPSILON_VARNAME);
  if (epsilon_shell_variable && var_isset(epsilon_shell_variable)) {
    rv = mmux_bash_pointers_parse_$1(&epsilon, value_cell(epsilon_shell_variable), MMUX_BUILTIN_NAME);
    /* FIXME Should warn  that the error is in the  epsilon variable. (Marco Maggi;
       Sep 25, 2024) */
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    if (! mmux_$1_equal_relepsilon(ops[1], ops[i], epsilon)) {
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
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_equal_relepsilon]]],
    [[[(2 <= argc)]]],
    [[["mmux_$1_equal_relepsilon OP0 OP ..."]]],
    [[["Compute the comparison between the operands OP."]]])

/* ------------------------------------------------------------------ */

]]])

MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexf]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexd]]])
MMUX_BASH_DEFINE_APPROXIMATE_COMPARISON_COMPLEX_BUILTINS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

/* end of file */
