/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep  8, 2025

  Abstract

	This  is  module implements  the  bitwise  functions.   This header  file  is
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

#ifndef MMUX_CC_TYPES_BITWISE_H
#define MMUX_CC_TYPES_BITWISE_H 1


/** --------------------------------------------------------------------
 ** Bitwise operations: pointers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_and (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr &= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_or (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr |= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_xor (mmux_pointer_t op, mmux_uintptr_t mask)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr ^= mask.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_not (mmux_pointer_t op)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr = ~ op_uintptr;
  return (mmux_pointer_t)op_uintptr;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_shl (mmux_pointer_t op, mmux_sint_t nbits)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr <<= nbits.value;
  return (mmux_pointer_t)op_uintptr;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_bitwise_shr (mmux_pointer_t op, mmux_sint_t nbits)
{
  auto	op_uintptr = (mmux_standard_uintptr_t)op;
  op_uintptr >>= nbits.value;
  return (mmux_pointer_t)op_uintptr;
}


/** --------------------------------------------------------------------
 ** Bitwise operations: exact integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BITWISE_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_and (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value & op2.value);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_or (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value | op2.value);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_xor (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$1(op1.value ^ op2.value);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_not (mmux_$1_t op)
{
  return mmux_$1(~ op.value);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_shl (mmux_$1_t op, mmux_sint_t nbits)
{
  return mmux_$1(op.value << nbits.value);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_bitwise_shr (mmux_$1_t op, mmux_sint_t nbits)
{
  return mmux_$1(op.value >> nbits.value);
}
]]])]]])

DEFINE_BITWISE_FUNCS([[[char]]])
DEFINE_BITWISE_FUNCS([[[schar]]])
DEFINE_BITWISE_FUNCS([[[uchar]]])
DEFINE_BITWISE_FUNCS([[[sshort]]])
DEFINE_BITWISE_FUNCS([[[ushort]]])
DEFINE_BITWISE_FUNCS([[[sint]]])
DEFINE_BITWISE_FUNCS([[[uint]]])
DEFINE_BITWISE_FUNCS([[[slong]]])
DEFINE_BITWISE_FUNCS([[[ulong]]])
DEFINE_BITWISE_FUNCS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_BITWISE_FUNCS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_BITWISE_FUNCS([[[sint8]]])
DEFINE_BITWISE_FUNCS([[[uint8]]])
DEFINE_BITWISE_FUNCS([[[sint16]]])
DEFINE_BITWISE_FUNCS([[[uint16]]])
DEFINE_BITWISE_FUNCS([[[sint32]]])
DEFINE_BITWISE_FUNCS([[[uint32]]])
DEFINE_BITWISE_FUNCS([[[sint64]]])
DEFINE_BITWISE_FUNCS([[[uint64]]])

DEFINE_BITWISE_FUNCS([[[byte]]])
DEFINE_BITWISE_FUNCS([[[octet]]])

DEFINE_BITWISE_FUNCS([[[ssize]]])
DEFINE_BITWISE_FUNCS([[[usize]]])
DEFINE_BITWISE_FUNCS([[[sintmax]]])
DEFINE_BITWISE_FUNCS([[[uintmax]]])
DEFINE_BITWISE_FUNCS([[[sintptr]]])
DEFINE_BITWISE_FUNCS([[[uintptr]]])
DEFINE_BITWISE_FUNCS([[[ptrdiff]]])
DEFINE_BITWISE_FUNCS([[[libc_mode]]])
DEFINE_BITWISE_FUNCS([[[off]]])
DEFINE_BITWISE_FUNCS([[[libc_pid]]])
DEFINE_BITWISE_FUNCS([[[libc_uid]]])
DEFINE_BITWISE_FUNCS([[[libc_gid]]])
DEFINE_BITWISE_FUNCS([[[wchar]]])
DEFINE_BITWISE_FUNCS([[[wint]]])
DEFINE_BITWISE_FUNCS([[[time]]])
DEFINE_BITWISE_FUNCS([[[libc_socklen]]])
DEFINE_BITWISE_FUNCS([[[libc_rlim]]])
DEFINE_BITWISE_FUNCS([[[libc_ino]]])
DEFINE_BITWISE_FUNCS([[[libc_dev]]])
DEFINE_BITWISE_FUNCS([[[libc_nlink]]])
DEFINE_BITWISE_FUNCS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_BITWISE_H */

/* end of file */
