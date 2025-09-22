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


static void
test_complex_real_imag_parts (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)						\
  if (1) {									\
    auto op = mmux_##STEM##_literal(123);					\
    assert(mmux_ctype_equal(op, mmux_##STEM##_real_part(op)));			\
    assert(mmux_ctype_is_zero(mmux_##STEM##_imag_part(op)));			\
    assert(mmux_ctype_equal(op, mmux_ctype_real_part(op)));			\
    assert(mmux_ctype_is_zero(mmux_ctype_imag_part(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  if (1) {									\
    auto op = mmux_##STEM##_literal(0.123);					\
    assert(mmux_ctype_equal(op, mmux_##STEM##_real_part(op)));			\
    assert(mmux_ctype_is_zero(mmux_##STEM##_imag_part(op)));			\
    assert(mmux_ctype_equal(op, mmux_ctype_real_part(op)));			\
    assert(mmux_ctype_is_zero(mmux_ctype_imag_part(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(FL)									\
  if (1) {											\
    auto Z = mmux_flonumc##FL##_rectangular_literal(REP, IMP);					\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(REP), mmux_flonumc##FL##_real_part(Z)));	\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(IMP), mmux_flonumc##FL##_imag_part(Z)));	\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(REP), mmux_ctype_real_part(Z)));		\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(IMP), mmux_ctype_imag_part(Z)));		\
    if (0) {											\
      dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));				\
      mmux_ctype_dprintf(2, Z);									\
      dprintf(2, "\n");										\
    }												\
    dprintf(2," %s,", "flonumc" #FL);								\
  }

  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(fl);
  DOIT_FOR_FLONUMC(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(d128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_complex_conjugate (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  REP
#define REP	0.123
#undef  IMP
#define IMP	0.456

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)						\
  if (1) {									\
    auto op = mmux_##STEM##_literal(123);					\
    assert(mmux_ctype_equal(op, mmux_##STEM##_conjugate(op)));			\
    assert(mmux_ctype_equal(op, mmux_ctype_conjugate(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  if (1) {									\
    auto op = mmux_##STEM##_literal(0.123);					\
    assert(mmux_ctype_equal(op, mmux_##STEM##_conjugate(op)));			\
    assert(mmux_ctype_equal(op, mmux_ctype_conjugate(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(FL)										\
  if (1) {												\
    auto W = mmux_flonumc##FL##_rectangular_literal(REP, IMP);						\
    auto Z = mmux_flonumc##FL##_conjugate(W);								\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(REP),   mmux_flonumc##FL##_real_part(Z)));	\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(- IMP), mmux_flonumc##FL##_imag_part(Z)));	\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(REP),   mmux_ctype_real_part(Z)));		\
    assert(mmux_ctype_equal(mmux_flonum##FL##_literal(- IMP), mmux_ctype_imag_part(Z)));		\
    if (0) {												\
      dprintf(2, "%s: Z(%s)=", __func__, mmux_ctype_dispatch_stem(Z));					\
      mmux_ctype_dprintf(2, Z);										\
      dprintf(2, "\n");											\
    }													\
    dprintf(2," %s,", "flonumc" #FL);									\
  }

  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(fl);
  DOIT_FOR_FLONUMC(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(d128);
#endif

  dprintf(2, " DONE.\n\n");
}


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

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)						\
  if (1) {									\
    auto op = mmux_##STEM##_literal(123);					\
    assert(mmux_ctype_is_zero(mmux_##STEM##_argument(op)));			\
    assert(mmux_ctype_is_zero(mmux_ctype_argument(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  if (1) {									\
    auto op = mmux_##STEM##_literal(0.123);					\
    assert(mmux_ctype_is_zero(mmux_##STEM##_argument(op)));			\
    assert(mmux_ctype_is_zero(mmux_ctype_argument(op)));			\
    if (0) {									\
      dprintf(2, "%s: op(%s)=", __func__, mmux_ctype_dispatch_stem(op));	\
      mmux_ctype_dprintf(2, op);						\
      dprintf(2, "\n");								\
    }										\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(FL)									\
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

  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(fl);
  DOIT_FOR_FLONUMC(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(d128);
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
  if (1) {	test_complex_real_imag_parts();	}
  if (1) {	test_complex_conjugate();	}
  if (1) {	test_complex_argument();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
