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
#include <test-common.h>


static void
test_mathematics_sin (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1 = mmux_## STEM(0.123);					\
    auto	rop = mmux_## STEM(0.122'690'09);				\
    auto	eps = mmux_## STEM(1e-6);					\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_sin(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sin(op1), eps));		\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
    auto	rop = mmux_##STEM##_rectangular_literal(-9.654'125'477,2.841'692'296);	\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
    if (0) {										\
      dprintf(2, "\napplication for " #STEM " expected '");				\
      mmux_##STEM##_dprintf(2, rop);							\
      dprintf(2, "' got '");								\
      mmux_##STEM##_dprintf(2, mmux_##STEM##_sin(op1));					\
      dprintf(2, "' ");									\
    }											\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_sin(op1), eps));		\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sin(op1), eps));			\
    dprintf(2," %s,", #STEM);								\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_cos (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1 = mmux_## STEM(0.123);					\
    auto	rop = mmux_## STEM(0.9924450321);				\
    auto	eps = mmux_## STEM(1e-6);					\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_cos(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cos(op1), eps));		\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
    auto	rop = mmux_##STEM##_rectangular_literal(2.855815004,9.606383448);	\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
    if (0) {										\
      dprintf(2, "\napplication for " #STEM " expected '");				\
      mmux_##STEM##_dprintf(2, rop);							\
      dprintf(2, "' got '");								\
      mmux_##STEM##_dprintf(2, mmux_##STEM##_cos(op1));					\
      dprintf(2, "' ");									\
    }											\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_cos(op1), eps));		\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cos(op1), eps));			\
    dprintf(2," %s,", #STEM);								\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_tan (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1 = mmux_## STEM ##_literal(0.123);				\
    auto	rop = mmux_## STEM ##_literal(0.123'624'066);			\
    auto	eps = mmux_## STEM(1e-6);					\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_tan(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tan(op1), eps));		\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)									\
  {												\
    auto	op1 = mmux_##STEM##_rectangular_literal(5.0,3.0);				\
    auto	rop = mmux_##STEM##_rectangular_literal(-0.002'708'235'84,1.004'164'71);	\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-6,1e-6);				\
    if (0) {											\
      dprintf(2, "\napplication for " #STEM " expected '");					\
      mmux_##STEM##_dprintf(2, rop);								\
      dprintf(2, "' got '");									\
      mmux_##STEM##_dprintf(2, mmux_##STEM##_tan(op1));						\
      dprintf(2, "' ");										\
    }												\
    assert(mmux_##STEM##_equal_relepsilon(rop, mmux_##STEM##_tan(op1), eps));			\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tan(op1), eps));				\
    dprintf(2," %s,", #STEM);									\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_asin (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM ##_literal(0.123);				\
    auto	erop = mmux_## STEM ##_literal(0.123'312'275);			\
    auto	eps  = mmux_## STEM ##_literal(1e-6);				\
    auto	rop1 = mmux_## STEM ##_asin(op1);				\
    auto	rop2 = mmux_ctype_asin(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    { /* Special case for the operand. */						\
      auto	op1  = mmux_##STEM##_rectangular_literal(0.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(0.0,1.818'446'46);		\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-6,1e-6);			\
      auto	rop1 = mmux_##STEM##_asin(op1);						\
      auto	rop2 = mmux_ctype_asin(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(1.023'821'75,2.452'913'74);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-6,1e-6);			\
      auto	rop1 = mmux_##STEM##_asin(op1);						\
      auto	rop2 = mmux_ctype_asin(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_acos (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM ##_literal(0.123);				\
    auto	erop = mmux_## STEM ##_literal(1.447'484'05);			\
    auto	eps  = mmux_## STEM ##_literal(1e-6);				\
    auto	rop1 = mmux_## STEM ##_acos(op1);				\
    auto	rop2 = mmux_ctype_acos(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(0.546'974'58,-2.452'913'74);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-6,1e-6);			\
      auto	rop1 = mmux_##STEM##_acos(op1);						\
      auto	rop2 = mmux_ctype_acos(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atan (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM ##_literal(0.123);				\
    auto	erop = mmux_## STEM ##_literal(0.122'385'281);			\
    auto	eps  = mmux_## STEM ##_literal(1e-6);				\
    auto	rop1 = mmux_## STEM ##_atan(op1);				\
    auto	rop2 = mmux_ctype_atan(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(1.423'679'04,0.086'569'059'2);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-6,1e-6);			\
      auto	rop1 = mmux_##STEM##_atan(op1);						\
      auto	rop2 = mmux_ctype_atan(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atan2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)					\
  {								\
    auto	op1  = mmux_## STEM ##_literal(0.123);		\
    auto	op2  = mmux_## STEM ##_literal(0.456);		\
    auto	erop = mmux_## STEM ##_literal(0.263'466'541);	\
    auto	eps  = mmux_## STEM ##_literal(1e-5);		\
    auto	rop1 = mmux_## STEM ##_atan2(op1,op2);		\
    auto	rop2 = mmux_ctype_atan2(op1,op2);		\
    if (0) {							\
      dprintf(2, "atan2 %s: expected ", #STEM);			\
      mmux_##STEM##_dprintf(2, erop);				\
      dprintf(2, " got ");					\
      mmux_##STEM##_dprintf(2, rop1);				\
      dprintf(2, "\n");						\
    }								\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));	\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));	\
    dprintf(2," %s,", #STEM);					\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_sinh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(0.123'310'379);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_sinh(op1);					\
    auto	rop2 = mmux_ctype_sinh(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
    auto	erop = mmux_##STEM##_rectangular_literal(-73.460'621'7,10.472'508'5);	\
    auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
    auto	rop1 = mmux_##STEM##_sinh(op1);						\
    auto	rop2 = mmux_ctype_sinh(op1);						\
    if (0) {										\
      dprintf(2, "\napplication for " #STEM " expected '");				\
      mmux_##STEM##_dprintf(2, erop);							\
      dprintf(2, "' got '");								\
      mmux_##STEM##_dprintf(2, rop1);							\
      dprintf(2, "' ");									\
    }											\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
    dprintf(2," %s,", #STEM);								\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_cosh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(1.007'574'04);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_cosh(op1);					\
    auto	rop2 = mmux_ctype_cosh(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
    auto	erop = mmux_##STEM##_rectangular_literal(-73.467'292'2,10.471'557'7);	\
    auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
    auto	rop1 = mmux_##STEM##_cosh(op1);						\
    auto	rop2 = mmux_ctype_cosh(op1);						\
    if (0) {										\
      dprintf(2, "\napplication for " #STEM " expected '");				\
      mmux_##STEM##_dprintf(2, erop);							\
      dprintf(2, "' got '");								\
      mmux_##STEM##_dprintf(2, rop1);							\
      dprintf(2, "' ");									\
    }											\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
    dprintf(2," %s,", #STEM);								\
    }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_tanh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(0.122'383'442);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_tanh(op1);					\
    auto	rop2 = mmux_ctype_tanh(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)									\
  {												\
    auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);				\
    auto	erop = mmux_##STEM##_rectangular_literal(0.999'912'82,-2.536'867'62e-05);	\
    auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);				\
    auto	rop1 = mmux_##STEM##_tanh(op1);							\
    auto	rop2 = mmux_ctype_tanh(op1);							\
    if (0) {											\
      dprintf(2, "\napplication for " #STEM " expected '");					\
      mmux_##STEM##_dprintf(2, erop);								\
      dprintf(2, "' got '");									\
      mmux_##STEM##_dprintf(2, rop1);								\
      dprintf(2, "' ");										\
    }												\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));					\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));					\
    dprintf(2," %s,", #STEM);									\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_asinh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(0.122'691'948);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_asinh(op1);				\
    auto	rop2 = mmux_ctype_asinh(op1);					\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    { /* special case */								\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,0.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(2.31243834,0.0);		\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_asinh(op1);					\
      auto	rop2 = mmux_ctype_asinh(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(2.459'831'52,0.533'999'07);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_asinh(op1);					\
      auto	rop2 = mmux_ctype_asinh(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_acosh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(1.23);					\
    auto	erop = mmux_## STEM(0.665'863'529);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_acosh(op1);				\
    auto	rop2 = mmux_ctype_acosh(op1);					\
    if (1) {									\
      dprintf(2, "\napplication for " #STEM " expected '");			\
      mmux_##STEM##_dprintf(2, erop);						\
      dprintf(2, "' got '");							\
      mmux_##STEM##_dprintf(2, rop1);						\
      dprintf(2, "' ");								\
    }										\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    { /* special case */								\
      auto	op1  = mmux_##STEM##_rectangular_literal(1.23,0.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(0.665'863'529,0.0);		\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_acosh(op1);					\
      auto	rop2 = mmux_ctype_acosh(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(2.452'913'74,0.546'974'58);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_acosh(op1);					\
      auto	rop2 = mmux_ctype_acosh(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atanh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(1.23);					\
    auto	erop = mmux_## STEM(0.123'625'981);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_atanh(op1);				\
    auto	rop2 = mmux_ctype_atanh(op1);					\
    if (1) {									\
      dprintf(2, "\napplication for " #STEM " expected '");			\
      mmux_##STEM##_dprintf(2, erop);						\
      dprintf(2, "' got '");							\
      mmux_##STEM##_dprintf(2, rop1);						\
      dprintf(2, "' ");								\
    }										\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(0.146'946'666,1.480'869'58);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_atanh(op1);					\
      auto	rop2 = mmux_ctype_atanh(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(1.130'884'42);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_exp(op1);					\
    auto	rop2 = mmux_ctype_exp(op1);					\
    if (0) {									\
      dprintf(2, "\napplication for " #STEM " expected '");			\
      mmux_##STEM##_dprintf(2, erop);						\
      dprintf(2, "' got '");							\
      mmux_##STEM##_dprintf(2, rop1);						\
      dprintf(2, "' ");								\
    }										\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(-146.927'914,20.944'066'2);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_exp(op1);						\
      auto	rop2 = mmux_ctype_exp(op1);						\
      if (0) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(1.088'997'02);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_exp2(op1);					\
    auto	rop2 = mmux_ctype_exp2(op1);					\
    if (0) {									\
      dprintf(2, "\napplication for " #STEM " expected '");			\
      mmux_##STEM##_dprintf(2, erop);						\
      dprintf(2, "' got '");							\
      mmux_##STEM##_dprintf(2, rop1);						\
      dprintf(2, "' ");								\
    }										\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(-15.583'821'4,27.948'962'6);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_exp2(op1);						\
      auto	rop2 = mmux_ctype_exp2(op1);						\
      if (0) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp10 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_REAL
#define DOIT_FOR_REAL(STEM)							\
  {										\
    auto	op1  = mmux_## STEM(0.123);					\
    auto	erop = mmux_## STEM(1.327'394'46);				\
    auto	eps  = mmux_## STEM(1e-5);					\
    auto	rop1 = mmux_##STEM##_exp10(op1);				\
    auto	rop2 = mmux_ctype_exp10(op1);					\
    if (0) {									\
      dprintf(2, "\napplication for " #STEM " expected '");			\
      mmux_##STEM##_dprintf(2, erop);						\
      dprintf(2, "' got '");							\
      mmux_##STEM##_dprintf(2, rop1);						\
      dprintf(2, "' ");								\
    }										\
    assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));			\
    assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));			\
    dprintf(2," %s,", #STEM);							\
  }

#undef  DOIT_FOR_CPLX
#define DOIT_FOR_CPLX(STEM)								\
  {											\
    {											\
      auto	op1  = mmux_##STEM##_rectangular_literal(5.0,3.0);			\
      auto	erop = mmux_##STEM##_rectangular_literal(81'121.465'3,58'474.848'2);	\
      auto	eps  = mmux_##STEM##_rectangular_literal(1e-3,1e-3);			\
      auto	rop1 = mmux_##STEM##_exp10(op1);					\
      auto	rop2 = mmux_ctype_exp10(op1);						\
      if (1) {										\
	dprintf(2, "\napplication for " #STEM " expected '");				\
	mmux_##STEM##_dprintf(2, erop);							\
	dprintf(2, "' got '");								\
	mmux_##STEM##_dprintf(2, rop1);							\
	dprintf(2, "' rep '");								\
	mmux_ctype_dprintf(2, mmux_ctype_div(mmux_ctype_absolute(mmux_ctype_sub(mmux_ctype_real_part(erop),	\
										mmux_ctype_real_part(rop1))),	\
					     mmux_ctype_absolute(mmux_ctype_real_part(erop))));		     \
	dprintf(2, "' imp '");								\
	mmux_ctype_dprintf(2, mmux_ctype_div(mmux_ctype_absolute(mmux_ctype_sub(mmux_ctype_imag_part(erop),	\
										mmux_ctype_imag_part(rop1))),	\
					     mmux_ctype_absolute(mmux_ctype_imag_part(erop))));		     \
	dprintf(2, "' ");								\
      }											\
      assert(mmux_##STEM##_equal_relepsilon(erop, rop1, eps));				\
      assert(mmux_ctype_equal_relepsilon(erop, rop2, eps));				\
      dprintf(2," %s,", #STEM);								\
    }											\
  }

  DOIT_FOR_REAL(flonumfl);
  DOIT_FOR_REAL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_REAL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_REAL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_REAL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_REAL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_REAL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_REAL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_REAL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_REAL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_REAL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_REAL(flonumd128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_CPLX(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_CPLX(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_CPLX(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_CPLX(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_CPLX(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_CPLX(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_CPLX(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_CPLX(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_CPLX(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_CPLX(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_CPLX(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_CPLX(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}

#if 0


static void
test_mathematics_log (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		-2.095'570'92
#undef  ROPZ
#define ROPZ		1.763'180'26,0.540'419'5

  {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, rop = ROPX, eps = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

  {
    auto	op1 = mmux_flonumcfl_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcfl_rectangular(ROPZ);
    auto	eps = mmux_flonumcfl_rectangular(1,1);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }

  {
    auto	op1 = mmux_flonumcdb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcdb_rectangular(ROPZ);
    auto	eps = mmux_flonumcdb_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
    auto	op1 = mmux_flonumcldb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcldb_rectangular(ROPZ);
    auto	eps = mmux_flonumcldb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
    auto	op1 = mmux_flonumcf32_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
    auto	op1 = mmux_flonumcf64_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
    auto	op1 = mmux_flonumcf128_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
    auto	op1 = mmux_flonumcf32x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32x_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
    auto	op1 = mmux_flonumcf64x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
    auto	op1 = mmux_flonumcf128x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log(op1), eps));
  }
#endif
}


static void
test_mathematics_log2 (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		-3.023'269'78
#undef  ROPZ
#define ROPZ		2.543'731'42,0.779'660'533

  {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, rop = ROPX, eps = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

  {
    auto	op1 = mmux_flonumcfl_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcfl_rectangular(ROPZ);
    auto	eps = mmux_flonumcfl_rectangular(1,1);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }

  {
    auto	op1 = mmux_flonumcdb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcdb_rectangular(ROPZ);
    auto	eps = mmux_flonumcdb_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
    auto	op1 = mmux_flonumcldb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcldb_rectangular(ROPZ);
    auto	eps = mmux_flonumcldb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
    auto	op1 = mmux_flonumcf32_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
    auto	op1 = mmux_flonumcf64_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
    auto	op1 = mmux_flonumcf128_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
    auto	op1 = mmux_flonumcf32x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32x_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
    auto	op1 = mmux_flonumcf64x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
    auto	op1 = mmux_flonumcf128x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log2(op1), eps));
  }
#endif
}


static void
test_mathematics_log10 (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		-0.910'094'889
#undef  ROPZ
#define ROPZ		0.765'739'459,0.234'701'207

  {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, rop = ROPX, eps = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

  {
    auto	op1 = mmux_flonumcfl_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcfl_rectangular(ROPZ);
    auto	eps = mmux_flonumcfl_rectangular(1,1);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }

  {
    auto	op1 = mmux_flonumcdb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcdb_rectangular(ROPZ);
    auto	eps = mmux_flonumcdb_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
    auto	op1 = mmux_flonumcldb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcldb_rectangular(ROPZ);
    auto	eps = mmux_flonumcldb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
    auto	op1 = mmux_flonumcf32_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
    auto	op1 = mmux_flonumcf64_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
    auto	op1 = mmux_flonumcf128_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
    auto	op1 = mmux_flonumcf32x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32x_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
    auto	op1 = mmux_flonumcf64x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
    auto	op1 = mmux_flonumcf128x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log10(op1), eps));
  }
#endif
}


static void
test_mathematics_logb (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		-4

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = -1.0, eps = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = -1.0, eps = 1e-6;
    if (0) {
      fprintf(stderr, "logb(%f)=%f\n", (mmux_flonumdb_t)op1, (mmux_flonumdb_t)mmux_ctype_logb(op1));
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = -1.0, eps = 1e-6;
    if (0) {
      fprintf(stderr, "logb(%f)=%f\n", (mmux_flonumdb_t)op1, (mmux_flonumdb_t)mmux_ctype_logb(op1));
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_logb(op1), eps));
  }
#endif
}


static void
test_mathematics_pow (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.384'588'887
#undef  ROPZ
#define ROPZ		324.803'341,-219.903'423

  {
    mmux_flonumfl_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

  {
    auto	op1 = mmux_flonumcfl_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcfl_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcfl_rectangular(ROPZ);
    auto	mrg = mmux_flonumcfl_rectangular(1,1);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }

  {
    auto	op1 = mmux_flonumcdb_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcdb_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcdb_rectangular(ROPZ);
    auto	mrg = mmux_flonumcdb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
    auto	op1 = mmux_flonumcldb_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcldb_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcldb_rectangular(ROPZ);
    auto	mrg = mmux_flonumcldb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
    auto	op1 = mmux_flonumcf32_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf32_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf32_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf32_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
    auto	op1 = mmux_flonumcf64_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf64_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf64_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf64_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
    auto	op1 = mmux_flonumcf128_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf128_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf128_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf128_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
    auto	op1 = mmux_flonumcf32x_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf32x_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf32x_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf32x_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
    auto	op1 = mmux_flonumcf64x_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf64x_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf64x_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf64x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
    auto	op1 = mmux_flonumcf128x_rectangular(5.0,3.0);
    auto	op2 = mmux_flonumcf128x_rectangular(4.0,2.0);
    auto	rop = mmux_flonumcf128x_rectangular(ROPZ);
    auto	mrg = mmux_flonumcf128x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_pow(op1,op2), mrg));
  }
#endif
}


static void
test_mathematics_sqrt (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.350'713'558
#undef  ROPZ
#define ROPZ		2.327'117'52,0.644'574'237

  {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, rop = ROPX, eps = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

  {
    auto	op1 = mmux_flonumcfl_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcfl_rectangular(ROPZ);
    auto	eps = mmux_flonumcfl_rectangular(1,1);
    if (0) {
      fprintf(stderr, "%s: rop=", __func__);
      mmux_flonumcfl_fprintf(stderr, mmux_ctype_sqrt(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }

  {
    auto	op1 = mmux_flonumcdb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcdb_rectangular(ROPZ);
    auto	eps = mmux_flonumcdb_rectangular(1e-3,1e-3);
    if (0) {
      fprintf(stderr, "%s: rop=", __func__);
      mmux_flonumcdb_fprintf(stderr, mmux_ctype_sqrt(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
    auto	op1 = mmux_flonumcldb_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcldb_rectangular(ROPZ);
    auto	eps = mmux_flonumcldb_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
    auto	op1 = mmux_flonumcf32_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
    auto	op1 = mmux_flonumcf64_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
    auto	op1 = mmux_flonumcf128_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
    auto	op1 = mmux_flonumcf32x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf32x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf32x_rectangular(1e-3,1e-3);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
    auto	op1 = mmux_flonumcf64x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf64x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf64x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
    auto	op1 = mmux_flonumcf128x_rectangular(5.0,3.0);
    auto	rop = mmux_flonumcf128x_rectangular(ROPZ);
    auto	eps = mmux_flonumcf128x_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_sqrt(op1), eps));
  }
#endif
}


static void
test_mathematics_cbrt (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.497'318'983

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-6;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_cbrt(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_cbrt(op1), eps));
  }
#endif
}


static void
test_mathematics_expm1 (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.130'884'421

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_expm1(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_expm1(op1), eps));
  }
#endif
}


static void
test_mathematics_log1p (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.116'003'676

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_log1p(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_log1p(op1), eps));
  }
#endif
}


static void
test_mathematics_hypot (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.472'297'576

  {
    mmux_flonumfl_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
  {
    mmux_flonumdb_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
    mmux_flonumd32_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-4;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
    mmux_flonumd64_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
    mmux_flonumd128_t	op1 = 0.123, op2 = 0.456, rop = ROPX, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_hypot(op1,op2), mrg));
  }
#endif
}


static void
test_mathematics_erf (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.138'093'882

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_erf(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erf(op1), eps));
  }
#endif
}


static void
test_mathematics_erfc (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		0.861'906'118

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_erfc(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_erfc(op1), eps));
  }
#endif
}


static void
test_mathematics_lgamma (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		2.036'327'5

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_lgamma(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_lgamma(op1), eps));
  }
#endif
}


static void
test_mathematics_tgamma (void)
{
  printf("running test: %s\n", __func__);
#undef  ROPX
#define ROPX		7.662'417'26

  if (1) {
    mmux_flonumfl_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
  if (1) {
    mmux_flonumdb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {
    mmux_flonumldb_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {
    mmux_flonumf32_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {
    mmux_flonumf64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {
    mmux_flonumf128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {
    mmux_flonumf32x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {
    mmux_flonumf64x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {
    mmux_flonumf128x_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {
    mmux_flonumd32_t	op1 = (mmux_flonumd32_t)0.123, rop = ROPX, eps = 1e-5;
    if (0) {
      fprintf(stderr, "%s: flonumd32 result ", __func__);
      mmux_flonumd32_fprintf(stderr, mmux_ctype_tgamma(op1));
      fprintf(stderr, "\n");
    }
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {
    mmux_flonumd64_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {
    mmux_flonumd128_t	op1 = 0.123, rop = ROPX, eps = 1e-6;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_tgamma(op1), eps));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Bessel function j0.
 ** ----------------------------------------------------------------- */

static void
test_mathematics_j0 (void)
{
  printf("running test: %s\n", __func__);

  {
    mmux_flonumfl_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }

  {
    mmux_flonumdb_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = 0.996'221'324'9, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j0(op1), mrg));
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
    mmux_flonumfl_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }

  {
    mmux_flonumdb_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = 0.061'383'769'1, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_j1(op1), mrg));
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
    mmux_flonumfl_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }

  {
    mmux_sint_t		op1 = 2;
    mmux_flonumdb_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumldb_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf32_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf64_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf128_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf32x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf64x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf128x_t	op2 = 0.123, rop = 0.001'888'741'891, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_jn(op1,op2), mrg));
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
    mmux_flonumfl_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }

  {
    mmux_flonumdb_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = -1.400'161'793, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y0(op1), mrg));
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
    mmux_flonumfl_t	op1 = 0.123, rop = -5.281'675'451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }

  {
    mmux_flonumdb_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_flonumldb_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_flonumf32_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_flonumf64_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_flonumf128_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_flonumf32x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_flonumf64x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_flonumf128x_t	op1 = 0.123, rop = -5.281675451, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_y1(op1), mrg));
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
    mmux_flonumfl_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }

  {
    mmux_sint_t		op1 = 2;
    mmux_flonumdb_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumldb_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf32_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf64_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf128_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf32x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf64x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
    mmux_sint_t		op1 = 2;
    mmux_flonumf128x_t	op2 = 0.123, rop = -84.48073985, mrg = 1e-4;
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_yn(op1,op2), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

#endif

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_mathematics_sin();		}
  if (1) {	test_mathematics_cos();		}
  if (1) {	test_mathematics_tan();		}

  if (0) {	test_mathematics_asin();	}
  if (0) {	test_mathematics_acos();	}
  if (0) {	test_mathematics_atan();	}
  if (1) {	test_mathematics_atan2();	}

  if (1) {	test_mathematics_sinh();	}
  if (1) {	test_mathematics_cosh();	}
  if (1) {	test_mathematics_tanh();	}

  if (0) {	test_mathematics_asinh();	}
  if (0) {	test_mathematics_acosh();	}
  if (0) {	test_mathematics_atanh();	}

  if (1) {	test_mathematics_exp();		}
  if (1) {	test_mathematics_exp2();	}
  if (1) {	test_mathematics_exp10();	}

#if 0
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
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
