/*
  Part of: MMUX CC Types
  Contents: real numbers functions
  Date: Sep 19, 2025

  Abstract

	This is  module implements the real  numbers functions.

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
 ** Real number functions: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_FUNCTION]]],[[[mmux_standard_flonum$1_t
mmux_standard_flonum$1_$3 (mmux_standard_flonum$1_t op)
{
  return $3$2(op);
}]]])

m4_define([[[DEFINE_SLONG_UNARY_FUNCTION]]],[[[mmux_standard_slong_t
mmux_standard_flonum$1_$3 (mmux_standard_flonum$1_t op)
{
  return $3$2(op);
}]]])

m4_define([[[DEFINE_SLLONG_UNARY_FUNCTION]]],[[[mmux_standard_sllong_t
mmux_standard_flonum$1_$3 (mmux_standard_flonum$1_t op)
{
  return $3$2(op);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_standard_flonum$1_t
mmux_standard_flonum$1_sign (mmux_standard_flonum$1_t op)
{
  if (mmux_standard_flonum$1_is_nan(op)) {
    return mmux_standard_flonum$1_constant_nan();
  } else if (mmux_standard_flonum$1_is_zero(op)) {
    if (signbit(op)) {
      return mmux_standard_flonum$1_literal(-1.0);
    } else {
      return mmux_standard_flonum$1_constant_one();
    }
  } else if (mmux_standard_flonum$1_is_positive(op)) {
    return mmux_standard_flonum$1_constant_one();
  } else if (mmux_standard_flonum$1_is_negative(op)) {
    return mmux_standard_flonum$1_literal(-1.0);
  } else {
    /* We should never come here. */
    return mmux_standard_flonum$1_constant_zero();
  }
}

DEFINE_UNARY_FUNCTION($1,$2,	ceil)
DEFINE_UNARY_FUNCTION($1,$2,	floor)
DEFINE_UNARY_FUNCTION($1,$2,	trunc)
DEFINE_UNARY_FUNCTION($1,$2,	rint)
DEFINE_UNARY_FUNCTION($1,$2,	nearbyint)
DEFINE_UNARY_FUNCTION($1,$2,	round)
DEFINE_UNARY_FUNCTION($1,$2,	roundeven)

DEFINE_SLONG_UNARY_FUNCTION($1,$2,	lrint)
DEFINE_SLONG_UNARY_FUNCTION($1,$2,	lround)
#ifdef MMUX_CC_TYPES_HAS_SLLONG
DEFINE_SLLONG_UNARY_FUNCTION($1,$2,	llrint)
DEFINE_SLLONG_UNARY_FUNCTION($1,$2,	llround)
#endif
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(fl,	f)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUM_REAL_NUMBER_FUNCTIONS(f128x,	f128x)

/* end of file */
