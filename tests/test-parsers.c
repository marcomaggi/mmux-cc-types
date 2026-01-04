/*
  Part of: MMUX CC Tests
  Contents: test for version functions
  Date: Aug 12, 2025

  Abstract

	Test file for version functions.

  Copyright (C) 2024, 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>

#define DOIT(STEM,INPUTSTR)	 {								\
    char *	str = INPUTSTR;									\
    mmux_ ## STEM ## _t	value;									\
												\
    if (true == mmux_ ## STEM ## _parse(&value, str, __func__)) {				\
      fprintf(stderr, "%s: failed to parse: '%s'\n", __func__, str);				\
      exit(EXIT_FAILURE);									\
    } else {											\
      fprintf(stderr, "%s: correctly parsed '%s' input '%s' to: '", __func__, #STEM, str);	\
      mmux_cc_types_ignore_retval(mmux_ ## STEM ## _fprintf(stderr, value));			\
      fprintf(stderr, "'\n");									\
    }												\
  }

#define DOIT_VALUE(STEM,INPUT_VALUE)							\
  {											\
    auto	buflen = mmux_usize(4096);						\
    char	bufptr[buflen.value];							\
    mmux_cc_types_ignore_retval(mmux_ ## STEM ## _sprint(bufptr, buflen, INPUT_VALUE));	\
    DOIT(STEM,bufptr);									\
  }


/** --------------------------------------------------------------------
 ** Pointers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_pointer (void)
{
  DOIT(pointer,"0");
  DOIT(pointer,"123");
  DOIT(pointer,"0x0");
  DOIT(pointer,"0xFFFFFF");
  DOIT_VALUE(pointer,mmux_pointer_constant_minimum());
  DOIT_VALUE(pointer,mmux_pointer_constant_maximum());
}


/** --------------------------------------------------------------------
 ** Characters.
 ** ----------------------------------------------------------------- */

static void
test_sprint_char (void)
{
  return;
  DOIT(char,"0");
  DOIT(char,"123");
  if (mmux_char_is_unsigned()) {
    DOIT(char,"255");
  } else {
    DOIT(char,"-1");
    DOIT(char,"-12");
    DOIT(char,"-128");
  }
  DOIT_VALUE(char,mmux_char_constant_minimum());
  DOIT_VALUE(char,mmux_char_constant_maximum());
}
static void
test_sprint_schar (void)
{
  DOIT(schar,"0");
  DOIT(schar,"123");
  DOIT(schar,"-1");
  DOIT(schar,"-12");
  DOIT(schar,"-128");
  DOIT_VALUE(schar,mmux_schar_constant_minimum());
  DOIT_VALUE(schar,mmux_schar_constant_maximum());
}
static void
test_sprint_uchar (void)
{
  DOIT(uchar,"0");
  DOIT(uchar,"123");
  DOIT(uchar,"255");
  DOIT_VALUE(uchar,mmux_uchar_constant_minimum());
  DOIT_VALUE(uchar,mmux_uchar_constant_maximum());
}


/** --------------------------------------------------------------------
 ** Exact integers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_sshort (void)
{
  DOIT(sshort,"0");
  DOIT(sshort,"123");
  DOIT(sshort,"-1");
  DOIT(sshort,"-12");
  DOIT(sshort,"-128");
  DOIT_VALUE(sshort,mmux_sshort_constant_minimum());
  DOIT_VALUE(sshort,mmux_sshort_constant_maximum());
}
static void
test_sprint_ushort (void)
{
  DOIT(ushort,"0");
  DOIT(ushort,"123");
  DOIT(ushort,"255");
  DOIT_VALUE(ushort,mmux_ushort_constant_minimum());
  DOIT_VALUE(ushort,mmux_ushort_constant_maximum());
}
static void
test_sprint_sint (void)
{
  DOIT(sint,"0");
  DOIT(sint,"123");
  DOIT(sint,"-1");
  DOIT(sint,"-12");
  DOIT(sint,"-128");
  DOIT_VALUE(sint,mmux_sint_constant_minimum());
  DOIT_VALUE(sint,mmux_sint_constant_maximum());
}
static void
test_sprint_uint (void)
{
  DOIT(uint,"0");
  DOIT(uint,"123");
  DOIT(uint,"255");
  DOIT_VALUE(uint,mmux_uint_constant_minimum());
  DOIT_VALUE(uint,mmux_uint_constant_maximum());
}
static void
test_sprint_slong (void)
{
  DOIT(slong,"0");
  DOIT(slong,"123");
  DOIT(slong,"-1");
  DOIT(slong,"-12");
  DOIT(slong,"-128");
  DOIT_VALUE(slong,mmux_slong_constant_minimum());
  DOIT_VALUE(slong,mmux_slong_constant_maximum());
}
static void
test_sprint_ulong (void)
{
  DOIT(ulong,"0");
  DOIT(ulong,"123");
  DOIT(ulong,"255");
  DOIT_VALUE(ulong,mmux_ulong_constant_minimum());
  DOIT_VALUE(ulong,mmux_ulong_constant_maximum());
}
static void
test_sprint_sllong (void)
{
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong,"0");
  DOIT(sllong,"123");
  DOIT(sllong,"-1");
  DOIT(sllong,"-12");
  DOIT(sllong,"-128");
  DOIT_VALUE(sllong,mmux_sllong_constant_minimum());
  DOIT_VALUE(sllong,mmux_sllong_constant_maximum());
#endif
}
static void
test_sprint_ullong (void)
{
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,"0");
  DOIT(ullong,"123");
  DOIT(ullong,"255");
  DOIT_VALUE(ullong,mmux_ullong_constant_minimum());
  DOIT_VALUE(ullong,mmux_ullong_constant_maximum());
#endif
}
static void
test_sprint_sint8 (void)
{
  DOIT(sint8,"0");
  DOIT(sint8,"123");
  DOIT(sint8,"-1");
  DOIT(sint8,"-12");
  DOIT(sint8,"-128");
  DOIT_VALUE(sint8,mmux_sint8_constant_minimum());
  DOIT_VALUE(sint8,mmux_sint8_constant_maximum());
}
static void
test_sprint_uint8 (void)
{
  DOIT(uint8,"0");
  DOIT(uint8,"123");
  DOIT(uint8,"255");
  DOIT_VALUE(uint8,mmux_uint8_constant_minimum());
  DOIT_VALUE(uint8,mmux_uint8_constant_maximum());
}
static void
test_sprint_sint16 (void)
{
  DOIT(sint16,"0");
  DOIT(sint16,"123");
  DOIT(sint16,"-1");
  DOIT(sint16,"-12");
  DOIT(sint16,"-128");
  DOIT_VALUE(sint16,mmux_sint16_constant_minimum());
  DOIT_VALUE(sint16,mmux_sint16_constant_maximum());
}
static void
test_sprint_uint16 (void)
{
  DOIT(uint16,"0");
  DOIT(uint16,"123");
  DOIT(uint16,"255");
  DOIT_VALUE(uint16,mmux_uint16_constant_minimum());
  DOIT_VALUE(uint16,mmux_uint16_constant_maximum());
}
static void
test_sprint_sint32 (void)
{
  DOIT(sint32,"0");
  DOIT(sint32,"123");
  DOIT(sint32,"-1");
  DOIT(sint32,"-12");
  DOIT(sint32,"-128");
  DOIT_VALUE(sint32,mmux_sint32_constant_minimum());
  DOIT_VALUE(sint32,mmux_sint32_constant_maximum());
}
static void
test_sprint_uint32 (void)
{
  DOIT(uint32,"0");
  DOIT(uint32,"123");
  DOIT(uint32,"255");
  DOIT_VALUE(uint32,mmux_uint32_constant_minimum());
  DOIT_VALUE(uint32,mmux_uint32_constant_maximum());
}
static void
test_sprint_sint64 (void)
{
  DOIT(sint64,"0");
  DOIT(sint64,"123");
  DOIT(sint64,"-1");
  DOIT(sint64,"-12");
  DOIT(sint64,"-128");
  DOIT_VALUE(sint64,mmux_sint64_constant_minimum());
  DOIT_VALUE(sint64,mmux_sint64_constant_maximum());
}
static void
test_sprint_uint64 (void)
{
  DOIT(uint64,"0");
  DOIT(uint64,"123");
  DOIT(uint64,"255");
  DOIT_VALUE(uint64,mmux_uint64_constant_minimum());
  DOIT_VALUE(uint64,mmux_uint64_constant_maximum());
}


/** --------------------------------------------------------------------
 ** Typedef exact integers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_ssize (void)
{
  DOIT(ssize,"0");
  DOIT(ssize,"123");
  DOIT(ssize,"-1");
  DOIT(ssize,"-12");
  DOIT(ssize,"-128");
  DOIT_VALUE(ssize,mmux_ssize_constant_minimum());
  DOIT_VALUE(ssize,mmux_ssize_constant_maximum());
}
static void
test_sprint_usize (void)
{
  DOIT(usize,"0");
  DOIT(usize,"123");
  DOIT(usize,"255");
  DOIT_VALUE(usize,mmux_usize_constant_minimum());
  DOIT_VALUE(usize,mmux_usize_constant_maximum());
}
static void
test_sprint_sintmax (void)
{
  DOIT(sintmax,"0");
  DOIT(sintmax,"123");
  DOIT(sintmax,"-1");
  DOIT(sintmax,"-12");
  DOIT(sintmax,"-128");
  DOIT_VALUE(sintmax,mmux_sintmax_constant_minimum());
  DOIT_VALUE(sintmax,mmux_sintmax_constant_maximum());
}
static void
test_sprint_uintmax (void)
{
  DOIT(uintmax,"0");
  DOIT(uintmax,"123");
  DOIT(uintmax,"255");
  DOIT_VALUE(uintmax,mmux_uintmax_constant_minimum());
  DOIT_VALUE(uintmax,mmux_uintmax_constant_maximum());
}
static void
test_sprint_sintptr (void)
{
  DOIT(sintptr,"0");
  DOIT(sintptr,"123");
  DOIT(sintptr,"-1");
  DOIT(sintptr,"-12");
  DOIT(sintptr,"-128");
  DOIT_VALUE(sintptr,mmux_sintptr_constant_minimum());
  DOIT_VALUE(sintptr,mmux_sintptr_constant_maximum());
}
static void
test_sprint_uintptr (void)
{
  DOIT(uintptr,"0");
  DOIT(uintptr,"123");
  DOIT(uintptr,"255");
  DOIT_VALUE(uintptr,mmux_uintptr_constant_minimum());
  DOIT_VALUE(uintptr,mmux_uintptr_constant_maximum());
}
static void
test_sprint_ptrdiff (void)
{
  DOIT(ptrdiff,"0");
  DOIT(ptrdiff,"123");
  DOIT(ptrdiff,"-1");
  DOIT(ptrdiff,"-12");
  DOIT(ptrdiff,"-128");
  DOIT_VALUE(ptrdiff,mmux_ptrdiff_constant_minimum());
  DOIT_VALUE(ptrdiff,mmux_ptrdiff_constant_maximum());
}
static void
test_sprint_libc_mode (void)
{
  DOIT(libc_mode,"0");
  DOIT(libc_mode,"123");
  DOIT_VALUE(libc_mode,mmux_libc_mode_constant_minimum());
  DOIT_VALUE(libc_mode,mmux_libc_mode_constant_maximum());
}
static void
test_sprint_off (void)
{
  DOIT(off,"0");
  DOIT(off,"123");
  DOIT_VALUE(off,mmux_off_constant_minimum());
  DOIT_VALUE(off,mmux_off_constant_maximum());
}
static void
test_sprint_libc_pid (void)
{
  DOIT(libc_pid,"0");
  DOIT(libc_pid,"123");
  DOIT_VALUE(libc_pid,mmux_libc_pid_constant_minimum());
  DOIT_VALUE(libc_pid,mmux_libc_pid_constant_maximum());
}
static void
test_sprint_libc_uid (void)
{
  DOIT(libc_uid,"0");
  DOIT(libc_uid,"123");
  DOIT_VALUE(libc_uid,mmux_libc_uid_constant_minimum());
  DOIT_VALUE(libc_uid,mmux_libc_uid_constant_maximum());
}
static void
test_sprint_libc_gid (void)
{
  DOIT(libc_gid,"0");
  DOIT(libc_gid,"123");
  DOIT_VALUE(libc_gid,mmux_libc_gid_constant_minimum());
  DOIT_VALUE(libc_gid,mmux_libc_gid_constant_maximum());
}
static void
test_sprint_wchar (void)
{
  DOIT(wchar,"0");
  DOIT(wchar,"123");
  DOIT_VALUE(wchar,mmux_wchar_constant_minimum());
  DOIT_VALUE(wchar,mmux_wchar_constant_maximum());
}
static void
test_sprint_wint (void)
{
  DOIT(wint,"0");
  DOIT(wint,"123");
  DOIT_VALUE(wint,mmux_wint_constant_minimum());
  DOIT_VALUE(wint,mmux_wint_constant_maximum());
}
static void
test_sprint_time (void)
{
  DOIT(time,"0");
  DOIT(time,"123");
  DOIT_VALUE(time,mmux_time_constant_minimum());
  DOIT_VALUE(time,mmux_time_constant_maximum());
}
static void
test_sprint_clock (void)
{
  DOIT(clock,"0");
  DOIT(clock,"123");
  DOIT_VALUE(clock,mmux_clock_constant_minimum());
  DOIT_VALUE(clock,mmux_clock_constant_maximum());
}
static void
test_sprint_libc_socklen (void)
{
  DOIT(libc_socklen,"0");
  DOIT(libc_socklen,"123");
  DOIT_VALUE(libc_socklen,mmux_libc_socklen_constant_minimum());
  DOIT_VALUE(libc_socklen,mmux_libc_socklen_constant_maximum());
}
static void
test_sprint_libc_rlim (void)
{
  DOIT(libc_rlim,"0");
  DOIT(libc_rlim,"123");
  DOIT_VALUE(libc_rlim,mmux_libc_rlim_constant_minimum());
  DOIT_VALUE(libc_rlim,mmux_libc_rlim_constant_maximum());
}
static void
test_sprint_libc_ino (void)
{
  DOIT(libc_ino,"0");
  DOIT(libc_ino,"123");
  DOIT_VALUE(libc_ino,mmux_libc_ino_constant_minimum());
  DOIT_VALUE(libc_ino,mmux_libc_ino_constant_maximum());
}
static void
test_sprint_libc_dev (void)
{
  DOIT(libc_dev,"0");
  DOIT(libc_dev,"123");
  DOIT_VALUE(libc_dev,mmux_libc_dev_constant_minimum());
  DOIT_VALUE(libc_dev,mmux_libc_dev_constant_maximum());
}
static void
test_sprint_libc_nlink (void)
{
  DOIT(libc_nlink,"0");
  DOIT(libc_nlink,"123");
  DOIT_VALUE(libc_nlink,mmux_libc_nlink_constant_minimum());
  DOIT_VALUE(libc_nlink,mmux_libc_nlink_constant_maximum());
}
static void
test_sprint_libc_blkcnt (void)
{
  DOIT(libc_blkcnt,"0");
  DOIT(libc_blkcnt,"123");
  DOIT_VALUE(libc_blkcnt,mmux_libc_blkcnt_constant_minimum());
  DOIT_VALUE(libc_blkcnt,mmux_libc_blkcnt_constant_maximum());
}


/** --------------------------------------------------------------------
 ** Floating-point numbers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_flonumfl (void)
{
  DOIT(flonumfl,"0.0");
  DOIT(flonumfl,"+0.0");
  DOIT(flonumfl,"-0.0");
  DOIT(flonumfl,"123");
  DOIT(flonumfl,"0.123");
  DOIT(flonumfl,"0.123e+13");
  DOIT_VALUE(flonumfl,mmux_flonumfl_constant_minimum());
  DOIT_VALUE(flonumfl,mmux_flonumfl_constant_maximum());
}
static void
test_sprint_flonumdb (void)
{
  DOIT(flonumdb,"0.0");
  DOIT(flonumdb,"+0.0");
  DOIT(flonumdb,"-0.0");
  DOIT(flonumdb,"123");
  DOIT(flonumdb,"0.123");
  DOIT(flonumdb,"0.123e+13");
  DOIT_VALUE(flonumdb,mmux_flonumdb_constant_minimum());
  DOIT_VALUE(flonumdb,mmux_flonumdb_constant_maximum());
}
static void
test_sprint_flonumldb (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT(flonumldb,"0.0");
  DOIT(flonumldb,"+0.0");
  DOIT(flonumldb,"-0.0");
  DOIT(flonumldb,"123");
  DOIT(flonumldb,"0.123");
  DOIT(flonumldb,"0.123e+13");
  DOIT_VALUE(flonumldb,mmux_flonumldb_constant_minimum());
  DOIT_VALUE(flonumldb,mmux_flonumldb_constant_maximum());
#endif
}

static void
test_sprint_flonumf32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT(flonumf32,"0.0");
  DOIT(flonumf32,"+0.0");
  DOIT(flonumf32,"-0.0");
  DOIT(flonumf32,"123");
  DOIT(flonumf32,"0.123");
  DOIT(flonumf32,"0.123e+13");
  DOIT_VALUE(flonumf32,mmux_flonumf32_constant_minimum());
  DOIT_VALUE(flonumf32,mmux_flonumf32_constant_maximum());
#endif
}
static void
test_sprint_flonumf64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT(flonumf64,"0.0");
  DOIT(flonumf64,"+0.0");
  DOIT(flonumf64,"-0.0");
  DOIT(flonumf64,"123");
  DOIT(flonumf64,"0.123");
  DOIT(flonumf64,"0.123e+13");
  DOIT_VALUE(flonumf64,mmux_flonumf64_constant_minimum());
  DOIT_VALUE(flonumf64,mmux_flonumf64_constant_maximum());
#endif
}
static void
test_sprint_flonumf128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT(flonumf128,"0.0");
  DOIT(flonumf128,"+0.0");
  DOIT(flonumf128,"-0.0");
  DOIT(flonumf128,"123");
  DOIT(flonumf128,"0.123");
  DOIT(flonumf128,"0.123e+13");
  DOIT_VALUE(flonumf128,mmux_flonumf128_constant_minimum());
  DOIT_VALUE(flonumf128,mmux_flonumf128_constant_maximum());
#endif
}

static void
test_sprint_flonumf32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT(flonumf32x,"0.0");
  DOIT(flonumf32x,"+0.0");
  DOIT(flonumf32x,"-0.0");
  DOIT(flonumf32x,"123");
  DOIT(flonumf32x,"0.123");
  DOIT(flonumf32x,"0.123e+13");
  DOIT_VALUE(flonumf32x,mmux_flonumf32x_constant_minimum());
  DOIT_VALUE(flonumf32x,mmux_flonumf32x_constant_maximum());
#endif
}
static void
test_sprint_flonumf64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT(flonumf64x,"0.0");
  DOIT(flonumf64x,"+0.0");
  DOIT(flonumf64x,"-0.0");
  DOIT(flonumf64x,"123");
  DOIT(flonumf64x,"0.123");
  DOIT(flonumf64x,"0.123e+13");
  DOIT_VALUE(flonumf64x,mmux_flonumf64x_constant_minimum());
  DOIT_VALUE(flonumf64x,mmux_flonumf64x_constant_maximum());
#endif
}
static void
test_sprint_flonumf128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT(flonumf128x,"0.0");
  DOIT(flonumf128x,"+0.0");
  DOIT(flonumf128x,"-0.0");
  DOIT(flonumf128x,"123");
  DOIT(flonumf128x,"0.123");
  DOIT(flonumf128x,"0.123e+13");
  DOIT_VALUE(flonumf128x,mmux_flonumf128x_constant_minimum());
  DOIT_VALUE(flonumf128x,mmux_flonumf128x_constant_maximum());
#endif
}

static void
test_sprint_flonumd32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT(flonumd32,"0.0");
  DOIT(flonumd32,"+0.0");
  DOIT(flonumd32,"-0.0");
  DOIT(flonumd32,"123");
  DOIT(flonumd32,"0.123");
  DOIT(flonumd32,"0.123e+13");
  DOIT_VALUE(flonumd32,mmux_flonumd32_constant_minimum());
  DOIT_VALUE(flonumd32,mmux_flonumd32_constant_maximum());
#endif
}
static void
test_sprint_flonumd64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT(flonumd64,"0.0");
  DOIT(flonumd64,"+0.0");
  DOIT(flonumd64,"-0.0");
  DOIT(flonumd64,"123");
  DOIT(flonumd64,"0.123");
  DOIT(flonumd64,"0.123e+13");
  DOIT_VALUE(flonumd64,mmux_flonumd64_constant_minimum());
  DOIT_VALUE(flonumd64,mmux_flonumd64_constant_maximum());
#endif
}
static void
test_sprint_flonumd128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT(flonumd128,"0.0");
  DOIT(flonumd128,"+0.0");
  DOIT(flonumd128,"-0.0");
  DOIT(flonumd128,"123");
  DOIT(flonumd128,"0.123");
  DOIT(flonumd128,"0.123e+13");
  DOIT_VALUE(flonumd128,mmux_flonumd128_constant_minimum());
  DOIT_VALUE(flonumd128,mmux_flonumd128_constant_maximum());
#endif
}


/** --------------------------------------------------------------------
 ** Complex floating-point numbers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_flonumcfl (void)
{
  DOIT(flonumcfl,"(0.0)+i*(0.0)");
  DOIT(flonumcfl,"(+0.0)+i*(-0.0)");
  DOIT(flonumcfl,"(+0.123)+i*(-0.456)");
}
static void
test_sprint_flonumcdb (void)
{
  DOIT(flonumcdb,"(0.0)+i*(0.0)");
  DOIT(flonumcdb,"(+0.0)+i*(-0.0)");
  DOIT(flonumcdb,"(+0.123)+i*(-0.456)");
}
static void
test_sprint_flonumcldb (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT(flonumcldb,"(0.0)+i*(0.0)");
  DOIT(flonumcldb,"(+0.0)+i*(-0.0)");
  DOIT(flonumcldb,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_flonumcf32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT(flonumcf32,"(0.0)+i*(0.0)");
  DOIT(flonumcf32,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf32,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcf64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT(flonumcf64,"(0.0)+i*(0.0)");
  DOIT(flonumcf64,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf64,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcf128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT(flonumcf128,"(0.0)+i*(0.0)");
  DOIT(flonumcf128,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf128,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_flonumcf32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT(flonumcf32x,"(0.0)+i*(0.0)");
  DOIT(flonumcf32x,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf32x,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcf64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT(flonumcf64x,"(0.0)+i*(0.0)");
  DOIT(flonumcf64x,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf64x,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcf128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT(flonumcf128x,"(0.0)+i*(0.0)");
  DOIT(flonumcf128x,"(+0.0)+i*(-0.0)");
  DOIT(flonumcf128x,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_flonumcd32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT(flonumcd32,"(0.0)+i*(0.0)");
  DOIT(flonumcd32,"(+0.0)+i*(-0.0)");
  DOIT(flonumcd32,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcd64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT(flonumcd64,"(0.0)+i*(0.0)");
  DOIT(flonumcd64,"(+0.0)+i*(-0.0)");
  DOIT(flonumcd64,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_flonumcd128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT(flonumcd128,"(0.0)+i*(0.0)");
  DOIT(flonumcd128,"(+0.0)+i*(-0.0)");
  DOIT(flonumcd128,"(+0.123)+i*(-0.456)");
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_sprint_pointer();		}

  if (1) {	test_sprint_char();		}
  if (1) {	test_sprint_schar();		}
  if (1) {	test_sprint_uchar();		}
  if (1) {	test_sprint_sshort();		}
  if (1) {	test_sprint_ushort();		}
  if (1) {	test_sprint_sint();		}
  if (1) {	test_sprint_uint();		}
  if (1) {	test_sprint_slong();		}
  if (1) {	test_sprint_ulong();		}
  if (1) {	test_sprint_sllong();		}
  if (1) {	test_sprint_ullong();		}
  if (1) {	test_sprint_sint8();		}
  if (1) {	test_sprint_uint8();		}
  if (1) {	test_sprint_sint16();		}
  if (1) {	test_sprint_uint16();		}
  if (1) {	test_sprint_sint32();		}
  if (1) {	test_sprint_uint32();		}
  if (1) {	test_sprint_sint64();		}
  if (1) {	test_sprint_uint64();		}
  if (1) {	test_sprint_ssize();		}
  if (1) {	test_sprint_usize();		}
  if (1) {	test_sprint_sintmax();		}
  if (1) {	test_sprint_uintmax();		}
  if (1) {	test_sprint_sintptr();		}
  if (1) {	test_sprint_uintptr();		}
  if (1) {	test_sprint_ptrdiff();		}
  if (1) {	test_sprint_libc_mode();	}
  if (1) {	test_sprint_off();		}
  if (1) {	test_sprint_libc_pid();		}
  if (1) {	test_sprint_libc_uid();		}
  if (1) {	test_sprint_libc_gid();		}
  if (1) {	test_sprint_wchar();		}
  if (1) {	test_sprint_wint();		}
  if (1) {	test_sprint_time();		}
  if (1) {	test_sprint_clock();		}
  if (1) {	test_sprint_libc_socklen();		}
  if (1) {	test_sprint_libc_rlim();		}
  if (1) {	test_sprint_libc_ino();		}
  if (1) {	test_sprint_libc_dev();		}
  if (1) {	test_sprint_libc_nlink();		}
  if (1) {	test_sprint_libc_blkcnt();		}

  if (1) {	test_sprint_flonumfl();		}
  if (1) {	test_sprint_flonumdb();		}
  if (1) {	test_sprint_flonumldb();		}

  if (1) {	test_sprint_flonumf32();		}
  if (1) {	test_sprint_flonumf64();		}
  if (1) {	test_sprint_flonumf128();		}

  if (1) {	test_sprint_flonumf32x();		}
  if (1) {	test_sprint_flonumf64x();		}
  if (1) {	test_sprint_flonumf128x();	}

  if (1) {	test_sprint_flonumd32();	}
  if (1) {	test_sprint_flonumd64();	}
  if (1) {	test_sprint_flonumd128();	}

  if (1) {	test_sprint_flonumcfl();		}
  if (1) {	test_sprint_flonumcdb();		}
  if (1) {	test_sprint_flonumcldb();	}

  if (1) {	test_sprint_flonumcf32();	}
  if (1) {	test_sprint_flonumcf64();	}
  if (1) {	test_sprint_flonumcf128();	}

  if (1) {	test_sprint_flonumcf32x();	}
  if (1) {	test_sprint_flonumcf64x();	}
  if (1) {	test_sprint_flonumcf128x();	}

  if (1) {	test_sprint_flonumcd32();	}
  if (1) {	test_sprint_flonumcd64();	}
  if (1) {	test_sprint_flonumcd128();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
