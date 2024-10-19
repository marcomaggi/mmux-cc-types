/*
  Part of: MMUX CC Types
  Contents: core type functions
  Date: Sep 18, 2024

  Abstract

	This module implements core type functions.

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

#include <mmux-cc-types-internals.h>

m4_define([[[MMUX_FLOAT_ZERO]]],  [[[((mmux_$1_t)0.0)]]])
m4_define([[[MMUX_INTEGER_ZERO]]],[[[((mmux_$1_t)0)]]])


/** --------------------------------------------------------------------
 ** Some maximum/minimum values.
 ** ----------------------------------------------------------------- */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT32]]],[[[
__extension__ static const _Float32   mmux_libc_maximum_float32=FLT32_MAX;
__extension__ static const _Float32   mmux_libc_minimum_float32=-(mmux_libc_maximum_float32);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT64]]],[[[
__extension__ static const _Float64   mmux_libc_maximum_float64=FLT64_MAX;
__extension__ static const _Float64   mmux_libc_minimum_float64=-(mmux_libc_maximum_float64);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT128]]],[[[
__extension__ static const _Float128 mmux_libc_maximum_float128=FLT128_MAX;
__extension__ static const _Float128 mmux_libc_minimum_float128=-(mmux_libc_maximum_float128);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT32X]]], [[[
__extension__ static const _Float32x  mmux_libc_maximum_float32x=FLT32X_MAX;
__extension__ static const _Float32x  mmux_libc_minimum_float32x=-(mmux_libc_maximum_float32x);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT64X]]], [[[
__extension__ static const _Float64x  mmux_libc_maximum_float64x=FLT64X_MAX;
__extension__ static const _Float64x  mmux_libc_minimum_float64x=-(mmux_libc_maximum_float64);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT128X]]],[[[
__extension__ static const _Float128x mmux_libc_maximum_float128x=FLT128X_MAX;
__extension__ static const _Float128x mmux_libc_minimum_float128x=-(mmux_libc_maximum_float128x);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],[[[
/* Should we do something with "DEC32_MIN" defined by GCC? */
__extension__ static const _Decimal32   mmux_libc_maximum_decimal32=DEC32_MAX;
__extension__ static const _Decimal32   mmux_libc_minimum_decimal32=-(mmux_libc_maximum_decimal32);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],[[[
/* Should we do something with "DEC64_MIN" defined by GCC? */
__extension__ static const _Decimal64   mmux_libc_maximum_decimal64=DEC64_MAX;
__extension__ static const _Decimal64   mmux_libc_minimum_decimal64=-(mmux_libc_maximum_decimal64);
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL128]]],[[[
/* Should we do something with "DEC128_MIN" defined by GCC? */
__extension__ static const _Decimal128 mmux_libc_maximum_decimal128=DEC128_MAX;
__extension__ static const _Decimal128 mmux_libc_minimum_decimal128=-(mmux_libc_maximum_decimal128);
]]])


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

char const *
mmux_cc_types_version_string (void)
{
  return mmux_cc_types_VERSION_INTERFACE_STRING;
}
int
mmux_cc_types_version_interface_current (void)
{
  return mmux_cc_types_VERSION_INTERFACE_CURRENT;
}
int
mmux_cc_types_version_interface_revision (void)
{
  return mmux_cc_types_VERSION_INTERFACE_REVISION;
}
int
mmux_cc_types_version_interface_age (void)
{
  return mmux_cc_types_VERSION_INTERFACE_AGE;
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

bool
mmux_cc_types_init (void)
{
  if (mmux_cc_types_init_sprint_module())  { return true; }
  if (mmux_cc_types_init_parsers_module()) { return true; }
  return false;
}


/** --------------------------------------------------------------------
 ** Real number type functions: string_is, sizeof, minimum, maximum.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - Stem of the type.
m4_dnl $2 - C language expression evaluating to the maximum value.
m4_dnl $3 - C language expression evaluating to the minimum value.
m4_dnl $4 - C preprocessor symbol used to exclude the code if the type is not supported.
m4_define([[[DEFINE_REAL_TYPE_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
bool
mmux_string_is_$1 (char const * s_value)
{
  mmux_$1_t	value;

  return mmux_$1_parse(&value, s_value, NULL);
}
int
mmux_$1_sizeof (void)
{
  return sizeof(mmux_$1_t);
}
mmux_$1_t
mmux_$1_maximum (void)
{
  return $2;
}
mmux_$1_t
mmux_$1_minimum (void)
{
  return $3;
}
]]])]]])

DEFINE_REAL_TYPE_FUNCTIONS([[[pointer]]],
			   [[[(mmux_pointer_t)mmux_uintptr_maximum()]]],
			   [[[(mmux_pointer_t)mmux_uintptr_minimum()]]])

DEFINE_REAL_TYPE_FUNCTIONS(schar,	SCHAR_MAX,	SCHAR_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uchar,	UCHAR_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sshort,	SHRT_MAX,	SHRT_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(ushort,	USHRT_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint,	INT_MAX,	INT_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint,	UINT_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(slong,	LONG_MAX,	LONG_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(ulong,	ULONG_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sllong,	LLONG_MAX,	LLONG_MIN,	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_REAL_TYPE_FUNCTIONS(ullong,	ULLONG_MAX,	0,		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

/* FIXME Should we do something to make available the "_MIN" constants defined by the
   C language standard?  (Marco Maggi; Sep 18, 2024) */
DEFINE_REAL_TYPE_FUNCTIONS(float,	FLT_MAX,	-FLT_MAX)
DEFINE_REAL_TYPE_FUNCTIONS(double,	DBL_MAX,	-DBL_MAX)
DEFINE_REAL_TYPE_FUNCTIONS(ldouble,	LDBL_MAX,	-LDBL_MAX,	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_REAL_TYPE_FUNCTIONS(float32, mmux_libc_maximum_float32, mmux_libc_minimum_float32, [[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_REAL_TYPE_FUNCTIONS(float64, mmux_libc_maximum_float64, mmux_libc_minimum_float64, [[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_REAL_TYPE_FUNCTIONS(float128,mmux_libc_maximum_float128, mmux_libc_minimum_float128, [[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_REAL_TYPE_FUNCTIONS(float32x, mmux_libc_maximum_float32x, mmux_libc_minimum_float32x, [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_REAL_TYPE_FUNCTIONS(float64x, mmux_libc_maximum_float64x, mmux_libc_minimum_float64x, [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_REAL_TYPE_FUNCTIONS(float128x,mmux_libc_maximum_float128x, mmux_libc_minimum_float128x, [[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_REAL_TYPE_FUNCTIONS(decimal32, mmux_libc_maximum_decimal32, mmux_libc_minimum_decimal32, [[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_TYPE_FUNCTIONS(decimal64, mmux_libc_maximum_decimal64, mmux_libc_minimum_decimal64, [[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_TYPE_FUNCTIONS(decimal128,mmux_libc_maximum_decimal128, mmux_libc_minimum_decimal128, [[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_REAL_TYPE_FUNCTIONS(sint8,	INT8_MAX,	INT8_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint8,	UINT8_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint16,	INT16_MAX,	INT16_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint16,	UINT16_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint32,	INT32_MAX,	INT32_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint32,	UINT32_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint64,	INT64_MAX,	INT64_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint64,	UINT64_MAX,	0)


/** --------------------------------------------------------------------
 ** Integer non-alias number functions: abs, min, max.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_STYPE_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
mmux_$1_t
mmux_$1_abs (mmux_$1_t op)
{
  return ((mmux_$1_is_negative(op))? -op : op);
}
mmux_$1_t
mmux_$1_max (mmux_$1_t op1, mmux_$1_t op2)
{
  return ((mmux_$1_greater_equal(op1, op2))? op1 : op2);
}
mmux_$1_t
mmux_$1_min (mmux_$1_t op1, mmux_$1_t op2)
{
  return ((mmux_$1_less_equal(op1, op2))? op1 : op2);
}
]]])]]])

m4_define([[[DEFINE_UTYPE_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
mmux_$1_t
mmux_$1_abs (mmux_$1_t op)
{
  return op;
}
mmux_$1_t
mmux_$1_max (mmux_$1_t op1, mmux_$1_t op2)
{
  return ((mmux_$1_greater_equal(op1, op2))? op1 : op2);
}
mmux_$1_t
mmux_$1_min (mmux_$1_t op1, mmux_$1_t op2)
{
  return ((mmux_$1_less_equal(op1, op2))? op1 : op2);
}
]]])]]])


DEFINE_UTYPE_FUNCTIONS([[[pointer]]])

DEFINE_STYPE_FUNCTIONS([[[schar]]])
DEFINE_UTYPE_FUNCTIONS([[[uchar]]])
DEFINE_STYPE_FUNCTIONS([[[sshort]]])
DEFINE_UTYPE_FUNCTIONS([[[ushort]]])
DEFINE_STYPE_FUNCTIONS([[[sint]]])
DEFINE_UTYPE_FUNCTIONS([[[uint]]])
DEFINE_STYPE_FUNCTIONS([[[slong]]])
DEFINE_UTYPE_FUNCTIONS([[[ulong]]])
DEFINE_STYPE_FUNCTIONS([[[sllong]]],	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_UTYPE_FUNCTIONS([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_STYPE_FUNCTIONS([[[sint8]]])
DEFINE_UTYPE_FUNCTIONS([[[uint8]]])
DEFINE_STYPE_FUNCTIONS([[[sint16]]])
DEFINE_UTYPE_FUNCTIONS([[[uint16]]])
DEFINE_STYPE_FUNCTIONS([[[sint32]]])
DEFINE_UTYPE_FUNCTIONS([[[uint32]]])
DEFINE_STYPE_FUNCTIONS([[[sint64]]])
DEFINE_UTYPE_FUNCTIONS([[[uint64]]])


/** --------------------------------------------------------------------
 ** Real non-alias floating-point number functions: abs, min, max.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPE_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
inline mmux_$1_t mmux_$1_abs (mmux_$1_t X)              { return $2(X);    }
inline mmux_$1_t mmux_$1_max (mmux_$1_t X, mmux_$1_t Y) { return $3(X, Y); }
inline mmux_$1_t mmux_$1_min (mmux_$1_t X, mmux_$1_t Y) { return $4(X, Y); }
]]])]]])

DEFINE_TYPE_FUNCTIONS([[[float]]],	[[[fabsf]]],    [[[fmaxf]]],     [[[fminf]]])
DEFINE_TYPE_FUNCTIONS([[[double]]],	[[[fabs]]],     [[[fmax]]],      [[[fmin]]])
DEFINE_TYPE_FUNCTIONS([[[ldouble]]],	[[[fabsl]]],    [[[fmaxl]]],     [[[fminl]]],    [[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_FUNCTIONS([[[float32]]],	[[[fabsf32]]],  [[[fmaxf32]]],   [[[fminf32]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_FUNCTIONS([[[float64]]],	[[[fabsf64]]],  [[[fmaxf64]]],   [[[fminf64]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_FUNCTIONS([[[float128]]],	[[[fabsf128]]], [[[fmaxf128]]],  [[[fminf128]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_FUNCTIONS([[[float32x]]],	[[[fabsf32x]]], [[[fmaxf32x]]],  [[[fminf32x]]], [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_FUNCTIONS([[[float64x]]],	[[[fabsf64x]]], [[[fmaxf64x]]],  [[[fminf64x]]], [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_FUNCTIONS([[[float128x]]],	[[[fabsf128x]]],[[[fmaxf128x]]], [[[fminf128x]]],[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Aliased integer number type functions: string_is, sizeof, minimum, maximum, abs, min, max.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[DEFINE_TYPE_FUNCTIONS]]],[[[
bool
mmux_string_is_$1 (char const * s_value)
{
  return mmux_string_is_$2(s_value);
}
int
mmux_$1_sizeof (void)
{
  return sizeof(mmux_$1_t);
}
mmux_$1_t
mmux_$1_maximum (void)
{
  return mmux_$2_maximum ();
}
mmux_$1_t
mmux_$1_minimum (void)
{
  return mmux_$2_minimum ();
}
mmux_$1_t
mmux_$1_abs (mmux_$1_t op)
{
  return mmux_$2_abs(op);
}
mmux_$1_t
mmux_$1_max (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_max(op1, op2);
}
mmux_$1_t
mmux_$1_min (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_min(op1, op2);
}
]]])

DEFINE_TYPE_FUNCTIONS(ssize,	MMUX_CC_TYPES_STEM_ALIAS_SSIZE)
DEFINE_TYPE_FUNCTIONS(usize,	MMUX_CC_TYPES_STEM_ALIAS_USIZE)
DEFINE_TYPE_FUNCTIONS(sintmax,	MMUX_CC_TYPES_STEM_ALIAS_SINTMAX)
DEFINE_TYPE_FUNCTIONS(uintmax,	MMUX_CC_TYPES_STEM_ALIAS_UINTMAX)
DEFINE_TYPE_FUNCTIONS(sintptr,	MMUX_CC_TYPES_STEM_ALIAS_SINTPTR)
DEFINE_TYPE_FUNCTIONS(uintptr,	MMUX_CC_TYPES_STEM_ALIAS_UINTPTR)
DEFINE_TYPE_FUNCTIONS(mode,	MMUX_CC_TYPES_STEM_ALIAS_MODE)
DEFINE_TYPE_FUNCTIONS(off,	MMUX_CC_TYPES_STEM_ALIAS_OFF)
DEFINE_TYPE_FUNCTIONS(pid,	MMUX_CC_TYPES_STEM_ALIAS_PID)
DEFINE_TYPE_FUNCTIONS(uid,	MMUX_CC_TYPES_STEM_ALIAS_UID)
DEFINE_TYPE_FUNCTIONS(gid,	MMUX_CC_TYPES_STEM_ALIAS_GID)
DEFINE_TYPE_FUNCTIONS(ptrdiff,	MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF)
DEFINE_TYPE_FUNCTIONS(wchar,	MMUX_CC_TYPES_STEM_ALIAS_WCHAR)
DEFINE_TYPE_FUNCTIONS(wint,	MMUX_CC_TYPES_STEM_ALIAS_WINT)


/** --------------------------------------------------------------------
 ** Some complex number type functions: string_is, sizeof, make_rectangular, real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - real part function
m4_dnl $3 - imag part function
m4_dnl $4 - make rectangular function
m4_dnl $5 - magnitude function
m4_dnl $6 - argument function
m4_dnl $7 - conjugate function
m4_dnl $8 - atan2 function
m4_dnl $9 - C preprocessor symbol used to exclude the code if the type is not supported.
m4_define([[[DEFINE_COMPLEX_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$9]]],[[[
bool
mmux_string_is_$1 (char const * s_value)
{
  mmux_$1_t	value;

  return mmux_$1_parse(&value, s_value, NULL);
}
int
mmux_$1_sizeof (void)
{
  return sizeof(mmux_$1_t);
}
mmux_$1_t
mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im)
{
  return $4(re, im);
}
mmux_$1_part_t
mmux_$1_real_part (mmux_$1_t Z)
{
  return $2(Z);
}
mmux_$1_part_t
mmux_$1_imag_part (mmux_$1_t Z)
{
  return $3(Z);
}
inline mmux_$1_part_t
mmux_$1_abs (mmux_$1_t Z)
{
  return sqrt($2(Z) * $2(Z) + $3(Z) * $3(Z));
}
inline mmux_$1_part_t
mmux_$1_arg (mmux_$1_t Z)
{
  return $8($3(Z), $2(Z));
}
inline mmux_$1_t
mmux_$1_conj (mmux_$1_t Z)
{
  return mmux_$1_make_rectangular($2(Z), - $3(Z));
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[complexf]]],  [[[crealf]]], [[[cimagf]]], [[[CMPLXF]]],
			 [[[cabsf]]],     [[[cargf]]],  [[[conjf]]],  [[[atan2f]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexd]]],  [[[creal]]],  [[[cimag]]],  [[[CMPLX]]],
			 [[[cabs]]],      [[[carg]]],   [[[conj]]],   [[[atan2]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexld]]], [[[creall]]], [[[cimagl]]], [[[CMPLXL]]],
			 [[[cabsl]]],     [[[cargl]]],  [[[conjl]]],  [[[atan2l]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[complexf32]]],  [[[crealf32]]], [[[cimagf32]]], [[[CMPLXF32]]],
			 [[[cabsf32]]],     [[[cargf32]]],  [[[conjf32]]],  [[[atan2f32]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexf64]]],  [[[crealf64]]], [[[cimagf64]]], [[[CMPLXF64]]],
			 [[[cabsf64]]],     [[[cargf64]]],  [[[conjf64]]],  [[[atan2f64]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexf128]]], [[[crealf128]]],[[[cimagf128]]],[[[CMPLXF128]]],
			 [[[cabsf128]]],    [[[cargf128]]], [[[conjf128]]], [[[atan2f128]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[complexf32x]]],  [[[crealf32x]]], [[[cimagf32x]]], [[[CMPLXF32X]]],
			 [[[cabsf32x]]],     [[[cargf32x]]],  [[[conjf32x]]],  [[[atan2f32x]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexf64x]]],  [[[crealf64x]]], [[[cimagf64x]]], [[[CMPLXF64X]]],
			 [[[cabsf64x]]],     [[[cargf64x]]],  [[[conjf64x]]],  [[[atan2f64x]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])

DEFINE_COMPLEX_FUNCTIONS([[[complexf128x]]], [[[crealf128x]]],[[[cimagf128x]]],[[[CMPLXF128X]]],
			 [[[cabsf128x]]],    [[[cargf128x]]], [[[conjf128x]]], [[[atan2f128x]]],
			 [[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])


/** --------------------------------------------------------------------
 ** Complex decimal basic functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_DECIMAL_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
bool
mmux_string_is_$1 (char const * s_value)
{
  mmux_$1_t	value;

  return mmux_$1_parse(&value, s_value, NULL);
}
]]])]]])

DEFINE_COMPLEX_DECIMAL_FUNCTIONS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_DECIMAL_FUNCTIONS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_DECIMAL_FUNCTIONS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: signed integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_SIGNED_INTEGER_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) > X)? true : false;
}
bool
mmux_$1_is_non_positive (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) >= X)? true : false;
}
bool
mmux_$1_is_non_negative (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) <= X)? true : false;
}
bool
mmux_$1_is_nan (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_infinite (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
]]])]]])

DEFINE_SIGNED_INTEGER_PREDICATES([[[schar]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sshort]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sint]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[slong]]])
DEFINE_SIGNED_INTEGER_PREDICATES([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])

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
mmux_$1_is_zero (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_non_positive (mmux_$1_t X)
{
  return mmux_$1_is_zero(X);
}
bool
mmux_$1_is_non_negative (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return true;
}
bool
mmux_$1_is_nan (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_infinite (mmux_$1_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
]]])]]])

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[pointer]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uchar]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ushort]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ulong]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

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


/** --------------------------------------------------------------------
 ** Core C language predicates: floating-point real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_REAL_FLOAT_NUMBER_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (FP_ZERO == (fpclassify(X)))? true : false;
}
bool
mmux_$1_is_nan (mmux_$1_t X)
{
  return (FP_NAN == (fpclassify(X)))? true : false;
}
bool
mmux_$1_is_infinite (mmux_$1_t X)
{
  return (FP_INFINITE == (fpclassify(X)))? true : false;
}
bool
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
    return (MMUX_FLOAT_ZERO($1) < X)? true : false;
  }
}
bool
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
    return (MMUX_FLOAT_ZERO($1) > X)? true : false;
  }
}
bool
mmux_$1_is_non_positive (mmux_$1_t X)
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
mmux_$1_is_non_negative (mmux_$1_t X)
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

DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[double]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_REAL_FLOAT_NUMBER_PREDICATES([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Core C language predicates: complex floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_NUMBER_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
bool
mmux_$1_is_nan (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
bool
mmux_$1_is_infinite (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_infinite(re) || mmux_$2_is_infinite(im))? true : false;
}
]]])]]])

DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf]]],	[[[float]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexd]]],	[[[double]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexld]]],	[[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf32]]],	[[[float32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf64]]],	[[[float64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf128]]],	[[[float128]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf32x]]],	[[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf64x]]],	[[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[complexf128x]]],	[[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])


/** --------------------------------------------------------------------
 ** Comparison core functions.
 ** ----------------------------------------------------------------- */

#undef  DECL
#define DECL		__attribute__((__const__))

m4_define([[[DEFINE_COMPARISON_EQUAL_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DECL bool mmux_$1_equal         (mmux_$1_t op1, mmux_$1_t op2) { return (op1 == op2)? true : false; }
]]])]]])

m4_define([[[DEFINE_COMPARISON_INTEGER_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL int
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (op1 > op2) {
    return +1;
  } else if (op1 < op2) {
    return -1;
  } else {
    return 0;
  }
}
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (op1 >  op2)? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (op1 <  op2)? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (op1 >= op2)? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (op1 <= op2)? true : false; }
]]])]]])

m4_define([[[DEFINE_COMPARISON_FLOAT_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
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
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (     isgreater(op1,op2))? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (        isless(op1,op2))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (isgreaterequal(op1,op2))? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (   islessequal(op1,op2))? true : false; }
]]])]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[pointer]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[schar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uchar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sshort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ushort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[slong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ulong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[double]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_COMPARISON_FLOAT_FUNCTIONS([[[float128x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexd]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexld]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf128]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf32x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf64x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[complexf128x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint8]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint8]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint16]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint16]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint32]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint32]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint64]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint64]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[usize]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ssize]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sintmax]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uintmax]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sintptr]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uintptr]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ptrdiff]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[mode]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[off]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[pid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[gid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[wchar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[wint]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex type stem
m4_dnl $2 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  return (mmux_$1_abs(op1 - op2) <= mmux_$1_abs(margin))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  return (mmux_$1_abs(op1 - op2) <= (mmux_$1_abs(epsilon) * mmux_$1_max(mmux_$1_abs(op1), mmux_$1_abs(op2))))? true : false;
}
]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - complex type stem
m4_dnl $2 - real part type stem
m4_dnl $3 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  mmux_$1_part_t	re1 = mmux_$1_real_part(op1);
  mmux_$1_part_t	im1 = mmux_$1_imag_part(op1);
  mmux_$1_part_t	re2 = mmux_$1_real_part(op2);
  mmux_$1_part_t	im2 = mmux_$1_imag_part(op2);
  mmux_$1_part_t	ret = mmux_$1_real_part(margin);
  mmux_$1_part_t	imt = mmux_$1_imag_part(margin);

  return (mmux_$2_equal_absmargin(re1, re2, ret) && mmux_$2_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  mmux_$1_part_t	re1 = mmux_$1_real_part(op1);
  mmux_$1_part_t	im1 = mmux_$1_imag_part(op1);
  mmux_$1_part_t	re2 = mmux_$1_real_part(op2);
  mmux_$1_part_t	im2 = mmux_$1_imag_part(op2);
  mmux_$1_part_t	ret = mmux_$1_real_part(epsilon);
  mmux_$1_part_t	imt = mmux_$1_imag_part(epsilon);

  return (mmux_$2_equal_relepsilon(re1, re2, ret) && mmux_$2_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[double]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf]]],    [[[float]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexd]]],    [[[double]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexld]]],   [[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf32]]],  [[[float32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf64]]],  [[[float64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf128]]], [[[float128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf32x]]], [[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf64x]]], [[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLOAT_APPROX_COMPARISONS([[[complexf128x]]],[[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])


m4_divert(-1)m4_dnl
m4_dnl --------------------------------------------------------------------
m4_dnl Orgy of math macros.
m4_dnl ----------------------------------------------------------------- */

m4_dnl We want to define wrapper functions like:
m4_dnl
m4_dnl mmux_float32_t mmux_float32_sin (mmux_float32_t op) { return sinf32(op); }
m4_dnl

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
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j0]]],	[[[$34]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j1]]],	[[[$35]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[jn]]],	[[[$36]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y0]]],	[[[$37]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y1]]],	[[[$38]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[yn]]],	[[[$39]]], [[[$2]]], [[[$3]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[float]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT]]],		[[[]]],
	      [[[sinf]]],		[[[cosf]]],		[[[tanf]]],
	      [[[asinf]]],		[[[acosf]]],		[[[atanf]]],		[[[atan2f]]],
	      [[[sinhf]]],		[[[coshf]]],		[[[tanhf]]],
	      [[[asinhf]]],		[[[acoshf]]],		[[[atanhf]]],
	      [[[expf]]],		[[[exp2f]]],		[[[exp10f]]],
	      [[[logf]]],		[[[log10f]]],		[[[log2f]]],		[[[logbf]]],
	      [[[powf]]],		[[[sqrtf]]],		[[[cbrtf]]],		[[[hypotf]]],
	      [[[expm1f]]],		[[[log1pf]]],
	      [[[erff]]],		[[[erfcf]]],
	      [[[lgammaf]]],		[[[tgammaf]]],
	      [[[j0f]]],		[[[j1f]]],		[[[jnf]]],
	      [[[y0f]]],		[[[y1f]]],		[[[ynf]]])
DEFINE_CFUNCS([[[double]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_DOUBLE]]],		[[[]]],
	      [[[sin]]],		[[[cos]]],		[[[tan]]],
	      [[[asin]]],		[[[acos]]],		[[[atan]]],		[[[atan2f]]],
	      [[[sinh]]],		[[[cosh]]],		[[[tanh]]],
	      [[[asinh]]],		[[[acosh]]],		[[[atanh]]],
	      [[[exp]]],		[[[exp2]]],		[[[exp10]]],
	      [[[log]]],		[[[log10]]],		[[[log2]]],		[[[logb]]],
	      [[[pow]]],		[[[sqrt]]],		[[[cbrt]]],		[[[hypot]]],
	      [[[expm1]]],		[[[log1p]]],
	      [[[erf]]],		[[[erfc]]],
	      [[[lgamma]]],		[[[tgamma]]],
	      [[[j0]]],			[[[j1]]],		[[[jn]]],
	      [[[y0]]],			[[[y1]]],		[[[yn]]])
DEFINE_CFUNCS([[[ldouble]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_LDOUBLE]]], [[[MMUX_HAVE_CC_TYPE_LDOUBLE]]],
	      [[[sinl]]],		[[[cosl]]],		[[[tanl]]],
	      [[[asinl]]],		[[[acosl]]],		[[[atanl]]],		[[[atan2l]]],
	      [[[sinhl]]],		[[[coshl]]],		[[[tanhl]]],
	      [[[asinhl]]],		[[[acoshl]]],		[[[atanhl]]],
	      [[[expl]]],		[[[exp2l]]],		[[[exp10l]]],
	      [[[logl]]],		[[[log10l]]],		[[[log2l]]],		[[[logbl]]],
	      [[[powl]]],		[[[sqrtl]]],		[[[cbrtl]]],		[[[hypotl]]],
	      [[[expm1l]]],		[[[log1pl]]],
	      [[[erfl]]],		[[[erfcl]]],
	      [[[lgammal]]],		[[[tgammal]]],
	      [[[j0l]]],		[[[j1l]]],		[[[jnl]]],
	      [[[y0l]]],		[[[y1l]]],		[[[ynl]]])

DEFINE_CFUNCS([[[float32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT32]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32]]],
	      [[[sinf32]]],		[[[cosf32]]],		[[[tanf32]]],
	      [[[asinf32]]],		[[[acosf32]]],		[[[atanf32]]],		[[[atan2f32]]],
	      [[[sinhf32]]],		[[[coshf32]]],		[[[tanhf32]]],
	      [[[asinhf32]]],		[[[acoshf32]]],		[[[atanhf32]]],
	      [[[expf32]]],		[[[exp2f32]]],		[[[exp10f32]]],
	      [[[logf32]]],		[[[log10f32]]],		[[[log2f32]]],		[[[logbf32]]],
	      [[[powf32]]],		[[[sqrtf32]]],		[[[cbrtf32]]],		[[[hypotf32]]],
	      [[[expm1f32]]],		[[[log1pf32]]],
	      [[[erff32]]],			[[[erfcf32]]],
	      [[[lgammaf32]]],		[[[tgammaf32]]],
	      [[[j0f32]]],		[[[j1f32]]],		[[[jnf32]]],
	      [[[y0f32]]],		[[[y1f32]]],		[[[ynf32]]])
DEFINE_CFUNCS([[[float64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT64]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64]]],
	      [[[sinf64]]],		[[[cosf64]]],		[[[tanf64]]],
	      [[[asinf64]]],		[[[acosf64]]],		[[[atanf64]]],		[[[atan2f64]]],
	      [[[sinhf64]]],		[[[coshf64]]],		[[[tanhf64]]],
	      [[[asinhf64]]],		[[[acoshf64]]],		[[[atanhf64]]],
	      [[[expf64]]],		[[[exp2f64]]],		[[[exp10f64]]],
	      [[[logf64]]],		[[[log10f64]]],		[[[log2f64]]],		[[[logbf64]]],
	      [[[powf64]]],		[[[sqrtf64]]],		[[[cbrtf64]]],		[[[hypotf64]]],
	      [[[expm1f64]]],		[[[log1pf64]]],
	      [[[erff64]]],		[[[erfcf64]]],
	      [[[lgammaf64]]],		[[[tgammaf64]]],
	      [[[j0f64]]],		[[[j1f64]]],		[[[jnf64]]],
	      [[[y0f64]]],		[[[y1f64]]],		[[[ynf64]]])
DEFINE_CFUNCS([[[float128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT128]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128]]],
	      [[[sinf128]]],		[[[cosf128]]],		[[[tanf128]]],
	      [[[asinf128]]],		[[[acosf128]]],		[[[atanf128]]],		[[[atan2f128]]],
	      [[[sinhf128]]],		[[[coshf128]]],		[[[tanhf128]]],
	      [[[asinhf128]]],		[[[acoshf128]]],	[[[atanhf128]]],
	      [[[expf128]]],		[[[exp2f128]]],		[[[exp10f128]]],
	      [[[logf128]]],		[[[log10f128]]],	[[[log2f128]]],		[[[logbf128]]],
	      [[[powf128]]],		[[[sqrtf128]]],		[[[cbrtf128]]],		[[[hypotf128]]],
	      [[[expm1f128]]],		[[[log1pf128]]],
	      [[[erff128]]],		[[[erfcf128]]],
	      [[[lgammaf128]]],		[[[tgammaf128]]],
	      [[[j0f128]]],		[[[j1f128]]],		[[[jnf128]]],
	      [[[y0f128]]],		[[[y1f128]]],		[[[ynf128]]])

DEFINE_CFUNCS([[[float32x]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT32X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]],
	      [[[sinf32x]]],		[[[cosf32x]]],		[[[tanf32x]]],
	      [[[asinf32x]]],		[[[acosf32x]]],		[[[atanf32x]]],		[[[atan2f32x]]],
	      [[[sinhf32x]]],		[[[coshf32x]]],		[[[tanhf32x]]],
	      [[[asinhf32x]]],		[[[acoshf32x]]],	[[[atanhf32x]]],
	      [[[expf32x]]],		[[[exp2f32x]]],		[[[exp10f32x]]],
	      [[[logf32x]]],		[[[log10f32x]]],	[[[log2f32x]]],		[[[logbf32x]]],
	      [[[powf32x]]],		[[[sqrtf32x]]],		[[[cbrtf32x]]],		[[[hypotf32x]]],
	      [[[expm1f32x]]],		[[[log1pf32x]]],
	      [[[erff32x]]],		[[[erfcf32x]]],
	      [[[lgammaf32x]]],		[[[tgammaf32x]]],
	      [[[j0f32x]]],		[[[j1f32x]]],		[[[jnf32x]]],
	      [[[y0f32x]]],		[[[y1f32x]]],		[[[ynf32x]]])
DEFINE_CFUNCS([[[float64x]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT64X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]],
	      [[[sinf64x]]],		[[[cosf64x]]],		[[[tanf64x]]],
	      [[[asinf64x]]],		[[[acosf64x]]],		[[[atanf64x]]],		[[[atan2f64x]]],
	      [[[sinhf64x]]],		[[[coshf64x]]],		[[[tanhf64x]]],
	      [[[asinhf64x]]],		[[[acoshf64x]]],	[[[atanhf64x]]],
	      [[[expf64x]]],		[[[exp2f64x]]],		[[[exp10f64x]]],
	      [[[logf64x]]],		[[[log10f64x]]],	[[[log2f64x]]],		[[[logbf64x]]],
	      [[[powf64x]]],		[[[sqrtf64x]]],		[[[cbrtf64x]]],		[[[hypotf64x]]],
	      [[[expm1f64x]]],		[[[log1pf64x]]],
	      [[[erff64x]]],		[[[erfcf64x]]],
	      [[[lgammaf64x]]],		[[[tgammaf64x]]],
	      [[[j0f64x]]],		[[[j1f64x]]],		[[[jnf64x]]],
	      [[[y0f64x]]],		[[[y1f64x]]],		[[[ynf64x]]])
DEFINE_CFUNCS([[[float128x]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_FLOAT128X]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128X]]],
		  [[[sinf128x]]],	[[[cosf128x]]],		[[[tanf128x]]],
		  [[[asinf128x]]],	[[[acosf128x]]],	[[[atanf128x]]],	[[[atan2f128x]]],
		  [[[sinhf128x]]],	[[[coshf128x]]],	[[[tanhf128x]]],
		  [[[asinhf128x]]],	[[[acoshf128x]]],	[[[atanhf128x]]],
		  [[[expf128x]]],	[[[exp2f128x]]],	[[[exp10f128x]]],
		  [[[logf128x]]],	[[[log10f128x]]],	[[[log2f128x]]],	[[[logbf128x]]],
		  [[[powf128x]]],	[[[sqrtf128x]]],	[[[cbrtf128x]]],	[[[hypotf128x]]],
		  [[[expm1f128x]]],	[[[log1pf128x]]],
		  [[[erff128x]]],	[[[erfc128x]]],
		  [[[lgammaf128x]]],	[[[tgammaf128x]]],
		  [[[j0f128x]]],	[[[j1f128x]]],		[[[jnf128x]]],
		  [[[y0f128x]]],	[[[y1f128x]]],		[[[ynf128x]]])

DEFINE_CFUNCS([[[complexf]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF]]],		[[[]]],
	      [[[csinf]]],		[[[ccosf]]],		[[[ctanf]]],
	      [[[casinf]]],		[[[cacosf]]],		[[[catanf]]],		[[[]]],
	      [[[csinhf]]],		[[[ccoshf]]],		[[[ctanhf]]],
	      [[[casinhf]]],		[[[cacoshf]]],		[[[catanhf]]],
	      [[[cexpf]]],		[[[]]],			[[[]]],
	      [[[clogf]]],		[[[clog10f]]],		[[[]]],			[[[]]],
	      [[[cpowf]]],		[[[csqrtf]]],		[[[]]],			[[[]]],
	      [[[]]],			[[[]]],
	      [[[]]],			[[[]]],
	      [[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexd]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXD]]],	[[[]]],
		  [[[csin]]],		[[[ccos]]],		[[[ctan]]],
		  [[[casin]]],		[[[cacos]]],		[[[catan]]],		[[[]]],
		  [[[csinh]]],		[[[ccosh]]],		[[[ctanh]]],
		  [[[casinh]]],		[[[cacosh]]],		[[[catanh]]],
		  [[[cexp]]],		[[[]]],			[[[]]],
		  [[[clog]]],		[[[clog10]]],		[[[]]],			[[[]]],
		  [[[cpow]]],		[[[csqrt]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexld]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXLD]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]],
		  [[[csinl]]],		[[[ccosl]]],		[[[ctanl]]],
		  [[[casinl]]],		[[[cacosl]]],		[[[catanl]]],		[[[]]],
		  [[[csinhl]]],		[[[ccoshl]]],		[[[ctanhl]]],
		  [[[casinhl]]],	[[[cacoshl]]],		[[[catanhl]]],
		  [[[cexpl]]],		[[[]]],			[[[]]],
		  [[[clogl]]],		[[[clog10l]]],		[[[]]],			[[[]]],
		  [[[cpowl]]],		[[[csqrtl]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[complexf32]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF32]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]],
		  [[[csinf32]]],	[[[ccosf32]]],		[[[ctanf32]]],
		  [[[casinf32]]],	[[[cacosf32]]],		[[[catanf32]]],		[[[]]],
		  [[[csinhf32]]],	[[[ccoshf32]]],		[[[ctanhf32]]],
		  [[[casinhf32]]],	[[[cacoshf32]]],	[[[catanhf32]]],
		  [[[cexpf32]]],	[[[]]],			[[[]]],
		  [[[clogf32]]],	[[[clog10f32]]],	[[[]]],			[[[]]],
		  [[[cpowf32]]],	[[[csqrtf32]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexf64]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF64]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]],
		  [[[csinf64]]],	[[[ccosf64]]],		[[[ctanf64]]],
		  [[[casinf64]]],	[[[cacosf64]]],		[[[catanf64]]],		[[[]]],
		  [[[csinhf64]]],	[[[ccoshf64]]],		[[[ctanhf64]]],
		  [[[casinhf64]]],	[[[cacoshf64]]],	[[[catanhf64]]],
		  [[[cexpf64]]],	[[[]]],			[[[]]],
		  [[[clogf64]]],	[[[clog10f64]]],	[[[]]],			[[[]]],
		  [[[cpowf64]]],	[[[csqrtf64]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexf128]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]],
		  [[[csinf128]]],	[[[ccosf128]]],		[[[ctanf128]]],
		  [[[casinf128]]],	[[[cacosf128]]],	[[[catanf128]]],	[[[]]],
		  [[[csinhf128]]],	[[[ccoshf128]]],	[[[ctanhf128]]],
		  [[[casinhf128]]],	[[[cacoshf128]]],	[[[catanhf128]]],
		  [[[cexpf128]]],	[[[]]],			[[[]]],
		  [[[clogf128]]],	[[[clog10f128]]],	[[[]]],			[[[]]],
		  [[[cpowf128]]],	[[[csqrtf128]]],	[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[complexf32x]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF32X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]],
		  [[[csinf32x]]],	[[[ccosf32x]]],		[[[ctanf32x]]],
		  [[[casinf32x]]],	[[[cacosf32x]]],	[[[catanf32x]]],	[[[]]],
		  [[[csinhf32x]]],	[[[ccoshf32x]]],	[[[ctanhf32x]]],
		  [[[casinhf32x]]],	[[[cacoshf32x]]],	[[[catanhf32x]]],
		  [[[cexpf32x]]],	[[[]]],			[[[]]],
		  [[[clogf32x]]],	[[[clog10f32x]]],	[[[]]],			[[[]]],
		  [[[cpowf32x]]],	[[[csqrtf32x]]],	[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexf64x]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF64X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]],
		  [[[csinf64x]]],	[[[ccosf64x]]],		[[[ctanf64x]]],
		  [[[casinf64x]]],	[[[cacosf64x]]],	[[[catanf64x]]],	[[[]]],
		  [[[csinhf64x]]],	[[[ccoshf64x]]],	[[[ctanhf64x]]],
		  [[[casinhf64x]]],	[[[cacoshf64x]]],	[[[catanhf64x]]],
		  [[[cexpf64x]]],	[[[]]],			[[[]]],
		  [[[clogf64x]]],	[[[clog10f64x]]],	[[[]]],			[[[]]],
		  [[[cpowf64x]]],	[[[csqrtf64x]]],	[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_CFUNCS([[[complexf128x]]],
		  [[[MMUX_BASH_PARSE_CFUNC_ARG_COMPLEXF128X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]],
		  [[[csinf128x]]],	[[[ccosf128x]]],	[[[ctanf128x]]],
		  [[[casinf128x]]],	[[[cacosf128x]]],	[[[catanf128x]]],	[[[]]],
		  [[[csinhf128x]]],	[[[ccoshf128x]]],	[[[ctanhf128x]]],
		  [[[casinhf128x]]],	[[[cacoshf128x]]],	[[[catanhf128x]]],
		  [[[cexpf128x]]],	[[[]]],			[[[]]],
		  [[[clogf128x]]],	[[[clog10f128x]]],	[[[]]],			[[[]]],
		  [[[cpowf128x]]],	[[[csqrtf128x]]],	[[[]]],			[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])


/** --------------------------------------------------------------------
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

mmux_pointer_t
mmux_pointer_bitwise_and (mmux_pointer_t op, mmux_uintptr_t mask)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr  = (mmux_uintptr_t)op;
  op_uintptr &= mask;
  op          = (mmux_pointer_t)op_uintptr;
  return op;
}
mmux_pointer_t
mmux_pointer_bitwise_or (mmux_pointer_t op, mmux_uintptr_t mask)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr  = (mmux_uintptr_t)op;
  op_uintptr |= mask;
  op          = (mmux_pointer_t)op_uintptr;
  return op;
}
mmux_pointer_t
mmux_pointer_bitwise_xor (mmux_pointer_t op, mmux_uintptr_t mask)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr  = (mmux_uintptr_t)op;
  op_uintptr ^= mask;
  op          = (mmux_pointer_t)op_uintptr;
  return op;
}
mmux_pointer_t
mmux_pointer_bitwise_not (mmux_pointer_t op)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr = (mmux_uintptr_t)op;
  op_uintptr = ~ op_uintptr;
  op         = (mmux_pointer_t)op_uintptr;
  return op;
}
mmux_pointer_t
mmux_pointer_bitwise_shl (mmux_pointer_t op, mmux_sint_t nbits)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr   = (mmux_uintptr_t)op;
  op_uintptr <<= nbits;
  op           = (mmux_pointer_t)op_uintptr;
  return op;
}
mmux_pointer_t
mmux_pointer_bitwise_shr (mmux_pointer_t op, mmux_sint_t nbits)
{
  mmux_uintptr_t	op_uintptr;

  op_uintptr   = (mmux_uintptr_t)op;
  op_uintptr >>= nbits;
  op           = (mmux_pointer_t)op_uintptr;
  return op;
}

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_BITWISE_FUNCS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_$1_t
mmux_$1_bitwise_and (mmux_$1_t op1, mmux_$1_t op2)
{
  return (op1 & op2);
}
mmux_$1_t
mmux_$1_bitwise_or (mmux_$1_t op1, mmux_$1_t op2)
{
  return (op1 | op2);
}
mmux_$1_t
mmux_$1_bitwise_xor (mmux_$1_t op1, mmux_$1_t op2)
{
  return (op1 ^ op2);
}
mmux_$1_t
mmux_$1_bitwise_not (mmux_$1_t op)
{
  return (~ op);
}
mmux_$1_t
mmux_$1_bitwise_shl (mmux_$1_t op, mmux_sint_t nbits)
{
  return (op << nbits);
}
mmux_$1_t
mmux_$1_bitwise_shr (mmux_$1_t op, mmux_sint_t nbits)
{
  return (op >> nbits);
}
]]])]]])

DEFINE_BITWISE_FUNCS([[[schar]]])
DEFINE_BITWISE_FUNCS([[[uchar]]])
DEFINE_BITWISE_FUNCS([[[sshort]]])
DEFINE_BITWISE_FUNCS([[[ushort]]])
DEFINE_BITWISE_FUNCS([[[sint]]])
DEFINE_BITWISE_FUNCS([[[uint]]])
DEFINE_BITWISE_FUNCS([[[slong]]])
DEFINE_BITWISE_FUNCS([[[ulong]]])
DEFINE_BITWISE_FUNCS([[[sllong]]],	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_BITWISE_FUNCS([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_BITWISE_FUNCS([[[sint8]]])
DEFINE_BITWISE_FUNCS([[[uint8]]])
DEFINE_BITWISE_FUNCS([[[sint16]]])
DEFINE_BITWISE_FUNCS([[[uint16]]])
DEFINE_BITWISE_FUNCS([[[sint32]]])
DEFINE_BITWISE_FUNCS([[[uint32]]])
DEFINE_BITWISE_FUNCS([[[sint64]]])
DEFINE_BITWISE_FUNCS([[[uint64]]])

DEFINE_BITWISE_FUNCS([[[ssize]]])
DEFINE_BITWISE_FUNCS([[[usize]]])
DEFINE_BITWISE_FUNCS([[[sintmax]]])
DEFINE_BITWISE_FUNCS([[[uintmax]]])
DEFINE_BITWISE_FUNCS([[[sintptr]]])
DEFINE_BITWISE_FUNCS([[[uintptr]]])
DEFINE_BITWISE_FUNCS([[[ptrdiff]]])
DEFINE_BITWISE_FUNCS([[[mode]]])
DEFINE_BITWISE_FUNCS([[[off]]])
DEFINE_BITWISE_FUNCS([[[pid]]])
DEFINE_BITWISE_FUNCS([[[uid]]])
DEFINE_BITWISE_FUNCS([[[gid]]])
DEFINE_BITWISE_FUNCS([[[wchar]]])
DEFINE_BITWISE_FUNCS([[[wint]]])


/* end of file */
