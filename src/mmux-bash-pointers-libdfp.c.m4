/*
  Part of: MMUX Bash Pointers
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

#include <mmux-bash-pointers-config.h>

#if ((defined MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY) && (1 == MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY))

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
__attribute__((__const__)) int
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

m4_define([[[DEFINE_REAL_DECIMAL_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool mmux_$1_equal         (mmux_$1_t op1, mmux_$1_t op2) { return (op1 == op2)? true : false; }
bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
bool mmux_$1_lesser        (mmux_$1_t op1, mmux_$1_t op2) { return (        isless(op1,op2))? true : false; }
bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
bool mmux_$1_lesser_equal  (mmux_$1_t op1, mmux_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
]]])]]])

DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_DECIMAL_COMPARISONS([[[decimal128]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

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
mmux_$1_t mmux_$1_abs (mmux_$1_t X)                   { return $2(X); }
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


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* ((defined MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY) && (1 == MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY)) */

/* end of file */
