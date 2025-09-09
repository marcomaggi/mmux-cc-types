/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  7, 2025

  Abstract

	This is module implements the sign predicates functions.  This header file is
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

#ifndef MMUX_CC_TYPES_SIGN_PREDICATES_H
#define MMUX_CC_TYPES_SIGN_PREDICATES_H 1


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_char_is_unsigned (void)
  __attribute__((__const__));


/** --------------------------------------------------------------------
 ** Sign predicates: pointers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl bool
mmux_pointer_is_zero (mmux_pointer_t op)
{
  return (NULL == op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_positive (mmux_pointer_t op)
{
  return (NULL != op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_negative (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_non_positive (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_non_negative (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_nan (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_infinite (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_is_finite (mmux_pointer_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}


/** --------------------------------------------------------------------
 ** Sign predicates: char.
 ** ----------------------------------------------------------------- */

/* These are set aside from the others because they can be signed or unsigned. */

mmux_cc_types_decl bool mmux_standard_char_is_zero (mmux_standard_char_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_char_is_positive (mmux_standard_char_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_char_is_negative (mmux_standard_char_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_char_is_non_positive (mmux_standard_char_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_char_is_non_negative (mmux_standard_char_t op)
  __attribute__((__const__));

mmux_cc_types_inline_decl bool
mmux_standard_char_is_nan (mmux_standard_char_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_char_is_infinite (mmux_standard_char_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_char_is_finite (mmux_standard_char_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}


/** --------------------------------------------------------------------
 ** Sign predicates: standard signed exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_zero (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) == op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_positive (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) < op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_negative (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) > op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_non_positive (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) >= op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_non_negative (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) <= op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_nan (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_infinite (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_finite (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[schar]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sint]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[slong]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])

DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sint64]]])

DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[pid]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[time]]])


/** --------------------------------------------------------------------
 ** Sign predicates: standard unsigned exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_zero (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) == op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_positive (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) != op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_negative (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_non_positive (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_non_negative (mmux_standard_$1_t op)
{
  return (mmux_standard_$1_literal(0) == op)? true : false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_nan (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_infinite (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_finite (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uint]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[mode]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uid]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[gid]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[socklen]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Sign predicates: char, exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_standard_$1_$2(op.value);
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_zero)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_positive)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_negative)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_positive)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_negative)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_nan)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_infinite)
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_finite)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[char]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[schar]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sint]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uint]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[slong]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[usize]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[mode]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[off]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[pid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[gid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[wint]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[time]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[socklen]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Comparison: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_zero	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_negative	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_non_positive __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_non_negative __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_nan		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_infinite	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_finite	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_normal	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_$1_t  mmux_standard_$1_is_subnormal	__attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumfl]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumdb]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_STANDARD_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Comparison: flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_standard_$1_$2(op.value);
}]]])

m4_define([[[DEFINE_FLONUM_SIGN_PREDICATES_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_zero)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_positive)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_negative)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_positive)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_negative)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_nan)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_infinite)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_finite)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_normal)
DEFINE_FLONUM_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_subnormal)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumfl]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumdb]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumf128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Comparison: standard flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_standard_flonumc$1_$2 (mmux_standard_flonumc$1_t op)
{
  if (false) {
    mmux_cc_types_dprintf(2, "\n%s: here %f %f\n", __func__,
			  (double)mmux_standard_flonum$1_real_part(op),
			  (double)mmux_standard_flonum$1_imag_part(op));
  }
  return (mmux_standard_flonum$1_$2(mmux_standard_flonumc$1_real_part(op)) &&
	  mmux_standard_flonum$1_$2(mmux_standard_flonumc$1_imag_part(op))) ?
    true : false;
}
]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_zero)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_positive)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_negative)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_non_positive)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_non_negative)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_nan)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_infinite)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_finite)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_normal)
DEFINE_STANDARD_FLONUMC_BINARY_PREDICATE($1,	is_subnormal)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(fl)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(db)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(ldb)

DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f32)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f64)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f128)

DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f32x)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f64x)
DEFINE_STANDARD_FLONUMC_SIGN_PREDICATES_PROTOS(f128x)


/** --------------------------------------------------------------------
 ** Comparison: flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_standard_$1_$2(op.value);
}]]])

m4_define([[[DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_zero)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_positive)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_negative)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_positive)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_non_negative)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_nan)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_infinite)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_finite)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_normal)
DEFINE_FLONUMC_SIGN_PREDICATE_WRAPPER_FUNCTION($1,	is_subnormal)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcfl]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcdb]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_SIGN_PREDICATES_H */

/* end of file */
