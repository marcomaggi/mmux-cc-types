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

#include <mmux-cc-types.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/** --------------------------------------------------------------------
 ** Integers.
 ** ----------------------------------------------------------------- */

static void
test_sprint_pointer (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_pointer_t	X = (mmux_pointer_t)123;
  mmux_sint_t		required_nbytes = mmux_pointer_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_pointer_sprint(str, required_nbytes, X));
    assert(0 == strcmp("0x7b", str));
    fprintf(stderr, "required_bytes = %d, str pointer = '%s'\n", required_nbytes, str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_char (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_char_t		X = 65;
  mmux_sint_t		required_nbytes = mmux_char_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_char_sprint(str, required_nbytes, X));
    assert(0 == strcmp("A", str));
    fprintf(stderr, "str char = '%s'\n", str);
  }
}
static void
test_sprint_schar (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_schar_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_schar_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_schar_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str schar = '%s'\n", str);
  }
}
static void
test_sprint_uchar (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uchar_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uchar_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uchar_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uchar = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sshort (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sshort_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sshort_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sshort_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sshort = '%s'\n", str);
  }
}
static void
test_sprint_ushort (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ushort_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_ushort_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ushort_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str ushort = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sint (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sint_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sint_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sint_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sint = '%s'\n", str);
  }
}
static void
test_sprint_uint (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uint_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uint_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uint_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uint = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_slong (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_slong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_slong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_slong_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str slong = '%s'\n", str);
  }
}
static void
test_sprint_ulong (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ulong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_ulong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ulong_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str ulong = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sllong (void)
{
#ifdef MMUX_HAVE_CC_TYPE_SLLONG
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sllong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sllong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sllong_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sllong = '%s'\n", str);
  }
#endif
}
static void
test_sprint_ullong (void)
{
#ifdef MMUX_HAVE_CC_TYPE_ULLONG
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ullong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_ullong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ullong_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str ullong = '%s'\n", str);
  }
#endif
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sint8 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sint8_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sint8_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sint8_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sint8 = '%s'\n", str);
  }
}
static void
test_sprint_uint8 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uint8_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uint8_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uint8_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uint8 = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sint16 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sint16_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sint16_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sint16_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sint16 = '%s'\n", str);
  }
}
static void
test_sprint_uint16 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uint16_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uint16_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uint16_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uint16 = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sint32 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sint32_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sint32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sint32_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sint32 = '%s'\n", str);
  }
}
static void
test_sprint_uint32 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uint32_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uint32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uint32_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uint32 = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sint64 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sint64_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sint64_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sint64_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sint64 = '%s'\n", str);
  }
}
static void
test_sprint_uint64 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uint64_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uint64_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uint64_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uint64 = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_ssize (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ssize_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_ssize_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ssize_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str ssize = '%s'\n", str);
  }
}
static void
test_sprint_usize (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_usize_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_usize_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_usize_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str usize = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sintmax (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sintmax_t	X = 123;
  mmux_sint_t		required_nbytes = mmux_sintmax_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sintmax_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sintmax = '%s'\n", str);
  }
}
static void
test_sprint_uintmax (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uintmax_t	X = 123;
  mmux_sint_t		required_nbytes = mmux_uintmax_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uintmax_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uintmax = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sintptr (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sintptr_t	X = 123;
  mmux_sint_t		required_nbytes = mmux_sintptr_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sintptr_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str sintptr = '%s'\n", str);
  }
}
static void
test_sprint_uintptr (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uintptr_t	X = 123;
  mmux_sint_t		required_nbytes = mmux_uintptr_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uintptr_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uintptr = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_ptrdiff (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ptrdiff_t	X = 123;
  mmux_sint_t		required_nbytes = mmux_ptrdiff_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ptrdiff_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str ptrdiff = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_mode (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_mode_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_mode_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_mode_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str mode = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_off (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_off_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_off_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_off_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str off = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_pid (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_pid_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_pid_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_pid_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str pid = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_uid (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_uid_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_uid_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_uid_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str uid = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_gid (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_gid_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_gid_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_gid_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str gid = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_wchar (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_wchar_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_wchar_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_wchar_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str wchar = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_wint (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_wint_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_wint_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_wint_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str wint = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_time (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_time_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_time_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_time_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str time = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_socklen (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_socklen_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_socklen_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_socklen_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str socklen = '%s'\n", str);
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_rlim (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_rlim_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_rlim_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_rlim_sprint(str, required_nbytes, X));
    assert(0 == strcmp("123", str));
    fprintf(stderr, "str rlim = '%s'\n", str);
  }
}


/** --------------------------------------------------------------------
 ** mmxu_floatX_t.
 ** ----------------------------------------------------------------- */

static void
test_sprint_float (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float_t		X = (mmux_float_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float_sprint(str, required_nbytes, X));
    assert(0 == strcmp("0.123", str));
    fprintf(stderr, "X=%f, str float = '%s'\n", (mmux_double_t)X, str);
  }
}


/** --------------------------------------------------------------------
 ** mmxu_floatX_t.
 ** ----------------------------------------------------------------- */

static void
test_sprint_float32 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  fprintf(stderr, "MMUX_HAVE_CC_TYPE_FLOAT32=%d\n", MMUX_HAVE_CC_TYPE_FLOAT32);
  mmux_float32_t	X = (mmux_float32_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float32_sprint(str, required_nbytes, X));
    assert(0 == strcmp("0.123", str));
    fprintf(stderr, "X=%f, str float32 = '%s'\n", (mmux_double_t)X, str);
  }
#endif
}


/** --------------------------------------------------------------------
 ** mmxu_decimalX_t.
 ** ----------------------------------------------------------------- */

static void
test_sprint_decimal32 (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  fprintf(stderr, "MMUX_HAVE_CC_TYPE_DECIMAL32=%d\n", MMUX_HAVE_CC_TYPE_DECIMAL32);
  mmux_decimal32_t	X = (mmux_decimal32_t)0.123;
  mmux_sint_t		required_nbytes = mmux_decimal32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_decimal32_sprint(str, required_nbytes, X));
    assert(0 == strcmp("0.123", str));
    fprintf(stderr, "X=%f, str decimal32 = '%s'\n", (mmux_double_t)X, str);
  }
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
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

  if (0) {	test_sprint_float32();		}
  if (0) {	test_sprint_decimal32();	}


  exit(EXIT_SUCCESS);
}

/* end of file */
