/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Aug 30, 2025

  Abstract

	This is a public header file defining the API of "_DecimalN" types support in
	the library  MMUX CC  Types; it is  included by  "mmux-cc-types-libdfp.h"; it
	must not be included by itself.

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

#ifndef MMUX_CC_TYPES_LIBDFP_MATHEMATICS_H
#define MMUX_CC_TYPES_LIBDFP_MATHEMATICS_H	1


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumd prototypes.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_UNARY_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_BINARY_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_BINARY_SINT_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_operation_sint_standard_flonumd$1_t mmux_standard_flonumd$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_MATH_PROTOS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		sin)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		cos)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		tan)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		asin)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		acos)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		atan)
DEFINE_STANDARD_FLONUMD_BINARY_PROTO($1,	atan2)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		sinh)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		cosh)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		tanh)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		asinh)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		acosh)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		atanh)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		exp)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		exp2)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		exp10)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		log)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		log10)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		log2)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		logb)

DEFINE_STANDARD_FLONUMD_BINARY_PROTO($1,	pow)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		square)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		cube)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		sqrt)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		cbrt)
DEFINE_STANDARD_FLONUMD_BINARY_PROTO($1,	hypot)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		expm1)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		log1p)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		erf)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		erfc)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		lgamma)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		tgamma)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		j0)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		j1)
DEFINE_STANDARD_FLONUMD_BINARY_SINT_PROTO($1,	jn)

DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		y0)
DEFINE_STANDARD_FLONUMD_UNARY_PROTO($1,		y1)
DEFINE_STANDARD_FLONUMD_BINARY_SINT_PROTO($1,	yn)
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_MATH_PROTOS(32)
DEFINE_STANDARD_FLONUMD_MATH_PROTOS(64)
DEFINE_STANDARD_FLONUMD_MATH_PROTOS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd prototypes.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_UNARY_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonumcd$1_t mmux_standard_flonumcd$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUMCD_BINARY_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonumcd$1_t mmux_standard_flonumcd$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUMCD_MATH_PROTOS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	sin)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	cos)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	tan)

DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	asin)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	acos)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	atan)

DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	sinh)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	cosh)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	tanh)

DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	asinh)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	acosh)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	atanh)

DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	exp)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	exp2)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	exp10)

DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	log)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	log2)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	log10)

DEFINE_STANDARD_FLONUMCD_BINARY_PROTO($1,	pow)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	square)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	cube)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	sqrt)
DEFINE_STANDARD_FLONUMCD_UNARY_PROTO($1,	cbrt)
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_MATH_PROTOS(32)
DEFINE_STANDARD_FLONUMCD_MATH_PROTOS(64)
DEFINE_STANDARD_FLONUMCD_MATH_PROTOS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_LIBDFP_MATHEMATICS_H */

/* end of file */
