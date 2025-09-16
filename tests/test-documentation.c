/*
  Part of: MMUX CC Tests
  Contents: test file for code examples in the documentation
  Date: Sep 14, 2025

  Abstract

	Test file for code examples in the documentation.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


static void
test_complex_numbers (void)
{
  dprintf(2, "%s: compute the complex argument of a complex number\n", __func__);
  {
    mmux_flonumcf64_t  Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
    mmux_flonumf64_t   A = mmux_flonumcf64_argument(Z);

    mmux_flonumf64_dprintf(2, A);
    dprintf_newline(2);
  }

  dprintf(2, "%s: generically compute the complex argument of a complex number\n", __func__);
  {
    auto	Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
    auto	A = mmux_ctype_argument(Z);

    mmux_ctype_dprintf(2, A);
    dprintf_newline(2);
  }

  dprintf(2, "%s: compute the complex argument of a real number\n", __func__);
  {
    mmux_flonumf64_t   Z = mmux_flonumf64_literal(0.123);
    mmux_flonumf64_t   A = mmux_flonumf64_argument(Z);

    mmux_flonumf64_dprintf(2, A);
    dprintf_newline(2);
  }

  dprintf(2, "%s: generically compute the complex argument of a real number\n", __func__);
  {
    auto	Z = mmux_flonumf64_literal(0.123);
    auto	A = mmux_ctype_argument(Z);

    mmux_ctype_dprintf(2, A);
    dprintf_newline(2);
  }
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_complex_numbers();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
