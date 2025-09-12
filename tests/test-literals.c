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

  if (1) {
    auto	val = mmux_standard_char_literal(65);
    auto	str = mmux_char(val);
    dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
    mmux_ctype_dprintf(2, str);
    dprintf(2, "\n");
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_schar_literal(65);
      auto	str = mmux_schar(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uchar_literal(65);
      auto	str = mmux_uchar(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sshort_literal(65);
      auto	str = mmux_sshort(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_ushort_literal(65);
      auto	str = mmux_ushort(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sint_literal(65);
      auto	str = mmux_sint(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uint_literal(65);
      auto	str = mmux_uint(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_slong_literal(65);
      auto	str = mmux_slong(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_ulong_literal(65);
      auto	str = mmux_ulong(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
#ifdef MMUX_CC_TYPES_HAS_SLLONG
    if (1) {
      auto	val = mmux_standard_sllong_literal(65);
      auto	str = mmux_sllong(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
    if (1) {
      auto	val = mmux_standard_ullong_literal(65);
      auto	str = mmux_ullong(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sint8_literal(65);
      auto	str = mmux_sint8(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uint8_literal(65);
      auto	str = mmux_uint8(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sint16_literal(65);
      auto	str = mmux_sint16(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uint16_literal(65);
      auto	str = mmux_uint16(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sint32_literal(65);
      auto	str = mmux_sint32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uint32_literal(65);
      auto	str = mmux_uint32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sint64_literal(65);
      auto	str = mmux_sint64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uint64_literal(65);
      auto	str = mmux_uint64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_byte_literal(65);
      auto	str = mmux_byte(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_octet_literal(65);
      auto	str = mmux_octet(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sintmax_literal(65);
      auto	str = mmux_sintmax(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uintmax_literal(65);
      auto	str = mmux_uintmax(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_sintptr_literal(65);
      auto	str = mmux_sintptr(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }

    if (1) {
      auto	val = mmux_standard_uintptr_literal(65);
      auto	str = mmux_uintptr(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_mode_literal(65);
      auto	str = mmux_mode(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_off_literal(65);
      auto	str = mmux_off(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_ptrdiff_literal(65);
      auto	str = mmux_ptrdiff(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_pid_literal(65);
      auto	str = mmux_pid(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_uid_literal(65);
      auto	str = mmux_uid(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_gid_literal(65);
      auto	str = mmux_gid(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_wchar_literal(65);
      auto	str = mmux_wchar(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_wint_literal(65);
      auto	str = mmux_wint(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_time_literal(65);
      auto	str = mmux_time(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_socklen_literal(65);
      auto	str = mmux_socklen(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) {
      auto	val = mmux_standard_rlim_literal(65);
      auto	str = mmux_rlim(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumfl_literal(65);
      auto	str = mmux_flonumfl(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumfl_literal(0.123);
      auto	str = mmux_flonumfl(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumfl_literal(12e34);
      auto	str = mmux_flonumfl(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

  {
    if (1) { /* VALID no suffix on integer constant !!! */
      auto	val = mmux_standard_flonumdb_literal(65);
      auto	str = mmux_flonumdb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumdb_literal(0.123);
      auto	str = mmux_flonumdb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumdb_literal(12e34);
      auto	str = mmux_flonumdb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  {
    if (1) { /* VALID suffix on integer constant !!! */
      auto	val = mmux_standard_flonumldb_literal(65);
      auto	str = mmux_flonumldb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumldb_literal(0.123);
      auto	str = mmux_flonumldb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumldb_literal(12e34);
      auto	str = mmux_flonumldb(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf32_literal(65);
      auto	str = mmux_flonumf32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf32_literal(0.123);
      auto	str = mmux_flonumf32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf32_literal(12e34);
      auto	str = mmux_flonumf32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf64_literal(65);
      auto	str = mmux_flonumf64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf64_literal(0.123);
      auto	str = mmux_flonumf64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf64_literal(12e34);
      auto	str = mmux_flonumf64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf128_literal(65);
      auto	str = mmux_flonumf128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf128_literal(0.123);
      auto	str = mmux_flonumf128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf128_literal(12e34);
      auto	str = mmux_flonumf128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf32x_literal(65);
      auto	str = mmux_flonumf32x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf32x_literal(0.123);
      auto	str = mmux_flonumf32x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf32x_literal(12e34);
      auto	str = mmux_flonumf32x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf64x_literal(65);
      auto	str = mmux_flonumf64x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf64x_literal(0.123);
      auto	str = mmux_flonumf64x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf64x_literal(12e34);
      auto	str = mmux_flonumf64x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumf128x_literal(65);
      auto	str = mmux_flonumf128x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumf128x_literal(0.123);
      auto	str = mmux_flonumf128x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumf128x_literal(12e34);
      auto	str = mmux_flonumf128x(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumd32_literal(65);
      auto	str = mmux_flonumd32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumd32_literal(0.123);
      auto	str = mmux_flonumd32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumd32_literal(12e34);
      auto	str = mmux_flonumd32(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumd64_literal(65);
      auto	str = mmux_flonumd64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumd64_literal(0.123);
      auto	str = mmux_flonumd64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumd64_literal(12e34);
      auto	str = mmux_flonumd64(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  /* ------------------------------------------------------------------ */

#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  {
#if 0
    if (1) { /* invalid suffix on integer constant */
      auto	val = mmux_standard_flonumd128_literal(65);
      auto	str = mmux_flonumd128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
#endif
    if (1) {
      auto	val = mmux_standard_flonumd128_literal(0.123);
      auto	str = mmux_flonumd128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
    if (1) {
      auto	val = mmux_standard_flonumd128_literal(12e34);
      auto	str = mmux_flonumd128(val);
      dprintf(2, "%s: ", mmux_ctype_dispatch_stem(str));
      mmux_ctype_dprintf(2, str);
      dprintf(2, "\n");
    }
  }
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
