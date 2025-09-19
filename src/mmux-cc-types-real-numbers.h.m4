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
m4_define([[[DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_sign
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(fl)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(ldb)

DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f32)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f64)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f128)

DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f32x)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f64x)
DEFINE_STANDARD_FLONUM_REAL_NUMBERS_INLINE_FUNCTIONS(f128x)


/** --------------------------------------------------------------------
 ** Real number functions: standard flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMC_REAL_NUMBERS_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonumc$1_t mmux_standard_flonumc$1_sign
  __attribute__((__const__));
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
 ** Real number functions.
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
 ** Generic macros.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_sign(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_char_t:			mmux_char_sign,			\
           mmux_schar_t:		mmux_schar_sign,		\
           mmux_uchar_t:		mmux_uchar_sign,		\
           mmux_sshort_t:		mmux_sshort_sign,		\
           mmux_ushort_t:		mmux_ushort_sign,		\
           mmux_sint_t:			mmux_sint_sign,			\
           mmux_uint_t:			mmux_uint_sign,			\
           mmux_slong_t:		mmux_slong_sign,		\
           mmux_ulong_t:		mmux_ulong_sign,		\
	   mmux_sint8_t:		mmux_sint8_sign,		\
	   mmux_uint8_t:		mmux_uint8_sign,		\
	   mmux_sint16_t:		mmux_sint16_sign,		\
	   mmux_uint16_t:		mmux_uint16_sign,		\
	   mmux_sint32_t:		mmux_sint32_sign,		\
	   mmux_uint32_t:		mmux_uint32_sign,		\
	   mmux_sint64_t:		mmux_sint64_sign,		\
	   mmux_uint64_t:		mmux_uint64_sign,		\
									\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_sign,		\
]]])m4_dnl
									\
	   mmux_byte_t:			mmux_byte_sign,			\
	   mmux_octet_t:		mmux_octet_sign,		\
           mmux_ssize_t:		mmux_ssize_sign,		\
           mmux_usize_t:		mmux_usize_sign,		\
           mmux_sintmax_t:		mmux_sintmax_sign,		\
           mmux_uintmax_t:		mmux_uintmax_sign,		\
           mmux_sintptr_t:		mmux_sintptr_sign,		\
           mmux_uintptr_t:		mmux_uintptr_sign,		\
           mmux_off_t:			mmux_off_sign,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sign,		\
           mmux_wchar_t:		mmux_wchar_sign,		\
           mmux_wint_t:			mmux_wint_sign,			\
           mmux_time_t:			mmux_time_sign,			\
	    \
	   mmux_flonumfl_t:		mmux_flonumfl_sign,		\
	   mmux_flonumdb_t:		mmux_flonumdb_sign,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_sign,		\
]]])m4_dnl
	    \
	   mmux_flonumcfl_t:		mmux_flonumcfl_sign,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_sign,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_sign,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_sign,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_REAL_NUMBERS_H_H */

/* end of file */
