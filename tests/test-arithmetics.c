/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  6, 2025

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
 ** Addition.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_add (void)
{
  { mmux_char_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_schar_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uchar_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sshort_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_ushort_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sint_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uint_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_slong_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_ulong_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

#ifdef MMUX_HAVE_CC_TYPE_SLLONG
  { mmux_sllong_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_ULLONG
  { mmux_ullong_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uint8_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sint16_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uint16_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sint32_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uint32_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sint64_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uint64_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_ssize_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_usize_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sintmax_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uintmax_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_sintptr_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uintptr_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  { mmux_float_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_double_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#ifdef MMUX_HAVE_CC_TYPE_LDOUBLE
  { mmux_ldouble_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32
  { mmux_float32_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64
  { mmux_float64_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128
  { mmux_float128_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT32X
  { mmux_float32x_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT64X
  { mmux_float64x_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_FLOAT128X
  { mmux_float128x_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL32
  { mmux_decimal32_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL64
  { mmux_decimal64_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

#ifdef MMUX_HAVE_CC_TYPE_DECIMAL128
  { mmux_decimal128_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
#endif

  { mmux_mode_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_pid_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_uid_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_gid_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_off_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_wchar_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_wint_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_rlim_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_socklen_t	op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }
  { mmux_time_t		op1 = 5, op2 = 4, rop = 9;	assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2))); }

  {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	op2 = mmux_complexf_make_rectangular(4.0,2.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	op2 = mmux_complexd_make_rectangular(4.0,2.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	op2 = mmux_complexld_make_rectangular(4.0,2.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	op2 = mmux_complexf32_make_rectangular(4.0,2.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	op2 = mmux_complexf64_make_rectangular(4.0,2.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	op2 = mmux_complexf128_make_rectangular(4.0,2.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	op2 = mmux_complexf32x_make_rectangular(4.0,2.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	op2 = mmux_complexf64x_make_rectangular(4.0,2.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	op2 = mmux_complexf128x_make_rectangular(4.0,2.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXD32
  {
    mmux_complexd32_t	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_t	op2 = mmux_complexd32_make_rectangular(4.0,2.0);
    mmux_complexd32_t	rop = mmux_complexd32_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXD64
  {
    mmux_complexd64_t	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_t	op2 = mmux_complexd64_make_rectangular(4.0,2.0);
    mmux_complexd64_t	rop = mmux_complexd64_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif

#ifdef MMUX_HAVE_CC_TYPE_COMPLEXD128
  {
    mmux_complexd128_t	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_t	op2 = mmux_complexd128_make_rectangular(4.0,2.0);
    mmux_complexd128_t	rop = mmux_complexd128_make_rectangular(9.0,5.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  if (1) {	test_arithmetics_add();		}

  exit(EXIT_SUCCESS);
}

/* end of file */
