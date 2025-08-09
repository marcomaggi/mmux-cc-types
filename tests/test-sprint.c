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
    fprintf(stderr, "required_bytes = %d, str pointer = '%s'\n", required_nbytes, str);
    assert(0 == strcmp("0x7b", str));
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
    fprintf(stderr, "str char = '%s'\n", str);
    assert(0 == strcmp("A", str));
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
    fprintf(stderr, "str schar = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uchar = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sshort = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str ushort = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sint = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uint = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str slong = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str ulong = '%s'\n", str);
    assert(0 == strcmp("123", str));
  }
}

/* ------------------------------------------------------------------ */

static void
test_sprint_sllong (void)
{
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_sllong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_sllong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_sllong_sprint(str, required_nbytes, X));
    fprintf(stderr, "str sllong = '%s'\n", str);
    assert(0 == strcmp("123", str));
  }
#endif
}
static void
test_sprint_ullong (void)
{
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ullong_t		X = 123;
  mmux_sint_t		required_nbytes = mmux_ullong_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ullong_sprint(str, required_nbytes, X));
    fprintf(stderr, "str ullong = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sint8 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uint8 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sint16 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uint16 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sint32 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uint32 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sint64 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uint64 = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str ssize = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str usize = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sintmax = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uintmax = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str sintptr = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uintptr = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str ptrdiff = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str mode = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str off = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str pid = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str uid = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str gid = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str wchar = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str wint = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str time = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str socklen = '%s'\n", str);
    assert(0 == strcmp("123", str));
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
    fprintf(stderr, "str rlim = '%s'\n", str);
    assert(0 == strcmp("123", str));
  }
}


/** --------------------------------------------------------------------
 ** Core floating-point number types.
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
    fprintf(stderr, "X=%f, str float = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
}
static void
test_sprint_double (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_double_t		X = (mmux_double_t)0.123;
  mmux_sint_t		required_nbytes = mmux_double_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_double_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str double = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
}
static void
test_sprint_ldouble (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_ldouble_t		X = (mmux_ldouble_t)0.123;
  mmux_sint_t		required_nbytes = mmux_ldouble_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_ldouble_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str ldouble = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Extended floating-point number types.
 ** ----------------------------------------------------------------- */

static void
test_sprint_float32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float32_t	X = (mmux_float32_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float32_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float32 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_float64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float64_t	X = (mmux_float64_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float64_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float64_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float64 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_float128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float128_t	X = (mmux_float128_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float128_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float128_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float128 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_float32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float32x_t	X = (mmux_float32x_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float32x_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float32x_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float32x = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_float64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float64x_t	X = (mmux_float64x_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float64x_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float64x_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float64x = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_float128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_float128x_t	X = (mmux_float128x_t)0.123;
  mmux_sint_t		required_nbytes = mmux_float128x_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_float128x_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str float128x = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Decimal floating-point number types.
 ** ----------------------------------------------------------------- */

static void
test_sprint_decimal32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_decimal32_t	X = (mmux_decimal32_t)0.123;
  mmux_sint_t		required_nbytes = mmux_decimal32_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_decimal32_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str decimal32 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_decimal64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_decimal64_t	X = (mmux_decimal64_t)0.123;
  mmux_sint_t		required_nbytes = mmux_decimal64_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_decimal64_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str decimal64 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}
static void
test_sprint_decimal128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_decimal128_t	X = (mmux_decimal128_t)0.123;
  mmux_sint_t		required_nbytes = mmux_decimal128_sprint_size(X);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_decimal128_sprint(str, required_nbytes, X));
    fprintf(stderr, "X=%f, str decimal128 = '%s'\n", (mmux_double_t)X, str);
    assert(0 == strcmp("0.123", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Core complex floating-point number types.
 ** ----------------------------------------------------------------- */

static void
test_sprint_complexf (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf_t	Z = mmux_complexf_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
}
static void
test_sprint_complexd (void)
{
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexd_t	Z = mmux_complexd_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexd_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexd_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexd = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
}
static void
test_sprint_complexld (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZLD
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexld_t	Z = mmux_complexld_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexld_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexld_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexld = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Extended complex floating-point number types.
 ** ----------------------------------------------------------------- */

static void
test_sprint_complexf32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF32
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf32_t	Z = mmux_complexf32_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf32_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf32_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf32 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexf64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF64
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf64_t	Z = mmux_complexf64_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf64_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf64_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf64 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexf128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF128
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf128_t	Z = mmux_complexf128_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf128_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf128_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf128 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexf32x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF32Z
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf32x_t	Z = mmux_complexf32x_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf32x_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf32x_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf32x = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexf64x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF64Z
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf64x_t	Z = mmux_complexf64x_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf64x_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf64x_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf64x = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexf128x (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZF128Z
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexf128x_t	Z = mmux_complexf128x_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexf128x_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexf128x_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexf128x = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Decimal complex floating-point number types.
 ** ----------------------------------------------------------------- */

static void
test_sprint_complexd32 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZD32
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexd32_t	Z = mmux_complexd32_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexd32_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexd32_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexd32 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexd64 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZD64
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexd64_t	Z = mmux_complexd64_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexd64_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexd64_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexd64 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}
static void
test_sprint_complexd128 (void)
{
#ifdef MMUX_CC_TYPES_HAS_COMPLEZD128
  fprintf(stderr, "running test: %s\n", __func__);
  mmux_complexd128_t	Z = mmux_complexd128_make_rectangular(1.234,5.678);
  mmux_sint_t		required_nbytes = mmux_complexd128_sprint_size(Z);

  assert(0 < required_nbytes);
  {
    mmux_char_t	str[required_nbytes];

    assert(false == mmux_complexd128_sprint(str, required_nbytes, Z));
    fprintf(stderr, "str complexd128 = '%s'\n", str);
    assert(0 == strcmp("(1.234)+i*(5.678)", str));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {
    fprintf(stderr, "%s: setting output format for float\n", __func__);
    assert(false == mmux_float_set_output_format("%.3f", __func__));
    fprintf(stderr, "%s: setting output format for double\n", __func__);
    assert(false == mmux_double_set_output_format("%.3f", __func__));
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
    fprintf(stderr, "%s: setting output format for ldouble\n", __func__);
    assert(false == mmux_ldouble_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
    fprintf(stderr, "%s: setting output format for float32\n", __func__);
    assert(false == mmux_float32_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
    fprintf(stderr, "%s: setting output format for float64\n", __func__);
    assert(false == mmux_float64_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
    fprintf(stderr, "%s: setting output format for float128\n", __func__);
    assert(false == mmux_float128_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
    fprintf(stderr, "%s: setting output format for float32x\n", __func__);
    assert(false == mmux_float32x_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
    fprintf(stderr, "%s: setting output format for float64x\n", __func__);
    assert(false == mmux_float64x_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
    fprintf(stderr, "%s: setting output format for float128x\n", __func__);
    assert(false == mmux_float128x_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
    fprintf(stderr, "%s: setting output format for decimal32\n", __func__);
    assert(false == mmux_decimal32_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
    fprintf(stderr, "%s: setting output format for decimal64\n", __func__);
    assert(false == mmux_decimal64_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
    fprintf(stderr, "%s: setting output format for decimal128\n", __func__);
    assert(false == mmux_decimal128_set_output_format("%.3f", __func__));
#endif
  }

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

  if (0) {	test_sprint_float();		}
  if (1) {	test_sprint_double();		}
  if (1) {	test_sprint_ldouble();		}

  if (0) {	test_sprint_float32();		}
  if (0) {	test_sprint_float64();		}
  if (0) {	test_sprint_float128();		}

  if (0) {	test_sprint_float32x();		}
  if (0) {	test_sprint_float64x();		}
  if (0) {	test_sprint_float128x();	}

  if (0) {	test_sprint_decimal32();	}
  if (0) {	test_sprint_decimal64();	}
  if (0) {	test_sprint_decimal128();	}

  if (1) {	test_sprint_complexf();		}
  if (1) {	test_sprint_complexd();		}
  if (1) {	test_sprint_complexld();	}

  if (0) {	test_sprint_complexf32();	}
  if (0) {	test_sprint_complexf64();	}
  if (0) {	test_sprint_complexf128();	}

  if (0) {	test_sprint_complexf32x();	}
  if (0) {	test_sprint_complexf64x();	}
  if (0) {	test_sprint_complexf128x();	}

  if (0) {	test_sprint_complexd32();	}
  if (0) {	test_sprint_complexd64();	}
  if (0) {	test_sprint_complexd128();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
