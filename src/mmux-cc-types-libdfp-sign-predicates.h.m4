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


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline bool
mmux_flonum$1_is_$2 (mmux_flonum$1_t op)
{
  return mmux_standard_flonum$1_is_$2(op.value);
}]]])

m4_define([[[DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_zero
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_nan
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_infinite
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_positive
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_negative
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_non_positive
  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_standard_flonum$1_t  mmux_standard_flonum$1_is_non_negative
  __attribute__((__const__));

DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	zero)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	nan)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	infinite)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	positive)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	negative)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	non_positive)
DEFINE_FLONUMD_PREDICATE_INLINE_FUNCTION($1,	non_negative)
]]])
m4_divert(0)m4_dnl
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(d32)
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(d64)
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(d128)
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(cd32)
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(cd64)
DEFINE_PREDICATE_PROTOS_AND_INLINE_FUNCTIONS(cd128)

/* end of file */
