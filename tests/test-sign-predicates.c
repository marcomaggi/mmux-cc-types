/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  5, 2025

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
 ** Is zero.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_INTEGER
#define DOIT_INTEGER(STEM)				    \
  {							    \
    auto	valueT = mmux_##STEM##_literal(0);	    \
    auto	valueF = mmux_##STEM##_literal(1);	    \
    assert(true  == mmux_##STEM##_is_zero(valueT));	    \
    assert(false == mmux_##STEM##_is_zero(valueF));	    \
    assert(true  == mmux_ctype_is_zero(valueT));	    \
    assert(false == mmux_ctype_is_zero(valueF));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMR
#define DOIT_FLONUMR(STEM)				    \
  {							    \
    auto	valueT = mmux_##STEM##_literal(0.0);	    \
    auto	valueF = mmux_##STEM##_literal(1.0);	    \
    assert(true  == mmux_##STEM##_is_zero(valueT));	    \
    assert(false == mmux_##STEM##_is_zero(valueF));	    \
    assert(true  == mmux_ctype_is_zero(valueT));	    \
    assert(false == mmux_ctype_is_zero(valueF));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    auto	valueT = mmux_##STEM##_rectangular_literal(0.0,0.0);	\
    auto	valueF = mmux_##STEM##_rectangular_literal(1.0,0.0);	\
    assert(true  == mmux_##STEM##_is_zero(valueT));				\
    assert(false == mmux_##STEM##_is_zero(valueF));				\
    assert(true  == mmux_ctype_is_zero(valueT));				\
    assert(false == mmux_ctype_is_zero(valueF));				\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT_INTEGER(char);
  DOIT_INTEGER(char);
  DOIT_INTEGER(schar);
  DOIT_INTEGER(uchar);
  DOIT_INTEGER(sshort);
  DOIT_INTEGER(ushort);
  DOIT_INTEGER(sint);
  DOIT_INTEGER(uint);
  DOIT_INTEGER(slong);
  DOIT_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_INTEGER(ullong);
#endif
  DOIT_INTEGER(sint8);
  DOIT_INTEGER(uint8);
  DOIT_INTEGER(sint16);
  DOIT_INTEGER(uint16);
  DOIT_INTEGER(sint32);
  DOIT_INTEGER(uint32);
  DOIT_INTEGER(sint64);
  DOIT_INTEGER(uint64);
  DOIT_INTEGER(ssize);
  DOIT_INTEGER(usize);
  DOIT_INTEGER(sintmax);
  DOIT_INTEGER(uintmax);
  DOIT_INTEGER(sintptr);
  DOIT_INTEGER(uintptr);
  DOIT_INTEGER(ptrdiff);
  DOIT_INTEGER(mode);
  DOIT_INTEGER(pid);
  DOIT_INTEGER(uid);
  DOIT_INTEGER(gid);
  DOIT_INTEGER(off);
  DOIT_INTEGER(wchar);
  DOIT_INTEGER(wint);
  DOIT_INTEGER(rlim);
  DOIT_INTEGER(socklen);
  DOIT_INTEGER(time);

  DOIT_FLONUMR(flonumfl);
  DOIT_FLONUMR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUMR(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUMR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUMR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUMR(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUMR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUMR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUMR(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUMR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUMR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUMR(flonumd128);
#endif

  DOIT_FLONUMC(flonumcfl);
  DOIT_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Is positive.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_positive (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1);	    \
    auto	valueB = mmux_##STEM##_literal(0);	    \
    auto	valueC = mmux_##STEM##_literal(-1);	    \
    assert(true  == mmux_##STEM##_is_positive(valueA));	    \
    assert(false == mmux_##STEM##_is_positive(valueB));	    \
    assert(false == mmux_##STEM##_is_positive(valueC));	    \
    assert(true  == mmux_ctype_is_positive(valueA));	    \
    assert(false == mmux_ctype_is_positive(valueB));	    \
    assert(false == mmux_ctype_is_positive(valueC));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1);	    \
    auto	valueB = mmux_##STEM##_literal(0);	    \
    assert(true  == mmux_##STEM##_is_positive(valueA));	    \
    assert(false == mmux_##STEM##_is_positive(valueB));	    \
    assert(true  == mmux_ctype_is_positive(valueA));	    \
    assert(false == mmux_ctype_is_positive(valueB));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMR
#define DOIT_FLONUMR(STEM)				    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1.0);	    \
    auto	valueB = mmux_##STEM##_literal(+0.0);	    \
    auto	valueC = mmux_##STEM##_literal(-0.0);	    \
    auto	valueD = mmux_##STEM##_literal(-1.0);	    \
    assert(true  == mmux_##STEM##_is_positive(valueA));	    \
    assert(true  == mmux_##STEM##_is_positive(valueB));	    \
    assert(false == mmux_##STEM##_is_positive(valueC));	    \
    assert(false == mmux_##STEM##_is_positive(valueD));	    \
    assert(true  == mmux_ctype_is_positive(valueA));	    \
    assert(true  == mmux_ctype_is_positive(valueB));	    \
    assert(false == mmux_ctype_is_positive(valueC));	    \
    assert(false == mmux_ctype_is_positive(valueD));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    auto	valueA = mmux_##STEM##_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_rectangular_literal(-1.0,0.0);	\
    assert(false == mmux_##STEM##_is_positive(valueA));				\
    assert(false == mmux_##STEM##_is_positive(valueB));				\
    assert(false == mmux_##STEM##_is_positive(valueC));				\
    assert(false == mmux_ctype_is_positive(valueA));				\
    assert(false == mmux_ctype_is_positive(valueB));				\
    assert(false == mmux_ctype_is_positive(valueC));				\
    dprintf(2," %s,", #STEM);							\
  }

#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_UNSIGNED_INTEGER(char);
#else
  DOIT_SIGNED_INTEGER(char);
#endif
  DOIT_SIGNED_INTEGER(schar);
  DOIT_UNSIGNED_INTEGER(uchar);
  DOIT_SIGNED_INTEGER(sshort);
  DOIT_UNSIGNED_INTEGER(ushort);
  DOIT_SIGNED_INTEGER(sint);
  DOIT_UNSIGNED_INTEGER(uint);
  DOIT_SIGNED_INTEGER(slong);
  DOIT_UNSIGNED_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_SIGNED_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_UNSIGNED_INTEGER(ullong);
#endif
  DOIT_SIGNED_INTEGER(sint8);
  DOIT_UNSIGNED_INTEGER(uint8);
  DOIT_SIGNED_INTEGER(sint16);
  DOIT_UNSIGNED_INTEGER(uint16);
  DOIT_SIGNED_INTEGER(sint32);
  DOIT_UNSIGNED_INTEGER(uint32);
  DOIT_SIGNED_INTEGER(sint64);
  DOIT_UNSIGNED_INTEGER(uint64);
  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(mode);
  DOIT_UNSIGNED_INTEGER(pid);
  DOIT_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_UNSIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUMR(flonumfl);
  DOIT_FLONUMR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUMR(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUMR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUMR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUMR(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUMR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUMR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUMR(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUMR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUMR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUMR(flonumd128);
#endif

  DOIT_FLONUMC(flonumcfl);
  DOIT_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Is negative.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_negative (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1);	    \
    auto	valueB = mmux_##STEM##_literal(0);	    \
    auto	valueC = mmux_##STEM##_literal(-1);	    \
    assert(false == mmux_##STEM##_is_negative(valueA));	    \
    assert(false == mmux_##STEM##_is_negative(valueB));	    \
    assert(true  == mmux_##STEM##_is_negative(valueC));	    \
    assert(false == mmux_ctype_is_negative(valueA));	    \
    assert(false == mmux_ctype_is_negative(valueB));	    \
    assert(true  == mmux_ctype_is_negative(valueC));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1);	    \
    auto	valueB = mmux_##STEM##_literal(0);	    \
    assert(false == mmux_##STEM##_is_negative(valueA));	    \
    assert(false == mmux_##STEM##_is_negative(valueB));	    \
    assert(false == mmux_ctype_is_negative(valueA));	    \
    assert(false == mmux_ctype_is_negative(valueB));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMR
#define DOIT_FLONUMR(STEM)				    \
  {							    \
    auto	valueA = mmux_##STEM##_literal(+1.0);	    \
    auto	valueB = mmux_##STEM##_literal(+0.0);	    \
    auto	valueC = mmux_##STEM##_literal(-0.0);	    \
    auto	valueD = mmux_##STEM##_literal(-1.0);	    \
    assert(false == mmux_##STEM##_is_negative(valueA));	    \
    assert(false == mmux_##STEM##_is_negative(valueB));	    \
    assert(true  == mmux_##STEM##_is_negative(valueC));	    \
    assert(true  == mmux_##STEM##_is_negative(valueD));	    \
    assert(false == mmux_ctype_is_negative(valueA));	    \
    assert(false == mmux_ctype_is_negative(valueB));	    \
    assert(true  == mmux_ctype_is_negative(valueC));	    \
    assert(true  == mmux_ctype_is_negative(valueD));	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    auto	valueA = mmux_##STEM##_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_rectangular_literal(-1.0,0.0);	\
    assert(false == mmux_##STEM##_is_negative(valueA));				\
    assert(false == mmux_##STEM##_is_negative(valueB));				\
    assert(false == mmux_##STEM##_is_negative(valueC));				\
    assert(false == mmux_ctype_is_negative(valueA));				\
    assert(false == mmux_ctype_is_negative(valueB));				\
    assert(false == mmux_ctype_is_negative(valueC));				\
    dprintf(2," %s,", #STEM);							\
  }

#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_UNSIGNED_INTEGER(char);
#else
  DOIT_SIGNED_INTEGER(char);
#endif
  DOIT_SIGNED_INTEGER(schar);
  DOIT_UNSIGNED_INTEGER(uchar);
  DOIT_SIGNED_INTEGER(sshort);
  DOIT_UNSIGNED_INTEGER(ushort);
  DOIT_SIGNED_INTEGER(sint);
  DOIT_UNSIGNED_INTEGER(uint);
  DOIT_SIGNED_INTEGER(slong);
  DOIT_UNSIGNED_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_SIGNED_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_UNSIGNED_INTEGER(ullong);
#endif
  DOIT_SIGNED_INTEGER(sint8);
  DOIT_UNSIGNED_INTEGER(uint8);
  DOIT_SIGNED_INTEGER(sint16);
  DOIT_UNSIGNED_INTEGER(uint16);
  DOIT_SIGNED_INTEGER(sint32);
  DOIT_UNSIGNED_INTEGER(uint32);
  DOIT_SIGNED_INTEGER(sint64);
  DOIT_UNSIGNED_INTEGER(uint64);
  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(mode);
  DOIT_UNSIGNED_INTEGER(pid);
  DOIT_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_UNSIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUMR(flonumfl);
  DOIT_FLONUMR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUMR(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUMR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUMR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUMR(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUMR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUMR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUMR(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUMR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUMR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUMR(flonumd128);
#endif

  DOIT_FLONUMC(flonumcfl);
  DOIT_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Is non-positive.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_non_positive (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)				\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1);		\
    auto	valueB = mmux_##STEM##_literal(0);		\
    auto	valueC = mmux_##STEM##_literal(-1);		\
    assert(false == mmux_##STEM##_is_non_positive(valueA));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueB));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueC));	\
    assert(false == mmux_ctype_is_non_positive(valueA));	\
    assert(true  == mmux_ctype_is_non_positive(valueB));	\
    assert(true  == mmux_ctype_is_non_positive(valueC));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)				\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1);		\
    auto	valueB = mmux_##STEM##_literal(0);		\
    assert(false == mmux_##STEM##_is_non_positive(valueA));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueB));	\
    assert(false == mmux_ctype_is_non_positive(valueA));	\
    assert(true  == mmux_ctype_is_non_positive(valueB));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_FLONUMR
#define DOIT_FLONUMR(STEM)					\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1.0);		\
    auto	valueB = mmux_##STEM##_literal(+0.0);		\
    auto	valueC = mmux_##STEM##_literal(-0.0);		\
    auto	valueD = mmux_##STEM##_literal(-1.0);		\
    assert(false == mmux_##STEM##_is_non_positive(valueA));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueB));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueC));	\
    assert(true  == mmux_##STEM##_is_non_positive(valueD));	\
    assert(false == mmux_ctype_is_non_positive(valueA));	\
    assert(true  == mmux_ctype_is_non_positive(valueB));	\
    assert(true  == mmux_ctype_is_non_positive(valueC));	\
    assert(true  == mmux_ctype_is_non_positive(valueD));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    auto	valueA = mmux_##STEM##_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_rectangular_literal(-1.0,0.0);	\
    assert(false == mmux_##STEM##_is_non_positive(valueA));			\
    assert(false == mmux_##STEM##_is_non_positive(valueB));			\
    assert(false == mmux_##STEM##_is_non_positive(valueC));			\
    assert(false == mmux_ctype_is_non_positive(valueA));			\
    assert(false == mmux_ctype_is_non_positive(valueB));			\
    assert(false == mmux_ctype_is_non_positive(valueC));			\
    dprintf(2," %s,", #STEM);							\
  }

#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_UNSIGNED_INTEGER(char);
#else
  DOIT_SIGNED_INTEGER(char);
#endif
  DOIT_SIGNED_INTEGER(schar);
  DOIT_UNSIGNED_INTEGER(uchar);
  DOIT_SIGNED_INTEGER(sshort);
  DOIT_UNSIGNED_INTEGER(ushort);
  DOIT_SIGNED_INTEGER(sint);
  DOIT_UNSIGNED_INTEGER(uint);
  DOIT_SIGNED_INTEGER(slong);
  DOIT_UNSIGNED_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_SIGNED_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_UNSIGNED_INTEGER(ullong);
#endif
  DOIT_SIGNED_INTEGER(sint8);
  DOIT_UNSIGNED_INTEGER(uint8);
  DOIT_SIGNED_INTEGER(sint16);
  DOIT_UNSIGNED_INTEGER(uint16);
  DOIT_SIGNED_INTEGER(sint32);
  DOIT_UNSIGNED_INTEGER(uint32);
  DOIT_SIGNED_INTEGER(sint64);
  DOIT_UNSIGNED_INTEGER(uint64);
  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(mode);
  DOIT_UNSIGNED_INTEGER(pid);
  DOIT_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_UNSIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUMR(flonumfl);
  DOIT_FLONUMR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUMR(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUMR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUMR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUMR(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUMR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUMR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUMR(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUMR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUMR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUMR(flonumd128);
#endif

  DOIT_FLONUMC(flonumcfl);
  DOIT_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Is non-negative.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_non_negative (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)				\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1);		\
    auto	valueB = mmux_##STEM##_literal(0);		\
    auto	valueC = mmux_##STEM##_literal(-1);		\
    assert(true  == mmux_##STEM##_is_non_negative(valueA));	\
    assert(true  == mmux_##STEM##_is_non_negative(valueB));	\
    assert(false == mmux_##STEM##_is_non_negative(valueC));	\
    assert(true  == mmux_ctype_is_non_negative(valueA));	\
    assert(true  == mmux_ctype_is_non_negative(valueB));	\
    assert(false == mmux_ctype_is_non_negative(valueC));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)				\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1);		\
    auto	valueB = mmux_##STEM##_literal(0);		\
    assert(true  == mmux_##STEM##_is_non_negative(valueA));	\
    assert(true  == mmux_##STEM##_is_non_negative(valueB));	\
    assert(true  == mmux_ctype_is_non_negative(valueA));	\
    assert(true  == mmux_ctype_is_non_negative(valueB));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_FLONUMR
#define DOIT_FLONUMR(STEM)					\
  {								\
    auto	valueA = mmux_##STEM##_literal(+1.0);		\
    auto	valueB = mmux_##STEM##_literal(+0.0);		\
    auto	valueC = mmux_##STEM##_literal(-0.0);		\
    auto	valueD = mmux_##STEM##_literal(-1.0);		\
    assert(true  == mmux_##STEM##_is_non_negative(valueA));	\
    assert(true  == mmux_##STEM##_is_non_negative(valueB));	\
    assert(true  == mmux_##STEM##_is_non_negative(valueC));	\
    assert(false == mmux_##STEM##_is_non_negative(valueD));	\
    assert(true  == mmux_ctype_is_non_negative(valueA));	\
    assert(true  == mmux_ctype_is_non_negative(valueB));	\
    assert(true  == mmux_ctype_is_non_negative(valueC));	\
    assert(false == mmux_ctype_is_non_negative(valueD));	\
    dprintf(2," %s,", #STEM);					\
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    auto	valueA = mmux_##STEM##_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_rectangular_literal(-1.0,0.0);	\
    assert(false == mmux_##STEM##_is_non_negative(valueA));			\
    assert(false == mmux_##STEM##_is_non_negative(valueB));			\
    assert(false == mmux_##STEM##_is_non_negative(valueC));			\
    assert(false == mmux_ctype_is_non_negative(valueA));			\
    assert(false == mmux_ctype_is_non_negative(valueB));			\
    assert(false == mmux_ctype_is_non_negative(valueC));			\
    dprintf(2," %s,", #STEM);							\
  }

#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT_UNSIGNED_INTEGER(char);
#else
  DOIT_SIGNED_INTEGER(char);
#endif
  DOIT_SIGNED_INTEGER(schar);
  DOIT_UNSIGNED_INTEGER(uchar);
  DOIT_SIGNED_INTEGER(sshort);
  DOIT_UNSIGNED_INTEGER(ushort);
  DOIT_SIGNED_INTEGER(sint);
  DOIT_UNSIGNED_INTEGER(uint);
  DOIT_SIGNED_INTEGER(slong);
  DOIT_UNSIGNED_INTEGER(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_SIGNED_INTEGER(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_UNSIGNED_INTEGER(ullong);
#endif
  DOIT_SIGNED_INTEGER(sint8);
  DOIT_UNSIGNED_INTEGER(uint8);
  DOIT_SIGNED_INTEGER(sint16);
  DOIT_UNSIGNED_INTEGER(uint16);
  DOIT_SIGNED_INTEGER(sint32);
  DOIT_UNSIGNED_INTEGER(uint32);
  DOIT_SIGNED_INTEGER(sint64);
  DOIT_UNSIGNED_INTEGER(uint64);
  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(mode);
  DOIT_UNSIGNED_INTEGER(pid);
  DOIT_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_UNSIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUMR(flonumfl);
  DOIT_FLONUMR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUMR(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUMR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUMR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUMR(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUMR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUMR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUMR(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUMR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUMR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUMR(flonumd128);
#endif

  DOIT_FLONUMC(flonumcfl);
  DOIT_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FLONUMC(flonumcd128);
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

  if (1) {	test_sign_predicate_is_zero();		}
  if (1) {	test_sign_predicate_is_positive();	}
  if (1) {	test_sign_predicate_is_negative();	}
  if (1) {	test_sign_predicate_is_non_positive();	}
  if (1) {	test_sign_predicate_is_non_negative();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
