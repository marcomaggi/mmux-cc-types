/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Aug 30, 2025

  Abstract

	This  module  implements  mathematical   functions  for  the  standard  types
	"mmux_standard_flonumcd$1_t".

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

#include <mmux-cc-types-libdfp-internal.h>


/** --------------------------------------------------------------------
 ** Standard types adapters: real numbers mathematical functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS]]],[[[
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_square (mmux_standard_flonumd$1_t op)
{
  return mmux_standard_flonumd$1_mul(op,op);
}

mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_exp (mmux_standard_flonumd$1_t op)
{
  return expd$1(op);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_exp2 (mmux_standard_flonumd$1_t op)
{
  return expd$1(op * logd$1(mmux_standard_flonumd$1_constant_two()));
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_exp10 (mmux_standard_flonumd$1_t op)
{
  return expd$1(op * logd$1(mmux_standard_flonumd$1_constant_ten()));
}

mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_log (mmux_standard_flonumd$1_t op)
{
  return logd$1(op);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_log2d (mmux_standard_flonumd$1_t op)
/* log_2 X = log X / log 2 */
{
  return logd$1(op) / mmux_standard_flonumd$1_constant_LN2();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_log10 (mmux_standard_flonumd$1_t op)
/* log_10 X = log X / log 10 */
{
  return logd$1(op) / mmux_standard_flonumd$1_constant_LN10();
}

/* The Bessel stuff below is not really implemented by "libdfp", or is it? */
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_j0 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_j1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_jn (mmux_standard_sint_t     N  __attribute__((__unused__)),
		    mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_y0 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_y1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_yn (mmux_standard_sint_t      N  __attribute__((__unused__)),
			    mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(32)
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(64)
DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Standard types adapters: complex numbers mathematical functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_UNARY_MATH_CPLX_FUNCTION]]],[[[m4_dnl
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_$2 (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_constant_nan();
}]]])

m4_define([[[DEFINE_BINARY_MATH_CPLX_FUNCTION]]],[[[m4_dnl
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_$2 (mmux_standard_flonumcd$1_t Z1 __attribute__((__unused__)),
			     mmux_standard_flonumcd$1_t Z2 __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_constant_nan();
}]]])

m4_define([[[DEFINE_MATH_CPLX_FUNCTIONS]]],[[[

mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp (mmux_standard_flonumcd$1_t op)
{
  auto	R = mmux_standard_flonumd$1_exp(op.re);
  auto	S = mmux_standard_flonumd$1_sin(op.im);
  auto	C = mmux_standard_flonumd$1_cos(op.im);

  return mmux_standard_flonumcd$1_rectangular(R * S, R * C);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp2 (mmux_standard_flonumcd$1_t op)
{
  /* exp2(op) = exp(op * log(2)) */
  auto	LN2 = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_LN2(),
						   mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_exp(mmux_standard_flonumcd$1_mul(op, LN2));
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp10 (mmux_standard_flonumcd$1_t op)
{
  /* exp2(op) = exp(op * log(10)) */
  auto	LN10 = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_LN10(),
						    mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_exp(mmux_standard_flonumcd$1_mul(op, LN10));
}

mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log (mmux_standard_flonumcd$1_t op)
{
  auto	R    = mmux_standard_flonumcd$1_absolute(op);
  auto	T    = mmux_standard_flonumcd$1_argument(op);
  auto	ln_R = mmux_standard_flonumd$1_log(R);

  return mmux_standard_flonumcd$1_rectangular(ln_R, T);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log2 (mmux_standard_flonumcd$1_t op)
/* log_2 X = log X / log 2 */
{
  auto	LN2 = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_LN2(),
						   mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_div(mmux_standard_flonumcd$1_log(op), LN2);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log10 (mmux_standard_flonumcd$1_t op)
/* log_10 X = log X / log 10 */
{
  auto	LN10 = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_LN10(),
						    mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_div(mmux_standard_flonumcd$1_log(op), LN10);
}


/* TRIGONOMETRIC SINE FOR COMPLEX NUMBERS
 *
 * For the real part of a complex number Z we notice that:
 *
 *    Z + conj(Z) = (A+iB) + (A-iB) = (A+A) + i (B-B) = 2A
 *
 * and:
 *
 *    conj(sin(X+iY)) = sin(conj(X+iY)) = sin(X-iY)
 *
 * so:
 *
 *    2 Rep{sin(X+iY)} = sin(X+iY) + sin(X-iY)
 *
 * by definition:
 *
 *                exp[i(X+iY)] - exp[-i(X+iY)]   exp(iX)exp(-Y) - exp(-iX)exp(+Y)
 *    sin(X+iY) = ---------------------------- = --------------------------------
 *                            2i                               2i
 *
 *                exp[i(X-iY)] - exp[-i(X-iY)]   exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *    sin(X-iY) = ---------------------------- = --------------------------------
 *                            2i                               2i
 *
 * so:
 *
 *    4i Rep{sin(X+iY)} =
 *      = exp(iX)exp(-Y) - exp(-iX)exp(+Y) + exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *
 * We notice also that:
 *
 *              exp(iX) - exp(-iX)                exp(Y) + exp(-Y)
 *    sin(X)  = ------------------      cosh(Y) = ----------------
 *                     2i                                2
 *
 * so:
 *
 *    4i sin(X) cosh(Y) = [exp(iX) - exp(-iX)] [exp(+Y) + exp(-Y)]
 *      = exp(iX)exp(+Y) - exp(-iX)exp(+Y) + exp(iX)exp(-Y) - exp(-iX)exp(-Y)
 *      = exp(iX)exp(-Y) - exp(-iX)exp(+Y) + exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *
 * and finally:
 *
 *    4i Rep{sin(X+iY)} = 4i sin(X) cosh(Y)  =>  Rep{sin(X+iY)} = sin(X) cosh(Y)
 *
 * For the imaginary part of a complex number Z we notice that:
 *
 *    Z - conj(Z) = (A+iB) - (A-iB) = (A-A) + iB - (-iB) = iB + iB = 2iB
 *
 * and:
 *
 *    conj(sin(X+iY)) = sin(conj(X+iY)) = sin(X-iY)
 *
 * so:
 *
 *    2i Imp{sin(X+iY)} = sin(X+iY) - sin(X-iY)
 *
 * by definition:
 *
 *                exp[i(X+iY)] - exp[-i(X+iY)]   exp(iX)exp(-Y) - exp(-iX)exp(+Y)
 *    sin(X+iY) = ---------------------------- = --------------------------------
 *                            2i                               2i
 *
 *                exp[i(X-iY)] - exp[-i(X-iY)]   exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *    sin(X-iY) = ---------------------------- = --------------------------------
 *                            2i                               2i
 *
 * so, given that 2i * 2i = -4:
 *
 *    -4 Imp{sin(X+iY)} =
 *      = exp(iX)exp(-Y) - exp(-iX)exp(+Y) - exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *
 * We notice also that:
 *
 *             exp(iX) + exp(-iX)                exp(Y) - exp(-Y)
 *    cos(X) = ------------------      sinh(Y) = ----------------
 *                     2                                2
 *
 * so:
 *
 *    4 cos(X) sinh(Y) = [exp(iX) + exp(-iX)] [exp(Y) - exp(-Y)]
 *      =   exp(iX)exp(+Y) + exp(-iX)exp(+Y) - exp(iX)exp(-Y) - exp(-iX)exp(-Y)
 *      = - exp(iX)exp(-Y) + exp(-iX)exp(+Y) + exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *
 *    -4 cos(X) sinh(Y) =
 *      =   exp(iX)exp(-Y) - exp(-iX)exp(+Y) - exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *
 * and finally:
 *
 *    -4 Imp{sin(X+iY)} = -4 cos(X) sinh(Y)  =>  Imp{sin(X+iY)} = cos(X) sinh(Y)
 *
 */
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_sinc (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_sin(Z.re) * mmux_standard_flonumd$1_cos(Z.im),
					      mmux_standard_flonumd$1_cos(Z.re) * mmux_standard_flonumd$1_sinh(Z.im));
}

/* TRIGONOMETRIC COSINE FOR COMPLEX NUMBERS
 *
 * For the real part of a complex number Z we notice that:
 *
 *    Z + conj(Z) = (A+iB) + (A-iB) = (A+A) + i (B-B) = 2A
 *
 * and:
 *
 *    conj(cos(X+iY)) = cos(conj(X+iY)) = cos(X-iY)
 *
 * so:
 *
 *    2 Rep{cos(X+iY)} = cos(X+iY) + cos(X-iY)
 *
 * by definition:
 *
 *                exp[i(X+iY)] + exp[-i(X+iY)]   exp(iX)exp(-Y) + exp(-iX)exp(+Y)
 *    cos(X+iY) = ---------------------------- = --------------------------------
 *                             2                                2
 *
 *                exp[i(X-iY)] + exp[-i(X-iY)]   exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *    cos(X-iY) = ---------------------------- = --------------------------------
 *                             2                                2
 *
 * so:
 *
 *    2 Rep{cos(X+iY)} =
 *      = exp(iX)exp(-Y) + exp(-iX)exp(+Y) + exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *
 * We notice also that:
 *
 *              exp(iX) + exp(-iX)                exp(Y) + exp(-Y)
 *    cos(X)  = ------------------      cosh(Y) = ----------------
 *                      2                                2
 *
 * so:
 *
 *    4 cos(X) cosh(Y) = [exp(iX) + exp(-iX)] [exp(Y) + exp(-Y)]
 *      = exp(iX)exp(+Y) + exp(-iX)exp(+Y) + exp(iX)exp(-Y) + exp(-iX)exp(-Y)
 *      = exp(iX)exp(-Y) + exp(-iX)exp(+Y) + exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *
 * and finally:
 *
 *    4 Rep{cos(X+iY)} = 4 cos(X) cosh(Y)  =>  Rep{cos(X+iY)} = cos(X) cosh(Y)
 *
 *
 * For the imaginary part of a complex number Z we notice that:
 *
 *    Z - conj(Z) = (A+iB) - (A-iB) = (A-A) + iB - (-iB) = iB + iB = 2iB
 *
 * and:
 *
 *    conj(cos(X+iY)) = cos(conj(X+iY)) = cos(X-iY)
 *
 * so:
 *
 *    2i Imp{cos(X+iY)} = cos(X+iY) - cos(X-iY)
 *
 * by definition:
 *
 *                exp[i(X+iY)] + exp[-i(X+iY)]   exp(iX)exp(-Y) + exp(-iX)exp(+Y)
 *    cos(X+iY) = ---------------------------- = --------------------------------
 *                             2                                2
 *
 *                exp[i(X-iY)] + exp[-i(X-iY)]   exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *    cos(X-iY) = ---------------------------- = --------------------------------
 *                             2                                2
 *
 * so:
 *
 *    4i Imp{cos(X+iY)} =
 *      = exp(iX)exp(-Y) + exp(-iX)exp(+Y) - exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *
 * We notice also that:
 *
 *             exp(iX) - exp(-iX)                exp(Y) - exp(-Y)
 *    sin(X) = ------------------      sinh(Y) = ----------------
 *                    2i                                2
 *
 * so:
 *
 *    4i sin(X) sinh(Y) = [exp(iX) - exp(-iX)] [exp(+Y) - exp(-Y)]
 *      =   exp(iX)exp(+Y) - exp(-iX)exp(+Y) - exp(iX)exp(-Y) + exp(-iX)exp(-Y)
 *      = - exp(iX)exp(-Y) - exp(-iX)exp(+Y) + exp(iX)exp(+Y) + exp(-iX)exp(-Y)
 *
 *    -4i sin(X) sinh(Y) =
 *      =   exp(iX)exp(-Y) + exp(-iX)exp(+Y) - exp(iX)exp(+Y) - exp(-iX)exp(-Y)
 *
 * and finally:
 *
 *    4i Imp{cos(X+iY)} = -4i sin(X) sinh(Y)  =>  Imp{cos(X+iY)} = - sin(X) sinh(Y)
 *
 */
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_cosc (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_cos(Z.re) * mmux_standard_flonumd$1_cosh(Z.im),
					      - (mmux_standard_flonumd$1_sin(Z.re) * mmux_standard_flonumd$1_sinh(Z.im)));
}

/* TRIGONOMETRIC TANGENT FOR COMPLEX NUMBERS
 *
 * Verified with WolframAlpha:
 *
 *    tan (x.rep + i * x.imp) = z.rep + i * z.imp
 *
 *                     sin (2 * x.rep)
 *    z.rep = ----------------------------------
 *            cos (2 * x.rep) + cosh (2 * x.imp)
 *
 *                    sinh (2 * x.imp)
 *    z.imp = ----------------------------------
 *            cos (2 * x.rep) + cosh (2 * x.imp)
 *
 * alternatively the following formula avoids  generating a NaN in some
 * cases:
 *
 *              tanh (2 * x.imp)
 *    z.imp = --------------------
 *                 cos (2 * x.rep)
 *            1 + ----------------
 *                cosh (2 * x.imp)
 *
 * Using the alternative formula for  Z.IMP is slower because we cannot
 * share the denominator with Z.REP.
 *
 */
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_tan (mmux_standard_flonumcd$1_t Z)
{
  auto	R2	= mmux_standard_flonumd$1_constant_two() * Z.re;
  auto	I2	= mmux_standard_flonumd$1_constant_two() * Z.im;

  if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.re) && MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.im)) {
    /* Avoid generating a NaN in this case  by using the alternative formula for the
       imaginary part. */
    auto	A	= mmux_standard_flonumd$1_cos(R2);
    auto	B	= mmux_standard_flonumd$1_cosh(I2);
    auto	rop_re	= mmux_standard_flonumd$1_sin(R2) / (A + B);
    auto	rop_im	= mmux_standard_flonumd$1_tanh(I2) / (mmux_standard_flonumd$1_constant_one() + A / B);
    return mmux_standard_flonumcd$1_rectangular(rop_re, rop_im);
  } else {
    /* This is faster. */
    auto	den	= mmux_standard_flonumd$1_cos(R2) + mmux_standard_flonumd$1_cosh(I2);
    auto	rop_re	= mmux_standard_flonumd$1_sin(R2)  / den;
    auto	rop_im	= mmux_standard_flonumd$1_sinh(I2) / den;
    return mmux_standard_flonumcd$1_rectangular(rop_re, rop_im);
  }
}

DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		asin)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		acos)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		atan)

DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		sinh)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		cosh)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		tanh)

DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		asinh)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		acosh)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		atanh)

/* ------------------------------------------------------------------ */

mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp (mmux_standard_flonumcd$1_t Z)
{
  /* exp(Z) = exp(Rep{Z}) * (cos(Imp{Z}) + i * sin(Imp{Z})
   *        = exp(Rep{Z}) * cos(Imp{Z}) + i * exp(Rep{Z}) * sin(Imp{Z})
   */
  auto	exp_rep_Z	= mmux_standard_flonumd$1_exp(Z.re);
  auto	cos_imp_Z	= mmux_standard_flonumd$1_cos(Z.im);
  auto	sin_imp_Z	= mmux_standard_flonumd$1_sin(Z.im);
  auto	rep_rop		= exp_rep_Z * cos_imp_Z;
  auto	imp_rop		= exp_rep_Z * sin_imp_Z;
  return mmux_standard_flonumcd$1_rectangular(rep_rop, imp_rop);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp2 (mmux_standard_flonumcd$1_t Z)
{
  /* 2^Z = exp( log ( 2^Z ) ) = exp( Z * log( 2 ) ) */
  auto	natural_logarithm_of_two = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_LN2(),
									mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_exp( mmux_standard_flonumcd$1_mul(Z, natural_logarithm_of_two) );
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp10 (mmux_standard_flonumcd$1_t Z)
{
  /* 10^Z = exp( log ( 2^Z ) ) = exp( Z * log( 19 ) ) */
  auto	natural_logarithm_of_ten = CMPLXCD$1(mmux_standard_flonumd$1_constant_LN10(),
					     mmux_standard_flonumd$1_constant_zero());
  return mmux_standard_flonumcd$1_exp( mmux_standard_flonumcd$1_mul(Z, natural_logarithm_of_ten) );
}

/* ------------------------------------------------------------------ */

mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log (mmux_standard_flonumcd$1_t Z)
{
  auto	radius		= mmux_standard_flonumcd$1_absolute(Z);
  auto	ln_of_radius	= mmux_standard_flonumd$1_log(radius);
  auto	argument	= mmux_standard_flonumcd$1_argument(Z);
  return mmux_standard_flonumcd$1_rectangular(ln_of_radius, argument);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumdc$1_log2 (mmux_standard_flonumcd$1_t Z)
{
  /* log_2 Z = log Z / log 2 */
  return mmux_standard_flonumcd$1_div(mmux_standard_flonumcd$1_log(Z),
				      mmux_standard_flonumcd$1_constant_two());
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log10 (mmux_standard_flonumcd$1_t Z)
{
  /* log_10 Z = log Z / log 10 */
  return mmux_standard_flonumcd$1_div(mmux_standard_flonumcd$1_log(Z),
				      mmux_standard_flonumcd$1_constant_ten());
}

/* ------------------------------------------------------------------ */

DEFINE_BINARY_MATH_CPLX_FUNCTION($1,		pow)

static mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_square (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_mul(Z,Z);
}

DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		sqrt)

/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z )) */
static mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_cbrt (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_exp(mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_one_third(),
								   mmux_standard_flonumcd$1_log(Z)));
}]]])
m4_divert(0)m4_dnl
DEFINE_MATH_CPLX_FUNCTIONS(32)
DEFINE_MATH_CPLX_FUNCTIONS(64)
DEFINE_MATH_CPLX_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: real decimal floating-point functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t X)
{
  return mmux_flonumd$1($2d$1(X.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1($2d$1(X.value, Y.value));
}]]])

m4_define([[[DEFINE_UNARY_MATH_BESSEL_FUNCTION]]],[[[mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t X)
{
  return mmux_flonumd$1(mmux_standard_$2d$1(X.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_SINT_BESSEL_FUNCTION]]],[[[mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_sint_t N, mmux_flonumd$1_t X)
{
  return mmux_flonumd$1(mmux_standard_$2d$1(N.value, X.value));
}]]])

m4_define([[[DEFINE_FLONUMD_MATH_FUNCTIONS]]],[[[m4_dnl
DEFINE_UNARY_MATH_FUNCTION($1,		sin);
DEFINE_UNARY_MATH_FUNCTION($1,		cos);
DEFINE_UNARY_MATH_FUNCTION($1,		tan);

DEFINE_UNARY_MATH_FUNCTION($1,		asin);
DEFINE_UNARY_MATH_FUNCTION($1,		acos);
DEFINE_UNARY_MATH_FUNCTION($1,		atan);
DEFINE_BINARY_MATH_FUNCTION($1,		atan2);

DEFINE_UNARY_MATH_FUNCTION($1,		sinh);
DEFINE_UNARY_MATH_FUNCTION($1,		cosh);
DEFINE_UNARY_MATH_FUNCTION($1,		tanh);

DEFINE_UNARY_MATH_FUNCTION($1,		asinh);
DEFINE_UNARY_MATH_FUNCTION($1,		acosh);
DEFINE_UNARY_MATH_FUNCTION($1,		atanh);

DEFINE_UNARY_MATH_FUNCTION($1,		exp);
DEFINE_UNARY_MATH_FUNCTION($1,		exp2);
DEFINE_UNARY_MATH_FUNCTION($1,		exp10);

DEFINE_UNARY_MATH_FUNCTION($1,		log);
DEFINE_UNARY_MATH_FUNCTION($1,		log10);
DEFINE_UNARY_MATH_FUNCTION($1,		log2);
DEFINE_UNARY_MATH_FUNCTION($1,		logb);

DEFINE_BINARY_MATH_FUNCTION($1,		pow);
DEFINE_UNARY_MATH_FUNCTION($1,		square);
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt);
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt);
DEFINE_BINARY_MATH_FUNCTION($1,		hypot);

DEFINE_UNARY_MATH_FUNCTION($1,		expm1);
DEFINE_UNARY_MATH_FUNCTION($1,		log1p);

DEFINE_UNARY_MATH_FUNCTION($1,		erf);
DEFINE_UNARY_MATH_FUNCTION($1,		erfc);

DEFINE_UNARY_MATH_FUNCTION($1,		lgamma);
DEFINE_UNARY_MATH_FUNCTION($1,		tgamma);
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_MATH_FUNCTIONS(32)
DEFINE_FLONUMD_MATH_FUNCTIONS(64)
DEFINE_FLONUMD_MATH_FUNCTIONS(128)

m4_divert(-1)
m4_define([[[DEFINE_FLONUMD_MATH_BESSEL_FUNCTIONS]]],[[[m4_dnl
DEFINE_UNARY_MATH_BESSEL_FUNCTION($1,		j0);
DEFINE_UNARY_MATH_BESSEL_FUNCTION($1,		j1);
DEFINE_BINARY_MATH_SINT_BESSEL_FUNCTION($1,	jn);

DEFINE_UNARY_MATH_BESSEL_FUNCTION($1,		y0);
DEFINE_UNARY_MATH_BESSEL_FUNCTION($1,		y1);
DEFINE_BINARY_MATH_SINT_BESSEL_FUNCTION($1,	yn);
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_MATH_BESSEL_FUNCTIONS(32)
DEFINE_FLONUMD_MATH_BESSEL_FUNCTIONS(64)
DEFINE_FLONUMD_MATH_BESSEL_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: complex decimal floating-point functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_UNARY_MATH_FUNCTION]]],[[[mmux_flonumcd$1_t
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t X)
{
  return mmux_flonumcd$1($2cd$1(X.value));
}]]])

m4_define([[[DEFINE_BINARY_MATH_FUNCTION]]],[[[mmux_flonumcd$1_t
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t X, mmux_flonumcd$1_t Y)
{
  return mmux_flonumcd$1($2cd$1(X.value, Y.value));
}]]])

m4_define([[[DEFINE_FLONUMCD_MATH_FUNCTIONS]]],[[[m4_dnl
DEFINE_UNARY_MATH_FUNCTION($1,		sin);
DEFINE_UNARY_MATH_FUNCTION($1,		cos);
DEFINE_UNARY_MATH_FUNCTION($1,		tan);

DEFINE_UNARY_MATH_FUNCTION($1,		asin);
DEFINE_UNARY_MATH_FUNCTION($1,		acos);
DEFINE_UNARY_MATH_FUNCTION($1,		atan);

DEFINE_UNARY_MATH_FUNCTION($1,		sinh);
DEFINE_UNARY_MATH_FUNCTION($1,		cosh);
DEFINE_UNARY_MATH_FUNCTION($1,		tanh);

DEFINE_UNARY_MATH_FUNCTION($1,		asinh);
DEFINE_UNARY_MATH_FUNCTION($1,		acosh);
DEFINE_UNARY_MATH_FUNCTION($1,		atanh);

DEFINE_UNARY_MATH_FUNCTION($1,		exp);
DEFINE_UNARY_MATH_FUNCTION($1,		exp2);
DEFINE_UNARY_MATH_FUNCTION($1,		exp10);
DEFINE_UNARY_MATH_FUNCTION($1,		log);
DEFINE_UNARY_MATH_FUNCTION($1,		log2);
DEFINE_UNARY_MATH_FUNCTION($1,		log10);
DEFINE_BINARY_MATH_FUNCTION($1,		pow);
DEFINE_UNARY_MATH_FUNCTION($1,		square);
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt);
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt);
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_MATH_FUNCTIONS(32)
DEFINE_FLONUMCD_MATH_FUNCTIONS(64)
DEFINE_FLONUMCD_MATH_FUNCTIONS(128)

/* end of file */
