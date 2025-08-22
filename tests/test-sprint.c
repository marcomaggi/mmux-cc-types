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

#undef  _GNU_SOURCE
#define _GNU_SOURCE	1

#include <mmux-cc-types.h>
#include <test-common.h>


/** --------------------------------------------------------------------
 ** Integers.
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


/** --------------------------------------------------------------------
 ** Real flonums.
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

DEFINE_TEST_SPRINTER_FUNCTION(float,		0.123,	"0.123")
DEFINE_TEST_SPRINTER_FUNCTION(double,		0.123,	"0.123")
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
DEFINE_TEST_SPRINTER_FUNCTION(ldouble,		0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
DEFINE_TEST_SPRINTER_FUNCTION(float32,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
DEFINE_TEST_SPRINTER_FUNCTION(float64,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
DEFINE_TEST_SPRINTER_FUNCTION(float128,		0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
DEFINE_TEST_SPRINTER_FUNCTION(float32x,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
DEFINE_TEST_SPRINTER_FUNCTION(float64x,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
DEFINE_TEST_SPRINTER_FUNCTION(float128x,	0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
DEFINE_TEST_SPRINTER_FUNCTION(decimal32,	0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
DEFINE_TEST_SPRINTER_FUNCTION(decimal64,	0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
DEFINE_TEST_SPRINTER_FUNCTION(decimal128,	0.123,	"0.123")
#endif


/** --------------------------------------------------------------------
 ** Complex flonums.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_TEST_SPRINTER_FUNCTION
#define DEFINE_TEST_SPRINTER_FUNCTION(STEM,LITERAL_VALUE_RE,LITERAL_VALUE_IM,EXPECTED_STRING)	\
  static void											\
  test_sprint_##STEM (void)									\
  {												\
    dprintf(2, "running test: %s", __func__);							\
    auto	Z = mmux_##STEM##_make_rectangular_literal(LITERAL_VALUE_RE,LITERAL_VALUE_IM);	\
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

DEFINE_TEST_SPRINTER_FUNCTION(complexf,		0.123, 0.456,	"(0.123)+i*(0.456)")
DEFINE_TEST_SPRINTER_FUNCTION(complexd,		0.123, 0.456,	"(0.123)+i*(0.456)")
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
DEFINE_TEST_SPRINTER_FUNCTION(complexld,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
DEFINE_TEST_SPRINTER_FUNCTION(complexf32,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
DEFINE_TEST_SPRINTER_FUNCTION(complexf64,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
DEFINE_TEST_SPRINTER_FUNCTION(complexf128,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
DEFINE_TEST_SPRINTER_FUNCTION(complexf32x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
DEFINE_TEST_SPRINTER_FUNCTION(complexf64x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
DEFINE_TEST_SPRINTER_FUNCTION(complexf128x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
DEFINE_TEST_SPRINTER_FUNCTION(complexd32,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
DEFINE_TEST_SPRINTER_FUNCTION(complexd64,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
DEFINE_TEST_SPRINTER_FUNCTION(complexd128,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif


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
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  if (1) {	test_sprint_ldouble();		}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  if (1) {	test_sprint_float32();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  if (1) {	test_sprint_float64();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  if (1) {	test_sprint_float128();		}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  if (1) {	test_sprint_float32x();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  if (1) {	test_sprint_float64x();		}
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  if (1) {	test_sprint_float128x();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  if (1) {	test_sprint_decimal32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  if (1) {	test_sprint_decimal64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  if (1) {	test_sprint_decimal128();	}
#endif

  if (1) {	test_sprint_complexf();		}
  if (1) {	test_sprint_complexd();		}
#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {	test_sprint_complexld();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {	test_sprint_complexf32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {	test_sprint_complexf64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {	test_sprint_complexf128();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  if (1) {	test_sprint_complexf32x();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  if (1) {	test_sprint_complexf64x();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  if (1) {	test_sprint_complexf128x();	}
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {	test_sprint_complexd32();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {	test_sprint_complexd64();	}
#endif
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {	test_sprint_complexd128();	}
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
