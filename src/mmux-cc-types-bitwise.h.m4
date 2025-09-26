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
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_and (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_or  (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_xor (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_not (mmux_pointer_t op)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_shl (mmux_pointer_t op, mmux_sint_t nbits)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_shr (mmux_pointer_t op, mmux_sint_t nbits)
  __attribute__((__const__));

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_define([[[DEFINE_BITWISE_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_and (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_or  (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_xor (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_not (mmux_$1_t op)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_shl (mmux_$1_t op, mmux_sint_t nbits)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_shr (mmux_$1_t op, mmux_sint_t nbits)
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_BITWISE_PROTOS([[[char]]])
DEFINE_BITWISE_PROTOS([[[schar]]])
DEFINE_BITWISE_PROTOS([[[uchar]]])
DEFINE_BITWISE_PROTOS([[[sshort]]])
DEFINE_BITWISE_PROTOS([[[ushort]]])
DEFINE_BITWISE_PROTOS([[[sint]]])
DEFINE_BITWISE_PROTOS([[[uint]]])
DEFINE_BITWISE_PROTOS([[[slong]]])
DEFINE_BITWISE_PROTOS([[[ulong]]])
DEFINE_BITWISE_PROTOS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_BITWISE_PROTOS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_BITWISE_PROTOS([[[sint8]]])
DEFINE_BITWISE_PROTOS([[[uint8]]])
DEFINE_BITWISE_PROTOS([[[sint16]]])
DEFINE_BITWISE_PROTOS([[[uint16]]])
DEFINE_BITWISE_PROTOS([[[sint32]]])
DEFINE_BITWISE_PROTOS([[[uint32]]])
DEFINE_BITWISE_PROTOS([[[sint64]]])
DEFINE_BITWISE_PROTOS([[[uint64]]])

DEFINE_BITWISE_PROTOS([[[byte]]])
DEFINE_BITWISE_PROTOS([[[octet]]])
DEFINE_BITWISE_PROTOS([[[ssize]]])
DEFINE_BITWISE_PROTOS([[[usize]]])
DEFINE_BITWISE_PROTOS([[[sintmax]]])
DEFINE_BITWISE_PROTOS([[[uintmax]]])
DEFINE_BITWISE_PROTOS([[[sintptr]]])
DEFINE_BITWISE_PROTOS([[[uintptr]]])
DEFINE_BITWISE_PROTOS([[[ptrdiff]]])
DEFINE_BITWISE_PROTOS([[[libc_mode]]])
DEFINE_BITWISE_PROTOS([[[off]]])
DEFINE_BITWISE_PROTOS([[[libc_pid]]])
DEFINE_BITWISE_PROTOS([[[libc_uid]]])
DEFINE_BITWISE_PROTOS([[[libc_gid]]])
DEFINE_BITWISE_PROTOS([[[wchar]]])
DEFINE_BITWISE_PROTOS([[[wint]]])
DEFINE_BITWISE_PROTOS([[[libc_time]]])
DEFINE_BITWISE_PROTOS([[[libc_socklen]]])
DEFINE_BITWISE_PROTOS([[[libc_rlim]]])
DEFINE_BITWISE_PROTOS([[[libc_ino]]])
DEFINE_BITWISE_PROTOS([[[libc_dev]]])
DEFINE_BITWISE_PROTOS([[[libc_nlink]]])
DEFINE_BITWISE_PROTOS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_BITWISE_H */

/* end of file */
