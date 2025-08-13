/*
  Part of: MMUX CC Tests
  Contents: miscellaneous experiments
  Date: Aug 13, 2025

  Abstract

	Test file for functions.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types.h>
#include <stdio.h>
#include <stdlib.h>


/** --------------------------------------------------------------------
 ** Byte data structure.
 ** ----------------------------------------------------------------- */

/* How does the code look if we turn type definitions like:
 *
 *   typedef int8_t	mmux_byte_t;
 *
 * into struct definitions like:
 *
 *   typedef struct mmux_byte_t { int8_t value; } mmux_byte_t;
 *
 * Is the code too ugly to use?
 */

typedef struct test_byte_t {
  int8_t	value;
} test_byte_t;

static void
test_byte_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    test_byte_t *	bufptr = malloc(sizeof(test_byte_t) * buflen);

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    for (uint8_t i=0; i<127; ++i) {
      bufptr[i].value = i;
    }
    free(bufptr);
  }

  /* Static memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    test_byte_t		bufptr[buflen];

    for (uint8_t i=0; i<20; ++i) {
      bufptr[i].value = 100 + i;
    }

    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: byte at index '%d' is: '%d'\n", __func__, i, bufptr[i].value);
    }
  }
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_byte_data_structure();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
