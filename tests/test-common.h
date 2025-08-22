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
    fprintf(stderr, "%s: setting output format for flonumfl\n", __func__);
    assert(false == mmux_flonumfl_set_output_format("%.3f", __func__));
    fprintf(stderr, "%s: setting output format for flonumdb\n", __func__);
    assert(false == mmux_flonumdb_set_output_format("%.3f", __func__));
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
    fprintf(stderr, "%s: setting output format for flonumldb\n", __func__);
    assert(false == mmux_flonumldb_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
    fprintf(stderr, "%s: setting output format for flonumf32\n", __func__);
    assert(false == mmux_flonumf32_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
    fprintf(stderr, "%s: setting output format for flonumf64\n", __func__);
    assert(false == mmux_flonumf64_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
    fprintf(stderr, "%s: setting output format for flonumf128\n", __func__);
    assert(false == mmux_flonumf128_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
    fprintf(stderr, "%s: setting output format for flonumf32x\n", __func__);
    assert(false == mmux_flonumf32x_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
    fprintf(stderr, "%s: setting output format for flonumf64x\n", __func__);
    assert(false == mmux_flonumf64x_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
    fprintf(stderr, "%s: setting output format for flonumf128x\n", __func__);
    assert(false == mmux_flonumf128x_set_output_format("%.3f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
    fprintf(stderr, "%s: setting output format for flonumd32\n", __func__);
    assert(false == mmux_flonumd32_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
    fprintf(stderr, "%s: setting output format for flonumd64\n", __func__);
    assert(false == mmux_flonumd64_set_output_format("%.3f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
    fprintf(stderr, "%s: setting output format for flonumd128\n", __func__);
    assert(false == mmux_flonumd128_set_output_format("%.3f", __func__));
#endif
  }
}

/* end of file */
