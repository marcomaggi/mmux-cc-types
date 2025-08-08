/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  7, 2025

  Abstract

	Test file for functions.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>


static void
test_mathematics_sin (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = 0.12269009, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(-9.654125477,2.841692296);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif
}


static void
test_mathematics_cos (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = 0.9924450321, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(2.855815004,9.606383448);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif
}


static void
test_mathematics_tan (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = 0.123'624'066, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(-0.002'708'235'84,1.004'164'71);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_tan(op1), mrg));
  }
#endif
}


static void
test_mathematics_asin (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = 0.123'312'275, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(1.023'821'75,2.452'913'74);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_asin(op1), mrg));
  }
#endif
}


static void
test_mathematics_acos (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = 1.447'484'05, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(0.546'974'58,-2.452'913'74);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_acos(op1), mrg));
  }
#endif
}


static void
test_mathematics_atan (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.122'385'281
#undef  ROPZ
#define ROPZ		1.423'679'04,0.086'569'059'2

  {
    mmux_float_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = ROPX, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(ROPZ);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(ROPZ);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan(op1), mrg));
  }
#endif
}


static void
test_mathematics_atan2 (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.263'466'541

  {
    mmux_float_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_atan2(op1,op2), mrg));
  }
#endif
}


static void
test_mathematics_sinh (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.123'310'379
#undef  ROPZ
#define ROPZ		-73.460'621'7,10.472'508'5

  {
    mmux_float_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
  {
    mmux_double_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  {
    mmux_decimal32_t	op1 = 0.123, rop = ROPX, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  {
    mmux_decimal64_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  {
    mmux_decimal128_t	op1 = 0.123, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

  {
    auto	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf_make_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }

  {
    auto	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd_make_rectangular(ROPZ);
    auto	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(ROPZ);
    auto	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf32_make_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(ROPZ);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sinh(op1), mrg));
  }
#endif
}


static void
test_mathematics_cosh (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_tanh (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_asinh (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_acosh (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_atanh (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_exp (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_exp2 (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_exp10 (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_log (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_log2 (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_log10 (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_logb (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_pow (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_sqrt (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_cbrt (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_expm1 (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_log1p (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_hypot (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_erf (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_erfc (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_lgamma (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


static void
test_mathematics_tgamma (void)
{
  printf("running test TO BE IMPLEMENTED: %s\n", __func__);
}


/** --------------------------------------------------------------------
 ** Bessel function j0.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_j0 (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }

  {
    mmux_double_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j0(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function j1.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_j1 (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }

  {
    mmux_double_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_j1(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function jn.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_jn (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_sint_t		op1 = 2;
    mmux_float_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }

  {
    mmux_sint_t		op1 = 2;
    mmux_double_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_sint_t		op1 = 2;
    mmux_ldouble_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_sint_t		op1 = 2;
    mmux_float32_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_sint_t		op1 = 2;
    mmux_float64_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_sint_t		op1 = 2;
    mmux_float128_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_sint_t		op1 = 2;
    mmux_float32x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_sint_t		op1 = 2;
    mmux_float64x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_sint_t		op1 = 2;
    mmux_float128x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function y0.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_y0 (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }

  {
    mmux_double_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y0(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function y1.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_y1 (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_float_t	op1 = 0.123, rop = -5.281'675'451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }

  {
    mmux_double_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_ldouble_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_float32_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_float64_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_float128_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_float32x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_float64x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_float128x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_y1(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function yn.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_yn (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_sint_t		op1 = 2;
    mmux_float_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }

  {
    mmux_sint_t		op1 = 2;
    mmux_double_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  {
    mmux_sint_t		op1 = 2;
    mmux_ldouble_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  {
    mmux_sint_t		op1 = 2;
    mmux_float32_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  {
    mmux_sint_t		op1 = 2;
    mmux_float64_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  {
    mmux_sint_t		op1 = 2;
    mmux_float128_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  {
    mmux_sint_t		op1 = 2;
    mmux_float32x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  {
    mmux_sint_t		op1 = 2;
    mmux_float64x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  {
    mmux_sint_t		op1 = 2;
    mmux_float128x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  if (1) {	test_mathematics_sin();		}
  if (1) {	test_mathematics_cos();		}
  if (1) {	test_mathematics_tan();		}
  if (1) {	test_mathematics_asin();	}
  if (1) {	test_mathematics_acos();	}
  if (1) {	test_mathematics_atan();	}
  if (1) {	test_mathematics_atan2();	}

  if (1) {	test_mathematics_sinh();	}
  if (1) {	test_mathematics_cosh();	}
  if (1) {	test_mathematics_tanh();	}
  if (1) {	test_mathematics_asinh();	}
  if (1) {	test_mathematics_acosh();	}
  if (1) {	test_mathematics_atanh();	}

  if (1) {	test_mathematics_exp();		}
  if (1) {	test_mathematics_exp2();	}
  if (1) {	test_mathematics_exp10();	}
  if (1) {	test_mathematics_log();		}
  if (1) {	test_mathematics_log2();	}
  if (1) {	test_mathematics_log10();	}
  if (1) {	test_mathematics_logb();	}

  if (1) {	test_mathematics_pow();		}
  if (1) {	test_mathematics_sqrt();	}
  if (1) {	test_mathematics_cbrt();	}
  if (1) {	test_mathematics_expm1();	}
  if (1) {	test_mathematics_log1p();	}
  if (1) {	test_mathematics_hypot();	}

  if (1) {	test_mathematics_erf();		}
  if (1) {	test_mathematics_erfc();	}
  if (1) {	test_mathematics_lgamma();	}
  if (1) {	test_mathematics_tgamma();	}
  if (1) {	test_mathematics_j0();		}
  if (1) {	test_mathematics_j1();		}
  if (1) {	test_mathematics_jn();		}
  if (1) {	test_mathematics_y0();		}
  if (1) {	test_mathematics_y1();		}
  if (1) {	test_mathematics_yn();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
