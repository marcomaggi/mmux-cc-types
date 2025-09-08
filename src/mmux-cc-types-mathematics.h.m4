/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  8, 2025

  Abstract

	This is  module implements  the mathematics functions.   This header  file is
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

#ifndef MMUX_CC_TYPES_MATHEMATICS_H
#define MMUX_CC_TYPES_MATHEMATICS_H 1


/** --------------------------------------------------------------------
 ** Mathematics: standard flonum
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_BINARY_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonum$1_t mmux_standard_flonum$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_sint_operation_standard_flonum$1_t mmux_standard_flonum$1_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_PROTO($1,		sin)
DEFINE_UNARY_MATH_PROTO($1,		cos)
DEFINE_UNARY_MATH_PROTO($1,		tan)

DEFINE_UNARY_MATH_PROTO($1,		asin)
DEFINE_UNARY_MATH_PROTO($1,		acos)
DEFINE_UNARY_MATH_PROTO($1,		atan)
DEFINE_BINARY_MATH_PROTO($1,		atan2)

DEFINE_UNARY_MATH_PROTO($1,		sinh)
DEFINE_UNARY_MATH_PROTO($1,		cosh)
DEFINE_UNARY_MATH_PROTO($1,		tanh)

DEFINE_UNARY_MATH_PROTO($1,		asinh)
DEFINE_UNARY_MATH_PROTO($1,		acosh)
DEFINE_UNARY_MATH_PROTO($1,		atanh)

DEFINE_UNARY_MATH_PROTO($1,		exp)
DEFINE_UNARY_MATH_PROTO($1,		exp2)
DEFINE_UNARY_MATH_PROTO($1,		exp10)
DEFINE_UNARY_MATH_PROTO($1,		expm1)

DEFINE_UNARY_MATH_PROTO($1,		log)
DEFINE_UNARY_MATH_PROTO($1,		log2)
DEFINE_UNARY_MATH_PROTO($1,		log10)
DEFINE_UNARY_MATH_PROTO($1,		logb)
DEFINE_UNARY_MATH_PROTO($1,		log1p)

DEFINE_BINARY_MATH_PROTO($1,		pow)
DEFINE_UNARY_MATH_PROTO($1,		square)
DEFINE_UNARY_MATH_PROTO($1,		cube)
DEFINE_BINARY_MATH_PROTO($1,		hypot)
DEFINE_UNARY_MATH_PROTO($1,		sqrt)
DEFINE_UNARY_MATH_PROTO($1,		cbrt)

DEFINE_UNARY_MATH_PROTO($1,		erf)
DEFINE_UNARY_MATH_PROTO($1,		erfc)

DEFINE_UNARY_MATH_PROTO($1,		lgamma)
DEFINE_UNARY_MATH_PROTO($1,		tgamma)

DEFINE_UNARY_MATH_PROTO($1,		j0)
DEFINE_UNARY_MATH_PROTO($1,		j1)
DEFINE_BINARY_SINT_MATH_PROTO($1,	jn)

DEFINE_UNARY_MATH_PROTO($1,		y0)
DEFINE_UNARY_MATH_PROTO($1,		y1)
DEFINE_BINARY_SINT_MATH_PROTO($1,	yn)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(fl)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(db)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(ldb)

DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f32)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f64)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f128)

DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f32x)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f64x)
DEFINE_STANDARD_FLONUM_MATHEMATICS_PROTOS(f128x)


/** --------------------------------------------------------------------
 ** Mathematics: flonum
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_sint_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sin);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cos);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		tan);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		asin);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		acos);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		atan);
DEFINE_BINARY_MATH_INLINE_FUNCTION($1,		atan2);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sinh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cosh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		tanh);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		asinh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		acosh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		atanh);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp2);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp10);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		expm1);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log2);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log10);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		logb);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log1p);

DEFINE_BINARY_MATH_INLINE_FUNCTION($1,		pow);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		square);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cube);
DEFINE_BINARY_MATH_INLINE_FUNCTION($1,		hypot);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sqrt);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cbrt);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		erf);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		erfc);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		lgamma);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		tgamma);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		j0);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		j1);
DEFINE_BINARY_SINT_MATH_INLINE_FUNCTION($1,	jn);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		y0);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		y1);
DEFINE_BINARY_SINT_MATH_INLINE_FUNCTION($1,	yn);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(fl)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(db)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(ldb)

DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f32)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f64)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f128)

DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f32x)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f64x)
DEFINE_FLONUM_MATHEMATICS_INLINE_FUNCTIONS(f128x)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_unary_operation_flonumc$1_t mmux_flonumc$1_$2 __attribute__((__const__))]]])

m4_define([[[DEFINE_BINARY_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_operation_flonumc$1_t mmux_flonumc$1_$2 __attribute__((__const__))]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_binary_sint_operation_flonumc$1_t mmux_flonumc$1_$2 __attribute__((__const__))]]])

m4_define([[[DEFINE_FLONUMC_MATHEMATICS_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
DEFINE_UNARY_MATH_PROTO($1,		sin);
DEFINE_UNARY_MATH_PROTO($1,		cos);
DEFINE_UNARY_MATH_PROTO($1,		tan);

DEFINE_UNARY_MATH_PROTO($1,		asin);
DEFINE_UNARY_MATH_PROTO($1,		acos);
DEFINE_UNARY_MATH_PROTO($1,		atan);

DEFINE_UNARY_MATH_PROTO($1,		sinh);
DEFINE_UNARY_MATH_PROTO($1,		cosh);
DEFINE_UNARY_MATH_PROTO($1,		tanh);

DEFINE_UNARY_MATH_PROTO($1,		asinh);
DEFINE_UNARY_MATH_PROTO($1,		acosh);
DEFINE_UNARY_MATH_PROTO($1,		atanh);

DEFINE_UNARY_MATH_PROTO($1,		exp);
DEFINE_UNARY_MATH_PROTO($1,		exp2);
DEFINE_UNARY_MATH_PROTO($1,		exp10);

DEFINE_UNARY_MATH_PROTO($1,		log);
DEFINE_UNARY_MATH_PROTO($1,		log2);
DEFINE_UNARY_MATH_PROTO($1,		log10);

DEFINE_BINARY_MATH_PROTO($1,		pow);
DEFINE_UNARY_MATH_PROTO($1,		square);
DEFINE_UNARY_MATH_PROTO($1,		cube);
DEFINE_UNARY_MATH_PROTO($1,		sqrt);
DEFINE_UNARY_MATH_PROTO($1,		cbrt);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_MATHEMATICS_PROTOS(fl)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(db)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(ldb)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f32)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f64)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f128)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f32x)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f64x)
DEFINE_FLONUMC_MATHEMATICS_PROTOS(f128x)


/** --------------------------------------------------------------------
 ** Mathematics: flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_$2 (mmux_flonumc$1_t op)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_$2(op.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_$2 (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_$2 (mmux_sint_t op1, mmux_flonumc$1_t op2)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sin);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cos);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		tan);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		asin);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		acos);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		atan);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sinh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cosh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		tanh);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		asinh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		acosh);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		atanh);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp2);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		exp10);

DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log2);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		log10);

DEFINE_BINARY_MATH_INLINE_FUNCTION($1,		pow);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		square);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cube);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		sqrt);
DEFINE_UNARY_MATH_INLINE_FUNCTION($1,		cbrt);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(fl)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(db)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(ldb)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f32)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f64)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f128)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f32x)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f64x)
DEFINE_FLONUMC_MATHEMATICS_INLINE_FUNCTIONS(f128x)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_MATHEMATICS_H */

/* end of file */
