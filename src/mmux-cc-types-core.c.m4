/*
  Part of: MMUX CC Types
  Contents: core type functions
  Date: Sep 18, 2024

  Abstract

	This module implements core type functions.

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

#include <mmux-cc-types-internals.h>


/** --------------------------------------------------------------------
 ** Integer non-alias number functions: abs, min, max.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_STYPE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$5]]],[[[
mmux_$1_t
mmux_$1_abs (mmux_$1_t op)
{
  return ((mmux_$1_is_negative(op))? mmux_$1_neg(op) : op);
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

m4_define([[[DEFINE_UTYPE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$5]]],[[[
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
DEFINE_STYPE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_UTYPE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

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

m4_define([[[DEFINE_TYPE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
inline mmux_$1_t mmux_$1_abs (mmux_$1_t X)              { return mmux_$1($2(X.value));    }
inline mmux_$1_t mmux_$1_max (mmux_$1_t X, mmux_$1_t Y) { return mmux_$1($3(X.value, Y.value)); }
inline mmux_$1_t mmux_$1_min (mmux_$1_t X, mmux_$1_t Y) { return mmux_$1($4(X.value, Y.value)); }
]]])]]])

DEFINE_TYPE_FUNCTIONS([[[flonumfl]]],		[[[fabsf]]],    [[[fmaxf]]],     [[[fminf]]])
DEFINE_TYPE_FUNCTIONS([[[flonumdb]]],		[[[fabs]]],     [[[fmax]]],      [[[fmin]]])
DEFINE_TYPE_FUNCTIONS([[[flonumldb]]],		[[[fabsl]]],    [[[fmaxl]]],     [[[fminl]]])

DEFINE_TYPE_FUNCTIONS([[[flonumf32]]],		[[[fabsf32]]],  [[[fmaxf32]]],   [[[fminf32]]])
DEFINE_TYPE_FUNCTIONS([[[flonumf64]]],		[[[fabsf64]]],  [[[fmaxf64]]],   [[[fminf64]]])
DEFINE_TYPE_FUNCTIONS([[[flonumf128]]],		[[[fabsf128]]], [[[fmaxf128]]],  [[[fminf128]]])

DEFINE_TYPE_FUNCTIONS([[[flonumf32x]]],		[[[fabsf32x]]], [[[fmaxf32x]]],  [[[fminf32x]]])
DEFINE_TYPE_FUNCTIONS([[[flonumf64x]]],		[[[fabsf64x]]], [[[fmaxf64x]]],  [[[fminf64x]]])
DEFINE_TYPE_FUNCTIONS([[[flonumf128x]]],	[[[fabsf128x]]],[[[fmaxf128x]]], [[[fminf128x]]])


/** --------------------------------------------------------------------
 ** Aliased integer number type functions: minimum, maximum, abs, min, max.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[DEFINE_TYPE_FUNCTIONS]]],[[[
mmux_$1_t
mmux_$1_maximum (void)
{
  return mmux_$1(mmux_$2_maximum().value);
}
mmux_$1_t
mmux_$1_minimum (void)
{
  return mmux_$1(mmux_$2_minimum().value);
}
mmux_$1_t
mmux_$1_abs (mmux_$1_t op)
{
  return mmux_$1(mmux_$2_abs(mmux_$2(op.value)).value);
}
mmux_$1_t
mmux_$1_max (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(mmux_$2_max(mmux_$2(op1.value), mmux_$2(op2.value)).value);
}
mmux_$1_t
mmux_$1_min (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(mmux_$2_min(mmux_$2(op1.value), mmux_$2(op2.value)).value);
}

mmux_standard_$1_t
mmux_standard_$1_maximum (void)
{
  return mmux_standard_$2_maximum();
}
mmux_standard_$1_t
mmux_standard_$1_minimum (void)
{
  return mmux_standard_$2_minimum();
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
DEFINE_TYPE_FUNCTIONS(time,	MMUX_CC_TYPES_STEM_ALIAS_TIME)
DEFINE_TYPE_FUNCTIONS(socklen,	MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN)
DEFINE_TYPE_FUNCTIONS(rlim,	MMUX_CC_TYPES_STEM_ALIAS_RLIM)


/** --------------------------------------------------------------------
 ** Some complex number type functions: real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - real part function
m4_dnl $3 - imag part function
m4_dnl $4 - make rectangular function
m4_dnl $5 - magnitude function
m4_dnl $6 - argument function
m4_dnl $7 - conjugate function
m4_dnl $8 - atan2 function
m4_dnl $9 - real part sqrt function
m4_dnl $10 - C preprocessor symbol used to exclude the code if the type is not supported.
m4_define([[[DEFINE_COMPLEX_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$10]]],[[[
mmux_standard_$1_t
mmux_standard_$1_make_rectangular (mmux_standard_$1_part_t re, mmux_standard_$1_part_t im)
{
  return $4(re, im);
}
mmux_$1_t
mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im)
{
  return ((mmux_$1_t){ $4(re.value, im.value) });
}
mmux_$1_part_t
mmux_$1_real_part (mmux_$1_t Z)
{
  return mmux_$1_part($2(Z.value));
}
mmux_$1_part_t
mmux_$1_imag_part (mmux_$1_t Z)
{
  return mmux_$1_part($3(Z.value));
}
inline mmux_$1_part_t
mmux_$1_abs (mmux_$1_t Z)
{
  return mmux_$1_part($9($2(Z.value) * $2(Z.value) + $3(Z.value) * $3(Z.value)));
}
inline mmux_$1_part_t
mmux_$1_arg (mmux_$1_t Z)
{
  return mmux_$1_part($8($3(Z.value), $2(Z.value)));
}
inline mmux_$1_t
mmux_$1_conj (mmux_$1_t Z)
{
  return ((mmux_$1_t){ $4($2(Z.value), - $3(Z.value)) });
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[flonumcfl]]],  [[[crealf]]], [[[cimagf]]], [[[CMPLXF]]],
			 [[[cabsf]]],     [[[cargf]]],  [[[conjf]]],  [[[atan2f]]],
			 [[[sqrtf]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcdb]]],  [[[creal]]],  [[[cimag]]],  [[[CMPLX]]],
			 [[[cabs]]],      [[[carg]]],   [[[conj]]],   [[[atan2]]],
			 [[[sqrt]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcldb]]], [[[creall]]], [[[cimagl]]], [[[CMPLXL]]],
			 [[[cabsl]]],     [[[cargl]]],  [[[conjl]]],  [[[atan2l]]],
			 [[[sqrtl]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf32]]],  [[[crealf32]]], [[[cimagf32]]], [[[CMPLXF32]]],
			 [[[cabsf32]]],     [[[cargf32]]],  [[[conjf32]]],  [[[atan2f32]]],
			 [[[sqrtf32]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf64]]],  [[[crealf64]]], [[[cimagf64]]], [[[CMPLXF64]]],
			 [[[cabsf64]]],     [[[cargf64]]],  [[[conjf64]]],  [[[atan2f64]]],
			 [[[sqrtf64]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf128]]], [[[crealf128]]],[[[cimagf128]]],[[[CMPLXF128]]],
			 [[[cabsf128]]],    [[[cargf128]]], [[[conjf128]]], [[[atan2f128]]],
			 [[[sqrtf128]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf32x]]],  [[[crealf32x]]], [[[cimagf32x]]], [[[CMPLXF32X]]],
			 [[[cabsf32x]]],     [[[cargf32x]]],  [[[conjf32x]]],  [[[atan2f32x]]],
			 [[[sqrtf32x]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf64x]]],  [[[crealf64x]]], [[[cimagf64x]]], [[[CMPLXF64X]]],
			 [[[cabsf64x]]],     [[[cargf64x]]],  [[[conjf64x]]],  [[[atan2f64x]]],
			 [[[sqrtf64x]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])

DEFINE_COMPLEX_FUNCTIONS([[[flonumcf128x]]], [[[crealf128x]]],[[[cimagf128x]]],[[[CMPLXF128X]]],
			 [[[cabsf128x]]],    [[[cargf128x]]], [[[conjf128x]]], [[[atan2f128x]]],
			 [[[sqrtf128x]]],
			 [[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: signed integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_SIGNED_INTEGER_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) == X.value)? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) < X.value)? true : false;
}
bool
mmux_$1_is_negative (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) > X.value)? true : false;
}
bool
mmux_$1_is_non_positive (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) >= X.value)? true : false;
}
bool
mmux_$1_is_non_negative (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) <= X.value)? true : false;
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
DEFINE_SIGNED_INTEGER_PREDICATES([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])

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
DEFINE_SIGNED_INTEGER_PREDICATES([[[time]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: unsigned integer numbers.
 ** ----------------------------------------------------------------- */

bool
mmux_pointer_is_zero (mmux_pointer_t X)
{
  return (NULL == X)? true : false;
}
bool
mmux_pointer_is_positive (mmux_pointer_t X)
{
  /* Turn off because when comparing pointers it raises a warning. */
  _Pragma("GCC diagnostic push");
  _Pragma("GCC diagnostic ignored \"-Wextra\"");
  return (NULL < X)? true : false;
  _Pragma("GCC diagnostic pop");
}
bool
mmux_pointer_is_negative (mmux_pointer_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_pointer_is_non_positive (mmux_pointer_t X)
{
  return mmux_pointer_is_zero(X);
}
bool
mmux_pointer_is_non_negative (mmux_pointer_t X MMUX_CC_TYPES_UNUSED)
{
  return true;
}
bool
mmux_pointer_is_nan (mmux_pointer_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_pointer_is_infinite (mmux_pointer_t X MMUX_CC_TYPES_UNUSED)
{
  return false;
}

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_UNSIGNED_INTEGER_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (mmux_standard_$1_literal(0) == X.value)? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t X)
{
  /* Turn off because when comparing pointers it raises a warning. */
  _Pragma("GCC diagnostic push");
  _Pragma("GCC diagnostic ignored \"-Wextra\"");
  return (mmux_standard_$1_literal(0) < X.value)? true : false;
  _Pragma("GCC diagnostic pop");
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

DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uchar]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ushort]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[uint]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ulong]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

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
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[socklen]]])
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[rlim]]])


/** --------------------------------------------------------------------
 ** Core C language predicates: floating-point real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t X)
{
  return (FP_ZERO == (fpclassify(X.value)))? true : false;
}
bool
mmux_$1_is_nan (mmux_$1_t X)
{
  return (FP_NAN == (fpclassify(X.value)))? true : false;
}
bool
mmux_$1_is_infinite (mmux_$1_t X)
{
  return (FP_INFINITE == (fpclassify(X.value)))? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X.value)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_$1_constant_zero() < X.value)? true : false;
  }
}
bool
mmux_$1_is_negative (mmux_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X.value)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_$1_constant_zero() > X.value)? true : false;
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
    return (mmux_standard_$1_constant_zero() > X.value)? true : false;
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
    return (mmux_standard_$1_constant_zero() < X.value)? true : false;
  }
}
]]])]]])

DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumfl]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumdb]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_REAL_FLONUMFL_NUMBER_PREDICATES([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
__attribute__((__const__)) mmux_$1_t
mmux_$1_mod (mmux_$1_t A, mmux_$1_t B)
{
  return mmux_$1($2(A.value, B.value));
}
__attribute__((__const__)) mmux_$1_t
mmux_$1_incr (mmux_$1_t A)
{
  return mmux_$1(A.value + mmux_standard_$1_constant_one());
}
__attribute__((__const__)) mmux_$1_t
mmux_$1_decr (mmux_$1_t A)
{
  return mmux_$1(A.value - mmux_standard_$1_constant_one());
}
]]])]]])

DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumfl]]],	[[[fmodf]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumdb]]],	[[[fmod]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumldb]]],	[[[fmodl]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf32]]],	[[[fmodf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf64]]],	[[[fmodf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf128]]],	[[[fmodf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf32x]]],	[[[fmodf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf64x]]],	[[[fmodf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_REAL_FLONUMFL_NUMBER_ARITHMETICS_FUNCTIONS([[[flonumf128x]]],	[[[fmodf128x]]],[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Core C language predicates: complex floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_NUMBER_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_is_zero (mmux_$1_t Z)
{
  mmux_$1_part_t	re = mmux_$1_real_part(Z), im = mmux_$1_imag_part(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
bool
mmux_$1_is_positive (mmux_$1_t Z MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_negative (mmux_$1_t Z MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_non_positive (mmux_$1_t Z MMUX_CC_TYPES_UNUSED)
{
  return false;
}
bool
mmux_$1_is_non_negative (mmux_$1_t Z MMUX_CC_TYPES_UNUSED)
{
  return false;
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

DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcfl]]],	[[[flonumfl]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcdb]]],	[[[flonumdb]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcldb]]],	[[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf32]]],	[[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf64]]],	[[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf128]]],	[[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf32x]]],	[[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf64x]]],	[[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_COMPLEX_NUMBER_PREDICATES([[[flonumcf128x]]],	[[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Comparison core functions.
 ** ----------------------------------------------------------------- */

bool
mmux_pointer_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 == op2)? true : false;
}
mmux_sint_t
mmux_pointer_cmp (mmux_pointer_t op1, mmux_pointer_t op2)
{
  if (op1 > op2) {
    return mmux_sint(+1);
  } else if (op1 < op2) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
bool mmux_pointer_greater       (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 >  op2)? true : false; }
bool mmux_pointer_less          (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 <  op2)? true : false; }
bool mmux_pointer_greater_equal (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 >= op2)? true : false; }
bool mmux_pointer_less_equal    (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 <= op2)? true : false; }

/* ------------------------------------------------------------------ */

#undef  DECL
#define DECL		__attribute__((__const__))

m4_define([[[DEFINE_COMPARISON_EQUAL_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DECL bool mmux_$1_equal         (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value == op2.value)? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_INTEGER_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (op1.value > op2.value) {
    return mmux_sint(+1);
  } else if (op1.value < op2.value) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value >  op2.value)? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value <  op2.value)? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value >= op2.value)? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value <= op2.value)? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_FLONUMFL_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (mmux_$1_greater(op1, op2)) {
    return mmux_sint(+1);
  } else if (mmux_$1_less(op1, op2)) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (     isgreater(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (        isless(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (isgreaterequal(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (   islessequal(op1.value,op2.value))? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_COMPLEX_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$3]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_cmp(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_greater (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_greater(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_less (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_less(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_greater_equal(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_less_equal (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_less_equal(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[char]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[schar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uchar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sshort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ushort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[slong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ulong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumfl]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumdb]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcfl]]],	[[[flonumfl]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcdb]]],	[[[flonumdb]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcldb]]],	[[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf32]]],	[[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf64]]],	[[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf128]]],	[[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf32x]]],	[[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf64x]]],	[[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf128x]]],	[[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

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
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[time]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[socklen]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex type stem
m4_dnl $2 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  return (mmux_$1_less_equal(mmux_$1_abs(mmux_$1_sub(op1,op2)), mmux_$1_abs(margin)))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  return (mmux_$1_less_equal(mmux_$1_abs(mmux_$1_sub(op1,op2)),
			     mmux_$1_mul(mmux_$1_abs(epsilon),
					 mmux_$1_max(mmux_$1_abs(op1),
						     mmux_$1_abs(op2)))))? true : false;
}
]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - complex type stem
m4_dnl $2 - real part type stem
m4_dnl $3 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
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

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumfl]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumdb]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcfl]]],    [[[flonumfl]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcdb]]],    [[[flonumdb]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcldb]]],   [[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf32]]],  [[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf64]]],  [[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf128]]], [[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf32x]]], [[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf64x]]], [[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf128x]]],[[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Additional mathematical functions no implemented by libc.
 ** ----------------------------------------------------------------- */

/* 2^Z = exp( log ( 2^Z ) ) = exp( Z * log( 2 ) ) */
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcfl_t
cexp2f (mmux_standard_flonumcfl_t Z)
{
  return cexpf(Z * CMPLXF(M_LN2, 0.0));
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcdb_t
cexp2 (mmux_standard_flonumcdb_t Z)
{
  return cexp(Z * CMPLX(M_LN2, 0.0));
}
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcldb_t
cexp2l (mmux_standard_flonumcldb_t Z)
{
  return cexpl(Z * CMPLXL(M_LN2l, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32_t
cexp2f32 (mmux_standard_flonumcf32_t Z)
{
  return cexpf32(Z * CMPLXF32(M_LN2f32, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64_t
cexp2f64 (mmux_standard_flonumcf64_t Z)
{
  return cexpf64(Z * CMPLXF64(M_LN2f64, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128_t
cexp2f128 (mmux_standard_flonumcf128_t Z)
{
  return cexpf128(Z * CMPLXF128(M_LN2f128, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32x_t
cexp2f32x (mmux_standard_flonumcf32x_t Z)
{
  return cexpf32x(Z * CMPLXF32X(M_LN2f32x, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64x_t
cexp2f64x (mmux_standard_flonumcf64x_t Z)
{
  return cexpf64x(Z * CMPLXF64X(M_LN2f64x, 0.0));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128x_t
cexp2f128x (mmux_standard_flonumcf128x_t Z)
{
  return cexpf128x(Z * CMPLXF128X(M_LN2f128x, 0.0));
}
#endif

/* ------------------------------------------------------------------ */

/* 10^Z = exp( log ( 10^Z ) ) = exp( Z * log( 10 ) ) */
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcfl_t
cexp10f (mmux_standard_flonumcfl_t Z)
{
  return cexpf(Z * CMPLXF(M_LN10, 0.0));
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcdb_t
cexp10 (mmux_standard_flonumcdb_t Z)
{
  return cexp(Z * CMPLX(M_LN10, 0.0));
}
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcldb_t
cexp10l (mmux_standard_flonumcldb_t Z)
{
  return cexpl(Z * CMPLXL(M_LN10l, mmux_standard_flonumldb_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32_t
cexp10f32 (mmux_standard_flonumcf32_t Z)
{
  return cexpf32(Z * CMPLXF32(M_LN10f32, mmux_standard_flonumf32_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64_t
cexp10f64 (mmux_standard_flonumcf64_t Z)
{
  return cexpf64(Z * CMPLXF64(M_LN10f64, mmux_standard_flonumf64_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128_t
cexp10f128 (mmux_standard_flonumcf128_t Z)
{
  return cexpf128(Z * CMPLXF128(M_LN10f128, mmux_standard_flonumf128_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32x_t
cexp10f32x (mmux_standard_flonumcf32x_t Z)
{
  return cexpf32x(Z * CMPLXF32X(M_LN10f32x, mmux_standard_flonumf32x_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64x_t
cexp10f64x (mmux_standard_flonumcf64x_t Z)
{
  return cexpf64x(Z * CMPLXF64X(M_LN10f64x, mmux_standard_flonumf64x_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128x_t
cexp10f128x (mmux_standard_flonumcf128x_t Z)
{
  return cexpf128x(Z * CMPLXF128X(M_LN10f128x, mmux_standard_flonumf128x_literal(0.0)));
}
#endif

/* ------------------------------------------------------------------ */

/* log_2 Z = log Z / log 2 */
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcfl_t
clog2f (mmux_standard_flonumcfl_t Z)
{
  return (clogf(Z) / CMPLXF(M_LN2, mmux_standard_flonumfl_literal(0.0)));
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcdb_t
clog2 (mmux_standard_flonumcdb_t Z)
{
  return (clog(Z) / CMPLX(M_LN2, 0.0));
}
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcldb_t
clog2l (mmux_standard_flonumcldb_t Z)
{
  return (clogl(Z) / CMPLXL(M_LN2l, mmux_standard_flonumldb_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32_t
clog2f32 (mmux_standard_flonumcf32_t Z)
{
  return (clogf32(Z) / CMPLXF32(M_LN2f32, mmux_standard_flonumf32_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64_t
clog2f64 (mmux_standard_flonumcf64_t Z)
{
  return (clogf64(Z) / CMPLXF64(M_LN2f64, mmux_standard_flonumf64_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128_t
clog2f128 (mmux_standard_flonumcf128_t Z)
{
  return (clogf128(Z) / CMPLXF128(M_LN2f128, mmux_standard_flonumf128_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32x_t
clog2f32x (mmux_standard_flonumcf32x_t Z)
{
  return (clogf32x(Z) / CMPLXF32X(M_LN2f32x, mmux_standard_flonumf32x_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64x_t
clog2f64x (mmux_standard_flonumcf64x_t Z)
{
  return (clogf64x(Z) / CMPLXF64X(M_LN2f64x, mmux_standard_flonumf64x_literal(0.0)));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128x_t
clog2f128x (mmux_standard_flonumcf128x_t Z)
{
  return (clogf128x(Z) / CMPLXF128X(M_LN2f128x, mmux_standard_flonumf128x_literal(0.0)));
}
#endif

/* ------------------------------------------------------------------ */

/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z ))
 */
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcfl_t
ccbrtf (mmux_standard_flonumcfl_t Z)
{
  constexpr auto one_third = CMPLXF(mmux_standard_flonumfl_literal(1.0) / mmux_standard_flonumfl_literal(3.0),
				    mmux_standard_flonumfl_literal(0.0));
  return cexpf(one_third * clogf(Z));
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcdb_t
ccbrt (mmux_standard_flonumcdb_t Z)
{
  constexpr auto one_third = CMPLX(mmux_standard_flonumdb_literal(1.0) / mmux_standard_flonumdb_literal(3.0),
				   mmux_standard_flonumdb_literal(0.0));
  return cexp(one_third * clog(Z));
}
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcldb_t
ccbrtl (mmux_standard_flonumcldb_t Z)
{
  constexpr auto one_third = CMPLXL(mmux_standard_flonumldb_literal(1.0) / mmux_standard_flonumldb_literal(3.0),
				    mmux_standard_flonumldb_literal(0.0));
  return cexpl(one_third * clogl(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32_t
ccbrtf32 (mmux_standard_flonumcf32_t Z)
{
  constexpr auto one_third = CMPLXF32(mmux_standard_flonumf32_literal(1.0) / mmux_standard_flonumf32_literal(3.0),
				      mmux_standard_flonumf32_literal(0.0));
  return cexpf32(one_third * clogf32(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64_t
ccbrtf64 (mmux_standard_flonumcf64_t Z)
{
  constexpr auto one_third = CMPLXF64(mmux_standard_flonumf64_literal(1.0) / mmux_standard_flonumf64_literal(3.0),
				      mmux_standard_flonumf64_literal(0.0));
  return cexpf64(one_third * clogf64(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128_t
ccbrtf128 (mmux_standard_flonumcf128_t Z)
{
  constexpr auto one_third = CMPLXF128(mmux_standard_flonumf128_literal(1.0) / mmux_standard_flonumf128_literal(3.0),
				       mmux_standard_flonumf128_literal(0.0));
  return cexpf128(one_third * clogf128(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf32x_t
ccbrtf32x (mmux_standard_flonumcf32x_t Z)
{
  constexpr auto one_third = CMPLXF32X(mmux_standard_flonumf32x_literal(1.0) / mmux_standard_flonumf32x_literal(3.0),
				       mmux_standard_flonumf32x_literal(0.0));
  return cexpf32x(one_third * clogf32x(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf64x_t
ccbrtf64x (mmux_standard_flonumcf64x_t Z)
{
  constexpr auto one_third = CMPLXF64X(mmux_standard_flonumf64x_literal(1.0) / mmux_standard_flonumf64x_literal(3.0),
				       mmux_standard_flonumf64x_literal(0.0));
  return cexpf64x(one_third * clogf64x(Z));
}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcf128x_t
ccbrtf128x (mmux_standard_flonumcf128x_t Z)
{
  constexpr auto one_third = CMPLXF128X(mmux_standard_flonumf128x_literal(1.0) / mmux_standard_flonumf128x_literal(3.0),
					mmux_standard_flonumf128x_literal(0.0));
  return cexpf128x(one_third * clogf128x(Z));
}
#endif


/** --------------------------------------------------------------------
 ** Mathematics: real float, double, long double floating-point functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[
mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op)
{
  return mmux_flonum$1($3(op.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($3(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_sint_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($3(op1.value, op2.value));
}]]])
m4_divert(0)m4_dnl
#ifdef MMUX_CC_TYPES_HAS_FLONUMFL
DEFINE_UNARY_MATH_FUNCTION(fl,		sin,		sinf)
DEFINE_UNARY_MATH_FUNCTION(fl,		cos,		cosf)
DEFINE_UNARY_MATH_FUNCTION(fl,		tan,		tanf)

DEFINE_UNARY_MATH_FUNCTION(fl,		asin,		asinf)
DEFINE_UNARY_MATH_FUNCTION(fl,		acos,		acosf)
DEFINE_UNARY_MATH_FUNCTION(fl,		atan,		atanf)
DEFINE_BINARY_MATH_FUNCTION(fl,		atan2,		atan2f)

DEFINE_UNARY_MATH_FUNCTION(fl,		sinh,		sinhf)
DEFINE_UNARY_MATH_FUNCTION(fl,		cosh,		coshf)
DEFINE_UNARY_MATH_FUNCTION(fl,		tanh,		tanhf)

DEFINE_UNARY_MATH_FUNCTION(fl,		asinh,		asinhf)
DEFINE_UNARY_MATH_FUNCTION(fl,		acosh,		acoshf)
DEFINE_UNARY_MATH_FUNCTION(fl,		atanh,		atanhf)

DEFINE_UNARY_MATH_FUNCTION(fl,		exp,		expf)
DEFINE_UNARY_MATH_FUNCTION(fl,		exp2,		exp2f)
DEFINE_UNARY_MATH_FUNCTION(fl,		exp10,		exp10f)

DEFINE_UNARY_MATH_FUNCTION(fl,		log,		logf)
DEFINE_UNARY_MATH_FUNCTION(fl,		log10,		log10f)
DEFINE_UNARY_MATH_FUNCTION(fl,		log2,		log2f)
DEFINE_UNARY_MATH_FUNCTION(fl,		logb,		logbf)

DEFINE_BINARY_MATH_FUNCTION(fl,		pow,		powf)
DEFINE_UNARY_MATH_FUNCTION(fl,		sqrt,		sqrtf)
DEFINE_UNARY_MATH_FUNCTION(fl,		cbrt,		cbrtf)
DEFINE_BINARY_MATH_FUNCTION(fl,		hypot,		hypotf)

DEFINE_UNARY_MATH_FUNCTION(fl,		expm1,		expm1f)
DEFINE_UNARY_MATH_FUNCTION(fl,		log1p,		log1pf)

DEFINE_UNARY_MATH_FUNCTION(fl,		erf,		erff)
DEFINE_UNARY_MATH_FUNCTION(fl,		erfc,		erfcf)

DEFINE_UNARY_MATH_FUNCTION(fl,		lgamma,		lgammaf)
DEFINE_UNARY_MATH_FUNCTION(fl,		tgamma,		tgammaf)

DEFINE_UNARY_MATH_FUNCTION(fl,		j0,		j0f)
DEFINE_UNARY_MATH_FUNCTION(fl,		j1,		j1f)
DEFINE_BINARY_SINT_MATH_FUNCTION(fl,	jn,		jnf)

DEFINE_UNARY_MATH_FUNCTION(fl,		y0,		y0f)
DEFINE_UNARY_MATH_FUNCTION(fl,		y1,		y1f)
DEFINE_BINARY_SINT_MATH_FUNCTION(fl,	yn,		ynf)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMDB
DEFINE_UNARY_MATH_FUNCTION(db,		sin,		sin)
DEFINE_UNARY_MATH_FUNCTION(db,		cos,		cos)
DEFINE_UNARY_MATH_FUNCTION(db,		tan,		tan)

DEFINE_UNARY_MATH_FUNCTION(db,		asin,		asin)
DEFINE_UNARY_MATH_FUNCTION(db,		acos,		acos)
DEFINE_UNARY_MATH_FUNCTION(db,		atan,		atan)
DEFINE_BINARY_MATH_FUNCTION(db,		atan2,		atan2)

DEFINE_UNARY_MATH_FUNCTION(db,		sinh,		sinh)
DEFINE_UNARY_MATH_FUNCTION(db,		cosh,		cosh)
DEFINE_UNARY_MATH_FUNCTION(db,		tanh,		tanh)

DEFINE_UNARY_MATH_FUNCTION(db,		asinh,		asinh)
DEFINE_UNARY_MATH_FUNCTION(db,		acosh,		acosh)
DEFINE_UNARY_MATH_FUNCTION(db,		atanh,		atanh)

DEFINE_UNARY_MATH_FUNCTION(db,		exp,		exp)
DEFINE_UNARY_MATH_FUNCTION(db,		exp2,		exp2)
DEFINE_UNARY_MATH_FUNCTION(db,		exp10,		exp10)

DEFINE_UNARY_MATH_FUNCTION(db,		log,		log)
DEFINE_UNARY_MATH_FUNCTION(db,		log10,		log10)
DEFINE_UNARY_MATH_FUNCTION(db,		log2,		log2)
DEFINE_UNARY_MATH_FUNCTION(db,		logb,		logb)

DEFINE_BINARY_MATH_FUNCTION(db,		pow,		pow)
DEFINE_UNARY_MATH_FUNCTION(db,		sqrt,		sqrt)
DEFINE_UNARY_MATH_FUNCTION(db,		cbrt,		cbrt)
DEFINE_BINARY_MATH_FUNCTION(db,		hypot,		hypot)

DEFINE_UNARY_MATH_FUNCTION(db,		expm1,		expm1)
DEFINE_UNARY_MATH_FUNCTION(db,		log1p,		log1p)

DEFINE_UNARY_MATH_FUNCTION(db,		erf,		erf)
DEFINE_UNARY_MATH_FUNCTION(db,		erfc,		erfc)

DEFINE_UNARY_MATH_FUNCTION(db,		lgamma,		lgamma)
DEFINE_UNARY_MATH_FUNCTION(db,		tgamma,		tgamma)

DEFINE_UNARY_MATH_FUNCTION(db,		j0,		j0)
DEFINE_UNARY_MATH_FUNCTION(db,		j1,		j1)
DEFINE_BINARY_SINT_MATH_FUNCTION(db,	jn,		jn)

DEFINE_UNARY_MATH_FUNCTION(db,		y0,		y0)
DEFINE_UNARY_MATH_FUNCTION(db,		y1,		y1)
DEFINE_BINARY_SINT_MATH_FUNCTION(db,	yn,		yn)
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
DEFINE_UNARY_MATH_FUNCTION(ldb,		sin,		sinl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		cos,		cosl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		tan,		tanl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		asin,		asinl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		acos,		acosl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		atan,		atanl)
DEFINE_BINARY_MATH_FUNCTION(ldb,	atan2,		atan2l)

DEFINE_UNARY_MATH_FUNCTION(ldb,		sinh,		sinhl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		cosh,		coshl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		tanh,		tanhl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		asinh,		asinhl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		acosh,		acoshl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		atanh,		atanhl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		exp,		expl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		exp2,		exp2l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		exp10,		exp10l)

DEFINE_UNARY_MATH_FUNCTION(ldb,		log,		logl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		log10,		log10l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		log2,		log2l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		logb,		logbl)

DEFINE_BINARY_MATH_FUNCTION(ldb,	pow,		powl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		sqrt,		sqrtl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		cbrt,		cbrtl)
DEFINE_BINARY_MATH_FUNCTION(ldb,	hypot,		hypotl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		expm1,		expm1l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		log1p,		log1pl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		erf,		erfl)
DEFINE_UNARY_MATH_FUNCTION(ldb,		erfc,		erfcl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		lgamma,		lgammal)
DEFINE_UNARY_MATH_FUNCTION(ldb,		tgamma,		tgammal)

DEFINE_UNARY_MATH_FUNCTION(ldb,		j0,		j0l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		j1,		j1l)
DEFINE_BINARY_SINT_MATH_FUNCTION(ldb,	jn,		jnl)

DEFINE_UNARY_MATH_FUNCTION(ldb,		y0,		y0l)
DEFINE_UNARY_MATH_FUNCTION(ldb,		y1,		y1l)
DEFINE_BINARY_SINT_MATH_FUNCTION(ldb,	yn,		ynl)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
DEFINE_UNARY_MATH_FUNCTION(cfl,		sin,		csinf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		cos,		ccosf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		tan,		ctanf)

DEFINE_UNARY_MATH_FUNCTION(cfl,		asin,		casinf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		acos,		cacosf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		atan,		catanf)

DEFINE_UNARY_MATH_FUNCTION(cfl,		sinh,		csinhf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		cosh,		ccoshf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		tanh,		ctanhf)

DEFINE_UNARY_MATH_FUNCTION(cfl,		asinh,		casinhf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		acosh,		cacoshf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		atanh,		catanhf)

DEFINE_UNARY_MATH_FUNCTION(cfl,		exp,		cexpf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		exp2,		cexp2f)
DEFINE_UNARY_MATH_FUNCTION(cfl,		exp10,		cexp10f)

DEFINE_UNARY_MATH_FUNCTION(cfl,		log,		clogf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		log10,		clog10f)
DEFINE_UNARY_MATH_FUNCTION(cfl,		log2,		clog2f)

DEFINE_BINARY_MATH_FUNCTION(cfl,	pow,		cpowf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		sqrt,		csqrtf)
DEFINE_UNARY_MATH_FUNCTION(cfl,		cbrt,		ccbrtf)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
DEFINE_UNARY_MATH_FUNCTION(cdb,		sin,		csin)
DEFINE_UNARY_MATH_FUNCTION(cdb,		cos,		ccos)
DEFINE_UNARY_MATH_FUNCTION(cdb,		tan,		ctan)

DEFINE_UNARY_MATH_FUNCTION(cdb,		asin,		casin)
DEFINE_UNARY_MATH_FUNCTION(cdb,		acos,		cacos)
DEFINE_UNARY_MATH_FUNCTION(cdb,		atan,		catan)

DEFINE_UNARY_MATH_FUNCTION(cdb,		sinh,		csinh)
DEFINE_UNARY_MATH_FUNCTION(cdb,		cosh,		ccosh)
DEFINE_UNARY_MATH_FUNCTION(cdb,		tanh,		ctanh)

DEFINE_UNARY_MATH_FUNCTION(cdb,		asinh,		casinh)
DEFINE_UNARY_MATH_FUNCTION(cdb,		acosh,		cacosh)
DEFINE_UNARY_MATH_FUNCTION(cdb,		atanh,		catanh)

DEFINE_UNARY_MATH_FUNCTION(cdb,		exp,		cexp)
DEFINE_UNARY_MATH_FUNCTION(cdb,		exp2,		cexp2)
DEFINE_UNARY_MATH_FUNCTION(cdb,		exp10,		cexp10)

DEFINE_UNARY_MATH_FUNCTION(cdb,		log,		clog)
DEFINE_UNARY_MATH_FUNCTION(cdb,		log10,		clog10)
DEFINE_UNARY_MATH_FUNCTION(cdb,		log2,		clog2)

DEFINE_BINARY_MATH_FUNCTION(cdb,	pow,		cpow)
DEFINE_UNARY_MATH_FUNCTION(cdb,		sqrt,		csqrt)
DEFINE_UNARY_MATH_FUNCTION(cdb,		cbrt,		ccbrt)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
DEFINE_UNARY_MATH_FUNCTION(cldb,	sin,		csinl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	cos,		ccosl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	tan,		ctanl)

DEFINE_UNARY_MATH_FUNCTION(cldb,	asin,		casinl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	acos,		cacosl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	atan,		catanl)

DEFINE_UNARY_MATH_FUNCTION(cldb,	sinh,		csinhl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	cosh,		ccoshl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	tanh,		ctanhl)

DEFINE_UNARY_MATH_FUNCTION(cldb,	asinh,		casinhl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	acosh,		cacoshl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	atanh,		catanhl)

DEFINE_UNARY_MATH_FUNCTION(cldb,	exp,		cexpl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	exp2,		cexp2l)
DEFINE_UNARY_MATH_FUNCTION(cldb,	exp10,		cexp10l)

DEFINE_UNARY_MATH_FUNCTION(cldb,	log,		clogl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	log10,		clog10l)
DEFINE_UNARY_MATH_FUNCTION(cldb,	log2,		clog2l)

DEFINE_BINARY_MATH_FUNCTION(cldb,	pow,		cpowl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	sqrt,		csqrtl)
DEFINE_UNARY_MATH_FUNCTION(cldb,	cbrt,		ccbrtl)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
DEFINE_UNARY_MATH_FUNCTION(cf32,	sin,		csinf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	cos,		ccosf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	tan,		ctanf32)

DEFINE_UNARY_MATH_FUNCTION(cf32,	asin,		casinf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	acos,		cacosf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	atan,		catanf32)

DEFINE_UNARY_MATH_FUNCTION(cf32,	sinh,		csinhf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	cosh,		ccoshf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	tanh,		ctanhf32)

DEFINE_UNARY_MATH_FUNCTION(cf32,	asinh,		casinhf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	acosh,		cacoshf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	atanh,		catanhf32)

DEFINE_UNARY_MATH_FUNCTION(cf32,	exp,		cexpf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	exp2,		cexp2f32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	exp10,		cexp10f32)

DEFINE_UNARY_MATH_FUNCTION(cf32,	log,		clogf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	log10,		clog10f32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	log2,		clog2f32)

DEFINE_BINARY_MATH_FUNCTION(cf32,	pow,		cpowf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	sqrt,		csqrtf32)
DEFINE_UNARY_MATH_FUNCTION(cf32,	cbrt,		ccbrtf32)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
DEFINE_UNARY_MATH_FUNCTION(cf64,	sin,		csinf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	cos,		ccosf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	tan,		ctanf64)

DEFINE_UNARY_MATH_FUNCTION(cf64,	asin,		casinf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	acos,		cacosf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	atan,		catanf64)

DEFINE_UNARY_MATH_FUNCTION(cf64,	sinh,		csinhf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	cosh,		ccoshf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	tanh,		ctanhf64)

DEFINE_UNARY_MATH_FUNCTION(cf64,	asinh,		casinhf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	acosh,		cacoshf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	atanh,		catanhf64)

DEFINE_UNARY_MATH_FUNCTION(cf64,	exp,		cexpf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	exp2,		cexp2f64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	exp10,		cexp10f64)

DEFINE_UNARY_MATH_FUNCTION(cf64,	log,		clogf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	log10,		clog10f64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	log2,		clog2f64)

DEFINE_BINARY_MATH_FUNCTION(cf64,	pow,		cpowf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	sqrt,		csqrtf64)
DEFINE_UNARY_MATH_FUNCTION(cf64,	cbrt,		ccbrtf64)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
DEFINE_UNARY_MATH_FUNCTION(cf128,	sin,		csinf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	cos,		ccosf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	tan,		ctanf128)

DEFINE_UNARY_MATH_FUNCTION(cf128,	asin,		casinf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	acos,		cacosf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	atan,		catanf128)

DEFINE_UNARY_MATH_FUNCTION(cf128,	sinh,		csinhf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	cosh,		ccoshf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	tanh,		ctanhf128)

DEFINE_UNARY_MATH_FUNCTION(cf128,	asinh,		casinhf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	acosh,		cacoshf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	atanh,		catanhf128)

DEFINE_UNARY_MATH_FUNCTION(cf128,	exp,		cexpf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	exp2,		cexp2f128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	exp10,		cexp10f128)

DEFINE_UNARY_MATH_FUNCTION(cf128,	log,		clogf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	log10,		clog10f128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	log2,		clog2f128)

DEFINE_BINARY_MATH_FUNCTION(cf128,	pow,		cpowf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	sqrt,		csqrtf128)
DEFINE_UNARY_MATH_FUNCTION(cf128,	cbrt,		ccbrtf128)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
DEFINE_UNARY_MATH_FUNCTION(cf32x,	sin,		csinf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	cos,		ccosf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	tan,		ctanf32x)

DEFINE_UNARY_MATH_FUNCTION(cf32x,	asin,		casinf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	acos,		cacosf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	atan,		catanf32x)

DEFINE_UNARY_MATH_FUNCTION(cf32x,	sinh,		csinhf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	cosh,		ccoshf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	tanh,		ctanhf32x)

DEFINE_UNARY_MATH_FUNCTION(cf32x,	asinh,		casinhf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	acosh,		cacoshf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	atanh,		catanhf32x)

DEFINE_UNARY_MATH_FUNCTION(cf32x,	exp,		cexpf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	exp2,		cexp2f32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	exp10,		cexp10f32x)

DEFINE_UNARY_MATH_FUNCTION(cf32x,	log,		clogf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	log10,		clog10f32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	log2,		clog2f32x)

DEFINE_BINARY_MATH_FUNCTION(cf32x,	pow,		cpowf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	sqrt,		csqrtf32x)
DEFINE_UNARY_MATH_FUNCTION(cf32x,	cbrt,		ccbrtf32x)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
DEFINE_UNARY_MATH_FUNCTION(cf64x,	sin,		csinf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	cos,		ccosf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	tan,		ctanf64x)

DEFINE_UNARY_MATH_FUNCTION(cf64x,	asin,		casinf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	acos,		cacosf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	atan,		catanf64x)

DEFINE_UNARY_MATH_FUNCTION(cf64x,	sinh,		csinhf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	cosh,		ccoshf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	tanh,		ctanhf64x)

DEFINE_UNARY_MATH_FUNCTION(cf64x,	asinh,		casinhf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	acosh,		cacoshf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	atanh,		catanhf64x)

DEFINE_UNARY_MATH_FUNCTION(cf64x,	exp,		cexpf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	exp2,		cexp2f64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	exp10,		cexp10f64x)

DEFINE_UNARY_MATH_FUNCTION(cf64x,	log,		clogf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	log10,		clog10f64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	log2,		clog2f64x)

DEFINE_BINARY_MATH_FUNCTION(cf64x,	pow,		cpowf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	sqrt,		csqrtf64x)
DEFINE_UNARY_MATH_FUNCTION(cf64x,	cbrt,		ccbrtf64x)
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
DEFINE_UNARY_MATH_FUNCTION(cf128x,	sin,		csinf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	cos,		ccosf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	tan,		ctanf128x)

DEFINE_UNARY_MATH_FUNCTION(cf128x,	asin,		casinf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	acos,		cacosf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	atan,		catanf128x)

DEFINE_UNARY_MATH_FUNCTION(cf128x,	sinh,		csinhf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	cosh,		ccoshf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	tanh,		ctanhf128x)

DEFINE_UNARY_MATH_FUNCTION(cf128x,	asinh,		casinhf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	acosh,		cacoshf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	atanh,		catanhf128x)

DEFINE_UNARY_MATH_FUNCTION(cf128x,	exp,		cexpf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	exp2,		cexp2f128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	exp10,		cexp10f128x)

DEFINE_UNARY_MATH_FUNCTION(cf128x,	log,		clogf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	log10,		clog10f128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	log2,		clog2f128x)

DEFINE_BINARY_MATH_FUNCTION(cf128x,	pow,		cpowf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	sqrt,		csqrtf128x)
DEFINE_UNARY_MATH_FUNCTION(cf128x,	cbrt,		ccbrtf128x)
#endif


/** --------------------------------------------------------------------
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

mmux_pointer_t
mmux_pointer_bitwise_and (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr &= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_pointer_t
mmux_pointer_bitwise_or (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr |= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_pointer_t
mmux_pointer_bitwise_xor (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr ^= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_pointer_t
mmux_pointer_bitwise_not (mmux_pointer_t op)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr = ~ op_uintptr;
  return (mmux_pointer_t)op_uintptr;
}
mmux_pointer_t
mmux_pointer_bitwise_shl (mmux_pointer_t op, mmux_sint_t nbits)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr <<= nbits.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_pointer_t
mmux_pointer_bitwise_shr (mmux_pointer_t op, mmux_sint_t nbits)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr >>= nbits.value;
  return (mmux_pointer_t)op_uintptr;
}

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_BITWISE_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_$1_t
mmux_$1_bitwise_and (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value & op2.value);
}
mmux_$1_t
mmux_$1_bitwise_or (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value | op2.value);
}
mmux_$1_t
mmux_$1_bitwise_xor (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value ^ op2.value);
}
mmux_$1_t
mmux_$1_bitwise_not (mmux_$1_t op)
{
  return mmux_$1(~ op.value);
}
mmux_$1_t
mmux_$1_bitwise_shl (mmux_$1_t op, mmux_sint_t nbits)
{
  return mmux_$1(op.value << nbits.value);
}
mmux_$1_t
mmux_$1_bitwise_shr (mmux_$1_t op, mmux_sint_t nbits)
{
  return mmux_$1(op.value >> nbits.value);
}
]]])]]])

DEFINE_BITWISE_FUNCS([[[char]]])
DEFINE_BITWISE_FUNCS([[[schar]]])
DEFINE_BITWISE_FUNCS([[[uchar]]])
DEFINE_BITWISE_FUNCS([[[sshort]]])
DEFINE_BITWISE_FUNCS([[[ushort]]])
DEFINE_BITWISE_FUNCS([[[sint]]])
DEFINE_BITWISE_FUNCS([[[uint]]])
DEFINE_BITWISE_FUNCS([[[slong]]])
DEFINE_BITWISE_FUNCS([[[ulong]]])
DEFINE_BITWISE_FUNCS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_BITWISE_FUNCS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

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
DEFINE_BITWISE_FUNCS([[[time]]])
DEFINE_BITWISE_FUNCS([[[socklen]]])
DEFINE_BITWISE_FUNCS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Char support.
 ** ----------------------------------------------------------------- */

#ifdef __CHAR_UNSIGNED__
DEFINE_UNSIGNED_INTEGER_PREDICATES([[[char]]])
DEFINE_UTYPE_FUNCTIONS([[[char]]])
#else
DEFINE_SIGNED_INTEGER_PREDICATES([[[char]]])
DEFINE_STYPE_FUNCTIONS([[[char]]])
#endif

bool
mmux_char_is_unsigned (void)
{
#ifdef __CHAR_UNSIGNED__
  return true;
#else
  return false;
#endif
}


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_sint_t
mmux_ctype_generic_error (...)
/* This function is used in "mmux-cc-types-generics.h". */
{
  return mmux_sint_constant_zero();
}

/* end of file */
