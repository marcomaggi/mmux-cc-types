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
    auto	op1 = mmux_## STEM ##_literal(5.0);			\
    auto	op2 = mmux_## STEM ##_literal(4.0);			\
    auto	rop = mmux_## STEM ##_literal(9.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_add(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#define DEFINE_CPLX_FLONUM_ADD(CSTEM,RSTEM)						\
  {											\
    {											\
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_rectangular_literal(4.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(9.0,5.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));		\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));				\
    }											\
    {											\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),	\
						   mmux_## RSTEM ##_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(4.0),	\
						   mmux_## RSTEM ##_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(9.0),	\
						   mmux_## RSTEM ##_literal(5.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));		\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));				\
    }											\
    {											\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
						   mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(4.0),	\
						   mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(9.0),	\
						   mmux_## CSTEM ##_part_literal(5.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_add(op1, op2)));		\
      assert(mmux_ctype_equal(rop, mmux_ctype_add(op1, op2)));				\
    }											\
    dprintf(2," %s,", #CSTEM);								\
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
  DEFINE_REAL_FLONUM_ADD(flonumfl);
  DEFINE_REAL_FLONUM_ADD(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_ADD(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_ADD(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_ADD(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_ADD(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_ADD(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_ADD(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_ADD(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_ADD(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_ADD(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_ADD(flonumd128);
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

  DEFINE_CPLX_FLONUM_ADD(flonumcfl,	flonumfl);
  DEFINE_CPLX_FLONUM_ADD(flonumcdb,	flonumdb);
  DEFINE_CPLX_FLONUM_ADD(flonumcldb,	flonumldb);
  DEFINE_CPLX_FLONUM_ADD(flonumcf32,	flonumf32);
  DEFINE_CPLX_FLONUM_ADD(flonumcf64,	flonumf64);
  DEFINE_CPLX_FLONUM_ADD(flonumcf128,	flonumf128);
  DEFINE_CPLX_FLONUM_ADD(flonumcf32x,	flonumf32x);
  DEFINE_CPLX_FLONUM_ADD(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_CPLX_FLONUM_ADD(flonumcf128x,	flonumf128x);
#endif
  DEFINE_CPLX_FLONUM_ADD(flonumcd32,	flonumd32);
  DEFINE_CPLX_FLONUM_ADD(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_CPLX_FLONUM_ADD(flonumcd128,	flonumd128);
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
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(2.0,1.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_sub(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(2.0),		\
							mmux_## RSTEM ##_literal(1.0));		\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_sub(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_sub(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(2.0),	\
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
  DEFINE_REAL_FLONUM_SUB(flonumfl);
  DEFINE_REAL_FLONUM_SUB(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_SUB(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_SUB(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_SUB(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_SUB(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_SUB(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_SUB(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_SUB(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_SUB(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_SUB(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_SUB(flonumd128);
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

  DEFINE_COMPLEX_SUB(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_SUB(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_SUB(flonumcldb,		flonumldb);
  DEFINE_COMPLEX_SUB(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_SUB(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_SUB(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_SUB(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_SUB(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_SUB(flonumcf128x,	flonumf128x);
#endif
  DEFINE_COMPLEX_SUB(flonumcd32,	flonumd32);
  DEFINE_COMPLEX_SUB(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_SUB(flonumcd128,	flonumd128);
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
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(9.0,19.0);			\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);			\
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
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(9.0),		\
							mmux_## RSTEM ##_literal(19.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_mul(op1, op2)));			\
      assert(mmux_ctype_equal(rop, mmux_ctype_mul(op1, op2)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(9.0),	\
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
  DEFINE_REAL_FLONUM_MUL(flonumfl);
  DEFINE_REAL_FLONUM_MUL(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_MUL(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_MUL(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_MUL(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_MUL(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_MUL(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_MUL(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_MUL(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_MUL(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_MUL(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_MUL(flonumd128);
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

  DEFINE_COMPLEX_MUL(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_MUL(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_MUL(flonumcldb,		flonumldb);
  DEFINE_COMPLEX_MUL(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_MUL(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_MUL(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_MUL(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_MUL(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_MUL(flonumcf128x,	flonumf128x);
#endif
  DEFINE_COMPLEX_MUL(flonumcd32,	flonumd32);
  DEFINE_COMPLEX_MUL(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_MUL(flonumcd128,	flonumd128);
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
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);			\
      auto	op2 = mmux_## CSTEM ##_rectangular_literal(3.0,2.0);			\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(1.61538462,-0.0769230769);	\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);			\
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
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(3.0),		\
							mmux_## RSTEM ##_literal(2.0));		\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(1.61538462),	\
							mmux_## RSTEM ##_literal(-0.0769230769));	\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);			\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_div(op1, op2), eps));	\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_div(op1, op2), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	op2 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(3.0),	\
							mmux_## CSTEM ##_part_literal(2.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(1.61538462),	\
							mmux_## CSTEM ##_part_literal(-0.0769230769));	\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);			\
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
  DEFINE_REAL_FLONUM_DIV(flonumfl);
  DEFINE_REAL_FLONUM_DIV(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_DIV(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_DIV(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_DIV(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_DIV(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_DIV(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_DIV(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_DIV(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_DIV(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_DIV(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_DIV(flonumd128);
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

  DEFINE_COMPLEX_DIV(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_DIV(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_DIV(flonumcldb,		flonumldb);
  DEFINE_COMPLEX_DIV(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_DIV(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_DIV(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_DIV(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_DIV(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_DIV(flonumcf128x,	flonumf128x);
#endif
  DEFINE_COMPLEX_DIV(flonumcd32,	flonumd32);
  DEFINE_COMPLEX_DIV(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_DIV(flonumcd128,	flonumd128);
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
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);			\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(-5.0,-3.0);			\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_neg(op1)));				\
      assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),		\
							mmux_## RSTEM ##_literal(3.0));		\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(-5.0),		\
							mmux_## RSTEM ##_literal(-3.0));	\
      assert(mmux_## CSTEM ##_equal(rop, mmux_## CSTEM ##_neg(op1)));				\
      assert(mmux_ctype_equal(rop, mmux_ctype_neg(op1)));					\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),	\
							mmux_## CSTEM ##_part_literal(3.0));	\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(-5.0),	\
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
  DEFINE_REAL_FLONUM_NEG(flonumfl);
  DEFINE_REAL_FLONUM_NEG(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_NEG(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_NEG(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_NEG(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_NEG(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_NEG(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_NEG(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_NEG(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_NEG(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_NEG(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_NEG(flonumd128);
#endif
  DEFINE_REAL_INTEGER_NEG(ssize);
  DEFINE_REAL_INTEGER_NEG(sintmax);
  DEFINE_REAL_INTEGER_NEG(sintptr);
  DEFINE_REAL_INTEGER_NEG(off);
  DEFINE_REAL_INTEGER_NEG(ptrdiff);
  DEFINE_REAL_INTEGER_NEG(wint);

  DEFINE_COMPLEX_NEG(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_NEG(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_NEG(flonumcldb,		flonumldb);
  DEFINE_COMPLEX_NEG(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_NEG(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_NEG(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_NEG(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_NEG(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_NEG(flonumcf128x,	flonumf128x);
#endif
  DEFINE_COMPLEX_NEG(flonumcd32,	flonumd32);
  DEFINE_COMPLEX_NEG(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_NEG(flonumcd128,	flonumd128);
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
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(5.0,3.0);				\
      auto	rop = mmux_## CSTEM ##_rectangular_literal(0.147058824,-0.0882352941);		\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);				\
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
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(5.0),			\
							mmux_## RSTEM ##_literal(3.0));			\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(0.147058824),		\
							mmux_## RSTEM ##_literal(-0.0882352941));	\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);				\
      assert(mmux_## CSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_inv(op1), eps));			\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_inv(op1), eps));				\
    }													\
    {													\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(5.0),		\
							mmux_## CSTEM ##_part_literal(3.0));		\
      auto	rop = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(0.147058824),	\
							mmux_## CSTEM ##_part_literal(-0.0882352941));	\
      auto	eps = mmux_## CSTEM ##_rectangular_literal(1e-4,1e-4);				\
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

  DEFINE_REAL_INTEGER_INV(char);
  DEFINE_REAL_INTEGER_INV(schar);
  DEFINE_REAL_INTEGER_INV(uchar);
  DEFINE_REAL_INTEGER_INV(sshort);
  DEFINE_REAL_INTEGER_INV(ushort);
  DEFINE_REAL_INTEGER_INV(sint);
  DEFINE_REAL_INTEGER_INV(uint);
  DEFINE_REAL_INTEGER_INV(slong);
  DEFINE_REAL_INTEGER_INV(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_INV(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_INV(ullong);
#endif
  DEFINE_REAL_INTEGER_INV(sint8);
  DEFINE_REAL_INTEGER_INV(uint8);
  DEFINE_REAL_INTEGER_INV(sint16);
  DEFINE_REAL_INTEGER_INV(uint16);
  DEFINE_REAL_INTEGER_INV(sint32);
  DEFINE_REAL_INTEGER_INV(uint32);
  DEFINE_REAL_INTEGER_INV(sint64);
  DEFINE_REAL_INTEGER_INV(uint64);
  DEFINE_REAL_FLONUM_INV(flonumfl);
  DEFINE_REAL_FLONUM_INV(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_INV(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_INV(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_INV(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_INV(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_INV(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_INV(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_INV(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_INV(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_INV(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_INV(flonumd128);
#endif
  DEFINE_REAL_INTEGER_INV(ssize);
  DEFINE_REAL_INTEGER_INV(usize);
  DEFINE_REAL_INTEGER_INV(sintmax);
  DEFINE_REAL_INTEGER_INV(uintmax);
  DEFINE_REAL_INTEGER_INV(sintptr);
  DEFINE_REAL_INTEGER_INV(uintptr);
  DEFINE_REAL_INTEGER_INV(mode);
  DEFINE_REAL_INTEGER_INV(off);
  DEFINE_REAL_INTEGER_INV(pid);
  DEFINE_REAL_INTEGER_INV(uid);
  DEFINE_REAL_INTEGER_INV(gid);
  DEFINE_REAL_INTEGER_INV(ptrdiff);
  DEFINE_REAL_INTEGER_INV(wchar);
  DEFINE_REAL_INTEGER_INV(wint);
  DEFINE_REAL_INTEGER_INV(time);
  DEFINE_REAL_INTEGER_INV(socklen);
  DEFINE_REAL_INTEGER_INV(rlim);

  DEFINE_COMPLEX_INV(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_INV(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_INV(flonumcldb,		flonumldb);
  DEFINE_COMPLEX_INV(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_INV(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_INV(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_INV(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_INV(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_INV(flonumcf128x,	flonumf128x);
#endif
  DEFINE_COMPLEX_INV(flonumcd32,	flonumd32);
  DEFINE_COMPLEX_INV(flonumcd64,	flonumd64);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_INV(flonumcd128,	flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Absolute value.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_ABSOLUTE
#define DEFINE_REAL_INTEGER_ABSOLUTE(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(-5);			\
    auto	rop = mmux_## STEM ## _literal(5);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_absolute(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_absolute(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE
#define DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(STEM)				\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	rop = mmux_## STEM ## _literal(5);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_absolute(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_absolute(op1)));			\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_ABSOLUTE
#define DEFINE_REAL_FLONUM_ABSOLUTE(STEM)							\
  {											\
    auto	op1 = mmux_## STEM ##_literal(-5.0);					\
    auto	rop = mmux_## STEM ##_literal(5.0);					\
    auto	eps = mmux_## STEM ##_literal(1e-4);					\
    assert(mmux_## STEM ##_equal_relepsilon(rop, mmux_## STEM ##_absolute(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_absolute(op1), eps));			\
    dprintf(2," %s,", #STEM);								\
  }

#define DEFINE_COMPLEX_ABSOLUTE(CSTEM,RSTEM)								\
  {												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular_literal(-5.0,-3.0);			\
      auto	rop = mmux_## RSTEM(mmux_standard_## RSTEM ##_literal(5.83095189));		\
      auto	eps = mmux_## RSTEM ##_literal(1e-4);						\
      assert(mmux_## RSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_absolute(op1), eps));		\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_absolute(op1), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## RSTEM ##_literal(-5.0),		\
							mmux_## RSTEM ##_literal(-3.0));	\
      auto	rop = mmux_## RSTEM(mmux_standard_## RSTEM ##_literal(5.83095189));		\
      auto	eps = mmux_## RSTEM ##_literal(1e-4);						\
      assert(mmux_## RSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_absolute(op1), eps));		\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_absolute(op1), eps));			\
    }												\
    {												\
      auto	op1 = mmux_## CSTEM ##_rectangular(mmux_## CSTEM ##_part_literal(-5.0),	\
							mmux_## CSTEM ##_part_literal(-3.0));	\
      auto	rop = mmux_## RSTEM ##_literal(5.83095189);					\
      auto	eps = mmux_## RSTEM ##_literal(1e-4);						\
      assert(mmux_## RSTEM ##_equal_relepsilon(rop, mmux_## CSTEM ##_absolute(op1), eps));		\
      assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_absolute(op1), eps));			\
    }												\
    dprintf(2," %s,", #CSTEM);									\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_absolute (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_ABSOLUTE(char);
  DEFINE_REAL_INTEGER_ABSOLUTE(schar);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uchar);
  DEFINE_REAL_INTEGER_ABSOLUTE(sshort);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(ushort);
  DEFINE_REAL_INTEGER_ABSOLUTE(sint);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uint);
  DEFINE_REAL_INTEGER_ABSOLUTE(slong);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_ABSOLUTE(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(ullong);
#endif
  DEFINE_REAL_INTEGER_ABSOLUTE(sint8);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uint8);
  DEFINE_REAL_INTEGER_ABSOLUTE(sint16);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uint16);
  DEFINE_REAL_INTEGER_ABSOLUTE(sint32);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uint32);
  DEFINE_REAL_INTEGER_ABSOLUTE(sint64);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uint64);
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumfl);
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_ABSOLUTE(flonumd128);
#endif
  DEFINE_REAL_INTEGER_ABSOLUTE(ssize);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(usize);
  DEFINE_REAL_INTEGER_ABSOLUTE(sintmax);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uintmax);
  DEFINE_REAL_INTEGER_ABSOLUTE(sintptr);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uintptr);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(mode);
  DEFINE_REAL_INTEGER_ABSOLUTE(off);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(pid);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(uid);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(gid);
  DEFINE_REAL_INTEGER_ABSOLUTE(ptrdiff);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(wchar);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(wint);
  DEFINE_REAL_INTEGER_ABSOLUTE(time);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(socklen);
  DEFINE_REAL_UNSIGNED_INTEGER_ABSOLUTE(rlim);

  DEFINE_COMPLEX_ABSOLUTE(flonumcfl,		flonumfl);
  DEFINE_COMPLEX_ABSOLUTE(flonumcdb,		flonumdb);
  DEFINE_COMPLEX_ABSOLUTE(flonumcldb,	flonumldb);
  DEFINE_COMPLEX_ABSOLUTE(flonumcf32,	flonumf32);
  DEFINE_COMPLEX_ABSOLUTE(flonumcf64,	flonumf64);
  DEFINE_COMPLEX_ABSOLUTE(flonumcf128,	flonumf128);
  DEFINE_COMPLEX_ABSOLUTE(flonumcf32x,	flonumf32x);
  DEFINE_COMPLEX_ABSOLUTE(flonumcf64x,	flonumf64x);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DEFINE_COMPLEX_ABSOLUTE(flonumcf128x,	flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DEFINE_COMPLEX_ABSOLUTE(flonumcd32,	flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DEFINE_COMPLEX_ABSOLUTE(flonumcd64,	flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DEFINE_COMPLEX_ABSOLUTE(flonumcd128,	flonumd128);
#endif

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Modulo.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_MOD
#define DEFINE_REAL_INTEGER_MOD(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(23);			\
    auto	op2 = mmux_## STEM ## _literal(3);			\
    auto	rop = mmux_## STEM ## _literal(2);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_mod(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_mod(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_MOD
#define DEFINE_REAL_FLONUM_MOD(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(23.0);			\
    auto	op2 = mmux_## STEM ## _literal(3.0);			\
    auto	rop = mmux_## STEM ## _literal(2.0);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_mod(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_mod(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_mod (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_MOD(char);
  DEFINE_REAL_INTEGER_MOD(schar);
  DEFINE_REAL_INTEGER_MOD(uchar);
  DEFINE_REAL_INTEGER_MOD(sshort);
  DEFINE_REAL_INTEGER_MOD(ushort);
  DEFINE_REAL_INTEGER_MOD(sint);
  DEFINE_REAL_INTEGER_MOD(uint);
  DEFINE_REAL_INTEGER_MOD(slong);
  DEFINE_REAL_INTEGER_MOD(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_MOD(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_MOD(ullong);
#endif
  DEFINE_REAL_INTEGER_MOD(sint8);
  DEFINE_REAL_INTEGER_MOD(uint8);
  DEFINE_REAL_INTEGER_MOD(sint16);
  DEFINE_REAL_INTEGER_MOD(uint16);
  DEFINE_REAL_INTEGER_MOD(sint32);
  DEFINE_REAL_INTEGER_MOD(uint32);
  DEFINE_REAL_INTEGER_MOD(sint64);
  DEFINE_REAL_INTEGER_MOD(uint64);
  DEFINE_REAL_FLONUM_MOD(flonumfl);
  DEFINE_REAL_FLONUM_MOD(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_MOD(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_MOD(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_MOD(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_MOD(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_MOD(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_MOD(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_MOD(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_MOD(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_MOD(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_MOD(flonumd128);
#endif
  DEFINE_REAL_INTEGER_MOD(ssize);
  DEFINE_REAL_INTEGER_MOD(usize);
  DEFINE_REAL_INTEGER_MOD(sintmax);
  DEFINE_REAL_INTEGER_MOD(uintmax);
  DEFINE_REAL_INTEGER_MOD(sintptr);
  DEFINE_REAL_INTEGER_MOD(uintptr);
  DEFINE_REAL_INTEGER_MOD(mode);
  DEFINE_REAL_INTEGER_MOD(off);
  DEFINE_REAL_INTEGER_MOD(pid);
  DEFINE_REAL_INTEGER_MOD(uid);
  DEFINE_REAL_INTEGER_MOD(gid);
  DEFINE_REAL_INTEGER_MOD(ptrdiff);
  DEFINE_REAL_INTEGER_MOD(wchar);
  DEFINE_REAL_INTEGER_MOD(wint);
  DEFINE_REAL_INTEGER_MOD(time);
  DEFINE_REAL_INTEGER_MOD(socklen);
  DEFINE_REAL_INTEGER_MOD(rlim);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Increment.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_INCR
#define DEFINE_REAL_INTEGER_INCR(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	rop = mmux_## STEM ## _literal(6);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_incr(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_incr(op1)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_INCR
#define DEFINE_REAL_FLONUM_INCR(STEM)							\
  {											\
    auto	op1 = mmux_## STEM ##_literal(5.0);					\
    auto	rop = mmux_## STEM ##_literal(6.0);					\
    auto	eps = mmux_## STEM ##_literal(1e-4);					\
    assert(mmux_## STEM ##_equal_relepsilon(rop, mmux_## STEM ##_incr(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_incr(op1), eps));		\
    dprintf(2," %s,", #STEM);								\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_incr (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_INCR(char);
  DEFINE_REAL_INTEGER_INCR(schar);
  DEFINE_REAL_INTEGER_INCR(uchar);
  DEFINE_REAL_INTEGER_INCR(sshort);
  DEFINE_REAL_INTEGER_INCR(ushort);
  DEFINE_REAL_INTEGER_INCR(sint);
  DEFINE_REAL_INTEGER_INCR(uint);
  DEFINE_REAL_INTEGER_INCR(slong);
  DEFINE_REAL_INTEGER_INCR(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_INCR(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_INCR(ullong);
#endif
  DEFINE_REAL_INTEGER_INCR(sint8);
  DEFINE_REAL_INTEGER_INCR(uint8);
  DEFINE_REAL_INTEGER_INCR(sint16);
  DEFINE_REAL_INTEGER_INCR(uint16);
  DEFINE_REAL_INTEGER_INCR(sint32);
  DEFINE_REAL_INTEGER_INCR(uint32);
  DEFINE_REAL_INTEGER_INCR(sint64);
  DEFINE_REAL_INTEGER_INCR(uint64);
  DEFINE_REAL_FLONUM_INCR(flonumfl);
  DEFINE_REAL_FLONUM_INCR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_INCR(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_INCR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_INCR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_INCR(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_INCR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_INCR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_INCR(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_INCR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_INCR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_INCR(flonumd128);
#endif
  DEFINE_REAL_INTEGER_INCR(ssize);
  DEFINE_REAL_INTEGER_INCR(usize);
  DEFINE_REAL_INTEGER_INCR(sintmax);
  DEFINE_REAL_INTEGER_INCR(uintmax);
  DEFINE_REAL_INTEGER_INCR(sintptr);
  DEFINE_REAL_INTEGER_INCR(uintptr);
  DEFINE_REAL_INTEGER_INCR(mode);
  DEFINE_REAL_INTEGER_INCR(off);
  DEFINE_REAL_INTEGER_INCR(pid);
  DEFINE_REAL_INTEGER_INCR(uid);
  DEFINE_REAL_INTEGER_INCR(gid);
  DEFINE_REAL_INTEGER_INCR(ptrdiff);
  DEFINE_REAL_INTEGER_INCR(wchar);
  DEFINE_REAL_INTEGER_INCR(wint);
  DEFINE_REAL_INTEGER_INCR(time);
  DEFINE_REAL_INTEGER_INCR(socklen);
  DEFINE_REAL_INTEGER_INCR(rlim);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Decrement.
 ** ----------------------------------------------------------------- */

#undef  DEFINE_REAL_INTEGER_DECR
#define DEFINE_REAL_INTEGER_DECR(STEM)					\
  {									\
    auto	op1 = mmux_## STEM ## _literal(5);			\
    auto	rop = mmux_## STEM ## _literal(4);			\
    assert(mmux_## STEM ##_equal(rop, mmux_## STEM ##_decr(op1)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_decr(op1)));		\
    dprintf(2," %s,", #STEM);						\
  }

#undef  DEFINE_REAL_FLONUM_DECR
#define DEFINE_REAL_FLONUM_DECR(STEM)							\
  {											\
    auto	op1 = mmux_## STEM ##_literal(5.0);					\
    auto	rop = mmux_## STEM ##_literal(4.0);					\
    auto	eps = mmux_## STEM ##_literal(1e-4);					\
    assert(mmux_## STEM ##_equal_relepsilon(rop, mmux_## STEM ##_decr(op1), eps));	\
    assert(mmux_ctype_equal_relepsilon(rop, mmux_ctype_decr(op1), eps));		\
    dprintf(2," %s,", #STEM);								\
  }

/* ------------------------------------------------------------------ */

static void
test_arithmetics_decr (void)
{
  dprintf(2, "running test: %s:", __func__);

  DEFINE_REAL_INTEGER_DECR(char);
  DEFINE_REAL_INTEGER_DECR(schar);
  DEFINE_REAL_INTEGER_DECR(uchar);
  DEFINE_REAL_INTEGER_DECR(sshort);
  DEFINE_REAL_INTEGER_DECR(ushort);
  DEFINE_REAL_INTEGER_DECR(sint);
  DEFINE_REAL_INTEGER_DECR(uint);
  DEFINE_REAL_INTEGER_DECR(slong);
  DEFINE_REAL_INTEGER_DECR(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_REAL_INTEGER_DECR(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_ULLONG
  DEFINE_REAL_INTEGER_DECR(ullong);
#endif
  DEFINE_REAL_INTEGER_DECR(sint8);
  DEFINE_REAL_INTEGER_DECR(uint8);
  DEFINE_REAL_INTEGER_DECR(sint16);
  DEFINE_REAL_INTEGER_DECR(uint16);
  DEFINE_REAL_INTEGER_DECR(sint32);
  DEFINE_REAL_INTEGER_DECR(uint32);
  DEFINE_REAL_INTEGER_DECR(sint64);
  DEFINE_REAL_INTEGER_DECR(uint64);
  DEFINE_REAL_FLONUM_DECR(flonumfl);
  DEFINE_REAL_FLONUM_DECR(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DEFINE_REAL_FLONUM_DECR(flonumldb);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DEFINE_REAL_FLONUM_DECR(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DEFINE_REAL_FLONUM_DECR(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DEFINE_REAL_FLONUM_DECR(flonumf128);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DEFINE_REAL_FLONUM_DECR(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DEFINE_REAL_FLONUM_DECR(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DEFINE_REAL_FLONUM_DECR(flonumf128x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DEFINE_REAL_FLONUM_DECR(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DEFINE_REAL_FLONUM_DECR(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DEFINE_REAL_FLONUM_DECR(flonumd128);
#endif
  DEFINE_REAL_INTEGER_DECR(ssize);
  DEFINE_REAL_INTEGER_DECR(usize);
  DEFINE_REAL_INTEGER_DECR(sintmax);
  DEFINE_REAL_INTEGER_DECR(uintmax);
  DEFINE_REAL_INTEGER_DECR(sintptr);
  DEFINE_REAL_INTEGER_DECR(uintptr);
  DEFINE_REAL_INTEGER_DECR(mode);
  DEFINE_REAL_INTEGER_DECR(off);
  DEFINE_REAL_INTEGER_DECR(pid);
  DEFINE_REAL_INTEGER_DECR(uid);
  DEFINE_REAL_INTEGER_DECR(gid);
  DEFINE_REAL_INTEGER_DECR(ptrdiff);
  DEFINE_REAL_INTEGER_DECR(wchar);
  DEFINE_REAL_INTEGER_DECR(wint);
  DEFINE_REAL_INTEGER_DECR(time);
  DEFINE_REAL_INTEGER_DECR(socklen);
  DEFINE_REAL_INTEGER_DECR(rlim);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

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
  if (1) {	test_arithmetics_absolute();	}
  if (1) {	test_arithmetics_mod();		}
  if (1) {	test_arithmetics_incr();	}
  if (1) {	test_arithmetics_decr();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
