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


/** --------------------------------------------------------------------
 ** Arithemtics.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_ARITHMETIC_UNARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_ARITHMETIC_BINARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t * op1, mmux_$1_t * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	add)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	sub)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	mul)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	div)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	inverse)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	modulo)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	remainder)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	incr)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	decr)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	neg)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	absolute)
]]])]]])

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS_FLONUMC]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	add)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	sub)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	mul)
DEFINE_ARITHMETIC_BINARY_OPERATION($1,	div)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	inverse)
DEFINE_ARITHMETIC_UNARY_OPERATION($1,	neg)

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
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_POINTERS_API_H */

/* end of file */
