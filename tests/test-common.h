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
#include <mmux-cc-types.h>

#define BOOL_STRING(BOOL)	((true == BOOL)? "true" : "false")

static void test_set_output_formats (void)
  __attribute__((__unused__));

static void test_set_output_formats_verbose (bool verbose)
  __attribute__((__unused__));

static void dprintf_newline(int fd);


/** --------------------------------------------------------------------
 ** Numeric format helpers.
 ** ----------------------------------------------------------------- */

void
test_set_output_formats (void)
{
  test_set_output_formats_verbose(false);
}
void
test_set_output_formats_verbose (bool verbose)
{
  if (verbose) { dprintf(2, "%s: setting output format for flonumfl\n", __func__); }
  assert(false == mmux_flonumfl_set_output_format("%.6f", __func__));
  if (verbose) { dprintf(2, "%s: setting output format for flonumdb\n", __func__); }
  assert(false == mmux_flonumdb_set_output_format("%.6f", __func__));
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (verbose) { dprintf(2, "%s: setting output format for flonumldb\n", __func__); }
  assert(false == mmux_flonumldb_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (verbose) { dprintf(2, "%s: setting output format for flonumf32\n", __func__); }
  assert(false == mmux_flonumf32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (verbose) { dprintf(2, "%s: setting output format for flonumf64\n", __func__); }
  assert(false == mmux_flonumf64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (verbose) { dprintf(2, "%s: setting output format for flonumf128\n", __func__); }
  assert(false == mmux_flonumf128_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf32x\n", __func__); }
  assert(false == mmux_flonumf32x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf64x\n", __func__); }
  assert(false == mmux_flonumf64x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf128x\n", __func__); }
  assert(false == mmux_flonumf128x_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (verbose) { dprintf(2, "%s: setting output format for flonumd32\n", __func__); }
  assert(false == mmux_flonumd32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (verbose) { dprintf(2, "%s: setting output format for flonumd64\n", __func__); }
  assert(false == mmux_flonumd64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (verbose) { dprintf(2, "%s: setting output format for flonumd128\n", __func__); }
  assert(false == mmux_flonumd128_set_output_format("%.6f", __func__));
#endif
}


/** --------------------------------------------------------------------
 ** Printing helpers.
 ** ----------------------------------------------------------------- */

void
dprintf_newline (int fd)
{
  dprintf(fd, "\n");
}

/* end of file */
