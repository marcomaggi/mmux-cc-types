/*
  Part of: MMUX CC Tests
  Contents: test file for literal macros
  Date: Sep 12, 2025

  Abstract

	Test file for literal macros.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

#define DOIT_FOR_NUMBER(STEM,LITERAL)					\
  {									\
    if (1) {								\
      constexpr auto	val  = mmux_standard_##STEM##_literal(LITERAL);	\
      auto		stru = mmux_##STEM(val);			\
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(stru));		\
      mmux_ctype_dprintf(2, stru);					\
      dprintf(2, "\n");							\
    }									\
    if (1) {								\
      auto	stru = mmux_##STEM##_literal(LITERAL);			\
      dprintf(2, "%s: ", mmux_ctype_dispatch_typedef(stru));		\
      mmux_ctype_dprintf(2, stru);					\
      dprintf(2, "\n");							\
    }									\
  }

#define DOIT_FOR_EXACT_INTEGER(STEM,LITERAL)		    \
  DOIT_FOR_NUMBER(STEM,LITERAL)

#define DOIT_FOR_FLONUM(STEM,LITERAL)			    \
  DOIT_FOR_NUMBER(STEM,LITERAL)

#define DOIT_FOR_FLONUMC(STEM,LITERAL_RE,LITERAL_IM)							\
  {													\
    if (1) {												\
      auto	val  = mmux_standard_##STEM##_rectangular_literal(LITERAL_RE,LITERAL_IM);		\
      auto	stru = mmux_##STEM(val);								\
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(stru));						\
      mmux_ctype_dprintf(2, stru);									\
      dprintf(2, "\n");											\
    }													\
    if (1) {												\
      auto	stru = mmux_##STEM##_rectangular_literal(LITERAL_RE,LITERAL_IM);			\
      dprintf(2, "%s: ", mmux_ctype_dispatch_typedef(stru));						\
      mmux_ctype_dprintf(2, stru);									\
      dprintf(2, "\n");											\
    }													\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(char,		65);
#ifdef MMUX_CC_TYPES_CHAR_IS_SIGNED
  DOIT_FOR_EXACT_INTEGER(char,		-65);
#endif
  DOIT_FOR_EXACT_INTEGER(schar,		65);
  DOIT_FOR_EXACT_INTEGER(schar,		-65);
  DOIT_FOR_EXACT_INTEGER(uchar,		65);

  DOIT_FOR_EXACT_INTEGER(sshort,	65);
  DOIT_FOR_EXACT_INTEGER(sshort,	-65);
  DOIT_FOR_EXACT_INTEGER(ushort,	65);

  DOIT_FOR_EXACT_INTEGER(sint,		65);
  DOIT_FOR_EXACT_INTEGER(sint,		-65);
  DOIT_FOR_EXACT_INTEGER(uint,		65);

  DOIT_FOR_EXACT_INTEGER(slong,		65);
  DOIT_FOR_EXACT_INTEGER(slong,		-65);
  DOIT_FOR_EXACT_INTEGER(ulong,		65);

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT_FOR_EXACT_INTEGER(sllong,	65);
  DOIT_FOR_EXACT_INTEGER(sllong,	-65);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT_FOR_EXACT_INTEGER(ullong,	65);
#endif

  DOIT_FOR_EXACT_INTEGER(sint8,		65);
  DOIT_FOR_EXACT_INTEGER(sint8,		-65);
  DOIT_FOR_EXACT_INTEGER(uint8,		65);

  DOIT_FOR_EXACT_INTEGER(sint16,	65);
  DOIT_FOR_EXACT_INTEGER(sint16,	-65);
  DOIT_FOR_EXACT_INTEGER(uint16,	65);

  DOIT_FOR_EXACT_INTEGER(sint32,	65);
  DOIT_FOR_EXACT_INTEGER(sint32,	-65);
  DOIT_FOR_EXACT_INTEGER(uint32,	65);

  DOIT_FOR_EXACT_INTEGER(sint64,	65);
  DOIT_FOR_EXACT_INTEGER(sint64,	-65);
  DOIT_FOR_EXACT_INTEGER(uint64,	65);

  DOIT_FOR_EXACT_INTEGER(byte,		65);
  DOIT_FOR_EXACT_INTEGER(byte,		-65);
  DOIT_FOR_EXACT_INTEGER(octet,		65);

  DOIT_FOR_EXACT_INTEGER(sintmax,	65);
  DOIT_FOR_EXACT_INTEGER(sintmax,	-65);
  DOIT_FOR_EXACT_INTEGER(uintmax,	65);

  DOIT_FOR_EXACT_INTEGER(sintptr,	65);
  DOIT_FOR_EXACT_INTEGER(sintptr,	-65);
  DOIT_FOR_EXACT_INTEGER(uintptr,	65);

  DOIT_FOR_EXACT_INTEGER(ssize,		65);
  DOIT_FOR_EXACT_INTEGER(ssize,		-65);
  DOIT_FOR_EXACT_INTEGER(usize,		65);

  DOIT_FOR_EXACT_INTEGER(mode,		65);

  DOIT_FOR_EXACT_INTEGER(off,		65);
  DOIT_FOR_EXACT_INTEGER(off,		-65);

  DOIT_FOR_EXACT_INTEGER(pid,		65);
  DOIT_FOR_EXACT_INTEGER(pid,		-65);

  DOIT_FOR_EXACT_INTEGER(gid,		65);
  DOIT_FOR_EXACT_INTEGER(uid,		65);

  DOIT_FOR_EXACT_INTEGER(ptrdiff,	65);
  DOIT_FOR_EXACT_INTEGER(ptrdiff,	-65);

  DOIT_FOR_EXACT_INTEGER(wchar,		65);
  DOIT_FOR_EXACT_INTEGER(wchar,		-65);

  DOIT_FOR_EXACT_INTEGER(wint,		65);
  DOIT_FOR_EXACT_INTEGER(time,		65);
  DOIT_FOR_EXACT_INTEGER(socklen,	65);
  DOIT_FOR_EXACT_INTEGER(rlim,		65);

  /* ------------------------------------------------------------------ */

  {
#if 0
    DOIT_FOR_FLONUM(flonumfl,		65);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUM(flonumfl,		0.123);
    DOIT_FOR_FLONUM(flonumfl,		12e34);
  }

  {
    DOIT_FOR_FLONUM(flonumdb,		65);		/* VALID no suffix on integer constant !!! */
    DOIT_FOR_FLONUM(flonumdb,		0.123);
    DOIT_FOR_FLONUM(flonumdb,		12e34);
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    DOIT_FOR_FLONUM(flonumldb,		65);		/* VALID no suffix on integer constant !!! */
    DOIT_FOR_FLONUM(flonumldb,		0.123);
    DOIT_FOR_FLONUM(flonumldb,		12e34);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
#if 0
    DOIT_FOR_FLONUM(flonumf32,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf32,		0.123);
    DOIT_FOR_FLONUM(flonumf32,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
#if 0
    DOIT_FOR_FLONUM(flonumf64,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf64,		0.123);
    DOIT_FOR_FLONUM(flonumf64,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
#if 0
    DOIT_FOR_FLONUM(flonumf128,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf128,		0.123);
    DOIT_FOR_FLONUM(flonumf128,		12e34);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
#if 0
    DOIT_FOR_FLONUM(flonumf32x,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf32x,		0.123);
    DOIT_FOR_FLONUM(flonumf32x,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
#if 0
    DOIT_FOR_FLONUM(flonumf64x,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf64x,		0.123);
    DOIT_FOR_FLONUM(flonumf64x,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
#if 0
    DOIT_FOR_FLONUM(flonumf128x,	65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumf128x,	0.123);
    DOIT_FOR_FLONUM(flonumf128x,	12e34);
  }
#endif

/* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
#if 0
    DOIT_FOR_FLONUM(flonumd32,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumd32,		0.123);
    DOIT_FOR_FLONUM(flonumd32,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
#if 0
    DOIT_FOR_FLONUM(flonumd64,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumd64,		0.123);
    DOIT_FOR_FLONUM(flonumd64,		12e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
#if 0
    DOIT_FOR_FLONUM(flonumd128,		65);		/* invalid no suffix on integer constant !!! */
#endif
    DOIT_FOR_FLONUM(flonumd128,		0.123);
    DOIT_FOR_FLONUM(flonumd128,		12e34);
  }
#endif

  /* ------------------------------------------------------------------ */

  {
#if 0
    DOIT_FOR_FLONUMC(flonumcfl,		65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcfl,		0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcfl,		1e23,2e34);
  }

  {
#if 1
    DOIT_FOR_FLONUMC(flonumcdb,		65,78);		/* VALID suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcdb,		0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcdb,		1e23,2e34);
  }

#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  {
#if 1
    DOIT_FOR_FLONUMC(flonumcldb,	65,78);		/* VALID suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcldb,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcldb,	1e23,2e34);
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf32,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf32,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf32,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf64,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf64,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf64,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf128,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf128,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf128,	1e23,2e34);
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf32x,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf32x,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf32x,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf64x,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf64x,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf64x,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcf128x,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcf128x,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcf128x,	1e23,2e34);
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcd32,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcd32,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcd32,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcd64,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcd64,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcd64,	1e23,2e34);
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  {
#if 0
    DOIT_FOR_FLONUMC(flonumcd128,	65,78);		/* invalid suffix on integer constant */
#endif
    DOIT_FOR_FLONUMC(flonumcd128,	0.123,0.456);
    DOIT_FOR_FLONUMC(flonumcd128,	1e23,2e34);
  }
#endif

  /* ------------------------------------------------------------------ */

  exit(EXIT_SUCCESS);
}

/* end of file */
