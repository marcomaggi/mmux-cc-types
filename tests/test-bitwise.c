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
#undef	EROP
#define EROP		0b1001

  {
    auto		op1  = mmux_pointer_literal(OP1);
    auto		op2  = mmux_uintptr_literal(OP2);
    auto		erop = mmux_pointer_literal(EROP);
    auto		rop1 = mmux_pointer_bitwise_and(op1, op2);
    auto		rop2 = mmux_ctype_bitwise_and(op1, op2);
    typeof(erop)	rop3;
    typeof(erop)	rop4;
    PERFORM_CALL_P(mmux_pointer_bitwise_and_p(&rop3, &op1, &op2));
    PERFORM_CALL_P(mmux_ctype_bitwise_and_p(&rop4, &op1, &op2));
    BINARY_EXACT_COMPARISON(pointer,bitwise_and,op1,op2,erop,rop1);
    BINARY_EXACT_COMPARISON(pointer,bitwise_and,op1,op2,erop,rop2);
    BINARY_EXACT_COMPARISON(pointer,bitwise_and,op1,op2,erop,rop3);
    BINARY_EXACT_COMPARISON(pointer,bitwise_and,op1,op2,erop,rop4);
    dprintf(2," %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,bitwise_and,OP1,OP2,EROP);	    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

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
#undef	EROP
#define EROP		0b1111

  {
    auto		op1  = mmux_pointer_literal(OP1);
    auto		op2  = mmux_uintptr_literal(OP2);
    auto		erop = mmux_pointer_literal(EROP);
    auto		rop1 = mmux_pointer_bitwise_or(op1, op2);
    auto		rop2 = mmux_ctype_bitwise_or(op1, op2);
    typeof(erop)	rop3;
    typeof(erop)	rop4;
    PERFORM_CALL_P(mmux_pointer_bitwise_or_p(&rop3, &op1, &op2));
    PERFORM_CALL_P(mmux_ctype_bitwise_or_p(&rop4, &op1, &op2));
    BINARY_EXACT_COMPARISON(pointer,bitwise_or,op1,op2,erop,rop1);
    BINARY_EXACT_COMPARISON(pointer,bitwise_or,op1,op2,erop,rop2);
    BINARY_EXACT_COMPARISON(pointer,bitwise_or,op1,op2,erop,rop3);
    BINARY_EXACT_COMPARISON(pointer,bitwise_or,op1,op2,erop,rop4);
    dprintf(2," %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,bitwise_or,OP1,OP2,EROP);	    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

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
#undef	EROP
#define EROP		0b0110

  {
    auto		op1  = mmux_pointer_literal(OP1);
    auto		op2  = mmux_uintptr_literal(OP2);
    auto		erop = mmux_pointer_literal(EROP);
    auto		rop1 = mmux_pointer_bitwise_xor(op1, op2);
    auto		rop2 = mmux_ctype_bitwise_xor(op1, op2);
    typeof(erop)	rop3;
    typeof(erop)	rop4;
    PERFORM_CALL_P(mmux_pointer_bitwise_xor_p(&rop3, &op1, &op2));
    PERFORM_CALL_P(mmux_ctype_bitwise_xor_p(&rop4, &op1, &op2));
    BINARY_EXACT_COMPARISON(pointer,bitwise_xor,op1,op2,erop,rop1);
    BINARY_EXACT_COMPARISON(pointer,bitwise_xor,op1,op2,erop,rop2);
    BINARY_EXACT_COMPARISON(pointer,bitwise_xor,op1,op2,erop,rop3);
    BINARY_EXACT_COMPARISON(pointer,bitwise_xor,op1,op2,erop,rop4);
    dprintf(2," %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)			    \
  {							    \
    BINARY_INTEGER_FUNC(STEM,bitwise_xor,OP1,OP2,EROP);	    \
    dprintf(2," %s,", #STEM);				    \
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise NOT.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_not (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)					\
  {									\
    auto		op   = mmux_##STEM##_constant_maximum();	\
    auto		erop = mmux_##STEM##_constant_minimum();	\
    auto		rop1 = mmux_##STEM##_bitwise_not(op);		\
    auto		rop2 = mmux_ctype_bitwise_not(op);		\
    typeof(erop)	rop3;						\
    typeof(erop)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_bitwise_not_p(&rop3, &op));		\
    PERFORM_CALL_P(mmux_ctype_bitwise_not_p(&rop4, &op));		\
    UNARY_EXACT_COMPARISON(STEM,bitwise_not,op,erop,rop1);		\
    UNARY_EXACT_COMPARISON(STEM,bitwise_not,op,erop,rop2);		\
    UNARY_EXACT_COMPARISON(STEM,bitwise_not,op,erop,rop3);		\
    UNARY_EXACT_COMPARISON(STEM,bitwise_not,op,erop,rop4);		\
    dprintf(2," %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(pointer);
  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise shift left.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shl (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)					\
  {									\
    auto		op1  = mmux_##STEM##_literal(0b0001);		\
    auto		op2  = mmux_sint_literal(3);			\
    auto		erop = mmux_##STEM##_literal(0b1000);		\
    auto		rop1 = mmux_##STEM##_bitwise_shl(op1,op2);	\
    auto		rop2 = mmux_ctype_bitwise_shl(op1,op2);		\
    typeof(erop)	rop3;						\
    typeof(erop)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_bitwise_shl_p(&rop3, &op1, &op2));	\
    PERFORM_CALL_P(mmux_ctype_bitwise_shl_p(&rop4, &op1, &op2));	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shl,op1,op2,erop,rop1);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shl,op1,op2,erop,rop2);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shl,op1,op2,erop,rop3);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shl,op1,op2,erop,rop4);	\
    dprintf(2," %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(pointer);
  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Bitwise shift right.
 ** ----------------------------------------------------------------- */

static void
test_bitwise_shr (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

#undef  DEFINE_INTEGER_TEST
#define DEFINE_INTEGER_TEST(STEM)					\
  {									\
    auto		op1  = mmux_##STEM##_literal(0b1000);		\
    auto		op2  = mmux_sint_literal(3);			\
    auto		erop = mmux_##STEM##_literal(0b0001);		\
    auto		rop1 = mmux_##STEM##_bitwise_shr(op1,op2);	\
    auto		rop2 = mmux_ctype_bitwise_shr(op1,op2);		\
    typeof(erop)	rop3;						\
    typeof(erop)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_bitwise_shr_p(&rop3, &op1, &op2));	\
    PERFORM_CALL_P(mmux_ctype_bitwise_shr_p(&rop4, &op1, &op2));	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shr,op1,op2,erop,rop1);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shr,op1,op2,erop,rop2);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shr,op1,op2,erop,rop3);	\
    BINARY_EXACT_COMPARISON(STEM,bitwise_shr,op1,op2,erop,rop4);	\
    dprintf(2," %s,", #STEM);						\
  }

/* ------------------------------------------------------------------ */

  DEFINE_INTEGER_TEST(pointer);
  DEFINE_INTEGER_TEST(char);
  DEFINE_INTEGER_TEST(schar);
  DEFINE_INTEGER_TEST(uchar);
  DEFINE_INTEGER_TEST(sshort);
  DEFINE_INTEGER_TEST(ushort);
  DEFINE_INTEGER_TEST(sint);
  DEFINE_INTEGER_TEST(uint);
  DEFINE_INTEGER_TEST(slong);
  DEFINE_INTEGER_TEST(ulong);
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(sllong);
#endif
#ifdef MMUX_CC_TYPES_HAS_SLLONG
  DEFINE_INTEGER_TEST(ullong);
#endif
  DEFINE_INTEGER_TEST(sint8);
  DEFINE_INTEGER_TEST(uint8);
  DEFINE_INTEGER_TEST(sint16);
  DEFINE_INTEGER_TEST(uint16);
  DEFINE_INTEGER_TEST(sint32);
  DEFINE_INTEGER_TEST(uint32);
  DEFINE_INTEGER_TEST(sint64);
  DEFINE_INTEGER_TEST(uint64);
  DEFINE_INTEGER_TEST(byte);
  DEFINE_INTEGER_TEST(octet);
  DEFINE_INTEGER_TEST(ssize);
  DEFINE_INTEGER_TEST(usize);
  DEFINE_INTEGER_TEST(sintmax);
  DEFINE_INTEGER_TEST(uintmax);
  DEFINE_INTEGER_TEST(sintptr);
  DEFINE_INTEGER_TEST(uintptr);
  DEFINE_INTEGER_TEST(off);
  DEFINE_INTEGER_TEST(ptrdiff);
  DEFINE_INTEGER_TEST(time);
  DEFINE_INTEGER_TEST(clock);
  DEFINE_INTEGER_TEST(wchar);
  DEFINE_INTEGER_TEST(wint);
  DEFINE_INTEGER_TEST(libc_blkcnt);
  DEFINE_INTEGER_TEST(libc_dev);
  DEFINE_INTEGER_TEST(libc_gid);
  DEFINE_INTEGER_TEST(libc_ino);
  DEFINE_INTEGER_TEST(libc_mode);
  DEFINE_INTEGER_TEST(libc_nlink);
  DEFINE_INTEGER_TEST(libc_pid);
  DEFINE_INTEGER_TEST(libc_rlim);
  DEFINE_INTEGER_TEST(libc_socklen);
  DEFINE_INTEGER_TEST(libc_uid);

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
