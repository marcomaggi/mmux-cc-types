/*
  Part of: MMUX CC Tests
  Contents: small test file to try stuff
  Date: Sep  7, 2025

  Abstract

	Small test file to try stuff.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

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
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  auto	op   = mmux_flonumcfl_rectangular_literal(5.0,3.0);
  auto	erop = mmux_flonumcfl_rectangular_literal(81'121.465'3,58'474.848'2);
  auto	eps  = mmux_flonumcfl_rectangular_literal(1e-3,1e-3);
  auto	rop  = mmux_ctype_exp10(op);

  if (1) {
    auto	erop_re	= mmux_ctype_real_part(erop);
    auto	rop_re	= mmux_ctype_real_part(rop);
    auto	eps_re	= mmux_ctype_real_part(eps);

    dprintf(2, "%-15s", "expected:");
    mmux_flonumcfl_dprintf(2, erop);
    dprintf(2, "\n");
    dprintf(2, "%-15s", "got:");
    mmux_flonumcfl_dprintf(2, rop);
    dprintf(2, "\n");

    if (1) {
      auto	abs_diff_re = mmux_ctype_absolute(mmux_ctype_sub(erop_re, rop_re));

      dprintf(2, "%-15s", "abs_diff_re:");
      mmux_ctype_dprintf(2, abs_diff_re);
      dprintf(2, "\n");
    }
    if (1) {
      auto	the_max_re	= mmux_ctype_max(mmux_ctype_absolute(erop_re), mmux_ctype_absolute(rop_re));
      auto	eps_compar_re	= mmux_ctype_mul(mmux_ctype_absolute(eps_re),  the_max_re);

      dprintf(2, "%-15s", "eps_compar_re:");
      mmux_ctype_dprintf(2, eps_compar_re);
      dprintf(2, "\n");
    }
  }

  if (mmux_ctype_equal_relepsilon(erop, rop, eps)) {
    dprintf(2," success\n");
  } else {
    dprintf(2," failure\n");
  }

  exit(EXIT_SUCCESS);
}

/* end of file */
