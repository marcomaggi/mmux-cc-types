/*
  Part of: MMUX CC Types
  Contents: private header file
  Date: Aug 22, 2025

  Abstract

	This header file is for internal definitions.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_ADAPTERS_H
#define MMUX_CC_TYPES_ADAPTERS_H 1


/** --------------------------------------------------------------------
 ** Complex functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPLEX_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
real_part$1 (mmux_standard_flonum$1_t X)
{
  return X;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
imag_part$1 (mmux_standard_flonum$1_t X MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_flonum$1_constant_zero();
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
argument$1 (mmux_standard_flonum$1_t X MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_flonum$1_constant_zero();
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
conjugate$1 (mmux_standard_flonum$1_t X)
{
  return X;
}]]])

MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
rectangularc$1 (mmux_standard_flonum$1_t re, mmux_standard_flonum$1_t im)
{
  return CMPLX[[[]]]MMUX_M4_TOUPPER($2)(re, im);
}
#define rectangularc$1_literal(STANDARD_FLONUM_LITERAL_RE,STANDARD_FLONUM_LITERAL_IM)	\
  (rectangularc$1(mmux_standard_flonum$1_literal(STANDARD_FLONUM_LITERAL_RE),		\
		  mmux_standard_flonum$1_literal(STANDARD_FLONUM_LITERAL_IM)))
mmux_cc_types_inline_decl mmux_standard_flonumc$1_part_t
real_partc$1 (mmux_standard_flonumc$1_t Z)
{
  return creal$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_part_t
imag_partc$1 (mmux_standard_flonumc$1_t Z)
{
  return cimag$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_part_t
argumentc$1 (mmux_standard_flonumc$1_t Z)
{
  return atan2$2(cimag$2(Z), creal$2(Z));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
conjugatec$1 (mmux_standard_flonumc$1_t Z)
{
  return rectangularc$1(creal$2(Z), - cimag$2(Z));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_COMPLEX_FUNCTIONS(fl,		f)
DEFINE_COMPLEX_FUNCTIONS(db,		)
DEFINE_COMPLEX_FUNCTIONS(ldb,		l)
DEFINE_COMPLEX_FUNCTIONS(f32,		f32)
DEFINE_COMPLEX_FUNCTIONS(f64,		f64)
DEFINE_COMPLEX_FUNCTIONS(f128,		f128)
DEFINE_COMPLEX_FUNCTIONS(f32x,		f32x)
DEFINE_COMPLEX_FUNCTIONS(f64x,		f64x)
DEFINE_COMPLEX_FUNCTIONS(f128x,		f128x)


/** --------------------------------------------------------------------
 ** Arithmetics: flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUM_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
add$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 + op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
sub$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 - op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mul$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (op1 * op2);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
div$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return (op1 / op2);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
modulo$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return fmod$2(op1, op2);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
inverse$1 (mmux_standard_flonum$1_t op)
{
  return (mmux_standard_flonum$1_constant_one() / op);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
negation$1 (mmux_standard_flonum$1_t op)
{
  return (- op);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
absolute$1 (mmux_standard_flonum$1_t X MMUX_CC_TYPES_UNUSED)
{
  return fabs$2(X);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(fl,		f)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(db)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(ldb,	l)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f32,	f32)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f64,	f64)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f128,	f128)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f32x,	f32x)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f64x,	f64x)
DEFINE_FLONUM_ARITHMETICS_FUNCTIONS(f128x,	f128x)


/** --------------------------------------------------------------------
 ** Arithmetics: flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
add$1 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 + op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
sub$1 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 - op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mul$1 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return (op1 * op2);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
div$1 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return (op1 / op2);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
inverse$1 (mmux_standard_flonumc$1_t op)
{
  return (mmux_standard_flonumc$1_constant_one() / op);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
negation$1 (mmux_standard_flonumc$1_t op)
{
  return (- op);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
absolutec$1 (mmux_standard_flonumc$1_t Z)
{
  return cabs$2(Z);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(fl)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(db)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(ldb)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f32)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f64)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f128)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f32x)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f64x)
DEFINE_FLONUMC_ARITHMETICS_FUNCTIONS(f128x)


/** --------------------------------------------------------------------
 ** Mathematics: trigonometric and hyperbolic functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_MATH_REAL_FUNCTIONS_TRIG_HYPER]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
sin$1 (mmux_standard_flonum$1_t Z)
{
  return sin$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
cos$1 (mmux_standard_flonum$1_t Z)
{
  return cos$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
tan$1 (mmux_standard_flonum$1_t Z)
{
  return tan$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
asin$1 (mmux_standard_flonum$1_t Z)
{
  return asin$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
acos$1 (mmux_standard_flonum$1_t Z)
{
  return acos$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
atan$1 (mmux_standard_flonum$1_t Z)
{
  return atan$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
atan2$1 (mmux_standard_flonum$1_t imp, mmux_standard_flonum$1_t rep)
{
  return atan2$2(imp, rep);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
sinh$1 (mmux_standard_flonum$1_t Z)
{
  return sinh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
cosh$1 (mmux_standard_flonum$1_t Z)
{
  return cosh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
tanh$1 (mmux_standard_flonum$1_t Z)
{
  return tanh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
asinh$1 (mmux_standard_flonum$1_t Z)
{
  return asinh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
acosh$1 (mmux_standard_flonum$1_t Z)
{
  return acosh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
atanh$1 (mmux_standard_flonum$1_t Z)
{
  return atanh$2(Z);
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_REAL_FUNCTIONS_TRIG_HYPER(fl,	f)
DEFINE_MATH_REAL_FUNCTIONS_TRIG_HYPER(db,	)
DEFINE_MATH_REAL_FUNCTIONS_TRIG_HYPER(ldb,	l)
/* These are already implemented by the standard with correct names.
 *
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f32,	f32)
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f64,	f64)
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f128,	f128)
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f32x,	f32x)
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f64x,	f64x)
 * DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f128x,	f128x)
 */

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_define([[[DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
sinc$1 (mmux_standard_flonumc$1_t Z)
{
  return csin$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
cosc$1 (mmux_standard_flonumc$1_t Z)
{
  return ccos$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
tanc$1 (mmux_standard_flonumc$1_t Z)
{
  return ctan$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
asinc$1 (mmux_standard_flonumc$1_t Z)
{
  return casin$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
acosc$1 (mmux_standard_flonumc$1_t Z)
{
  return cacos$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
atanc$1 (mmux_standard_flonumc$1_t Z)
{
  return catan$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
sinhc$1 (mmux_standard_flonumc$1_t Z)
{
  return csinh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
coshc$1 (mmux_standard_flonumc$1_t Z)
{
  return ccosh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
tanhc$1 (mmux_standard_flonumc$1_t Z)
{
  return ctanh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
asinhc$1 (mmux_standard_flonumc$1_t Z)
{
  return casinh(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
acoshc$1 (mmux_standard_flonumc$1_t Z)
{
  return cacosh$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
atanhc$1 (mmux_standard_flonumc$1_t Z)
{
  return catanh$2(Z);
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(fl,	f)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(db,	)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(ldb,	l)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f32,	f32)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f64,	f64)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f128,	f128)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f32x,	f32x)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f64x,	f64x)
DEFINE_MATH_CPLX_FUNCTIONS_TRIG_HYPER(f128x,	f128x)


/** --------------------------------------------------------------------
 ** Mathematics: exponentiation and logarithms.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
exp$1 (mmux_standard_flonum$1_t X)
{
  return exp$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
exp2$1 (mmux_standard_flonum$1_t X)
{
  /* 2^X = exp( log ( 2^X ) ) = exp( X * log( 2 ) ) */
  return exp$2(X * mmux_standard_flonum$1_constant_LN2());
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
exp10$1 (mmux_standard_flonum$1_t X)
{
  /* 10^X = exp( log ( 10^X ) ) = exp( X * log( 10 ) ) */
  return exp$2(X * mmux_standard_flonum$1_constant_LN10());
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
expm1$1 (mmux_standard_flonum$1_t X)
{
  return expm1$2(X);
}

/* ------------------------------------------------------------------ */

mmux_cc_types_inline_decl mmux_standard_flonum$1_t
log$1 (mmux_standard_flonum$1_t X)
{
  return log$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
log2$1 (mmux_standard_flonumc$1_t X)
/* log_2 X = log X / log 2 */
{
  return (log$1(X) / mmux_standard_flonum$1_constant_LN2());
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
log10$1 (mmux_standard_flonumc$1_t X)
{
  return log10$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
logb$1 (mmux_standard_flonumc$1_t X)
{
  return logb$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
log1p$1 (mmux_standard_flonum$1_t Z)
{
  return log1p$2(Z);
}

/* ------------------------------------------------------------------ */

mmux_cc_types_inline_decl mmux_standard_flonum$1_t
pow$1 (mmux_standard_flonum$1_t X, mmux_standard_flonum$1_t Y)
{
  return pow$2(X, Y);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
sqrt$1 (mmux_standard_flonum$1_t X)
{
  return sqrt$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
cbrt$1 (mmux_standard_flonum$1_t X)
/* cubic root: cbrt(X) = X^(1/3) = exp( log( X^(1/3) )) = exp( 1/3 * log( X )) */
{
  auto one_third = mmux_standard_flonum$1_constant_one() / mmux_standard_flonum$1_literal(3.0);
  return exp$1(one_third * log$1(X));
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
hypot$1 (mmux_standard_flonum$1_t X, mmux_standard_flonum$1_t Y)
{
  return hypot$2(X,Y);
}]]])]]])

m4_define([[[DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
square$1 (mmux_standard_flonum$1_t X)
{
  return (X * X);
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(fl,	f)
DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(db,	)
DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(ldb,	l)
/* These are already implemented by the standard with the correct names.
 *
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f32,	f32)
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f64,	f64)
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f128,	f128)
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f32x,	f32x)
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f64x,	f64x)
 * DEFINE_MATH_REAL_FUNCTIONS_EXP_LOG(f128x,	f128x)
 */

DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(fl,	f)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(db,	)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(ldb,	l)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f32,	f32)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f64,	f64)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f128,	f128)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f32x,	f32x)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f64x,	f64x)
DEFINE_MATH_REAL_EXTRA_FUNCTIONS_EXP_LOG(f128x,	f128x)

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_define([[[DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
expc$1 (mmux_standard_flonumc$1_t Z)
{
  return cexp$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
exp2c$1 (mmux_standard_flonumc$1_t Z)
{
  /* 2^Z = exp( log ( 2^Z ) ) = exp( Z * log( 2 ) ) */
  return cexp$2(Z * rectangularc$1(mmux_standard_flonum$1_constant_LN2(), mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
exp10c$1 (mmux_standard_flonumc$1_t Z)
{
  /* 10^Z = exp( log ( 10^Z ) ) = exp( Z * log( 10 ) ) */
  return cexp$2(Z * rectangularc$1(mmux_standard_flonum$1_constant_LN10(), mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
logc$1 (mmux_standard_flonumc$1_t Z)
{
  return clog$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
log2c$1 (mmux_standard_flonumc$1_t Z)
/* log_2 Z = log Z / log 2 */
{
  return (logc$1(Z) / rectangularc$1(mmux_standard_flonum$1_constant_LN2(), mmux_standard_flonum$1_constant_zero()));
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
log10c$1 (mmux_standard_flonumc$1_t Z)
{
  return clog10$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
powc$1 (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return pow$2(op1, op2);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
squarec$1 (mmux_standard_flonumc$1_t Z)
{
  return (Z * Z);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
sqrtc$1 (mmux_standard_flonumc$1_t X)
{
  return csqrt$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
cbrtc$1 (mmux_standard_flonumc$1_t Z)
/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z )) */
{
  auto one_third = rectangularc$1(mmux_standard_flonum$1_constant_one() / mmux_standard_flonum$1_literal(3.0),
				  mmux_standard_flonum$1_constant_zero());
  return expc$1(one_third * logc$1(Z));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(fl,		f)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(db,		)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(ldb,		l)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f32,		f32)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f64,		f64)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f128,	f128)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f32x,	f32x)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f64x,	f64x)
DEFINE_MATH_CPLX_FUNCTIONS_EXP_LOG(f128x,	f128x)


/** --------------------------------------------------------------------
 ** Mathematics: special functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_MATH_FUNCTIONS_SPECIAL]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
erf$1 (mmux_standard_flonum$1_t X)
{
  return erf$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
erfc$1 (mmux_standard_flonum$1_t X)
{
  return erfc$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
lgamma$1 (mmux_standard_flonum$1_t X)
{
  return lgamma$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
gamma$1 (mmux_standard_flonum$1_t X)
{
  return gamma$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
tgamma$1 (mmux_standard_flonum$1_t X)
{
  return tgamma$2(X);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
j0$1 (mmux_standard_flonum$1_t Z)
{
  return j0$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
j1$1 (mmux_standard_flonum$1_t Z)
{
  return j1$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
jn$1 (int N, mmux_standard_flonum$1_t Z)
{
  return jn$2(N, Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
y0$1 (mmux_standard_flonum$1_t Z)
{
  return y0$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
y1$1 (mmux_standard_flonum$1_t Z)
{
  return y1$2(Z);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
yn$1 (int N, mmux_standard_flonum$1_t Z)
{
  return yn$2(N, Z);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_FUNCTIONS_SPECIAL(fl,	f)
DEFINE_MATH_FUNCTIONS_SPECIAL(db,	)
DEFINE_MATH_FUNCTIONS_SPECIAL(ldb,	l)

/* These are already implemented by the standard with the correct names.
 *
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f32,	f32)
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f64,	f64)
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f128,	f128)
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f32x,	f32x)
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f64x,	f64x)
 * DEFINE_MATH_FUNCTIONS_SPECIAL(f128x,	f128x)
 */


/** --------------------------------------------------------------------
 ** Comparison.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_MIN_MAX_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
min$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return $2(op1, op2);
}
mmux_cc_types_inline_decl bool
max$1 (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return $3(op1, op2);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_MIN_MAX_FUNCTIONS(fl,		fminf,		fmaxf)
DEFINE_MIN_MAX_FUNCTIONS(db,		fmin,		fmax)
DEFINE_MIN_MAX_FUNCTIONS(ldb,		fminl,		fmaxl)
DEFINE_MIN_MAX_FUNCTIONS(f32,		fminf32,	fmaxf32)
DEFINE_MIN_MAX_FUNCTIONS(f64,		fminf64,	fmaxf64)
DEFINE_MIN_MAX_FUNCTIONS(f128,		fminf128,	fmaxf128)
DEFINE_MIN_MAX_FUNCTIONS(f32x,		fminf32x,	fmaxf32x)
DEFINE_MIN_MAX_FUNCTIONS(f64x,		fminf64x,	fmaxf64x)
DEFINE_MIN_MAX_FUNCTIONS(f128x,		fminf128x,	fmaxf128x)


/** --------------------------------------------------------------------
 ** Sprinter and parser adapters.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
mmux_cc_types_inline_decl mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return $2(result_p, size, format, value);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value, mmux_asciizpp_t restrict tailptr)
{
  return $3(s_input_value, tailptr);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(fl,	strfromf,	strtof)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(db,	strfromd,	strtod)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(ldb,	strfroml,	strtold)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f32,	strfromf32,	strtof32)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f64,	strfromf64,	strtof64)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f128,	strfromf128,	strtof128)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f32x,	strfromf32x,	strtof32x)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f64x,	strfromf64x,	strtof64x)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f128x,	strfromf128x,	strtof128x)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_ADAPTERS_H */

/* end of file */
