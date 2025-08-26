/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep 28, 2024

  Abstract

	This module implements some support for _DecimalN types through libdfp.

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

/* NOTE We  do not include  "mmux-cc-types-internals.h" because "libdfp"  messes with
   the  standard headers.   So  we  duplicate, in  this  file,  definitions from  the
   internals file; it is ugly, but better for me.  (Marco Maggi; Aug 16, 2025) */
#include <mmux-cc-types-config.h>

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_STDBOOL_H
#  include <stdbool.h>
#endif

/* When using libdfp: this will load <dfp/stdlib.h> */
#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif

#ifdef HAVE_STDIO_H
#  include <stdio.h>
#endif

#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif

/* When using libdfp: this will load <dfp/math.h> */
#ifdef HAVE_MATH_H
#  include <math.h>
#endif

/* When using libdfp: this will load <dfp/float.h> */
#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif

#include <mmux-cc-types-libdfp.h>


/** --------------------------------------------------------------------
 ** Macros.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_SOME_MACROS]]],[[[
#define MMUX_STANDARD_FLONUMD$1_IS_ZERO(X)	(FP_ZERO	== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_NAN(X)	(FP_NAN		== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X)	(FP_INFINITE	== (fpclassify(X)))
#define CMPLXCD$1(RE,IM)	(mmux_standard_flonumcd$1_make_rectangular((RE),(IM)))
]]])
m4_divert(0)m4_dnl
DEFINE_SOME_MACROS(32)
DEFINE_SOME_MACROS(64)
DEFINE_SOME_MACROS(128)


/** --------------------------------------------------------------------
 ** Standard types adapters: real numbers mathematical functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_DECIMAL_NUMBER_MATHEMATICS_FUNCTIONS]]],[[[
mmux_standard_flonumd$1_t
exp10d$1 (mmux_standard_flonumd$1_t op)
{
  return expd$1(op * logd$1(mmux_standard_flonumd$1_constant_ten()));
}

/* The Bessel stuff below is not really implemented by "libdfp", or is it? */
mmux_standard_flonumd$1_t
mmux_standard_j0d$1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_j1d$1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_jnd$1 (mmux_standard_sint_t     N  __attribute__((__unused__)),
		    mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_y0d$1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_y1d$1 (mmux_standard_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_standard_flonumd$1_constant_nan();
}
mmux_standard_flonumd$1_t
mmux_standard_ynd$1 (mmux_standard_sint_t     N  __attribute__((__unused__)),
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
$2cd$1 (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_constant_nan();
}]]])

m4_define([[[DEFINE_BINARY_MATH_CPLX_FUNCTION]]],[[[m4_dnl
mmux_standard_flonumcd$1_t
$2cd$1 (mmux_standard_flonumcd$1_t Z1 __attribute__((__unused__)),
	mmux_standard_flonumcd$1_t Z2 __attribute__((__unused__)))
{
  return mmux_standard_flonumcd$1_constant_nan();
}]]])

m4_define([[[DEFINE_MATH_CPLX_FUNCTIOS]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mulcd$1 (mmux_standard_flonumcd$1_t A, mmux_standard_flonumcd$1_t B)
{
  auto	Cre = A.re * B.re - A.im * B.im;
  auto	Cim = A.re * B.im + B.re * A.im;
  return CMPLXCD$1(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_div (mmux_standard_flonumcd$1_t A, mmux_standard_flonumcd$1_t B)
{
  auto	D   = B.re * B.re + B.im * B.im;
  auto	Cre = (A.re * B.re + A.im * B.im) / D;
  auto	Cim = (A.im * B.re - A.re * B.im) / D;
  return CMPLXCD$1(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
abscd$1 (mmux_standard_flonumcd$1_t Z)
{
  return sqrtd$1(Z.re * Z.re + Z.im * Z.im);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
argcd$1 (mmux_standard_flonumcd$1_t Z)
{
  return atan2d$1(Z.im, Z.re);
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
sincd$1 (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return CMPLXCD$1(sind$1(Z.re) * coshd$1(Z.im),
		   cosd$1(Z.re) * sinhd$1(Z.im));
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
coscd$1 (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return CMPLXCD$1(   cosd$1(Z.re) * coshd$1(Z.im),
		      - (sind$1(Z.re) * sinhd$1(Z.im)));
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
tancd$1 (mmux_standard_flonumcd$1_t Z)
{
  auto	R2	= mmux_standard_flonumd$1_constant_two() * Z.re;
  auto	I2	= mmux_standard_flonumd$1_constant_two() * Z.im;

  if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.re) && MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.im)) {
    /* Avoid generating a NaN in this case  by using the alternative formula for the
       imaginary part. */
    auto	A	= cosd$1(R2);
    auto	B	= coshd$1(I2);
    auto	rop_re	= sind$1(R2) / (A + B);
    auto	rop_im	= tanhd$1(I2) / (mmux_standard_flonumd$1_constant_one() + A / B);
    return CMPLXCD$1(rop_re, rop_im);
  } else {
    /* This is faster. */
    auto	den	= cosd$1(R2) + coshd$1(I2);
    auto	rop_re	=  sind$1(R2) / den;
    auto	rop_im	= sinhd$1(I2) / den;
    return CMPLXCD$1(rop_re, rop_im);
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

__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
expcd$1 (mmux_standard_flonumcd$1_t Z)
{
  /* exp(Z) = exp(Rep{Z}) * (cos(Imp{Z}) + i * sin(Imp{Z})
   *        = exp(Rep{Z}) * cos(Imp{Z}) + i * exp(Rep{Z}) * sin(Imp{Z})
   */
  auto	exp_rep_Z	= expd$1(Z.re);
  auto	cos_imp_Z	= cosd$1(Z.im);
  auto	sin_imp_Z	= sind$1(Z.im);
  auto	rep_rop		= exp_rep_Z * cos_imp_Z;
  auto	imp_rop		= exp_rep_Z * sin_imp_Z;
  return CMPLXCD$1(rep_rop, imp_rop);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
exp2cd$1 (mmux_standard_flonumcd$1_t Z)
{
  /* 2^Z = exp( log ( 2^Z ) ) = exp( Z * log( 2 ) ) */
  auto	natural_logarithm_of_two = CMPLXCD$1(mmux_standard_flonumd$1_constant_LN2(),
					     mmux_standard_flonumd$1_constant_zero());
  return expcd$1( mulcd$1(Z, natural_logarithm_of_two) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
exp10cd$1 (mmux_standard_flonumcd$1_t Z)
{
  /* 10^Z = exp( log ( 2^Z ) ) = exp( Z * log( 19 ) ) */
  auto	natural_logarithm_of_ten = CMPLXCD$1(mmux_standard_flonumd$1_constant_LN10(),
					     mmux_standard_flonumd$1_constant_zero());
  return expcd$1( mulcd$1(Z, natural_logarithm_of_ten) );
}

/* ------------------------------------------------------------------ */

__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
logcd$1 (mmux_standard_flonumcd$1_t Z)
{
  auto	radius		= abscd$1(Z);
  auto	ln_of_radius	= logd$1(radius);
  auto	argument	= argcd$1(Z);
  return CMPLXCD$1(ln_of_radius, argument);
}
/* log_2 Z = log Z / log 2 */
mmux_standard_flonumcd$1_t
log2cd$1 (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_div(logcd$1(Z), mmux_standard_flonumcd$1_constant_two());
}
/* log_10 Z = log Z / log 10 */
mmux_standard_flonumcd$1_t
log10cd$1 (mmux_standard_flonumcd$1_t Z)
{
  return mmux_standard_flonumcd$1_div(logcd$1(Z), mmux_standard_flonumcd$1_constant_ten());
}

/* ------------------------------------------------------------------ */

DEFINE_BINARY_MATH_CPLX_FUNCTION($1,		pow)
DEFINE_UNARY_MATH_CPLX_FUNCTION($1,		sqrt)
/* cubic root: cbrt(Z) = Z^(1/3) = exp( log( Z^(1/3) )) = exp( 1/3 * log( Z )) */
static mmux_standard_flonumcd$1_t
cbrtcd$1 (mmux_standard_flonumcd$1_t Z)
{
  auto one_third =									\
    CMPLXCD$1(mmux_standard_flonumd$1_constant_one() /
	      mmux_standard_flonumd$1_literal(3.0),
	      mmux_standard_flonumd$1_constant_zero());
  return expcd$1(mulcd$1(one_third, logcd$1(Z)));
}

]]])
m4_divert(0)m4_dnl
DEFINE_MATH_CPLX_FUNCTIOS(32)
DEFINE_MATH_CPLX_FUNCTIOS(64)
DEFINE_MATH_CPLX_FUNCTIOS(128)


/** --------------------------------------------------------------------
 ** Standard types adapters: sprinter and parser.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS]]],[[[
mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return strfrom$1(result_p, size, format, value);
}
mmux_standard_flonum$1_t
mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value, mmux_asciizpp_t restrict tailptr)
{
  return strto$1(s_input_value, tailptr);
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d32)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d64)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(d128)


/** --------------------------------------------------------------------
 ** Some real and complex number type functions: abs, arg.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_CPLX_BASIC_FUNCTIONS]]],[[[
__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_abs (mmux_flonumd$1_t X)
{
  return mmux_flonumd$1(fabsd$1(X.value));
}
mmux_flonumcd$1_part_t
mmux_flonumcd$1_abs (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(abscd$1(Z.value));
}
mmux_flonumcd$1_part_t
mmux_flonumcd$1_arg (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(argcd$1(Z.value));
}
/* mmux_flonumcd$1_conj implemented as inline function */
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(32)
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(64)
DEFINE_REAL_CPLX_BASIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Real decimal floating-point number predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_PREDICATES]]],[[[
__attribute__((__const__)) bool
mmux_flonumd$1_is_zero (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_nan (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_infinite (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_PREDICATES(32)
DEFINE_REAL_PREDICATES(64)
DEFINE_REAL_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Complex decimal floating-point numbers predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_PREDICATES]]],[[[
__attribute__((__const__)) bool
mmux_flonumcd$1_is_zero (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.re) && MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_nan (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_infinite (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.im))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_PREDICATES(32)
DEFINE_CPLX_PREDICATES(64)
DEFINE_CPLX_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISONS]]],[[[
__attribute__((__const__)) mmux_sint_t
mmux_flonumd$1_cmp (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  if (mmux_flonumd$1_greater(op1, op2)) {
    return mmux_sint(+1);
  } else if (mmux_flonumd$1_less(op1, op2)) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (op1.value == op2.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreater(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isless(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_greater_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (isgreaterequal(op1.value,op2.value))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_less_equal (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return (islessequal(op1.value,op2.value))? true : false;
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_max (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmaxd$1(X.value, Y.value));
}
__attribute__((__const__)) mmux_flonumd$1_t
mmux_flonumd$1_min (mmux_flonumd$1_t X, mmux_flonumd$1_t Y)
{
  return mmux_flonumd$1(fmind$1(X.value, Y.value));
}

/* ------------------------------------------------------------------ */

__attribute__((__const__)) bool
mmux_flonumcd$1_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return ((op1.value.re == op2.value.re) && (op1.value.im == op2.value.im))? true : false;
}
__attribute__((__const__)) mmux_sint_t
mmux_flonumcd$1_cmp (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_cmp(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_greater_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_greater_equal(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
__attribute__((__const__)) bool
mmux_flonumcd$1_less_equal (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumd$1_less_equal(mmux_flonumcd$1_abs(op1), mmux_flonumcd$1_abs(op2));
}
]]])
m4_divert(0)m4_dnl
DEFINE_COMPARISONS(32)
DEFINE_COMPARISONS(64)
DEFINE_COMPARISONS(128)


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_APPROX_COMPARISONS]]],[[[
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_absmargin (mmux_standard_flonumd$1_t op1,
					 mmux_standard_flonumd$1_t op2,
					 mmux_standard_flonumd$1_t margin)
{
  return (fabsd$1(op1 - op2) <= fabsd$1(margin))? true : false;
}
__attribute__((__const__)) bool
mmux_standard_flonumd$1_equal_relepsilon (mmux_standard_flonumd$1_t op1,
					  mmux_standard_flonumd$1_t op2,
					  mmux_standard_flonumd$1_t epsilon)
{
  return (fabsd$1(op1 - op2) <= (fabsd$1(epsilon) * fmaxd$1(fabsd$1(op1), fabsd$1(op2))))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_APPROX_COMPARISONS(32)
DEFINE_STANDARD_APPROX_COMPARISONS(64)
DEFINE_STANDARD_APPROX_COMPARISONS(128)


/** --------------------------------------------------------------------
 ** Some arithmetics functions not implemented by libdfp.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS]]],[[[
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_mod (mmux_flonum$1_t A, mmux_flonum$1_t B)
{
  return mmux_flonum$1(fmod$1(A.value, B.value));
}
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_incr (mmux_flonum$1_t A)
{
  return mmux_flonum$1(A.value + mmux_standard_flonum$1_constant_one());
}
__attribute__((__const__)) mmux_flonum$1_t
mmux_flonum$1_decr (mmux_flonum$1_t A)
{
  return mmux_flonum$1(A.value - mmux_standard_flonum$1_constant_one());
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d32]]])
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d64]]])
DEFINE_REAL_DECIMAL_NUMBER_ARITHMETICS_FUNCTIONS([[[d128]]])


/** --------------------------------------------------------------------
 ** Mathematical constants: real numbers.
 ** ----------------------------------------------------------------- */

/* NOTE By inspecting the header files installed by libdfp: I have seen that only the
   "dl" constants are defined.  (Marco Maggi; Aug 16, 2025) */
m4_divert(-1)
m4_define([[[DEFINE_REAL_MATH_CONSTANT_FUNCTIONS]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_$2 (void)
{
  return (mmux_standard_flonumd$1_t)M_$2dl;
}
mmux_flonumd$1_t
mmux_flonumd$1_constant_$2 (void)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_constant_$2());
}]]])

m4_define([[[DEFINE_REAL_MATH_CONSTANTS]]],[[[
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LOG2E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LOG10E)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LN2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		LN10)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI_2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		PI_4)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		1_PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		2_PI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		2_SQRTPI)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		SQRT2)
DEFINE_REAL_MATH_CONSTANT_FUNCTIONS($1,		SQRT1_2)

/* Should we do something with "DECd$1_MIN" defined by GCC? */
mmux_standard_flonumd$1_t mmux_standard_flonumd$1_maximum (void) { return    DEC$1_MAX; }
mmux_standard_flonumd$1_t mmux_standard_flonumd$1_minimum (void) { return (- DEC$1_MAX); }
mmux_flonumd$1_t mmux_flonumd$1_maximum (void) { return mmux_flonumd$1(mmux_standard_flonumd$1_maximum()); }
mmux_flonumd$1_t mmux_flonumd$1_minimum (void) { return mmux_flonumd$1(mmux_standard_flonumd$1_minimum()); }

mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_nan (void)
{
  return nand$1("nan(0)");
}
mmux_flonumd$1_t
mmux_flonumd$1_constant_nan (void)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_constant_nan());
}
mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_constant_nan (void)
{
  return CMPLXCD$1(mmux_standard_flonumd$1_constant_nan(),
		   mmux_standard_flonumd$1_constant_nan());
}
mmux_flonumcd$1_t
mmux_flonumcd$1_constant_nan (void)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_constant_nan());
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_MATH_CONSTANTS(32)
DEFINE_REAL_MATH_CONSTANTS(64)
DEFINE_REAL_MATH_CONSTANTS(128)


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
DEFINE_UNARY_MATH_FUNCTION($1,		sqrt);
DEFINE_UNARY_MATH_FUNCTION($1,		cbrt);
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_MATH_FUNCTIONS(32)
DEFINE_FLONUMCD_MATH_FUNCTIONS(64)
DEFINE_FLONUMCD_MATH_FUNCTIONS(128)

/* end of file */
