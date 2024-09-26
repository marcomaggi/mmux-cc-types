/*
  Part of: MMUX Bash Pointers
  Contents: type functions
  Date: Sep 18, 2024

  Abstract

	This module implements type functions.

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

#undef  MMUX_FLOAT_ZERO
#define MMUX_FLOAT_ZERO(STEM)		((mmux_libc_ ## STEM ## _t)0.0)

#undef  MMUX_INTEGER_ZERO
#define MMUX_INTEGER_ZERO(STEM)		((mmux_libc_ ## STEM ## _t)0)

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32]]],[[[__extension__ static const _Float32   mmux_libc_maximum_float32=FLT32_MAX;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64]]],[[[__extension__ static const _Float64   mmux_libc_maximum_float64=FLT64_MAX;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128]]],[[[__extension__ static const _Float128 mmux_libc_maximum_float128=FLT128_MAX;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32]]],[[[__extension__ static const _Float32   mmux_libc_minimum_float32=-(mmux_libc_maximum_float32);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64]]],[[[__extension__ static const _Float64   mmux_libc_minimum_float64=-(mmux_libc_maximum_float64);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128]]],[[[__extension__ static const _Float128 mmux_libc_minimum_float128=-(mmux_libc_maximum_float128);]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32X]]], [[[__extension__ static const _Float32x  mmux_libc_maximum_float32x=FLT32X_MAX;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64X]]], [[[__extension__ static const _Float64x  mmux_libc_maximum_float64x=FLT64X_MAX;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128X]]],[[[__extension__ static const _Float128x mmux_libc_maximum_float128x=FLT128X_MAX;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32X]]], [[[__extension__ static const _Float32x  mmux_libc_minimum_float32x=-(mmux_libc_maximum_float32x);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64X]]], [[[__extension__ static const _Float64x  mmux_libc_minimum_float64x=-(mmux_libc_maximum_float64);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128X]]],[[[__extension__ static const _Float128x mmux_libc_minimum_float128x=-(mmux_libc_maximum_float128x);]]])


/** --------------------------------------------------------------------
 ** Complex basic functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_BASIC_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
mmux_libc_$1_t
mmux_bash_pointers_rectangular_$1 (mmux_libc_$1_part_t re, mmux_libc_$1_part_t im)
{
  return $4(re, im);
}
mmux_libc_$1_part_t
mmux_bash_pointers_$1_real_part (mmux_libc_$1_t Z)
{
  return $2(Z);
}
mmux_libc_$1_part_t
mmux_bash_pointers_$1_imag_part (mmux_libc_$1_t Z)
{
  return $3(Z);
}
]]])]]])

DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf]]],  [[[crealf]]], [[[cimagf]]], [[[CMPLXF]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexd]]],  [[[creal]]],  [[[cimag]]],  [[[CMPLX]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexld]]], [[[creall]]], [[[cimagl]]], [[[CMPLXL]]], [[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf32]]],  [[[crealf32]]],  [[[cimagf32]]],  [[[CMPLXF32]]],  [[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf64]]],  [[[crealf64]]],  [[[cimagf64]]],  [[[CMPLXF64]]],  [[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf128]]], [[[crealf128]]], [[[cimagf128]]], [[[CMPLXF128]]], [[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf32x]]],  [[[crealf32x]]],  [[[cimagf32x]]],  [[[CMPLXF32X]]],  [[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf64x]]],  [[[crealf64x]]],  [[[cimagf64x]]],  [[[CMPLXF64X]]],  [[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf128x]]], [[[crealf128x]]], [[[cimagf128x]]], [[[CMPLXF128X]]], [[[MMUX_HAVE_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Standard low-level type functions: string validation, minimum, maximum, sprint, parse.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_$1 (void)
{
  return sizeof(mmux_libc_$1_t);
}
mmux_libc_$1_t
mmux_bash_pointers_maximum_$1 (void)
{
  return $2;
}
mmux_libc_$1_t
mmux_bash_pointers_minimum_$1 (void)
{
  return $3;
}
]]])

DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(schar,	SCHAR_MAX,	SCHAR_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uchar,	UCHAR_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sshort,	SHRT_MAX,	SHRT_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ushort,	USHRT_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint,	INT_MAX,	INT_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint,	UINT_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(slong,	LONG_MAX,	LONG_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ulong,	ULONG_MAX,	0)
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sllong,	LLONG_MAX,	LLONG_MIN)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ullong,	ULLONG_MAX,	0)]]])

/* FIXME Should we do something to make available the "_MIN" constants defined by the
   C language standard?  (Marco Maggi; Sep 18, 2024) */
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float,	FLT_MAX,	-FLT_MAX)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(double,	DBL_MAX,	-DBL_MAX)
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ldouble,	LDBL_MAX,	-LDBL_MAX)]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float32, mmux_libc_maximum_float32, mmux_libc_minimum_float32)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float64, mmux_libc_maximum_float64, mmux_libc_minimum_float64)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float128,mmux_libc_maximum_float128, mmux_libc_minimum_float128)]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32X]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float32x, mmux_libc_maximum_float32x, mmux_libc_minimum_float32x)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64X]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float64x, mmux_libc_maximum_float64x, mmux_libc_minimum_float64x)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128X]]],
[[[DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float128x,mmux_libc_maximum_float128x, mmux_libc_minimum_float128x)]]])

DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint8,	INT8_MAX,	INT8_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint8,	UINT8_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint16,	INT16_MAX,	INT16_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint16,	UINT16_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint32,	INT32_MAX,	INT32_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint32,	UINT32_MAX,	0)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint64,	INT64_MAX,	INT64_MIN)
DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint64,	UINT64_MAX,	0)

/* ------------------------------------------------------------------ */

bool
mmux_bash_pointers_string_pointer_p (char const * s_arg)
{
  mmux_libc_pointer_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_pointer(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_pointer (void)
{
  return sizeof(mmux_libc_pointer_t);
}
mmux_libc_pointer_t
mmux_bash_pointers_minimum_pointer (void)
{
  return (mmux_libc_pointer_t)mmux_bash_pointers_minimum_uintptr();
}
mmux_libc_pointer_t
mmux_bash_pointers_maximum_pointer (void)
{
  return (mmux_libc_pointer_t) mmux_bash_pointers_maximum_uintptr();
}

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_$1 (void)
{
  return sizeof(mmux_libc_$1_t);
}
]]])]]])

DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexd]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Standard high-level type functions: string validation, minimum, maximum, sprint, parse.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
  int
  mmux_bash_pointers_sizeof_$1 (void)
  {
    return sizeof(mmux_libc_$1_t);
  }
  mmux_libc_$1_t
  mmux_bash_pointers_maximum_$1 (void)
  {
    return mmux_bash_pointers_maximum_[[[]]]$2[[[]]] ();
  }
  mmux_libc_$1_t
  mmux_bash_pointers_minimum_$1 (void)
  {
    return mmux_bash_pointers_minimum_[[[]]]$2[[[]]] ();
  }
]]])

DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ssize,	MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(usize,	MMUX_BASH_POINTERS_STEM_ALIAS_USIZE)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(mode,	MMUX_BASH_POINTERS_STEM_ALIAS_MODE)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(off,	MMUX_BASH_POINTERS_STEM_ALIAS_OFF)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(pid,	MMUX_BASH_POINTERS_STEM_ALIAS_PID)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uid,	MMUX_BASH_POINTERS_STEM_ALIAS_UID)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(gid,	MMUX_BASH_POINTERS_STEM_ALIAS_GID)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ptrdiff,	MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wchar,	MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR)
DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wint,	MMUX_BASH_POINTERS_STEM_ALIAS_WINT)


/** --------------------------------------------------------------------
 ** Store result value in result variable.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_VALUE_STORER]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
int
mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value)
{
  int		rv, required_nbytes;

  required_nbytes = mmux_bash_pointers_sprint_size_$1(value);
  if (0 > required_nbytes) {
    return MMUX_FAILURE;
  } else {
    char	s_value[required_nbytes];

    rv = mmux_bash_pointers_sprint_$1(s_value, required_nbytes, value);
    if (MMUX_SUCCESS == rv) {
      return mmux_bash_store_string_in_variable(variable_name, s_value, NULL);
    } else {
      return rv;
    }
  }
}
]]])]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[pointer]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[schar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sshort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ushort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[slong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ulong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ullong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint64]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[double]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexd]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexld]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[usize]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ssize]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ptrdiff]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[mode]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[off]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[pid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[gid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wint]]])



/** --------------------------------------------------------------------
 ** Core C language predicates: floating-point real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
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
    return (MMUX_FLOAT_ZERO($1) < X)? true : false;
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
    return (MMUX_FLOAT_ZERO($1) > X)? true : false;
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
    return (MMUX_FLOAT_ZERO($1) > X)? true : false;
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
    return (MMUX_FLOAT_ZERO($1) < X)? true : false;
  }
}
]]])]]])

DEFINE_FLOAT_PREDICATES([[[float]]])
DEFINE_FLOAT_PREDICATES([[[double]]])
DEFINE_FLOAT_PREDICATES([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_FLOAT_PREDICATES([[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_FLOAT_PREDICATES([[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_FLOAT_PREDICATES([[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_FLOAT_PREDICATES([[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_FLOAT_PREDICATES([[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_FLOAT_PREDICATES([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Core C language predicates: floating-point complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
bool
mmux_$1_is_infinite (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_infinite(re) || mmux_$2_is_infinite(im))? true : false;
}
]]])]]])

DEFINE_COMPLEX_PREDICATES([[[complexf]]],	[[[float]]])
DEFINE_COMPLEX_PREDICATES([[[complexd]]],	[[[double]]])
DEFINE_COMPLEX_PREDICATES([[[complexld]]],	[[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_PREDICATES([[[complexf32]]],	[[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_COMPLEX_PREDICATES([[[complexf64]]],	[[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_COMPLEX_PREDICATES([[[complexf128]]],	[[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_COMPLEX_PREDICATES([[[complexf32x]]],	[[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_COMPLEX_PREDICATES([[[complexf64x]]],	[[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_COMPLEX_PREDICATES([[[complexf128x]]],	[[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: signed integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_SIGNED_INTEGER_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) > X)? true : false;
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) >= X)? true : false;
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) <= X)? true : false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
mmux_$1_is_infinite (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
]]])]]])

DEFINE_SIGNED_INTEGER_PREDICATES([[[schar]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sshort]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sint]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[slong]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])

DEFINE_SIGNED_INTEGER_PREDICATES([[[sint8]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sint16]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sint32]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sint64]]])

DEFINE_SIGNED_INTEGER_PREDICATES([[[ssize]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sintmax]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sintptr]]])

DEFINE_SIGNED_INTEGER_PREDICATES([[[ptrdiff]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[off]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[pid]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[wchar]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: unsigned integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNSIGNED_INTEGER_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return mmux_$1_is_zero(X);
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return true;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
mmux_$1_is_infinite (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
]]])]]])

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[pointer]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uchar]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ushort]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ulong]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint8]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint16]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint32]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint64]]])

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[usize]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uintmax]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uintptr]]])

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[mode]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uid]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[gid]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[wint]]])

/* end of file */
