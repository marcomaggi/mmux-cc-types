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

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

typedef struct one_t { mmux_sint_t; } one_t;

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  {
    one_t	A = { { .value = 123 } };
    one_t	B = { { .value = 456 } };

    if (A.value == B.value) {
      dprintf(2, "%s: yes\n", __func__);
    } else {
      dprintf(2, "%s: no\n", __func__);
    }
  }

  exit(EXIT_SUCCESS);
}

/* end of file */
