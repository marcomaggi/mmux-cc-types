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
 ** Standard types adapters: sprinter and parser.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS]]],[[[
mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return strfrom$1(result_p, size, format, value);
}
mmux_standard_flonum$1_t
mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value, mmux_asciizpp_t restrict tailptr)
{
  return strto$1(s_input_value, tailptr);
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d32)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d64)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d128)


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISONS]]],[[[
__attribute__((__const__)) mmux_sint_t
mmux_flonumd$1_cmp (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  if (mmux_flonumd$1_greater(op1, op2)) {
    return mmux_sint(+1);
  } else if (mmux_flonumd$1_less(op1, op2)) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (op1.value == op2.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreater(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isless(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreaterequal(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (islessequal(op1.value,op2.value))? true : false;
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_max (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmaxd$1(X.value, Y.value));
}
__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_min (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmind$1(X.value, Y.value));
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) bool
mmux_flonumcd$1_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return ((op1.value.re == op2.value.re) && (op1.value.im == op2.value.im))? true : false;
}
__attribute__((__const__)) mmux_sint_t
mmux_flonumcd$1_cmp (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_cmp(mmux_flonumcd$1_absolute(op1), mmux_flonumcd$1_absolute(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater(mmux_flonumcd$1_absolute(op1), mmux_flonumcd$1_absolute(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less(mmux_flonumcd$1_absolute(op1), mmux_flonumcd$1_absolute(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater_equal(mmux_flonumcd$1_absolute(op1), mmux_flonumcd$1_absolute(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less_equal(mmux_flonumcd$1_absolute(op1), mmux_flonumcd$1_absolute(op2));
}
]]])
m4_divert(0)m4_dnl
DEFINE_COMPARISONS(32)
DEFINE_COMPARISONS(64)
DEFINE_COMPARISONS(128)


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_APPROX_COMPARISONS]]],[[[
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_absmargin (mmux_standard_flonumd$1_t op1,
					 mmux_standard_flonumd$1_t op2,
					 mmux_standard_flonumd$1_t margin)
{
  return (fabsd$1(op1 - op2) <= fabsd$1(margin))? true : false;
}
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_relepsilon (mmux_standard_flonumd$1_t op1,
					  mmux_standard_flonumd$1_t op2,
					  mmux_standard_flonumd$1_t epsilon)
{
  return (fabsd$1(op1 - op2) <= (fabsd$1(epsilon) * fmaxd$1(fabsd$1(op1), fabsd$1(op2))))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_APPROX_COMPARISONS(32)
DEFINE_STANDARD_APPROX_COMPARISONS(64)
DEFINE_STANDARD_APPROX_COMPARISONS(128)

/* end of file */
