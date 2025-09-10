/*
  Part of: MMUX CC Types
  Contents: arithmetics functions
  Date: Sep  7, 2025

  Abstract

	This module implements arithmetic functions.

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
 ** Arithmetics functions: standard flonum
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_standard_flonum$1_t
mmux_standard_flonum$1_modulo (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return fmod$2(op1, op2);
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_absolute (mmux_standard_flonum$1_t op)
{
  return fabs$2(op);
}
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
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(fl,	f)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUM_ARITHMETICS_FUNCTIONS(f128x,	f128x)


/** --------------------------------------------------------------------
 ** Arithmetics functions: standard flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_standard_flonum$1_t
mmux_standard_flonumc$1_absolute (mmux_standard_flonumc$1_t op)
{
  return cabs$2(op);
}
mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_sign (mmux_standard_flonumc$1_t op)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_sign(mmux_standard_flonumc$1_real_part(op)),
					     mmux_standard_flonum$1_sign(mmux_standard_flonumc$1_imag_part(op)));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(fl,	f)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(db)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUMC_ARITHMETICS_FUNCTIONS(f128x,	f128x)

/* end of file */
