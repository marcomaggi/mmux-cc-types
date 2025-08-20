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
#include <test-common.h>


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
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_ADD
#define DEFINE_REAL_FLONUM_ADD(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	op2 = mmux_## STEM ## _literal(4.0);			\
    auto	rop = mmux_## STEM ## _literal(9.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_add(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_ADD(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_make_rectangular_literal(4.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(9.0,5.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(4.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(9.0),		\
							mmux_## RSTEM ##_literal(5.0));		\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(4.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(9.0),	\
							mmux_## CSTEM ##_part_literal(5.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));					\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_add (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto	op1 = mmux_pointer(mmux_standard_pointer_literal(5));
    auto	op2 = mmux_ptrdiff(mmux_standard_ptrdiff_literal(4));
    auto	rop = mmux_pointer(mmux_standard_pointer_literal(9));
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

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Subtraction.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_SUB
#define DEFINE_REAL_INTEGER_SUB(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	op2 = mmux_## STEM ## _literal(3);			\
    auto	rop = mmux_## STEM ## _literal(2);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_sub(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_SUB
#define DEFINE_REAL_FLONUM_SUB(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	op2 = mmux_## STEM ## _literal(3.0);			\
    auto	rop = mmux_## STEM ## _literal(2.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_sub(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_SUB(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_make_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(2.0,1.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_sub(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(2.0),		\
							mmux_## RSTEM ##_literal(1.0));		\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_sub(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(2.0),	\
							mmux_## CSTEM ##_part_literal(1.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_sub(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));					\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_sub (void)
{
  dprintf(2, "running test: %s:", __func__);

  {
    auto	op1 = mmux_pointer(mmux_standard_pointer_literal(5));
    auto	op2 = mmux_pointer(mmux_standard_pointer_literal(3));
    auto	rop = mmux_ptrdiff(mmux_standard_ptrdiff_literal(2));
    assert(mmux_ptrdiff_equal(rop, mmux_pointer_sub(op1, op2)));
    assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));
    dprintf(2," %s,", "pointer");
  }

  DEFINE_REAL_INTEGER_SUB(char);
  DEFINE_REAL_INTEGER_SUB(schar);
  DEFINE_REAL_INTEGER_SUB(uchar);
  DEFINE_REAL_INTEGER_SUB(sshort);
  DEFINE_REAL_INTEGER_SUB(ushort);
  DEFINE_REAL_INTEGER_SUB(sint);
  DEFINE_REAL_INTEGER_SUB(uint);
  DEFINE_REAL_INTEGER_SUB(slong);
  DEFINE_REAL_INTEGER_SUB(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_SUB(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_SUB(ullong);
#endif
  DEFINE_REAL_INTEGER_SUB(sint8);
  DEFINE_REAL_INTEGER_SUB(uint8);
  DEFINE_REAL_INTEGER_SUB(sint16);
  DEFINE_REAL_INTEGER_SUB(uint16);
  DEFINE_REAL_INTEGER_SUB(sint32);
  DEFINE_REAL_INTEGER_SUB(uint32);
  DEFINE_REAL_INTEGER_SUB(sint64);
  DEFINE_REAL_INTEGER_SUB(uint64);
  DEFINE_REAL_FLONUM_SUB(float);
  DEFINE_REAL_FLONUM_SUB(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_SUB(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_SUB(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_SUB(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_SUB(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_SUB(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_SUB(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_SUB(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_SUB(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_SUB(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_SUB(decimal128);
#endif
  DEFINE_REAL_INTEGER_SUB(ssize);
  DEFINE_REAL_INTEGER_SUB(usize);
  DEFINE_REAL_INTEGER_SUB(sintmax);
  DEFINE_REAL_INTEGER_SUB(uintmax);
  DEFINE_REAL_INTEGER_SUB(sintptr);
  DEFINE_REAL_INTEGER_SUB(uintptr);
  DEFINE_REAL_INTEGER_SUB(mode);
  DEFINE_REAL_INTEGER_SUB(off);
  DEFINE_REAL_INTEGER_SUB(pid);
  DEFINE_REAL_INTEGER_SUB(uid);
  DEFINE_REAL_INTEGER_SUB(gid);
  DEFINE_REAL_INTEGER_SUB(ptrdiff);
  DEFINE_REAL_INTEGER_SUB(wchar);
  DEFINE_REAL_INTEGER_SUB(wint);
  DEFINE_REAL_INTEGER_SUB(time);
  DEFINE_REAL_INTEGER_SUB(socklen);
  DEFINE_REAL_INTEGER_SUB(rlim);

  DEFINE_COMPLEX_SUB(complexf,		float);
  DEFINE_COMPLEX_SUB(complexd,		double);
  DEFINE_COMPLEX_SUB(complexld,		ldouble);
  DEFINE_COMPLEX_SUB(complexf32,	float32);
  DEFINE_COMPLEX_SUB(complexf64,	float64);
  DEFINE_COMPLEX_SUB(complexf128,	float128);
  DEFINE_COMPLEX_SUB(complexf32x,	float32x);
  DEFINE_COMPLEX_SUB(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_SUB(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_SUB(complexd32,	decimal32);
  DEFINE_COMPLEX_SUB(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_SUB(complexd128,	decimal128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Multiplication.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_MUL
#define DEFINE_REAL_INTEGER_MUL(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	op2 = mmux_## STEM ## _literal(3);			\
    auto	rop = mmux_## STEM ## _literal(15);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_mul(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_MUL
#define DEFINE_REAL_FLONUM_MUL(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	op2 = mmux_## STEM ## _literal(3.0);			\
    auto	rop = mmux_## STEM ## _literal(15.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_mul(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_MUL(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_make_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(9.0,19.0);			\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);			\
      if (0) {											\
	dprintf(2, "\nop1 '"); mmux_ctype_dprintf(2, op1);					\
	dprintf(2, "' op2 '"); mmux_ctype_dprintf(2, op2);					\
	dprintf(2, "' result '");								\
	mmux_ctype_dprintf(2, mmux_ctype_mul(op1, op2));					\
	dprintf(2, "'\n");									\
      }												\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_mul(op1, op2), eps));	\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_mul(op1, op2), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(9.0),		\
							mmux_## RSTEM ##_literal(19.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_mul(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(9.0),	\
							mmux_## CSTEM ##_part_literal(19.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_mul(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));					\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_mul (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_MUL(char);
  DEFINE_REAL_INTEGER_MUL(schar);
  DEFINE_REAL_INTEGER_MUL(uchar);
  DEFINE_REAL_INTEGER_MUL(sshort);
  DEFINE_REAL_INTEGER_MUL(ushort);
  DEFINE_REAL_INTEGER_MUL(sint);
  DEFINE_REAL_INTEGER_MUL(uint);
  DEFINE_REAL_INTEGER_MUL(slong);
  DEFINE_REAL_INTEGER_MUL(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_MUL(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_MUL(ullong);
#endif
  DEFINE_REAL_INTEGER_MUL(sint8);
  DEFINE_REAL_INTEGER_MUL(uint8);
  DEFINE_REAL_INTEGER_MUL(sint16);
  DEFINE_REAL_INTEGER_MUL(uint16);
  DEFINE_REAL_INTEGER_MUL(sint32);
  DEFINE_REAL_INTEGER_MUL(uint32);
  DEFINE_REAL_INTEGER_MUL(sint64);
  DEFINE_REAL_INTEGER_MUL(uint64);
  DEFINE_REAL_FLONUM_MUL(float);
  DEFINE_REAL_FLONUM_MUL(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_MUL(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_MUL(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_MUL(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_MUL(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_MUL(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_MUL(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_MUL(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_MUL(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_MUL(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_MUL(decimal128);
#endif
  DEFINE_REAL_INTEGER_MUL(ssize);
  DEFINE_REAL_INTEGER_MUL(usize);
  DEFINE_REAL_INTEGER_MUL(sintmax);
  DEFINE_REAL_INTEGER_MUL(uintmax);
  DEFINE_REAL_INTEGER_MUL(sintptr);
  DEFINE_REAL_INTEGER_MUL(uintptr);
  DEFINE_REAL_INTEGER_MUL(mode);
  DEFINE_REAL_INTEGER_MUL(off);
  DEFINE_REAL_INTEGER_MUL(pid);
  DEFINE_REAL_INTEGER_MUL(uid);
  DEFINE_REAL_INTEGER_MUL(gid);
  DEFINE_REAL_INTEGER_MUL(ptrdiff);
  DEFINE_REAL_INTEGER_MUL(wchar);
  DEFINE_REAL_INTEGER_MUL(wint);
  DEFINE_REAL_INTEGER_MUL(time);
  DEFINE_REAL_INTEGER_MUL(socklen);
  DEFINE_REAL_INTEGER_MUL(rlim);

  DEFINE_COMPLEX_MUL(complexf,		float);
  DEFINE_COMPLEX_MUL(complexd,		double);
  DEFINE_COMPLEX_MUL(complexld,		ldouble);
  DEFINE_COMPLEX_MUL(complexf32,	float32);
  DEFINE_COMPLEX_MUL(complexf64,	float64);
  DEFINE_COMPLEX_MUL(complexf128,	float128);
  DEFINE_COMPLEX_MUL(complexf32x,	float32x);
  DEFINE_COMPLEX_MUL(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_MUL(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_MUL(complexd32,	decimal32);
  DEFINE_COMPLEX_MUL(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_MUL(complexd128,	decimal128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Division.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_DIV
#define DEFINE_REAL_INTEGER_DIV(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(24);			\
    auto	op2 = mmux_## STEM ## _literal(3);			\
    auto	rop = mmux_## STEM ## _literal(8);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_div(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_DIV
#define DEFINE_REAL_FLONUM_DIV(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(24.0);			\
    auto	op2 = mmux_## STEM ## _literal(3.0);			\
    auto	rop = mmux_## STEM ## _literal(8.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_div(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_div(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_DIV(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_make_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(1.61538462,-0.0769230769);	\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);			\
      if (0) {											\
	dprintf(2, "\nop1 '"); mmux_ctype_dprintf(2, op1);					\
	dprintf(2, "' op2 '"); mmux_ctype_dprintf(2, op2);					\
	dprintf(2, "' result '");								\
	mmux_ctype_dprintf(2, mmux_ctype_div(op1, op2));					\
	dprintf(2, "'\n");									\
      }												\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_div(op1, op2), eps));	\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_div(op1, op2), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(1.61538462),	\
							mmux_## RSTEM ##_literal(-0.0769230769));	\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);			\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_div(op1, op2), eps));	\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_div(op1, op2), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(1.61538462),	\
							mmux_## CSTEM ##_part_literal(-0.0769230769));	\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);			\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_div(op1, op2), eps));	\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_div(op1, op2), eps));			\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_div (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_DIV(char);
  DEFINE_REAL_INTEGER_DIV(schar);
  DEFINE_REAL_INTEGER_DIV(uchar);
  DEFINE_REAL_INTEGER_DIV(sshort);
  DEFINE_REAL_INTEGER_DIV(ushort);
  DEFINE_REAL_INTEGER_DIV(sint);
  DEFINE_REAL_INTEGER_DIV(uint);
  DEFINE_REAL_INTEGER_DIV(slong);
  DEFINE_REAL_INTEGER_DIV(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_DIV(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_DIV(ullong);
#endif
  DEFINE_REAL_INTEGER_DIV(sint8);
  DEFINE_REAL_INTEGER_DIV(uint8);
  DEFINE_REAL_INTEGER_DIV(sint16);
  DEFINE_REAL_INTEGER_DIV(uint16);
  DEFINE_REAL_INTEGER_DIV(sint32);
  DEFINE_REAL_INTEGER_DIV(uint32);
  DEFINE_REAL_INTEGER_DIV(sint64);
  DEFINE_REAL_INTEGER_DIV(uint64);
  DEFINE_REAL_FLONUM_DIV(float);
  DEFINE_REAL_FLONUM_DIV(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_DIV(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_DIV(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_DIV(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_DIV(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_DIV(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_DIV(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_DIV(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_DIV(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_DIV(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_DIV(decimal128);
#endif
  DEFINE_REAL_INTEGER_DIV(ssize);
  DEFINE_REAL_INTEGER_DIV(usize);
  DEFINE_REAL_INTEGER_DIV(sintmax);
  DEFINE_REAL_INTEGER_DIV(uintmax);
  DEFINE_REAL_INTEGER_DIV(sintptr);
  DEFINE_REAL_INTEGER_DIV(uintptr);
  DEFINE_REAL_INTEGER_DIV(mode);
  DEFINE_REAL_INTEGER_DIV(off);
  DEFINE_REAL_INTEGER_DIV(pid);
  DEFINE_REAL_INTEGER_DIV(uid);
  DEFINE_REAL_INTEGER_DIV(gid);
  DEFINE_REAL_INTEGER_DIV(ptrdiff);
  DEFINE_REAL_INTEGER_DIV(wchar);
  DEFINE_REAL_INTEGER_DIV(wint);
  DEFINE_REAL_INTEGER_DIV(time);
  DEFINE_REAL_INTEGER_DIV(socklen);
  DEFINE_REAL_INTEGER_DIV(rlim);

  DEFINE_COMPLEX_DIV(complexf,		float);
  DEFINE_COMPLEX_DIV(complexd,		double);
  DEFINE_COMPLEX_DIV(complexld,		ldouble);
  DEFINE_COMPLEX_DIV(complexf32,	float32);
  DEFINE_COMPLEX_DIV(complexf64,	float64);
  DEFINE_COMPLEX_DIV(complexf128,	float128);
  DEFINE_COMPLEX_DIV(complexf32x,	float32x);
  DEFINE_COMPLEX_DIV(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_DIV(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_DIV(complexd32,	decimal32);
  DEFINE_COMPLEX_DIV(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_DIV(complexd128,	decimal128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Negation.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_NEG
#define DEFINE_REAL_INTEGER_NEG(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	rop = mmux_## STEM ## _literal(-5);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_neg(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_NEG
#define DEFINE_REAL_FLONUM_NEG(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	rop = mmux_## STEM ## _literal(-5.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_neg(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_NEG(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);			\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(-5.0,-3.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_neg(op1)));				\
      assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(-5.0),		\
							mmux_## RSTEM ##_literal(-3.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_neg(op1)));				\
      assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(-5.0),	\
							mmux_## CSTEM ##_part_literal(-3.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_neg(op1)));				\
      assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));					\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_neg (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_NEG(schar);
  DEFINE_REAL_INTEGER_NEG(sshort);
  DEFINE_REAL_INTEGER_NEG(sint);
  DEFINE_REAL_INTEGER_NEG(slong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_NEG(sllong);
#endif
  DEFINE_REAL_INTEGER_NEG(sint8);
  DEFINE_REAL_INTEGER_NEG(sint16);
  DEFINE_REAL_INTEGER_NEG(sint32);
  DEFINE_REAL_INTEGER_NEG(sint64);
  DEFINE_REAL_FLONUM_NEG(float);
  DEFINE_REAL_FLONUM_NEG(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_NEG(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_NEG(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_NEG(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_NEG(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_NEG(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_NEG(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_NEG(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_NEG(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_NEG(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_NEG(decimal128);
#endif
  DEFINE_REAL_INTEGER_NEG(ssize);
  DEFINE_REAL_INTEGER_NEG(sintmax);
  DEFINE_REAL_INTEGER_NEG(sintptr);
  DEFINE_REAL_INTEGER_NEG(off);
  DEFINE_REAL_INTEGER_NEG(ptrdiff);
  DEFINE_REAL_INTEGER_NEG(wint);

  DEFINE_COMPLEX_NEG(complexf,		float);
  DEFINE_COMPLEX_NEG(complexd,		double);
  DEFINE_COMPLEX_NEG(complexld,		ldouble);
  DEFINE_COMPLEX_NEG(complexf32,	float32);
  DEFINE_COMPLEX_NEG(complexf64,	float64);
  DEFINE_COMPLEX_NEG(complexf128,	float128);
  DEFINE_COMPLEX_NEG(complexf32x,	float32x);
  DEFINE_COMPLEX_NEG(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_NEG(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_NEG(complexd32,	decimal32);
  DEFINE_COMPLEX_NEG(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_NEG(complexd128,	decimal128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Inversion.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_INV
#define DEFINE_REAL_INTEGER_INV(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	rop = mmux_## STEM ## _literal(0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_inv(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_inv(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_INV
#define DEFINE_REAL_FLONUM_INV(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5.0);			\
    auto	rop = mmux_## STEM ## _literal(0.2);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_inv(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_inv(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_COMPLEX_INV(CSTEM,RSTEM)									\
  {													\
    {													\
      auto	op1 = mmux_## CSTEM ##_make_rectangular_literal(5.0,3.0);				\
      auto	rop = mmux_## CSTEM ##_make_rectangular_literal(0.147058824,-0.0882352941);		\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);				\
      if (0) {												\
	dprintf(2, "\nop1 '");    mmux_ctype_dprintf(2, op1);						\
	dprintf(2, "' result '"); mmux_ctype_dprintf(2, mmux_ctype_inv(op1));				\
	dprintf(2, "' expected result '"); mmux_ctype_dprintf(2, rop);					\
	dprintf(2, "'\n");										\
      }													\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_inv(op1), eps));			\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_inv(op1), eps));				\
    }													\
    {													\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(5.0),			\
							mmux_## RSTEM ##_literal(3.0));			\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## RSTEM ##_literal(0.147058824),		\
							mmux_## RSTEM ##_literal(-0.0882352941));	\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);				\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_inv(op1), eps));			\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_inv(op1), eps));				\
    }													\
    {													\
      auto	op1 = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(5.0),		\
							mmux_## CSTEM ##_part_literal(3.0));		\
      auto	rop = mmux_## CSTEM ##_make_rectangular(mmux_## CSTEM ##_part_literal(0.147058824),	\
							mmux_## CSTEM ##_part_literal(-0.0882352941));	\
      auto	eps = mmux_## CSTEM ##_make_rectangular_literal(1e-4,1e-4);				\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_inv(op1), eps));			\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_inv(op1), eps));				\
    }													\
    dprintf(2," %s,", #CSTEM);										\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_inv (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_INV(schar);
  DEFINE_REAL_INTEGER_INV(sshort);
  DEFINE_REAL_INTEGER_INV(sint);
  DEFINE_REAL_INTEGER_INV(slong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_INV(sllong);
#endif
  DEFINE_REAL_INTEGER_INV(sint8);
  DEFINE_REAL_INTEGER_INV(sint16);
  DEFINE_REAL_INTEGER_INV(sint32);
  DEFINE_REAL_INTEGER_INV(sint64);
  DEFINE_REAL_FLONUM_INV(float);
  DEFINE_REAL_FLONUM_INV(double);
#ifdef MMUX_CC_TYPES_HAS_LDOUBLE
  DEFINE_REAL_FLONUM_INV(ldouble);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32
  DEFINE_REAL_FLONUM_INV(float32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64
  DEFINE_REAL_FLONUM_INV(float64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_INV(float128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT32X
  DEFINE_REAL_FLONUM_INV(float32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT64X
  DEFINE_REAL_FLONUM_INV(float64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128X
  DEFINE_REAL_FLONUM_INV(float128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL32
  DEFINE_REAL_FLONUM_INV(decimal32);
#endif
#ifdef MMUX_CC_TYPES_HAS_DECIMAL64
  DEFINE_REAL_FLONUM_INV(decimal64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLOAT128
  DEFINE_REAL_FLONUM_INV(decimal128);
#endif
  DEFINE_REAL_INTEGER_INV(ssize);
  DEFINE_REAL_INTEGER_INV(sintmax);
  DEFINE_REAL_INTEGER_INV(sintptr);
  DEFINE_REAL_INTEGER_INV(off);
  DEFINE_REAL_INTEGER_INV(ptrdiff);
  DEFINE_REAL_INTEGER_INV(wint);

  DEFINE_COMPLEX_INV(complexf,		float);
  DEFINE_COMPLEX_INV(complexd,		double);
  DEFINE_COMPLEX_INV(complexld,		ldouble);
  DEFINE_COMPLEX_INV(complexf32,	float32);
  DEFINE_COMPLEX_INV(complexf64,	float64);
  DEFINE_COMPLEX_INV(complexf128,	float128);
  DEFINE_COMPLEX_INV(complexf32x,	float32x);
  DEFINE_COMPLEX_INV(complexf64x,	float64x);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXF128X
  DEFINE_COMPLEX_INV(complexf128x,	float128x);
#endif
  DEFINE_COMPLEX_INV(complexd32,	decimal32);
  DEFINE_COMPLEX_INV(complexd64,	decimal64);
#ifdef MMUX_CC_TYPES_HAS_COMPLEXD128
  DEFINE_COMPLEX_INV(complexd128,	decimal128);
#endif

  dprintf(2, " DONE.\n\n");
}

#if 0


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
  test_set_output_formats();

  if (1) {	test_arithmetics_add();		}
  if (1) {	test_arithmetics_sub();		}
  if (1) {	test_arithmetics_mul();		}
  if (1) {	test_arithmetics_div();		}
  if (1) {	test_arithmetics_neg();		}
  if (1) {	test_arithmetics_inv();		}
#if 0
  if (1) {	test_arithmetics_abs();		}
  if (1) {	test_arithmetics_mod();		}
  if (1) {	test_arithmetics_incr();	}
  if (1) {	test_arithmetics_decr();	}
#endif

  exit(EXIT_SUCCESS);
}

/* end of file */
