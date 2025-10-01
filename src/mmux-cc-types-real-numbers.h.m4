/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep 19, 2025

  Abstract

	This is  module implements the real  numbers functions.  This header  file is
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

#ifndef MMUX_CC_TYPES_REAL_NUMBERS_H
#define MMUX_CC_TYPES_REAL_NUMBERS_H 1


/** --------------------------------------------------------------------
 ** Real number functions: standard exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_sign (mmux_standard_$1_t op)
{
  if (mmux_standard_$1_is_positive(op)) {
    return mmux_standard_$1_constant_one();
  } else if (mmux_standard_$1_is_negative(op)) {
    return mmux_standard_$1_neg(mmux_standard_$1_constant_one());
  } else {
    return mmux_standard_$1_constant_zero();
  }
}
]]])]]])
m4_divert(0)
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[char]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[schar]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sint]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uint]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[slong]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[byte]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[octet]]])

DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_EXACT_INTEGER_REAL_NUMBER_INLINE_FUNCTIONS([[[time]]])


/** --------------------------------------------------------------------
 ** Real number functions: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_sign
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_ceil
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_floor
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_trunc
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_rint
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_nearbyint
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_round
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_roundeven
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_slong_t mmux_standard_flonum$1_lrint (mmux_standard_flonum$1_t op)
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_slong_t mmux_standard_flonum$1_lround (mmux_standard_flonum$1_t op)
  __attribute__((__const__));

#ifdef MMUX_CC_TYPES_HAS_SLLONG
mmux_cc_types_decl mmux_standard_sllong_t mmux_standard_flonum$1_llrint (mmux_standard_flonum$1_t op)
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_sllong_t mmux_standard_flonum$1_llround (mmux_standard_flonum$1_t op)
  __attribute__((__const__));
#endif

mmux_cc_types_decl mmux_standard_flonum$1_t mmux_standard_flonum$1_modf (mmux_standard_flonum$1_t op,
									 mmux_standard_flonum$1_t * integer_part_p);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(fl)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(db)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(ldb)

DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f32)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f64)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f128)

DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f32x)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f64x)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_PROTOS(f128x)


/** --------------------------------------------------------------------
 ** Real number functions: standard flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_INLINE_FUNCTION]]],[[[mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_$2 (mmux_standard_flonumc$1_t op)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_$2(mmux_standard_flonumc$1_real_part(op)),
					     mmux_standard_flonum$1_$2(mmux_standard_flonumc$1_imag_part(op)));
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
DEFINE_UNARY_INLINE_FUNCTION($1,	sign)
DEFINE_UNARY_INLINE_FUNCTION($1,	ceil)
DEFINE_UNARY_INLINE_FUNCTION($1,	floor)
DEFINE_UNARY_INLINE_FUNCTION($1,	trunc)
DEFINE_UNARY_INLINE_FUNCTION($1,	rint)
DEFINE_UNARY_INLINE_FUNCTION($1,	nearbyint)
DEFINE_UNARY_INLINE_FUNCTION($1,	round)
DEFINE_UNARY_INLINE_FUNCTION($1,	roundeven)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[fl]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[db]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[ldb]]])

DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f32]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f64]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f128]]])

DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f32x]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f64x]]])
DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS([[[f128x]]])


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-real-numbers.h>
#endif


/** --------------------------------------------------------------------
 ** Real number functions: sign.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_NUMBER_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_sign (mmux_$1_t op)
{
  return mmux_$1(mmux_standard_$1_sign(op.value));
}
]]])]]])
m4_divert(0)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[char]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[schar]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sint]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uint]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[slong]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sllong]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[ullong]]])

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[byte]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[octet]]])

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[usize]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[off]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[wint]]])
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS([[[time]]])

/* ------------------------------------------------------------------ */

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumfl)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumdb)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumldb)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf32)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf64)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf128)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf32x)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf64x)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumf128x)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumd32)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumd64)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumd128)

/* ------------------------------------------------------------------ */

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcfl)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcdb)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcldb)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf32)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf64)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf128)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf32x)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf64x)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcf128x)

DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcd32)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcd64)
DEFINE_REAL_NUMBER_INLINE_FUNCTIONS(flonumcd128)


/** --------------------------------------------------------------------
 ** Real number functions: flonum floating-point numbers rounding.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_INLINE_FUNCTION]]],[[[mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_$1(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_SLONG_UNARY_INLINE_FUNCTION]]],[[[mmux_cc_types_inline_decl mmux_slong_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_slong(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_SLLONG_UNARY_INLINE_FUNCTION]]],[[[mmux_cc_types_inline_decl mmux_sllong_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_sllong(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_INLINE_FUNCTION($1,	ceil)
DEFINE_UNARY_INLINE_FUNCTION($1,	floor)
DEFINE_UNARY_INLINE_FUNCTION($1,	trunc)
DEFINE_UNARY_INLINE_FUNCTION($1,	rint)
DEFINE_UNARY_INLINE_FUNCTION($1,	nearbyint)
DEFINE_UNARY_INLINE_FUNCTION($1,	round)
DEFINE_UNARY_INLINE_FUNCTION($1,	roundeven)

DEFINE_SLONG_UNARY_INLINE_FUNCTION($1,	lrint)
DEFINE_SLONG_UNARY_INLINE_FUNCTION($1,	lround)
#ifdef MMUX_CC_TYPES_HAS_SLLONG
DEFINE_SLLONG_UNARY_INLINE_FUNCTION($1,	llrint)
DEFINE_SLLONG_UNARY_INLINE_FUNCTION($1,	llround)
#endif

mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_modf (mmux_$1_t op, mmux_$1_t * integer_part_p)
{
  return mmux_$1(mmux_standard_$1_modf(op.value, &(integer_part_p->value)));
}
]]])]]])
m4_divert(0)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumfl)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumdb)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumldb)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf32)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf64)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf128)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf32x)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf64x)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumf128x)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumd32)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumd64)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumd128)


/** --------------------------------------------------------------------
 ** Real number functions: flonumc floating-point numbers rounding.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_INLINE_FUNCTION]]],[[[mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_$1(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_INLINE_FUNCTION($1,	ceil)
DEFINE_UNARY_INLINE_FUNCTION($1,	floor)
DEFINE_UNARY_INLINE_FUNCTION($1,	trunc)
DEFINE_UNARY_INLINE_FUNCTION($1,	rint)
DEFINE_UNARY_INLINE_FUNCTION($1,	nearbyint)
DEFINE_UNARY_INLINE_FUNCTION($1,	round)
DEFINE_UNARY_INLINE_FUNCTION($1,	roundeven)
]]])]]])
m4_divert(0)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcfl)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcdb)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcldb)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf32)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf64)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf128)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf32x)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf64x)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcf128x)

DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcd32)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcd64)
DEFINE_REAL_NUMBER_FLONUM_INLINE_FUNCTIONS(flonumcd128)


/** --------------------------------------------------------------------
 ** Generic macros: flonum and flonumc rounding.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(ceil)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(floor)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(trunc)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(rint)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(nearbyint)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(round)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC(roundeven)


/** --------------------------------------------------------------------
 ** Generic macros: flonum rounding.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_UNARY_FUNCTION_FLONUM(lrint)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM(lround)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM(llrint)
DEFINE_GENERIC_UNARY_FUNCTION_FLONUM(llround)


/** --------------------------------------------------------------------
 ** Other generic macros.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC(sign)
DEFINE_GENERIC_BINARY_FUNCTION_FLONUM(modf)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_REAL_NUMBERS_H_H */

/* end of file */
