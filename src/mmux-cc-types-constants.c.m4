/*
  Part of: MMUX CC Types
  Contents: functions returning constant values
  Date: Oct 19, 2024

  Abstract

	This module implements functions returning constant values.

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
 ** Real constants.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATH_REAL_CONSTANTS_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
mmux_standard_$1_t mmux_standard_$1_constant_E		(void) { return M_E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LOG2E	(void) { return M_LOG2E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LOG10E	(void) { return M_LOG10E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LN2	(void) { return M_LN2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LN10	(void) { return M_LN10$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI		(void) { return M_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI_2	(void) { return M_PI_2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI_4	(void) { return M_PI_4$2; }
mmux_standard_$1_t mmux_standard_$1_constant_1_PI	(void) { return M_1_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_2_PI	(void) { return M_2_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_2_SQRTPI	(void) { return M_2_SQRTPI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_SQRT2	(void) { return M_SQRT2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_SQRT1_2	(void) { return M_SQRT1_2$2; }

mmux_$1_t mmux_$1_constant_E		(void) { return mmux_$1(M_E$2); }
mmux_$1_t mmux_$1_constant_LOG2E	(void) { return mmux_$1(M_LOG2E$2); }
mmux_$1_t mmux_$1_constant_LOG10E	(void) { return mmux_$1(M_LOG10E$2); }
mmux_$1_t mmux_$1_constant_LN2		(void) { return mmux_$1(M_LN2$2); }
mmux_$1_t mmux_$1_constant_LN10		(void) { return mmux_$1(M_LN10$2); }
mmux_$1_t mmux_$1_constant_PI		(void) { return mmux_$1(M_PI$2); }
mmux_$1_t mmux_$1_constant_PI_2		(void) { return mmux_$1(M_PI_2$2); }
mmux_$1_t mmux_$1_constant_PI_4		(void) { return mmux_$1(M_PI_4$2); }
mmux_$1_t mmux_$1_constant_1_PI		(void) { return mmux_$1(M_1_PI$2); }
mmux_$1_t mmux_$1_constant_2_PI		(void) { return mmux_$1(M_2_PI$2); }
mmux_$1_t mmux_$1_constant_2_SQRTPI	(void) { return mmux_$1(M_2_SQRTPI$2); }
mmux_$1_t mmux_$1_constant_SQRT2	(void) { return mmux_$1(M_SQRT2$2); }
mmux_$1_t mmux_$1_constant_SQRT1_2	(void) { return mmux_$1(M_SQRT1_2$2); }
]]])]]])

DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumfl)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumdb)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumldb,	[[[l]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf32,	[[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf64,	[[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf128,	[[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf32x,	[[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf64x,	[[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf128x,	[[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

/* end of file */
