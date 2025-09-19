/*
  Part of: MMUX CC Types
  Contents: real number functions for _DecimalN
  Date: Sep 19, 2025

  Abstract

	This is  module implements  the real numbers  functions for  _DecimalN.

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

#include <mmux-cc-types-libdfp-internal.h>


/** --------------------------------------------------------------------
 ** Real number functions: standard flonumd
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_sign (mmux_standard_flonumd$1_t op)
{
  if (mmux_standard_flonumd$1_is_nan(op)) {
    return mmux_standard_flonumd$1_constant_nan();
  } else if (mmux_standard_flonumd$1_is_zero(op)) {
    if (signbit(op)) {
      return mmux_standard_flonumd$1_literal(-1.0);
    } else {
      return mmux_standard_flonumd$1_constant_one();
    }
  } else if (mmux_standard_flonumd$1_is_positive(op)) {
    return mmux_standard_flonumd$1_constant_one();
  } else if (mmux_standard_flonumd$1_is_negative(op)) {
    return mmux_standard_flonumd$1_literal(-1.0);
  } else {
    /* We should never come here. */
    return mmux_standard_flonumd$1_constant_zero();
  }
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS(128)

/* end of file */
