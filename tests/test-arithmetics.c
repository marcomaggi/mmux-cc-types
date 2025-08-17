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

#undef  _GNU_SOURCE
#define _GNU_SOURCE	1

#include <mmux-cc-types.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>


/** --------------------------------------------------------------------
 ** Addition.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_ADD
#define DEFINE_REAL_INTEGER_ADD(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	op2 = mmux_## STEM ## _literal(4);			\
    auto	rop = mmux_## STEM ## _literal(9);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_add(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));		\
  }

#undef  DEFINE_REAL_FLONUM_ADD
#define DEFINE_REAL_FLONUM_ADD(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	op2 = mmux_## STEM ## _literal(4.0);			\
    auto	rop = mmux_## STEM ## _literal(9.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_add(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));		\
  }

#define DEFINE_COMPLEX_ADD(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_make_rectangular_literal(4.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(9.0,5.0);			\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(4.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(9.0),		\
							mmux_## RSTEM ##_literal(5.0));		\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(4.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(9.0),	\
							mmux_## CSTEM ##_part_literal(5.0));	\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_add (void)
{
  dprintf(1, "running test: %s\n", __func__);

  {
    auto	op1 = mmux_pointer_literal(5);
    auto	op2 = mmux_ptrdiff_literal(4);
    auto	rop = mmux_pointer_literal(9);
    assert(mmux_pointer_equal(rop, mmux_pointer_add(op1, op2)));
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));
  }

  DEFINE_REAL_INTEGER_ADD(char);
  DEFINE_REAL_INTEGER_ADD(schar);
  DEFINE_REAL_INTEGER_ADD(uchar);
  DEFINE_REAL_INTEGER_ADD(sshort);
  DEFINE_REAL_INTEGER_ADD(ushort);
  DEFINE_REAL_INTEGER_ADD(sint);
  DEFINE_REAL_INTEGER_ADD(uint);
  DEFINE_REAL_INTEGER_ADD(slong);
  DEFINE_REAL_INTEGER_ADD(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_ADD(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_ADD(ullong);
#endif
  DEFINE_REAL_INTEGER_ADD(sint8);
  DEFINE_REAL_INTEGER_ADD(uint8);
  DEFINE_REAL_INTEGER_ADD(sint16);
  DEFINE_REAL_INTEGER_ADD(uint16);
  DEFINE_REAL_INTEGER_ADD(sint32);
  DEFINE_REAL_INTEGER_ADD(uint32);
  DEFINE_REAL_INTEGER_ADD(sint64);
  DEFINE_REAL_INTEGER_ADD(uint64);
  DEFINE_REAL_FLONUM_ADD(float);
  DEFINE_REAL_FLONUM_ADD(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_ADD(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_ADD(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_ADD(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_ADD(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_ADD(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_ADD(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_ADD(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_ADD(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_ADD(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_ADD(decimal128);
#endif
  DEFINE_REAL_INTEGER_ADD(ssize);
  DEFINE_REAL_INTEGER_ADD(usize);
  DEFINE_REAL_INTEGER_ADD(sintmax);
  DEFINE_REAL_INTEGER_ADD(uintmax);
  DEFINE_REAL_INTEGER_ADD(sintptr);
  DEFINE_REAL_INTEGER_ADD(uintptr);
  DEFINE_REAL_INTEGER_ADD(mode);
  DEFINE_REAL_INTEGER_ADD(off);
  DEFINE_REAL_INTEGER_ADD(pid);
  DEFINE_REAL_INTEGER_ADD(uid);
  DEFINE_REAL_INTEGER_ADD(gid);
  DEFINE_REAL_INTEGER_ADD(ptrdiff);
  DEFINE_REAL_INTEGER_ADD(wchar);
  DEFINE_REAL_INTEGER_ADD(wint);
  DEFINE_REAL_INTEGER_ADD(time);
  DEFINE_REAL_INTEGER_ADD(socklen);
  DEFINE_REAL_INTEGER_ADD(rlim);

  DEFINE_COMPLEX_ADD(complexf,		float);
  DEFINE_COMPLEX_ADD(complexd,		double);
  DEFINE_COMPLEX_ADD(complexld,		ldouble);
  DEFINE_COMPLEX_ADD(complexf32,	float32);
  DEFINE_COMPLEX_ADD(complexf64,	float64);
  DEFINE_COMPLEX_ADD(complexf128,	float128);
  DEFINE_COMPLEX_ADD(complexf32x,	float32x);
  DEFINE_COMPLEX_ADD(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_ADD(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_ADD(complexd32,	decimal32);
  DEFINE_COMPLEX_ADD(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_ADD(complexd128,	decimal128);
#endif
}


/** --------------------------------------------------------------------
 ** Subtraction.
 ** ----------------------------------------------------------------- */

#if 0

static void
test_arithmetics_sub (void)
{
  dprintf(1, "running test: %s\n", __func__);

  {
    mmux_pointer_t	op1 = (mmux_pointer_t)123;
    mmux_pointer_t	op2 = (mmux_pointer_t)23;
    mmux_ptrdiff_t	rop = 100;
    assert(mmux_ctype_equal(rop, mmux_pointer_diff(op1, op2)));
  }

  { mmux_char_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_schar_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uchar_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sshort_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_ushort_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sint_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uint_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_slong_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_ulong_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uint8_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sint16_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uint16_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sint32_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uint32_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sint64_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uint64_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_ssize_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_usize_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sintmax_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uintmax_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_sintptr_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uintptr_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  { mmux_float_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_double_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
#endif

  { mmux_mode_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_pid_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_uid_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_gid_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_off_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_wchar_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_wint_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_rlim_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_socklen_t	op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }
  { mmux_time_t		op1 = 5, op2 = 4, rop = 1;	assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2))); }

  {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	op2 = mmux_complexf_make_rectangular(4.0,2.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	op2 = mmux_complexd_make_rectangular(4.0,2.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	op2 = mmux_complexld_make_rectangular(4.0,2.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	op2 = mmux_complexf32_make_rectangular(4.0,2.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	op2 = mmux_complexf64_make_rectangular(4.0,2.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	op2 = mmux_complexf128_make_rectangular(4.0,2.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	op2 = mmux_complexf32x_make_rectangular(4.0,2.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	op2 = mmux_complexf64x_make_rectangular(4.0,2.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	op2 = mmux_complexf128x_make_rectangular(4.0,2.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    mmux_complexd32_t	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_t	op2 = mmux_complexd32_make_rectangular(4.0,2.0);
    mmux_complexd32_t	rop = mmux_complexd32_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    mmux_complexd64_t	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_t	op2 = mmux_complexd64_make_rectangular(4.0,2.0);
    mmux_complexd64_t	rop = mmux_complexd64_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    mmux_complexd128_t	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_t	op2 = mmux_complexd128_make_rectangular(4.0,2.0);
    mmux_complexd128_t	rop = mmux_complexd128_make_rectangular(1.0,1.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Multiplication.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_mul (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_schar_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uchar_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sshort_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_ushort_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sint_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uint_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_slong_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_ulong_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uint8_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sint16_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uint16_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sint32_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uint32_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sint64_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uint64_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_ssize_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_usize_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sintmax_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uintmax_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_sintptr_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uintptr_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  { mmux_float_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_double_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
#endif

  { mmux_mode_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_pid_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_uid_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_gid_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_off_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_wchar_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_wint_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_rlim_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_socklen_t	op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }
  { mmux_time_t		op1 = 5, op2 = 4, rop = 20;	assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2))); }

  {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	op2 = mmux_complexf_make_rectangular(4.0,2.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	op2 = mmux_complexd_make_rectangular(4.0,2.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	op2 = mmux_complexld_make_rectangular(4.0,2.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	op2 = mmux_complexf32_make_rectangular(4.0,2.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	op2 = mmux_complexf64_make_rectangular(4.0,2.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	op2 = mmux_complexf128_make_rectangular(4.0,2.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	op2 = mmux_complexf32x_make_rectangular(4.0,2.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	op2 = mmux_complexf64x_make_rectangular(4.0,2.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	op2 = mmux_complexf128x_make_rectangular(4.0,2.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    mmux_complexd32_t	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_t	op2 = mmux_complexd32_make_rectangular(4.0,2.0);
    mmux_complexd32_t	rop = mmux_complexd32_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    mmux_complexd64_t	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_t	op2 = mmux_complexd64_make_rectangular(4.0,2.0);
    mmux_complexd64_t	rop = mmux_complexd64_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    mmux_complexd128_t	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_t	op2 = mmux_complexd128_make_rectangular(4.0,2.0);
    mmux_complexd128_t	rop = mmux_complexd128_make_rectangular(14.0,22.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Division.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_div (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_schar_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uchar_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sshort_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_ushort_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sint_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uint_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_slong_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_ulong_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  { mmux_sllong_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  { mmux_ullong_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

  { mmux_sint8_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uint8_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sint16_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uint16_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sint32_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uint32_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sint64_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uint64_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_ssize_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_usize_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sintmax_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uintmax_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_sintptr_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uintptr_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_ptrdiff_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  { mmux_float_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_double_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
#endif

  { mmux_mode_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_pid_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_uid_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_gid_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_off_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_wchar_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_wint_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_rlim_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_socklen_t	op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }
  { mmux_time_t		op1 = 12, op2 = 4, rop = 3;	assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2))); }

  {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	op2 = mmux_complexf_make_rectangular(4.0,2.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(1.3,0.1);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	op2 = mmux_complexd_make_rectangular(4.0,2.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(1.3,0.1);
    mmux_complexd_t	mrg = mmux_complexd_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	op2 = mmux_complexld_make_rectangular(4.0,2.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(1.3,0.1);
    mmux_complexld_t	mrg = mmux_complexld_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	op2 = mmux_complexf32_make_rectangular(4.0,2.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(1.3,0.1);
    mmux_complexf32_t	mrg = mmux_complexf32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	op2 = mmux_complexf64_make_rectangular(4.0,2.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(1.3,0.1);
    mmux_complexf64_t	mrg = mmux_complexf64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	op2 = mmux_complexf128_make_rectangular(4.0,2.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(1.3,0.1);
    mmux_complexf128_t	mrg = mmux_complexf128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	op2 = mmux_complexf32x_make_rectangular(4.0,2.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(1.3,0.1);
    mmux_complexf32x_t	mrg = mmux_complexf32x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	op2 = mmux_complexf64x_make_rectangular(4.0,2.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(1.3,0.1);
    mmux_complexf64x_t	mrg = mmux_complexf64x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	op2 = mmux_complexf128x_make_rectangular(4.0,2.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(1.3,0.1);
    mmux_complexf128x_t	mrg = mmux_complexf128x_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    mmux_complexd32_t	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_t	op2 = mmux_complexd32_make_rectangular(4.0,2.0);
    mmux_complexd32_t	rop = mmux_complexd32_make_rectangular(1.3,0.1);
    mmux_complexd32_t	mrg = mmux_complexd32_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    mmux_complexd64_t	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_t	op2 = mmux_complexd64_make_rectangular(4.0,2.0);
    mmux_complexd64_t	rop = mmux_complexd64_make_rectangular(1.3,0.1);
    mmux_complexd64_t	mrg = mmux_complexd64_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    mmux_complexd128_t	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_t	op2 = mmux_complexd128_make_rectangular(4.0,2.0);
    mmux_complexd128_t	rop = mmux_complexd128_make_rectangular(1.3,0.1);
    mmux_complexd128_t	mrg = mmux_complexd128_make_rectangular(1e-6,1e-6);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_div(op1, op2), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Negation.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_neg (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_schar_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uchar_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sshort_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_ushort_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sint_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uint_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_slong_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_ulong_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 5;
    mmux_sllong_t	rop = -5;
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 5;
    mmux_ullong_t	rop = -5;
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));
  }
#endif

  { mmux_sint8_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uint8_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sint16_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uint16_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sint32_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uint32_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sint64_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uint64_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_ssize_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_usize_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sintmax_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uintmax_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_sintptr_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uintptr_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_ptrdiff_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  { mmux_float_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_double_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
#endif

  { mmux_mode_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_pid_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_uid_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_gid_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_off_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_wchar_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_wint_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_rlim_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_socklen_t	op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }
  { mmux_time_t		op1 = 5, rop = -5;	assert(rop == mmux_ctype_neg(op1)); }

  {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    mmux_complexld_t	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_complexld_t	rop = mmux_complexld_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    mmux_complexf32_t	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_complexf32_t	rop = mmux_complexf32_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    mmux_complexf64_t	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_t	rop = mmux_complexf64_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    mmux_complexf128_t	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_t	rop = mmux_complexf128_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    mmux_complexf32x_t	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_t	rop = mmux_complexf32x_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    mmux_complexf64x_t	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_t	rop = mmux_complexf64x_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    mmux_complexf128x_t	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_t	rop = mmux_complexf128x_make_rectangular(-5.0,-3.0);
    assert(rop == mmux_ctype_neg(op1));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    mmux_complexd32_t	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_t	rop = mmux_complexd32_make_rectangular(-5.0,-3.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    mmux_complexd64_t	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_t	rop = mmux_complexd64_make_rectangular(-5.0,-3.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    mmux_complexd128_t	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_t	rop = mmux_complexd128_make_rectangular(-5.0,-3.0);
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Inverse.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_inv (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_schar_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uchar_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sshort_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_ushort_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sint_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uint_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_slong_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_ulong_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 5;
    mmux_sllong_t	rop = 0;
    assert(mmux_ctype_equal(rop, mmux_ctype_inv(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 5;
    mmux_ullong_t	rop = 0;
    assert(mmux_ctype_equal(rop, mmux_ctype_inv(op1)));
  }
#endif

  { mmux_sint8_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uint8_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sint16_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uint16_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sint32_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uint32_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sint64_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uint64_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_ssize_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_usize_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sintmax_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uintmax_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_sintptr_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uintptr_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  { mmux_ptrdiff_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  {
    mmux_float_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
  {
    mmux_double_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  {
    mmux_ldouble_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  {
    mmux_float32_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  {
    mmux_float64_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  {
    mmux_float128_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  {
    mmux_float32x_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  {
    mmux_float64x_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  {
    mmux_float128x_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  {
    mmux_decimal32_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  {
    mmux_decimal64_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  {
    mmux_decimal128_t	op1 = 5, rop = 0.2, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

  { mmux_mode_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_pid_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_uid_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_gid_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_off_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_wchar_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_wint_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_rlim_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_socklen_t	op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }
  { mmux_time_t		op1 = 5, rop = 0;	assert(rop == mmux_ctype_inv(op1)); }

  if (1) {
    mmux_complexf_t	op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_complexf_t	rop = mmux_complexf_make_rectangular(0.14706,-0.088235);
    mmux_complexf_t	mrg = mmux_complexf_make_rectangular(1e-2,1e-3);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }

  {
    mmux_complexd_t	op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_complexd_t	rop = mmux_complexd_make_rectangular(0.147059,-0.088235);
    mmux_complexd_t	mrg = mmux_complexd_make_rectangular(1e-4,1e-4);
    if (0) {
      mmux_complexd_t	result = mmux_ctype_inv(op1);
      dprintf(2, "re = %f, im = %f\n", mmux_complexd_real_part(result), mmux_complexd_imag_part(result));
    }
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    auto	op1 = mmux_complexld_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexld_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexld_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    auto	op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf32_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    auto	op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf64_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    auto	op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf128_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    auto	op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf32x_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf32x_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    auto	op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf64x_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf64x_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    auto	op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexf128x_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexf128x_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    auto	op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd32_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexd32_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    auto	op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd64_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexd64_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    auto	op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    auto	rop = mmux_complexd128_make_rectangular(0.147059,-0.088235);
    auto	mrg = mmux_complexd128_make_rectangular(1e-4,1e-4);
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_inv(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Absolute value.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_abs (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_schar_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uchar_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sshort_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_ushort_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sint_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uint_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_slong_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_ulong_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 5;
    mmux_sllong_t	rop = 5;
    assert(mmux_ctype_equal(rop, mmux_ctype_abs(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 5;
    mmux_ullong_t	rop = 5;
    assert(mmux_ctype_equal(rop, mmux_ctype_abs(op1)));
  }
#endif

  { mmux_sint8_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uint8_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sint16_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uint16_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sint32_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uint32_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sint64_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uint64_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_ssize_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_usize_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sintmax_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uintmax_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_sintptr_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uintptr_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  { mmux_ptrdiff_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  {
    mmux_float_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
  {
    mmux_double_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  {
    mmux_ldouble_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  {
    mmux_float32_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  {
    mmux_float64_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  {
    mmux_float128_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  {
    mmux_float32x_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  {
    mmux_float64x_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  {
    mmux_float128x_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  {
    mmux_decimal32_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  {
    mmux_decimal64_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  {
    mmux_decimal128_t	op1 = 5, rop = 5, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

  { mmux_mode_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_pid_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_uid_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_gid_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_off_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_wchar_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_wint_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_rlim_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_socklen_t	op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }
  { mmux_time_t		op1 = 5, rop = 5;	assert(rop == mmux_ctype_abs(op1)); }

  {
    auto		op1 = mmux_complexf_make_rectangular(5.0,3.0);
    mmux_float_t	rop = 5.830952;
    mmux_float_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }

  {
    auto		op1 = mmux_complexd_make_rectangular(5.0,3.0);
    mmux_double_t	rop = 5.830952;
    mmux_double_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }

#ifdef MMUX_CC_TYPES_HAS_COMPLEXLD
  {
    auto		op1 = mmux_complexld_make_rectangular(5.0,3.0);
    mmux_ldouble_t	rop = 5.830952;
    mmux_ldouble_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32
  {
    auto		op1 = mmux_complexf32_make_rectangular(5.0,3.0);
    mmux_float32_t	rop = 5.830952;
    mmux_float32_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64
  {
    auto			op1 = mmux_complexf64_make_rectangular(5.0,3.0);
    mmux_complexf64_part_t	rop = 5.830952;
    mmux_complexf64_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128
  {
    auto			op1 = mmux_complexf128_make_rectangular(5.0,3.0);
    mmux_complexf128_part_t	rop = 5.830952;
    mmux_complexf128_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF32X
  {
    auto			op1 = mmux_complexf32x_make_rectangular(5.0,3.0);
    mmux_complexf32x_part_t	rop = 5.830952;
    mmux_complexf32x_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF64X
  {
    auto			op1 = mmux_complexf64x_make_rectangular(5.0,3.0);
    mmux_complexf64x_part_t	rop = 5.830952;
    mmux_complexf64x_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  {
    auto			op1 = mmux_complexf128x_make_rectangular(5.0,3.0);
    mmux_complexf128x_part_t	rop = 5.830952;
    mmux_complexf128x_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD32
  {
    auto			op1 = mmux_complexd32_make_rectangular(5.0,3.0);
    mmux_complexd32_part_t	rop = 5.830952;
    mmux_complexd32_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD64
  {
    auto			op1 = mmux_complexd64_make_rectangular(5.0,3.0);
    mmux_complexd64_part_t	rop = 5.830952;
    mmux_complexd64_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  {
    auto			op1 = mmux_complexd128_make_rectangular(5.0,3.0);
    mmux_complexd128_part_t	rop = 5.830952;
    mmux_complexd128_part_t	mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_abs(op1), mrg));
  }
#endif
}


/** --------------------------------------------------------------------
 ** Modulo.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_mod (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_schar_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uchar_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sshort_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_ushort_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sint_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uint_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_slong_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_ulong_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 13;
    mmux_sllong_t	op2 = 4;
    mmux_sllong_t	rop = 1;
    assert(mmux_ctype_equal(rop, mmux_ctype_mod(op1,op2)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 13;
    mmux_ullong_t	op2 = 4;
    mmux_ullong_t	rop = 1;
    assert(mmux_ctype_equal(rop, mmux_ctype_mod(op1,op2)));
  }
#endif

  { mmux_sint8_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uint8_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sint16_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uint16_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sint32_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uint32_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sint64_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uint64_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_ssize_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_usize_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sintmax_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uintmax_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_sintptr_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uintptr_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_ptrdiff_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }

  { mmux_float_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_double_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  { mmux_ldouble_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  { mmux_float32_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  { mmux_float64_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  { mmux_float128_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  { mmux_float32x_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  { mmux_float64x_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  { mmux_float128x_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  { mmux_decimal32_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  { mmux_decimal64_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  { mmux_decimal128_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
#endif

  { mmux_mode_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_pid_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_uid_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_gid_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_off_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_wchar_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_wint_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_rlim_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_socklen_t	op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
  { mmux_time_t		op1 = 13, op2 = 4, rop = 1;	assert(rop == mmux_ctype_mod(op1,op2)); }
}


/** --------------------------------------------------------------------
 ** Increment.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_incr (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_schar_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uchar_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sshort_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_ushort_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sint_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uint_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_slong_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_ulong_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 5;
    mmux_sllong_t	rop = 6;
    assert(mmux_ctype_equal(rop, mmux_ctype_incr(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 5;
    mmux_ullong_t	rop = 6;
    assert(mmux_ctype_equal(rop, mmux_ctype_incr(op1)));
  }
#endif

  { mmux_sint8_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uint8_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sint16_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uint16_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sint32_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uint32_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sint64_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uint64_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_ssize_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_usize_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sintmax_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uintmax_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_sintptr_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uintptr_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  { mmux_ptrdiff_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

  {
    mmux_float_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
  {
    mmux_double_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  {
    mmux_ldouble_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  {
    mmux_float32_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  {
    mmux_float64_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  {
    mmux_float128_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  {
    mmux_float32x_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  {
    mmux_float64x_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  {
    mmux_float128x_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  {
    mmux_decimal32_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  {
    mmux_decimal64_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  {
    mmux_decimal128_t	op1 = 5, rop = 6, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_incr(op1), mrg));
  }
#endif

  { mmux_mode_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_pid_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_uid_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_gid_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_off_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_wchar_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_wint_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_rlim_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_socklen_t	op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }
  { mmux_time_t		op1 = 5, rop = 6;	assert(rop == mmux_ctype_incr(op1)); }

}


/** --------------------------------------------------------------------
 ** Decrement.
 ** ----------------------------------------------------------------- */

static void
test_arithmetics_decr (void)
{
  dprintf(1, "running test: %s\n", __func__);

  { mmux_char_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_schar_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uchar_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sshort_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_ushort_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sint_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uint_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_slong_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_ulong_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

#ifdef MMUX_CC_TYPES_HAS_SLLONG
  {
    mmux_sllong_t	op1 = 5;
    mmux_sllong_t	rop = 4;
    assert(mmux_ctype_equal(rop, mmux_ctype_decr(op1)));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_ULLONG
  {
    mmux_ullong_t	op1 = 5;
    mmux_ullong_t	rop = 4;
    assert(mmux_ctype_equal(rop, mmux_ctype_decr(op1)));
  }
#endif

  { mmux_sint8_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uint8_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sint16_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uint16_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sint32_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uint32_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sint64_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uint64_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_ssize_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_usize_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sintmax_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uintmax_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_sintptr_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uintptr_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  { mmux_ptrdiff_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

  {
    mmux_float_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
  {
    mmux_double_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  {
    mmux_ldouble_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  {
    mmux_float32_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  {
    mmux_float64_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  {
    mmux_float128_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  {
    mmux_float32x_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  {
    mmux_float64x_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  {
    mmux_float128x_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  {
    mmux_decimal32_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  {
    mmux_decimal64_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

#ifdef MMUX_CC_TYPES_HAS_DECIMAL128
  {
    mmux_decimal128_t	op1 = 5, rop = 4, mrg = 1e-6;
    assert(mmux_ctype_equal_absmargin(rop, mmux_ctype_decr(op1), mrg));
  }
#endif

  { mmux_mode_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_pid_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_uid_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_gid_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_off_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_wchar_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_wint_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_rlim_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_socklen_t	op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }
  { mmux_time_t		op1 = 5, rop = 4;	assert(rop == mmux_ctype_decr(op1)); }

}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

#endif

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();

  if (1) {	test_arithmetics_add();		}
#if 0
  if (1) {	test_arithmetics_sub();		}
  if (1) {	test_arithmetics_mul();		}
  if (1) {	test_arithmetics_div();		}
  if (1) {	test_arithmetics_neg();		}
  if (1) {	test_arithmetics_inv();		}
  if (1) {	test_arithmetics_abs();		}
  if (1) {	test_arithmetics_mod();		}
  if (1) {	test_arithmetics_incr();	}
  if (1) {	test_arithmetics_decr();	}
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
