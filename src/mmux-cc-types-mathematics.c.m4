/*
  Part of: MMUX CC Types
  Contents: core type functions
  Date: Sep 18, 2024

  Abstract

	This module implements core type functions.

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
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-internals.h>


/** --------------------------------------------------------------------
 ** Mathematics: high-level functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op)
{
  return mmux_flonum$1($2$1(op.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($2$1(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_FUNCTION]]],[[[mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_sint_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1($2$1(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_REAL_MATH_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_FUNCTION($1,		sin)
DEFINE_UNARY_MATH_FUNCTION($1,		cos)
DEFINE_UNARY_MATH_FUNCTION($1,		tan)

DEFINE_UNARY_MATH_FUNCTION($1,		asin)
DEFINE_UNARY_MATH_FUNCTION($1,		acos)
DEFINE_UNARY_MATH_FUNCTION($1,		atan)
DEFINE_BINARY_MATH_FUNCTION($1,		atan2)

DEFINE_UNARY_MATH_FUNCTION($1,		sinh)
DEFINE_UNARY_MATH_FUNCTION($1,		cosh)
DEFINE_UNARY_MATH_FUNCTION($1,		tanh)

DEFINE_UNARY_MATH_FUNCTION($1,		asinh)
DEFINE_UNARY_MATH_FUNCTION($1,		acosh)
DEFINE_UNARY_MATH_FUNCTION($1,		atanh)

DEFINE_UNARY_MATH_FUNCTION($1,		exp)
DEFINE_UNARY_MATH_FUNCTION($1,		exp2)
DEFINE_UNARY_MATH_FUNCTION($1,		exp10)

DEFINE_UNARY_MATH_FUNCTION($1,		log)
DEFINE_UNARY_MATH_FUNCTION($1,		log10)
DEFINE_UNARY_MATH_FUNCTION($1,		log2)
DEFINE_UNARY_MATH_FUNCTION($1,		logb)

DEFINE_BINARY_MATH_FUNCTION($1,		pow)
DEFINE_UNARY_MATH_FUNCTION($1,		square)
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt)
DEFINE_BINARY_MATH_FUNCTION($1,		hypot)

DEFINE_UNARY_MATH_FUNCTION($1,		expm1)
DEFINE_UNARY_MATH_FUNCTION($1,		log1p)

DEFINE_UNARY_MATH_FUNCTION($1,		erf)
DEFINE_UNARY_MATH_FUNCTION($1,		erfc)

DEFINE_UNARY_MATH_FUNCTION($1,		lgamma)
DEFINE_UNARY_MATH_FUNCTION($1,		tgamma)

DEFINE_UNARY_MATH_FUNCTION($1,		j0)
DEFINE_UNARY_MATH_FUNCTION($1,		j1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	jn)

DEFINE_UNARY_MATH_FUNCTION($1,		y0)
DEFINE_UNARY_MATH_FUNCTION($1,		y1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	yn)
]]])]]])

m4_define([[[DEFINE_CPLX_MATH_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_UNARY_MATH_FUNCTION($1,		sin)
DEFINE_UNARY_MATH_FUNCTION($1,		cos)
DEFINE_UNARY_MATH_FUNCTION($1,		tan)

DEFINE_UNARY_MATH_FUNCTION($1,		asin)
DEFINE_UNARY_MATH_FUNCTION($1,		acos)
DEFINE_UNARY_MATH_FUNCTION($1,		atan)

DEFINE_UNARY_MATH_FUNCTION($1,		sinh)
DEFINE_UNARY_MATH_FUNCTION($1,		cosh)
DEFINE_UNARY_MATH_FUNCTION($1,		tanh)

DEFINE_UNARY_MATH_FUNCTION($1,		asinh)
DEFINE_UNARY_MATH_FUNCTION($1,		acosh)
DEFINE_UNARY_MATH_FUNCTION($1,		atanh)

DEFINE_UNARY_MATH_FUNCTION($1,		exp)
DEFINE_UNARY_MATH_FUNCTION($1,		exp2)
DEFINE_UNARY_MATH_FUNCTION($1,		exp10)

DEFINE_UNARY_MATH_FUNCTION($1,		log)
DEFINE_UNARY_MATH_FUNCTION($1,		log10)
DEFINE_UNARY_MATH_FUNCTION($1,		log2)

DEFINE_BINARY_MATH_FUNCTION($1,		pow)
DEFINE_UNARY_MATH_FUNCTION($1,		square)
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_REAL_MATH_FUNCTIONS(fl)
DEFINE_REAL_MATH_FUNCTIONS(db)
DEFINE_REAL_MATH_FUNCTIONS(ldb)
DEFINE_REAL_MATH_FUNCTIONS(f32)
DEFINE_REAL_MATH_FUNCTIONS(f64)
DEFINE_REAL_MATH_FUNCTIONS(f128)
DEFINE_REAL_MATH_FUNCTIONS(f32x)
DEFINE_REAL_MATH_FUNCTIONS(f64x)
DEFINE_REAL_MATH_FUNCTIONS(f128x)
DEFINE_CPLX_MATH_FUNCTIONS(cfl)
DEFINE_CPLX_MATH_FUNCTIONS(cdb)
DEFINE_CPLX_MATH_FUNCTIONS(cldb)
DEFINE_CPLX_MATH_FUNCTIONS(cf32)
DEFINE_CPLX_MATH_FUNCTIONS(cf64)
DEFINE_CPLX_MATH_FUNCTIONS(cf128)
DEFINE_CPLX_MATH_FUNCTIONS(cf32x)
DEFINE_CPLX_MATH_FUNCTIONS(cf64x)
DEFINE_CPLX_MATH_FUNCTIONS(cf128x)

/* end of file */
