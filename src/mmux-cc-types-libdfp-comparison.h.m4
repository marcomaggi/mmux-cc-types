/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This  module  implements comparison  functions  for  _DecimalN types  through
	libdfp.

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
 ** Comparison functions: standard flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_COMPARISON_PROTOS]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_comparison_standard_flonumd$1_t  mmux_standard_flonumd$1_cmp
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_equal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_not_equal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_greater
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_less
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_greater_equal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_flonumd$1_t     mmux_standard_flonumd$1_less_equal
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_flonumd$1_t mmux_standard_flonumd$1_equal_absmargin
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_flonumd$1_t mmux_standard_flonumd$1_equal_relepsilon
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonumd$1_t     mmux_standard_flonumd$1_max
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonumd$1_t     mmux_standard_flonumd$1_min
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_COMPARISON_PROTOS(32)
DEFINE_STANDARD_FLONUMD_COMPARISON_PROTOS(64)
DEFINE_STANDARD_FLONUMD_COMPARISON_PROTOS(128)


/** --------------------------------------------------------------------
 ** Comparison functions: standard flonumcd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_$2 (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return mmux_standard_flonumd$1_$2(mmux_standard_flonumcd$1_absolute(op1),
				    mmux_standard_flonumcd$1_absolute(op2));
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMCD_COMPARISON_PROTOS]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_sint_t
mmux_standard_flonumcd$1_cmp (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return mmux_standard_flonumd$1_cmp(mmux_standard_flonumcd$1_absolute(op1),
				     mmux_standard_flonumcd$1_absolute(op2));
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_equal (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return (mmux_standard_flonumd$1_equal(op1.re, op2.re) &&
	  mmux_standard_flonumd$1_equal(op1.im, op2.im))?
    true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_not_equal (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return (mmux_standard_flonumd$1_not_equal(op1.re, op2.re) &&
	  mmux_standard_flonumd$1_not_equal(op1.im, op2.im))?
    true : false;
}
DEFINE_STANDARD_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1,	greater)
DEFINE_STANDARD_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1,	less)
DEFINE_STANDARD_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1,	greater_equal)
DEFINE_STANDARD_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1,	less_equal)

mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_equal_absmargin (mmux_standard_flonumcd$1_t op1,
					  mmux_standard_flonumcd$1_t op2,
					  mmux_standard_flonumcd$1_t mrg)
{
  return (mmux_standard_flonumd$1_equal_absmargin(op1.re, op2.re, mrg.re) &&
	  mmux_standard_flonumd$1_equal_absmargin(op1.im, op2.im, mrg.im)) ?
    true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_equal_relepsilon (mmux_standard_flonumcd$1_t op1,
					   mmux_standard_flonumcd$1_t op2,
					   mmux_standard_flonumcd$1_t eps)
{
  return (mmux_standard_flonumd$1_equal_relepsilon(op1.re, op2.re, eps.re) &&
	  mmux_standard_flonumd$1_equal_relepsilon(op1.im, op2.im, eps.im)) ?
    true : false;
}

mmux_cc_types_inline_decl mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_max (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return (mmux_standard_flonumd$1_greater_equal(mmux_standard_flonumcd$1_absolute(op1),
						mmux_standard_flonumcd$1_absolute(op2)))?
    op1 : op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_min (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  return (mmux_standard_flonumd$1_greater_equal(mmux_standard_flonumcd$1_absolute(op1),
						mmux_standard_flonumcd$1_absolute(op2)))?
    op2 : op1;
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_COMPARISON_PROTOS(32)
DEFINE_STANDARD_FLONUMCD_COMPARISON_PROTOS(64)
DEFINE_STANDARD_FLONUMCD_COMPARISON_PROTOS(128)


/** --------------------------------------------------------------------
 ** Comparison functions: flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumd$1_$2 (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return mmux_standard_flonumd$1_$2(op1.value, op2.value);
}]]])

m4_define([[[DEFINE_FLONUMD_TERNARY_COMPARISON_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumd$1_$2 (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2, mmux_flonumd$1_t op3)
{
  return mmux_standard_flonumd$1_$2(op1.value, op2.value, op3.value);
}]]])

m4_define([[[DEFINE_FLONUMD_BINARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMD_COMPARISON_INLINE_FUNCTIONS]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_sint_t
mmux_flonumd$1_cmp (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return mmux_sint(mmux_standard_flonumd$1_cmp(op1.value, op2.value));
}
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, equal)
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, not_equal)
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, greater)
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, less)
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, greater_equal)
DEFINE_FLONUMD_BINARY_COMPARISON_INLINE_FUNCTION($1, less_equal)
DEFINE_FLONUMD_TERNARY_COMPARISON_INLINE_FUNCTION($1, equal_absmargin)
DEFINE_FLONUMD_TERNARY_COMPARISON_INLINE_FUNCTION($1, equal_relepsilon)
DEFINE_FLONUMD_BINARY_INLINE_FUNCTION($1,	max)
DEFINE_FLONUMD_BINARY_INLINE_FUNCTION($1,	min)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_COMPARISON_INLINE_FUNCTIONS(32)
DEFINE_FLONUMD_COMPARISON_INLINE_FUNCTIONS(64)
DEFINE_FLONUMD_COMPARISON_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Comparison functions: flonumcd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_standard_flonumcd$1_$2(op1.value, op2.value);
}]]])

m4_define([[[DEFINE_FLONUMCD_TERNARY_COMPARISON_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2, mmux_flonumcd$1_t op3)
{
  return mmux_standard_flonumcd$1_$2(op1.value, op2.value, op3.value);
}]]])

m4_define([[[DEFINE_FLONUMCD_BINARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumcd$1_t
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMCD_COMPARISON_INLINE_FUNCTIONS]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_sint_t
mmux_flonumcd$1_cmp (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_sint(mmux_standard_flonumcd$1_cmp(op1.value, op2.value));
}
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, equal)
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, not_equal)
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, greater)
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, less)
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, greater_equal)
DEFINE_FLONUMCD_BINARY_COMPARISON_INLINE_FUNCTION($1, less_equal)
DEFINE_FLONUMCD_TERNARY_COMPARISON_INLINE_FUNCTION($1, equal_absmargin)
DEFINE_FLONUMCD_TERNARY_COMPARISON_INLINE_FUNCTION($1, equal_relepsilon)
DEFINE_FLONUMCD_BINARY_INLINE_FUNCTION($1,	max)
DEFINE_FLONUMCD_BINARY_INLINE_FUNCTION($1,	min)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_COMPARISON_INLINE_FUNCTIONS(32)
DEFINE_FLONUMCD_COMPARISON_INLINE_FUNCTIONS(64)
DEFINE_FLONUMCD_COMPARISON_INLINE_FUNCTIONS(128)

/* end of file */
