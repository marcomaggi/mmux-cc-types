/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  7, 2025

  Abstract

	This  is module  implements the  comparison functions.   This header  file is
	included by the main header "mmux-cc-types.h"  and it must not be included by
	itself.

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

#ifndef MMUX_CC_TYPES_COMPARISON_H
#define MMUX_CC_TYPES_COMPARISON_H 1


/** --------------------------------------------------------------------
 ** Pointers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl bool
mmux_pointer_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 == op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_not_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 != op2)? true : false;
}
mmux_sint_t
mmux_pointer_cmp (mmux_pointer_t op1, mmux_pointer_t op2)
{
  if (op1 > op2) {
    return mmux_sint(+1);
  } else if (op1 < op2) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
mmux_cc_types_inline_decl bool
mmux_pointer_greater (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 >  op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_less (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 <  op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_greater_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 >= op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_less_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 <= op2)? true : false;
}


/** --------------------------------------------------------------------
 ** Comparison: standard exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl bool
mmux_standard_$1_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 == op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_not_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 != op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_greater (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 > op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_less (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 < op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_greater_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 >= op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_less_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 <= op2)? true : false;
}
mmux_standard_$1_t
mmux_standard_$1_max (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return ((mmux_standard_$1_greater_equal(op1, op2))? op1 : op2);
}
mmux_standard_$1_t
mmux_standard_$1_min (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return ((mmux_standard_$1_less_equal(op1, op2))? op1 : op2);
}
mmux_standard_sint_t
mmux_standard_$1_cmp (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  if (mmux_standard_$1_greater(op1, op2)) {
    return +1;
  } else if (mmux_standard_$1_less(op1, op2)) {
    return -1;
  } else {
    return 0;
  }
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[char]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[schar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[slong]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[mode]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[pid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[gid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[time]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[socklen]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Comparison: exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_standard_$1_$2(op1.value, op2.value);
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	equal)
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	not_equal)
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	greater)
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	less)
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	greater_equal)
DEFINE_EXACT_INTEGER_COMPARISON_WRAPPER_FUNCTION($1,	less_equal)
mmux_cc_types_inline_decl mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_sint(mmux_standard_$1_cmp(op1.value, op2.value));
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_max (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(mmux_standard_$1_max(op1.value, op2.value));
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_min (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(mmux_standard_$1_min(op1.value, op2.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[char]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[schar]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[slong]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[usize]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[mode]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[off]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[pid]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[uid]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[gid]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[wint]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[time]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[socklen]]])
DEFINE_EXACT_INTEGER_COMPARISON_INLINE_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Comparison: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl bool
mmux_standard_$1_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 == op2)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_not_equal (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return (op1 != op2)? true : false;
}
/* Remember that special  flonum functions exist to handle correctly  the case of NaN
   operands, which is not handled correctly with the operators <, >, <=, >=. */
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_$1_t  mmux_standard_$1_greater
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_$1_t  mmux_standard_$1_less
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_$1_t  mmux_standard_$1_greater_equal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_standard_$1_t  mmux_standard_$1_less_equal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_$1_t mmux_standard_$1_equal_absmargin
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_$1_t mmux_standard_$1_equal_relepsilon
__attribute__((__const__));
mmux_cc_types_inline_decl mmux_standard_sint_t
mmux_standard_$1_cmp (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  if (mmux_standard_$1_greater(op1, op2)) {
    return +1;
  } else if (mmux_standard_$1_less(op1, op2)) {
    return -1;
  } else {
    return 0;
  }
}
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_$1_t  mmux_standard_$1_max __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_$1_t  mmux_standard_$1_min __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumfl]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumdb]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_STANDARD_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Comparison: flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_standard_flonum$1_$2(op1.value, op2.value);
}]]])

m4_define([[[DEFINE_FLONUM_COMPARISON_TERNARY_PREDICATE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2, mmux_flonum$1_t op3)
{
  return mmux_standard_flonum$1_$2(op1.value, op2.value, op3.value);
}]]])

m4_define([[[DEFINE_FLONUM_COMPARISON_BINARY_OPERATION_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		equal)
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		not_equal)
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		greater)
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		less)
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		greater_equal)
DEFINE_FLONUM_COMPARISON_BINARY_PREDICATE_FUNCTION($1,		less_equal)
DEFINE_FLONUM_COMPARISON_TERNARY_PREDICATE_FUNCTION($1,		equal_absmargin)
DEFINE_FLONUM_COMPARISON_TERNARY_PREDICATE_FUNCTION($1,		equal_relepsilon)
DEFINE_FLONUM_COMPARISON_BINARY_OPERATION_FUNCTION($1,		max)
DEFINE_FLONUM_COMPARISON_BINARY_OPERATION_FUNCTION($1,		min)

mmux_cc_types_inline_decl mmux_sint_t
mmux_flonum$1_cmp (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_sint(mmux_standard_flonum$1_cmp(op1.value, op2.value));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumfl]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumdb]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUM_COMPARISON_FUNCTIONS_AND_PROTOS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Comparison: standard flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_$2 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return mmux_standard_flonum$1_$2(mmux_standard_flonumc$1_absolute(op1),
				   mmux_standard_flonumc$1_absolute(op2));
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	equal)
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	not_equal)
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	greater)
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	less)
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	greater_equal)
DEFINE_STANDARD_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,	less_equal)
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_cmp (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  auto	aop1 = mmux_standard_flonumc$1_absolute(op1);
  auto	aop2 = mmux_standard_flonumc$1_absolute(op2);

  if (mmux_standard_flonum$1_greater(aop1, aop2)) {
    return +1;
  } else if (mmux_standard_flonum$1_less(aop1, aop2)) {
    return -1;
  } else {
    return 0;
  }
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_equal_absmargin (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2,
					 mmux_standard_flonumc$1_t mrg)
{
  return (mmux_standard_flonum$1_equal_absmargin(mmux_standard_flonumc$1_real_part(op1),
						 mmux_standard_flonumc$1_real_part(op2),
						 mmux_standard_flonumc$1_real_part(mrg)) &&
	  mmux_standard_flonum$1_equal_absmargin(mmux_standard_flonumc$1_imag_part(op1),
						 mmux_standard_flonumc$1_imag_part(op2),
						 mmux_standard_flonumc$1_imag_part(mrg)));
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_equal_relepsilon (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2,
					 mmux_standard_flonumc$1_t eps)
{
  return (mmux_standard_flonum$1_equal_relepsilon(mmux_standard_flonumc$1_real_part(op1),
						  mmux_standard_flonumc$1_real_part(op2),
						  mmux_standard_flonumc$1_real_part(eps)) &&
	  mmux_standard_flonum$1_equal_relepsilon(mmux_standard_flonumc$1_imag_part(op1),
						  mmux_standard_flonumc$1_imag_part(op2),
						  mmux_standard_flonumc$1_imag_part(eps)));
}mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_max (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return (mmux_standard_flonum$1_greater_equal(mmux_standard_flonumc$1_absolute(op1),
					       mmux_standard_flonumc$1_absolute(op2)))?
    op1 : op2;
}
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_min (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return (mmux_standard_flonum$1_greater_equal(mmux_standard_flonumc$1_absolute(op1),
					       mmux_standard_flonumc$1_absolute(op2)))?
    op2 : op1;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[fl]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[db]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[ldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_STANDARD_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Comparison: flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumc$1_$2 (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_standard_flonumc$1_$2(op1.value, op2.value);
}]]])

m4_define([[[DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		equal)
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		not_equal)
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		greater)
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		less)
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		greater_equal)
DEFINE_FLONUMC_COMPARISON_PREDICATE_WRAPPER($1,		less_equal)

mmux_cc_types_inline_decl mmux_sint_t
mmux_flonumc$1_cmp (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_sint(mmux_standard_flonumc$1_cmp(op1.value, op2.value));
}
mmux_cc_types_inline_decl bool
mmux_flonumc$1_equal_absmargin (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2, mmux_flonumc$1_t mrg)
{
  return mmux_standard_flonumc$1_equal_absmargin(op1.value, op2.value, mrg.value);
}
mmux_cc_types_inline_decl bool
mmux_flonumc$1_equal_relepsilon (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2, mmux_flonumc$1_t eps)
{
  return mmux_standard_flonumc$1_equal_relepsilon(op1.value, op2.value, eps.value);
}
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_max (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_max(op1.value, op2.value));
}
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_min (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_min(op1.value, op2.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[fl]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[db]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_FLONUMC_COMPARISON_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_COMPARISON_H */

/* end of file */
