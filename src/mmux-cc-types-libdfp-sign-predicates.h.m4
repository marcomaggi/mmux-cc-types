/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep  3, 2025

  Abstract

	This module implements sign predicates for _DecimalN types through libdfp.

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

#ifndef MMUX_CC_TYPES_LIBDFP_SIGN_PREDICATES_H
#define MMUX_CC_TYPES_LIBDFP_SIGN_PREDICATES_H		1


/** --------------------------------------------------------------------
 ** Sign predicates: standard flonumd
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMD_PREDICATE_PROTOS]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_zero
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_positive
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_negative
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_non_positive
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_non_negative
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_nan
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_infinite
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_finite
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_normal
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonumd$1_t  mmux_standard_flonumd$1_is_subnormal
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_PREDICATE_PROTOS(32)
DEFINE_FLONUMD_PREDICATE_PROTOS(64)
DEFINE_FLONUMD_PREDICATE_PROTOS(128)


/** --------------------------------------------------------------------
 ** Sign predicates: flonumd
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumd$1_$2 (mmux_flonumd$1_t op)
{
  return mmux_standard_flonumd$1_$2(op.value);
}]]])

m4_define([[[DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTIONS]]],[[[m4_dnl
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_zero)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_positive)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_negative)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_non_positive)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_non_negative)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_nan)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_infinite)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_finite)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_normal)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	is_subnormal)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTIONS(32)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTIONS(64)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Sign predicates: standard flonumcd
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_standard_flonumcd$1_$2 (mmux_standard_flonumcd$1_t op)
{
  return (mmux_standard_flonumd$1_$2(mmux_standard_flonumcd$1_real_part(op)) &&
	  mmux_standard_flonumd$1_$2(mmux_standard_flonumcd$1_imag_part(op)))?
    true : false;
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMCD_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_zero)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_positive)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_negative)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_non_positive)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_non_negative)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_nan)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_infinite)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_finite)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_normal)
DEFINE_STANDARD_FLONUMCD_PREDICATE_INLINE_FUNCTION($1,	is_subnormal)
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Sign predicates: flonumcd
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op)
{
  return mmux_standard_flonumcd$1_$2(op.value);
}]]])

m4_define([[[DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTIONS]]],[[[m4_dnl
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_zero)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_positive)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_negative)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_non_positive)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_non_negative)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_nan)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_infinite)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_finite)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_normal)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTION($1,	is_subnormal)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTIONS(32)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTIONS(64)
DEFINE_FLONUMCD_SIGN_PREDICATE_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* define MMUX_CC_TYPES_LIBDFP_SIGN_PREDICATES_H */

/* end of file */
