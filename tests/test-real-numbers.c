/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Sep 19, 2025

  Abstract

	Test file for functions.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


static void
test_arithmetics_sign (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  EQUAL_UNARY
#define EQUAL_UNARY(STEM, FUNC, OP, RESULT_WE_EXPECTED, RESULT_WE_GOT)	\
  if (! mmux_##STEM##_equal(RESULT_WE_EXPECTED, RESULT_WE_GOT)) {	\
    dprintf(2, "\n%s: %s: expected '%s(", __func__, #STEM, #FUNC);	\
    mmux_ctype_dprintf(2, op);						\
    dprintf(2, ")=");							\
    mmux_ctype_dprintf(2, erop);					\
    dprintf(2, "' got '");						\
    mmux_ctype_dprintf(2, rop1);					\
    dprintf(2, "'\n");							\
    exit(EXIT_FAILURE);							\
  }

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,OP,ROP)		    \
  {							    \
    auto	op   = mmux_## STEM ## _literal(OP);	    \
    auto	erop = mmux_## STEM ## _literal(ROP);	    \
    auto	rop1 = mmux_## STEM ##_sign(op);	    \
    auto	rop2 = mmux_ctype_sign(op);		    \
    EQUAL_UNARY(STEM, sign, OP, erop, rop1);		    \
    EQUAL_UNARY(STEM, sign, OP, erop, rop2);		    \
    dprintf(2," %s,", #STEM);				    \
  }

  /* ------------------------------------------------------------------ */

#undef  DOIT_FOR_THIS_FLONUMC_NUMBER
#define DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,OPRE,OPIM,ROPRE,ROPIM)		\
  {										\
    auto	op   = mmux_## STEM ##_rectangular_literal(OPRE,OPIM);		\
    auto	erop = mmux_## STEM ##_rectangular_literal(ROPRE,ROPIM);	\
    auto	rop1 = mmux_## STEM ##_sign(op);				\
    auto	rop2 = mmux_ctype_sign(op);					\
    EQUAL_UNARY(STEM, sign, OP, erop, rop1);					\
    EQUAL_UNARY(STEM, sign, OP, erop, rop2);					\
    dprintf(2," %s,", #STEM);							\
  }

  /* ------------------------------------------------------------------ */

#undef  DOIT_FOR_SIGNED_EXACT_INTEGER
#define DOIT_FOR_SIGNED_EXACT_INTEGER(STEM)		    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,	+13,	+1);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	  0,	 0);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	-13,	-1);		    \
  }

#undef  DOIT_FOR_UNSIGNED_EXACT_INTEGER
#define DOIT_FOR_UNSIGNED_EXACT_INTEGER(STEM)		    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,	+13,	+1);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	  0,	 0);		    \
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,	+13.0,	+1.0);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	 +0.0,	+1.0);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	 -0.0,	-1.0);		    \
    DOIT_FOR_THIS_NUMBER(STEM,	-13.0,	-1.0);		    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	+13.0,	+13.0,	+1.0,	+1.0);	\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	 +0.0,	+0.0,	+1.0,	+1.0);	\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	 -0.0,	-0.0,	-1.0,	-1.0);	\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	-13.0,	-13.0,	-1.0,	-1.0);	\
									\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	+13.0,	-13.0,	+1.0,	-1.0);	\
    DOIT_FOR_THIS_FLONUMC_NUMBER(STEM,	-13.0,	+13.0,	-1.0,	+1.0);	\
  }

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(char)
#else
  DOIT_FOR_SIGNED_EXACT_INTEGER(char)
#endif

  DOIT_FOR_SIGNED_EXACT_INTEGER(schar);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uchar);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sshort);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(ushort);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sint);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uint);
  DOIT_FOR_SIGNED_EXACT_INTEGER(slong);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_SIGNED_EXACT_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(ullong);
#endif
  DOIT_FOR_SIGNED_EXACT_INTEGER(sint8);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uint8);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sint16);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uint16);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sint32);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uint32);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sint64);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uint64);

  DOIT_FOR_SIGNED_EXACT_INTEGER(byte);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(octet);
  DOIT_FOR_SIGNED_EXACT_INTEGER(ssize);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(usize);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sintmax);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uintmax);
  DOIT_FOR_SIGNED_EXACT_INTEGER(sintptr);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(uintptr);
  DOIT_FOR_SIGNED_EXACT_INTEGER(off);
  DOIT_FOR_SIGNED_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(wchar);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(wint);
  DOIT_FOR_UNSIGNED_EXACT_INTEGER(time);

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

  if (1) {	test_arithmetics_sign();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
