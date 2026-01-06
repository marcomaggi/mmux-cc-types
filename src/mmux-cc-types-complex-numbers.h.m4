/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  7, 2025

  Abstract

	This is module implements the complex  number functions.  This header file is
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

#ifndef MMUX_CC_TYPES_COMPLEX_NUMBERS_H
#define MMUX_CC_TYPES_COMPLEX_NUMBERS_H 1


/** --------------------------------------------------------------------
 ** Complex numbers: standard exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_real_part (mmux_standard_$1_t op)
{
  return op;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_imag_part (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_$1_literal(0);
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_argument (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_$1_literal(0);
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_conjugate (mmux_standard_$1_t op MMUX_CC_TYPES_UNUSED)
{
  return op;
}]]])]]])
m4_divert(0)
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[char]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[schar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[slong]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[byte]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[octet]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_mode]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_pid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_uid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_gid]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[time]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[clock]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_socklen]]])
DEFINE_STANDARD_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_rlim]]])


/** --------------------------------------------------------------------
 ** Complex numbers: exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EXACT_INTEGER_UNARY_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_$1(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_EXACT_INTEGER_UNARY_FUNCTION($1,	real_part)
DEFINE_EXACT_INTEGER_UNARY_FUNCTION($1,	imag_part)
DEFINE_EXACT_INTEGER_UNARY_FUNCTION($1,	argument)
DEFINE_EXACT_INTEGER_UNARY_FUNCTION($1,	conjugate)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[char]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[schar]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[slong]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[byte]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[octet]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[usize]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[off]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[wint]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[time]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[clock]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_mode]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_pid]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_uid]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_gid]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_socklen]]])
DEFINE_EXACT_INTEGER_COMPLEX_INLINE_FUNCTIONS([[[libc_rlim]]])


/** --------------------------------------------------------------------
 ** Complex numbers: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_argument (mmux_standard_flonum$1_t op MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_flonum$1_literal(0.0);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_conjugate (mmux_standard_flonum$1_t op)
{
  return op;

}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(fl)
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(ldb,	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f32,	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f64,	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f128,	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f32x,	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f64x,	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_STANDARD_FLONUM_COMPLEX_INLINE_FUNCTIONS(f128x,	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Complex numbers: standard flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_standard_flonum$1_t mmux_standard_flonumc$1_argument (mmux_standard_flonumc$1_t op)
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_flonumc$1_t mmux_standard_flonumc$1_conjugate (mmux_standard_flonumc$1_t op)
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[fl]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[db]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_STANDARD_FLONUMC_COMPLEX_PROTOS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-complex-numbers.h>
#endif


/** --------------------------------------------------------------------
 ** Complex numbers: flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_argument (mmux_flonum$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonum$1_argument(op.value));
}
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_conjugate (mmux_flonum$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonum$1_conjugate(op.value));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[fl]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[db]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[d32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[d64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUM_COMPLEX_INLINE_FUNCTIONS([[[d128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Complex numbers: flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonumc$1_argument (mmux_flonumc$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonumc$1_argument(op.value));
}
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_conjugate (mmux_flonumc$1_t op)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_conjugate(op.value));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[fl]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[db]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[d32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD32]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[d64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD64]]])
DEFINE_FLONUMC_COMPLEX_INLINE_FUNCTIONS([[[d128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD128]]])


/** --------------------------------------------------------------------
 ** Generic macros.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC(real_part)
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC(imag_part)
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC(argument)
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC(conjugate)

#define mmux_ctype_rectangular(VALUE1,VALUE2)			\
  (_Generic((VALUE1),						\
    mmux_flonumfl_t:		mmux_flonumcfl_rectangular,	\
    mmux_flonumdb_t:		mmux_flonumcdb_rectangular,	\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
    mmux_flonumldb_t:		mmux_flonumcldb_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
    mmux_flonumf32_t:		mmux_flonumcf32_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
    mmux_flonumf64_t:		mmux_flonumcf64_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
    mmux_flonumf128_t:		mmux_flonumcf128_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
    mmux_flonumf32x_t:		mmux_flonumcf32x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
    mmux_flonumf64x_t:		mmux_flonumcf64x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
    mmux_flonumf128x_t:		mmux_flonumcf128x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
    mmux_flonumd32_t:		mmux_flonumcd32_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
    mmux_flonumd64_t:		mmux_flonumcd64_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
    mmux_flonumd128_t:		mmux_flonumcd128_rectangular,	\
]]])m4_dnl
default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))

#define mmux_ctype_rectangular_p(RESULT_P,VALUE1_P,VALUE2_P)			\
  (_Generic((RESULT_P),								\
            mmux_flonumcfl_t *:		mmux_flonumcfl_rectangular_p,		\
            mmux_flonumcdb_t *:		mmux_flonumcdb_rectangular_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
            mmux_flonumcldb_t *:	mmux_flonumcldb_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
            mmux_flonumcf32_t *:	mmux_flonumcf32_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
            mmux_flonumcf64_t *:	mmux_flonumcf64_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
            mmux_flonumcf128_t *:	mmux_flonumcf128_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
            mmux_flonumcf32x_t *:	mmux_flonumcf32x_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
            mmux_flonumcf64x_t *:	mmux_flonumcf64x_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
            mmux_flonumcf128x_t *:	mmux_flonumcf128x_rectangular_p,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
            mmux_flonumcd32_t *:	mmux_flonumcd32_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
            mmux_flonumcd64_t *:	mmux_flonumcd64_rectangular_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
            mmux_flonumcd128_t *:	mmux_flonumcd128_rectangular_p,	\
]]])m4_dnl
            default:			mmux_ctype_generic_error)((RESULT_P),(VALUE1_P),(VALUE2_P)))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_COMPLEX_NUMBERS_H */

/* end of file */
