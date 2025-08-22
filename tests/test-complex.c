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
    fprintf(stderr, "%s: setting output format for flonumfl\n", __func__);
    assert(false == mmux_flonumfl_set_output_format("%.6f", __func__));
    fprintf(stderr, "%s: setting output format for flonumdb\n", __func__);
    assert(false == mmux_flonumdb_set_output_format("%.6f", __func__));
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
    fprintf(stderr, "%s: setting output format for flonumldb\n", __func__);
    assert(false == mmux_flonumldb_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
    fprintf(stderr, "%s: setting output format for flonumf32\n", __func__);
    assert(false == mmux_flonumf32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
    fprintf(stderr, "%s: setting output format for flonumf64\n", __func__);
    assert(false == mmux_flonumf64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
    fprintf(stderr, "%s: setting output format for flonumf128\n", __func__);
    assert(false == mmux_flonumf128_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
    fprintf(stderr, "%s: setting output format for flonumf32x\n", __func__);
    assert(false == mmux_flonumf32x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
    fprintf(stderr, "%s: setting output format for flonumf64x\n", __func__);
    assert(false == mmux_flonumf64x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
    fprintf(stderr, "%s: setting output format for flonumf128x\n", __func__);
    assert(false == mmux_flonumf128x_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
    fprintf(stderr, "%s: setting output format for flonumd32\n", __func__);
    assert(false == mmux_flonumd32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
    fprintf(stderr, "%s: setting output format for flonumd64\n", __func__);
    assert(false == mmux_flonumd64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
    fprintf(stderr, "%s: setting output format for flonumd128\n", __func__);
    assert(false == mmux_flonumd128_set_output_format("%.6f", __func__));
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
    auto Z = mmux_flonumcfl_make_rectangular(mmux_flonumfl(REP), mmux_flonumfl(IMP));
    assert(mmux_ctype_equal(mmux_flonumfl(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumfl(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto Z = mmux_flonumcdb_make_rectangular(mmux_flonumdb(REP), mmux_flonumdb(IMP));
    assert(mmux_ctype_equal(mmux_flonumdb(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumdb(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  if (1) {
    auto Z = mmux_flonumcldb_make_rectangular(mmux_flonumldb(REP), mmux_flonumldb(IMP));
    assert(mmux_ctype_equal(mmux_flonumldb(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumldb(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  if (1) {
    auto Z = mmux_flonumcf32_make_rectangular(mmux_flonumf32(REP), mmux_flonumf32(IMP));
    assert(mmux_ctype_equal(mmux_flonumf32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf32(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  if (1) {
    auto Z = mmux_flonumcf64_make_rectangular(mmux_flonumf64(REP), mmux_flonumf64(IMP));
    assert(mmux_ctype_equal(mmux_flonumf64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf64(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  if (1) {
    auto Z = mmux_flonumcf128_make_rectangular(mmux_flonumf128(REP), mmux_flonumf128(IMP));
    assert(mmux_ctype_equal(mmux_flonumf128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf128(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  if (1) {
    auto Z = mmux_flonumcf32x_make_rectangular(mmux_flonumf32x(REP), mmux_flonumf32x(IMP));
    assert(mmux_ctype_equal(mmux_flonumf32x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf32x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  if (1) {
    auto Z = mmux_flonumcf64x_make_rectangular(mmux_flonumf64x(REP), mmux_flonumf64x(IMP));
    assert(mmux_ctype_equal(mmux_flonumf64x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf64x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  if (1) {
    auto Z = mmux_flonumcf128x_make_rectangular(mmux_flonumf128x(REP), mmux_flonumf128x(IMP));
    assert(mmux_ctype_equal(mmux_flonumf128x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumf128x(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  if (1) {
    auto Z = mmux_flonumcd32_make_rectangular(mmux_flonumd32(REP), mmux_flonumd32(IMP));
    assert(mmux_ctype_equal(mmux_flonumd32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumd32(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  if (1) {
    auto Z = mmux_flonumcd64_make_rectangular(mmux_flonumd64(REP), mmux_flonumd64(IMP));
    assert(mmux_ctype_equal(mmux_flonumd64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumd64(IMP), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  if (1) {
    auto Z = mmux_flonumcd128_make_rectangular(mmux_flonumd128(REP), mmux_flonumd128(IMP));
    assert(mmux_ctype_equal(mmux_flonumd128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_flonumd128(IMP), mmux_ctype_imag_part(Z)));
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
    auto W = mmux_flonumcfl_make_rectangular(mmux_flonumfl(REP), mmux_flonumfl(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumfl(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumfl(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto W = mmux_flonumcdb_make_rectangular(mmux_flonumdb(REP), mmux_flonumdb(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumdb(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumdb(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  if (1) {
    auto W = mmux_flonumcldb_make_rectangular(mmux_flonumldb(REP), mmux_flonumldb(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumldb(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumldb(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  if (1) {
    auto W = mmux_flonumcf32_make_rectangular(mmux_flonumf32(REP), mmux_flonumf32(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf32(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  if (1) {
    auto W = mmux_flonumcf64_make_rectangular(mmux_flonumf64(REP), mmux_flonumf64(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf64(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  if (1) {
    auto W = mmux_flonumcf128_make_rectangular(mmux_flonumf128(REP), mmux_flonumf128(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf128(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  if (1) {
    auto W = mmux_flonumcf32x_make_rectangular(mmux_flonumf32x(REP), mmux_flonumf32x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf32x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf32x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  if (1) {
    auto W = mmux_flonumcf64x_make_rectangular(mmux_flonumf64x(REP), mmux_flonumf64x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf64x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf64x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  if (1) {
    auto W = mmux_flonumcf128x_make_rectangular(mmux_flonumf128x(REP), mmux_flonumf128x(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumf128x(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumf128x(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  if (1) {
    auto W = mmux_flonumcd32_make_rectangular(mmux_flonumd32(REP), mmux_flonumd32(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumd32(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumd32(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  if (1) {
    auto W = mmux_flonumcd64_make_rectangular(mmux_flonumd64(REP), mmux_flonumd64(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumd64(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumd64(IMP)), mmux_ctype_imag_part(Z)));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  if (1) {
    auto W = mmux_flonumcd128_make_rectangular(mmux_flonumd128(REP), mmux_flonumd128(IMP));
    auto Z = mmux_ctype_conj(W);
    assert(mmux_ctype_equal(mmux_flonumd128(REP), mmux_ctype_real_part(Z)));
    assert(mmux_ctype_equal(mmux_ctype_neg(mmux_flonumd128(IMP)), mmux_ctype_imag_part(Z)));
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
    auto Z   = mmux_flonumcfl_make_rectangular(mmux_flonumfl(REP), mmux_flonumfl(IMP));
    auto A   = mmux_ctype_arg(Z);
    auto rop = mmux_flonumfl_literal(ARG);
    auto eps = mmux_flonumfl(EPS);
    assert(true == mmux_flonumfl_equal_relepsilon(rop, A, eps));
    assert(true ==    mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }

  if (1) {
    auto Z = mmux_flonumcdb_make_rectangular(mmux_flonumdb(REP), mmux_flonumdb(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumdb_literal(ARG);
    auto eps = mmux_flonumdb(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  if (1) {
    auto Z = mmux_flonumcldb_make_rectangular(mmux_flonumldb(REP), mmux_flonumldb(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumldb_literal(ARG);
    auto eps = mmux_flonumldb(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  if (1) {
    auto Z = mmux_flonumcf32_make_rectangular(mmux_flonumf32(REP), mmux_flonumf32(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf32_literal(ARG);
    auto eps = mmux_flonumf32(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  if (1) {
    auto Z = mmux_flonumcf64_make_rectangular(mmux_flonumf64(REP), mmux_flonumf64(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf64_literal(ARG);
    auto eps = mmux_flonumf64_literal(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  if (1) {
    auto Z = mmux_flonumcf128_make_rectangular(mmux_flonumf128(REP), mmux_flonumf128(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf128_literal(ARG);
    auto eps = mmux_flonumf128(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  if (1) {
    auto Z = mmux_flonumcf32x_make_rectangular(mmux_flonumf32x(REP), mmux_flonumf32x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf32x_literal(ARG);
    auto eps = mmux_flonumf32x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  if (1) {
    auto Z = mmux_flonumcf64x_make_rectangular(mmux_flonumf64x(REP), mmux_flonumf64x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf64x_literal(ARG);
    auto eps = mmux_flonumf64x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  if (1) {
    auto Z = mmux_flonumcf128x_make_rectangular(mmux_flonumf128x(REP), mmux_flonumf128x(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumf128x_literal(ARG);
    auto eps = mmux_flonumf128x(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  if (1) {
    auto Z = mmux_flonumcd32_make_rectangular(mmux_flonumd32(REP), mmux_flonumd32(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumd32_literal(ARG);
    auto eps = mmux_flonumd32(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  if (1) {
    auto Z = mmux_flonumcd64_make_rectangular(mmux_flonumd64(REP), mmux_flonumd64(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumd64_literal(ARG);
    auto eps = mmux_flonumd64(EPS);
    assert(true == mmux_ctype_equal_relepsilon(rop, A, eps));
    fprintf(stderr, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));
    mmux_ctype_fprintf(stderr, Z);
    fprintf(stderr, ", arg(%s)=", mmux_ctype_dispatch_stem(A));
    mmux_ctype_fprintf(stderr, A);
    fprintf(stderr, "\n");
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  if (1) {
    auto Z = mmux_flonumcd128_make_rectangular(mmux_flonumd128(REP), mmux_flonumd128(IMP));
    auto A = mmux_ctype_arg(Z);
    auto rop = mmux_flonumd128_literal(ARG);
    auto eps = mmux_flonumd128(EPS);
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
