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

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Maximum.
 ** ----------------------------------------------------------------- */

static void
test_constant_maximum (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)				\
  {								\
    auto	op  = mmux_ ## STEM ## _constant_maximum();	\
    assert(mmux_ ## STEM ## _is_positive(op));			\
    dprintf(2,"\nmaximum(%s) = ", #STEM);				\
    mmux_##STEM##_dprintf(2, op);					\
    dprintf(2,"\n");							\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_maximum();		\
    assert(mmux_## STEM ## _is_positive(op));				\
    dprintf(2,"\nmaximum(%s) = ", #STEM);				\
    mmux_##STEM##_dprintf(2, op);					\
    dprintf(2,"\n");							\
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
  DOIT_FOR_EXACT_INTEGER(ino);
  DOIT_FOR_EXACT_INTEGER(dev);
  DOIT_FOR_EXACT_INTEGER(nlink);
  DOIT_FOR_EXACT_INTEGER(blkcnt);

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


/** --------------------------------------------------------------------
 ** Minimum.
 ** ----------------------------------------------------------------- */

static void
test_constant_minimum (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_SIGNED_INTEGER
#define DOIT_FOR_EXACT_SIGNED_INTEGER(STEM)			\
  {								\
    auto	op  = mmux_ ## STEM ## _constant_minimum();	\
    assert(mmux_ ## STEM ## _is_negative(op));			\
    dprintf(2,"\nminimum(%s) = ", #STEM);			\
    mmux_##STEM##_dprintf(2, op);				\
    dprintf(2,"\n");						\
  }

#undef  DOIT_FOR_EXACT_UNSIGNED_INTEGER
#define DOIT_FOR_EXACT_UNSIGNED_INTEGER(STEM)			\
  {								\
    auto	op  = mmux_ ## STEM ## _constant_minimum();	\
    assert(mmux_ ## STEM ## _is_zero(op));			\
    dprintf(2,"\nminimum(%s) = ", #STEM);			\
    mmux_##STEM##_dprintf(2, op);				\
    dprintf(2,"\n");						\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_minimum();		\
    assert(mmux_## STEM ## _is_negative(op));				\
    dprintf(2,"\nminimum(%s) = ", #STEM);				\
    mmux_##STEM##_dprintf(2, op);					\
    dprintf(2,"\n");							\
  }

  DOIT_FOR_EXACT_UNSIGNED_INTEGER(pointer);
#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(char);
#else
  DOIT_FOR_EXACT_SIGNED_INTEGER(char);
#endif
  DOIT_FOR_EXACT_SIGNED_INTEGER(schar);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uchar);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sshort);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(ushort);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sint);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uint);
  DOIT_FOR_EXACT_SIGNED_INTEGER(slong);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_EXACT_SIGNED_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(ullong);
#endif
  DOIT_FOR_EXACT_SIGNED_INTEGER(sint8);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uint8);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sint16);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uint16);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sint32);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uint32);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sint64);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uint64);
  DOIT_FOR_EXACT_SIGNED_INTEGER(byte);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(octet);
  DOIT_FOR_EXACT_SIGNED_INTEGER(ssize);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(usize);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sintmax);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uintmax);
  DOIT_FOR_EXACT_SIGNED_INTEGER(sintptr);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uintptr);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(mode);
  DOIT_FOR_EXACT_SIGNED_INTEGER(off);
  DOIT_FOR_EXACT_SIGNED_INTEGER(pid);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(uid);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(gid);
  DOIT_FOR_EXACT_SIGNED_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_SIGNED_INTEGER(wchar);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(wint);
  DOIT_FOR_EXACT_SIGNED_INTEGER(time);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(socklen);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(rlim);

  DOIT_FOR_EXACT_UNSIGNED_INTEGER(ino);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(dev);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(nlink);
  DOIT_FOR_EXACT_UNSIGNED_INTEGER(blkcnt);

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


/** --------------------------------------------------------------------
 ** Zero.
 ** ----------------------------------------------------------------- */

static void
test_constant_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)			    \
  {							    \
    auto	op  = mmux_ ## STEM ## _constant_zero();    \
    auto	rop = mmux_ ## STEM ## _literal(0);	    \
    assert(mmux_ ## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    auto	op  = mmux_## STEM ## _constant_zero();	    \
    auto	rop = mmux_## STEM ## _literal(0.0);	    \
    assert(mmux_## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_zero();			\
    auto	rop = mmux_## STEM ## _rectangular_literal(0.0,0.0);	\
    assert(mmux_## STEM ## _equal(op, rop));				\
    dprintf(2," %s,", #STEM);						\
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
  DOIT_FOR_EXACT_INTEGER(ino);
  DOIT_FOR_EXACT_INTEGER(dev);
  DOIT_FOR_EXACT_INTEGER(nlink);
  DOIT_FOR_EXACT_INTEGER(blkcnt);

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
 ** Positive zero.
 ** ----------------------------------------------------------------- */

static void
test_constant_positive_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  {										\
    auto	op  = mmux_## STEM ## _constant_positive_zero();		\
    assert(mmux_## STEM ## _is_positive(op) && mmux_## STEM ## _is_zero(op));	\
    dprintf(2," %s,", #STEM);							\
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


/** --------------------------------------------------------------------
 ** Negative zero.
 ** ----------------------------------------------------------------- */

static void
test_constant_negative_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  {										\
    auto	op  = mmux_## STEM ## _constant_negative_zero();		\
    assert(mmux_## STEM ## _is_negative(op) && mmux_## STEM ## _is_zero(op));	\
    dprintf(2," %s,", #STEM);							\
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


/** --------------------------------------------------------------------
 ** Positive infinity.
 ** ----------------------------------------------------------------- */

static void
test_constant_positive_infinity (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op  = mmux_## STEM ## _constant_positive_infinity();			\
    assert(mmux_## STEM ## _is_positive(op) && mmux_## STEM ## _is_infinite(op));	\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** Negative infinity.
 ** ----------------------------------------------------------------- */

static void
test_constant_negative_infinity (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op  = mmux_## STEM ## _constant_negative_infinity();			\
    assert(mmux_## STEM ## _is_negative(op) && mmux_## STEM ## _is_infinite(op));	\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** One.
 ** ----------------------------------------------------------------- */

static void
test_constant_one (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)			    \
  {							    \
    auto	op  = mmux_ ## STEM ## _constant_one();	    \
    auto	rop = mmux_ ## STEM ## _literal(1);	    \
    assert(mmux_ ## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    auto	op  = mmux_## STEM ## _constant_one();	    \
    auto	rop = mmux_## STEM ## _literal(1.0);	    \
    assert(mmux_## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_one();			\
    auto	rop = mmux_## STEM ## _rectangular_literal(1.0,0.0);	\
    if (0) {								\
      mmux_## STEM ## _dprintf(2, op);					\
    }									\
    assert(mmux_## STEM ## _equal(op, rop));				\
    dprintf(2," %s,", #STEM);						\
  }

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
  DOIT_FOR_EXACT_INTEGER(ino);
  DOIT_FOR_EXACT_INTEGER(dev);
  DOIT_FOR_EXACT_INTEGER(nlink);
  DOIT_FOR_EXACT_INTEGER(blkcnt);

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
 ** Two.
 ** ----------------------------------------------------------------- */

static void
test_constant_two (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)			    \
  {							    \
    auto	op  = mmux_ ## STEM ## _constant_two();	    \
    auto	rop = mmux_ ## STEM ## _literal(2);	    \
    assert(mmux_ ## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    auto	op  = mmux_## STEM ## _constant_two();	    \
    auto	rop = mmux_## STEM ## _literal(2.0);	    \
    assert(mmux_## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_two();			\
    auto	rop = mmux_## STEM ## _rectangular_literal(2.0,0.0);	\
    assert(mmux_## STEM ## _equal(op, rop));				\
    dprintf(2," %s,", #STEM);						\
  }

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
  DOIT_FOR_EXACT_INTEGER(ino);
  DOIT_FOR_EXACT_INTEGER(dev);
  DOIT_FOR_EXACT_INTEGER(nlink);
  DOIT_FOR_EXACT_INTEGER(blkcnt);

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
 ** Ten.
 ** ----------------------------------------------------------------- */

static void
test_constant_ten (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)			    \
  {							    \
    auto	op  = mmux_ ## STEM ## _constant_ten();	    \
    auto	rop = mmux_ ## STEM ## _literal(10);	    \
    assert(mmux_ ## STEM ## _equal(op, rop));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    auto	op  = mmux_## STEM ## _constant_ten();	    \
    auto	rop = mmux_## STEM ## _literal(10.0);	    \
    assert(mmux_## STEM ## _equal(op, rop));		    \
    dprintf(2," flonum%s,", #STEM);			    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_ten();			\
    auto	rop = mmux_## STEM ## _rectangular_literal(10.0,0.0);	\
    if (0) {								\
      mmux_## STEM ## _dprintf(2, op);					\
    }									\
    assert(mmux_## STEM ## _equal(op, rop));				\
    dprintf(2," flonumc%s,", #STEM);					\
  }

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
  DOIT_FOR_EXACT_INTEGER(ino);
  DOIT_FOR_EXACT_INTEGER(dev);
  DOIT_FOR_EXACT_INTEGER(nlink);
  DOIT_FOR_EXACT_INTEGER(blkcnt);

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
 ** One half.
 ** ----------------------------------------------------------------- */

static void
test_constant_one_half (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)					\
  {								\
    auto	op  = mmux_## STEM ## _constant_one_half();	\
    auto	rop = mmux_## STEM ## _literal(0.5);		\
    assert(mmux_## STEM ## _equal(op, rop));			\
    dprintf(2," flonum%s,", #STEM);				\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_one_half();		\
    auto	rop = mmux_## STEM ## _rectangular_literal(0.5,0.0);	\
    assert(mmux_## STEM ## _equal(op, rop));				\
    dprintf(2," flonumc%s,", #STEM);					\
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
 ** One_Third.
 ** ----------------------------------------------------------------- */

static void
test_constant_one_third (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op  = mmux_## STEM ## _constant_one_third();				\
    auto	rop = mmux_## STEM(1.0/3.0);						\
    if (0) {										\
      mmux_## STEM ## _dprintf(2, op);							\
    }											\
    assert(mmux_## STEM ## _equal_relepsilon(op, rop, mmux_##STEM(1e-6)));		\
    dprintf(2," flonum%s,", #STEM);							\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)								\
  {											\
    auto	op  = mmux_## STEM ##_constant_one_third();				\
    auto	rop = mmux_## STEM ##_rectangular(mmux_## STEM ##_part(1.0/3.0),	\
						  mmux_## STEM ##_part(0.0));		\
    auto	eps  = mmux_## STEM ## _rectangular_literal(1e-6,1e-6);			\
    if (0) {										\
      mmux_## STEM ## _dprintf(2, op);							\
    }											\
    assert(mmux_## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," flonumc%s,", #STEM);							\
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
 ** Not-a-Number.
 ** ----------------------------------------------------------------- */

static void
test_constant_nan (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)				    \
  {							    \
    auto	op  = mmux_## STEM ## _constant_nan();	    \
    assert(mmux_ ## STEM ## _is_nan(op));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)						\
  {									\
    auto	op  = mmux_## STEM ## _constant_nan();			\
    assert(mmux_ ## STEM ## _is_nan(op));				\
    dprintf(2," %s,", #STEM);						\
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
 ** E.
 ** ----------------------------------------------------------------- */

static void
test_constant_E (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)							\
  {										\
    auto	op  = mmux_## STEM ## _constant_E();				\
    auto	rop = mmux_## STEM ## _exp(mmux_## STEM ## _constant_one());	\
    auto	eps = mmux_## STEM ## _literal(1e-6);				\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));			\
    dprintf(2," %s,", #STEM);							\
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


/** --------------------------------------------------------------------
 ** log_2(e).
 ** ----------------------------------------------------------------- */

static void
test_constant_LOG2E (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_LOG2E();				\
    auto	e	= mmux_## STEM ## _exp(mmux_## STEM ## _constant_one());	\
    auto	rop	= mmux_## STEM ## _log2(e);					\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** log_10(e).
 ** ----------------------------------------------------------------- */

static void
test_constant_LOG10E (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_LOG10E();				\
    auto	e	= mmux_## STEM ## _exp(mmux_## STEM ## _constant_one());	\
    auto	rop	= mmux_## STEM ## _log10(e);					\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** ln(2).
 ** ----------------------------------------------------------------- */

static void
test_constant_LN2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_LN2();				\
    auto	rop	= mmux_## STEM ## _log(mmux_## STEM ## _constant_two());	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** ln(10).
 ** ----------------------------------------------------------------- */

static void
test_constant_LN10 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_LN10();				\
    auto	rop	= mmux_## STEM ## _log(mmux_## STEM ## _constant_ten());	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** pi.
 ** ----------------------------------------------------------------- */

static void
test_constant_PI (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_PI();				\
    auto	rop	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** pi/2.
 ** ----------------------------------------------------------------- */

static void
test_constant_PI_2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_PI_2();				\
    auto	pi	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	rop	= mmux_## STEM ## _div(pi,mmux_## STEM ## _constant_two());	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** pi/4.
 ** ----------------------------------------------------------------- */

static void
test_constant_PI_4 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_PI_4();				\
    auto	pi	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	rop	= mmux_## STEM ## _div(pi,mmux_## STEM ## _literal(4.0));	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** 1/pi.
 ** ----------------------------------------------------------------- */

static void
test_constant_1_PI (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_1_PI();				\
    auto	pi	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	rop	= mmux_## STEM ## _div(mmux_## STEM ## _constant_one(),pi);	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** 2/pi.
 ** ----------------------------------------------------------------- */

static void
test_constant_2_PI (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_2_PI();				\
    auto	pi	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	rop	= mmux_## STEM ## _div(mmux_## STEM ## _constant_two(),pi);	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** 2/sqrt(pi).
 ** ----------------------------------------------------------------- */

static void
test_constant_2_SQRTPI (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_2_SQRTPI();				\
    auto	pi	= mmux_## STEM ## _acos(mmux_## STEM ## _literal(-1.0));	\
    auto	sqrtpi	= mmux_## STEM ## _sqrt(pi);					\
    auto	rop	= mmux_## STEM ## _div(mmux_## STEM ## _constant_two(),sqrtpi);	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** sqrt(2).
 ** ----------------------------------------------------------------- */

static void
test_constant_SQRT2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_SQRT2();				\
    auto	rop	= mmux_## STEM ## _sqrt(mmux_## STEM ## _constant_two());	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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


/** --------------------------------------------------------------------
 ** sqrt(1/2).
 ** ----------------------------------------------------------------- */

static void
test_constant_SQRT1_2 (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)								\
  {											\
    auto	op	= mmux_## STEM ## _constant_SQRT1_2();				\
    auto	rop	= mmux_## STEM ## _sqrt(mmux_## STEM ## _constant_one_half());	\
    auto	eps	= mmux_## STEM ## _literal(1e-6);				\
    if (0) {										\
      dprintf(2, "\nf(%s): ", #STEM);							\
      mmux_## STEM ## _dprintf(2, op);							\
      dprintf(2, "\n");									\
    }											\
    assert(mmux_ ## STEM ## _equal_relepsilon(op, rop, eps));				\
    dprintf(2," %s,", #STEM);								\
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
test_constant_sizeof (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM)						\
  {								\
    auto	op  = mmux_ ## STEM ## _constant_sizeof();	\
    assert(mmux_ctype_is_positive(op));				\
    if (0) {							\
      dprintf(2,"\nsizeof(%s) = ", #STEM);			\
      mmux_ctype_dprintf(2, op);				\
      dprintf(2,"\n");						\
    }								\
    dprintf(2," %s,", #STEM);					\
  }

  DOIT(pointer);
  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(mode);
  DOIT(off);
  DOIT(pid);
  DOIT(uid);
  DOIT(gid);
  DOIT(ptrdiff);
  DOIT(wchar);
  DOIT(wint);
  DOIT(time);
  DOIT(socklen);
  DOIT(rlim);
  DOIT(ino);
  DOIT(dev);
  DOIT(nlink);
  DOIT(blkcnt);

  DOIT(flonumfl);
  DOIT(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl);
  DOIT(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128);
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

  if (1) {	test_constant_maximum();		}
  if (1) {	test_constant_minimum();		}
  if (1) {	test_constant_zero();			}
  if (1) {	test_constant_positive_zero();		}
  if (1) {	test_constant_negative_zero();		}
  if (1) {	test_constant_positive_infinity();	}
  if (1) {	test_constant_negative_infinity();	}
  if (1) {	test_constant_one();			}
  if (1) {	test_constant_two();			}
  if (1) {	test_constant_ten();			}
  if (1) {	test_constant_one_half();		}
  if (1) {	test_constant_one_third();		}
  if (1) {	test_constant_nan();			}
  if (1) {	test_constant_E();			}
  if (1) {	test_constant_LOG2E();			}
  if (1) {	test_constant_LOG10E();			}
  if (1) {	test_constant_LN2();			}
  if (1) {	test_constant_LN10();			}
  if (1) {	test_constant_PI();			}
  if (1) {	test_constant_PI_2();			}
  if (1) {	test_constant_PI_4();			}
  if (1) {	test_constant_1_PI();			}
  if (1) {	test_constant_2_PI();			}
  if (1) {	test_constant_2_SQRTPI();		}
  if (1) {	test_constant_SQRT2();			}
  if (1) {	test_constant_SQRT1_2();		}
  if (1) {	test_constant_sizeof();			}

  exit(EXIT_SUCCESS);
}

/* end of file */
