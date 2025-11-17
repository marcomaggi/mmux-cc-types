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

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Is zero.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_zero (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_zero(op);				\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_zero(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_zero(mmux_##STEM##_##CTOR));	\
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
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_zero());		\
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
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_SIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_positive(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_positive(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_positive(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_UNSIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_negative(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_negative(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_negative(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_UNSIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)					\
  {										\
    if (0) {									\
      auto	op = mmux_##STEM##_##CTOR;					\
      bool	rv = mmux_##STEM##_is_non_positive(op);				\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);			\
      mmux_##STEM##_dprintf(2, op);						\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));			\
    }										\
    assert(RESULT == mmux_##STEM##_is_non_positive(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_non_positive(mmux_##STEM##_##CTOR));		\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1));	    \
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
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_infinity());	\
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
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_UNSIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)					\
  {										\
    if (0) {									\
      auto	op = mmux_##STEM##_##CTOR;					\
      bool	rv = mmux_##STEM##_is_non_negative(op);				\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);			\
      mmux_##STEM##_dprintf(2, op);						\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));			\
    }										\
    assert(RESULT == mmux_##STEM##_is_non_negative(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_non_negative(mmux_##STEM##_##CTOR));		\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_infinity());	\
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
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_UNSIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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
 ** Is finite.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_finite (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_finite(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_finite(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_finite(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_zero());		\
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
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_SIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(clock);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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
 ** Is infinite.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_infinite (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_infinite(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_infinite(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_infinite(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_SIGNED_INTEGER
#define DOIT_SIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_UNSIGNED_INTEGER
#define DOIT_UNSIGNED_INTEGER(STEM)			    \
  {							    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1));	    \
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());	    \
    dprintf(2," %s,", #STEM);				    \
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,true ,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
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

  DOIT_SIGNED_INTEGER(byte);
  DOIT_UNSIGNED_INTEGER(octet);

  DOIT_SIGNED_INTEGER(ssize);
  DOIT_UNSIGNED_INTEGER(usize);
  DOIT_SIGNED_INTEGER(sintmax);
  DOIT_UNSIGNED_INTEGER(uintmax);
  DOIT_SIGNED_INTEGER(sintptr);
  DOIT_UNSIGNED_INTEGER(uintptr);
  DOIT_SIGNED_INTEGER(ptrdiff);
  DOIT_UNSIGNED_INTEGER(libc_mode);
  DOIT_SIGNED_INTEGER(libc_pid);
  DOIT_UNSIGNED_INTEGER(libc_uid);
  DOIT_UNSIGNED_INTEGER(libc_gid);
  DOIT_SIGNED_INTEGER(off);
  DOIT_SIGNED_INTEGER(wchar);
  DOIT_UNSIGNED_INTEGER(wint);
  DOIT_UNSIGNED_INTEGER(libc_rlim);
  DOIT_UNSIGNED_INTEGER(libc_socklen);
  DOIT_SIGNED_INTEGER(time);
  DOIT_SIGNED_INTEGER(time);
  DOIT_UNSIGNED_INTEGER(libc_ino);
  DOIT_UNSIGNED_INTEGER(libc_dev);
  DOIT_UNSIGNED_INTEGER(libc_nlink);
  DOIT_UNSIGNED_INTEGER(libc_blkcnt);

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
 ** Is normal.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_normal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_normal(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_normal(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_normal(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,true ,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-1.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,-1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(-1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,true ,rectangular_literal(+1.0,+1.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());				\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_negative_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
    dprintf(2," %s,", #STEM);							\
  }

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
 ** Is subnormal.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_subnormal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,RESULT,CTOR)				\
  {									\
    if (0) {								\
      auto	op = mmux_##STEM##_##CTOR;				\
      bool	rv = mmux_##STEM##_is_subnormal(op);			\
      dprintf(2, "\n%s: stem='%s': number='", __func__, #STEM);		\
      mmux_##STEM##_dprintf(2, op);					\
      dprintf(2, "' result='%s'\n", ((rv)? "true" : "false"));		\
    }									\
    assert(RESULT == mmux_##STEM##_is_subnormal(mmux_##STEM##_##CTOR));	\
    assert(RESULT == mmux_ctype_is_subnormal(mmux_##STEM##_##CTOR));	\
  }

#undef  DOIT_FLONUM
#define DOIT_FLONUM(STEM)						\
  {									\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal( 0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-0.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(+1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,literal(-1.0));			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_zero());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_zero());		\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_nan());			\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_positive_infinity());	\
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_negative_infinity());	\
    dprintf(2," %s,", #STEM);						\
 }

#undef  DOIT_FLONUMC
#define DOIT_FLONUMC(STEM)							\
  {										\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal( 0.0, 0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,+0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(+0.0,-0.0));		\
    DOIT_FOR_THIS_NUMBER(STEM,false,rectangular_literal(-0.0,+0.0));		\
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
    DOIT_FOR_THIS_NUMBER(STEM,false,constant_imag());				\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT_FOR_THIS_NUMBER(flonumfl,true ,literal(0x0.FFFFFEp-126));
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
  test_set_output_formats();

  if (1) {	test_sign_predicate_is_zero();		}
  if (1) {	test_sign_predicate_is_positive();	}
  if (1) {	test_sign_predicate_is_negative();	}
  if (1) {	test_sign_predicate_is_non_positive();	}
  if (1) {	test_sign_predicate_is_non_negative();	}
  if (1) {	test_sign_predicate_is_finite();	}
  if (1) {	test_sign_predicate_is_infinite();	}
  if (1) {	test_sign_predicate_is_normal();	}
  if (1) {	test_sign_predicate_is_subnormal();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
