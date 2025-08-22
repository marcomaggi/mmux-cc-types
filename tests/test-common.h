/*
  Part of: MMUX CC Types
  Contents: common stuff for tests
  Date: Aug 19, 2025

  Abstract

	Common facilities for testing.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#undef  _GNU_SOURCE
#define _GNU_SOURCE	1

#undef NDEBUG
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BOOL_STRING(BOOL)	((true == BOOL)? "true" : "false")


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

__attribute__((__unused__)) static void
test_set_output_formats (void)
{
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
}

/* end of file */
