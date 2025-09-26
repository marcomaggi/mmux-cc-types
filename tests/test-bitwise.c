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

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Bitwise AND.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_and (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  OP1
#define OP1		0b1111
#undef  OP2
#define OP2		0b1001
#undef	ROP
#define ROP		0b1001

  {
    auto	op1 = mmux_pointer_literal(OP1);
    auto	op2 = mmux_uintptr_literal(OP2);
    auto	rop = mmux_pointer_literal(ROP);
    assert(mmux_pointer_equal(rop, mmux_pointer_bitwise_and(op1, op2)));
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2)));
    dprintf(2," %s,", "pointer");
  }

#undef  DOIT
#define DOIT(STEM)								\
  {										\
    auto	op1 = mmux_##STEM##_literal(OP1);				\
    auto	op2 = mmux_##STEM##_literal(OP2);				\
    auto	rop = mmux_##STEM##_literal(ROP);				\
    assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_and(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_and(op1, op2)));		\
    dprintf(2," %s,", #STEM);						\
  }

  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise OR.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_or (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  OP1
#define OP1		0b1111
#undef  OP2
#define OP2		0b1001
#undef	ROP
#define ROP		0b1111

  {
    auto	op1 = mmux_pointer_literal(OP1);
    auto	op2 = mmux_uintptr_literal(OP2);
    auto	rop = mmux_pointer_literal(ROP);
    assert(mmux_pointer_equal(rop, mmux_pointer_bitwise_or(op1, op2)));
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2)));
  }

#undef  DOIT
#define DOIT(STEM)								\
  {										\
    auto	op1 = mmux_##STEM##_literal(OP1);				\
    auto	op2 = mmux_##STEM##_literal(OP2);				\
    auto	rop = mmux_##STEM##_literal(ROP);				\
    assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_or(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_or(op1, op2)));		\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise XOR.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_xor (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  OP1
#define OP1		0b1111
#undef  OP2
#define OP2		0b1001
#undef	ROP
#define ROP		0b0110

  {
    auto	op1 = mmux_pointer_literal(OP1);
    auto	op2 = mmux_uintptr_literal(OP2);
    auto	rop = mmux_pointer_literal(ROP);
    assert(mmux_pointer_equal(rop, mmux_pointer_bitwise_xor(op1, op2)));
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2)));
  }

#undef  DOIT
#define DOIT(STEM)								\
  {										\
    auto	op1 = mmux_##STEM##_literal(OP1);				\
    auto	op2 = mmux_##STEM##_literal(OP2);				\
    auto	rop = mmux_##STEM##_literal(ROP);				\
    assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_xor(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_xor(op1, op2)));		\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise NOT.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_not (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM)							\
  {									\
    {									\
      auto	op1 = mmux_##STEM##_constant_maximum();			\
      auto	rop = mmux_##STEM##_constant_minimum();			\
      if (0) {								\
	dprintf(2, "op1 = '");						\
	mmux_##STEM##_dprintf(2, op1);					\
	dprintf(2, "', rop = '");					\
	mmux_##STEM##_dprintf(2, rop);					\
	dprintf(2, "', result = '");					\
	mmux_##STEM##_dprintf(2, mmux_##STEM##_bitwise_not(op1));	\
	dprintf(2, "'\n");						\
      }									\
      assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_not(op1)));	\
      assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_not(op1)));	\
      dprintf(2," %s,", #STEM);						\
    }									\
    {									\
      auto	op1 = mmux_##STEM##_constant_minimum();			\
      auto	rop = mmux_##STEM##_constant_maximum();			\
      if (0) {								\
	dprintf(2, "op1 = '");						\
	mmux_##STEM##_dprintf(2, op1);					\
	dprintf(2, "', rop = '");					\
	mmux_##STEM##_dprintf(2, rop);					\
	dprintf(2, "', result = '");					\
	mmux_##STEM##_dprintf(2, mmux_##STEM##_bitwise_not(op1));	\
	dprintf(2, "'\n");						\
      }									\
      assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_not(op1)));	\
      assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_not(op1)));	\
      dprintf(2," %s,", #STEM);						\
    }									\
  }

  DOIT(pointer);
  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise shift left.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shl (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM)								\
  {										\
    auto	op1 = mmux_##STEM##_literal(0b0001);				\
    auto	op2 = mmux_sint(3);						\
    auto	rop = mmux_##STEM##_literal(0b1000);				\
    assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_shl(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shl(op1, op2)));		\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT(pointer);
  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise shift right.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shr (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT
#define DOIT(STEM)								\
  {										\
    auto	op1 = mmux_##STEM##_literal(0b1000);				\
    auto	op2 = mmux_sint(3);						\
    auto	rop = mmux_##STEM##_literal(0b0001);				\
    assert(mmux_##STEM##_equal(rop, mmux_##STEM##_bitwise_shr(op1, op2)));	\
    assert(mmux_ctype_equal(rop, mmux_ctype_bitwise_shr(op1, op2)));		\
    dprintf(2," %s,", #STEM);							\
  }

  DOIT(pointer);
  DOIT(char);
  DOIT(schar);
  DOIT(uchar);
  DOIT(sshort);
  DOIT(ushort);
  DOIT(sint);
  DOIT(uint);
  DOIT(slong);
  DOIT(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DOIT(ullong);
#endif
  DOIT(sint8);
  DOIT(uint8);
  DOIT(sint16);
  DOIT(uint16);
  DOIT(sint32);
  DOIT(uint32);
  DOIT(sint64);
  DOIT(uint64);
  DOIT(byte);
  DOIT(octet);
  DOIT(ssize);
  DOIT(usize);
  DOIT(sintmax);
  DOIT(uintmax);
  DOIT(sintptr);
  DOIT(uintptr);
  DOIT(ptrdiff);
  DOIT(libc_mode);
  DOIT(libc_pid);
  DOIT(libc_uid);
  DOIT(libc_gid);
  DOIT(off);
  DOIT(wchar);
  DOIT(wint);
  DOIT(libc_rlim);
  DOIT(libc_socklen);
  DOIT(libc_time);
  DOIT(libc_ino);
  DOIT(libc_dev);
  DOIT(libc_nlink);
  DOIT(libc_blkcnt);

  dprintf(2, " DONE.\n\n");
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
