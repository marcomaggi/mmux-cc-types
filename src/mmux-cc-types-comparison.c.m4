/*
  Part of: MMUX CC Types
  Contents: comparison functions
  Date: Aug 26, 2025

  Abstract

	This module implements comparison functions.

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
 ** Comparison: standard flonum functions.
 ** ----------------------------------------------------------------- */

/* Remember  that the  flonum functions  exist to  handle correctly  the case  of NaN
   operands, which is not handled correctly with the operators <, >, <=, >=. */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
/* The "equal", "not_equal", "cmp" functions are  implemented as inline in the header
   file. */
bool
mmux_standard_flonum$1_greater (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isgreater(op1.value,op2.value))? true : false;
}
bool
mmux_standard_flonum$1_less (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isless(op1.value,op2.value))? true : false;
}
bool
mmux_standard_flonum$1_greater_equal (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isgreaterequal(op1.value,op2.value))? true : false;
}
bool
mmux_standard_flonum$1_less_equal (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (islessequal(op1.value,op2.value))? true : false;
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_max (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return max$1(op1, op2);
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_min (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return min$1(op1, op2);
}
bool
mmux_standard_flonum$1_equal_absmargin (mmux_standard_flonum$1_t op1,
					mmux_standard_flonum$1_t op2,
					mmux_standard_flonum$1_t margin)
{
  return (absolute$1(margin) <= absolute$1(op1 - op2))? true : false;
}
bool
mmux_standard_flonum$1_equal_relepsilon (mmux_standard_flonum$1_t op1,
					 mmux_standard_flonum$1_t op2,
					 mmux_standard_flonum$1_t epsilon)
{
  return (absolute$1(op1 - op2) <= absolute$1(epsilon) * max$1(absolute$1(op1), absolute$1(op2)))? true : false;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[fl]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[db]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[ldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
bool
mmux_flonum$1_equal_absmargin (mmux_flonum$1_t op1, mmux_flonum$1_t op2, mmux_flonum$1_t margin)
{
  return mmux_standard_flonum$1_equal_absmargin(op1.value, op2.value, margin.value);
}
bool
mmux_flonum$1_equal_relepsilon (mmux_flonum$1_t op1, mmux_flonum$1_t op2, mmux_flonum$1_t epsilon)
{
  return mmux_standard_flonum$1_equal_relepsilon(op1.value, op2.value, epsilon.value);
}
]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
bool
mmux_flonumc$1_equal_absmargin (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2, mmux_flonumc$1_t margin)
{
  auto	re1 = mmux_flonumc$1_real_part(op1);
  auto	im1 = mmux_flonumc$1_imag_part(op1);
  auto	re2 = mmux_flonumc$1_real_part(op2);
  auto	im2 = mmux_flonumc$1_imag_part(op2);
  auto	ret = mmux_flonumc$1_real_part(margin);
  auto	imt = mmux_flonumc$1_imag_part(margin);

  return (mmux_flonum$1_equal_absmargin(re1, re2, ret) &&
	  mmux_flonum$1_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_flonumc$1_equal_relepsilon (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2, mmux_flonumc$1_t epsilon)
{
  auto	re1 = mmux_flonumc$1_real_part(op1);
  auto	im1 = mmux_flonumc$1_imag_part(op1);
  auto	re2 = mmux_flonumc$1_real_part(op2);
  auto	im2 = mmux_flonumc$1_imag_part(op2);
  auto	ret = mmux_flonumc$1_real_part(epsilon);
  auto	imt = mmux_flonumc$1_imag_part(epsilon);

  return (mmux_flonum$1_equal_relepsilon(re1, re2, ret) &&
	  mmux_flonum$1_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_APPROX_COMPARISONS([[[fl]]])
DEFINE_APPROX_COMPARISONS([[[db]]])
DEFINE_APPROX_COMPARISONS([[[ldb]]])

DEFINE_APPROX_COMPARISONS([[[f32]]])
DEFINE_APPROX_COMPARISONS([[[f64]]])
DEFINE_APPROX_COMPARISONS([[[f128]]])

DEFINE_APPROX_COMPARISONS([[[f32x]]])
DEFINE_APPROX_COMPARISONS([[[f64x]]])
DEFINE_APPROX_COMPARISONS([[[f128x]]])

/* end of file */
