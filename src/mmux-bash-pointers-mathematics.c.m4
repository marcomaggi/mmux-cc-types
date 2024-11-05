/*
  Part of: MMUX Bash Pointers
  Contents: implementation of mathematics builtins
  Date: Oct 15, 2024

  Abstract

	This module implements mathematics builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

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

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Mathematical constants.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_constant_$2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  return mmux_$1_bind_to_bash_variable(argv[1], mmux_$1_constant_$2(), MMUX_BUILTIN_NAME_STR);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR"]]],
    [[["Store in ROPVAR a constant value representing $2."]]])]]])

m4_define([[[DEFINE_MATH_CONSTANTS_BUILTINS]]],[[[
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[E]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[LOG2E]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[LOG10E]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[LN2]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[LN10]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[PI]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[PI_2]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[PI_4]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[1_PI]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[2_PI]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[2_SQRTPI]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[SQRT2]]],	[[[$2]]])
DEFINE_MATH_CONSTANTS_SINGLE_BUILTIN([[[$1]]],	[[[SQRT1_2]]],	[[[$2]]])
]]])

DEFINE_MATH_CONSTANTS_BUILTINS(float)
DEFINE_MATH_CONSTANTS_BUILTINS(double)
DEFINE_MATH_CONSTANTS_BUILTINS(ldouble,		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_MATH_CONSTANTS_BUILTINS(float32,		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_MATH_CONSTANTS_BUILTINS(float64,		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_MATH_CONSTANTS_BUILTINS(float128,	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_MATH_CONSTANTS_BUILTINS(float32x,	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_MATH_CONSTANTS_BUILTINS(float64x,	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_MATH_CONSTANTS_BUILTINS(float128x,	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_MATH_CONSTANTS_BUILTINS(decimal32,	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_MATH_CONSTANTS_BUILTINS(decimal64,	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_MATH_CONSTANTS_BUILTINS(decimal128,	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])


m4_divert(-1)m4_dnl
m4_dnl --------------------------------------------------------------------
m4_dnl Orgy of macros.
m4_dnl ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_UNARY_BUILTIN]]],[[[m4_ifelse([[[$3]]],,,[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_$2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
  mmux_$1_t	rop, op;

  if (0) { fprintf(stderr, "%s: ROPVAR=%s, OP=%s\n", __func__, argv[1], argv[2]); }
  $4(op, argv[2]);

  rop = mmux_$1_$2(op);
  return mmux_$1_bind_to_bash_variable(argv[1], rop, MMUX_BUILTIN_NAME_STR);

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
    [[["Compute $3(OP), store the result in ROPVAR."]]])]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_BUILTIN]]],[[[m4_ifelse([[[$3]]],,,[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_$2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
  mmux_$1_t	rop, op1, op2;

  $4(op1, argv[2]);
  $4(op2, argv[3]);

  rop = mmux_$1_$2(op1, op2);
  return mmux_$1_bind_to_bash_variable(argv[1], rop, MMUX_BUILTIN_NAME_STR);

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP1 OP2"]]],
    [[["Compute $3(OP1,OP2), store the result in ROPVAR."]]])]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_BUILTIN]]],[[[m4_ifelse([[[$3]]],,,[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_$2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
  mmux_$1_t	rop, op;
  mmux_sint_t	N;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(N, argv[2]);
  $4(op, argv[3]);

  rop = mmux_$1_$2(N, op);
  return mmux_$1_bind_to_bash_variable(argv[1], rop, MMUX_BUILTIN_NAME_STR);

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR N OP"]]],
    [[["Compute $3(N,OP), store the result in ROPVAR."]]])]]])]]])

m4_divert(0)m4_dnl

/** --------------------------------------------------------------------
 ** Mathematics builtins.
 ** ----------------------------------------------------------------- */

m4_dnl  $1 - type stem
m4_dnl  $2 - type parser macro
m4_dnl  $3 - C preprocessor for optional definition

m4_dnl  $4 - identifier of C function implementing sin
m4_dnl  $5 - identifier of C function implementing cos
m4_dnl  $6 - identifier of C function implementing tan
m4_dnl  $7 - identifier of C function implementing asin
m4_dnl  $8 - identifier of C function implementing acos
m4_dnl  $9 - identifier of C function implementing atan
m4_dnl $10 - identifier of C function implementing atan2

m4_dnl $11 - identifier of C function implementing sinh
m4_dnl $12 - identifier of C function implementing cosh
m4_dnl $13 - identifier of C function implementing tanh
m4_dnl $14 - identifier of C function implementing asinh
m4_dnl $15 - identifier of C function implementing acosh
m4_dnl $16 - identifier of C function implementing atanh

m4_dnl $17 - identifier of C function implementing exp
m4_dnl $18 - identifier of C function implementing exp2
m4_dnl $19 - identifier of C function implementing exp10
m4_dnl $20 - identifier of C function implementing log
m4_dnl $21 - identifier of C function implementing log10
m4_dnl $22 - identifier of C function implementing log2
m4_dnl $23 - identifier of C function implementing logb
m4_dnl $24 - identifier of C function implementing pow
m4_dnl $25 - identifier of C function implementing sqrt
m4_dnl $26 - identifier of C function implementing cbrt
m4_dnl $27 - identifier of C function implementing hypot
m4_dnl $28 - identifier of C function implementing expm1
m4_dnl $29 - identifier of C function implementing log1p

m4_dnl $30 - identifier of C function implementing erf
m4_dnl $31 - identifier of C function implementing erfc
m4_dnl $32 - identifier of C function implementing lgamma
m4_dnl $33 - identifier of C function implementing tgamma
m4_dnl $34 - identifier of C function implementing j0
m4_dnl $35 - identifier of C function implementing j1
m4_dnl $36 - identifier of C function implementing jn
m4_dnl $37 - identifier of C function implementing y0
m4_dnl $38 - identifier of C function implementing y1
m4_dnl $39 - identifier of C function implementing yn

m4_define([[[DEFINE_BUILTINS]]],[[[m4_ifelse($#,39,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 39 got: $#
)]]])
DEFINE_UNARY_BUILTIN([[[$1]]],	[[[sin]]],	[[[$4]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[cos]]],	[[[$5]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[tan]]],	[[[$6]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[asin]]],	[[[$7]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[acos]]],	[[[$8]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[atan]]],	[[[$9]]],  [[[$2]]], [[[$3]]])
DEFINE_BINARY_BUILTIN([[[$1]]], [[[atan2]]],	[[[$10]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_BUILTIN([[[$1]]],  [[[sinh]]],	[[[$11]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[cosh]]],	[[[$12]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[tanh]]],	[[[$13]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[asinh]]],	[[[$14]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[acosh]]],	[[[$15]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[atanh]]],	[[[$16]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_BUILTIN([[[$1]]],  [[[exp]]],	[[[$17]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[exp2]]],	[[[$18]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[exp10]]],	[[[$19]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[log]]],	[[[$20]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[log10]]],	[[[$21]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[log2]]],	[[[$22]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[logb]]],	[[[$23]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_BUILTIN([[[$1]]], [[[pow]]],	[[[$24]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[sqrt]]],	[[[$25]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[cbrt]]],	[[[$26]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_BUILTIN([[[$1]]], [[[hypot]]],	[[[$27]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[expm1]]],	[[[$28]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[log1p]]],	[[[$29]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_BUILTIN([[[$1]]],  [[[erf]]],	[[[$30]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[erfc]]],	[[[$31]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[lgamma]]],	[[[$32]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[tgamma]]],	[[[$33]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[j0]]],	[[[$34]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[j1]]],	[[[$35]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_BUILTIN([[[$1]]],[[[jn]]],	[[[$36]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[y0]]],	[[[$37]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_BUILTIN([[[$1]]],  [[[y1]]],	[[[$38]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_BUILTIN([[[$1]]],[[[yn]]],	[[[$39]]], [[[$2]]], [[[$3]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_BUILTINS([[[float]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]],	[[[]]],
		  [[[sinf]]],		[[[cosf]]],		[[[tanf]]],
		  [[[asinf]]],		[[[acosf]]],		[[[atanf]]],		[[[atan2f]]],
		  [[[sinhf]]],		[[[coshf]]],		[[[tanhf]]],
		  [[[asinhf]]],		[[[acoshf]]],		[[[atanhf]]],
		  [[[expf]]],		[[[exp2f]]],		[[[exp10f]]],
		  [[[logf]]],		[[[log10f]]],		[[[log2f]]],		[[[logbf]]],
		  [[[powf]]],		[[[sqrtf]]],		[[[cbrtf]]],		[[[hypotf]]],
		  [[[expm1f]]],		[[[log1pf]]],
		  [[[erff]]],		[[[erfcf]]],
		  [[[lgammaf]]],	[[[tgammaf]]],
		  [[[j0f]]],		[[[j1f]]],		[[[jnf]]],
		  [[[y0f]]],		[[[y1f]]],		[[[ynf]]])
DEFINE_BUILTINS([[[double]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]],	[[[]]],
		  [[[sin]]],		[[[cos]]],		[[[tan]]],
		  [[[asin]]],		[[[acos]]],		[[[atan]]],		[[[atan2f]]],
		  [[[sinh]]],		[[[cosh]]],		[[[tanh]]],
		  [[[asinh]]],		[[[acosh]]],		[[[atanh]]],
		  [[[exp]]],		[[[exp2]]],		[[[exp10]]],
		  [[[log]]],		[[[log10]]],		[[[log2]]],		[[[logb]]],
		  [[[pow]]],		[[[sqrt]]],		[[[cbrt]]],		[[[hypot]]],
		  [[[expm1]]],		[[[log1p]]],
		  [[[erf]]],		[[[erfc]]],
		  [[[lgamma]]],		[[[tgamma]]],
		  [[[j0]]],		[[[j1]]],		[[[jn]]],
		  [[[y0]]],		[[[y1]]],		[[[yn]]])
DEFINE_BUILTINS([[[ldouble]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]],
		  [[[sinl]]],		[[[cosl]]],		[[[tanl]]],
		  [[[asinl]]],		[[[acosl]]],		[[[atanl]]],		[[[atan2l]]],
		  [[[sinhl]]],		[[[coshl]]],		[[[tanhl]]],
		  [[[asinhl]]],		[[[acoshl]]],		[[[atanhl]]],
		  [[[expl]]],		[[[exp2l]]],		[[[exp10l]]],
		  [[[logl]]],		[[[log10l]]],		[[[log2l]]],		[[[logbl]]],
		  [[[powl]]],		[[[sqrtl]]],		[[[cbrtl]]],		[[[hypotl]]],
		  [[[expm1l]]],		[[[log1pl]]],
		  [[[erfl]]],		[[[erfcl]]],
		  [[[lgammal]]],	[[[tgammal]]],
		  [[[j0l]]],		[[[j1l]]],		[[[jnl]]],
		  [[[y0l]]],		[[[y1l]]],		[[[ynl]]])

DEFINE_BUILTINS([[[float32]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]],
		  [[[sinf32]]],		[[[cosf32]]],		[[[tanf32]]],
		  [[[asinf32]]],	[[[acosf32]]],		[[[atanf32]]],		[[[atan2f32]]],
		  [[[sinhf32]]],	[[[coshf32]]],		[[[tanhf32]]],
		  [[[asinhf32]]],	[[[acoshf32]]],		[[[atanhf32]]],
		  [[[expf32]]],		[[[exp2f32]]],		[[[exp10f32]]],
		  [[[logf32]]],		[[[log10f32]]],		[[[log2f32]]],		[[[logbf32]]],
		  [[[powf32]]],		[[[sqrtf32]]],		[[[cbrtf32]]],		[[[hypotf32]]],
		  [[[expm1f32]]],	[[[log1pf32]]],
		  [[[erff32]]],		[[[erfcf32]]],
		  [[[lgammaf32]]],	[[[tgammaf32]]],
		  [[[j0f32]]],		[[[j1f32]]],		[[[jnf32]]],
		  [[[y0f32]]],		[[[y1f32]]],		[[[ynf32]]])
DEFINE_BUILTINS([[[float64]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64]]],
		  [[[sinf64]]],		[[[cosf64]]],		[[[tanf64]]],
		  [[[asinf64]]],	[[[acosf64]]],		[[[atanf64]]],		[[[atan2f64]]],
		  [[[sinhf64]]],	[[[coshf64]]],		[[[tanhf64]]],
		  [[[asinhf64]]],	[[[acoshf64]]],		[[[atanhf64]]],
		  [[[expf64]]],		[[[exp2f64]]],		[[[exp10f64]]],
		  [[[logf64]]],		[[[log10f64]]],		[[[log2f64]]],		[[[logbf64]]],
		  [[[powf64]]],		[[[sqrtf64]]],		[[[cbrtf64]]],		[[[hypotf64]]],
		  [[[expm1f64]]],	[[[log1pf64]]],
		  [[[erff64]]],		[[[erfcf64]]],
		  [[[lgammaf64]]],	[[[tgammaf64]]],
		  [[[j0f64]]],		[[[j1f64]]],		[[[jnf64]]],
		  [[[y0f64]]],		[[[y1f64]]],		[[[ynf64]]])
DEFINE_BUILTINS([[[float128]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128]]],
		  [[[sinf128]]],	[[[cosf128]]],		[[[tanf128]]],
		  [[[asinf128]]],	[[[acosf128]]],		[[[atanf128]]],		[[[atan2f128]]],
		  [[[sinhf128]]],	[[[coshf128]]],		[[[tanhf128]]],
		  [[[asinhf128]]],	[[[acoshf128]]],	[[[atanhf128]]],
		  [[[expf128]]],	[[[exp2f128]]],		[[[exp10f128]]],
		  [[[logf128]]],	[[[log10f128]]],	[[[log2f128]]],		[[[logbf128]]],
		  [[[powf128]]],	[[[sqrtf128]]],		[[[cbrtf128]]],		[[[hypotf128]]],
		  [[[expm1f128]]],	[[[log1pf128]]],
		  [[[erff128]]],	[[[erfcf128]]],
		  [[[lgammaf128]]],	[[[tgammaf128]]],
		  [[[j0f128]]],		[[[j1f128]]],		[[[jnf128]]],
		  [[[y0f128]]],		[[[y1f128]]],		[[[ynf128]]])

DEFINE_BUILTINS([[[float32x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]],
		  [[[sinf32x]]],	[[[cosf32x]]],		[[[tanf32x]]],
		  [[[asinf32x]]],	[[[acosf32x]]],		[[[atanf32x]]],		[[[atan2f32x]]],
		  [[[sinhf32x]]],	[[[coshf32x]]],		[[[tanhf32x]]],
		  [[[asinhf32x]]],	[[[acoshf32x]]],	[[[atanhf32x]]],
		  [[[expf32x]]],	[[[exp2f32x]]],		[[[exp10f32x]]],
		  [[[logf32x]]],	[[[log10f32x]]],	[[[log2f32x]]],		[[[logbf32x]]],
		  [[[powf32x]]],	[[[sqrtf32x]]],		[[[cbrtf32x]]],		[[[hypotf32x]]],
		  [[[expm1f32x]]],	[[[log1pf32x]]],
		  [[[erff32x]]],	[[[erfcf32x]]],
		  [[[lgammaf32x]]],	[[[tgammaf32x]]],
		  [[[j0f32x]]],		[[[j1f32x]]],		[[[jnf32x]]],
		  [[[y0f32x]]],		[[[y1f32x]]],		[[[ynf32x]]])
DEFINE_BUILTINS([[[float64x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]],
		  [[[sinf64x]]],	[[[cosf64x]]],		[[[tanf64x]]],
		  [[[asinf64x]]],	[[[acosf64x]]],		[[[atanf64x]]],		[[[atan2f64x]]],
		  [[[sinhf64x]]],	[[[coshf64x]]],		[[[tanhf64x]]],
		  [[[asinhf64x]]],	[[[acoshf64x]]],	[[[atanhf64x]]],
		  [[[expf64x]]],	[[[exp2f64x]]],		[[[exp10f64x]]],
		  [[[logf64x]]],	[[[log10f64x]]],	[[[log2f64x]]],		[[[logbf64x]]],
		  [[[powf64x]]],	[[[sqrtf64x]]],		[[[cbrtf64x]]],		[[[hypotf64x]]],
		  [[[expm1f64x]]],	[[[log1pf64x]]],
		  [[[erff64x]]],	[[[erfcf64x]]],
		  [[[lgammaf64x]]],	[[[tgammaf64x]]],
		  [[[j0f64x]]],		[[[j1f64x]]],		[[[jnf64x]]],
		  [[[y0f64x]]],		[[[y1f64x]]],		[[[ynf64x]]])
DEFINE_BUILTINS([[[float128x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128X]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128X]]],
		  [[[sinf128x]]],	[[[cosf128x]]],		[[[tanf128x]]],
		  [[[asinf128x]]],	[[[acosf128x]]],	[[[atanf128x]]],	[[[atan2f128x]]],
		  [[[sinhf128x]]],	[[[coshf128x]]],	[[[tanhf128x]]],
		  [[[asinhf128x]]],	[[[acoshf128x]]],	[[[atanhf128x]]],
		  [[[expf128x]]],	[[[exp2f128x]]],	[[[exp10f128x]]],
		  [[[logf128x]]],	[[[log10f128x]]],	[[[log2f128x]]],	[[[logbf128x]]],
		  [[[powf128x]]],	[[[sqrtf128x]]],	[[[cbrtf128x]]],	[[[hypotf128x]]],
		  [[[expm1f128x]]],	[[[log1pf128x]]],
		  [[[erff128x]]],	[[[erfc128x]]],
		  [[[lgammaf128x]]],	[[[tgammaf128x]]],
		  [[[j0f128x]]],	[[[j1f128x]]],		[[[jnf128x]]],
		  [[[y0f128x]]],	[[[y1f128x]]],		[[[ynf128x]]])

DEFINE_BUILTINS([[[decimal32]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],
		  [[[sind32]]],		[[[cosd32]]],		[[[tand32]]],
		  [[[asind32]]],	[[[acosd32]]],		[[[atand32]]],		[[[atan2d32]]],
		  [[[sinhd32]]],	[[[coshd32]]],		[[[tanhd32]]],
		  [[[asinhd32]]],	[[[acoshd32]]],		[[[atanhd32]]],
		  [[[expd32]]],		[[[exp2d32]]],		[[[exp10d32]]],
		  [[[logd32]]],		[[[log10d32]]],		[[[log2d32]]],		[[[logbd32]]],
		  [[[powd32]]],		[[[sqrtd32]]],		[[[cbrtd32]]],		[[[hypotd32]]],
		  [[[expm1d32]]],	[[[log1pd32]]],
		  [[[erfd32]]],		[[[erfcd32x]]],
		  [[[lgammad32]]],	[[[tgammad32]]],
		  [[[j0d32]]],		[[[j1d32]]],		[[[jnd32]]],
		  [[[y0d32]]],		[[[y1d32]]],		[[[ynd32]]])
DEFINE_BUILTINS([[[decimal64]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],
		  [[[sind64]]],		[[[cosd64]]],		[[[tand64]]],
		  [[[asind64]]],	[[[acosd64]]],		[[[atand64]]],		[[[atan2d64]]],
		  [[[sinhd64]]],	[[[coshd64]]],		[[[tanhd64]]],
		  [[[asinhd64]]],	[[[acoshd64]]],		[[[atanhd64]]],
		  [[[expd64]]],		[[[exp2d64]]],		[[[exp10d64]]],
		  [[[logd64]]],		[[[log10d64]]],		[[[log2d64]]],		[[[logbd64]]],
		  [[[powd64]]],		[[[sqrtd64]]],		[[[cbrtd64]]],		[[[hypotd64]]],
		  [[[expm1d64]]],	[[[log1pd64]]],
		  [[[erfd64]]],		[[[erfcd64x]]],
		  [[[lgammad64]]],	[[[tgammad64]]],
		  [[[j0d64]]],		[[[j1d64]]],		[[[jnd64]]],
		  [[[y0d64]]],		[[[y1d64]]],		[[[ynd64]]])
DEFINE_BUILTINS([[[decimal128]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]],
		  [[[sind128]]],	[[[cosd128]]],		[[[tand128]]],
		  [[[asind128]]],	[[[acosd128]]],		[[[atand128]]],		[[[atan2d128]]],
		  [[[sinhd128]]],	[[[coshd128]]],		[[[tanhd128]]],
		  [[[asinhd128]]],	[[[acoshd128]]],	[[[atanhd128]]],
		  [[[expd128]]],	[[[exp2d128]]],		[[[exp10d128]]],
		  [[[logd128]]],	[[[log10d128]]],	[[[log2d128]]],		[[[logbd128]]],
		  [[[powd128]]],	[[[sqrtd128]]],		[[[cbrtd128]]],		[[[hypotd128]]],
		  [[[expm1d128]]],	[[[log1pd128]]],
		  [[[erfd128]]],	[[[erfcd128x]]],
		  [[[lgammad128]]],	[[[tgammad128]]],
		  [[[j0d128]]],		[[[j1d128]]],		[[[jnd128]]],
		  [[[y0d128]]],		[[[y1d128]]],		[[[ynd128]]])

DEFINE_BUILTINS([[[complexf]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF]]],	[[[]]],
		  [[[csinf]]],		[[[ccosf]]],		[[[ctanf]]],
		  [[[casinf]]],		[[[cacosf]]],		[[[catanf]]],		[[[]]],
		  [[[csinhf]]],		[[[ccoshf]]],		[[[ctanhf]]],
		  [[[casinhf]]],	[[[cacoshf]]],		[[[catanhf]]],
		  [[[cexpf]]],		[[[]]],			[[[]]],
		  [[[clogf]]],		[[[clog10f]]],		[[[]]],			[[[]]],
		  [[[cpowf]]],		[[[csqrtf]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexd]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD]]],	[[[]]],
		  [[[csin]]],		[[[ccos]]],		[[[ctan]]],
		  [[[casin]]],		[[[cacos]]],		[[[catan]]],		[[[]]],
		  [[[csinh]]],		[[[ccosh]]],		[[[ctanh]]],
		  [[[casinh]]],		[[[cacosh]]],		[[[catanh]]],
		  [[[cexp]]],		[[[]]],			[[[]]],
		  [[[clog]]],		[[[clog10]]],		[[[]]],			[[[]]],
		  [[[cpow]]],		[[[csqrt]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexld]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXLD]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]],
		  [[[csinl]]],		[[[ccosl]]],		[[[ctanl]]],
		  [[[casinl]]],		[[[cacosl]]],		[[[catanl]]],		[[[]]],
		  [[[csinhl]]],		[[[ccoshl]]],		[[[ctanhl]]],
		  [[[casinhl]]],	[[[cacoshl]]],		[[[catanhl]]],
		  [[[cexpl]]],		[[[]]],			[[[]]],
		  [[[clogl]]],		[[[clog10l]]],		[[[]]],			[[[]]],
		  [[[cpowl]]],		[[[csqrtl]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

DEFINE_BUILTINS([[[complexf32]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]],
		  [[[csinf32]]],	[[[ccosf32]]],		[[[ctanf32]]],
		  [[[casinf32]]],	[[[cacosf32]]],		[[[catanf32]]],		[[[]]],
		  [[[csinhf32]]],	[[[ccoshf32]]],		[[[ctanhf32]]],
		  [[[casinhf32]]],	[[[cacoshf32]]],	[[[catanhf32]]],
		  [[[cexpf32]]],	[[[]]],			[[[]]],
		  [[[clogf32]]],	[[[clog10f32]]],	[[[]]],			[[[]]],
		  [[[cpowf32]]],	[[[csqrtf32]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexf64]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]],
		  [[[csinf64]]],	[[[ccosf64]]],		[[[ctanf64]]],
		  [[[casinf64]]],	[[[cacosf64]]],		[[[catanf64]]],		[[[]]],
		  [[[csinhf64]]],	[[[ccoshf64]]],		[[[ctanhf64]]],
		  [[[casinhf64]]],	[[[cacoshf64]]],	[[[catanhf64]]],
		  [[[cexpf64]]],	[[[]]],			[[[]]],
		  [[[clogf64]]],	[[[clog10f64]]],	[[[]]],			[[[]]],
		  [[[cpowf64]]],	[[[csqrtf64]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexf128]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]],
		  [[[csinf128]]],	[[[ccosf128]]],		[[[ctanf128]]],
		  [[[casinf128]]],	[[[cacosf128]]],	[[[catanf128]]],	[[[]]],
		  [[[csinhf128]]],	[[[ccoshf128]]],	[[[ctanhf128]]],
		  [[[casinhf128]]],	[[[cacoshf128]]],	[[[catanhf128]]],
		  [[[cexpf128]]],	[[[]]],			[[[]]],
		  [[[clogf128]]],	[[[clog10f128]]],	[[[]]],			[[[]]],
		  [[[cpowf128]]],	[[[csqrtf128]]],	[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

DEFINE_BUILTINS([[[complexf32x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]],
		  [[[csinf32x]]],	[[[ccosf32x]]],		[[[ctanf32x]]],
		  [[[casinf32x]]],	[[[cacosf32x]]],	[[[catanf32x]]],	[[[]]],
		  [[[csinhf32x]]],	[[[ccoshf32x]]],	[[[ctanhf32x]]],
		  [[[casinhf32x]]],	[[[cacoshf32x]]],	[[[catanhf32x]]],
		  [[[cexpf32x]]],	[[[]]],			[[[]]],
		  [[[clogf32x]]],	[[[clog10f32x]]],	[[[]]],			[[[]]],
		  [[[cpowf32x]]],	[[[csqrtf32x]]],	[[[]]],			[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexf64x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]],
		  [[[csinf64x]]],	[[[ccosf64x]]],		[[[ctanf64x]]],
		  [[[casinf64x]]],	[[[cacosf64x]]],	[[[catanf64x]]],	[[[]]],
		  [[[csinhf64x]]],	[[[ccoshf64x]]],	[[[ctanhf64x]]],
		  [[[casinhf64x]]],	[[[cacoshf64x]]],	[[[catanhf64x]]],
		  [[[cexpf64x]]],	[[[]]],			[[[]]],
		  [[[clogf64x]]],	[[[clog10f64x]]],	[[[]]],			[[[]]],
		  [[[cpowf64x]]],	[[[csqrtf64x]]],	[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexf128x]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]],
		  [[[csinf128x]]],	[[[ccosf128x]]],	[[[ctanf128x]]],
		  [[[casinf128x]]],	[[[cacosf128x]]],	[[[catanf128x]]],	[[[]]],
		  [[[csinhf128x]]],	[[[ccoshf128x]]],	[[[ctanhf128x]]],
		  [[[casinhf128x]]],	[[[cacoshf128x]]],	[[[catanhf128x]]],
		  [[[cexpf128x]]],	[[[]]],			[[[]]],
		  [[[clogf128x]]],	[[[clog10f128x]]],	[[[]]],			[[[]]],
		  [[[cpowf128x]]],	[[[csqrtf128x]]],	[[[]]],			[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

DEFINE_BUILTINS([[[complexd32]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD32]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD32_UNIMPLEMENTED]]],
		  [[[csind32]]],	[[[ccosd32]]],		[[[ctand32]]],
		  [[[casind32]]],	[[[cacosd32]]],		[[[catand32]]],		[[[]]],
		  [[[csinhd32]]],	[[[ccoshd32]]],		[[[ctanhd32]]],
		  [[[casinhd32]]],	[[[cacoshd32]]],	[[[catanhd32]]],
		  [[[cexpd32]]],	[[[]]],			[[[]]],
		  [[[clogd32]]],	[[[clog10d32]]],	[[[]]],			[[[]]],
		  [[[cpowd32]]],	[[[csqrtd32]]],		[[[]]],			[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexd64]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD64]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD64_UNIMPLEMENTED]]],
		  [[[csind64]]],	[[[ccosd64]]],		[[[ctand64]]],
		  [[[casind64]]],	[[[cacosd64]]],		[[[catand64]]],		[[[]]],
		  [[[csinhd64]]],	[[[ccoshd64]]],		[[[ctanhd64]]],
		  [[[casinhd64]]],	[[[cacoshd64]]],	[[[catanhd64]]],
		  [[[cexpd64]]],	[[[]]],			[[[]]],
		  [[[clogd64]]],	[[[clog10d64]]],	[[[]]],			[[[]]],
		  [[[cpowd64]]],	[[[csqrtd64]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])
DEFINE_BUILTINS([[[complexd128]]],
		  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXD128_UNIMPLEMENTED]]],
		  [[[csind128]]],	[[[ccosd128]]],		[[[ctand128]]],
		  [[[casind128]]],	[[[cacosd128]]],	[[[catand128]]],	[[[]]],
		  [[[csinhd128]]],	[[[ccoshd128]]],	[[[ctanhd128]]],
		  [[[casinhd128]]],	[[[cacoshd128]]],	[[[catanhd128]]],
		  [[[cexpd128]]],	[[[]]],			[[[]]],
		  [[[clogd128]]],	[[[clog10d128]]],	[[[]]],			[[[]]],
		  [[[cpowd128]]],	[[[csqrtd128]]],	[[[]]],			[[[]]],
	          [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],
		  [[[]]],		[[[]]],			[[[]]],
		  [[[]]],		[[[]]],			[[[]]])

/* end of file */
