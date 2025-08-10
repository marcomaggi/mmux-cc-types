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
    auto	op2 = (mmux_uintptr_t)0b1001;
    auto	rop = (mmux_pointer_t)0b1001;
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2)));
  }

  { mmux_char_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_schar_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uchar_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sshort_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_ushort_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_slong_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_ulong_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint8_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint16_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint16_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint32_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint32_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sint64_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uint64_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_ssize_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_usize_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }

  { mmux_mode_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_pid_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_uid_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_gid_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_off_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_wchar_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_wint_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_rlim_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_socklen_t	op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
  { mmux_time_t		op1 = 0b1111, op2 = 0b1001, rop = 0b1001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Bitwise OR.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_or (void)
{
  printf("running test: %s\n", __func__);
#undef  ROP
#define ROP	0b1111

  {
    auto	op1 = (mmux_pointer_t)0b1111;
    auto	op2 = (mmux_uintptr_t)0b1001;
    auto	rop = (mmux_pointer_t)ROP;
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2)));
  }

  { mmux_char_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_schar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uchar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sshort_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_ushort_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_slong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_ulong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uint8_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sint16_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uint16_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sint32_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uint32_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sint64_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uint64_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_ssize_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_usize_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }

  { mmux_mode_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_pid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_uid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_gid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_off_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_wchar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_wint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_rlim_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_socklen_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
  { mmux_time_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Bitwise XOR.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_xor (void)
{
  printf("running test: %s\n", __func__);
#undef  ROP
#define ROP	0b0110

  {
    auto	op1 = (mmux_pointer_t)0b1111;
    auto	op2 = (mmux_uintptr_t)0b1001;
    auto	rop = (mmux_pointer_t)ROP;
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2)));
  }

  { mmux_char_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_schar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uchar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sshort_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_ushort_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_slong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_ulong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uint8_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sint16_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uint16_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sint32_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uint32_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sint64_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uint64_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_ssize_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_usize_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }

  { mmux_mode_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_pid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_uid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_gid_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_off_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_wchar_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_wint_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_rlim_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_socklen_t	op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
  { mmux_time_t		op1 = 0b1111, op2 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Bitwise NOT.
 ** ----------------------------------------------------------------- */

#undef  BITWISE_NOT
#define BITWISE_NOT(OP)		(mmux_ctype_bitwise_and(mmux_ctype_bitwise_not(OP), 0b1111))

static void
test_bitwise_not (void)
{
  printf("running test: %s\n", __func__);
#undef  ROP
#define ROP	0b0110

  if (1) {
    auto	op1 = (mmux_pointer_t)0b1001;
    auto	rop = (mmux_pointer_t)ROP;
    assert(mmux_ctype_equal(rop, BITWISE_NOT(op1)));
  }

  { mmux_char_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_schar_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uchar_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sshort_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_ushort_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sint_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uint_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_slong_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_ulong_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
#endif

  { mmux_sint8_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uint8_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sint16_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uint16_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sint32_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uint32_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sint64_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uint64_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_ssize_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_usize_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sintmax_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uintmax_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_sintptr_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uintptr_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_ptrdiff_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }

  { mmux_mode_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_pid_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_uid_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_gid_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_off_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_wchar_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_wint_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_rlim_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_socklen_t	op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
  { mmux_time_t		op1 = 0b1001, rop = ROP;	assert(mmux_ctype_equal(rop, BITWISE_NOT(op1))); }
}


/** --------------------------------------------------------------------
 ** Bitwise shift left.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shl (void)
{
  printf("running test: %s\n", __func__);

  if (1) {
    auto	op1 = (mmux_pointer_t)0b0001;
    mmux_sint_t	op2 = 3;
    auto	rop = (mmux_pointer_t)0b1000;
    //mmux_pointer_fprintf(stderr, mmux_ctype_bitwise_shl(op1, op2));
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2)));
  }

  { mmux_char_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_schar_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uchar_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sshort_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_ushort_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sint_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uint_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_slong_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_ulong_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uint8_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sint16_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uint16_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sint32_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uint32_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sint64_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uint64_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_ssize_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_usize_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }

  { mmux_mode_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_pid_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_uid_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_gid_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_off_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_wchar_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_wint_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_rlim_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_socklen_t	op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
  { mmux_time_t		op1 = 0b0001, op2 = 3, rop = 0b1000;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Bitwise shift right.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shr (void)
{
  printf("running test: %s\n", __func__);

  if (1) {
    auto	op1 = (mmux_pointer_t)0b1000;
    mmux_sint_t	op2 = 3;
    auto	rop = (mmux_pointer_t)0b0001;
    //mmux_pointer_fprintf(stderr, mmux_ctype_bitwise_shr(op1, op2));
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2)));
  }

  { mmux_char_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_schar_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uchar_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sshort_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_ushort_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sint_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uint_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_slong_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_ulong_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uint8_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sint16_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uint16_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sint32_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uint32_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sint64_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uint64_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_ssize_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_usize_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sintmax_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uintmax_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_sintptr_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uintptr_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }

  { mmux_mode_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_pid_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_uid_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_gid_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_off_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_wchar_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_wint_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_rlim_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_socklen_t	op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
  { mmux_time_t		op1 = 0b1000, op2 = 3, rop = 0b0001;	assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2))); }
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_bitwise_and();		}
  if (1) {	test_bitwise_or();		}
  if (1) {	test_bitwise_xor();		}
  if (1) {	test_bitwise_not();		}
  if (1) {	test_bitwise_shl();		}
  if (1) {	test_bitwise_shr();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
