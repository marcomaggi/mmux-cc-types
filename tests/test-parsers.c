/*
  Part of: MMUX CC Tests
  Contents: test for version functions
  Date: Aug 12, 2025

  Abstract

	Test file for version functions.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define DOIT(STEM,INPUTSTR)	 {								\
    mmux_asciizcp_t	str = INPUTSTR;								\
    mmux_ ## STEM ## _t	value;									\
												\
    if (true == mmux_ ## STEM ## _parse(&value, str, __func__)) {				\
      fprintf(stderr, "%s: failed to parse: '%s'\n", __func__, str);				\
      exit(EXIT_FAILURE);									\
    } else {											\
      fprintf(stderr, "%s: correctly parsed '%s' input '%s' to: '", __func__, #STEM, str);	\
      mmux_ ## STEM ## _fprintf(stderr, value);							\
      fprintf(stderr, "'\n");									\
    }												\
  }

#define DOIT_VALUE(STEM,INPUT_VALUE)	{			\
    mmux_usize_t	buflen = 4096;				\
    mmux_char_t		bufptr[buflen];				\
    mmux_ ## STEM ## _sprint(bufptr, buflen, INPUT_VALUE);	\
    DOIT(STEM,bufptr);						\
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
  DOIT_VALUE(pointer,mmux_pointer_minimum());
  DOIT_VALUE(pointer,mmux_pointer_maximum());
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
  DOIT_VALUE(char,mmux_char_minimum());
  DOIT_VALUE(char,mmux_char_maximum());
}
static void
test_sprint_schar (void)
{
  DOIT(schar,"0");
  DOIT(schar,"123");
  DOIT(schar,"-1");
  DOIT(schar,"-12");
  DOIT(schar,"-128");
  DOIT_VALUE(schar,mmux_schar_minimum());
  DOIT_VALUE(schar,mmux_schar_maximum());
}
static void
test_sprint_uchar (void)
{
  DOIT(uchar,"0");
  DOIT(uchar,"123");
  DOIT(uchar,"255");
  DOIT_VALUE(uchar,mmux_uchar_minimum());
  DOIT_VALUE(uchar,mmux_uchar_maximum());
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
  DOIT_VALUE(sshort,mmux_sshort_minimum());
  DOIT_VALUE(sshort,mmux_sshort_maximum());
}
static void
test_sprint_ushort (void)
{
  DOIT(ushort,"0");
  DOIT(ushort,"123");
  DOIT(ushort,"255");
  DOIT_VALUE(ushort,mmux_ushort_minimum());
  DOIT_VALUE(ushort,mmux_ushort_maximum());
}
static void
test_sprint_sint (void)
{
  DOIT(sint,"0");
  DOIT(sint,"123");
  DOIT(sint,"-1");
  DOIT(sint,"-12");
  DOIT(sint,"-128");
  DOIT_VALUE(sint,mmux_sint_minimum());
  DOIT_VALUE(sint,mmux_sint_maximum());
}
static void
test_sprint_uint (void)
{
  DOIT(uint,"0");
  DOIT(uint,"123");
  DOIT(uint,"255");
  DOIT_VALUE(uint,mmux_uint_minimum());
  DOIT_VALUE(uint,mmux_uint_maximum());
}
static void
test_sprint_slong (void)
{
  DOIT(slong,"0");
  DOIT(slong,"123");
  DOIT(slong,"-1");
  DOIT(slong,"-12");
  DOIT(slong,"-128");
  DOIT_VALUE(slong,mmux_slong_minimum());
  DOIT_VALUE(slong,mmux_slong_maximum());
}
static void
test_sprint_ulong (void)
{
  DOIT(ulong,"0");
  DOIT(ulong,"123");
  DOIT(ulong,"255");
  DOIT_VALUE(ulong,mmux_ulong_minimum());
  DOIT_VALUE(ulong,mmux_ulong_maximum());
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
  DOIT_VALUE(sllong,mmux_sllong_minimum());
  DOIT_VALUE(sllong,mmux_sllong_maximum());
#endif
}
static void
test_sprint_ullong (void)
{
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DOIT(ullong,"0");
  DOIT(ullong,"123");
  DOIT(ullong,"255");
  DOIT_VALUE(ullong,mmux_ullong_minimum());
  DOIT_VALUE(ullong,mmux_ullong_maximum());
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
  DOIT_VALUE(sint8,mmux_sint8_minimum());
  DOIT_VALUE(sint8,mmux_sint8_maximum());
}
static void
test_sprint_uint8 (void)
{
  DOIT(uint8,"0");
  DOIT(uint8,"123");
  DOIT(uint8,"255");
  DOIT_VALUE(uint8,mmux_uint8_minimum());
  DOIT_VALUE(uint8,mmux_uint8_maximum());
}
static void
test_sprint_sint16 (void)
{
  DOIT(sint16,"0");
  DOIT(sint16,"123");
  DOIT(sint16,"-1");
  DOIT(sint16,"-12");
  DOIT(sint16,"-128");
  DOIT_VALUE(sint16,mmux_sint16_minimum());
  DOIT_VALUE(sint16,mmux_sint16_maximum());
}
static void
test_sprint_uint16 (void)
{
  DOIT(uint16,"0");
  DOIT(uint16,"123");
  DOIT(uint16,"255");
  DOIT_VALUE(uint16,mmux_uint16_minimum());
  DOIT_VALUE(uint16,mmux_uint16_maximum());
}
static void
test_sprint_sint32 (void)
{
  DOIT(sint32,"0");
  DOIT(sint32,"123");
  DOIT(sint32,"-1");
  DOIT(sint32,"-12");
  DOIT(sint32,"-128");
  DOIT_VALUE(sint32,mmux_sint32_minimum());
  DOIT_VALUE(sint32,mmux_sint32_maximum());
}
static void
test_sprint_uint32 (void)
{
  DOIT(uint32,"0");
  DOIT(uint32,"123");
  DOIT(uint32,"255");
  DOIT_VALUE(uint32,mmux_uint32_minimum());
  DOIT_VALUE(uint32,mmux_uint32_maximum());
}
static void
test_sprint_sint64 (void)
{
  DOIT(sint64,"0");
  DOIT(sint64,"123");
  DOIT(sint64,"-1");
  DOIT(sint64,"-12");
  DOIT(sint64,"-128");
  DOIT_VALUE(sint64,mmux_sint64_minimum());
  DOIT_VALUE(sint64,mmux_sint64_maximum());
}
static void
test_sprint_uint64 (void)
{
  DOIT(uint64,"0");
  DOIT(uint64,"123");
  DOIT(uint64,"255");
  DOIT_VALUE(uint64,mmux_uint64_minimum());
  DOIT_VALUE(uint64,mmux_uint64_maximum());
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
  DOIT_VALUE(ssize,mmux_ssize_minimum());
  DOIT_VALUE(ssize,mmux_ssize_maximum());
}
static void
test_sprint_usize (void)
{
  DOIT(usize,"0");
  DOIT(usize,"123");
  DOIT(usize,"255");
  DOIT_VALUE(usize,mmux_usize_minimum());
  DOIT_VALUE(usize,mmux_usize_maximum());
}
static void
test_sprint_sintmax (void)
{
  DOIT(sintmax,"0");
  DOIT(sintmax,"123");
  DOIT(sintmax,"-1");
  DOIT(sintmax,"-12");
  DOIT(sintmax,"-128");
  DOIT_VALUE(sintmax,mmux_sintmax_minimum());
  DOIT_VALUE(sintmax,mmux_sintmax_maximum());
}
static void
test_sprint_uintmax (void)
{
  DOIT(uintmax,"0");
  DOIT(uintmax,"123");
  DOIT(uintmax,"255");
  DOIT_VALUE(uintmax,mmux_uintmax_minimum());
  DOIT_VALUE(uintmax,mmux_uintmax_maximum());
}
static void
test_sprint_sintptr (void)
{
  DOIT(sintptr,"0");
  DOIT(sintptr,"123");
  DOIT(sintptr,"-1");
  DOIT(sintptr,"-12");
  DOIT(sintptr,"-128");
  DOIT_VALUE(sintptr,mmux_sintptr_minimum());
  DOIT_VALUE(sintptr,mmux_sintptr_maximum());
}
static void
test_sprint_uintptr (void)
{
  DOIT(uintptr,"0");
  DOIT(uintptr,"123");
  DOIT(uintptr,"255");
  DOIT_VALUE(uintptr,mmux_uintptr_minimum());
  DOIT_VALUE(uintptr,mmux_uintptr_maximum());
}
static void
test_sprint_ptrdiff (void)
{
  DOIT(ptrdiff,"0");
  DOIT(ptrdiff,"123");
  DOIT(ptrdiff,"-1");
  DOIT(ptrdiff,"-12");
  DOIT(ptrdiff,"-128");
  DOIT_VALUE(ptrdiff,mmux_ptrdiff_minimum());
  DOIT_VALUE(ptrdiff,mmux_ptrdiff_maximum());
}
static void
test_sprint_mode (void)
{
  DOIT(mode,"0");
  DOIT(mode,"123");
  DOIT_VALUE(mode,mmux_mode_minimum());
  DOIT_VALUE(mode,mmux_mode_maximum());
}
static void
test_sprint_off (void)
{
  DOIT(off,"0");
  DOIT(off,"123");
  DOIT_VALUE(off,mmux_off_minimum());
  DOIT_VALUE(off,mmux_off_maximum());
}
static void
test_sprint_pid (void)
{
  DOIT(pid,"0");
  DOIT(pid,"123");
  DOIT_VALUE(pid,mmux_pid_minimum());
  DOIT_VALUE(pid,mmux_pid_maximum());
}
static void
test_sprint_uid (void)
{
  DOIT(uid,"0");
  DOIT(uid,"123");
  DOIT_VALUE(uid,mmux_uid_minimum());
  DOIT_VALUE(uid,mmux_uid_maximum());
}
static void
test_sprint_gid (void)
{
  DOIT(gid,"0");
  DOIT(gid,"123");
  DOIT_VALUE(gid,mmux_gid_minimum());
  DOIT_VALUE(gid,mmux_gid_maximum());
}
static void
test_sprint_wchar (void)
{
  DOIT(wchar,"0");
  DOIT(wchar,"123");
  DOIT_VALUE(wchar,mmux_wchar_minimum());
  DOIT_VALUE(wchar,mmux_wchar_maximum());
}
static void
test_sprint_wint (void)
{
  DOIT(wint,"0");
  DOIT(wint,"123");
  DOIT_VALUE(wint,mmux_wint_minimum());
  DOIT_VALUE(wint,mmux_wint_maximum());
}
static void
test_sprint_time (void)
{
  DOIT(time,"0");
  DOIT(time,"123");
  DOIT_VALUE(time,mmux_time_minimum());
  DOIT_VALUE(time,mmux_time_maximum());
}
static void
test_sprint_socklen (void)
{
  DOIT(socklen,"0");
  DOIT(socklen,"123");
  DOIT_VALUE(socklen,mmux_socklen_minimum());
  DOIT_VALUE(socklen,mmux_socklen_maximum());
}
static void
test_sprint_rlim (void)
{
  DOIT(rlim,"0");
  DOIT(rlim,"123");
  DOIT_VALUE(rlim,mmux_rlim_minimum());
  DOIT_VALUE(rlim,mmux_rlim_maximum());
}


/** --------------------------------------------------------------------
 ** Floating-point numbers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_float (void)
{
  DOIT(float,"0.0");
  DOIT(float,"+0.0");
  DOIT(float,"-0.0");
  DOIT(float,"123");
  DOIT(float,"0.123");
  DOIT(float,"0.123e+13");
  DOIT_VALUE(float,mmux_float_minimum());
  DOIT_VALUE(float,mmux_float_maximum());
}
static void
test_sprint_double (void)
{
  DOIT(double,"0.0");
  DOIT(double,"+0.0");
  DOIT(double,"-0.0");
  DOIT(double,"123");
  DOIT(double,"0.123");
  DOIT(double,"0.123e+13");
  DOIT_VALUE(double,mmux_double_minimum());
  DOIT_VALUE(double,mmux_double_maximum());
}
static void
test_sprint_ldouble (void)
{
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DOIT(ldouble,"0.0");
  DOIT(ldouble,"+0.0");
  DOIT(ldouble,"-0.0");
  DOIT(ldouble,"123");
  DOIT(ldouble,"0.123");
  DOIT(ldouble,"0.123e+13");
  DOIT_VALUE(ldouble,mmux_ldouble_minimum());
  DOIT_VALUE(ldouble,mmux_ldouble_maximum());
#endif
}

static void
test_sprint_float32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DOIT(float32,"0.0");
  DOIT(float32,"+0.0");
  DOIT(float32,"-0.0");
  DOIT(float32,"123");
  DOIT(float32,"0.123");
  DOIT(float32,"0.123e+13");
  DOIT_VALUE(float32,mmux_float32_minimum());
  DOIT_VALUE(float32,mmux_float32_maximum());
#endif
}
static void
test_sprint_float64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DOIT(float64,"0.0");
  DOIT(float64,"+0.0");
  DOIT(float64,"-0.0");
  DOIT(float64,"123");
  DOIT(float64,"0.123");
  DOIT(float64,"0.123e+13");
  DOIT_VALUE(float64,mmux_float64_minimum());
  DOIT_VALUE(float64,mmux_float64_maximum());
#endif
}
static void
test_sprint_float128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DOIT(float128,"0.0");
  DOIT(float128,"+0.0");
  DOIT(float128,"-0.0");
  DOIT(float128,"123");
  DOIT(float128,"0.123");
  DOIT(float128,"0.123e+13");
  DOIT_VALUE(float128,mmux_float128_minimum());
  DOIT_VALUE(float128,mmux_float128_maximum());
#endif
}

static void
test_sprint_float32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DOIT(float32x,"0.0");
  DOIT(float32x,"+0.0");
  DOIT(float32x,"-0.0");
  DOIT(float32x,"123");
  DOIT(float32x,"0.123");
  DOIT(float32x,"0.123e+13");
  DOIT_VALUE(float32x,mmux_float32x_minimum());
  DOIT_VALUE(float32x,mmux_float32x_maximum());
#endif
}
static void
test_sprint_float64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DOIT(float64x,"0.0");
  DOIT(float64x,"+0.0");
  DOIT(float64x,"-0.0");
  DOIT(float64x,"123");
  DOIT(float64x,"0.123");
  DOIT(float64x,"0.123e+13");
  DOIT_VALUE(float64x,mmux_float64x_minimum());
  DOIT_VALUE(float64x,mmux_float64x_maximum());
#endif
}
static void
test_sprint_float128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DOIT(float128x,"0.0");
  DOIT(float128x,"+0.0");
  DOIT(float128x,"-0.0");
  DOIT(float128x,"123");
  DOIT(float128x,"0.123");
  DOIT(float128x,"0.123e+13");
  DOIT_VALUE(float128x,mmux_float128x_minimum());
  DOIT_VALUE(float128x,mmux_float128x_maximum());
#endif
}

static void
test_sprint_decimal32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DOIT(decimal32,"0.0");
  DOIT(decimal32,"+0.0");
  DOIT(decimal32,"-0.0");
  DOIT(decimal32,"123");
  DOIT(decimal32,"0.123");
  DOIT(decimal32,"0.123e+13");
  DOIT_VALUE(decimal32,mmux_decimal32_minimum());
  DOIT_VALUE(decimal32,mmux_decimal32_maximum());
#endif
}
static void
test_sprint_decimal64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DOIT(decimal64,"0.0");
  DOIT(decimal64,"+0.0");
  DOIT(decimal64,"-0.0");
  DOIT(decimal64,"123");
  DOIT(decimal64,"0.123");
  DOIT(decimal64,"0.123e+13");
  DOIT_VALUE(decimal64,mmux_decimal64_minimum());
  DOIT_VALUE(decimal64,mmux_decimal64_maximum());
#endif
}
static void
test_sprint_decimal128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  DOIT(decimal128,"0.0");
  DOIT(decimal128,"+0.0");
  DOIT(decimal128,"-0.0");
  DOIT(decimal128,"123");
  DOIT(decimal128,"0.123");
  DOIT(decimal128,"0.123e+13");
  DOIT_VALUE(decimal128,mmux_decimal128_minimum());
  DOIT_VALUE(decimal128,mmux_decimal128_maximum());
#endif
}


/** --------------------------------------------------------------------
 ** Complex floating-point numbers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_complexf (void)
{
  DOIT(complexf,"(0.0)+i*(0.0)");
  DOIT(complexf,"(+0.0)+i*(-0.0)");
  DOIT(complexf,"(+0.123)+i*(-0.456)");
}
static void
test_sprint_complexd (void)
{
  DOIT(complexd,"(0.0)+i*(0.0)");
  DOIT(complexd,"(+0.0)+i*(-0.0)");
  DOIT(complexd,"(+0.123)+i*(-0.456)");
}
static void
test_sprint_complexld (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  DOIT(complexld,"(0.0)+i*(0.0)");
  DOIT(complexld,"(+0.0)+i*(-0.0)");
  DOIT(complexld,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_complexf32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  DOIT(complexf32,"(0.0)+i*(0.0)");
  DOIT(complexf32,"(+0.0)+i*(-0.0)");
  DOIT(complexf32,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexf64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  DOIT(complexf64,"(0.0)+i*(0.0)");
  DOIT(complexf64,"(+0.0)+i*(-0.0)");
  DOIT(complexf64,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexf128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  DOIT(complexf128,"(0.0)+i*(0.0)");
  DOIT(complexf128,"(+0.0)+i*(-0.0)");
  DOIT(complexf128,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_complexf32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  DOIT(complexf32x,"(0.0)+i*(0.0)");
  DOIT(complexf32x,"(+0.0)+i*(-0.0)");
  DOIT(complexf32x,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexf64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  DOIT(complexf64x,"(0.0)+i*(0.0)");
  DOIT(complexf64x,"(+0.0)+i*(-0.0)");
  DOIT(complexf64x,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexf128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DOIT(complexf128x,"(0.0)+i*(0.0)");
  DOIT(complexf128x,"(+0.0)+i*(-0.0)");
  DOIT(complexf128x,"(+0.123)+i*(-0.456)");
#endif
}

static void
test_sprint_complexd32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  DOIT(complexd32,"(0.0)+i*(0.0)");
  DOIT(complexd32,"(+0.0)+i*(-0.0)");
  DOIT(complexd32,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexd64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  DOIT(complexd64,"(0.0)+i*(0.0)");
  DOIT(complexd64,"(+0.0)+i*(-0.0)");
  DOIT(complexd64,"(+0.123)+i*(-0.456)");
#endif
}
static void
test_sprint_complexd128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DOIT(complexd128,"(0.0)+i*(0.0)");
  DOIT(complexd128,"(+0.0)+i*(-0.0)");
  DOIT(complexd128,"(+0.123)+i*(-0.456)");
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
  if (1) {	test_sprint_mode();		}
  if (1) {	test_sprint_off();		}
  if (1) {	test_sprint_pid();		}
  if (1) {	test_sprint_uid();		}
  if (1) {	test_sprint_gid();		}
  if (1) {	test_sprint_wchar();		}
  if (1) {	test_sprint_wint();		}
  if (1) {	test_sprint_time();		}
  if (1) {	test_sprint_socklen();		}
  if (1) {	test_sprint_rlim();		}

  if (1) {	test_sprint_float();		}
  if (1) {	test_sprint_double();		}
  if (1) {	test_sprint_ldouble();		}

  if (1) {	test_sprint_float32();		}
  if (1) {	test_sprint_float64();		}
  if (1) {	test_sprint_float128();		}

  if (1) {	test_sprint_float32x();		}
  if (1) {	test_sprint_float64x();		}
  if (1) {	test_sprint_float128x();	}

  if (1) {	test_sprint_decimal32();	}
  if (1) {	test_sprint_decimal64();	}
  if (1) {	test_sprint_decimal128();	}

  if (1) {	test_sprint_complexf();		}
  if (1) {	test_sprint_complexd();		}
  if (1) {	test_sprint_complexld();	}

  if (1) {	test_sprint_complexf32();	}
  if (1) {	test_sprint_complexf64();	}
  if (1) {	test_sprint_complexf128();	}

  if (1) {	test_sprint_complexf32x();	}
  if (1) {	test_sprint_complexf64x();	}
  if (1) {	test_sprint_complexf128x();	}

  if (1) {	test_sprint_complexd32();	}
  if (1) {	test_sprint_complexd64();	}
  if (1) {	test_sprint_complexd128();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
