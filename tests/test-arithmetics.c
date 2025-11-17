/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  6, 2025

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
 ** Addition.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_add (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto		op1  = mmux_pointer_literal(5);
    auto		op2  = mmux_ptrdiff_literal(4);
    auto		erop = mmux_pointer_literal(9);
    auto		rop1 = mmux_pointer_add(op1, op2);
    auto		rop2 = mmux_ctype_add(op1, op2);
    typeof(rop1)	rop3;
    PERFORM_CALL_P(mmux_pointer_add_p(&rop3,&op1, &op2));
    BINARY_EXACT_COMPARISON(pointer,add,op1,op2,erop,rop1);
    BINARY_EXACT_COMPARISON(pointer,add,op1,op2,erop,rop2);
    BINARY_EXACT_COMPARISON(pointer,add,op1,op2,erop,rop3);
    dprintf(2," %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,add,5,4,9);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,add,			    \
		       5.1,				    \
		       4.2,				    \
		       9.3);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    BINARY_FLONUMC_FUNC(STEM,add,			    \
			5.1,3.2, 			    \
			4.3,2.3,			    \
			9.4,5.5);			    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);

  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Subtraction.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_sub (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto		op1  = mmux_pointer_literal(9);
    auto		op2  = mmux_pointer_literal(4);
    auto		erop = mmux_ptrdiff_literal(5);
    auto		rop1 = mmux_pointer_sub(op1, op2);
    auto		rop2 = mmux_ctype_sub(op1, op2);
    typeof(rop1)	rop3;
    PERFORM_CALL_P(mmux_pointer_sub_p(&rop3,&op1, &op2));
    BINARY_EXACT_COMPARISON(ptrdiff,sub,op1,op2,erop,rop1);
    BINARY_EXACT_COMPARISON(ptrdiff,sub,op1,op2,erop,rop2);
    BINARY_EXACT_COMPARISON(ptrdiff,sub,op1,op2,erop,rop3);
    dprintf(2," %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,sub,9,5,4);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,sub,			    \
		       9.3,				    \
		       4.2,				    \
		       5.1);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    BINARY_FLONUMC_FUNC(STEM,sub,			    \
			9.4,5.5, 			    \
			4.3,2.3,			    \
			5.1,3.2);			    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Multiplication.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_mul (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,mul,5,3,15);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,mul,			    \
		       5.0,				    \
		       3.0,				    \
		       15.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    BINARY_FLONUMC_FUNC(STEM,mul,			    \
			5.0,3.0, 			    \
			3.0,2.0,			    \
			9.0,19.0);			    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Division.
 ** ----------------------------------------------------------------- */

/*
 * 24 / 3 = 8
 * 24.0 / 3.0 = 8.0
 * (5.0)+i*(3.0) / (3.0)+i*(2.0) = (1.61538462)+i*(-0.0769230769)
 */

static void
test_arithmetics_div (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,div,24,3,8);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,div,			    \
		       24.0,				    \
		       3.0,				    \
		       8.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    BINARY_FLONUMC_FUNC(STEM,div,			    \
			5.0,3.0, 			    \
			3.0,2.0,			    \
			1.61538462,-0.0769230769);	    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Negation.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_neg (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_SIGNED_INTEGER_TEST
#define DEFINE_SIGNED_INTEGER_TEST(STEM)		    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,neg,5,-5);			    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    UNARY_FLONUM_FUNC(STEM,neg,				    \
		       5.0,				    \
		       -5.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    UNARY_FLONUMC_FUNC(STEM,neg,			    \
		       5.0,3.0, 			    \
		       -5.0,-3.0);			    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_CHAR_IS_SIGNED
  DEFINE_SIGNED_INTEGER_TEST(char);
#endif
  DEFINE_SIGNED_INTEGER_TEST(schar);
  DEFINE_SIGNED_INTEGER_TEST(sshort);
  DEFINE_SIGNED_INTEGER_TEST(sint);
  DEFINE_SIGNED_INTEGER_TEST(slong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_SIGNED_INTEGER_TEST(sllong);
#endif
  DEFINE_SIGNED_INTEGER_TEST(sint8);
  DEFINE_SIGNED_INTEGER_TEST(sint16);
  DEFINE_SIGNED_INTEGER_TEST(sint32);
  DEFINE_SIGNED_INTEGER_TEST(sint64);

  DEFINE_SIGNED_INTEGER_TEST(byte);
  DEFINE_SIGNED_INTEGER_TEST(ssize);
  DEFINE_SIGNED_INTEGER_TEST(sintmax);
  DEFINE_SIGNED_INTEGER_TEST(sintptr);
  DEFINE_SIGNED_INTEGER_TEST(off);
  DEFINE_SIGNED_INTEGER_TEST(ptrdiff);
  DEFINE_SIGNED_INTEGER_TEST(wchar);
  DEFINE_SIGNED_INTEGER_TEST(wint);
  DEFINE_SIGNED_INTEGER_TEST(time);
  DEFINE_SIGNED_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Inversion.
 ** ----------------------------------------------------------------- */

/*
 * 1 / 5 = 0
 * 1.0 / 5.0 = 0.2
 * 1.0 / (5.0)+i*(3.0) = (0.147058824)+i*(-0.0882352941)
 */

static void
test_arithmetics_inverse (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,inverse,5,0);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    UNARY_FLONUM_FUNC(STEM,inverse,			    \
		      5.0,				    \
		      0.2);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TEST
#define DEFINE_FLONUMC_TEST(STEM)			    \
  {							    \
    UNARY_FLONUMC_FUNC(STEM,inverse,			    \
		       5.0,3.0, 			    \
		       0.147058824,-0.0882352941);	    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TEST(flonumcfl);
  DEFINE_FLONUMC_TEST(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TEST(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TEST(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TEST(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TEST(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TEST(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TEST(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TEST(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TEST(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TEST(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TEST(flonumcd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Absolute value.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_absolute (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_SIGNED_INTEGER_TEST
#define DEFINE_SIGNED_INTEGER_TEST(STEM)		    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,absolute,5,5);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_UNSIGNED_INTEGER_TEST
#define DEFINE_UNSIGNED_INTEGER_TEST(STEM)		    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,absolute,5,5);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    UNARY_FLONUM_FUNC(STEM,absolute,			    \
		      -5.0,				    \
		      5.0);				    \
    UNARY_FLONUM_FUNC(STEM,absolute,			    \
		      5.0,				    \
		      5.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUMC_TO_FLONUM_TEST
#define DEFINE_FLONUMC_TO_FLONUM_TEST(CSTEM,RSTEM)	    \
  {							    \
    UNARY_FLONUMC_TO_FLONUM_FUNC(CSTEM,RSTEM,absolute,	    \
				 +5.0,-3.0,		    \
				 5.83095189);		    \
    UNARY_FLONUMC_TO_FLONUM_FUNC(CSTEM,RSTEM,absolute,	    \
				 -5.0,+3.0,		    \
				 5.83095189);		    \
    dprintf(2," %s,", #CSTEM);				    \
  }

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_CHAR_IS_SIGNED
  DEFINE_SIGNED_INTEGER_TEST(char);
#else
  DEFINE_UNSIGNED_INTEGER_TEST(char);
#endif
  DEFINE_SIGNED_INTEGER_TEST(schar);
  DEFINE_UNSIGNED_INTEGER_TEST(uchar);
  DEFINE_SIGNED_INTEGER_TEST(sshort);
  DEFINE_UNSIGNED_INTEGER_TEST(ushort);
  DEFINE_SIGNED_INTEGER_TEST(sint);
  DEFINE_UNSIGNED_INTEGER_TEST(uint);
  DEFINE_SIGNED_INTEGER_TEST(slong);
  DEFINE_UNSIGNED_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_SIGNED_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_UNSIGNED_INTEGER_TEST(ullong);
#endif
  DEFINE_SIGNED_INTEGER_TEST(sint8);
  DEFINE_UNSIGNED_INTEGER_TEST(uint8);
  DEFINE_SIGNED_INTEGER_TEST(sint16);
  DEFINE_UNSIGNED_INTEGER_TEST(uint16);
  DEFINE_SIGNED_INTEGER_TEST(sint32);
  DEFINE_UNSIGNED_INTEGER_TEST(uint32);
  DEFINE_SIGNED_INTEGER_TEST(sint64);
  DEFINE_UNSIGNED_INTEGER_TEST(uint64);

  DEFINE_SIGNED_INTEGER_TEST(byte);
  DEFINE_UNSIGNED_INTEGER_TEST(octet);
  DEFINE_SIGNED_INTEGER_TEST(ssize);
  DEFINE_UNSIGNED_INTEGER_TEST(usize);
  DEFINE_SIGNED_INTEGER_TEST(sintmax);
  DEFINE_UNSIGNED_INTEGER_TEST(uintmax);
  DEFINE_SIGNED_INTEGER_TEST(sintptr);
  DEFINE_UNSIGNED_INTEGER_TEST(uintptr);
  DEFINE_SIGNED_INTEGER_TEST(off);
  DEFINE_SIGNED_INTEGER_TEST(ptrdiff);
  DEFINE_SIGNED_INTEGER_TEST(wchar);
  DEFINE_UNSIGNED_INTEGER_TEST(wint);
  DEFINE_SIGNED_INTEGER_TEST(time);
  DEFINE_SIGNED_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcfl,	flonumfl);
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcdb,	flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcldb,	flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf32,	flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf64,	flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf128,	flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf32x,	flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf64x,	flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcf128x,	flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcd32,	flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcd64,	flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_FLONUMC_TO_FLONUM_TEST(flonumcd128,	flonumd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
#undef DEFINE_FLONUMC_TO_FLONUM_TEST
  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Modulo.
 ** ----------------------------------------------------------------- */

/*
 * 23 % 3 = 2
 * 23.0 % 3.0 = 2.0
 */

static void
test_arithmetics_modulo (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,modulo,23,3,2);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,modulo,			    \
		       23.0,				    \
		       3.0,				    \
		       2.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
#undef DEFINE_FLONUMC_TO_FLONUM_TEST

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Remainder.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_remainder (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,remainder,23,3,2);		    \
    dprintf(2," %s,", #STEM);				    \
  }

  /* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    BINARY_FLONUM_FUNC(STEM,remainder,			    \
		       10.0,				    \
		       3.0,				    \
		       1.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

  /* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

  /* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST
#undef DEFINE_FLONUMC_TO_FLONUM_TEST

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Increment.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_incr (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,incr,65,66);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    UNARY_FLONUM_FUNC(STEM,incr,			    \
		      5.0,				    \
		      6.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Decrement.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_decr (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    UNARY_INTEGER_FUNC(STEM,decr,66,65);		    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_FLONUM_TEST
#define DEFINE_FLONUM_TEST(STEM)			    \
  {							    \
    UNARY_FLONUM_FUNC(STEM,decr,			    \
		      5.0,				    \
		      4.0);				    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);

  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);

/* ------------------------------------------------------------------ */

  DEFINE_FLONUM_TEST(flonumfl);
  DEFINE_FLONUM_TEST(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_FLONUM_TEST(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_FLONUM_TEST(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_FLONUM_TEST(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_FLONUM_TEST(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_FLONUM_TEST(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_FLONUM_TEST(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_FLONUM_TEST(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_FLONUM_TEST(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_FLONUM_TEST(flonumd128);
#endif

/* ------------------------------------------------------------------ */

#undef DEFINE_INTEGER_TEST
#undef DEFINE_SIGNED_INTEGER_TEST
#undef DEFINE_UNSIGNED_INTEGER_TEST
#undef DEFINE_FLONUM_TEST
#undef DEFINE_FLONUMC_TEST

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

  if (1) {	test_arithmetics_add();		}
  if (1) {	test_arithmetics_sub();		}
  if (1) {	test_arithmetics_mul();		}
  if (1) {	test_arithmetics_div();		}
  if (1) {	test_arithmetics_neg();		}
  if (1) {	test_arithmetics_inverse();	}
  if (1) {	test_arithmetics_absolute();	}
  if (1) {	test_arithmetics_modulo();	}
  if (1) {	test_arithmetics_remainder();	}
  if (1) {	test_arithmetics_incr();	}
  if (1) {	test_arithmetics_decr();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
