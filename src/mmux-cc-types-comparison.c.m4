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
 ** Comparison: standard flonum
 ** ----------------------------------------------------------------- */

/* Remember  that the  flonum functions  exist to  handle correctly  the case  of NaN
   operands, which is not handled correctly with the operators <, >, <=, >=. */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
/* The "equal", "not_equal", "cmp" functions are  implemented as inline in the header
   file. */
bool
mmux_standard_flonum$1_greater (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isgreater(op1,op2))? true : false;
}
bool
mmux_standard_flonum$1_less (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isless(op1,op2))? true : false;
}
bool
mmux_standard_flonum$1_greater_equal (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (isgreaterequal(op1,op2))? true : false;
}
bool
mmux_standard_flonum$1_less_equal (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (islessequal(op1,op2))? true : false;
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_max (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return fmax$2(op1, op2);
}
mmux_standard_flonum$1_t
mmux_standard_flonum$1_min (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return fmin$2(op1, op2);
}
bool
mmux_standard_flonum$1_equal_absmargin (mmux_standard_flonum$1_t op1,
					mmux_standard_flonum$1_t op2,
					mmux_standard_flonum$1_t margin)
{
  if (0) {
    dprintf(2, "diff %f mrg %f\n", (double)fabs$2(op1 - op2), (double)fabs$2(margin));
  }
  return (fabs$2(margin) >= fabs$2(op1 - op2))? true : false;
}
bool
mmux_standard_flonum$1_equal_relepsilon (mmux_standard_flonum$1_t op1,
					 mmux_standard_flonum$1_t op2,
					 mmux_standard_flonum$1_t epsilon)
{
  if (0) {
    dprintf(2, "\n%s: op1 %f op2 %f diff %f eps %f\n",
	    __func__,
	    (double)op1,
	    (double)op2,
	    (double)fabs$2(op1 - op2),
	    (double)fabs$2(epsilon) * fmax$2(fabs$2(op1), fabs$2(op2)));
  }
  return (fabs$2(op1 - op2) <= fabs$2(epsilon) * fmax$2(fabs$2(op1), fabs$2(op2)))? true : false;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(fl,		f)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS(f128x,	f128x)

/* end of file */
