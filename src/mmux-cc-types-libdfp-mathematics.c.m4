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

#include <mmux-cc-types-libdfp-internals.h>


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumd, functions implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_$2 (mmux_standard_flonumd$1_t op)
{
  return $2d$1(op);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_BINARY]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_$2 (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return $2d$1(op1, op2);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_BINARY_SINT]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_$2 (mmux_standard_sint_t op1, mmux_standard_flonumd$1_t op2)
{
  return $2d$1(op1, op2);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_FUNCTIONS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	sin)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	cos)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	tan)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	asin)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	acos)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	atan)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_BINARY($1,	atan2)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	sinh)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	cosh)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	tanh)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	asinh)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	acosh)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	atanh)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	exp)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	exp2)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	log)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	log10)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	log2)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	logb)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_BINARY($1,	pow)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	sqrt)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	cbrt)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_BINARY($1,	hypot)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	expm1)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	log1p)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	erf)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	erfc)

DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	lgamma)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_UNARY($1,	tgamma)
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_LIBDFP_WRAPPER_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumd, functions NOT implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_EXTENSION_FUNCTIONS]]],[[[
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_square (mmux_standard_flonumd$1_t op)
{
  return mmux_standard_flonumd$1_mul(op,op);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_cube (mmux_standard_flonumd$1_t op)
{
  return mmux_standard_flonumd$1_mul(op,mmux_standard_flonumd$1_mul(op,op));
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_exp10 (mmux_standard_flonumd$1_t op)
{
  return expd$1(op * logd$1(mmux_standard_flonumd$1_constant_ten()));
}
/* The Bessel stuff below is not really  implemented by "libdfp", or is it?  It looks
   like the  functions are declred but  no implementation is present.   (Marco Maggi;
   Sep 3, 2025) */
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
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_EXTENSION_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_EXTENSION_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_EXTENSION_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, trigonometric functions: sin, cos, tan.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_DIRECT_TRIGONOMETRIC_FUNCTIONS]]],[[[
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
mmux_standard_flonumcd$1_sin (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_sin(Z.re) * mmux_standard_flonumd$1_cosh(Z.im),
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
mmux_standard_flonumcd$1_cos (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_cos(Z.re) * mmux_standard_flonumd$1_cosh(Z.im),
					      - (mmux_standard_flonumd$1_sin(Z.re) * mmux_standard_flonumd$1_sinh(Z.im)));
}

/* TRIGONOMETRIC TANGENT FOR COMPLEX NUMBERS
 *
 * Verified with WolframAlpha:
 *
 *    tan (x.rep + i * x.im) = z.rep + i * z.im
 *
 *                     sin (2 * x.rep)
 *    z.rep = ----------------------------------
 *            cos (2 * x.rep) + cosh (2 * x.im)
 *
 *                    sinh (2 * x.im)
 *    z.im = ----------------------------------
 *            cos (2 * x.rep) + cosh (2 * x.im)
 *
 * alternatively the following formula avoids  generating a NaN in some
 * cases:
 *
 *              tanh (2 * x.im)
 *    z.im = --------------------
 *                 cos (2 * x.rep)
 *            1 + ----------------
 *                cosh (2 * x.im)
 *
 * Using the alternative formula for  Z.IM is slower because we cannot
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
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_DIRECT_TRIGONOMETRIC_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_DIRECT_TRIGONOMETRIC_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_DIRECT_TRIGONOMETRIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, trigonometric inverse functions: asin, acos, atan.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_INVERSE_TRIGONOMETRIC_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_asin (mmux_standard_flonumcd$1_t Z)
{
  /* See Wikipedia:
   *
   *	<https://en.wikipedia.org/wiki/Inverse_trigonometric_functions
   *
   * section "Logarithmic forms".
   *
   * asin(Z) = - imag log(imag * Z + sqrt(1 - square(Z)))
   *
   */
  auto	A = mmux_standard_flonumcd$1_square(Z);
  auto	B = mmux_standard_flonumcd$1_sub(mmux_standard_flonumcd$1_constant_one(), A);
  auto	C = mmux_standard_flonumcd$1_sqrt(B);
  auto	D = mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_imag(), Z);
  auto	E = mmux_standard_flonumcd$1_log(mmux_standard_flonumcd$1_add(D, C));
  auto	F = mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_imag(), E);
  auto	G = mmux_standard_flonumcd$1_neg(F);

  return G;
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_acos (mmux_standard_flonumcd$1_t Z)
{
  /* See Wikipedia:
   *
   *	<https://en.wikipedia.org/wiki/Inverse_trigonometric_functions
   *
   * section "Logarithmic forms".
   *
   * acos(Z) = pi/2 - asin(Z)
   *
   */
  auto	A = mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_constant_PI_2(),
						 mmux_standard_flonumd$1_constant_zero());
  auto	B = mmux_standard_flonumcd$1_asin(Z);
  auto	C = mmux_standard_flonumcd$1_sub(A, B);
  return C;
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_atan (mmux_standard_flonumcd$1_t Z)
{
  /* See Wikipedia:
   *
   *	<https://en.wikipedia.org/wiki/Inverse_trigonometric_functions
   *
   * section "Logarithmic forms".
   *
   * atan(Z) = - imag/2 * log( (imag - Z) / (imag + Z) )
   *
   */
  auto	A = mmux_standard_flonumcd$1_sub(mmux_standard_flonumcd$1_constant_imag(), Z);
  auto	B = mmux_standard_flonumcd$1_add(mmux_standard_flonumcd$1_constant_imag(), Z);
  auto	C = mmux_standard_flonumcd$1_div(A, B);
  auto	D = mmux_standard_flonumcd$1_log(C);
  auto	E = mmux_standard_flonumcd$1_div(mmux_standard_flonumcd$1_constant_imag(),
					 mmux_standard_flonumcd$1_constant_two());
  auto	F = mmux_standard_flonumcd$1_neg(E);
  auto	G = mmux_standard_flonumcd$1_mul(F, D);
  return G;
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_INVERSE_TRIGONOMETRIC_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_INVERSE_TRIGONOMETRIC_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_INVERSE_TRIGONOMETRIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, exponentiation functions: exp, exp2, exp10.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_EXPONENTIATION_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_exp (mmux_standard_flonumcd$1_t op)
{
  /*
   * exp(Z.re + i * Z.im) = exp(Z.re) cos(Z.im) + i * exp(Z.re) sin(Z.im)
   */
  auto	R = mmux_standard_flonumd$1_exp(op.re);
  auto	C = mmux_standard_flonumd$1_cos(op.im);
  auto	S = mmux_standard_flonumd$1_sin(op.im);

  return mmux_standard_flonumcd$1_rectangular(R * C, R * S);
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
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_EXPONENTIATION_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_EXPONENTIATION_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_EXPONENTIATION_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, logarithmic functions: log, log2, log10.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_LOGARITHMIC_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_log (mmux_standard_flonumcd$1_t op)
{
  /* We want the principal value of log_e(Z):
   *
   *   W = log_e(Z) = log_e(abs(Z)) + i * arg(Z)
   *
   *   arg(Z) = atan2(Z.im, Z.re)
   */
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
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_LOGARITHMIC_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_LOGARITHMIC_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_LOGARITHMIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, hyperbolic functions: sinh, cosh, tanh.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_HYPERBOLIC_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_sinh (mmux_standard_flonumcd$1_t Z)
{
  if (mmux_standard_flonumd$1_is_zero(Z.im)) {
    return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_sinh(Z.re) , Z.im);
  } else {
    auto	sinhZre = mmux_standard_flonumd$1_sinh(Z.re);
    auto	coshZre = mmux_standard_flonumd$1_cosh(Z.re);
    auto	sinZim  = mmux_standard_flonumd$1_sin(Z.im);
    auto	cosZim  = mmux_standard_flonumd$1_cos(Z.im);

    return mmux_standard_flonumcd$1_rectangular(sinhZre * cosZim, coshZre * sinZim);
  }
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_cosh (mmux_standard_flonumcd$1_t Z)
{
  if (mmux_standard_flonumd$1_is_zero(Z.im)) {
    return mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_cosh(Z.re) , Z.im);
  } else {
    auto	sinhZre = mmux_standard_flonumd$1_sinh(Z.re);
    auto	coshZre = mmux_standard_flonumd$1_cosh(Z.re);
    auto	sinZim  = mmux_standard_flonumd$1_sin(Z.im);
    auto	cosZim  = mmux_standard_flonumd$1_cos(Z.im);

    return mmux_standard_flonumcd$1_rectangular(coshZre * cosZim, sinhZre * sinZim);
  }
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_tanh (mmux_standard_flonumcd$1_t Z)
{
  /*
   *
   * tanh (Z) = W.re + i * W.im
   *
   *           tanh (2 * Z.im)
   * W.re = --------------------
   *              cos (2 * Z.im)
   *         1 + ---------------
   *             cosh (2 * Z.re)
   *
   *                  sin (2 * Z.im)
   * W.im = ----------------------------------
   *         cosh (2 * Z.re) + cos (2 * Z.im)
   *
   */
  auto	Zre2 = mmux_standard_flonumd$1_constant_two() * Z.re;
  auto	Zim2 = mmux_standard_flonumd$1_constant_two() * Z.im;

  auto	sinZim2  = mmux_standard_flonumd$1_sin(Zim2);
  auto	cosZim2  = mmux_standard_flonumd$1_cos(Zim2);

  auto	coshZre2 = mmux_standard_flonumd$1_cosh(Zre2);
  auto	tanhZim2 = mmux_standard_flonumd$1_tanh(Zim2);

  auto	Wre = tanhZim2 / mmux_standard_flonumd$1_constant_one() + cosZim2 / coshZre2;
  auto	Wim = sinZim2 / (coshZre2 + cosZim2);

  return mmux_standard_flonumcd$1_rectangular(Wre, Wim);
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_HYPERBOLIC_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_HYPERBOLIC_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_HYPERBOLIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, inverse hyperbolic functions: asinh, acosh, atanh.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_INVERSE_HYPERBOLIC_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_asinh (mmux_standard_flonumcd$1_t Z)
{
  /*
   * Everybody (including the GNU C Library) makes use of this formula:
   *
   *    (log (+ z (sqrt (+ 1 (square z)))))
   *
   * notice:
   *
   *    S    = 1 + Z^2 = 1 + (X+iY)^2 = 1 + (X+iY) (X+iY) = 1 + X^2 - Y^2 + 2iXY
   *    S.re = 1 + X^2 - Y^2
   *    S.im = 2XY
   */
  auto	T = mmux_standard_flonumcd$1_square(Z);
  T = mmux_standard_flonumcd$1_add(mmux_standard_flonumcd$1_constant_one(), T);
  T = mmux_standard_flonumcd$1_sqrt(T);
  T = mmux_standard_flonumcd$1_add(Z, T);
  return mmux_standard_flonumcd$1_log(T);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_acosh (mmux_standard_flonumcd$1_t Z)
{
  /*
   * From Wikipedia (https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions):
   *
   *  W = acosh(Z) = log{Z + [sqrt(Z + 1) * sqrt(Z - 1)]}
   *
   *  (let* ((A	(sqrt (+ Z 1)))
   *         (B	(sqrt (- Z 1)))
   *         (C	(* A B))
   *         (D	(+ Z C)))
   *    (log D))
   *
   * where log() computes the principal value.
   */
  auto  A = mmux_standard_flonumcd$1_sqrt(mmux_standard_flonumcd$1_add(Z, mmux_standard_flonumcd$1_constant_one()));
  auto  B = mmux_standard_flonumcd$1_sqrt(mmux_standard_flonumcd$1_sub(Z, mmux_standard_flonumcd$1_constant_one()));
  auto  C = mmux_standard_flonumcd$1_mul(A, B);
  auto  D = mmux_standard_flonumcd$1_add(Z, C);

  return mmux_standard_flonumcd$1_log(D);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_atanh (mmux_standard_flonumcd$1_t Z)
{
  /*
   * From Wikipedia:
   *
   *                    1 + Z
   *  atanh Z = 1/2 log -----
   *                    1 - Z
   *
   */
  auto	A = mmux_standard_flonumcd$1_add(mmux_standard_flonumcd$1_constant_one(), Z);
  auto	B = mmux_standard_flonumcd$1_sub(mmux_standard_flonumcd$1_constant_one(), Z);
  auto	C = mmux_standard_flonumcd$1_div(A,B);
  auto	D = mmux_standard_flonumcd$1_log(C);

  return mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_one_half(), D);
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_INVERSE_HYPERBOLIC_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_INVERSE_HYPERBOLIC_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_INVERSE_HYPERBOLIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd, powers and roots functions: pow, square, sqrt, cbrt.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_POWERS_FUNCTIONS]]],[[[
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_pow (mmux_standard_flonumcd$1_t Z, mmux_standard_flonumcd$1_t W)
/* pow(Z,W) = Z^W = exp( log( Z^W )) = exp( W * log( Z )) */
{
  return mmux_standard_flonumcd$1_exp(mmux_standard_flonumcd$1_mul(W, mmux_standard_flonumcd$1_log(Z)));
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_square (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_mul(Z,Z);
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_cube (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_mul(Z,mmux_standard_flonumcd$1_mul(Z,Z));
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_sqrt (mmux_standard_flonumcd$1_t Z)
/* square root: sqrt(Z) = Z^(1/2) = exp( log( Z^(1/2) )) = exp( 1/2 * log( Z )) */
{
  auto	T = Z;
  T = mmux_standard_flonumcd$1_log(T);
  T = mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_one_half(), T);
  T = mmux_standard_flonumcd$1_exp(T);
  return T;
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_cbrt (mmux_standard_flonumcd$1_t Z)
/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z )) */
{
  return mmux_standard_flonumcd$1_exp(mmux_standard_flonumcd$1_mul(mmux_standard_flonumcd$1_constant_one_third(),
								   mmux_standard_flonumcd$1_log(Z)));
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_POWERS_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_POWERS_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_POWERS_FUNCTIONS(128)

/* end of file */
