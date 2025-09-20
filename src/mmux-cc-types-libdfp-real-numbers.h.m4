/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep 19, 2025

  Abstract

	This  is  module   implements  the  real  numbers   functions  for  _DecimalN
	floating-point  numbers.  This  header file  is included  by the  main header
	"mmux-cc-types-libdfp.h" and it must not be included by itself.

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

#ifndef MMUX_CC_TYPES_LIBDFP_REAL_NUMBERS_H
#define MMUX_CC_TYPES_LIBDFP_REAL_NUMBERS_H		1


/** --------------------------------------------------------------------
 ** Real number functions: standard flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
mmux_cc_types_decl mmux_standard_flonumd$1_t mmux_standard_flonumd$1_sign (mmux_standard_flonumd$1_t op)
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS_AND_PROTOS(32)
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS_AND_PROTOS(64)
DEFINE_STANDARD_FLONUMD_REAL_NUMBER_FUNCTIONS_AND_PROTOS(128)


/** --------------------------------------------------------------------
 ** Real number functions: standard flonumcd
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_REAL_NUMBER_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumcd$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_sign (mmux_standard_flonumcd$1_t op)
{
  return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_sign(mmux_standard_flonumcd$1_real_part(op)),
					      mmux_standard_flonumd$1_sign(mmux_standard_flonumcd$1_imag_part(op)));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_REAL_NUMBER_INLINE_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_REAL_NUMBER_INLINE_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_REAL_NUMBER_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_LIBDFP_REAL_NUMBERS_H */

/* end of file */
