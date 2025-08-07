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

#undef  _GNU_SOURCE
#define _GNU_SOURCE	1

#include <mmux-cc-types.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>


/** --------------------------------------------------------------------
 ** Trigonometric sine.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_sin (void)
{
  dprintf(1, "running test: %s\n", __func__);

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
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(-9.654125477,2.841692296);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_sin(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Trigonometric cosine.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_cos (void)
{
  dprintf(1, "running test: %s\n", __func__);

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
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(2.855815004,9.606383448);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_cos(op1), mrg));
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

  exit(EXIT_SUCCESS);
}

/* end of file */
