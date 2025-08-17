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
#include <string.h>


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
  mmux_standard_sint8_t	value;
} test_byte_t;

static void
test_test_byte_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wpedantic\"");
    constexpr auto	buflen = mmux_usize(1024);
    _Pragma("GCC diagnostic pop");
    test_byte_t *	bufptr = malloc(sizeof(test_byte_t) * buflen.value);

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
 ** 3Bytes data structure.
 ** ----------------------------------------------------------------- */

typedef struct test_3bytes_t {
  mmux_standard_sint8_t	value1;
  mmux_standard_sint8_t	value2;
  mmux_standard_sint8_t	value3;
} test_3bytes_t;

static void
test_3bytes_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wpedantic\"");
    constexpr auto	buflen = mmux_usize_literal(1024);
    _Pragma("GCC diagnostic pop");
    test_3bytes_t *	bufptr = malloc(sizeof(test_3bytes_t) * buflen.value);

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    for (uint8_t i=0; i<127; ++i) {
      bufptr[i].value1 = i;
      bufptr[i].value2 = i;
      bufptr[i].value3 = i;
    }
    free(bufptr);
  }

  /* Static memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    test_3bytes_t	bufptr[buflen];

    for (uint8_t i=0; i<20; ++i) {
      bufptr[i].value1 = 100 + i;
      bufptr[i].value2 = 101 + i;
      bufptr[i].value3 = 102 + i;
    }

    fprintf(stderr, "%s: size of test_3bytes_t: '%lu'\n", __func__, sizeof(test_3bytes_t));

    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: 3bytes at index '%d' is: '%d' '%d' '%d'\n", __func__, i,
	      bufptr[i].value1, bufptr[i].value2, bufptr[i].value3);
    }
  }
}


/** --------------------------------------------------------------------
 ** mmux_char_t
 ** ----------------------------------------------------------------- */

static void
test_char_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wpedantic\"");
    constexpr auto	buflen = mmux_usize(1024);
    _Pragma("GCC diagnostic pop");
    mmux_char_t *	bufptr = malloc(sizeof(mmux_char_t) * buflen.value);

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    for (uint8_t i=0; i<127; ++i) {
      bufptr[i] = mmux_char(i);
    }
    for (uint8_t i=0; i<127; ++i) {
      bufptr[i].value = i;
    }
    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: octet at index '%u' is: '%u'\n", __func__, i, bufptr[i].value);
    }
    free(bufptr);
  }

  /* Static memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    mmux_char_t		bufptr[buflen];

    for (uint8_t i=0; i<20; ++i) {
      bufptr[i].value = 100 + i;
    }

    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: byte at index '%d' is: '%d'\n", __func__, i, bufptr[i].value);
    }
  }

  /* ASCIIZ string, dynamic memory allocation. */
  if (1) {
    auto const	buflen = mmux_usize(4);
    auto const	bufptr = (mmux_char_t *)malloc(sizeof(mmux_char_t) * (1 + buflen.value));

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    strncpy((char *)bufptr, "ciao", 5);

    for (int i=0; i<4; ++i) {
      fprintf(stderr, "%s: char at index '%u' is: '%c'\n", __func__, i, bufptr[i].value);
    }
    fprintf(stderr, "%s: full mmux_char_t string is (len=%lu): '%s'\n", __func__,
	    strlen((char *)bufptr), (char *)bufptr);
    free(bufptr);
  }

  /* ASCIIZ string, static memory allocation. */
  if (1) {
    auto const	buflen = mmux_usize(4);
    mmux_char_t bufptr[1+buflen.value];

    strncpy((char *)bufptr, "ciao", 5);

    for (int i=0; i<4; ++i) {
      fprintf(stderr, "%s: char at index '%u' is: '%c'\n", __func__, i, bufptr[i].value);
    }
    fprintf(stderr, "%s: full mmux_char_t string is (len=%lu): '%s'\n", __func__,
	    strlen((char *)bufptr), (char *)bufptr);
  }
}


/** --------------------------------------------------------------------
 ** mmux_byte_t
 ** ----------------------------------------------------------------- */

static void
test_byte_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wpedantic\"");
    constexpr auto	buflen = mmux_usize(1024);
    _Pragma("GCC diagnostic pop");
    mmux_byte_t *	bufptr = malloc(sizeof(mmux_byte_t) * buflen.value);

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    for (uint8_t i=0; i<127; ++i) {
      bufptr[i].value = i;
    }
    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: octet at index '%u' is: '%u'\n", __func__, i, bufptr[i].value);
    }
    free(bufptr);
  }

  /* Static memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    mmux_byte_t		bufptr[buflen];

    for (uint8_t i=0; i<20; ++i) {
      bufptr[i].value = 100 + i;
    }

    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: byte at index '%d' is: '%d'\n", __func__, i, bufptr[i].value);
    }
  }
}


/** --------------------------------------------------------------------
 ** mmux_octet_t
 ** ----------------------------------------------------------------- */

static void
test_octet_data_structure (void)
{
  /* Dynamic memory allocation. */
  if (1) {
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wpedantic\"");
    constexpr auto	buflen = mmux_usize(1024);
    _Pragma("GCC diagnostic pop");
    mmux_octet_t *	bufptr = malloc(sizeof(mmux_octet_t) * buflen.value);

    if (NULL == bufptr) {
      fprintf(stderr, "%s: memory allocation error\n", __func__);
      exit(EXIT_FAILURE);
    }

    for (uint8_t i=0; i<127; ++i) {
      bufptr[i].value = i;
    }
    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: octet at index '%d' is: '%d'\n", __func__, i, bufptr[i].value);
    }
    free(bufptr);
  }

  /* Static memory allocation. */
  if (1) {
    constexpr size_t	buflen = 1024;
    mmux_octet_t	bufptr[buflen];

    for (uint8_t i=0; i<20; ++i) {
      bufptr[i].value = 100 + i;
    }

    for (uint8_t i=11; i<17; ++i) {
      fprintf(stderr, "%s: octet at index '%d' is: '%d'\n", __func__, i, bufptr[i].value);
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

  if (1) {	test_test_byte_data_structure();	}
  if (1) {	test_3bytes_data_structure();		}
  if (1) {	test_char_data_structure();		}
  if (1) {	test_byte_data_structure();		}
  if (1) {	test_octet_data_structure();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
