/*
  Part of: MMUX CC Types
  Contents: public header file, pointers API
  Date: Sep 28, 2025

  Abstract

	This  a the  public  header included  by "mmux-cc-types.h";  it  must not  be
	included by itself.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_POINTERS_API_H
#define MMUX_CC_TYPES_POINTERS_API_H 1


m4_divert(-1)
/** --------------------------------------------------------------------
 ** Macros.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_NULLARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop)
{
  *rop = mmux_$1_$2();
  return false;
}]]])

m4_define([[[DEFINE_UNARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_BINARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t * op1, mmux_$1_t * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_define([[[DEFINE_TERNARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t * op1, mmux_$1_t * op2, mmux_$1_t * op3)
{
  *rop = mmux_$1_$2(*op1, *op2, *op3);
  return false;
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_UNARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_BINARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t * op1, mmux_$1_t * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_define([[[DEFINE_TERNARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t * op1, mmux_$1_t * op2, mmux_$1_t * op3)
{
  *rop = mmux_$1_$2(*op1, *op2, *op3);
  return false;
}]]])

m4_divert(0)m4_dnl


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_UNARY_PREDICATE($1,	is_zero)
DEFINE_UNARY_PREDICATE($1,	is_positive)
DEFINE_UNARY_PREDICATE($1,	is_negative)
DEFINE_UNARY_PREDICATE($1,	is_non_positive)
DEFINE_UNARY_PREDICATE($1,	is_non_negative)
DEFINE_UNARY_PREDICATE($1,	is_infinite)
DEFINE_UNARY_PREDICATE($1,	is_finite)
DEFINE_UNARY_PREDICATE($1,	is_nan)
]]])]]])

m4_define([[[DEFINE_PREDICATES_FLONUM]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_UNARY_PREDICATE($1,	is_subnormal)
DEFINE_UNARY_PREDICATE($1,	is_normal)
]]])]]])
m4_divert(0)m4_dnl

DEFINE_PREDICATES([[[pointer]]])
DEFINE_PREDICATES([[[char]]])
DEFINE_PREDICATES([[[schar]]])
DEFINE_PREDICATES([[[uchar]]])
DEFINE_PREDICATES([[[sshort]]])
DEFINE_PREDICATES([[[ushort]]])
DEFINE_PREDICATES([[[sint]]])
DEFINE_PREDICATES([[[uint]]])
DEFINE_PREDICATES([[[slong]]])
DEFINE_PREDICATES([[[ulong]]])
DEFINE_PREDICATES([[[sllong]]])
DEFINE_PREDICATES([[[ullong]]])

DEFINE_PREDICATES([[[sint8]]])
DEFINE_PREDICATES([[[uint8]]])
DEFINE_PREDICATES([[[sint16]]])
DEFINE_PREDICATES([[[uint16]]])
DEFINE_PREDICATES([[[sint32]]])
DEFINE_PREDICATES([[[uint32]]])
DEFINE_PREDICATES([[[sint64]]])
DEFINE_PREDICATES([[[uint64]]])

DEFINE_PREDICATES([[[byte]]])
DEFINE_PREDICATES([[[octet]]])

DEFINE_PREDICATES([[[ssize]]])
DEFINE_PREDICATES([[[usize]]])
DEFINE_PREDICATES([[[sintmax]]])
DEFINE_PREDICATES([[[uintmax]]])
DEFINE_PREDICATES([[[sintptr]]])
DEFINE_PREDICATES([[[uintptr]]])
DEFINE_PREDICATES([[[ptrdiff]]])
DEFINE_PREDICATES([[[libc_mode]]])
DEFINE_PREDICATES([[[off]]])
DEFINE_PREDICATES([[[libc_pid]]])
DEFINE_PREDICATES([[[libc_uid]]])
DEFINE_PREDICATES([[[libc_gid]]])
DEFINE_PREDICATES([[[wchar]]])
DEFINE_PREDICATES([[[wint]]])
DEFINE_PREDICATES([[[libc_time]]])
DEFINE_PREDICATES([[[libc_socklen]]])
DEFINE_PREDICATES([[[libc_rlim]]])
DEFINE_PREDICATES([[[libc_ino]]])
DEFINE_PREDICATES([[[libc_dev]]])
DEFINE_PREDICATES([[[libc_nlink]]])
DEFINE_PREDICATES([[[libc_blkcnt]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATES([[[flonumfl]]])
DEFINE_PREDICATES([[[flonumdb]]])
DEFINE_PREDICATES([[[flonumldb]]])

DEFINE_PREDICATES([[[flonumf32]]])
DEFINE_PREDICATES([[[flonumf64]]])
DEFINE_PREDICATES([[[flonumf128]]])

DEFINE_PREDICATES([[[flonumf32x]]])
DEFINE_PREDICATES([[[flonumf64x]]])
DEFINE_PREDICATES([[[flonumf128x]]])

DEFINE_PREDICATES([[[flonumd32]]])
DEFINE_PREDICATES([[[flonumd64]]])
DEFINE_PREDICATES([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATES([[[flonumcfl]]])
DEFINE_PREDICATES([[[flonumcdb]]])
DEFINE_PREDICATES([[[flonumcldb]]])

DEFINE_PREDICATES([[[flonumcf32]]])
DEFINE_PREDICATES([[[flonumcf64]]])
DEFINE_PREDICATES([[[flonumcf128]]])

DEFINE_PREDICATES([[[flonumcf32x]]])
DEFINE_PREDICATES([[[flonumcf64x]]])
DEFINE_PREDICATES([[[flonumcf128x]]])

DEFINE_PREDICATES([[[flonumcd32]]])
DEFINE_PREDICATES([[[flonumcd64]]])
DEFINE_PREDICATES([[[flonumcd128]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATES_FLONUM([[[flonumfl]]])
DEFINE_PREDICATES_FLONUM([[[flonumdb]]])
DEFINE_PREDICATES_FLONUM([[[flonumldb]]])

DEFINE_PREDICATES_FLONUM([[[flonumf32]]])
DEFINE_PREDICATES_FLONUM([[[flonumf64]]])
DEFINE_PREDICATES_FLONUM([[[flonumf128]]])

DEFINE_PREDICATES_FLONUM([[[flonumf32x]]])
DEFINE_PREDICATES_FLONUM([[[flonumf64x]]])
DEFINE_PREDICATES_FLONUM([[[flonumf128x]]])

DEFINE_PREDICATES_FLONUM([[[flonumd32]]])
DEFINE_PREDICATES_FLONUM([[[flonumd64]]])
DEFINE_PREDICATES_FLONUM([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATES_FLONUM([[[flonumcfl]]])
DEFINE_PREDICATES_FLONUM([[[flonumcdb]]])
DEFINE_PREDICATES_FLONUM([[[flonumcldb]]])

DEFINE_PREDICATES_FLONUM([[[flonumcf32]]])
DEFINE_PREDICATES_FLONUM([[[flonumcf64]]])
DEFINE_PREDICATES_FLONUM([[[flonumcf128]]])

DEFINE_PREDICATES_FLONUM([[[flonumcf32x]]])
DEFINE_PREDICATES_FLONUM([[[flonumcf64x]]])
DEFINE_PREDICATES_FLONUM([[[flonumcf128x]]])

DEFINE_PREDICATES_FLONUM([[[flonumcd32]]])
DEFINE_PREDICATES_FLONUM([[[flonumcd64]]])
DEFINE_PREDICATES_FLONUM([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Arithemtics.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_BINARY_OPERATION($1,	add)
DEFINE_BINARY_OPERATION($1,	sub)
DEFINE_BINARY_OPERATION($1,	mul)
DEFINE_BINARY_OPERATION($1,	div)
DEFINE_UNARY_OPERATION($1,	inverse)
DEFINE_BINARY_OPERATION($1,	modulo)
DEFINE_BINARY_OPERATION($1,	remainder)
DEFINE_UNARY_OPERATION($1,	incr)
DEFINE_UNARY_OPERATION($1,	decr)
DEFINE_UNARY_OPERATION($1,	neg)
DEFINE_UNARY_OPERATION($1,	absolute)
]]])]]])

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS_FLONUMC]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_BINARY_OPERATION($1,	add)
DEFINE_BINARY_OPERATION($1,	sub)
DEFINE_BINARY_OPERATION($1,	mul)
DEFINE_BINARY_OPERATION($1,	div)
DEFINE_UNARY_OPERATION($1,	inverse)
DEFINE_UNARY_OPERATION($1,	neg)

mmux_cc_types_inline_decl bool
mmux_$1_absolute_p (mmux_$1_part_t * rop, mmux_$1_t * op1)
{
  *rop = mmux_$1_absolute(*op1);
  return false;
}]]])]]])

/* ------------------------------------------------------------------ */

m4_divert(0)m4_dnl

mmux_cc_types_inline_decl bool
mmux_pointer_add_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_ptrdiff_t * op2)
{
  *rop = mmux_pointer_add(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_sub_p (mmux_ptrdiff_t * rop, mmux_pointer_t * op1, mmux_pointer_t * op2)
{
  *rop = mmux_pointer_sub(*op1, *op2);
  return false;
}

/* ------------------------------------------------------------------ */

DEFINE_ARITHMETIC_OPERATIONS([[[char]]])
DEFINE_ARITHMETIC_OPERATIONS([[[schar]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uchar]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sshort]]])
DEFINE_ARITHMETIC_OPERATIONS([[[ushort]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sint]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uint]]])
DEFINE_ARITHMETIC_OPERATIONS([[[slong]]])
DEFINE_ARITHMETIC_OPERATIONS([[[ulong]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sllong]]])
DEFINE_ARITHMETIC_OPERATIONS([[[ullong]]])

DEFINE_ARITHMETIC_OPERATIONS([[[sint8]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uint8]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sint16]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uint16]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sint32]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uint32]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sint64]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uint64]]])

DEFINE_ARITHMETIC_OPERATIONS([[[byte]]])
DEFINE_ARITHMETIC_OPERATIONS([[[octet]]])

DEFINE_ARITHMETIC_OPERATIONS([[[ssize]]])
DEFINE_ARITHMETIC_OPERATIONS([[[usize]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sintmax]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uintmax]]])
DEFINE_ARITHMETIC_OPERATIONS([[[sintptr]]])
DEFINE_ARITHMETIC_OPERATIONS([[[uintptr]]])
DEFINE_ARITHMETIC_OPERATIONS([[[off]]])
DEFINE_ARITHMETIC_OPERATIONS([[[ptrdiff]]])
DEFINE_ARITHMETIC_OPERATIONS([[[wchar]]])
DEFINE_ARITHMETIC_OPERATIONS([[[wint]]])

/* ------------------------------------------------------------------ */

DEFINE_ARITHMETIC_OPERATIONS([[[flonumfl]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumdb]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumldb]]])

DEFINE_ARITHMETIC_OPERATIONS([[[flonumf32]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumf64]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumf128]]])

DEFINE_ARITHMETIC_OPERATIONS([[[flonumf32x]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumf64x]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumf128x]]])

DEFINE_ARITHMETIC_OPERATIONS([[[flonumd32]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumd64]]])
DEFINE_ARITHMETIC_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcfl]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcdb]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcldb]]])

DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf32]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf64]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf128]]])

DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf32x]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf64x]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcf128x]]])

DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcd32]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcd64]]])
DEFINE_ARITHMETIC_OPERATIONS_FLONUMC([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_BITWISE_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_BINARY_OPERATION($1,	bitwise_and)
DEFINE_BINARY_OPERATION($1,	bitwise_or)
DEFINE_BINARY_OPERATION($1,	bitwise_xor)
DEFINE_UNARY_OPERATION($1,	bitwise_not)
mmux_cc_types_inline_decl bool
mmux_$1_bitwise_shl_p (mmux_$1_t * rop, mmux_$1_t * op1, mmux_sint_t * op2)
{
  *rop = mmux_$1_bitwise_shl(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_$1_bitwise_shr_p (mmux_$1_t * rop, mmux_$1_t * op1, mmux_sint_t * op2)
{
  *rop = mmux_$1_bitwise_shr(*op1, *op2);
  return false;
}]]])]]])

/* ------------------------------------------------------------------ */

m4_divert(0)m4_dnl

mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_and_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_uintptr_t * op2)
{
  *rop = mmux_pointer_bitwise_and(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_or_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_uintptr_t * op2)
{
  *rop = mmux_pointer_bitwise_or(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_xor_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_uintptr_t * op2)
{
  *rop = mmux_pointer_bitwise_xor(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_not_p (mmux_pointer_t * rop, mmux_pointer_t * op1)
{
  *rop = mmux_pointer_bitwise_not(*op1);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_shl_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_sint_t * op2)
{
  *rop = mmux_pointer_bitwise_shl(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_pointer_bitwise_shr_p (mmux_pointer_t * rop, mmux_pointer_t * op1, mmux_sint_t * op2)
{
  *rop = mmux_pointer_bitwise_shr(*op1, *op2);
  return false;
}

/* ------------------------------------------------------------------ */

DEFINE_BITWISE_OPERATIONS([[[char]]])
DEFINE_BITWISE_OPERATIONS([[[schar]]])
DEFINE_BITWISE_OPERATIONS([[[uchar]]])
DEFINE_BITWISE_OPERATIONS([[[sshort]]])
DEFINE_BITWISE_OPERATIONS([[[ushort]]])
DEFINE_BITWISE_OPERATIONS([[[sint]]])
DEFINE_BITWISE_OPERATIONS([[[uint]]])
DEFINE_BITWISE_OPERATIONS([[[slong]]])
DEFINE_BITWISE_OPERATIONS([[[ulong]]])
DEFINE_BITWISE_OPERATIONS([[[sllong]]])
DEFINE_BITWISE_OPERATIONS([[[ullong]]])

DEFINE_BITWISE_OPERATIONS([[[sint8]]])
DEFINE_BITWISE_OPERATIONS([[[uint8]]])
DEFINE_BITWISE_OPERATIONS([[[sint16]]])
DEFINE_BITWISE_OPERATIONS([[[uint16]]])
DEFINE_BITWISE_OPERATIONS([[[sint32]]])
DEFINE_BITWISE_OPERATIONS([[[uint32]]])
DEFINE_BITWISE_OPERATIONS([[[sint64]]])
DEFINE_BITWISE_OPERATIONS([[[uint64]]])

DEFINE_BITWISE_OPERATIONS([[[byte]]])
DEFINE_BITWISE_OPERATIONS([[[octet]]])

DEFINE_BITWISE_OPERATIONS([[[ssize]]])
DEFINE_BITWISE_OPERATIONS([[[usize]]])
DEFINE_BITWISE_OPERATIONS([[[sintmax]]])
DEFINE_BITWISE_OPERATIONS([[[uintmax]]])
DEFINE_BITWISE_OPERATIONS([[[sintptr]]])
DEFINE_BITWISE_OPERATIONS([[[uintptr]]])
DEFINE_BITWISE_OPERATIONS([[[ptrdiff]]])
DEFINE_BITWISE_OPERATIONS([[[libc_mode]]])
DEFINE_BITWISE_OPERATIONS([[[off]]])
DEFINE_BITWISE_OPERATIONS([[[libc_pid]]])
DEFINE_BITWISE_OPERATIONS([[[libc_uid]]])
DEFINE_BITWISE_OPERATIONS([[[libc_gid]]])
DEFINE_BITWISE_OPERATIONS([[[wchar]]])
DEFINE_BITWISE_OPERATIONS([[[wint]]])
DEFINE_BITWISE_OPERATIONS([[[libc_time]]])
DEFINE_BITWISE_OPERATIONS([[[libc_socklen]]])
DEFINE_BITWISE_OPERATIONS([[[libc_rlim]]])
DEFINE_BITWISE_OPERATIONS([[[libc_ino]]])
DEFINE_BITWISE_OPERATIONS([[[libc_dev]]])
DEFINE_BITWISE_OPERATIONS([[[libc_nlink]]])
DEFINE_BITWISE_OPERATIONS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_POINTERS_API_H */

/* end of file */
