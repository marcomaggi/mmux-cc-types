/*
  Part of: MMUX CC Tests
  Contents: test functions
  Date: Sep 14, 2025

  Abstract

	Test comparison functions.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Macros.
 ** ----------------------------------------------------------------- */

#undef  DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE
#define DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(STEM,PRED,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    if (! mmux_##STEM##_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected '%s_less(", #STEM);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (! mmux_ctype_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_less(", #STEM);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE
#define DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE(STEM,PRED,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    if (mmux_##STEM##_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected '%s_less(", #STEM);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (mmux_ctype_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected 'ctype(%s)_less(", #STEM);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

/* ------------------------------------------------------------------ */

#undef  DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE
#define DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(STEM,PRED,				\
						LITERAL1_RE,LITERAL1_IM,		\
						LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    if (! mmux_##STEM##_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected '%s_less(", #STEM);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected 'ctype(%s)_less(", #STEM);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE
#define DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM,PRED,				\
						 LITERAL1_RE,LITERAL1_IM,		\
						 LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    if (mmux_##STEM##_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected '%s_less(", #STEM);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (mmux_ctype_##PRED(op1, op2)) {							\
      dprintf(2, "\nexpected 'ctype(%s)_less(", #STEM);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }


static void
test_comparison_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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
test_comparison_not_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, not_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, not_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, not_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

  /* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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
test_comparison_less (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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
test_comparison_greater (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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
test_comparison_less_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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
test_comparison_greater_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)											\
  {														\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);											\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
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
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

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

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
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


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_comparison_equal();		}
  if (1) {	test_comparison_not_equal();		}
  if (1) {	test_comparison_less();			}
  if (1) {	test_comparison_greater();		}
  if (1) {	test_comparison_less_equal();		}
  if (1) {	test_comparison_greater_equal();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
