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

static mmux_flonumcfl_t		infinity_flonumcfl_plus_plus;
static mmux_flonumcfl_t		infinity_flonumcfl_plus_minus;
static mmux_flonumcfl_t		infinity_flonumcfl_minus_plus;
static mmux_flonumcfl_t		infinity_flonumcfl_minus_minus;

static mmux_flonumcdb_t		infinity_flonumcdb_plus_plus;
static mmux_flonumcdb_t		infinity_flonumcdb_plus_minus;
static mmux_flonumcdb_t		infinity_flonumcdb_minus_plus;
static mmux_flonumcdb_t		infinity_flonumcdb_minus_minus;

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
static mmux_flonumcldb_t	infinity_flonumcldb_plus_plus;
static mmux_flonumcldb_t	infinity_flonumcldb_plus_minus;
static mmux_flonumcldb_t	infinity_flonumcldb_minus_plus;
static mmux_flonumcldb_t	infinity_flonumcldb_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
static mmux_flonumcf32_t	infinity_flonumcf32_plus_plus;
static mmux_flonumcf32_t	infinity_flonumcf32_plus_minus;
static mmux_flonumcf32_t	infinity_flonumcf32_minus_plus;
static mmux_flonumcf32_t	infinity_flonumcf32_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
static mmux_flonumcf64_t	infinity_flonumcf64_plus_plus;
static mmux_flonumcf64_t	infinity_flonumcf64_plus_minus;
static mmux_flonumcf64_t	infinity_flonumcf64_minus_plus;
static mmux_flonumcf64_t	infinity_flonumcf64_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
static mmux_flonumcf128_t	infinity_flonumcf128_plus_plus;
static mmux_flonumcf128_t	infinity_flonumcf128_plus_minus;
static mmux_flonumcf128_t	infinity_flonumcf128_minus_plus;
static mmux_flonumcf128_t	infinity_flonumcf128_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
static mmux_flonumcf32x_t	infinity_flonumcf32x_plus_plus;
static mmux_flonumcf32x_t	infinity_flonumcf32x_plus_minus;
static mmux_flonumcf32x_t	infinity_flonumcf32x_minus_plus;
static mmux_flonumcf32x_t	infinity_flonumcf32x_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
static mmux_flonumcf64x_t	infinity_flonumcf64x_plus_plus;
static mmux_flonumcf64x_t	infinity_flonumcf64x_plus_minus;
static mmux_flonumcf64x_t	infinity_flonumcf64x_minus_plus;
static mmux_flonumcf64x_t	infinity_flonumcf64x_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
static mmux_flonumcf128x_t	infinity_flonumcf128x_plus_plus;
static mmux_flonumcf128x_t	infinity_flonumcf128x_plus_minus;
static mmux_flonumcf128x_t	infinity_flonumcf128x_minus_plus;
static mmux_flonumcf128x_t	infinity_flonumcf128x_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
static mmux_flonumcd32_t	infinity_flonumcd32_plus_plus;
static mmux_flonumcd32_t	infinity_flonumcd32_plus_minus;
static mmux_flonumcd32_t	infinity_flonumcd32_minus_plus;
static mmux_flonumcd32_t	infinity_flonumcd32_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
static mmux_flonumcd64_t	infinity_flonumcd64_plus_plus;
static mmux_flonumcd64_t	infinity_flonumcd64_plus_minus;
static mmux_flonumcd64_t	infinity_flonumcd64_minus_plus;
static mmux_flonumcd64_t	infinity_flonumcd64_minus_minus;
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
static mmux_flonumcd128_t	infinity_flonumcd128_plus_plus;
static mmux_flonumcd128_t	infinity_flonumcd128_plus_minus;
static mmux_flonumcd128_t	infinity_flonumcd128_minus_plus;
static mmux_flonumcd128_t	infinity_flonumcd128_minus_minus;
#endif


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

static void
initialise_constants (void)
{
  infinity_flonumcfl_plus_plus		= mmux_flonumcfl_constant_positive_positive_infinity();
  infinity_flonumcfl_plus_minus		= mmux_flonumcfl_constant_positive_negative_infinity();
  infinity_flonumcfl_minus_plus		= mmux_flonumcfl_constant_negative_positive_infinity();
  infinity_flonumcfl_minus_minus	= mmux_flonumcfl_constant_negative_negative_infinity();

  infinity_flonumcdb_plus_plus		= mmux_flonumcdb_constant_positive_positive_infinity();
  infinity_flonumcdb_plus_minus		= mmux_flonumcdb_constant_positive_negative_infinity();
  infinity_flonumcdb_minus_plus		= mmux_flonumcdb_constant_negative_positive_infinity();
  infinity_flonumcdb_minus_minus	= mmux_flonumcdb_constant_negative_negative_infinity();

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  infinity_flonumcldb_plus_plus		= mmux_flonumcldb_constant_positive_positive_infinity();
  infinity_flonumcldb_plus_minus	= mmux_flonumcldb_constant_positive_negative_infinity();
  infinity_flonumcldb_minus_plus	= mmux_flonumcldb_constant_negative_positive_infinity();
  infinity_flonumcldb_minus_minus	= mmux_flonumcldb_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  infinity_flonumcf32_plus_plus		= mmux_flonumcf32_constant_positive_positive_infinity();
  infinity_flonumcf32_plus_minus	= mmux_flonumcf32_constant_positive_negative_infinity();
  infinity_flonumcf32_minus_plus	= mmux_flonumcf32_constant_negative_positive_infinity();
  infinity_flonumcf32_minus_minus	= mmux_flonumcf32_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  infinity_flonumcf64_plus_plus		= mmux_flonumcf64_constant_positive_positive_infinity();
  infinity_flonumcf64_plus_minus	= mmux_flonumcf64_constant_positive_negative_infinity();
  infinity_flonumcf64_minus_plus	= mmux_flonumcf64_constant_negative_positive_infinity();
  infinity_flonumcf64_minus_minus	= mmux_flonumcf64_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  infinity_flonumcf128_plus_plus	= mmux_flonumcf128_constant_positive_positive_infinity();
  infinity_flonumcf128_plus_minus	= mmux_flonumcf128_constant_positive_negative_infinity();
  infinity_flonumcf128_minus_plus	= mmux_flonumcf128_constant_negative_positive_infinity();
  infinity_flonumcf128_minus_minus	= mmux_flonumcf128_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  infinity_flonumcf32x_plus_plus	= mmux_flonumcf32x_constant_positive_positive_infinity();
  infinity_flonumcf32x_plus_minus	= mmux_flonumcf32x_constant_positive_negative_infinity();
  infinity_flonumcf32x_minus_plus	= mmux_flonumcf32x_constant_negative_positive_infinity();
  infinity_flonumcf32x_minus_minus	= mmux_flonumcf32x_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  infinity_flonumcf64x_plus_plus	= mmux_flonumcf64x_constant_positive_positive_infinity();
  infinity_flonumcf64x_plus_minus	= mmux_flonumcf64x_constant_positive_negative_infinity();
  infinity_flonumcf64x_minus_plus	= mmux_flonumcf64x_constant_negative_positive_infinity();
  infinity_flonumcf64x_minus_minus	= mmux_flonumcf64x_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  infinity_flonumcf128x_plus_plus	= mmux_flonumcf128x_constant_positive_positive_infinity();
  infinity_flonumcf128x_plus_minus	= mmux_flonumcf128x_constant_positive_negative_infinity();
  infinity_flonumcf128x_minus_plus	= mmux_flonumcf128x_constant_negative_positive_infinity();
  infinity_flonumcf128x_minus_minus	= mmux_flonumcf128x_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  infinity_flonumcd32_plus_plus		= mmux_flonumcd32_constant_positive_positive_infinity();
  infinity_flonumcd32_plus_minus	= mmux_flonumcd32_constant_positive_negative_infinity();
  infinity_flonumcd32_minus_plus	= mmux_flonumcd32_constant_negative_positive_infinity();
  infinity_flonumcd32_minus_minus	= mmux_flonumcd32_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  infinity_flonumcd64_plus_plus		= mmux_flonumcd64_constant_positive_positive_infinity();
  infinity_flonumcd64_plus_minus	= mmux_flonumcd64_constant_positive_negative_infinity();
  infinity_flonumcd64_minus_plus	= mmux_flonumcd64_constant_negative_positive_infinity();
  infinity_flonumcd64_minus_minus	= mmux_flonumcd64_constant_negative_negative_infinity();
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  infinity_flonumcd128_plus_plus	= mmux_flonumcd128_constant_positive_positive_infinity();
  infinity_flonumcd128_plus_minus	= mmux_flonumcd128_constant_positive_negative_infinity();
  infinity_flonumcd128_minus_plus	= mmux_flonumcd128_constant_negative_positive_infinity();
  infinity_flonumcd128_minus_minus	= mmux_flonumcd128_constant_negative_negative_infinity();
#endif
}


/** --------------------------------------------------------------------
 ** Is zero.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)		    \
  {							    \
    auto	A = mmux_##STEM##_##CTOR;		    \
    auto	R = RESULT;				    \
    assert(R == mmux_##STEM##_is_zero(A));		    \
    assert(R == mmux_ctype_is_zero(A));			    \
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_negative_infinity());	\
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
  DOIT_SIGNED_INTEGER(pid);
  DOIT_UNSIGNED_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUM(flonumfl);
  DOIT_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUM(flonumd128);
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
    auto	A = mmux_##STEM##_literal(+1);		    \
    auto	B = mmux_##STEM##_literal(0);		    \
    auto	C = mmux_##STEM##_literal(-1);		    \
    assert(true  == mmux_##STEM##_is_positive(A));	    \
    assert(false == mmux_##STEM##_is_positive(B));	    \
    assert(false == mmux_##STEM##_is_positive(C));	    \
    assert(true  == mmux_ctype_is_positive(A));		    \
    assert(false == mmux_ctype_is_positive(B));		    \
    assert(false == mmux_ctype_is_positive(C));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    auto	A = mmux_##STEM##_literal(+1);		    \
    auto	B = mmux_##STEM##_literal(0);		    \
    assert(true  == mmux_##STEM##_is_positive(A));	    \
    assert(false == mmux_##STEM##_is_positive(B));	    \
    assert(true  == mmux_ctype_is_positive(A));		    \
    assert(false == mmux_ctype_is_positive(B));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)				    \
  {							    \
    auto	A = mmux_##STEM##_literal(+1.0);	    \
    auto	B = mmux_##STEM##_literal(+0.0);	    \
    auto	C = mmux_##STEM##_literal(-0.0);	    \
    auto	D = mmux_##STEM##_literal(-1.0);	    \
    assert(true  == mmux_##STEM##_is_positive(A));	    \
    assert(true  == mmux_##STEM##_is_positive(B));	    \
    assert(false == mmux_##STEM##_is_positive(C));	    \
    assert(false == mmux_##STEM##_is_positive(D));	    \
    assert(true  == mmux_ctype_is_positive(A));		    \
    assert(true  == mmux_ctype_is_positive(B));		    \
    assert(false == mmux_ctype_is_positive(C));		    \
    assert(false == mmux_ctype_is_positive(D));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)						\
  {									\
    auto	A = mmux_##STEM##_rectangular_literal( 0.0, 0.0);	\
    auto	B = mmux_##STEM##_rectangular_literal(+0.0,+0.0);	\
    auto	C = mmux_##STEM##_rectangular_literal(-0.0,-0.0);	\
    auto	D = mmux_##STEM##_rectangular_literal(+0.0,-0.0);	\
    auto	E = mmux_##STEM##_rectangular_literal(-0.0,+0.0);	\
    auto	F = mmux_##STEM##_rectangular_literal(+1.0, 0.0);	\
    auto	G = mmux_##STEM##_rectangular_literal(-1.0, 0.0);	\
    auto	H = mmux_##STEM##_rectangular_literal( 0.0,+1.0);	\
    auto	J = mmux_##STEM##_rectangular_literal( 0.0,-1.0);	\
    auto	K = mmux_##STEM##_rectangular_literal(-1.0,-1.0);	\
    auto	L = mmux_##STEM##_rectangular_literal(+1.0,-1.0);	\
    auto	M = mmux_##STEM##_rectangular_literal(-1.0,+1.0);	\
    auto	N = mmux_##STEM##_rectangular_literal(+1.0,+1.0);	\
    auto	O = mmux_##STEM##_constant_nan();			\
    assert(true  == mmux_##STEM##_is_positive(A));			\
    assert(true  == mmux_##STEM##_is_positive(B));			\
    assert(false == mmux_##STEM##_is_positive(C));			\
    assert(false == mmux_##STEM##_is_positive(D));			\
    assert(false == mmux_##STEM##_is_positive(E));			\
    assert(true  == mmux_##STEM##_is_positive(F));			\
    assert(false == mmux_##STEM##_is_positive(G));			\
    assert(true  == mmux_##STEM##_is_positive(H));			\
    assert(false == mmux_##STEM##_is_positive(J));			\
    assert(false == mmux_##STEM##_is_positive(K));			\
    assert(false == mmux_##STEM##_is_positive(L));			\
    assert(false == mmux_##STEM##_is_positive(M));			\
    assert(true  == mmux_##STEM##_is_positive(N));			\
    assert(false == mmux_##STEM##_is_positive(O));			\
    assert(true  == mmux_ctype_is_positive(A));				\
    assert(true  == mmux_ctype_is_positive(B));				\
    assert(false == mmux_ctype_is_positive(C));				\
    assert(false == mmux_ctype_is_positive(D));				\
    assert(false == mmux_ctype_is_positive(E));				\
    assert(true  == mmux_ctype_is_positive(F));				\
    assert(false == mmux_ctype_is_positive(G));				\
    assert(true  == mmux_ctype_is_positive(H));				\
    assert(false == mmux_ctype_is_positive(J));				\
    assert(false == mmux_ctype_is_positive(K));				\
    assert(false == mmux_ctype_is_positive(L));				\
    assert(false == mmux_ctype_is_positive(M));				\
    assert(true  == mmux_ctype_is_positive(N));				\
    assert(false == mmux_ctype_is_positive(O));				\
    dprintf(2," %s,", #STEM);						\
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
  DOIT_UNSIGNED_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUM(flonumfl);
  DOIT_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUM(flonumd128);
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
    auto	A = mmux_##STEM##_literal(+1);		    \
    auto	B = mmux_##STEM##_literal(0);		    \
    auto	C = mmux_##STEM##_literal(-1);		    \
    assert(false == mmux_##STEM##_is_negative(A));	    \
    assert(false == mmux_##STEM##_is_negative(B));	    \
    assert(true  == mmux_##STEM##_is_negative(C));	    \
    assert(false == mmux_ctype_is_negative(A));		    \
    assert(false == mmux_ctype_is_negative(B));		    \
    assert(true  == mmux_ctype_is_negative(C));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    auto	A = mmux_##STEM##_literal(+1);		    \
    auto	B = mmux_##STEM##_literal(0);		    \
    assert(false == mmux_##STEM##_is_negative(A));	    \
    assert(false == mmux_##STEM##_is_negative(B));	    \
    assert(false == mmux_ctype_is_negative(A));		    \
    assert(false == mmux_ctype_is_negative(B));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)				    \
  {							    \
    auto	A = mmux_##STEM##_literal(+1.0);	    \
    auto	B = mmux_##STEM##_literal(+0.0);	    \
    auto	C = mmux_##STEM##_literal(-0.0);	    \
    auto	D = mmux_##STEM##_literal(-1.0);	    \
    assert(false == mmux_##STEM##_is_negative(A));	    \
    assert(false == mmux_##STEM##_is_negative(B));	    \
    assert(true  == mmux_##STEM##_is_negative(C));	    \
    assert(true  == mmux_##STEM##_is_negative(D));	    \
    assert(false == mmux_ctype_is_negative(A));		    \
    assert(false == mmux_ctype_is_negative(B));		    \
    assert(true  == mmux_ctype_is_negative(C));		    \
    assert(true  == mmux_ctype_is_negative(D));		    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)						\
  {									\
    auto	A = mmux_##STEM##_rectangular_literal( 0.0, 0.0);	\
    auto	B = mmux_##STEM##_rectangular_literal(+0.0,+0.0);	\
    auto	C = mmux_##STEM##_rectangular_literal(-0.0,-0.0);	\
    auto	D = mmux_##STEM##_rectangular_literal(+0.0,-0.0);	\
    auto	E = mmux_##STEM##_rectangular_literal(-0.0,+0.0);	\
    auto	F = mmux_##STEM##_rectangular_literal(+1.0, 0.0);	\
    auto	G = mmux_##STEM##_rectangular_literal(-1.0, 0.0);	\
    auto	H = mmux_##STEM##_rectangular_literal( 0.0,+1.0);	\
    auto	J = mmux_##STEM##_rectangular_literal( 0.0,-1.0);	\
    auto	K = mmux_##STEM##_rectangular_literal(-1.0,-1.0);	\
    auto	L = mmux_##STEM##_rectangular_literal(+1.0,-1.0);	\
    auto	M = mmux_##STEM##_rectangular_literal(-1.0,+1.0);	\
    auto	N = mmux_##STEM##_rectangular_literal(+1.0,+1.0);	\
    auto	O = mmux_##STEM##_constant_nan();			\
    assert(true  == mmux_##STEM##_is_negative(A));			\
    assert(true  == mmux_##STEM##_is_negative(B));			\
    assert(false == mmux_##STEM##_is_negative(C));			\
    assert(false == mmux_##STEM##_is_negative(D));			\
    assert(false == mmux_##STEM##_is_negative(E));			\
    assert(true  == mmux_##STEM##_is_negative(F));			\
    assert(false == mmux_##STEM##_is_negative(G));			\
    assert(true  == mmux_##STEM##_is_negative(H));			\
    assert(false == mmux_##STEM##_is_negative(J));			\
    assert(false == mmux_##STEM##_is_negative(K));			\
    assert(false == mmux_##STEM##_is_negative(L));			\
    assert(false == mmux_##STEM##_is_negative(M));			\
    assert(true  == mmux_##STEM##_is_negative(N));			\
    assert(false == mmux_##STEM##_is_negative(O));			\
    assert(true  == mmux_ctype_is_negative(A));				\
    assert(true  == mmux_ctype_is_negative(B));				\
    assert(false == mmux_ctype_is_negative(C));				\
    assert(false == mmux_ctype_is_negative(D));				\
    assert(false == mmux_ctype_is_negative(E));				\
    assert(true  == mmux_ctype_is_negative(F));				\
    assert(false == mmux_ctype_is_negative(G));				\
    assert(true  == mmux_ctype_is_negative(H));				\
    assert(false == mmux_ctype_is_negative(J));				\
    assert(false == mmux_ctype_is_negative(K));				\
    assert(false == mmux_ctype_is_negative(L));				\
    assert(false == mmux_ctype_is_negative(M));				\
    assert(true  == mmux_ctype_is_negative(N));				\
    assert(false == mmux_ctype_is_negative(O));				\
    dprintf(2," %s,", #STEM);						\
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
  DOIT_UNSIGNED_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUM(flonumfl);
  DOIT_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUM(flonumd128);
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

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)					\
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
  DOIT_UNSIGNED_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUM(flonumfl);
  DOIT_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUM(flonumd128);
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

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)					\
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
  DOIT_UNSIGNED_INTEGER(uid);
  DOIT_UNSIGNED_INTEGER(gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(rlim);
  DOIT_UNSIGNED_INTEGER(socklen);
  DOIT_UNSIGNED_INTEGER(time);

  DOIT_FLONUM(flonumfl);
  DOIT_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FLONUM(flonumd128);
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
  initialise_constants();

  if (1) {	test_sign_predicate_is_zero();		}
  if (1) {	test_sign_predicate_is_positive();	}
  if (1) {	test_sign_predicate_is_negative();	}
  if (1) {	test_sign_predicate_is_non_positive();	}
  if (1) {	test_sign_predicate_is_non_negative();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
