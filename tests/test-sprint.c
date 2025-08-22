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

DEFINE_TEST_SPRINTER_FUNCTION(flonumfl,		0.123,	"0.123")
DEFINE_TEST_SPRINTER_FUNCTION(flonumdb,		0.123,	"0.123")
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
DEFINE_TEST_SPRINTER_FUNCTION(flonumldb,		0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
DEFINE_TEST_SPRINTER_FUNCTION(flonumf32,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
DEFINE_TEST_SPRINTER_FUNCTION(flonumf64,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
DEFINE_TEST_SPRINTER_FUNCTION(flonumf128,		0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf32x,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf64x,		0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
DEFINE_TEST_SPRINTER_FUNCTION(flonumf128x,	0.123,	"0.123")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
DEFINE_TEST_SPRINTER_FUNCTION(flonumd32,	0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
DEFINE_TEST_SPRINTER_FUNCTION(flonumd64,	0.123,	"0.123")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
DEFINE_TEST_SPRINTER_FUNCTION(flonumd128,	0.123,	"0.123")
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

DEFINE_TEST_SPRINTER_FUNCTION(flonumcfl,		0.123, 0.456,	"(0.123)+i*(0.456)")
DEFINE_TEST_SPRINTER_FUNCTION(flonumcdb,		0.123, 0.456,	"(0.123)+i*(0.456)")
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
DEFINE_TEST_SPRINTER_FUNCTION(flonumcldb,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf32,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf64,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf128,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf32x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf64x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
DEFINE_TEST_SPRINTER_FUNCTION(flonumcf128x,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd32,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd64,	0.123, 0.456,	"(0.123)+i*(0.456)")
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
DEFINE_TEST_SPRINTER_FUNCTION(flonumcd128,	0.123, 0.456,	"(0.123)+i*(0.456)")
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

  exit(EXIT_SUCCESS);
}

/* end of file */
