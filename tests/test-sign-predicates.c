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
    auto	valueT = mmux_##STEM##_make_rectangular_literal(0.0,0.0);	\
    auto	valueF = mmux_##STEM##_make_rectangular_literal(1.0,0.0);	\
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

  DOIT_FLONUMR(float);
  DOIT_FLONUMR(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT_FLONUMR(ldouble);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT_FLONUMR(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT_FLONUMR(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT_FLONUMR(float128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT_FLONUMR(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT_FLONUMR(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT_FLONUMR(float128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT_FLONUMR(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT_FLONUMR(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT_FLONUMR(decimal128);
#endif

  DOIT_FLONUMC(complexf);
  DOIT_FLONUMC(complexd);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT_FLONUMC(complexld);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT_FLONUMC(complexf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT_FLONUMC(complexf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT_FLONUMC(complexf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT_FLONUMC(complexf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT_FLONUMC(complexf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT_FLONUMC(complexf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT_FLONUMC(complexd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT_FLONUMC(complexd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT_FLONUMC(complexd128);
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
    auto	valueA = mmux_##STEM##_make_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_make_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_make_rectangular_literal(-1.0,0.0);	\
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

  DOIT_FLONUMR(float);
  DOIT_FLONUMR(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT_FLONUMR(ldouble);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT_FLONUMR(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT_FLONUMR(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT_FLONUMR(float128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT_FLONUMR(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT_FLONUMR(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT_FLONUMR(float128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT_FLONUMR(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT_FLONUMR(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT_FLONUMR(decimal128);
#endif

  DOIT_FLONUMC(complexf);
  DOIT_FLONUMC(complexd);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT_FLONUMC(complexld);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT_FLONUMC(complexf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT_FLONUMC(complexf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT_FLONUMC(complexf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT_FLONUMC(complexf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT_FLONUMC(complexf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT_FLONUMC(complexf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT_FLONUMC(complexd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT_FLONUMC(complexd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT_FLONUMC(complexd128);
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
    auto	valueA = mmux_##STEM##_make_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_make_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_make_rectangular_literal(-1.0,0.0);	\
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

  DOIT_FLONUMR(float);
  DOIT_FLONUMR(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT_FLONUMR(ldouble);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT_FLONUMR(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT_FLONUMR(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT_FLONUMR(float128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT_FLONUMR(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT_FLONUMR(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT_FLONUMR(float128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT_FLONUMR(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT_FLONUMR(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT_FLONUMR(decimal128);
#endif

  DOIT_FLONUMC(complexf);
  DOIT_FLONUMC(complexd);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT_FLONUMC(complexld);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT_FLONUMC(complexf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT_FLONUMC(complexf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT_FLONUMC(complexf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT_FLONUMC(complexf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT_FLONUMC(complexf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT_FLONUMC(complexf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT_FLONUMC(complexd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT_FLONUMC(complexd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT_FLONUMC(complexd128);
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
    auto	valueA = mmux_##STEM##_make_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_make_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_make_rectangular_literal(-1.0,0.0);	\
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

  DOIT_FLONUMR(float);
  DOIT_FLONUMR(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT_FLONUMR(ldouble);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT_FLONUMR(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT_FLONUMR(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT_FLONUMR(float128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT_FLONUMR(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT_FLONUMR(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT_FLONUMR(float128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT_FLONUMR(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT_FLONUMR(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT_FLONUMR(decimal128);
#endif

  DOIT_FLONUMC(complexf);
  DOIT_FLONUMC(complexd);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT_FLONUMC(complexld);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT_FLONUMC(complexf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT_FLONUMC(complexf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT_FLONUMC(complexf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT_FLONUMC(complexf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT_FLONUMC(complexf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT_FLONUMC(complexf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT_FLONUMC(complexd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT_FLONUMC(complexd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT_FLONUMC(complexd128);
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
    auto	valueA = mmux_##STEM##_make_rectangular_literal(0.0,0.0);	\
    auto	valueB = mmux_##STEM##_make_rectangular_literal(+1.0,0.0);	\
    auto	valueC = mmux_##STEM##_make_rectangular_literal(-1.0,0.0);	\
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

  DOIT_FLONUMR(float);
  DOIT_FLONUMR(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT_FLONUMR(ldouble);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT_FLONUMR(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT_FLONUMR(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT_FLONUMR(float128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT_FLONUMR(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT_FLONUMR(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT_FLONUMR(float128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT_FLONUMR(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT_FLONUMR(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT_FLONUMR(decimal128);
#endif

  DOIT_FLONUMC(complexf);
  DOIT_FLONUMC(complexd);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT_FLONUMC(complexld);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT_FLONUMC(complexf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT_FLONUMC(complexf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT_FLONUMC(complexf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT_FLONUMC(complexf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT_FLONUMC(complexf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT_FLONUMC(complexf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT_FLONUMC(complexd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT_FLONUMC(complexd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT_FLONUMC(complexd128);
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
