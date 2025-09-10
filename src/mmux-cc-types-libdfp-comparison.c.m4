/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This module implements some support for _DecimalN types through libdfp.

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
 ** Includes.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-libdfp-internal.h>


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_COMPARISON_FUNCTIONS]]],[[[
mmux_standard_sint_t
mmux_standard_flonumd$1_cmp (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  if (mmux_standard_flonumd$1_greater(op1, op2)) {
    return +1;
  } else if (mmux_standard_flonumd$1_less(op1, op2)) {
    return -1;
  } else {
    return 0;
  }
}
bool
mmux_standard_flonumd$1_equal (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (op1 == op2)? true : false;
}
bool
mmux_standard_flonumd$1_greater (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (isgreater(op1,op2))? true : false;
}
bool
mmux_standard_flonumd$1_less (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (isless(op1,op2))? true : false;
}
bool
mmux_standard_flonumd$1_greater_equal (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (isgreaterequal(op1,op2))? true : false;
}
bool
mmux_standard_flonumd$1_less_equal (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (islessequal(op1,op2))? true : false;
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_max (mmux_standard_flonumd$1_t X, mmux_standard_flonumd$1_t Y)
{
  return fmaxd$1(X, Y);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_min (mmux_standard_flonumd$1_t X, mmux_standard_flonumd$1_t Y)
{
  return fmind$1(X, Y);
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_COMPARISON_FUNCTIONS(32)
DEFINE_STANDARD_COMPARISON_FUNCTIONS(64)
DEFINE_STANDARD_COMPARISON_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_APPROX_COMPARISONS]]],[[[
bool
mmux_standard_flonumd$1_equal_absmargin (mmux_standard_flonumd$1_t op1,
					 mmux_standard_flonumd$1_t op2,
					 mmux_standard_flonumd$1_t margin)
{
  return (fabsd$1(op1 - op2) <= fabsd$1(margin))? true : false;
}
bool
mmux_standard_flonumd$1_equal_relepsilon (mmux_standard_flonumd$1_t op1,
					  mmux_standard_flonumd$1_t op2,
					  mmux_standard_flonumd$1_t epsilon)
{
  return (fabsd$1(op1 - op2) <= (fabsd$1(epsilon) * fmaxd$1(fabsd$1(op1), fabsd$1(op2))))? true : false;
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_APPROX_COMPARISONS(32)
DEFINE_STANDARD_APPROX_COMPARISONS(64)
DEFINE_STANDARD_APPROX_COMPARISONS(128)

/* end of file */
