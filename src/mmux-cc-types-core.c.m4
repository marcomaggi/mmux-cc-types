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
mmux_$1_absolute (mmux_$1_t op)
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
mmux_$1_absolute (mmux_$1_t op)
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

m4_divert(-1)
m4_define([[[DEFINE_TYPE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_flonum$1_t
mmux_flonum$1_absolute (mmux_flonum$1_t X)
{
  return mmux_flonum$1(absolute$1(X.value));
}
mmux_flonum$1_t
mmux_flonum$1_max (mmux_flonum$1_t X, mmux_flonum$1_t Y)
{
  return mmux_flonum$1(max$1(X.value, Y.value));
}
mmux_flonum$1_t
mmux_flonum$1_min (mmux_flonum$1_t X, mmux_flonum$1_t Y)
{
  return mmux_flonum$1(min$1(X.value, Y.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_TYPE_FUNCTIONS(fl)
DEFINE_TYPE_FUNCTIONS(db)
DEFINE_TYPE_FUNCTIONS(ldb)
DEFINE_TYPE_FUNCTIONS(f32)
DEFINE_TYPE_FUNCTIONS(f64)
DEFINE_TYPE_FUNCTIONS(f128)
DEFINE_TYPE_FUNCTIONS(f32x)
DEFINE_TYPE_FUNCTIONS(f64x)
DEFINE_TYPE_FUNCTIONS(f128x)


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
mmux_$1_absolute (mmux_$1_t op)
{
  return mmux_$1(mmux_$2_absolute(mmux_$2(op.value)).value);
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
 ** Some complex number type functions: real part, imag part, abs, arg, conjugate.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPLEX_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_rectangular (mmux_standard_flonum$1_t re, mmux_standard_flonum$1_t im)
/* We need this  constructor for standard complex  numbers so that we can  use it for
   inline functions in the main header file. */
{
  return rectangularc$1(re, im);
}
mmux_flonumc$1_t
mmux_flonumc$1_rectangular (mmux_flonum$1_t re, mmux_flonum$1_t im)
{
  return mmux_flonumc$1(rectangularc$1(re.value, im.value));
}
mmux_flonum$1_t
mmux_flonumc$1_real_part (mmux_flonumc$1_t Z)
{
  return mmux_flonum$1(real_partc$1(Z.value));
}
mmux_flonum$1_t
mmux_flonumc$1_imag_part (mmux_flonumc$1_t Z)
{
  return mmux_flonum$1(imag_partc$1(Z.value));
}
inline mmux_flonum$1_t
mmux_flonumc$1_absolute (mmux_flonumc$1_t Z)
{
  return mmux_flonum$1(absolutec$1(Z.value));
}
inline mmux_flonum$1_t
mmux_flonumc$1_argument (mmux_flonumc$1_t Z)
{
  return mmux_flonum$1(argumentc$1(Z.value));
}
inline mmux_flonumc$1_t
mmux_flonumc$1_conjugate (mmux_flonumc$1_t Z)
{
  return mmux_flonumc$1(conjugatec$1(Z.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_COMPLEX_FUNCTIONS(fl)
DEFINE_COMPLEX_FUNCTIONS(db)
DEFINE_COMPLEX_FUNCTIONS(ldb)
DEFINE_COMPLEX_FUNCTIONS(f32)
DEFINE_COMPLEX_FUNCTIONS(f64)
DEFINE_COMPLEX_FUNCTIONS(f128)
DEFINE_COMPLEX_FUNCTIONS(f32x)
DEFINE_COMPLEX_FUNCTIONS(f64x)
DEFINE_COMPLEX_FUNCTIONS(f128x)


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
 ** Mathematics: real float, double, long double floating-point functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op)
{
  return mmux_flonum$1($2$1(op.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($2$1(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_sint_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($2$1(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_REAL_MATH_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_FUNCTION($1,		sin)
DEFINE_UNARY_MATH_FUNCTION($1,		cos)
DEFINE_UNARY_MATH_FUNCTION($1,		tan)

DEFINE_UNARY_MATH_FUNCTION($1,		asin)
DEFINE_UNARY_MATH_FUNCTION($1,		acos)
DEFINE_UNARY_MATH_FUNCTION($1,		atan)
DEFINE_BINARY_MATH_FUNCTION($1,		atan2)

DEFINE_UNARY_MATH_FUNCTION($1,		sinh)
DEFINE_UNARY_MATH_FUNCTION($1,		cosh)
DEFINE_UNARY_MATH_FUNCTION($1,		tanh)

DEFINE_UNARY_MATH_FUNCTION($1,		asinh)
DEFINE_UNARY_MATH_FUNCTION($1,		acosh)
DEFINE_UNARY_MATH_FUNCTION($1,		atanh)

DEFINE_UNARY_MATH_FUNCTION($1,		exp)
DEFINE_UNARY_MATH_FUNCTION($1,		exp2)
DEFINE_UNARY_MATH_FUNCTION($1,		exp10)

DEFINE_UNARY_MATH_FUNCTION($1,		log)
DEFINE_UNARY_MATH_FUNCTION($1,		log10)
DEFINE_UNARY_MATH_FUNCTION($1,		log2)
DEFINE_UNARY_MATH_FUNCTION($1,		logb)

DEFINE_BINARY_MATH_FUNCTION($1,		pow)
DEFINE_UNARY_MATH_FUNCTION($1,		square)
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt)
DEFINE_BINARY_MATH_FUNCTION($1,		hypot)

DEFINE_UNARY_MATH_FUNCTION($1,		expm1)
DEFINE_UNARY_MATH_FUNCTION($1,		log1p)

DEFINE_UNARY_MATH_FUNCTION($1,		erf)
DEFINE_UNARY_MATH_FUNCTION($1,		erfc)

DEFINE_UNARY_MATH_FUNCTION($1,		lgamma)
DEFINE_UNARY_MATH_FUNCTION($1,		tgamma)

DEFINE_UNARY_MATH_FUNCTION($1,		j0)
DEFINE_UNARY_MATH_FUNCTION($1,		j1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	jn)

DEFINE_UNARY_MATH_FUNCTION($1,		y0)
DEFINE_UNARY_MATH_FUNCTION($1,		y1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	yn)
]]])]]])

m4_define([[[DEFINE_CPLX_MATH_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_FUNCTION($1,		sin)
DEFINE_UNARY_MATH_FUNCTION($1,		cos)
DEFINE_UNARY_MATH_FUNCTION($1,		tan)

DEFINE_UNARY_MATH_FUNCTION($1,		asin)
DEFINE_UNARY_MATH_FUNCTION($1,		acos)
DEFINE_UNARY_MATH_FUNCTION($1,		atan)

DEFINE_UNARY_MATH_FUNCTION($1,		sinh)
DEFINE_UNARY_MATH_FUNCTION($1,		cosh)
DEFINE_UNARY_MATH_FUNCTION($1,		tanh)

DEFINE_UNARY_MATH_FUNCTION($1,		asinh)
DEFINE_UNARY_MATH_FUNCTION($1,		acosh)
DEFINE_UNARY_MATH_FUNCTION($1,		atanh)

DEFINE_UNARY_MATH_FUNCTION($1,		exp)
DEFINE_UNARY_MATH_FUNCTION($1,		exp2)
DEFINE_UNARY_MATH_FUNCTION($1,		exp10)

DEFINE_UNARY_MATH_FUNCTION($1,		log)
DEFINE_UNARY_MATH_FUNCTION($1,		log10)
DEFINE_UNARY_MATH_FUNCTION($1,		log2)

DEFINE_BINARY_MATH_FUNCTION($1,		pow)
DEFINE_UNARY_MATH_FUNCTION($1,		square)
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_REAL_MATH_FUNCTIONS(fl)
DEFINE_REAL_MATH_FUNCTIONS(db)
DEFINE_REAL_MATH_FUNCTIONS(ldb)
DEFINE_REAL_MATH_FUNCTIONS(f32)
DEFINE_REAL_MATH_FUNCTIONS(f64)
DEFINE_REAL_MATH_FUNCTIONS(f128)
DEFINE_REAL_MATH_FUNCTIONS(f32x)
DEFINE_REAL_MATH_FUNCTIONS(f64x)
DEFINE_REAL_MATH_FUNCTIONS(f128x)
DEFINE_CPLX_MATH_FUNCTIONS(cfl)
DEFINE_CPLX_MATH_FUNCTIONS(cdb)
DEFINE_CPLX_MATH_FUNCTIONS(cldb)
DEFINE_CPLX_MATH_FUNCTIONS(cf32)
DEFINE_CPLX_MATH_FUNCTIONS(cf64)
DEFINE_CPLX_MATH_FUNCTIONS(cf128)
DEFINE_CPLX_MATH_FUNCTIONS(cf32x)
DEFINE_CPLX_MATH_FUNCTIONS(cf64x)
DEFINE_CPLX_MATH_FUNCTIONS(cf128x)


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
