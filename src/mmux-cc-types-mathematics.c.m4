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
 ** Mathematics: standard flonum
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_standard_flonum$1_t
mmux_standard_flonum$1_$3 (mmux_standard_flonum$1_t op)
{
  return $3$2(op);
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_standard_flonum$1_t
mmux_standard_flonum$1_$3 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return $3$2(op1, op2);
}]]])

m4_define([[[DEFINE_BINARY_SINT_MATH_FUNCTION]]],[[[mmux_standard_flonum$1_t
mmux_standard_flonum$1_$3 (mmux_standard_sint_t op1, mmux_standard_flonum$1_t op2)
{
  return $3$2(op1, op2);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
square$2 (mmux_standard_flonum$1_t op)
{
  return (op * op);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
cube$2 (mmux_standard_flonum$1_t op)
{
  return (op * op * op);
}

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		sin)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		cos)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		tan)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		asin)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		acos)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		atan)
DEFINE_BINARY_MATH_FUNCTION($1,	$2,		atan2)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		sinh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		cosh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		tanh)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		asinh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		acosh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		atanh)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		exp)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		exp2)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		exp10)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		log)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		log10)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		log2)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		logb)

DEFINE_BINARY_MATH_FUNCTION($1,	$2,		pow)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		square)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		cube)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		cbrt)
DEFINE_BINARY_MATH_FUNCTION($1,	$2,		hypot)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		expm1)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		log1p)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		erf)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		erfc)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		lgamma)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		tgamma)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		j0)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		j1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	$2,	jn)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,		y0)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,		y1)
DEFINE_BINARY_SINT_MATH_FUNCTION($1,	$2,	yn)
]]])]]])

m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(fl,	f)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUM_MATHEMATICS_FUNCTIONS(f128x,	f128x)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_$3 (mmux_standard_flonumc$1_t op)
{
  return c$3$2(op);
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_$3 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return c$3$2(op1, op2);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
csquare$2 (mmux_standard_flonumc$1_t op)
{
  return (op * op);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
ccube$2 (mmux_standard_flonumc$1_t op)
{
  return (op * op * op);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
cexp2$2 (mmux_standard_flonumc$1_t Z)
{
  /* 2^Z = exp( log ( 2^Z ) ) = exp( Z * log( 2 ) ) */
  return cexp$2(Z * mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_LN2(),
							mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
cexp10$2 (mmux_standard_flonumc$1_t Z)
{
  /* 10^Z = exp( log ( 10^Z ) ) = exp( Z * log( 10 ) ) */
  return cexp$2(Z * mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_LN10(),
							mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
clog2$2 (mmux_standard_flonumc$1_t Z)
/* log_2 Z = log Z / log 2 */
{
  return (clog$2(Z) / mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_LN2(),
							  mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
ccbrt$2 (mmux_standard_flonumc$1_t Z)
/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z )) */
{
  auto	flonum_one_third  = mmux_standard_flonum$1_constant_one() / mmux_standard_flonum$1_literal(3.0);
  auto	flonumc_one_third = mmux_standard_flonumc$1_rectangular(flonum_one_third,
								mmux_standard_flonum$1_constant_zero());
  return cexp$2(flonumc_one_third * clog$2(Z));
}

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	sin)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	cos)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	tan)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	asin)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	acos)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	atan)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	sinh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	cosh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	tanh)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	asinh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	acosh)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	atanh)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	exp)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	exp2)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	exp10)

DEFINE_UNARY_MATH_FUNCTION($1,	$2,	log)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	log10)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	log2)

DEFINE_BINARY_MATH_FUNCTION($1,	$2,	pow)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	square)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	cube)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	sqrt)
DEFINE_UNARY_MATH_FUNCTION($1,	$2,	cbrt)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(fl,	f)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(db)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(ldb,	l)

DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f32,	f32)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f64,	f64)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f128,	f128)

DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f32x,	f32x)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f64x,	f64x)
DEFINE_STANDARD_FLONUMC_MATHEMATICS_FUNCTIONS(f128x,	f128x)

/* end of file */
