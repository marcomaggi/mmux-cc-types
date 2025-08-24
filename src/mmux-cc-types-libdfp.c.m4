/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This module implements some support for _DecimalN types through libdfp.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

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

/* NOTE We  do not include  "mmux-cc-types-internals.h" because "libdfp"  messes with
   the  standard headers.   So  we  duplicate, in  this  file,  definitions from  the
   internals file; it is ugly, but better for me.  (Marco Maggi; Aug 16, 2025) */
#include <mmux-cc-types-config.h>

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_STDBOOL_H
#  include <stdbool.h>
#endif

/* When using libdfp: this will load <dfp/stdlib.h> */
#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif

#ifdef HAVE_STDIO_H
#  include <stdio.h>
#endif

#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif

/* When using libdfp: this will load <dfp/math.h> */
#ifdef HAVE_MATH_H
#  include <math.h>
#endif

/* When using libdfp: this will load <dfp/float.h> */
#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif

#include <mmux-cc-types-libdfp.h>


/** --------------------------------------------------------------------
 ** Standard types adapters: mathematical functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS]]],[[[
mmux_standard_flonum$1_t
mmux_standard_flonum$1_exp10 (mmux_standard_flonum$1_t op)
{
  return exp$1(op * log$1(mmux_standard_flonum$1_constant_ten()));
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(d32)
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(d64)
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(d128)


/** --------------------------------------------------------------------
 ** Standard types adapters: sprinter and parser.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS]]],[[[
mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return strfrom$1(result_p, size, format, value);
}
mmux_standard_flonum$1_t
mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value, mmux_asciizpp_t restrict tailptr)
{
  return strto$1(s_input_value, tailptr);
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d32)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d64)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d128)


/** --------------------------------------------------------------------
 ** Some real and complex number type functions: abs, arg.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_CPLX_BASIC_FUNCTIONS]]],[[[
__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_abs (mmux_flonumd$1_t X)
{
  return mmux_flonumd$1(fabsd$1(X.value));
}
mmux_flonumcd$1_part_t
mmux_flonumcd$1_abs (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(sqrtd$1(Z.value.re * Z.value.re + Z.value.im * Z.value.im));
}
mmux_flonumcd$1_part_t
mmux_flonumcd$1_arg (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(atan2d$1(Z.value.im, Z.value.re));
}
/* mmux_flonumcd$1_conj implemented as inline function */
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(32)
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(64)
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Real decimal floating-point number predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_PREDICATES]]],[[[
#define MMUX_STANDARD_FLONUMD$1_IS_ZERO(X)	(FP_ZERO	== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_NAN(X)	(FP_NAN		== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X)	(FP_INFINITE	== (fpclassify(X)))

__attribute__((__const__)) bool
mmux_flonumd$1_is_zero (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_nan (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_infinite (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_PREDICATES(32)
DEFINE_REAL_PREDICATES(64)
DEFINE_REAL_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Complex decimal floating-point numbers predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_PREDICATES]]],[[[
__attribute__((__const__)) bool
mmux_flonumcd$1_is_zero (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.re) && MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_nan (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_infinite (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.im))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_PREDICATES(32)
DEFINE_CPLX_PREDICATES(64)
DEFINE_CPLX_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISONS]]],[[[
__attribute__((__const__)) mmux_sint_t
mmux_flonumd$1_cmp (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  if (mmux_flonumd$1_greater(op1, op2)) {
    return mmux_sint(+1);
  } else if (mmux_flonumd$1_less(op1, op2)) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (op1.value == op2.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreater(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isless(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreaterequal(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (islessequal(op1.value,op2.value))? true : false;
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_max (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmaxd$1(X.value, Y.value));
}
__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_min (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmind$1(X.value, Y.value));
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) bool
mmux_flonumcd$1_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return ((op1.value.re == op2.value.re) && (op1.value.im == op2.value.im))? true : false;
}
__attribute__((__const__)) mmux_sint_t
mmux_flonumcd$1_cmp (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_cmp(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater_equal(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less_equal(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
]]])
m4_divert(0)m4_dnl
DEFINE_COMPARISONS(32)
DEFINE_COMPARISONS(64)
DEFINE_COMPARISONS(128)


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_APPROX_COMPARISONS]]],[[[
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_absmargin (mmux_standard_flonumd$1_t op1,
					 mmux_standard_flonumd$1_t op2,
					 mmux_standard_flonumd$1_t margin)
{
  return (fabsd$1(op1 - op2) <= fabsd$1(margin))? true : false;
}
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_relepsilon (mmux_standard_flonumd$1_t op1,
					  mmux_standard_flonumd$1_t op2,
					  mmux_standard_flonumd$1_t epsilon)
{
  return (fabsd$1(op1 - op2) <= (fabsd$1(epsilon) * fmaxd$1(fabsd$1(op1), fabsd$1(op2))))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_APPROX_COMPARISONS(32)
DEFINE_STANDARD_APPROX_COMPARISONS(64)
DEFINE_STANDARD_APPROX_COMPARISONS(128)


/** --------------------------------------------------------------------
 ** Some arithmetics functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS]]],[[[
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_mod (mmux_flonum$1_t A, mmux_flonum$1_t B)
{
  return mmux_flonum$1(fmod$1(A.value, B.value));
}
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_incr (mmux_flonum$1_t A)
{
  return mmux_flonum$1(A.value + mmux_standard_flonum$1_constant_one());
}
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_decr (mmux_flonum$1_t A)
{
  return mmux_flonum$1(A.value - mmux_standard_flonum$1_constant_one());
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d32]]])
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d64]]])
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d128]]])


/** --------------------------------------------------------------------
 ** Mathematical constants: real numbers.
 ** ----------------------------------------------------------------- */

/* NOTE By inspecting the header files installed by libdfp: I have seen that only the
   "dl" constants are defined.  (Marco Maggi; Aug 16, 2025) */
m4_divert(-1)
m4_define([[[DEFINE_REAL_MATH_CONSTANT_FUNCTIONS]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_$2 (void)
{
  return (mmux_standard_flonumd$1_t)M_$2dl;
}
mmux_flonumd$1_t
mmux_flonumd$1_constant_$2 (void)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_constant_$2());
}]]])

m4_define([[[DEFINE_REAL_MATH_CONSTANTS]]],[[[
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LOG2E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LOG10E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LN2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LN10)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI_2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI_4)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		1_PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		2_PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		2_SQRTPI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		SQRT2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		SQRT1_2)

/* Should we do something with "DECd$1_MIN" defined by GCC? */
mmux_standard_flonumd$1_t mmux_standard_flonumd$1_maximum (void) { return    DEC$1_MAX; }
mmux_standard_flonumd$1_t mmux_standard_flonumd$1_minimum (void) { return (- DEC$1_MAX); }
mmux_flonumd$1_t mmux_flonumd$1_maximum (void) { return mmux_flonumd$1(mmux_standard_flonumd$1_maximum()); }
mmux_flonumd$1_t mmux_flonumd$1_minimum (void) { return mmux_flonumd$1(mmux_standard_flonumd$1_minimum()); }
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_MATH_CONSTANTS(32)
DEFINE_REAL_MATH_CONSTANTS(64)
DEFINE_REAL_MATH_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematics builtins.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_UNARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (mmux_$1_t op) { return mmux_$1($3(op.value)); }
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2) { return mmux_$1($3(op1.value, op2.value)); }
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (int N, mmux_$1_t op) { return mmux_$1($3(N, op.value)); }
]]])]]])]]])

m4_divert(0)m4_dnl

m4_dnl ----------------------------------------------------------------------

m4_dnl  $1 - type stem
m4_dnl  $2 - type parser macro
m4_dnl  $3 - C preprocessor for optional definition

m4_dnl  $4 - identifier of C function implementing sin
m4_dnl  $5 - identifier of C function implementing cos
m4_dnl  $6 - identifier of C function implementing tan
m4_dnl  $7 - identifier of C function implementing asin
m4_dnl  $8 - identifier of C function implementing acos
m4_dnl  $9 - identifier of C function implementing atan
m4_dnl $10 - identifier of C function implementing atan2

m4_dnl $11 - identifier of C function implementing sinh
m4_dnl $12 - identifier of C function implementing cosh
m4_dnl $13 - identifier of C function implementing tanh
m4_dnl $14 - identifier of C function implementing asinh
m4_dnl $15 - identifier of C function implementing acosh
m4_dnl $16 - identifier of C function implementing atanh

m4_dnl $17 - identifier of C function implementing exp
m4_dnl $18 - identifier of C function implementing exp2
m4_dnl $19 - identifier of C function implementing exp10
m4_dnl $20 - identifier of C function implementing log
m4_dnl $21 - identifier of C function implementing log10
m4_dnl $22 - identifier of C function implementing log2
m4_dnl $23 - identifier of C function implementing logb
m4_dnl $24 - identifier of C function implementing pow
m4_dnl $25 - identifier of C function implementing sqrt
m4_dnl $26 - identifier of C function implementing cbrt
m4_dnl $27 - identifier of C function implementing hypot
m4_dnl $28 - identifier of C function implementing expm1
m4_dnl $29 - identifier of C function implementing log1p

m4_dnl $30 - identifier of C function implementing erf
m4_dnl $31 - identifier of C function implementing erfc
m4_dnl $32 - identifier of C function implementing lgamma
m4_dnl $33 - identifier of C function implementing tgamma
m4_dnl $34 - identifier of C function implementing j0
m4_dnl $35 - identifier of C function implementing j1
m4_dnl $36 - identifier of C function implementing jn
m4_dnl $37 - identifier of C function implementing y0
m4_dnl $38 - identifier of C function implementing y1
m4_dnl $39 - identifier of C function implementing yn

m4_define([[[DEFINE_CFUNCS]]],[[[m4_ifelse($#,39,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 39 got: $#
)]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[sin]]],	[[[$4]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cos]]],	[[[$5]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tan]]],	[[[$6]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[asin]]],	[[[$7]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[acos]]],	[[[$8]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[atan]]],	[[[$9]]],  [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[atan2]]],	[[[$10]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[sinh]]],	[[[$11]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cosh]]],	[[[$12]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tanh]]],	[[[$13]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[asinh]]],	[[[$14]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[acosh]]],	[[[$15]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[atanh]]],	[[[$16]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp]]],	[[[$17]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp2]]],	[[[$18]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp10]]],	[[[$19]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log]]],	[[[$20]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log10]]],	[[[$21]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log2]]],	[[[$22]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[logb]]],	[[[$23]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[pow]]],	[[[$24]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[sqrt]]],	[[[$25]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cbrt]]],	[[[$26]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[hypot]]],	[[[$27]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[expm1]]],	[[[$28]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log1p]]],	[[[$29]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[erf]]],	[[[$30]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[erfc]]],	[[[$31]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[lgamma]]],	[[[$32]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tgamma]]],	[[[$33]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j0]]],		[[[$34]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j1]]],		[[[$35]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[jn]]],		[[[$36]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y0]]],		[[[$37]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y1]]],		[[[$38]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[yn]]],		[[[$39]]], [[[$2]]], [[[$3]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[flonumd32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]],
	      [[[sind32]]],		[[[cosd32]]],		[[[tand32]]],
	      [[[asind32]]],		[[[acosd32]]],		[[[atand32]]],		[[[atan2d32]]],
	      [[[sinhd32]]],		[[[coshd32]]],		[[[tanhd32]]],
	      [[[asinhd32]]],		[[[acoshd32]]],		[[[atanhd32]]],
	      [[[expd32]]],		[[[exp2d32]]],		[[[mmux_standard_flonumd32_exp10]]],
	      [[[logd32]]],		[[[log10d32]]],		[[[log2d32]]],		[[[logbd32]]],
	      [[[powd32]]],		[[[sqrtd32]]],		[[[cbrtd32]]],		[[[hypotd32]]],
	      [[[expm1d32]]],		[[[log1pd32]]],
	      [[[erfd32]]],		[[[erfcd32]]],
	      [[[lgammad32]]],		[[[tgammad32]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d32]]],		[[[j1d32]]],		[[[jnd32]]],
	      [[[y0d32]]],		[[[y1d32]]],		[[[ynd32]]])
#endif

DEFINE_CFUNCS([[[flonumd64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]],
	      [[[sind64]]],		[[[cosd64]]],		[[[tand64]]],
	      [[[asind64]]],		[[[acosd64]]],		[[[atand64]]],		[[[atan2d64]]],
	      [[[sinhd64]]],		[[[coshd64]]],		[[[tanhd64]]],
	      [[[asinhd64]]],		[[[acoshd64]]],		[[[atanhd64]]],
	      [[[expd64]]],		[[[exp2d64]]],		[[[mmux_standard_flonumd64_exp10]]],
	      [[[logd64]]],		[[[log10d64]]],		[[[log2d64]]],		[[[logbd64]]],
	      [[[powd64]]],		[[[sqrtd64]]],		[[[cbrtd64]]],		[[[hypotd64]]],
	      [[[expm1d64]]],		[[[log1pd64]]],
	      [[[erfd64]]],		[[[erfcd64]]],
	      [[[lgammad64]]],		[[[tgammad64]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d64]]],		[[[j1d64]]],		[[[jnd64]]],
	      [[[y0d64]]],		[[[y1d64]]],		[[[ynd64]]])
#endif

DEFINE_CFUNCS([[[flonumd128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]],
	      [[[sind128]]],		[[[cosd128]]],		[[[tand128]]],
	      [[[asind128]]],		[[[acosd128]]],		[[[atand128]]],		[[[atan2d128]]],
	      [[[sinhd128]]],		[[[coshd128]]],		[[[tanhd128]]],
	      [[[asinhd128]]],		[[[acoshd128]]],	[[[atanhd128]]],
	      [[[expd128]]],		[[[exp2d128]]],		[[[mmux_standard_flonumd128_exp10]]],
	      [[[logd128]]],		[[[log10d128]]],	[[[log2d128]]],		[[[logbd128]]],
	      [[[powd128]]],		[[[sqrtd128]]],		[[[cbrtd128]]],		[[[hypotd128]]],
	      [[[expm1d128]]],		[[[log1pd128]]],
	      [[[erfd128]]],		[[[erfcd128]]],
	      [[[lgammad128]]],		[[[tgammad128]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d128]]],		[[[j1d128]]],		[[[jnd128]]],
	      [[[y0d128]]],		[[[y1d128]]],		[[[ynd128]]])
#endif

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[flonumcd32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD32]]], [[[MMUX_CC_TYPES_HAS_FLONUMCD32_UNIMPLEMENTED]]],
	      [[[csind32]]],	[[[ccosd32]]],		[[[ctand32]]],
	      [[[casind32]]],	[[[cacosd32]]],		[[[catand32]]],		[[[]]],
	      [[[csinhd32]]],	[[[ccoshd32]]],		[[[ctanhd32]]],
	      [[[casinhd32]]],	[[[cacoshd32]]],	[[[catanhd32]]],
	      [[[cexpd32]]],	[[[]]],			[[[]]],
	      [[[clogd32]]],	[[[clog10d32]]],	[[[]]],			[[[]]],
	      [[[cpowd32]]],	[[[csqrtd32]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[flonumcd64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD64]]], [[[MMUX_CC_TYPES_HAS_FLONUMCD64_UNIMPLEMENTED]]],
	      [[[csind64]]],	[[[ccosd64]]],		[[[ctand64]]],
	      [[[casind64]]],	[[[cacosd64]]],		[[[catand64]]],		[[[]]],
	      [[[csinhd64]]],	[[[ccoshd64]]],		[[[ctanhd64]]],
	      [[[casinhd64]]],	[[[cacoshd64]]],	[[[catanhd64]]],
	      [[[cexpd64]]],	[[[]]],			[[[]]],
	      [[[clogd64]]],	[[[clog10d64]]],	[[[]]],			[[[]]],
	      [[[cpowd64]]],	[[[csqrtd64]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[flonumcd128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD128]]],[[[MMUX_CC_TYPES_HAS_FLONUMCD128_UNIMPLEMENTED]]],
	      [[[csind128]]],	[[[ccosd128]]],		[[[ctand128]]],
	      [[[casind128]]],	[[[cacosd128]]],	[[[catand128]]],	[[[]]],
	      [[[csinhd128]]],	[[[ccoshd128]]],	[[[ctanhd128]]],
	      [[[casinhd128]]],	[[[cacoshd128]]],	[[[catanhd128]]],
	      [[[cexpd128]]],	[[[]]],			[[[]]],
	      [[[clogd128]]],	[[[clog10d128]]],	[[[]]],			[[[]]],
	      [[[cpowd128]]],	[[[csqrtd128]]],	[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])

/* end of file */
