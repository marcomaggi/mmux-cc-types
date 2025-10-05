/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  7, 2025

  Abstract

	This  is module  implements the  arithmetic functions.   This header  file is
	included by the main header "mmux-cc-types.h"  and it must not be included by
	itself.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_ARITHMETIC_H
#define MMUX_CC_TYPES_ARITHMETIC_H 1


/** --------------------------------------------------------------------
 ** Arithmetics: pointers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_add (mmux_pointer_t op, mmux_ptrdiff_t delta)
{
  auto	op_octets  = (mmux_standard_uint8_t *)op;
  auto	rop_octets = op_octets + delta.value;
  auto	rop        = mmux_pointer(rop_octets);
  return rop;
}
mmux_cc_types_inline_decl mmux_ptrdiff_t
mmux_pointer_sub (mmux_pointer_t ptr1, mmux_pointer_t ptr2)
{
  auto	ptr1_octets  = (mmux_standard_uint8_t *)ptr1;
  auto	ptr2_octets  = (mmux_standard_uint8_t *)ptr2;
  auto	delta        = mmux_ptrdiff(ptr1_octets - ptr2_octets);
  return delta;
}


/** --------------------------------------------------------------------
 ** Arithmetics: standard exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_add (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return op1 + op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_sub (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return op1 - op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_mul (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return op1 * op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_div (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return op1 / op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_inverse (mmux_standard_$1_t op)
{
  return mmux_standard_$1_constant_one() / op;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_modulo (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
{
  return op1 % op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_remainder (mmux_standard_$1_t op1, mmux_standard_$1_t op2)
/* It is  the same  as "modulo".   It is  defined for  compatibility with  the flonum
   API. */
{
  return op1 % op2;
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_incr (mmux_standard_$1_t op)
{
  return op + mmux_standard_$1_constant_one();
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_decr (mmux_standard_$1_t op)
{
  return op - mmux_standard_$1_constant_one();
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_neg (mmux_standard_$1_t op)
{
  return (- op);
}
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_absolute (mmux_standard_$1_t op)
{
  return ((mmux_standard_$1_is_negative(op))? mmux_standard_$1_neg(op) : op);
}
]]])]]])
m4_divert(0)
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[char]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[schar]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[slong]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[byte]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[octet]]])

DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[usize]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_mode]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[off]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_pid]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_uid]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_gid]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[wint]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[time]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_socklen]]])
DEFINE_STANDARD_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[libc_rlim]]])


/** --------------------------------------------------------------------
 ** Arithmetics: exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_$2 (mmux_$1_t op)
{
  return mmux_$1(mmux_standard_$1_$2(op.value));
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(mmux_standard_$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	add)
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	sub)
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	mul)
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	div)
DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	inverse)
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	modulo)
DEFINE_EXACT_INTEGER_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	remainder)
DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	incr)
DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	decr)
DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	neg)
DEFINE_EXACT_INTEGER_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	absolute)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[char]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[schar]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uchar]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sshort]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ushort]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[slong]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ulong]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint8]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint8]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint16]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint16]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint32]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint32]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sint64]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uint64]]])

DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[byte]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[octet]]])

DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ssize]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[usize]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sintmax]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uintmax]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[sintptr]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[uintptr]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[off]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[ptrdiff]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[wchar]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[wint]]])
DEFINE_EXACT_INTEGER_ARITHMETICS_INLINE_FUNCTIONS([[[time]]])


/** --------------------------------------------------------------------
 ** Arithmetics: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_add (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 + op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_sub (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 - op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_mul (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 * op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_div (mmux_standard_flonum$1_t op1, mmux_standard_flonum$1_t op2)
{
  return op1 / op2;
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_inverse (mmux_standard_flonum$1_t op)
{
  return mmux_standard_flonum$1_constant_one() / (op);
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_incr (mmux_standard_flonum$1_t op)
{
  return op + mmux_standard_flonum$1_constant_one();
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_decr (mmux_standard_flonum$1_t op)
{
  return op - mmux_standard_flonum$1_constant_one();
}
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_neg (mmux_standard_flonum$1_t op)
{
  return - op;
}

mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonum$1_t mmux_standard_flonum$1_modulo
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonum$1_t mmux_standard_flonum$1_remainder
  __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonum$1_t mmux_standard_flonum$1_absolute
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(fl)
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(db)
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(ldb,	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f32,	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f64,	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f128,	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f32x,	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f64x,	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_STANDARD_FLONUM_ARITHMETICS_INLINE_FUNCTIONS(f128x,	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])


/** --------------------------------------------------------------------
 ** Arithmetics: standard flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_add (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 + op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_sub (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 - op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_mul (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 * op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_div (mmux_standard_flonumc$1_t op1, mmux_standard_flonumc$1_t op2)
{
  return op1 / op2;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_inverse (mmux_standard_flonumc$1_t op)
{
  return mmux_standard_flonumc$1_constant_one() / op;
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_neg (mmux_standard_flonumc$1_t op)
{
  return - op;
}

mmux_cc_types_decl mmux_standard_flonum$1_t mmux_standard_flonumc$1_absolute (mmux_standard_flonumc$1_t op)
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[fl]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[db]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[ldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_STANDARD_FLONUMC_ARITHMETICS_PROTOS([[[f128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-arithmetics.h>
#endif


/** --------------------------------------------------------------------
 ** Arithmetics: flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op.value));
}]]])

m4_define([[[DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_$2 (mmux_flonum$1_t op1, mmux_flonum$1_t op2)
{
  return mmux_flonum$1(mmux_standard_flonum$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	add)
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	sub)
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	mul)
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	div)
DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	inverse)
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	modulo)
DEFINE_FLONUM_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	remainder)
DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	incr)
DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	decr)
DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	neg)
DEFINE_FLONUM_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	absolute)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[fl]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[db]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[ldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[d32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[d64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUM_ARITHMETICS_INLINE_FUNCTIONS([[[d128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Arithmetics: flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMC_ARITHMETIC_UNARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_$2 (mmux_flonumc$1_t op)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_$2(op.value));
}]]])

m4_define([[[DEFINE_FLONUMC_ARITHMETIC_BINARY_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_$2 (mmux_flonumc$1_t op1, mmux_flonumc$1_t op2)
{
  return mmux_flonumc$1(mmux_standard_flonumc$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_FLONUMC_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	add)
DEFINE_FLONUMC_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	sub)
DEFINE_FLONUMC_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	mul)
DEFINE_FLONUMC_ARITHMETIC_BINARY_INLINE_FUNCTION($1,	div)
DEFINE_FLONUMC_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	inverse)
DEFINE_FLONUMC_ARITHMETIC_UNARY_INLINE_FUNCTION($1,	neg)

mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonumc$1_absolute (mmux_flonumc$1_t op)
{
  return mmux_flonum$1(mmux_standard_flonumc$1_absolute(op.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[fl]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[db]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[ldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[f128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[d32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCD32]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[d64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCD64]]])
DEFINE_FLONUMC_ARITHMETICS_INLINE_FUNCTIONS([[[d128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCD128]]])


/** --------------------------------------------------------------------
 ** Arithmetics, generic macros.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC_POINTER([[[add]]])
DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC_POINTER([[[sub]]])
DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC([[[mul]]])
DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC([[[div]]])
DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM([[[modulo]]])
DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM([[[remainder]]])
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC([[[neg]]])
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC([[[inverse]]])
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC([[[absolute]]])
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM([[[incr]]])
DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM([[[decr]]])

#define mmux_ctype_add_to_variable(VARNAME,VALUE)	((VARNAME) = mmux_ctype_add((VARNAME),(VALUE)))
#define mmux_ctype_sub_from_variable(VARNAME,VALUE)	((VARNAME) = mmux_ctype_sub((VARNAME),(VALUE)))

#define mmux_ctype_incr_variable(VARNAME)	\
     ((VARNAME) = mmux_ctype_add((VARNAME),(mmux_ctype_constant_one(VARNAME))))

#define mmux_ctype_decr_variable(VARNAME)	\
     ((VARNAME) = mmux_ctype_sub((VARNAME),(mmux_ctype_constant_one(VARNAME))))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_ARITHMETIC_H */

/* end of file */
