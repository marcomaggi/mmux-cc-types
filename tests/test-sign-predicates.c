/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Aug  5, 2025

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
 ** Is zero.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_zero (void)
{
  printf("running test: %s\n", __func__);

  { mmux_char_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_char_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_schar_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_schar_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uchar_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uchar_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sshort_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sshort_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_ushort_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ushort_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sint_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sint_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uint_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uint_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_slong_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_slong_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_ulong_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ulong_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	value = 0;	assert(true  == mmux_sint64_is_zero(value));	}
  { mmux_sllong_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ullong_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

  { mmux_sint8_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sint8_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uint8_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uint8_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sint16_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sint16_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uint16_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uint16_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sint32_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sint32_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uint32_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uint32_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sint64_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sint64_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uint64_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uint64_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_ssize_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ssize_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_usize_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_usize_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sintmax_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sintmax_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uintmax_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uintmax_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_sintptr_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_sintptr_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uintptr_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uintptr_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_ptrdiff_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ptrdiff_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_float_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_double_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_double_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_ldouble_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float32_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float64_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float128_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float32x_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float64x_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_float128x_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_decimal32_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_decimal64_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_decimal128_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}
#endif

  { mmux_mode_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_mode_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_pid_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_pid_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_gid_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_gid_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_uid_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_uid_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_off_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_off_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_wchar_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_wchar_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_wint_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_wint_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_rlim_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_rlim_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_socklen_t	value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_socklen_t	value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  { mmux_time_t		value = 0;	assert(true  == mmux_ctype_is_zero(value));	}
  { mmux_time_t		value = 1;	assert(false == mmux_ctype_is_zero(value));	}

  if (1) {
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }

  if (1) {
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(0.0,0.0);
      assert(true  == mmux_complexd_is_zero(value));
    }
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(0.0,0.0);
      assert(true  == mmux_complexld_is_zero(value));
    }
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(0.0,0.0);
      assert(true  == mmux_ctype_is_zero(value));
    }
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(1.0,0.0);
      assert(false == mmux_ctype_is_zero(value));
    }
  }
#endif


}


/** --------------------------------------------------------------------
 ** Is positive.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_positive (void)
{
  printf("running test: %s\n", __func__);

  { mmux_char_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_char_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
  if (! mmux_char_is_unsigned()) {
    mmux_char_t		value = -11;	assert(false == mmux_ctype_is_positive(value));
  }

  { mmux_schar_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_schar_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uchar_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uchar_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sshort_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sshort_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_ushort_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ushort_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sint_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sint_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uint_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uint_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_slong_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_slong_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_ulong_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ulong_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	value = 0;	assert(false == mmux_sint64_is_positive(value));	}
  { mmux_sllong_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ullong_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

  { mmux_sint8_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sint8_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uint8_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uint8_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sint16_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sint16_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uint16_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uint16_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sint32_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sint32_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uint32_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uint32_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sint64_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sint64_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uint64_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uint64_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_ssize_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ssize_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_usize_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_usize_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sintmax_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sintmax_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uintmax_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uintmax_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_sintptr_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_sintptr_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uintptr_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uintptr_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_ptrdiff_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ptrdiff_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_float_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_double_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_double_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_double_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_ldouble_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_ldouble_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float32_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float32_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float64_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float64_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float128_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float128_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float32x_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float32x_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float64x_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float64x_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_float128x_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_float128x_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_decimal32_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_decimal32_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_decimal64_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_decimal64_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	value = -0.0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_decimal128_t	value = +0.0;	assert(true  == mmux_ctype_is_positive(value));	}
  { mmux_decimal128_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}
#endif

  { mmux_mode_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_mode_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_pid_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_pid_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_gid_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_gid_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_uid_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_uid_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_off_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_off_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_wchar_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_wchar_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_wint_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_wint_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_rlim_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_rlim_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_socklen_t	value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_socklen_t	value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  { mmux_time_t		value = 0;	assert(false == mmux_ctype_is_positive(value));	}
  { mmux_time_t		value = 1;	assert(true  == mmux_ctype_is_positive(value));	}

  if (1) {
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }

  if (1) {
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(0.0,0.0);
      assert(false == mmux_complexd_is_positive(value));
    }
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(0.0,0.0);
      assert(false == mmux_complexld_is_positive(value));
    }
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_positive(value));
    }
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_positive(value));
    }
  }
#endif

}


/** --------------------------------------------------------------------
 ** Is negative.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_negative (void)
{
  printf("running test: %s\n", __func__);

  { mmux_char_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_char_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}
  if (! mmux_char_is_unsigned()) {
    mmux_char_t		value = -11;	assert(true  == mmux_ctype_is_negative(value));
  }

  { mmux_schar_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_schar_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uchar_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uchar_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sshort_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sshort_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_ushort_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ushort_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sint_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sint_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uint_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uint_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_slong_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_slong_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_ulong_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ulong_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	value = 0;	assert(false == mmux_sint64_is_negative(value));	}
  { mmux_sllong_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ullong_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

  { mmux_sint8_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sint8_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uint8_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uint8_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sint16_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sint16_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uint16_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uint16_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sint32_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sint32_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uint32_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uint32_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sint64_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sint64_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uint64_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uint64_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_ssize_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ssize_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_usize_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_usize_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sintmax_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sintmax_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uintmax_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uintmax_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_sintptr_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_sintptr_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uintptr_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uintptr_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_ptrdiff_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ptrdiff_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_float_t	value = -0.0;	assert(true == mmux_ctype_is_negative(value));	}
  { mmux_float_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_double_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_double_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_double_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_ldouble_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_ldouble_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float32_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float32_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float64_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float64_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float128_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float128_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float32x_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float32x_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float64x_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float64x_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_float128x_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_float128x_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_decimal32_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_decimal32_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_decimal64_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_decimal64_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	value = -0.0;	assert(true  == mmux_ctype_is_negative(value));	}
  { mmux_decimal128_t	value = +0.0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_decimal128_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}
#endif

  { mmux_mode_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_mode_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_pid_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_pid_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_gid_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_gid_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_uid_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_uid_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_off_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_off_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_wchar_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_wchar_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_wint_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_wint_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_rlim_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_rlim_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_socklen_t	value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_socklen_t	value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  { mmux_time_t		value = 0;	assert(false == mmux_ctype_is_negative(value));	}
  { mmux_time_t		value = 1;	assert(false == mmux_ctype_is_negative(value));	}

  if (1) {
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }

  if (1) {
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(0.0,0.0);
      assert(false == mmux_complexd_is_negative(value));
    }
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(0.0,0.0);
      assert(false == mmux_complexld_is_negative(value));
    }
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_negative(value));
    }
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_negative(value));
    }
  }
#endif

}


/** --------------------------------------------------------------------
 ** Is non-positive.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_non_positive (void)
{
  printf("running test: %s\n", __func__);

  { mmux_char_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_char_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
  if (! mmux_char_is_unsigned()) {
    mmux_char_t		value = -11;	assert(true  == mmux_ctype_is_non_positive(value));
  }

  { mmux_schar_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_schar_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
  { mmux_schar_t	value = -1;	assert(true  == mmux_ctype_is_non_positive(value));	}

  { mmux_uchar_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uchar_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sshort_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sshort_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_ushort_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ushort_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sint_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sint_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uint_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uint_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_slong_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_slong_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_ulong_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ulong_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	value = 0;	assert(true  == mmux_sint64_is_non_positive(value));	}
  { mmux_sllong_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ullong_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

  { mmux_sint8_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sint8_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uint8_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uint8_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sint16_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sint16_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uint16_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uint16_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sint32_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sint32_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uint32_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uint32_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sint64_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sint64_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uint64_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uint64_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_ssize_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ssize_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_usize_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_usize_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sintmax_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sintmax_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uintmax_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uintmax_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_sintptr_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_sintptr_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uintptr_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uintptr_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_ptrdiff_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ptrdiff_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_float_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_double_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_double_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_double_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ldouble_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_ldouble_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float32_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float32_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float64_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float64_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float128_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float128_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float32x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float32x_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float64x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float64x_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float128x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_float128x_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal32_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal32_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal64_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal64_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	value = -0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal128_t	value = +0.0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_decimal128_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}
#endif

  { mmux_mode_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_mode_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_pid_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_pid_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_gid_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_gid_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_uid_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_uid_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_off_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_off_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_wchar_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_wchar_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_wint_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_wint_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_rlim_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_rlim_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_socklen_t	value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_socklen_t	value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  { mmux_time_t		value = 0;	assert(true  == mmux_ctype_is_non_positive(value));	}
  { mmux_time_t		value = 1;	assert(false == mmux_ctype_is_non_positive(value));	}

  if (1) {
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }

  if (1) {
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(0.0,0.0);
      assert(false == mmux_complexd_is_non_positive(value));
    }
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(0.0,0.0);
      assert(false == mmux_complexld_is_non_positive(value));
    }
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_positive(value));
    }
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_positive(value));
    }
  }
#endif

}


/** --------------------------------------------------------------------
 ** Is non-negative.
 ** ----------------------------------------------------------------- */

static void
test_sign_predicate_is_non_negative (void)
{
  printf("running test: %s\n", __func__);

  { mmux_char_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_char_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
  if (! mmux_char_is_unsigned()) {
    mmux_char_t		value = -11;	assert(false == mmux_ctype_is_non_negative(value));
  }

  { mmux_schar_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_schar_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_schar_t	value = -1;	assert(false == mmux_ctype_is_non_negative(value));	}

  { mmux_uchar_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uchar_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sshort_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sshort_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_ushort_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ushort_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sint_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sint_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uint_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uint_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_slong_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_slong_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_ulong_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ulong_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	value = 0;	assert(true  == mmux_sint64_is_non_negative(value));	}
  { mmux_sllong_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ullong_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

  { mmux_sint8_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sint8_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uint8_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uint8_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sint16_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sint16_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uint16_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uint16_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sint32_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sint32_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uint32_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uint32_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sint64_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sint64_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uint64_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uint64_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_ssize_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ssize_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_usize_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_usize_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sintmax_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sintmax_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uintmax_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uintmax_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_sintptr_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_sintptr_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uintptr_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uintptr_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_ptrdiff_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ptrdiff_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_float_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_double_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_double_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_double_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ldouble_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_ldouble_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float32_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float32_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float64_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float64_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float128_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float128_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float32x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float32x_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float64x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float64x_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float128x_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_float128x_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal32_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal32_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal64_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal64_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	value = -0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal128_t	value = +0.0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_decimal128_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}
#endif

  { mmux_mode_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_mode_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_pid_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_pid_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_gid_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_gid_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_uid_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_uid_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_off_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_off_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_wchar_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_wchar_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_wint_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_wint_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_rlim_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_rlim_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_socklen_t	value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_socklen_t	value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  { mmux_time_t		value = 0;	assert(true  == mmux_ctype_is_non_negative(value));	}
  { mmux_time_t		value = 1;	assert(true  == mmux_ctype_is_non_negative(value));	}

  if (1) {
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexf_t	value = mmux_complexf_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }

  if (1) {
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(0.0,0.0);
      assert(false == mmux_complexd_is_non_negative(value));
    }
    {
      mmux_complexd_t	value = mmux_complexd_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  if (1) {
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(0.0,0.0);
      assert(false == mmux_complexld_is_non_negative(value));
    }
    {
      mmux_complexld_t	value = mmux_complexld_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  if (1) {
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexf32_t	value = mmux_complexf32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  if (1) {
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexf64_t	value = mmux_complexf64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  if (1) {
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexf128_t	value = mmux_complexf128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  if (1) {
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexd32_t	value = mmux_complexd32_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  if (1) {
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexd64_t	value = mmux_complexd64_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  if (1) {
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(0.0,0.0);
      assert(false == mmux_ctype_is_non_negative(value));
    }
    {
      mmux_complexd128_t	value = mmux_complexd128_make_rectangular(1.0,0.0);
      assert(false  == mmux_ctype_is_non_negative(value));
    }
  }
#endif

}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_sign_predicate_is_zero();		}
  if (1) {	test_sign_predicate_is_positive();	}
  if (1) {	test_sign_predicate_is_negative();	}
  if (1) {	test_sign_predicate_is_non_positive();	}
  if (1) {	test_sign_predicate_is_non_negative();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
