/*
  Part of: MMUX CC Tests
  Contents: test for generic macros
  Date: Sep 23, 2025

  Abstract

	Test file for generic macros.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


static void
test_ctype_is_signed (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_signed(value);		\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	false);
#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT(char,	false);
#else
  DOIT(char,	true);
#endif
  DOIT(schar,	true);
  DOIT(uchar,	false);
  DOIT(sshort,	true);
  DOIT(ushort,	false);
  DOIT(sint,	true);
  DOIT(uint,	false);
  DOIT(slong,	true);
  DOIT(ulong,	false);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	false);
#endif
  DOIT(sint8,	true);
  DOIT(uint8,	false);
  DOIT(sint16,	true);
  DOIT(uint16,	false);
  DOIT(sint32,	true);
  DOIT(uint32,	false);
  DOIT(sint64,	true);
  DOIT(uint64,	false);

  DOIT(byte,	true);
  DOIT(octet,	false);
  DOIT(ssize,	true);
  DOIT(usize,	false);
  DOIT(sintmax,	true);
  DOIT(uintmax,	false);
  DOIT(sintptr,	true);
  DOIT(uintptr,	false);
  DOIT(off,	true);
  DOIT(ptrdiff,	true);
  DOIT(wchar,	true);
  DOIT(wint,	false);
  DOIT(time,	true);
  DOIT(socklen,	false);
  DOIT(rlim,	false);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	true);
  DOIT(flonumdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	true);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	true);
  DOIT(flonumcdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	true);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_unsigned (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_unsigned(value);		\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	true);
#ifdef MMUX_CC_TYPES_CHAR_IS_UNSIGNED
  DOIT(char,	true);
#else
  DOIT(char,	false);
#endif
  DOIT(schar,	false);
  DOIT(uchar,	true);
  DOIT(sshort,	false);
  DOIT(ushort,	true);
  DOIT(sint,	false);
  DOIT(uint,	true);
  DOIT(slong,	false);
  DOIT(ulong,	true);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	true);
#endif
  DOIT(sint8,	false);
  DOIT(uint8,	true);
  DOIT(sint16,	false);
  DOIT(uint16,	true);
  DOIT(sint32,	false);
  DOIT(uint32,	true);
  DOIT(sint64,	false);
  DOIT(uint64,	true);

  DOIT(byte,	false);
  DOIT(octet,	true);
  DOIT(ssize,	false);
  DOIT(usize,	true);
  DOIT(sintmax,	false);
  DOIT(uintmax,	true);
  DOIT(sintptr,	false);
  DOIT(uintptr,	true);
  DOIT(off,	false);
  DOIT(ptrdiff,	false);
  DOIT(wchar,	false);
  DOIT(wint,	true);
  DOIT(time,	false);
  DOIT(socklen,	true);
  DOIT(rlim,	true);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	false);
  DOIT(flonumdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	false);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	false);
  DOIT(flonumcdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	false);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_exact_integer (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_exact_integer(value);	\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	true);
  DOIT(char,	true);
  DOIT(schar,	true);
  DOIT(uchar,	true);
  DOIT(sshort,	true);
  DOIT(ushort,	true);
  DOIT(sint,	true);
  DOIT(uint,	true);
  DOIT(slong,	true);
  DOIT(ulong,	true);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	true);
#endif
  DOIT(sint8,	true);
  DOIT(uint8,	true);
  DOIT(sint16,	true);
  DOIT(uint16,	true);
  DOIT(sint32,	true);
  DOIT(uint32,	true);
  DOIT(sint64,	true);
  DOIT(uint64,	true);

  DOIT(byte,	true);
  DOIT(octet,	true);
  DOIT(ssize,	true);
  DOIT(usize,	true);
  DOIT(sintmax,	true);
  DOIT(uintmax,	true);
  DOIT(sintptr,	true);
  DOIT(uintptr,	true);
  DOIT(off,	true);
  DOIT(ptrdiff,	true);
  DOIT(wchar,	true);
  DOIT(wint,	true);
  DOIT(time,	true);
  DOIT(socklen,	true);
  DOIT(rlim,	true);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	false);
  DOIT(flonumdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	false);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	false);
  DOIT(flonumcdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	false);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_real_number (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_real_number(value);	\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	true);
  DOIT(char,	true);
  DOIT(schar,	true);
  DOIT(uchar,	true);
  DOIT(sshort,	true);
  DOIT(ushort,	true);
  DOIT(sint,	true);
  DOIT(uint,	true);
  DOIT(slong,	true);
  DOIT(ulong,	true);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	true);
#endif
  DOIT(sint8,	true);
  DOIT(uint8,	true);
  DOIT(sint16,	true);
  DOIT(uint16,	true);
  DOIT(sint32,	true);
  DOIT(uint32,	true);
  DOIT(sint64,	true);
  DOIT(uint64,	true);

  DOIT(byte,	true);
  DOIT(octet,	true);
  DOIT(ssize,	true);
  DOIT(usize,	true);
  DOIT(sintmax,	true);
  DOIT(uintmax,	true);
  DOIT(sintptr,	true);
  DOIT(uintptr,	true);
  DOIT(off,	true);
  DOIT(ptrdiff,	true);
  DOIT(wchar,	true);
  DOIT(wint,	true);
  DOIT(time,	true);
  DOIT(socklen,	true);
  DOIT(rlim,	true);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	true);
  DOIT(flonumdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	true);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	false);
  DOIT(flonumcdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	false);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_complex_number (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_complex_number(value);	\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	false);
  DOIT(char,	false);
  DOIT(schar,	false);
  DOIT(uchar,	false);
  DOIT(sshort,	false);
  DOIT(ushort,	false);
  DOIT(sint,	false);
  DOIT(uint,	false);
  DOIT(slong,	false);
  DOIT(ulong,	false);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	false);
#endif
  DOIT(sint8,	false);
  DOIT(uint8,	false);
  DOIT(sint16,	false);
  DOIT(uint16,	false);
  DOIT(sint32,	false);
  DOIT(uint32,	false);
  DOIT(sint64,	false);
  DOIT(uint64,	false);

  DOIT(byte,	false);
  DOIT(octet,	false);
  DOIT(ssize,	false);
  DOIT(usize,	false);
  DOIT(sintmax,	false);
  DOIT(uintmax,	false);
  DOIT(sintptr,	false);
  DOIT(uintptr,	false);
  DOIT(off,	false);
  DOIT(ptrdiff,	false);
  DOIT(wchar,	false);
  DOIT(wint,	false);
  DOIT(time,	false);
  DOIT(socklen,	false);
  DOIT(rlim,	false);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	false);
  DOIT(flonumdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	false);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	true);
  DOIT(flonumcdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	true);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_flonumc (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_flonumc(value);		\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	false);
  DOIT(char,	false);
  DOIT(schar,	false);
  DOIT(uchar,	false);
  DOIT(sshort,	false);
  DOIT(ushort,	false);
  DOIT(sint,	false);
  DOIT(uint,	false);
  DOIT(slong,	false);
  DOIT(ulong,	false);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	false);
#endif
  DOIT(sint8,	false);
  DOIT(uint8,	false);
  DOIT(sint16,	false);
  DOIT(uint16,	false);
  DOIT(sint32,	false);
  DOIT(uint32,	false);
  DOIT(sint64,	false);
  DOIT(uint64,	false);

  DOIT(byte,	false);
  DOIT(octet,	false);
  DOIT(ssize,	false);
  DOIT(usize,	false);
  DOIT(sintmax,	false);
  DOIT(uintmax,	false);
  DOIT(sintptr,	false);
  DOIT(uintptr,	false);
  DOIT(off,	false);
  DOIT(ptrdiff,	false);
  DOIT(wchar,	false);
  DOIT(wint,	false);
  DOIT(time,	false);
  DOIT(socklen,	false);
  DOIT(rlim,	false);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	false);
  DOIT(flonumdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	false);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	true);
  DOIT(flonumcdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	true);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_is_flonum (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM,EXPECTED_RESULT)					\
  {									\
    mmux_##STEM##_t	value;						\
    bool		result = mmux_ctype_is_flonum(value);		\
    if (EXPECTED_RESULT != result) {					\
      dprintf(2, "%s: expected ctype_is_signed[%s]=%d, got %d\n",	\
	      __func__, #STEM, EXPECTED_RESULT, result);		\
      exit(EXIT_FAILURE);						\
    }									\
    dprintf(2, " %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DOIT(pointer,	false);
  DOIT(char,	false);
  DOIT(schar,	false);
  DOIT(uchar,	false);
  DOIT(sshort,	false);
  DOIT(ushort,	false);
  DOIT(sint,	false);
  DOIT(uint,	false);
  DOIT(slong,	false);
  DOIT(ulong,	false);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,	false);
#endif
  DOIT(sint8,	false);
  DOIT(uint8,	false);
  DOIT(sint16,	false);
  DOIT(uint16,	false);
  DOIT(sint32,	false);
  DOIT(uint32,	false);
  DOIT(sint64,	false);
  DOIT(uint64,	false);

  DOIT(byte,	false);
  DOIT(octet,	false);
  DOIT(ssize,	false);
  DOIT(usize,	false);
  DOIT(sintmax,	false);
  DOIT(uintmax,	false);
  DOIT(sintptr,	false);
  DOIT(uintptr,	false);
  DOIT(off,	false);
  DOIT(ptrdiff,	false);
  DOIT(wchar,	false);
  DOIT(wint,	false);
  DOIT(time,	false);
  DOIT(socklen,	false);
  DOIT(rlim,	false);

/* ------------------------------------------------------------------ */

  DOIT(flonumfl,	true);
  DOIT(flonumdb,	true);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,	true);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,	true);
#endif

/* ------------------------------------------------------------------ */

  DOIT(flonumcfl,	false);
  DOIT(flonumcdb,	false);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,	false);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,	false);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_add_to_variable (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto	A = mmux_flonumdb(12.34);
    auto	B = mmux_flonumdb(43.21);
    auto	C = mmux_ctype_add(A, B);
    mmux_ctype_add_to_variable(A, B);
    if (mmux_ctype_not_equal(A,C)) {
      dprintf(2, "%s: expected ctype_equal[%s]='", __func__, mmux_ctype_stem_name(A));
      mmux_ctype_dprintf(2, C);
      dprintf(2, "' got '");
      mmux_ctype_dprintf(2, A);
      dprintf(2, "'n");
      exit(EXIT_FAILURE);
    }
    dprintf(2, " %s,", mmux_ctype_stem_name(A));
  }

  dprintf(2, " DONE.\n\n");
}


static void
test_ctype_sub_from_variable (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto	A = mmux_flonumdb(12.34);
    auto	B = mmux_flonumdb(43.21);
    auto	C = mmux_ctype_sub(A, B);
    mmux_ctype_sub_from_variable(A, B);
    if (mmux_ctype_not_equal(A,C)) {
      dprintf(2, "%s: expected ctype_equal[%s]='", __func__, mmux_ctype_stem_name(A));
      mmux_ctype_dprintf(2, C);
      dprintf(2, "' got '");
      mmux_ctype_dprintf(2, A);
      dprintf(2, "'n");
      exit(EXIT_FAILURE);
    }
    dprintf(2, " %s,", mmux_ctype_stem_name(A));
  }

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

  if (1) {	test_ctype_is_signed();		}
  if (1) {	test_ctype_is_unsigned();	}
  if (1) {	test_ctype_is_exact_integer();	}
  if (1) {	test_ctype_is_real_number();	}
  if (1) {	test_ctype_is_complex_number();	}
  if (1) {	test_ctype_is_flonum();		}
  if (1) {	test_ctype_is_flonumc();	}

  if (1) {	test_ctype_add_to_variable();	}
  if (1) {	test_ctype_sub_from_variable();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
