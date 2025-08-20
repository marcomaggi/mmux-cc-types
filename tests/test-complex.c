/*
  Part of: MMUX CC Tests
  Contents: test for version functions
  Date: Aug 11, 2025

  Abstract

	Test file for version functions.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>


/** --------------------------------------------------------------------
 ** Init.
 ** ----------------------------------------------------------------- */

static void
init (void)
{
  if (1) {
    fprintf(stderr, "%s: setting output format for float\n", __func__);
    assert(false == mmux_float_set_output_format("%.6f", __func__));
    fprintf(stderr, "%s: setting output format for double\n", __func__);
    assert(false == mmux_double_set_output_format("%.6f", __func__));
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
    fprintf(stderr, "%s: setting output format for ldouble\n", __func__);
    assert(false == mmux_ldouble_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
    fprintf(stderr, "%s: setting output format for float32\n", __func__);
    assert(false == mmux_float32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
    fprintf(stderr, "%s: setting output format for float64\n", __func__);
    assert(false == mmux_float64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
    fprintf(stderr, "%s: setting output format for float128\n", __func__);
    assert(false == mmux_float128_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
    fprintf(stderr, "%s: setting output format for float32x\n", __func__);
    assert(false == mmux_float32x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
    fprintf(stderr, "%s: setting output format for float64x\n", __func__);
    assert(false == mmux_float64x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
    fprintf(stderr, "%s: setting output format for float128x\n", __func__);
    assert(false == mmux_float128x_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
    fprintf(stderr, "%s: setting output format for decimal32\n", __func__);
    assert(false == mmux_decimal32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
    fprintf(stderr, "%s: setting output format for decimal64\n", __func__);
    assert(false == mmux_decimal64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
    fprintf(stderr, "%s: setting output format for decimal128\n", __func__);
    assert(false == mmux_decimal128_set_output_format("%.6f", __func__));
#endif
  }

}


/** --------------------------------------------------------------------
 ** Make rectangular.
 ** ----------------------------------------------------------------- */

static void
test_complex_make_rectangular (void)
{
  printf("running test: %s\n", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

  if (1) {
    auto Z = mmux_complexf_make_rectangular(mmux_float(REP), mmux_float(IMP));
    assert(mmux_ctype_equal(mmux_float(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto Z = mmux_complexd_make_rectangular(mmux_double(REP), mmux_double(IMP));
    assert(mmux_ctype_equal(mmux_double(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_double(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    auto Z = mmux_complexld_make_rectangular(mmux_ldouble(REP), mmux_ldouble(IMP));
    assert(mmux_ctype_equal(mmux_ldouble(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ldouble(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    auto Z = mmux_complexf32_make_rectangular(mmux_float32(REP), mmux_float32(IMP));
    assert(mmux_ctype_equal(mmux_float32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float32(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    auto Z = mmux_complexf64_make_rectangular(mmux_float64(REP), mmux_float64(IMP));
    assert(mmux_ctype_equal(mmux_float64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float64(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    auto Z = mmux_complexf128_make_rectangular(mmux_float128(REP), mmux_float128(IMP));
    assert(mmux_ctype_equal(mmux_float128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float128(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  if (1) {
    auto Z = mmux_complexf32x_make_rectangular(mmux_float32x(REP), mmux_float32x(IMP));
    assert(mmux_ctype_equal(mmux_float32x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float32x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  if (1) {
    auto Z = mmux_complexf64x_make_rectangular(mmux_float64x(REP), mmux_float64x(IMP));
    assert(mmux_ctype_equal(mmux_float64x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float64x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  if (1) {
    auto Z = mmux_complexf128x_make_rectangular(mmux_float128x(REP), mmux_float128x(IMP));
    assert(mmux_ctype_equal(mmux_float128x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_float128x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    auto Z = mmux_complexd32_make_rectangular(mmux_decimal32(REP), mmux_decimal32(IMP));
    assert(mmux_ctype_equal(mmux_decimal32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_decimal32(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    auto Z = mmux_complexd64_make_rectangular(mmux_decimal64(REP), mmux_decimal64(IMP));
    assert(mmux_ctype_equal(mmux_decimal64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_decimal64(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    auto Z = mmux_complexd128_make_rectangular(mmux_decimal128(REP), mmux_decimal128(IMP));
    assert(mmux_ctype_equal(mmux_decimal128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_decimal128(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

}


/** --------------------------------------------------------------------
 ** Complex conjugate.
 ** ----------------------------------------------------------------- */

static void
test_complex_conjugate (void)
{
  printf("running test: %s\n", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

  if (1) {
    auto W = mmux_complexf_make_rectangular(mmux_float(REP), mmux_float(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto W = mmux_complexd_make_rectangular(mmux_double(REP), mmux_double(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_double(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_double(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    auto W = mmux_complexld_make_rectangular(mmux_ldouble(REP), mmux_ldouble(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_ldouble(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_ldouble(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    auto W = mmux_complexf32_make_rectangular(mmux_float32(REP), mmux_float32(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float32(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    auto W = mmux_complexf64_make_rectangular(mmux_float64(REP), mmux_float64(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float64(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    auto W = mmux_complexf128_make_rectangular(mmux_float128(REP), mmux_float128(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float128(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  if (1) {
    auto W = mmux_complexf32x_make_rectangular(mmux_float32x(REP), mmux_float32x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float32x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float32x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  if (1) {
    auto W = mmux_complexf64x_make_rectangular(mmux_float64x(REP), mmux_float64x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float64x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float64x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  if (1) {
    auto W = mmux_complexf128x_make_rectangular(mmux_float128x(REP), mmux_float128x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_float128x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_float128x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    auto W = mmux_complexd32_make_rectangular(mmux_decimal32(REP), mmux_decimal32(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_decimal32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_decimal32(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    auto W = mmux_complexd64_make_rectangular(mmux_decimal64(REP), mmux_decimal64(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_decimal64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_decimal64(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    auto W = mmux_complexd128_make_rectangular(mmux_decimal128(REP), mmux_decimal128(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_decimal128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_decimal128(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

}


/** --------------------------------------------------------------------
 ** Complex argument.
 ** ----------------------------------------------------------------- */

static void
test_complex_arg (void)
{
  printf("running test: %s\n", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456
#undef  ARG
#define ARG	1.307'329'79
#undef  EPS
#define EPS	1e-6

  if (1) {
    auto Z   = mmux_complexf_make_rectangular(mmux_float(REP), mmux_float(IMP));
    auto A   = mmux_ctype_arg(Z);
    auto rop = mmux_float_literal(ARG);
    auto eps = mmux_float(EPS);
    assert(true == mmux_float_equal_relepsilon(rop, A, eps));
    assert(true ==    mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto Z = mmux_complexd_make_rectangular(mmux_double(REP), mmux_double(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_double_literal(ARG);
    auto eps = mmux_double(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    auto Z = mmux_complexld_make_rectangular(mmux_ldouble(REP), mmux_ldouble(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_ldouble_literal(ARG);
    auto eps = mmux_ldouble(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    auto Z = mmux_complexf32_make_rectangular(mmux_float32(REP), mmux_float32(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float32_literal(ARG);
    auto eps = mmux_float32(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    auto Z = mmux_complexf64_make_rectangular(mmux_float64(REP), mmux_float64(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float64_literal(ARG);
    auto eps = mmux_float64_literal(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    auto Z = mmux_complexf128_make_rectangular(mmux_float128(REP), mmux_float128(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float128_literal(ARG);
    auto eps = mmux_float128(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  if (1) {
    auto Z = mmux_complexf32x_make_rectangular(mmux_float32x(REP), mmux_float32x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float32x_literal(ARG);
    auto eps = mmux_float32x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  if (1) {
    auto Z = mmux_complexf64x_make_rectangular(mmux_float64x(REP), mmux_float64x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float64x_literal(ARG);
    auto eps = mmux_float64x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  if (1) {
    auto Z = mmux_complexf128x_make_rectangular(mmux_float128x(REP), mmux_float128x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_float128x_literal(ARG);
    auto eps = mmux_float128x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    auto Z = mmux_complexd32_make_rectangular(mmux_decimal32(REP), mmux_decimal32(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_decimal32_literal(ARG);
    auto eps = mmux_decimal32(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    auto Z = mmux_complexd64_make_rectangular(mmux_decimal64(REP), mmux_decimal64(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_decimal64_literal(ARG);
    auto eps = mmux_decimal64(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    auto Z = mmux_complexd128_make_rectangular(mmux_decimal128(REP), mmux_decimal128(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_decimal128_literal(ARG);
    auto eps = mmux_decimal128(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  init();

  if (1) {	test_complex_make_rectangular();	}
  if (1) {	test_complex_conjugate();		}
  if (1) {	test_complex_arg();			}

  exit(EXIT_SUCCESS);
}

/* end of file */
