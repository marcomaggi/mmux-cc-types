/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Sep  2, 2025

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


/** --------------------------------------------------------------------
 ** Rectangular.
 ** ----------------------------------------------------------------- */

static void
test_constant_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER()
#define DOIT_FOR_EXACT_INTEGER(STEM)			    \
  {							    \
    auto	op  = mmux_ ## STEM ## _consant_zero();	    \
    auto	rop = mmux_ ## STEM ## _literal(0);	    \
    assert(mmux_ ## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

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
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_EXACT_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_EXACT_INTEGER(ullong);
#endif
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
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

#if 0
  DOIT_FOR_FLONUM(fl);
  DOIT_FOR_FLONUM(db);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(ldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(f32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(f64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(f128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(f32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(f64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(f128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(d32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(d64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(d128);
#endif

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

  if (1) {	test_constant_zero();		}
#if 0
  if (1) {	test_constant_one();		}
  if (1) {	test_constant_ten();		}
  if (1) {	test_constant_one_half();	}
  if (1) {	test_constant_one_third();	}
  if (1) {	test_constant_maximum();	}
  if (1) {	test_constant_minimum();	}
  if (1) {	test_constant_nan();		}
  if (1) {	test_constant_E();		}
  if (1) {	test_constant_LOG2E();		}
  if (1) {	test_constant_LOG10E();		}
  if (1) {	test_constant_LN2();		}
  if (1) {	test_constant_LN10();		}
  if (1) {	test_constant_PI();		}
  if (1) {	test_constant_PI_2();		}
  if (1) {	test_constant_PI_4();		}
  if (1) {	test_constant_1_PI();		}
  if (1) {	test_constant_2_PI();		}
  if (1) {	test_constant_2_SQRTPI();	}
  if (1) {	test_constant_SQRT2();		}
  if (1) {	test_constant_SQRT1_2();	}
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
