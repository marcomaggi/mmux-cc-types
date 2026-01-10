/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  7, 2025

  Abstract

	This  is module  implements the  predicates functions.   This header  file is
	included by the main header "mmux-cc-types.h"  and it must not be included by
	itself.

  Copyright (C) 2024, 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_PREDICATES_H
#define MMUX_CC_TYPES_PREDICATES_H 1


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

/* ------------------------------------------------------------------ */

mmux_cc_types_decl bool mmux_standard_ascii_is_zero (mmux_standard_ascii_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_ascii_is_positive (mmux_standard_ascii_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_ascii_is_negative (mmux_standard_ascii_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_ascii_is_non_positive (mmux_standard_ascii_t op)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_standard_ascii_is_non_negative (mmux_standard_ascii_t op)
  __attribute__((__const__));

mmux_cc_types_inline_decl bool
mmux_standard_ascii_is_nan (mmux_standard_ascii_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_ascii_is_infinite (mmux_standard_ascii_t op MMUX_CC_TYPES_UNUSED)
{
  return false;
}
mmux_cc_types_inline_decl bool
mmux_standard_ascii_is_finite (mmux_standard_ascii_t op MMUX_CC_TYPES_UNUSED)
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

DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[byte]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_pid]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[time]]])
DEFINE_STANDARD_SIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[clock]]])


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
  return (mmux_standard_$1_literal(0) != op)? false : true;
}
mmux_cc_types_inline_decl bool
mmux_standard_$1_is_non_negative (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return true;
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

DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[octet]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_mode]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_uid]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_gid]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_socklen]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_rlim]]])

DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_ino]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_dev]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_nlink]]])
DEFINE_STANDARD_UNSIGNED_EXACT_INTEGER_PREDICATE_INLINE_FUNCTIONS([[[libc_blkcnt]]])


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
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ascii]]])
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

DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[byte]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[octet]]])

DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[usize]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_mode]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[off]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_pid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_uid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_gid]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[wint]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[time]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[clock]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_socklen]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_rlim]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_ino]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_dev]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_nlink]]])
DEFINE_EXACT_INTEGER_SIGN_PREDICATE_INLINE_FUNCTIONS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Predicates: standard flonum.
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
 ** Predicates: standard flonumc.
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
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-predicates.h>
#endif


/** --------------------------------------------------------------------
 ** Predicates: flonum.
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

DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumd32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumd64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUM_SIGN_PREDICATES_PROTOS([[[flonumd128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Predicates: flonumc.
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

DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcd32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCD32]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcd64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCD64]]])
DEFINE_FLONUMC_SIGN_PREDICATES_PROTOS([[[flonumcd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD128]]])


/** --------------------------------------------------------------------
 ** Generic macros.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_zero]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_positive]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_negative]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_non_positive]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_non_negative]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_finite]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_infinite]]])
DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER([[[is_nan]]])
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC([[[is_normal]]])
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC([[[is_subnormal]]])


/** --------------------------------------------------------------------
 ** Generic macros: type inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_is_signed(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t:			false,			\
	   mmux_ascii_t:		false,			\
]]],[[[m4_dnl
	   mmux_char_t:			true,			\
           mmux_ascii_t:		true,			\
]]])m4_dnl
           mmux_schar_t:		true,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:		false,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:		true,			\
           mmux_libc_uid_t:		false,			\
           mmux_libc_gid_t:		false,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			true,			\
           mmux_clock_t:		true,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:		false,			\
           mmux_libc_ino_t:		false,			\
           mmux_libc_dev_t:		false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

#define mmux_ctype_is_signed_p(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t *:		false,			\
	   mmux_ascii_t *:		false,			\
]]],[[[m4_dnl
	   mmux_char_t *:		true,			\
	   mmux_ascii_t *:		true,			\
]]])m4_dnl
           mmux_schar_t *:		true,			\
           mmux_uchar_t *:		false,			\
           mmux_sshort_t *:		true,			\
           mmux_ushort_t *:		false,			\
           mmux_sint_t *:		true,			\
           mmux_uint_t *:		false,			\
           mmux_slong_t *:		true,			\
           mmux_ulong_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		true,			\
	   mmux_flonumdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		true,			\
	   mmux_flonumcdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		true,			\
]]])m4_dnl
	   mmux_sint8_t *:		true,			\
	   mmux_uint8_t *:		false,			\
	   mmux_sint16_t *:		true,			\
	   mmux_uint16_t *:		false,			\
	   mmux_sint32_t *:		true,			\
	   mmux_uint32_t *:		false,			\
	   mmux_sint64_t *:		true,			\
	   mmux_uint64_t *:		false,			\
	   mmux_byte_t *:			true,			\
	   mmux_octet_t *:		false,			\
           mmux_ssize_t *:		true,			\
           mmux_usize_t *:		false,			\
           mmux_sintmax_t *:		true,			\
           mmux_uintmax_t *:		false,			\
           mmux_sintptr_t *:		true,			\
           mmux_uintptr_t *:		false,			\
           mmux_libc_mode_t *:		false,			\
           mmux_off_t *:			true,			\
           mmux_libc_pid_t *:		true,			\
           mmux_libc_uid_t *:		false,			\
           mmux_libc_gid_t *:		false,			\
           mmux_ptrdiff_t *:		true,			\
           mmux_wchar_t *:		true,			\
           mmux_wint_t *:			false,			\
           mmux_time_t *:			true,			\
           mmux_clock_t *:		true,			\
           mmux_libc_socklen_t *:		false,			\
           mmux_libc_rlim_t *:		false,			\
           mmux_libc_ino_t *:		false,			\
           mmux_libc_dev_t *:		false,			\
           mmux_libc_nlink_t *:		false,			\
           mmux_libc_blkcnt_t *:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_unsigned(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t:			true,			\
	   mmux_ascii_t:		true,			\
]]],[[[m4_dnl
	   mmux_char_t:			false,			\
	   mmux_ascii_t:		false,			\
]]])m4_dnl
           mmux_schar_t:		false,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:		true,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:		false,			\
           mmux_libc_uid_t:		true,			\
           mmux_libc_gid_t:		true,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			false,			\
           mmux_clock_t:		false,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:		true,			\
           mmux_libc_ino_t:		true,			\
           mmux_libc_dev_t:		true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

#define mmux_ctype_is_unsigned_p(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t *:		true,			\
	   mmux_ascii_t *:		true,			\
]]],[[[m4_dnl
	   mmux_char_t *:		false,			\
	   mmux_ascii_t *:		false,			\
]]])m4_dnl
           mmux_schar_t *:		false,			\
           mmux_uchar_t *:		true,			\
           mmux_sshort_t *:		false,			\
           mmux_ushort_t *:		true,			\
           mmux_sint_t *:		false,			\
           mmux_uint_t *:		true,			\
           mmux_slong_t *:		false,			\
           mmux_ulong_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		false,			\
	   mmux_flonumdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		false,			\
	   mmux_flonumcdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		false,			\
]]])m4_dnl
	   mmux_sint8_t *:		false,			\
	   mmux_uint8_t *:		true,			\
	   mmux_sint16_t *:		false,			\
	   mmux_uint16_t *:		true,			\
	   mmux_sint32_t *:		false,			\
	   mmux_uint32_t *:		true,			\
	   mmux_sint64_t *:		false,			\
	   mmux_uint64_t *:		true,			\
	   mmux_byte_t *:			false,			\
	   mmux_octet_t *:		true,			\
           mmux_ssize_t *:		false,			\
           mmux_usize_t *:		true,			\
           mmux_sintmax_t *:		false,			\
           mmux_uintmax_t *:		true,			\
           mmux_sintptr_t *:		false,			\
           mmux_uintptr_t *:		true,			\
           mmux_libc_mode_t *:		true,			\
           mmux_off_t *:			false,			\
           mmux_libc_pid_t *:		false,			\
           mmux_libc_uid_t *:		true,			\
           mmux_libc_gid_t *:		true,			\
           mmux_ptrdiff_t *:		false,			\
           mmux_wchar_t *:		false,			\
           mmux_wint_t *:			true,			\
           mmux_time_t *:			false,			\
           mmux_clock_t *:		false,			\
           mmux_libc_socklen_t *:		true,			\
           mmux_libc_rlim_t *:		true,			\
           mmux_libc_ino_t *:		true,			\
           mmux_libc_dev_t *:		true,			\
           mmux_libc_nlink_t *:		true,			\
           mmux_libc_blkcnt_t *:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_exact_integer(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
	   mmux_ascii_t:		true,			\
	   mmux_char_t:			true,			\
           mmux_schar_t:		true,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:		true,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:		true,			\
           mmux_libc_uid_t:		true,			\
           mmux_libc_gid_t:		true,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			true,			\
           mmux_clock_t:		true,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:		true,			\
           mmux_libc_ino_t:		true,			\
           mmux_libc_dev_t:		true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

#define mmux_ctype_is_exact_integer_p(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		true,			\
	   mmux_ascii_t *:		true,			\
	   mmux_char_t *:		true,			\
           mmux_schar_t *:		true,			\
           mmux_uchar_t *:		true,			\
           mmux_sshort_t *:		true,			\
           mmux_ushort_t *:		true,			\
           mmux_sint_t *:			true,			\
           mmux_uint_t *:			true,			\
           mmux_slong_t *:		true,			\
           mmux_ulong_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		false,			\
	   mmux_flonumdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		false,			\
	   mmux_flonumcdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		false,			\
]]])m4_dnl
	   mmux_sint8_t *:		true,			\
	   mmux_uint8_t *:		true,			\
	   mmux_sint16_t *:		true,			\
	   mmux_uint16_t *:		true,			\
	   mmux_sint32_t *:		true,			\
	   mmux_uint32_t *:		true,			\
	   mmux_sint64_t *:		true,			\
	   mmux_uint64_t *:		true,			\
	   mmux_byte_t *:			true,			\
	   mmux_octet_t *:		true,			\
           mmux_ssize_t *:		true,			\
           mmux_usize_t *:		true,			\
           mmux_sintmax_t *:		true,			\
           mmux_uintmax_t *:		true,			\
           mmux_sintptr_t *:		true,			\
           mmux_uintptr_t *:		true,			\
           mmux_libc_mode_t *:		true,			\
           mmux_off_t *:			true,			\
           mmux_libc_pid_t *:		true,			\
           mmux_libc_uid_t *:		true,			\
           mmux_libc_gid_t *:		true,			\
           mmux_ptrdiff_t *:		true,			\
           mmux_wchar_t *:		true,			\
           mmux_wint_t *:			true,			\
           mmux_time_t *:			true,			\
           mmux_clock_t *:		true,			\
           mmux_libc_socklen_t *:		true,			\
           mmux_libc_rlim_t *:		true,			\
           mmux_libc_ino_t *:		true,			\
           mmux_libc_dev_t *:		true,			\
           mmux_libc_nlink_t *:		true,			\
           mmux_libc_blkcnt_t *:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_real_number(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
	   mmux_ascii_t:		true,			\
	   mmux_char_t:			true,			\
           mmux_schar_t:		true,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:		true,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:		true,			\
           mmux_libc_uid_t:		true,			\
           mmux_libc_gid_t:		true,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			true,			\
           mmux_clock_t:		true,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:		true,			\
           mmux_libc_ino_t:		true,			\
           mmux_libc_dev_t:		true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

#define mmux_ctype_is_real_number_p(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		true,			\
	   mmux_ascii_t *:		true,			\
	   mmux_char_t *:		true,			\
           mmux_schar_t *:		true,			\
           mmux_uchar_t *:		true,			\
           mmux_sshort_t *:		true,			\
           mmux_ushort_t *:		true,			\
           mmux_sint_t *:			true,			\
           mmux_uint_t *:			true,			\
           mmux_slong_t *:		true,			\
           mmux_ulong_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		true,			\
	   mmux_flonumdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		false,			\
	   mmux_flonumcdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		false,			\
]]])m4_dnl
	   mmux_sint8_t *:		true,			\
	   mmux_uint8_t *:		true,			\
	   mmux_sint16_t *:		true,			\
	   mmux_uint16_t *:		true,			\
	   mmux_sint32_t *:		true,			\
	   mmux_uint32_t *:		true,			\
	   mmux_sint64_t *:		true,			\
	   mmux_uint64_t *:		true,			\
	   mmux_byte_t *:			true,			\
	   mmux_octet_t *:		true,			\
           mmux_ssize_t *:		true,			\
           mmux_usize_t *:		true,			\
           mmux_sintmax_t *:		true,			\
           mmux_uintmax_t *:		true,			\
           mmux_sintptr_t *:		true,			\
           mmux_uintptr_t *:		true,			\
           mmux_libc_mode_t *:		true,			\
           mmux_off_t *:			true,			\
           mmux_libc_pid_t *:		true,			\
           mmux_libc_uid_t *:		true,			\
           mmux_libc_gid_t *:		true,			\
           mmux_ptrdiff_t *:		true,			\
           mmux_wchar_t *:		true,			\
           mmux_wint_t *:			true,			\
           mmux_time_t *:			true,			\
           mmux_clock_t *:		true,			\
           mmux_libc_socklen_t *:		true,			\
           mmux_libc_rlim_t *:		true,			\
           mmux_libc_ino_t *:		true,			\
           mmux_libc_dev_t *:		true,			\
           mmux_libc_nlink_t *:		true,			\
           mmux_libc_blkcnt_t *:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_complex_number(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_ascii_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:		false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:		false,			\
           mmux_libc_uid_t:		false,			\
           mmux_libc_gid_t:		false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_clock_t:		false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:		false,			\
           mmux_libc_ino_t:		false,			\
           mmux_libc_dev_t:		false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

#define mmux_ctype_is_complex_number_p(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		false,			\
	   mmux_ascii_t *:		false,			\
	   mmux_char_t *:		false,			\
           mmux_schar_t *:		false,			\
           mmux_uchar_t *:		false,			\
           mmux_sshort_t *:		false,			\
           mmux_ushort_t *:		false,			\
           mmux_sint_t *:			false,			\
           mmux_uint_t *:			false,			\
           mmux_slong_t *:		false,			\
           mmux_ulong_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		false,			\
	   mmux_flonumdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		true,			\
	   mmux_flonumcdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		true,			\
]]])m4_dnl
	   mmux_sint8_t *:		false,			\
	   mmux_uint8_t *:		false,			\
	   mmux_sint16_t *:		false,			\
	   mmux_uint16_t *:		false,			\
	   mmux_sint32_t *:		false,			\
	   mmux_uint32_t *:		false,			\
	   mmux_sint64_t *:		false,			\
	   mmux_uint64_t *:		false,			\
	   mmux_byte_t *:			false,			\
	   mmux_octet_t *:		false,			\
           mmux_ssize_t *:		false,			\
           mmux_usize_t *:		false,			\
           mmux_sintmax_t *:		false,			\
           mmux_uintmax_t *:		false,			\
           mmux_sintptr_t *:		false,			\
           mmux_uintptr_t *:		false,			\
           mmux_libc_mode_t *:		false,			\
           mmux_off_t *:			false,			\
           mmux_libc_pid_t *:		false,			\
           mmux_libc_uid_t *:		false,			\
           mmux_libc_gid_t *:		false,			\
           mmux_ptrdiff_t *:		false,			\
           mmux_wchar_t *:		false,			\
           mmux_wint_t *:			false,			\
           mmux_time_t *:			false,			\
           mmux_clock_t *:		false,			\
           mmux_libc_socklen_t *:		false,			\
           mmux_libc_rlim_t *:		false,			\
           mmux_libc_ino_t *:		false,			\
           mmux_libc_dev_t *:		false,			\
           mmux_libc_nlink_t *:		false,			\
           mmux_libc_blkcnt_t *:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_flonum(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_ascii_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:		false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:		false,			\
           mmux_libc_uid_t:		false,			\
           mmux_libc_gid_t:		false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_clock_t:		false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:		false,			\
           mmux_libc_ino_t:		false,			\
           mmux_libc_dev_t:		false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

#define mmux_ctype_is_flonum_p(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		false,			\
	   mmux_ascii_t *:		false,			\
	   mmux_char_t *:		false,			\
           mmux_schar_t *:		false,			\
           mmux_uchar_t *:		false,			\
           mmux_sshort_t *:		false,			\
           mmux_ushort_t *:		false,			\
           mmux_sint_t *:			false,			\
           mmux_uint_t *:			false,			\
           mmux_slong_t *:		false,			\
           mmux_ulong_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		true,			\
	   mmux_flonumdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		false,			\
	   mmux_flonumcdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		false,			\
]]])m4_dnl
	   mmux_sint8_t *:		false,			\
	   mmux_uint8_t *:		false,			\
	   mmux_sint16_t *:		false,			\
	   mmux_uint16_t *:		false,			\
	   mmux_sint32_t *:		false,			\
	   mmux_uint32_t *:		false,			\
	   mmux_sint64_t *:		false,			\
	   mmux_uint64_t *:		false,			\
	   mmux_byte_t *:			false,			\
	   mmux_octet_t *:		false,			\
           mmux_ssize_t *:		false,			\
           mmux_usize_t *:		false,			\
           mmux_sintmax_t *:		false,			\
           mmux_uintmax_t *:		false,			\
           mmux_sintptr_t *:		false,			\
           mmux_uintptr_t *:		false,			\
           mmux_libc_mode_t *:		false,			\
           mmux_off_t *:			false,			\
           mmux_libc_pid_t *:		false,			\
           mmux_libc_uid_t *:		false,			\
           mmux_libc_gid_t *:		false,			\
           mmux_ptrdiff_t *:		false,			\
           mmux_wchar_t *:		false,			\
           mmux_wint_t *:			false,			\
           mmux_time_t *:			false,			\
           mmux_clock_t *:		false,			\
           mmux_libc_socklen_t *:		false,			\
           mmux_libc_rlim_t *:		false,			\
           mmux_libc_ino_t *:		false,			\
           mmux_libc_dev_t *:		false,			\
           mmux_libc_nlink_t *:		false,			\
           mmux_libc_blkcnt_t *:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_flonumc(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_ascii_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:		false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:		false,			\
           mmux_libc_uid_t:		false,			\
           mmux_libc_gid_t:		false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_clock_t:		false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:		false,			\
           mmux_libc_ino_t:		false,			\
           mmux_libc_dev_t:		false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

#define mmux_ctype_is_flonumc_p(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t *:		false,			\
	   mmux_ascii_t *:		false,			\
	   mmux_char_t *:		false,			\
           mmux_schar_t *:		false,			\
           mmux_uchar_t *:		false,			\
           mmux_sshort_t *:		false,			\
           mmux_ushort_t *:		false,			\
           mmux_sint_t *:			false,			\
           mmux_uint_t *:			false,			\
           mmux_slong_t *:		false,			\
           mmux_ulong_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t *:		false,			\
	   mmux_flonumdb_t *:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t *:		true,			\
	   mmux_flonumcdb_t *:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		true,			\
]]])m4_dnl
	   mmux_sint8_t *:		false,			\
	   mmux_uint8_t *:		false,			\
	   mmux_sint16_t *:		false,			\
	   mmux_uint16_t *:		false,			\
	   mmux_sint32_t *:		false,			\
	   mmux_uint32_t *:		false,			\
	   mmux_sint64_t *:		false,			\
	   mmux_uint64_t *:		false,			\
	   mmux_byte_t *:			false,			\
	   mmux_octet_t *:		false,			\
           mmux_ssize_t *:		false,			\
           mmux_usize_t *:		false,			\
           mmux_sintmax_t *:		false,			\
           mmux_uintmax_t *:		false,			\
           mmux_sintptr_t *:		false,			\
           mmux_uintptr_t *:		false,			\
           mmux_libc_mode_t *:		false,			\
           mmux_off_t *:			false,			\
           mmux_libc_pid_t *:		false,			\
           mmux_libc_uid_t *:		false,			\
           mmux_libc_gid_t *:		false,			\
           mmux_ptrdiff_t *:		false,			\
           mmux_wchar_t *:		false,			\
           mmux_wint_t *:			false,			\
           mmux_time_t *:			false,			\
           mmux_clock_t *:		false,			\
           mmux_libc_socklen_t *:		false,			\
           mmux_libc_rlim_t *:		false,			\
           mmux_libc_ino_t *:		false,			\
           mmux_libc_dev_t *:		false,			\
           mmux_libc_nlink_t *:		false,			\
           mmux_libc_blkcnt_t *:		false))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_PREDICATES_H */

/* end of file */
