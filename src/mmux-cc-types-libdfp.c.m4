/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This module implements some support for _DecimalN types through libdfp.

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

#include <mmux-cc-types-config.h>

#ifdef HAVE_CONFIG_H
#  include <config.h>
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


/** --------------------------------------------------------------------
 ** Type definitions.
 ** ----------------------------------------------------------------- */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],  [[[__extension__ typedef _Decimal32  mmux_decimal32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],  [[[__extension__ typedef _Decimal64  mmux_decimal64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL128]]], [[[__extension__ typedef _Decimal128 mmux_decimal128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]],  [[[
struct mmux_complexd32_tag_t {
  mmux_decimal32_t		re;
  mmux_decimal32_t		im;
};
typedef struct mmux_complexd32_tag_t mmux_complexd32_t;
typedef mmux_decimal32_t	mmux_complexd32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]],  [[[
struct mmux_complexd64_tag_t {
  mmux_decimal64_t		re;
  mmux_decimal64_t		im;
};
typedef struct mmux_complexd64_tag_t mmux_complexd64_t;
typedef mmux_decimal64_t	mmux_complexd64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]], [[[
struct mmux_complexd128_tag_t {
  mmux_decimal128_t	re;
  mmux_decimal128_t	im;
};
typedef struct mmux_complexd128_tag_t mmux_complexd128_t;
typedef mmux_decimal128_t	mmux_complexd128_part_t;
]]])


/** --------------------------------------------------------------------
 ** Some complex number type functions: string_is, sizeof, make_rectangular, real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - atan2 function
m4_dnl $3 - conditional code C preprocessor symbol
m4_define([[[DEFINE_COMPLEX_BASIC_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
int
mmux_$1_sizeof (void)
{
  return sizeof(mmux_$1_t);
}
__attribute__((__const__)) mmux_$1_t
mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im)
{
  mmux_$1_t	Z = {
    .re	= re,
    .im	= im
  };
  return Z;
}
__attribute__((__const__)) mmux_$1_part_t
mmux_$1_real_part (mmux_$1_t Z)
{
  return Z.re;
}
__attribute__((__const__)) mmux_$1_part_t
mmux_$1_imag_part (mmux_$1_t Z)
{
  return Z.im;
}
__attribute__((__const__)) mmux_$1_part_t
mmux_$1_abs (mmux_$1_t Z)
{
  return sqrt(Z.re * Z.re + Z.im * Z.im);
}
__attribute__((__const__)) mmux_$1_part_t
mmux_$1_arg (mmux_$1_t Z)
{
  return $2(Z.im, Z.re);
}
__attribute__((__const__)) mmux_$1_t
mmux_$1_conj (mmux_$1_t Z)
{
  return mmux_$1_make_rectangular(Z.re, - Z.im);
}
]]])]]])

DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexd32]]],  [[[atan2d32]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexd64]]],  [[[atan2d64]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexd128]]], [[[atan2d128]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Real decimal floating-point number predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_REAL_DECIMAL_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (FP_ZERO == (fpclassify(X)))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_is_nan (mmux_$1_t X)
{
  return (FP_NAN == (fpclassify(X)))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_is_infinite (mmux_$1_t X)
{
  return (FP_INFINITE == (fpclassify(X)))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_is_positive (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (((mmux_$1_t)0) < X)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_$1_is_negative (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (((mmux_$1_t)0) > X)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_$1_is_non_positive (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (((mmux_$1_t)0) > X)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_$1_is_non_negative (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (((mmux_$1_t)0) < X)? true : false;
  }
}
]]])]]])

DEFINE_REAL_DECIMAL_PREDICATES([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_DECIMAL_PREDICATES([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_DECIMAL_PREDICATES([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Complex decimal floating-point numbers Predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_DECIMAL_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
__attribute__((__const__)) bool
mmux_$1_is_zero (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_is_nan (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_is_infinite (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_infinite(re) || mmux_$2_is_infinite(im))? true : false;
}
]]])]]])

DEFINE_COMPLEX_DECIMAL_PREDICATES([[[complexd32]]],	[[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_DECIMAL_PREDICATES([[[complexd64]]],	[[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_DECIMAL_PREDICATES([[[complexd128]]],	[[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

#undef  DECL
#define DECL		__attribute__((__const__))

m4_define([[[DEFINE_REAL_DECIMAL_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DECL bool mmux_$1_equal         (mmux_$1_t op1, mmux_$1_t op2) { return (op1 == op2)?              true : false; }
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (        isless(op1,op2))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
DECL int
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (mmux_$1_greater(op1, op2)) {
    return +1;
  } else if (mmux_$1_less(op1, op2)) {
    return -1;
  } else {
    return 0;
  }
}
]]])]]])

DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPLEX_DECIMAL_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool mmux_$1_equal (mmux_$1_t op1, mmux_$1_t op2)
{
  return ((op1.re == op2.re) && (op1.im == op2.im))? true : false;
}
]]])]]])

DEFINE_COMPLEX_DECIMAL_COMPARISONS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_DECIMAL_COMPARISONS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_DECIMAL_COMPARISONS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
mmux_$1_t mmux_$1_abs (mmux_$1_t X)              { return $2(X); }
mmux_$1_t mmux_$1_max (mmux_$1_t X, mmux_$1_t Y) { return $3(X, Y); }
mmux_$1_t mmux_$1_min (mmux_$1_t X, mmux_$1_t Y) { return $4(X, Y); }
]]])]]])

DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal32]]],	[[[fabsd32]]],[[[fmaxd32]]],[[[fmind32]]], [[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal64]]],	[[[fabsd64]]],[[[fmaxd64]]],[[[fmind64]]], [[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal128]]],	[[[fabsd128]]],[[[fmaxd128]]],[[[fmind128]]], [[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - real type stem
m4_dnl $2 - complex type stem
m4_dnl $3 - conditional code C preprocessor symbol
m4_define([[[DEFINE_DECIMAL_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
__attribute__((__const__)) bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  if (0) { fprintf(stderr, "%s: op1=%Lf op2=%Lf margin=%Lf\n", __func__, (long double)op1, (long double)op2, (long double)margin); }
  return (mmux_$1_abs(op1 - op2) <= mmux_$1_abs(margin))? true : false;
}
__attribute__((__const__)) bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  return (mmux_$1_abs(op1 - op2) <= (epsilon * mmux_$1_max(mmux_$1_abs(op1), mmux_$1_abs(op2))))? true : false;
}
bool
mmux_$2_equal_absmargin (mmux_$2_t op1, mmux_$2_t op2, mmux_$2_t margin)
{
  mmux_$2_part_t	re1 = mmux_$2_real_part(op1);
  mmux_$2_part_t	im1 = mmux_$2_imag_part(op1);
  mmux_$2_part_t	re2 = mmux_$2_real_part(op2);
  mmux_$2_part_t	im2 = mmux_$2_imag_part(op2);
  mmux_$2_part_t	ret = mmux_$2_real_part(margin);
  mmux_$2_part_t	imt = mmux_$2_imag_part(margin);

  if (0) { fprintf(stderr, "%s: re1=%Lf re1=%Lf ret=%Lf\n", __func__, (long double)re1, (long double)re2, (long double)ret); }
  if (0) { fprintf(stderr, "%s: im1=%Lf im2=%Lf imt=%Lf\n", __func__, (long double)im1, (long double)im2, (long double)imt); }
  return (mmux_$1_equal_absmargin(re1, re2, ret) && mmux_$1_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_$2_equal_relepsilon (mmux_$2_t op1, mmux_$2_t op2, mmux_$2_t epsilon)
{
  mmux_$2_part_t	re1 = mmux_$2_real_part(op1);
  mmux_$2_part_t	im1 = mmux_$2_imag_part(op1);
  mmux_$2_part_t	re2 = mmux_$2_real_part(op2);
  mmux_$2_part_t	im2 = mmux_$2_imag_part(op2);
  mmux_$2_part_t	ret = mmux_$2_real_part(epsilon);
  mmux_$2_part_t	imt = mmux_$2_imag_part(epsilon);

  return (mmux_$1_equal_relepsilon(re1, re2, ret) && mmux_$1_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])]]])

DEFINE_DECIMAL_APPROX_COMPARISONS([[[decimal32]]],	[[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_DECIMAL_APPROX_COMPARISONS([[[decimal64]]],	[[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_DECIMAL_APPROX_COMPARISONS([[[decimal128]]],	[[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Parsers and sprinters.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - real type stem
m4_dnl $2 - strfrom function
m4_dnl $3 - strto function
m4_dnl $4 - conditional code C preprocessor symbol
m4_define([[[DEFINE_REAL_DECIMAL_STRFROM_STRTO]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
int
mmux_$2 (char * s_output_value, size_t size, char const * restrict format, mmux_$1_t input_value)
{
  return $2(s_output_value, size, format, input_value);
}
mmux_$1_t
mmux_$3 (char const * restrict s_input_value, char ** restrict tailptr)
{
  return $3(s_input_value, tailptr);
}
]]])]]])

DEFINE_REAL_DECIMAL_STRFROM_STRTO([[[decimal32]]],	[[[strfromd32]]],  [[[strtod32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_DECIMAL_STRFROM_STRTO([[[decimal64]]],	[[[strfromd64]]],  [[[strtod64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_DECIMAL_STRFROM_STRTO([[[decimal128]]],	[[[strfromd128]]], [[[strtod128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


m4_divert(-1)m4_dnl
m4_dnl --------------------------------------------------------------------
m4_dnl Orgy of math macros.
m4_dnl ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_UNARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (mmux_$1_t op) { return $3(op); }
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2) { return $3(op1, op2); }
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_$1_t mmux_$1_$2 (mmux_sint_t N, mmux_$1_t op) { return $3(N, op); }
]]])]]])]]])

m4_divert(0)m4_dnl

/** --------------------------------------------------------------------
 ** Mathematics builtins.
 ** ----------------------------------------------------------------- */

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

DEFINE_CFUNCS([[[decimal32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_DECIMAL32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32_UNIMPLEMENTED]]],
	      [[[sind32]]],		[[[cosd32]]],		[[[tand32]]],
	      [[[asind32]]],		[[[acosd32]]],		[[[atand32]]],		[[[atan2d32]]],
	      [[[sinhd32]]],		[[[coshd32]]],		[[[tanhd32]]],
	      [[[asinhd32]]],		[[[acoshd32]]],		[[[atanhd32]]],
	      [[[expd32]]],		[[[exp2d32]]],		[[[exp10d32]]],
	      [[[logd32]]],		[[[log10d32]]],		[[[log2d32]]],		[[[logbd32]]],
	      [[[powd32]]],		[[[sqrtd32]]],		[[[cbrtd32]]],		[[[hypotd32]]],
	      [[[expm1d32]]],		[[[log1pd32]]],
	      [[[erfd32]]],		[[[erfcd32x]]],
	      [[[lgammad32]]],		[[[tgammad32]]],
	      [[[j0d32]]],		[[[j1d32]]],		[[[jnd32]]],
	      [[[y0d32]]],		[[[y1d32]]],		[[[ynd32]]])

DEFINE_CFUNCS([[[decimal64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_DECIMAL64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64_UNIMPLEMENTED]]],
	      [[[sind64]]],		[[[cosd64]]],		[[[tand64]]],
	      [[[asind64]]],		[[[acosd64]]],		[[[atand64]]],		[[[atan2d64]]],
	      [[[sinhd64]]],		[[[coshd64]]],		[[[tanhd64]]],
	      [[[asinhd64]]],		[[[acoshd64]]],		[[[atanhd64]]],
	      [[[expd64]]],		[[[exp2d64]]],		[[[exp10d64]]],
	      [[[logd64]]],		[[[log10d64]]],		[[[log2d64]]],		[[[logbd64]]],
	      [[[powd64]]],		[[[sqrtd64]]],		[[[cbrtd64]]],		[[[hypotd64]]],
	      [[[expm1d64]]],		[[[log1pd64]]],
	      [[[erfd64]]],		[[[erfcd64x]]],
	      [[[lgammad64]]],		[[[tgammad64]]],
	      [[[j0d64]]],		[[[j1d64]]],		[[[jnd64]]],
	      [[[y0d64]]],		[[[y1d64]]],		[[[ynd64]]])

DEFINE_CFUNCS([[[decimal128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_DECIMAL128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128_UNIMPLEMENTED]]],
	      [[[sind128]]],		[[[cosd128]]],		[[[tand128]]],
	      [[[asind128]]],		[[[acosd128]]],		[[[atand128]]],		[[[atan2d128]]],
	      [[[sinhd128]]],		[[[coshd128]]],		[[[tanhd128]]],
	      [[[asinhd128]]],		[[[acoshd128]]],	[[[atanhd128]]],
	      [[[expd128]]],		[[[exp2d128]]],		[[[exp10d128]]],
	      [[[logd128]]],		[[[log10d128]]],	[[[log2d128]]],		[[[logbd128]]],
	      [[[powd128]]],		[[[sqrtd128]]],		[[[cbrtd128]]],		[[[hypotd128]]],
	      [[[expm1d128]]],		[[[log1pd128]]],
	      [[[erfd128]]],		[[[erfcd128x]]],
	      [[[lgammad128]]],		[[[tgammad128]]],
	      [[[j0d128]]],		[[[j1d128]]],		[[[jnd128]]],
	      [[[y0d128]]],		[[[y1d128]]],		[[[ynd128]]])

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[complexd32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXD32]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD32_UNIMPLEMENTED]]],
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

DEFINE_CFUNCS([[[complexd64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXD64]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD64_UNIMPLEMENTED]]],
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

DEFINE_CFUNCS([[[complexd128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXD128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXD128_UNIMPLEMENTED]]],
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
