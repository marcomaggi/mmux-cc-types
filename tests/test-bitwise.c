/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  9, 2025

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


/** --------------------------------------------------------------------
 ** Bitwise AND.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_and (void)
{
  printf("running test: %s\n", __func__);

  {
    auto	op1 = (mmux_pointer_t)0b1111;
    auto	op2 = (mmux_uintptr_t)0b1101;
    auto	rop = (mmux_pointer_t)0b1101;
    assert(mmux_ctype_equal(rop, mmux_pointer_bitwise_and(op1, op2)));
  }

  { mmux_char_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_schar_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uchar_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sshort_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_ushort_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_slong_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_ulong_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint8_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint16_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint16_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint32_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint32_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint64_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint64_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_ssize_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_usize_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_mode_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_pid_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uid_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_gid_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_off_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_wchar_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_wint_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_rlim_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_socklen_t	op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_time_t		op1 = 0b1111, op2 = 0b1101, rop = 0b1101;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_bitwise_and();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
