/*
  Part of: MMUX CC Types
  Contents: sign predicate functions
  Date: Sep  7, 2025

  Abstract

	This module implements sign predicate functions.

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
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

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
 ** Comparison: standard flonum functions.
 ** ----------------------------------------------------------------- */

/* Remember  that the  flonum functions  exist to  handle correctly  the case  of NaN
   operands, which is not handled correctly with the operators <, >, <=, >=. */

m4_define([[[DEFINE_FLONUM_SIGN_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
#define STANDARD_FLONUM$1_IS_ZERO(OP)		(FP_ZERO	== (fpclassify(OP))
#define STANDARD_FLONUM$1_IS_INFINITE(OP)	(FP_INFINITE	== (fpclassify(OP))
#define STANDARD_FLONUM$1_IS_NORMAL(OP)		(FP_NORMAL	== (fpclassify(OP))
#define STANDARD_FLONUM$1_IS_SUBNORMAL(OP)	(FP_SUBNORMAL	== (fpclassify(OP))

bool
mmux_standard_flonum$1_is_zero (mmux_standard_flonum$1_t op)
{
  return (STANDARD_FLONUM$1_IS_ZERO(op))? true : false;
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_is_nan (mmux_standard_flonum$1_t op)
{
  return (STANDARD_FLONUM$1_IS_NAN(op))? true : false;
}
bool
mmux_standard_flonum$1_is_infinite (mmux_standard_flonum$1_t op)
{
  return (STANDARD_FLONUM$1_IS_INFINITE(op))? true : false;
}
bool
mmux_standard_flonum$1_is_finite (mmux_standard_flonum$1_t op)
{
  auto	val = fpclassify(op);
  return ((FP_INFINITE != val) && (FP_NAN != val))? true : false;
}
bool
mmux_standard_flonum$1_is_normal (mmux_standard_flonum$1_t op)
{
  return (STANDARD_FLONUM$1_IS_NORMAL(op))? true : false;
}
bool
mmux_standard_flonum$1_is_subnormal (mmux_standard_flonum$1_t op)
{
  return (STANDARD_FLONUM$1_IS_SUBNORMAL(op))? true : false;
}

bool
mmux_standard_flonum$1_is_positive (mmux_standard_flonum$1_t op)
{
  if (STANDARD_FLONUM$1_IS_NAN(op)) {
    return false;
  } else if (STANDARD_FLONUM$1_IS_ZERO(op)) {
    if (signbit(op)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_flonum$1_constant_zero() < op)? true : false;
  }
}
bool
mmux_standard_flonum$1_is_negative (mmux_standard_flonum$1_t op)
{
  if (STANDARD_FLONUM$1_IS_NAN(op)) {
    return false;
  } else if (STANDARD_FLONUM$1_IS_ZERO(op)) {
    if (signbit(op)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_flonum$1_constant_zero() > op)? true : false;
  }
}

bool
mmux_standard_flonum$1_is_non_positive (mmux_standard_flonum$1_t op)
{
  if (STANDARD_FLONUM$1_IS_NAN(op)) {
    return false;
  } else if (STANDARD_FLONUM$1_IS_ZERO(op)) {
    return true;
  } else {
    return (mmux_standard_standard_flonum$1_constant_zero() > op)? true : false;
  }
}
bool
mmux_standard_flonum$1_is_non_negative (mmux_standard_flonum$1_t op)
{
  if (STANDARD_FLONUM$1_IS_NAN(op)) {
    return false;
  } else if (STANDARD_FLONUM$1_IS_ZERO(op)) {
    return true;
  } else {
    return (mmux_standard_standard_flonum$1_constant_zero() < op)? true : false;
  }
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_SIGN_PREDICATES([[[fl]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[db]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUM_SIGN_PREDICATES([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUM_SIGN_PREDICATES([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUM_SIGN_PREDICATES([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

/* end of file */
