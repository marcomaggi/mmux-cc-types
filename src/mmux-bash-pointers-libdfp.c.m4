/*
  Part of: MMUX Bash Pointers
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This module implements some support for _DecimalN types through libdfp.

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

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL32]]],  [[[__extension__ typedef _Decimal32  mmux_libc_decimal32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL64]]],  [[[__extension__ typedef _Decimal64  mmux_libc_decimal64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL128]]], [[[__extension__ typedef _Decimal128 mmux_libc_decimal128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD32]]],  [[[
struct mmux_libc_complexd32_tag_t {
  mmux_libc_decimal32_t		re;
  mmux_libc_decimal32_t		im;
};
typedef struct mmux_libc_complexd32_tag_t mmux_libc_complexd32_t;
typedef mmux_libc_decimal32_t	mmux_libc_complexd32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD64]]],  [[[
struct mmux_libc_complexd64_tag_t {
  mmux_libc_decimal64_t		re;
  mmux_libc_decimal64_t		im;
};
typedef struct mmux_libc_complexd64_tag_t mmux_libc_complexd64_t;
typedef mmux_libc_decimal64_t	mmux_libc_complexd64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD128]]], [[[
struct mmux_libc_complexd128_tag_t {
  mmux_libc_decimal128_t	re;
  mmux_libc_decimal128_t	im;
};
typedef struct mmux_libc_complexd128_tag_t mmux_libc_complexd128_t;
typedef mmux_libc_decimal128_t	mmux_libc_complexd128_part_t;
]]])


/** --------------------------------------------------------------------
 ** Real decimal floating-point numbers Predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_DECIMAL_FLOAT_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (FP_ZERO == (fpclassify(X)))? true : false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t X)
{
  return (FP_NAN == (fpclassify(X)))? true : false;
}
bool
mmux_$1_is_infinite (mmux_libc_$1_t X)
{
  return (FP_INFINITE == (fpclassify(X)))? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t X)
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
    return (((mmux_libc_$1_t)0) < X)? true : false;
  }
}
bool
mmux_$1_is_negative (mmux_libc_$1_t X)
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
    return (((mmux_libc_$1_t)0) > X)? true : false;
  }
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (((mmux_libc_$1_t)0) > X)? true : false;
  }
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (((mmux_libc_$1_t)0) < X)? true : false;
  }
}
]]])]]])

DEFINE_DECIMAL_FLOAT_PREDICATES([[[decimal32]]],		[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_DECIMAL_FLOAT_PREDICATES([[[decimal64]]],		[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_DECIMAL_FLOAT_PREDICATES([[[decimal128]]],		[[[MMUX_HAVE_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Complex decimal basic functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_DECIMAL_BASIC_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_libc_$1_t
mmux_$1_make_rectangular (mmux_libc_$1_part_t re, mmux_libc_$1_part_t im)
{
  mmux_libc_$1_t	Z = {
    .re	= re,
    .im	= im
  };
  return Z;
}
mmux_libc_$1_part_t
mmux_$1_real_part (mmux_libc_$1_t Z)
{
  return Z.re;
}
mmux_libc_$1_part_t
mmux_$1_imag_part (mmux_libc_$1_t Z)
{
  return Z.im;
}
]]])]]])

DEFINE_COMPLEX_DECIMAL_BASIC_FUNCTIONS([[[complexd32]]],  [[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_DECIMAL_BASIC_FUNCTIONS([[[complexd64]]],  [[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_DECIMAL_BASIC_FUNCTIONS([[[complexd128]]], [[[MMUX_HAVE_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Complex decimal floating-point numbers Predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_DECIMAL_COMPLEX_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
bool
mmux_$1_is_infinite (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_infinite(re) || mmux_$2_is_infinite(im))? true : false;
}
]]])]]])

DEFINE_DECIMAL_COMPLEX_PREDICATES([[[complexd32]]],	[[[decimal32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_DECIMAL_COMPLEX_PREDICATES([[[complexd64]]],	[[[decimal64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_DECIMAL_COMPLEX_PREDICATES([[[complexd128]]],	[[[decimal128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPARISON_DECIMAL_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool mmux_$1_equal         (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (op1 == op2)? true : false; }
bool mmux_$1_greater       (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
bool mmux_$1_lesser        (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (        isless(op1,op2))? true : false; }
bool mmux_$1_greater_equal (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
bool mmux_$1_lesser_equal  (mmux_libc_$1_t op1, mmux_libc_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
]]])]]])

DEFINE_COMPARISON_DECIMAL_FUNCTIONS([[[decimal32]]],		[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_COMPARISON_DECIMAL_FUNCTIONS([[[decimal64]]],		[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_COMPARISON_DECIMAL_FUNCTIONS([[[decimal128]]],		[[[MMUX_HAVE_TYPE_DECIMAL128]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_COMPLEXD_EQUAL_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool mmux_$1_equal         (mmux_libc_$1_t op1, mmux_libc_$1_t op2)
{
  return ((op1.re == op2.re) && (op1.im == op2.im))? true : false;
}
]]])]]])

DEFINE_COMPARISON_COMPLEXD_EQUAL_FUNCTIONS([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_COMPARISON_COMPLEXD_EQUAL_FUNCTIONS([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_COMPARISON_COMPLEXD_EQUAL_FUNCTIONS([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
inline mmux_libc_$1_t mmux_$1_abs (mmux_libc_$1_t X)                   { return $2(X); }
inline mmux_libc_$1_t mmux_$1_max (mmux_libc_$1_t X, mmux_libc_$1_t Y) { return $3(X, Y); }
inline mmux_libc_$1_t mmux_$1_min (mmux_libc_$1_t X, mmux_libc_$1_t Y) { return $4(X, Y); }
]]])]]])

DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal32]]],	[[[fabsd32]]],[[[fmaxd32]]],[[[fmind32]]], [[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal64]]],	[[[fabsd64]]],[[[fmaxd64]]],[[[fmind64]]], [[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal128]]],	[[[fabsd128]]],[[[fmaxd128]]],[[[fmind128]]], [[[MMUX_HAVE_TYPE_DECIMAL128]]])


m4_dnl m4_define([[[DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
m4_dnl inline mmux_libc_$1_t mmux_$1_abs (mmux_libc_$1_t X)
m4_dnl {
m4_dnl   return (mmux_$1_is_positive(X))? X : (- X);
m4_dnl }
m4_dnl inline mmux_libc_$1_t mmux_$1_max (mmux_libc_$1_t X, mmux_libc_$1_t Y) {
m4_dnl   return (mmux_$1_greater(X, Y))? X : Y;
m4_dnl }
m4_dnl inline mmux_libc_$1_t mmux_$1_min (mmux_libc_$1_t X, mmux_libc_$1_t Y) {
m4_dnl   return (mmux_$1_greater(X, Y))? Y : X;
m4_dnl }
m4_dnl ]]])]]])
m4_dnl
m4_dnl DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
m4_dnl DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
m4_dnl DEFINE_TYPE_DECIMAL_FUNCTIONS_COMPARISON_MORE([[[decimal128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPE_FUNCTIONS_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_equal_absmargin (mmux_libc_$1_t op1, mmux_libc_$1_t op2, mmux_libc_$1_t margin)
{
  if (0) { fprintf(stderr, "%s: op1=%Lf op2=%Lf margin=%Lf\n", __func__, (long double)op1, (long double)op2, (long double)margin); }
  return (mmux_$1_abs(op1 - op2) <= mmux_$1_abs(margin))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_libc_$1_t op1, mmux_libc_$1_t op2, mmux_libc_$1_t epsilon)
{
  return (mmux_$1_abs(op1 - op2) <= (epsilon * mmux_$1_max(mmux_$1_abs(op1), mmux_$1_abs(op2))))? true : false;
}
bool
mmux_$2_equal_absmargin (mmux_libc_$2_t op1, mmux_libc_$2_t op2, mmux_libc_$2_t margin)
{
  mmux_libc_$2_part_t	re1 = mmux_$2_real_part(op1);
  mmux_libc_$2_part_t	im1 = mmux_$2_imag_part(op1);
  mmux_libc_$2_part_t	re2 = mmux_$2_real_part(op2);
  mmux_libc_$2_part_t	im2 = mmux_$2_imag_part(op2);
  mmux_libc_$2_part_t	ret = mmux_$2_real_part(margin);
  mmux_libc_$2_part_t	imt = mmux_$2_imag_part(margin);

  if (0) { fprintf(stderr, "%s: re1=%Lf re1=%Lf ret=%Lf\n", __func__, (long double)re1, (long double)re2, (long double)ret); }
  if (0) { fprintf(stderr, "%s: im1=%Lf im2=%Lf imt=%Lf\n", __func__, (long double)im1, (long double)im2, (long double)imt); }
  return (mmux_$1_equal_absmargin(re1, re2, ret) && mmux_$1_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_$2_equal_relepsilon (mmux_libc_$2_t op1, mmux_libc_$2_t op2, mmux_libc_$2_t epsilon)
{
  mmux_libc_$2_part_t	re1 = mmux_$2_real_part(op1);
  mmux_libc_$2_part_t	im1 = mmux_$2_imag_part(op1);
  mmux_libc_$2_part_t	re2 = mmux_$2_real_part(op2);
  mmux_libc_$2_part_t	im2 = mmux_$2_imag_part(op2);
  mmux_libc_$2_part_t	ret = mmux_$2_real_part(epsilon);
  mmux_libc_$2_part_t	imt = mmux_$2_imag_part(epsilon);

  return (mmux_$1_equal_relepsilon(re1, re2, ret) && mmux_$1_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])]]])

DEFINE_TYPE_FUNCTIONS_FLOAT_APPROX_COMPARISONS([[[decimal32]]],	[[[complexd32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_TYPE_FUNCTIONS_FLOAT_APPROX_COMPARISONS([[[decimal64]]],	[[[complexd64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_TYPE_FUNCTIONS_FLOAT_APPROX_COMPARISONS([[[decimal128]]],[[[complexd128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])


/** --------------------------------------------------------------------
 ** Parsers and sprinters.
 ** ----------------------------------------------------------------- */

_Decimal32
mmux_strtod32 (char const * restrict input_string, char ** restrict tailptr)
{
  if (0) { fprintf(stderr, "%s: enter, input_string=%s\n", __func__, input_string); }
  return strtod32(input_string, tailptr);
}
_Decimal64
mmux_strtod64 (char const * restrict input_string, char ** restrict tailptr)
{
  return strtod64(input_string, tailptr);
}
_Decimal128
mmux_strtod128 (char const * restrict input_string, char ** restrict tailptr)
{
  return strtod128(input_string, tailptr);
}

/* ------------------------------------------------------------------ */

int
mmux_strfromd32 (char * s_value, size_t size, char const * restrict format, _Decimal32 value)
{
  return strfromd32(s_value, size, format, value);
}
int
mmux_strfromd64 (char * s_value, size_t size, char const * restrict format, _Decimal64 value)
{
  return strfromd64(s_value, size, format, value);
}
int
mmux_strfromd128 (char * s_value, size_t size, char const * restrict format, _Decimal128 value)
{
  return strfromd128(s_value, size, format, value);
}


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* ((defined MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY) && (1 == MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY)) */

/* end of file */
