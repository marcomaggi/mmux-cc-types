/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug 11, 2025

  Abstract

	Test file for functions.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Rectangular.
 ** ----------------------------------------------------------------- */

static void
test_complex_rectangular (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

#undef  DOIT
#define DOIT(FL)										\
  if (1) {											\
    if (1) {											\
      /* Use the type specific constructor. */							\
      auto Z = mmux_flonumc##FL##_rectangular(mmux_flonum##FL(REP), mmux_flonum##FL(IMP));	\
      assert(mmux_flonum##FL##_equal(mmux_flonum##FL(REP), mmux_flonumc##FL##_real_part(Z)));	\
      assert(mmux_flonum##FL##_equal(mmux_flonum##FL(IMP), mmux_flonumc##FL##_imag_part(Z)));	\
      assert(mmux_ctype_equal(mmux_flonum##FL(REP), mmux_ctype_real_part(Z)));			\
      assert(mmux_ctype_equal(mmux_flonum##FL(IMP), mmux_ctype_imag_part(Z)));			\
      if (0) {											\
	dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));			\
	mmux_ctype_dprintf(2, Z);								\
	dprintf(2, "\n");									\
      }												\
    }												\
    if (1) {											\
      /* Use the generic constructor. */							\
      auto Z = mmux_ctype_rectangular(mmux_flonum##FL(REP), mmux_flonum##FL(IMP));		\
      assert(mmux_flonum##FL##_equal(mmux_flonum##FL(REP), mmux_flonumc##FL##_real_part(Z)));	\
      assert(mmux_flonum##FL##_equal(mmux_flonum##FL(IMP), mmux_flonumc##FL##_imag_part(Z)));	\
      assert(mmux_ctype_equal(mmux_flonum##FL(REP), mmux_ctype_real_part(Z)));			\
      assert(mmux_ctype_equal(mmux_flonum##FL(IMP), mmux_ctype_imag_part(Z)));			\
      if (0) {											\
	dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));			\
	mmux_ctype_dprintf(2, Z);								\
	dprintf(2, "\n");									\
      }												\
    }												\
    dprintf(2," %s,", "flonumc" #FL);								\
  }

  DOIT(fl);
  DOIT(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(d128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Complex conjugate.
 ** ----------------------------------------------------------------- */

static void
test_complex_conjugate (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

#undef  DOIT
#define DOIT(FL)										\
  if (1) {											\
    auto W = mmux_flonumc##FL##_rectangular(mmux_flonum##FL(REP), mmux_flonum##FL(IMP));	\
    auto Z = mmux_flonumc##FL##_conjugate(W);							\
    assert(mmux_flonum##FL##_equal(mmux_flonum##FL(REP),   mmux_flonumc##FL##_real_part(Z)));	\
    assert(mmux_flonum##FL##_equal(mmux_flonum##FL(- IMP), mmux_flonumc##FL##_imag_part(Z)));	\
    assert(mmux_ctype_equal(mmux_flonum##FL(REP),   mmux_ctype_real_part(Z)));			\
    assert(mmux_ctype_equal(mmux_flonum##FL(- IMP), mmux_ctype_imag_part(Z)));			\
    if (0) {											\
      dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));				\
      mmux_ctype_dprintf(2, Z);									\
      dprintf(2, "\n");										\
    }												\
    dprintf(2," %s,", "flonumc" #FL);								\
  }

  DOIT(fl);
  DOIT(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(d128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Complex argument.
 ** ----------------------------------------------------------------- */

static void
test_complex_argument (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456
#undef  ARG
#define ARG	1.307'329'79
#undef  EPS
#define EPS	1e-6

#undef  DOIT
#define DOIT(FL)										\
  if (1) {											\
    auto Z = mmux_flonumc##FL##_rectangular(mmux_flonum##FL(REP), mmux_flonum##FL(IMP));	\
    auto A = mmux_flonumc##FL##_argument(Z);							\
    assert(mmux_flonum##FL##_equal_relepsilon(mmux_flonum##FL(ARG), A, mmux_flonum##FL(EPS)));	\
    assert(mmux_ctype_equal_relepsilon(mmux_flonum##FL(ARG), A, mmux_flonum##FL(EPS)));		\
    if (0) {											\
      dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));				\
      mmux_ctype_dprintf(2, Z);									\
      dprintf(2, " argument=");									\
      mmux_ctype_dprintf(2, A);									\
      dprintf(2, "\n");										\
    }												\
    dprintf(2," %s,", "flonumc" #FL);								\
  }

  DOIT(fl);
  DOIT(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(d128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_complex_rectangular();	}
  if (1) {	test_complex_conjugate();	}
  if (1) {	test_complex_argument();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
