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

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Common macros.
 ** ----------------------------------------------------------------- */

#undef	SMALL_EPS
#define	SMALL_EPS		1e-3

#undef	NORMAL_EPS
#define	NORMAL_EPS		1e-6

#undef  EQUAL_RELEPSILON_UNARY
#define EQUAL_RELEPSILON_UNARY(STEM, FUNC, OP, RESULT_WE_EXPECTED, RESULT_WE_GOT, EPSILON)	\
  if (! mmux_##STEM##_equal_relepsilon(RESULT_WE_EXPECTED, RESULT_WE_GOT, EPSILON)) {		\
    dprintf(2, "\n%s: %s: expected '%s(", __func__, #STEM, #FUNC);				\
    mmux_##STEM##_dprintf(2, op);								\
    dprintf(2, ")=");										\
    mmux_##STEM##_dprintf(2, erop);								\
    dprintf(2, "' got '");									\
    mmux_##STEM##_dprintf(2, rop1);								\
    dprintf(2, "'\n");										\
    exit(EXIT_FAILURE);										\
  }

#undef  EQUAL_RELEPSILON_BINARY
#define EQUAL_RELEPSILON_BINARY(STEM, FUNC, OP1, OP2, RESULT_WE_EXPECTED, RESULT_WE_GOT, EPSILON)	\
  if (! mmux_##STEM##_equal_relepsilon(RESULT_WE_EXPECTED, RESULT_WE_GOT, EPSILON)) {			\
    dprintf(2, "\n%s: %s: expected '%s(", __func__, #STEM, #FUNC);					\
    mmux_##STEM##_dprintf(2, op1);									\
    dprintf(2, ",");											\
    mmux_##STEM##_dprintf(2, op2);									\
    dprintf(2, ")=");											\
    mmux_##STEM##_dprintf(2, erop);									\
    dprintf(2, "' got '");										\
    mmux_##STEM##_dprintf(2, rop1);									\
    dprintf(2, "'\n");											\
    exit(EXIT_FAILURE);											\
  }

/* ------------------------------------------------------------------ */

#undef  DOIT_FOR_THIS_FLONUM
#define DOIT_FOR_THIS_FLONUM(STEM,FUNC, OP, EXPECTED_ROP, EPSILON)	\
  {									\
    auto	op   = mmux_##STEM##_literal(OP);			\
    auto	erop = mmux_##STEM##_literal(EXPECTED_ROP);		\
    auto	eps  = mmux_##STEM##_literal(EPSILON);			\
    auto	rop1 = mmux_##STEM##_##FUNC(op);			\
    auto	rop2 = mmux_ctype_##FUNC(op);				\
    EQUAL_RELEPSILON_UNARY(STEM,FUNC,op,erop,rop1,eps);			\
    EQUAL_RELEPSILON_UNARY(STEM,FUNC,op,erop,rop2,eps);			\
  }

#undef  DOIT_FOR_THIS_FLONUM_BINARY
#define DOIT_FOR_THIS_FLONUM_BINARY(STEM, FUNC,					\
				    OP1, OP2,					\
				    EXPECTED_ROP, EPSILON)			\
  {										\
    auto	op1  = mmux_##STEM##_literal(OP1);				\
    auto	op2  = mmux_##STEM##_literal(OP2);				\
    auto	erop = mmux_##STEM##_literal(EXPECTED_ROP);			\
    auto	eps  = mmux_##STEM##_literal(EPSILON);				\
    auto	rop1 = mmux_##STEM##_##FUNC(op1,op2);				\
    auto	rop2 = mmux_ctype_##FUNC(op1,op2);				\
    EQUAL_RELEPSILON_BINARY(STEM,FUNC,op1,op2,erop,rop1,eps);			\
    EQUAL_RELEPSILON_BINARY(STEM,FUNC,op1,op2,erop,rop2,eps);			\
  }

#undef  DOIT_FOR_THIS_FLONUMC
#define DOIT_FOR_THIS_FLONUMC(STEM, FUNC,							\
			      OP_REP, OP_IMP,							\
			      EXPECTED_REP, EXPECTED_IMP,					\
			      EPSILON)								\
  {												\
    auto	op   = mmux_##STEM##_rectangular_literal(OP_REP,OP_IMP);			\
    auto	erop = mmux_##STEM##_rectangular_literal(EXPECTED_REP, EXPECTED_IMP);		\
    auto	eps  = mmux_##STEM##_rectangular_literal(EPSILON,EPSILON);			\
    auto	rop1 = mmux_##STEM##_##FUNC(op);						\
    auto	rop2 = mmux_ctype_##FUNC(op);							\
    EQUAL_RELEPSILON_UNARY(STEM,FUNC,op,erop,rop1,eps);						\
    EQUAL_RELEPSILON_UNARY(STEM,FUNC,op,erop,rop2,eps);						\
  }

#undef  DOIT_FOR_THIS_FLONUMC_BINARY
#define DOIT_FOR_THIS_FLONUMC_BINARY(STEM,FUNC,						\
				     OP1_REP, OP1_IMP,					\
				     OP2_REP, OP2_IMP,					\
				     EXPECTED_REP, EXPECTED_IMP, EPSILON)		\
  {											\
    auto	op1  = mmux_##STEM##_rectangular_literal(OP1_REP,OP1_IMP);		\
    auto	op2  = mmux_##STEM##_rectangular_literal(OP2_REP,OP2_IMP);		\
    auto	erop = mmux_##STEM##_rectangular_literal(EXPECTED_REP, EXPECTED_IMP);	\
    auto	eps  = mmux_##STEM##_rectangular_literal(EPSILON,EPSILON);		\
    auto	rop1 = mmux_##STEM##_##FUNC(op);					\
    auto	rop2 = mmux_ctype_##FUNC(op);						\
    EQUAL_RELEPSILON_BINARY(STEM,FUNC,op1,op2,erop,rop1,eps);				\
    EQUAL_RELEPSILON_BINARY(STEM,FUNC,op1,op2,erop,rop2,eps);				\
  }


static void
test_mathematics_sin (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, sin,			    \
			 0.123,				    \
			 0.122'690'09,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, sin,			    \
			  5.0,3.0,			    \
			  -9.654'125'477,2.841'692'296,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_cos (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, cos,			    \
			 0.123,				    \
			 0.992'445'032'1,		    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, cos,			    \
			  5.0,3.0,			    \
			  2.855815004,9.606383448,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_tan (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, tan,			    \
			 0.123,				    \
			 0.123'624'066,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, tan,			    \
			  5.0,3.0,			    \
			  -0.002'708'235'84,1.004'164'71,   \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_asin (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, asin,			    \
			 0.123,				    \
			 0.123'312'275,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, asin,			    \
			  0.0,3.0,			    \
			  0.0,1.818'446'46,		    \
			  SMALL_EPS);			    \
    DOIT_FOR_THIS_FLONUMC(STEM, asin,			    \
			  5.0,3.0,			    \
			  1.023'821'75,2.452'913'74,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_acos (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, acos,			    \
			 0.123,				    \
			 1.447'484'05,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, acos,			    \
			  5.0,3.0,			    \
			  0.546'974'58,-2.452'913'74,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atan (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, atan,			    \
			 0.123,				    \
			 0.122'385'281,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, atan,			    \
			  5.0,3.0,			    \
			  1.423'679'04,0.086'569'059'2,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atan2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM_BINARY(STEM, atan2,		    \
				0.123,	0.456,		    \
				0.263'466'541,		    \
				SMALL_EPS);		    \
    dprintf(2," %s,", #STEM);				    \
  }

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

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_sinh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, sinh,			    \
			 0.123,				    \
			 0.123'310'379,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, sinh,			    \
			  5.0,3.0,			    \
			  -73.460'621'7,10.472'508'5,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_cosh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, cosh,			    \
			 0.123,				    \
			 1.007'574'04,			    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, cosh,			    \
			  5.0,3.0,			    \
			  -73.467'292'2,10.471'557'7,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_tanh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, tanh,			    \
			 0.123,				    \
			 0.122'383'442,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, tanh,			    \
			  5.0,3.0,			    \
			  0.999'912'82,-2.536'867'62e-05,   \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_asinh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, asinh,			    \
			 0.123,				    \
			 0.122'691'948,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, asinh,			    \
			  5.0,0.0,			    \
			  2.31243834,0.0,		    \
			  SMALL_EPS);			    \
    DOIT_FOR_THIS_FLONUMC(STEM, asinh,			    \
			  5.0,3.0,			    \
			  2.459'831'52,0.533'999'07,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_acosh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, acosh,			    \
			 1.23,				    \
			 0.665'863'529,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, acosh,			    \
			  1.23,0.0,			    \
			  0.665'863'529,0.0,		    \
			  SMALL_EPS);			    \
    DOIT_FOR_THIS_FLONUMC(STEM, acosh,			    \
			  5.0,3.0,			    \
			  2.452'913'74,0.546'974'58,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_atanh (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, atanh,			    \
			 0.123,				    \
			 0.123'625'981,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, atanh,			    \
			  5.0,3.0,			    \
			  0.146'946'666,1.480'869'58,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, exp,			    \
			 0.123,				    \
			 1.130'884'42,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, exp,			    \
			  5.0,3.0,			    \
			  -146.927'914,20.944'066'2,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, exp2,			    \
			 0.123,				    \
			 1.088'997'02,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, exp2,			    \
			  5.0,3.0,			    \
			  -15.583'821'4,27.948'962'6,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_exp10 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, exp10,			    \
			 0.123,				    \
			 1.327'394'46,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, exp10,			    \
			  5.0,3.0,			    \
			  81'121.465'3,58'474.848'2,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_log (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, log,			    \
			 0.123,				    \
			 -2.095'570'92,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, log,			    \
			  5.0,3.0,			    \
			  1.763'180'26,0.540'419'5,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_log2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, log2,			    \
			 0.123,				    \
			 -3.023'269'78,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, log2,			    \
			  5.0,3.0,			    \
			  2.543'731'42,0.779'660'533,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_log10 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, log10,			    \
			 0.123,				    \
			 -0.910'094'889,		    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, log10,			    \
			  5.0,3.0,			    \
			  0.765'739'459,0.234'701'207,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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

#ifdef MMUX_CC_TYPES_HAS_FLONUMCFL
  DOIT_FOR_FLONUMC(flonumcfl);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCDB
  DOIT_FOR_FLONUMC(flonumcdb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_logb (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, logb,			    \
			 0.123,				    \
			 -4.0,				    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMD
#define DOIT_FOR_FLONUMD(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, logb,			    \
			 0.123,				    \
			 -1.0,				    \
			 NORMAL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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
  DOIT_FOR_FLONUMD(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUMD(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUMD(flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_pow (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM_BINARY(STEM, pow,		    \
				0.123, 0.456,		    \
				0.384'588'887,		    \
				NORMAL_EPS);		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, log10,			    \
			  5.0,3.0,			    \
			  4.0,2.0,			    \
			  324.803'341,-219.903'423,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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
  DOIT_FOR_FLONUMD(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUMD(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUMD(flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_mathematics_sqrt (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUM(STEM, sqrt,			    \
			 0.123,				    \
			 0.350'713'558,			    \
			 SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)				    \
  {							    \
    DOIT_FOR_THIS_FLONUMC(STEM, sqrt,			    \
			  5.0,3.0,			    \
			  2.327'117'52,0.644'574'237,	    \
			  SMALL_EPS);			    \
    dprintf(2," %s,", #STEM);				    \
  }

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
  DOIT_FOR_FLONUMD(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUMD(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUMD(flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}

#if 0


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

#if 0


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
