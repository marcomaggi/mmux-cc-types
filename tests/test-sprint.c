/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  8, 2025

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
 ** Basic sprinter: exact integers.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_TEST_SPRINTER_FUNCTION
#define DEFINE_TEST_SPRINTER_FUNCTION(STEM,LITERAL_VALUE,EXPECTED_STRING)		\
  static void										\
  test_sprint_##STEM (void)								\
  {											\
    dprintf(2, "running test: %s", __func__);						\
    auto		X = mmux_##STEM##_literal(LITERAL_VALUE);			\
    auto		required_nbytes = mmux_##STEM##_sprint_size(X);			\
											\
    assert(mmux_ctype_is_positive(required_nbytes));					\
    {											\
      char	str[required_nbytes.value];						\
											\
      assert(false == mmux_##STEM##_sprint(str, required_nbytes, X));			\
      fprintf(stderr, " required_bytes = %d, str = '%s'", required_nbytes.value, str);	\
      assert(0 == strcmp(EXPECTED_STRING, (char *)str));				\
    }											\
    dprintf(2, " DONE\n");								\
  }

DEFINE_TEST_SPRINTER_FUNCTION(pointer,		123,	"0x7b")
DEFINE_TEST_SPRINTER_FUNCTION(char,		65,	"A")
DEFINE_TEST_SPRINTER_FUNCTION(schar,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uchar,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sshort,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(ushort,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sint,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uint,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(slong,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(ulong,		123,	"123")
#ifdef MMUX_CC_TYPES_HAS_SLLONG
DEFINE_TEST_SPRINTER_FUNCTION(sllong,		123,	"123")
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
DEFINE_TEST_SPRINTER_FUNCTION(ullong,		123,	"123")
#endif
DEFINE_TEST_SPRINTER_FUNCTION(sint8,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uint8,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sint16,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uint16,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sint32,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uint32,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sint64,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uint64,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(byte,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(octet,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(ssize,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(usize,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sintmax,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uintmax,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(sintptr,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uintptr,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(ptrdiff,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(mode,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(off,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(pid,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(uid,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(gid,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(wchar,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(wint,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(time,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(socklen,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(rlim,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(ino,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(dev,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(nlink,		123,	"123")
DEFINE_TEST_SPRINTER_FUNCTION(blkcnt,		123,	"123")


/** --------------------------------------------------------------------
 ** Basic sprinter: real flonums.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_TEST_SPRINTER_FUNCTION
#define DEFINE_TEST_SPRINTER_FUNCTION(STEM,LITERAL_VALUE,EXPECTED_STRING)		\
  static void										\
  test_sprint_##STEM (void)								\
  {											\
    dprintf(2, "running test: %s", __func__);						\
    auto	X = mmux_##STEM##_literal(LITERAL_VALUE);				\
    auto	required_nbytes = mmux_##STEM##_sprint_size(X);				\
											\
    assert(mmux_ctype_is_positive(required_nbytes));					\
    {											\
      char	str[required_nbytes.value];						\
											\
      assert(false == mmux_##STEM##_sprint(str, required_nbytes, X));			\
      dprintf(2, " required_bytes = %d, str = '%s'", required_nbytes.value, str);	\
      assert(0 == strcmp(EXPECTED_STRING, (char *)str));				\
    }											\
    dprintf(2, " DONE\n");								\
  }

DEFINE_TEST_SPRINTER_FUNCTION(flonumfl,		0.123,	"0.123000")
DEFINE_TEST_SPRINTER_FUNCTION(flonumdb,		0.123,	"0.123000")
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
DEFINE_TEST_SPRINTER_FUNCTION(flonumldb,	0.123,	"0.123000")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
DEFINE_TEST_SPRINTER_FUNCTION(flonumf32,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
DEFINE_TEST_SPRINTER_FUNCTION(flonumf64,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
DEFINE_TEST_SPRINTER_FUNCTION(flonumf128,	0.123,	"0.123000")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf32x,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf64x,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf128x,	0.123,	"0.123000")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
DEFINE_TEST_SPRINTER_FUNCTION(flonumd32,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
DEFINE_TEST_SPRINTER_FUNCTION(flonumd64,	0.123,	"0.123000")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
DEFINE_TEST_SPRINTER_FUNCTION(flonumd128,	0.123,	"0.123000")
#endif


/** --------------------------------------------------------------------
 ** Basic sprinter: complex flonums.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_TEST_SPRINTER_FUNCTION
#define DEFINE_TEST_SPRINTER_FUNCTION(STEM,LITERAL_VALUE_RE,LITERAL_VALUE_IM,EXPECTED_STRING)	\
  static void											\
  test_sprint_##STEM (void)									\
  {												\
    dprintf(2, "running test: %s", __func__);							\
    auto	Z = mmux_##STEM##_rectangular_literal(LITERAL_VALUE_RE,LITERAL_VALUE_IM);	\
    auto	required_nbytes = mmux_##STEM##_sprint_size(Z);					\
												\
    assert(mmux_ctype_is_positive(required_nbytes));						\
    {												\
      char	str[required_nbytes.value];							\
												\
      assert(false == mmux_##STEM##_sprint(str, required_nbytes, Z));				\
      fprintf(stderr, " required_bytes = %d, str = '%s'", required_nbytes.value, str);		\
      assert(0 == strcmp(EXPECTED_STRING, (char *)str));					\
    }												\
    dprintf(2, " DONE\n");									\
  }

DEFINE_TEST_SPRINTER_FUNCTION(flonumcfl,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
DEFINE_TEST_SPRINTER_FUNCTION(flonumcdb,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
DEFINE_TEST_SPRINTER_FUNCTION(flonumcldb,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf32,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf64,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf128,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf32x,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf64x,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf128x,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd32,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd64,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd128,	0.123, 0.456,	"(0.123000)+i*(0.456000)")
#endif


/** --------------------------------------------------------------------
 ** Sprinter with base: exact integers.
 ** ----------------------------------------------------------------- */

#undef  DOIT_FOR_THIS_NUMBER
#define DOIT_FOR_THIS_NUMBER(STEM,NUMBER,BASE,EXPECTED_STRING)					\
  {												\
    auto	number		= mmux_##STEM##_literal(NUMBER);				\
    auto	base		= mmux_uint_literal(BASE);					\
    bool	is_negative;									\
												\
    /* First try with small output buffer, the with big output buffer. */			\
    {												\
      auto		buflen = mmux_usize_literal(2);						\
      mmux_asciip_t 	bufptr = alloca(buflen.value);						\
												\
      if (mmux_##STEM##_sprint_with_base(bufptr, &buflen, &is_negative, number, base)) {	\
	buflen = mmux_usize_literal(65);							\
	bufptr = alloca(buflen.value);								\
												\
	if (mmux_##STEM##_sprint_with_base(bufptr, &buflen, &is_negative, number, base)) {	\
	  dprintf(2, "%s: failed conversion of '", __func__);					\
	  mmux_ctype_dprintf(2, number);							\
	  dprintf(2, "' in base '");								\
	  mmux_ctype_dprintf(2, base);								\
	  dprintf(2, "'\n");									\
	  exit(EXIT_FAILURE);									\
	}											\
      }												\
												\
      {												\
	char	the_string[65];									\
	auto	char_counter = mmux_usize_literal(0);						\
												\
	memset(the_string, 'Z', 63);								\
	the_string[64] = '\0';									\
												\
	the_string[char_counter.value] = (is_negative)? '-' : '+';				\
	char_counter = mmux_ctype_incr(char_counter);						\
	memcpy(the_string + char_counter.value, bufptr, buflen.value);				\
	char_counter = mmux_ctype_add(char_counter, buflen);					\
	the_string[char_counter.value] = '\0';							\
	if (0) {										\
	  dprintf(2, "%s: buflen %lu, char_counter %lu, string: '%s'\n", __func__,		\
		  buflen.value, char_counter.value, the_string);				\
	}											\
	if (0 != strcmp(the_string, EXPECTED_STRING)) {						\
	  dprintf(2, "\n%s: invalid conversion, expected '%s', got '%s'\n", __func__,		\
		  EXPECTED_STRING, the_string);							\
	  exit(EXIT_FAILURE);									\
	}											\
      }												\
      {												\
	dprintf(2, " ");									\
	if (mmux_ctype_dprintf_with_base(2, number, base)) {					\
	  dprintf(2, "\n%s: error dprintfing value\n", __func__);				\
	  exit(EXIT_FAILURE);									\
	}											\
      }												\
    }	 											\
  }

static void
test_sprint_with_base_pointer (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(pointer,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(pointer,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(pointer,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_char (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(char,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(char,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(char,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_schar (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(char,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(char,	+123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(char,	-123,	10,	"-123");
    DOIT_FOR_THIS_NUMBER(char,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(char,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uchar (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uchar,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uchar,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uchar,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sshort (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sshort,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sshort,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sshort,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sshort,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sshort,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_ushort (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ushort,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(ushort,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ushort,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sint (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sint,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sint,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sint,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sint,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sint,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uint (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uint,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uint,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uint,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_slong (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(slong,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(slong,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(slong,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(slong,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(slong,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_ulong (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ulong,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(ulong,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ulong,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
#ifdef MMUX_CC_TYPES_HAS_SLLONG
static void
test_sprint_with_base_sllong (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sllong,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sllong,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sllong,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sllong,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sllong,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
static void
test_sprint_with_base_ullong (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ullong,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(ullong,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ullong,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
#endif
static void
test_sprint_with_base_sint8 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sint8,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sint8,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sint8,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uint8 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uint8,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uint8,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uint8,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sint16 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sint16,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sint16,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sint16,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sint16,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sint16,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uint16 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uint16,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uint16,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uint16,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sint32 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sint32,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sint32,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sint32,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sint32,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sint32,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uint32 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uint32,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uint32,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uint32,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sint64 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sint64,	 +123,	2,	"+1111011");
    DOIT_FOR_THIS_NUMBER(sint64,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sint64,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sint64,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sint64,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sint64,	-123,	16,	"-7B");

    DOIT_FOR_THIS_NUMBER(sint64,	10,	11,	"+A");
    DOIT_FOR_THIS_NUMBER(sint64,	20,	21,	"+K");
    DOIT_FOR_THIS_NUMBER(sint64,	30,	31,	"+U");
    DOIT_FOR_THIS_NUMBER(sint64,	40,	41,	"+e");
    DOIT_FOR_THIS_NUMBER(sint64,	50,	51,	"+o");
    DOIT_FOR_THIS_NUMBER(sint64,	60,	61,	"+y");
    DOIT_FOR_THIS_NUMBER(sint64,	61,	62,	"+z");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uint64 (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uint64,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uint64,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uint64,	123,	16,	"+7B");

    DOIT_FOR_THIS_NUMBER(sint64,	10,	11,	"+A");
    DOIT_FOR_THIS_NUMBER(sint64,	20,	21,	"+K");
    DOIT_FOR_THIS_NUMBER(sint64,	30,	31,	"+U");
    DOIT_FOR_THIS_NUMBER(sint64,	40,	41,	"+e");
    DOIT_FOR_THIS_NUMBER(sint64,	50,	51,	"+o");
    DOIT_FOR_THIS_NUMBER(sint64,	60,	61,	"+y");
    DOIT_FOR_THIS_NUMBER(sint64,	61,	62,	"+z");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_byte (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(byte,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(byte,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(byte,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_octet (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(octet,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(octet,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(octet,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_ssize (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ssize,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ssize,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(ssize,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(ssize,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(ssize,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_usize (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(usize,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(usize,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(usize,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sintmax (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sintmax,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sintmax,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sintmax,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sintmax,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sintmax,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uintmax (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uintmax,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uintmax,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uintmax,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_sintptr (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(sintptr,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(sintptr,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(sintptr,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(sintptr,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(sintptr,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uintptr (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uintptr,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uintptr,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uintptr,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_ptrdiff (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ptrdiff,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ptrdiff,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(ptrdiff,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(ptrdiff,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(ptrdiff,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_mode (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(mode,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(mode,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(mode,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_off (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(off,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(off,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(off,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(off,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(off,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_pid (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(pid,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(pid,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(pid,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(pid,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(pid,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_uid (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(uid,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(uid,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(uid,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_gid (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(gid,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(gid,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(gid,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_wchar (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(wchar,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(wchar,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(wchar,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(wchar,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(wchar,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_wint (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(wint,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(wint,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(wint,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_time (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(time,	 +123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(time,	+1234,	10,	"+1234");
    DOIT_FOR_THIS_NUMBER(time,	-1234,	10,	"-1234");
    DOIT_FOR_THIS_NUMBER(time,	+123,	16,	"+7B");
    DOIT_FOR_THIS_NUMBER(time,	-123,	16,	"-7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_socklen (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(socklen,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(socklen,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(socklen,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_rlim (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(rlim,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(rlim,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(rlim,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_ino (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(ino,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(ino,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(ino,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_dev (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(dev,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(dev,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(dev,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_nlink (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(nlink,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(nlink,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(nlink,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}
static void
test_sprint_with_base_blkcnt (void)
{
  dprintf(2, "%s: running test", __func__);
  {
    DOIT_FOR_THIS_NUMBER(blkcnt,	  3,	10,	"+3");
    DOIT_FOR_THIS_NUMBER(blkcnt,	123,	10,	"+123");
    DOIT_FOR_THIS_NUMBER(blkcnt,	123,	16,	"+7B");
  }
  dprintf(2, " DONE\n");
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

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
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  if (1) {	test_sprint_sllong();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  if (1) {	test_sprint_ullong();		}
#endif
  if (1) {	test_sprint_sint8();		}
  if (1) {	test_sprint_uint8();		}
  if (1) {	test_sprint_sint16();		}
  if (1) {	test_sprint_uint16();		}
  if (1) {	test_sprint_sint32();		}
  if (1) {	test_sprint_uint32();		}
  if (1) {	test_sprint_sint64();		}
  if (1) {	test_sprint_uint64();		}
  if (1) {	test_sprint_byte();		}
  if (1) {	test_sprint_octet();		}
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

  if (1) {	test_sprint_ino();		}
  if (1) {	test_sprint_dev();		}
  if (1) {	test_sprint_nlink();		}
  if (1) {	test_sprint_blkcnt();		}

  if (1) {	test_sprint_flonumfl();		}
  if (1) {	test_sprint_flonumdb();		}
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (1) {	test_sprint_flonumldb();		}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (1) {	test_sprint_flonumf32();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (1) {	test_sprint_flonumf64();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (1) {	test_sprint_flonumf128();		}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (1) {	test_sprint_flonumf32x();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (1) {	test_sprint_flonumf64x();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (1) {	test_sprint_flonumf128x();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (1) {	test_sprint_flonumd32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (1) {	test_sprint_flonumd64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (1) {	test_sprint_flonumd128();	}
#endif

  if (1) {	test_sprint_flonumcfl();		}
  if (1) {	test_sprint_flonumcdb();		}
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  if (1) {	test_sprint_flonumcldb();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  if (1) {	test_sprint_flonumcf32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  if (1) {	test_sprint_flonumcf64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  if (1) {	test_sprint_flonumcf128();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  if (1) {	test_sprint_flonumcf32x();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  if (1) {	test_sprint_flonumcf64x();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  if (1) {	test_sprint_flonumcf128x();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  if (1) {	test_sprint_flonumcd32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  if (1) {	test_sprint_flonumcd64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  if (1) {	test_sprint_flonumcd128();	}
#endif

/* ------------------------------------------------------------------ */

  if (1) {	test_sprint_with_base_pointer();	}
  if (1) {	test_sprint_with_base_char();		}
  if (1) {	test_sprint_with_base_schar();		}
  if (1) {	test_sprint_with_base_uchar();		}
  if (1) {	test_sprint_with_base_sshort();		}
  if (1) {	test_sprint_with_base_ushort();		}
  if (1) {	test_sprint_with_base_sint();		}
  if (1) {	test_sprint_with_base_uint();		}
  if (1) {	test_sprint_with_base_slong();		}
  if (1) {	test_sprint_with_base_ulong();		}
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  if (1) {	test_sprint_with_base_sllong();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  if (1) {	test_sprint_with_base_ullong();		}
#endif
  if (1) {	test_sprint_with_base_sint8();		}
  if (1) {	test_sprint_with_base_uint8();		}
  if (1) {	test_sprint_with_base_sint16();		}
  if (1) {	test_sprint_with_base_uint16();		}
  if (1) {	test_sprint_with_base_sint32();		}
  if (1) {	test_sprint_with_base_uint32();		}
  if (1) {	test_sprint_with_base_sint64();		}
  if (1) {	test_sprint_with_base_uint64();		}
  if (1) {	test_sprint_with_base_byte();		}
  if (1) {	test_sprint_with_base_octet();		}
  if (1) {	test_sprint_with_base_ssize();		}
  if (1) {	test_sprint_with_base_usize();		}
  if (1) {	test_sprint_with_base_sintmax();	}
  if (1) {	test_sprint_with_base_uintmax();	}
  if (1) {	test_sprint_with_base_sintptr();	}
  if (1) {	test_sprint_with_base_uintptr();	}
  if (1) {	test_sprint_with_base_ptrdiff();	}
  if (1) {	test_sprint_with_base_mode();		}
  if (1) {	test_sprint_with_base_off();		}
  if (1) {	test_sprint_with_base_pid();		}
  if (1) {	test_sprint_with_base_uid();		}
  if (1) {	test_sprint_with_base_gid();		}
  if (1) {	test_sprint_with_base_wchar();		}
  if (1) {	test_sprint_with_base_wint();		}
  if (1) {	test_sprint_with_base_time();		}
  if (1) {	test_sprint_with_base_socklen();	}
  if (1) {	test_sprint_with_base_rlim();		}

  if (1) {	test_sprint_with_base_ino();		}
  if (1) {	test_sprint_with_base_dev();		}
  if (1) {	test_sprint_with_base_nlink();		}
  if (1) {	test_sprint_with_base_blkcnt();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
