/*
  Part of: MMUX CC Types
  Contents: public header file, pointers API
  Date: Sep 28, 2025

  Abstract

	This  a the  public  header included  by "mmux-cc-types.h";  it  must not  be
	included by itself.

  Copyright (C) 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

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
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t const * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_BINARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t const * op1, mmux_$1_t const * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_define([[[DEFINE_TERNARY_OPERATION]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_t * rop, mmux_$1_t const * op1, mmux_$1_t const * op2, mmux_$1_t const * op3)
{
  *rop = mmux_$1_$2(*op1, *op2, *op3);
  return false;
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_UNARY_OPERATION_SLONG]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_slong_t * rop, mmux_$1_t const * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_UNARY_OPERATION_SLLONG]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_sllong_t * rop, mmux_$1_t const * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_UNARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t const * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_BINARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t const * op1, mmux_$1_t const * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_define([[[DEFINE_TERNARY_PREDICATE]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (bool * rop, mmux_$1_t const * op1, mmux_$1_t const * op2, mmux_$1_t const * op3)
{
  *rop = mmux_$1_$2(*op1, *op2, *op3);
  return false;
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_SINT_COMPARISON]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_ternary_comparison_result_t * rop, mmux_$1_t const * op1, mmux_$1_t const * op2)
{
  *rop = mmux_$1_$2(*op1, *op2);
  return false;
}]]])

m4_divert(0)m4_dnl


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_PREDICATES]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_PREDICATE($1,	is_zero)
DEFINE_UNARY_PREDICATE($1,	is_positive)
DEFINE_UNARY_PREDICATE($1,	is_negative)
DEFINE_UNARY_PREDICATE($1,	is_non_positive)
DEFINE_UNARY_PREDICATE($1,	is_non_negative)
DEFINE_UNARY_PREDICATE($1,	is_infinite)
DEFINE_UNARY_PREDICATE($1,	is_finite)
DEFINE_UNARY_PREDICATE($1,	is_nan)
]]])]]])

m4_define([[[DEFINE_PREDICATES_FLONUM]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_PREDICATE($1,	is_subnormal)
DEFINE_UNARY_PREDICATE($1,	is_normal)
]]])]]])
m4_divert(0)m4_dnl

DEFINE_PREDICATES([[[pointer]]])
DEFINE_PREDICATES([[[ascii]]])
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
DEFINE_PREDICATES([[[time]]])
DEFINE_PREDICATES([[[clock]]])
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
 ** Comparison operations.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISON_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_SINT_COMPARISON($1,	cmp)
DEFINE_BINARY_PREDICATE($1,	equal)
DEFINE_BINARY_PREDICATE($1,	not_equal)
DEFINE_BINARY_PREDICATE($1,	greater)
DEFINE_BINARY_PREDICATE($1,	less)
DEFINE_BINARY_PREDICATE($1,	greater_equal)
DEFINE_BINARY_PREDICATE($1,	less_equal)
DEFINE_BINARY_OPERATION($1,	min)
DEFINE_BINARY_OPERATION($1,	max)
]]])]]])

m4_define([[[DEFINE_COMPARISON_OPERATIONS_FLONUM]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_TERNARY_PREDICATE($1,	equal_absmargin)
DEFINE_TERNARY_PREDICATE($1,	equal_relepsilon)
]]])]]])

m4_divert(0)m4_dnl

DEFINE_COMPARISON_OPERATIONS([[[pointer]]])
DEFINE_COMPARISON_OPERATIONS([[[ascii]]])
DEFINE_COMPARISON_OPERATIONS([[[char]]])
DEFINE_COMPARISON_OPERATIONS([[[schar]]])
DEFINE_COMPARISON_OPERATIONS([[[uchar]]])
DEFINE_COMPARISON_OPERATIONS([[[sshort]]])
DEFINE_COMPARISON_OPERATIONS([[[ushort]]])
DEFINE_COMPARISON_OPERATIONS([[[sint]]])
DEFINE_COMPARISON_OPERATIONS([[[uint]]])
DEFINE_COMPARISON_OPERATIONS([[[slong]]])
DEFINE_COMPARISON_OPERATIONS([[[ulong]]])
DEFINE_COMPARISON_OPERATIONS([[[sllong]]])
DEFINE_COMPARISON_OPERATIONS([[[ullong]]])

DEFINE_COMPARISON_OPERATIONS([[[sint8]]])
DEFINE_COMPARISON_OPERATIONS([[[uint8]]])
DEFINE_COMPARISON_OPERATIONS([[[sint16]]])
DEFINE_COMPARISON_OPERATIONS([[[uint16]]])
DEFINE_COMPARISON_OPERATIONS([[[sint32]]])
DEFINE_COMPARISON_OPERATIONS([[[uint32]]])
DEFINE_COMPARISON_OPERATIONS([[[sint64]]])
DEFINE_COMPARISON_OPERATIONS([[[uint64]]])

DEFINE_COMPARISON_OPERATIONS([[[byte]]])
DEFINE_COMPARISON_OPERATIONS([[[octet]]])

DEFINE_COMPARISON_OPERATIONS([[[ssize]]])
DEFINE_COMPARISON_OPERATIONS([[[usize]]])
DEFINE_COMPARISON_OPERATIONS([[[sintmax]]])
DEFINE_COMPARISON_OPERATIONS([[[uintmax]]])
DEFINE_COMPARISON_OPERATIONS([[[sintptr]]])
DEFINE_COMPARISON_OPERATIONS([[[uintptr]]])
DEFINE_COMPARISON_OPERATIONS([[[ptrdiff]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_mode]]])
DEFINE_COMPARISON_OPERATIONS([[[off]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_pid]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_uid]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_gid]]])
DEFINE_COMPARISON_OPERATIONS([[[wchar]]])
DEFINE_COMPARISON_OPERATIONS([[[wint]]])
DEFINE_COMPARISON_OPERATIONS([[[time]]])
DEFINE_COMPARISON_OPERATIONS([[[clock]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_socklen]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_rlim]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_ino]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_dev]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_nlink]]])
DEFINE_COMPARISON_OPERATIONS([[[libc_blkcnt]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_OPERATIONS([[[flonumfl]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumdb]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumldb]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumf32]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumf64]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumf128]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumf32x]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumf64x]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumf128x]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumd32]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumd64]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_OPERATIONS([[[flonumcfl]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcdb]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcldb]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumcf32]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcf64]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcf128]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumcf32x]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcf64x]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcf128x]]])

DEFINE_COMPARISON_OPERATIONS([[[flonumcd32]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcd64]]])
DEFINE_COMPARISON_OPERATIONS([[[flonumcd128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumfl]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumdb]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumldb]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf32]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf64]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf128]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf32x]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf64x]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumf128x]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumd32]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumd64]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcfl]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcdb]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcldb]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf32]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf64]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf128]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf32x]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf64x]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcf128x]]])

DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcd32]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcd64]]])
DEFINE_COMPARISON_OPERATIONS_FLONUM([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Rounding and splitting floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_ROUNDING_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_OPERATION($1,	ceil)
DEFINE_UNARY_OPERATION($1,	floor)
DEFINE_UNARY_OPERATION($1,	trunc)
DEFINE_UNARY_OPERATION($1,	rint)
DEFINE_UNARY_OPERATION($1,	nearbyint)
DEFINE_UNARY_OPERATION($1,	round)
DEFINE_UNARY_OPERATION($1,	roundeven)
]]])]]])

m4_define([[[DEFINE_ROUNDING_OPERATIONS_FLONUM]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_modf_p (mmux_$1_t * rop, mmux_$1_t const * op1, mmux_$1_t * op2)
{
  *rop = mmux_$1_modf(*op1, op2);
  return false;
}
DEFINE_UNARY_OPERATION_SLONG($1,	lrint)
DEFINE_UNARY_OPERATION_SLONG($1,	lround)
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[sllong]]],[[[m4_dnl
DEFINE_UNARY_OPERATION_SLLONG($1,	llrint)
DEFINE_UNARY_OPERATION_SLLONG($1,	llround)
]]])]]])]]])

m4_divert(0)m4_dnl

DEFINE_ROUNDING_OPERATIONS([[[flonumfl]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumdb]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumldb]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumf32]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumf64]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumf128]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumf32x]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumf64x]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumf128x]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumd32]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumd64]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_ROUNDING_OPERATIONS([[[flonumcfl]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcdb]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcldb]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumcf32]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcf64]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcf128]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumcf32x]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcf64x]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcf128x]]])

DEFINE_ROUNDING_OPERATIONS([[[flonumcd32]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcd64]]])
DEFINE_ROUNDING_OPERATIONS([[[flonumcd128]]])

/* ------------------------------------------------------------------ */

DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumfl]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumdb]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumldb]]])

DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf32]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf64]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf128]]])

DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf32x]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf64x]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumf128x]]])

DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumd32]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumd64]]])
DEFINE_ROUNDING_OPERATIONS_FLONUM([[[flonumd128]]])


/** --------------------------------------------------------------------
 ** Complex number operations.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_COMPLEX_NUMBER_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_OPERATION($1,	real_part)
DEFINE_UNARY_OPERATION($1,	imag_part)
DEFINE_UNARY_OPERATION($1,	argument)
DEFINE_UNARY_OPERATION($1,	conjugate)
]]])]]])

m4_define([[[DEFINE_UNARY_OPERATION_CPLX_TO_REAL]]],[[[mmux_cc_types_inline_decl bool
mmux_$1_$2_p (mmux_$1_part_t * rop, mmux_$1_t const * op1)
{
  *rop = mmux_$1_$2(*op1);
  return false;
}]]])

m4_define([[[DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_inline_no_retval_decl bool
mmux_$1_rectangular_p (mmux_$1_t * rop_p, mmux_$1_part_t * re_p, mmux_$1_part_t * im_p)
{
  *rop_p = mmux_$1_rectangular(*re_p, *im_p);
  return false;
}
DEFINE_UNARY_OPERATION_CPLX_TO_REAL($1,	real_part)
DEFINE_UNARY_OPERATION_CPLX_TO_REAL($1,	imag_part)
DEFINE_UNARY_OPERATION_CPLX_TO_REAL($1,	argument)
DEFINE_UNARY_OPERATION($1,	conjugate)
]]])]]])

m4_divert(0)m4_dnl

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ascii]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[char]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[schar]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uchar]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sshort]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ushort]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sint]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uint]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[slong]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ulong]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sllong]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ullong]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sint8]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uint8]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sint16]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uint16]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sint32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uint32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sint64]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uint64]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[byte]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[octet]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ssize]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[usize]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sintmax]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uintmax]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[sintptr]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[uintptr]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[off]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[ptrdiff]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[wchar]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[wint]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumfl]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumdb]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumldb]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf64]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf128]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf32x]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf64x]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumf128x]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumd32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumd64]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcfl]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcdb]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcldb]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf64]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf128]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf32x]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf64x]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcf128x]]])

DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcd32]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcd64]]])
DEFINE_COMPLEX_NUMBER_OPERATIONS_FLONUMC([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Arithemtics.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
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
DEFINE_UNARY_OPERATION($1,	sign)
]]])]]])

m4_define([[[DEFINE_ARITHMETIC_OPERATIONS_FLONUMC]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_BINARY_OPERATION($1,	add)
DEFINE_BINARY_OPERATION($1,	sub)
DEFINE_BINARY_OPERATION($1,	mul)
DEFINE_BINARY_OPERATION($1,	div)
DEFINE_UNARY_OPERATION($1,	inverse)
DEFINE_UNARY_OPERATION($1,	neg)

mmux_cc_types_inline_decl bool
mmux_$1_absolute_p (mmux_$1_part_t * rop, mmux_$1_t const * op1)
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

DEFINE_ARITHMETIC_OPERATIONS([[[ascii]]])
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
DEFINE_ARITHMETIC_OPERATIONS([[[time]]])
DEFINE_ARITHMETIC_OPERATIONS([[[clock]]])
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
 ** Mathematics.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_MATHEMATIC_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_UNARY_OPERATION($1,	sin)
DEFINE_UNARY_OPERATION($1,	cos)
DEFINE_UNARY_OPERATION($1,	tan)
DEFINE_UNARY_OPERATION($1,	asin)
DEFINE_UNARY_OPERATION($1,	acos)
DEFINE_UNARY_OPERATION($1,	atan)
DEFINE_UNARY_OPERATION($1,	sinh)
DEFINE_UNARY_OPERATION($1,	cosh)
DEFINE_UNARY_OPERATION($1,	tanh)
DEFINE_UNARY_OPERATION($1,	asinh)
DEFINE_UNARY_OPERATION($1,	acosh)
DEFINE_UNARY_OPERATION($1,	atanh)
DEFINE_UNARY_OPERATION($1,	exp)
DEFINE_UNARY_OPERATION($1,	exp2)
DEFINE_UNARY_OPERATION($1,	exp10)
DEFINE_UNARY_OPERATION($1,	log)
DEFINE_UNARY_OPERATION($1,	log2)
DEFINE_UNARY_OPERATION($1,	log10)
DEFINE_UNARY_OPERATION($1,	pow)
DEFINE_UNARY_OPERATION($1,	square)
DEFINE_UNARY_OPERATION($1,	cube)
DEFINE_UNARY_OPERATION($1,	sqrt)
DEFINE_UNARY_OPERATION($1,	cbrt)
]]])]]])

m4_define([[[DEFINE_MATHEMATIC_OPERATIONS_FLONUM]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
DEFINE_BINARY_OPERATION($1,	atan2)
DEFINE_BINARY_OPERATION($1,	hypot)
DEFINE_UNARY_OPERATION($1,	expm1)
DEFINE_UNARY_OPERATION($1,	logb)
DEFINE_UNARY_OPERATION($1,	log1p)
DEFINE_UNARY_OPERATION($1,	erf)
DEFINE_UNARY_OPERATION($1,	erfc)
DEFINE_UNARY_OPERATION($1,	lgamma)
DEFINE_UNARY_OPERATION($1,	tgamma)
DEFINE_UNARY_OPERATION($1,	j0)
DEFINE_UNARY_OPERATION($1,	j1)
DEFINE_UNARY_OPERATION($1,	y0)
DEFINE_UNARY_OPERATION($1,	y1)
mmux_cc_types_inline_decl bool
mmux_$1_jn_p (mmux_$1_t * rop, mmux_sint_t const * N, mmux_$1_t const * op)
{
  *rop = mmux_$1_jn(*N, *op);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_$1_yn_p (mmux_$1_t * rop, mmux_sint_t const * N, mmux_$1_t const * op)
{
  *rop = mmux_$1_yn(*N, *op);
  return false;
}]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_MATHEMATIC_OPERATIONS([[[flonumfl]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumdb]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumldb]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumf32]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumf64]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumf128]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumf32x]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumf64x]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumf128x]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumd32]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumd64]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumfl]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumdb]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumldb]]])

DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf32]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf64]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf128]]])

DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf32x]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf64x]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumf128x]]])

DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumd32]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumd64]]])
DEFINE_MATHEMATIC_OPERATIONS_FLONUM([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_MATHEMATIC_OPERATIONS([[[flonumcfl]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcdb]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcldb]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf32]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf64]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf128]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf32x]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf64x]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcf128x]]])

DEFINE_MATHEMATIC_OPERATIONS([[[flonumcd32]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcd64]]])
DEFINE_MATHEMATIC_OPERATIONS([[[flonumcd128]]])


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
mmux_$1_bitwise_shl_p (mmux_$1_t * rop, mmux_$1_t const * op1, mmux_sint_t * op2)
{
  *rop = mmux_$1_bitwise_shl(*op1, *op2);
  return false;
}
mmux_cc_types_inline_decl bool
mmux_$1_bitwise_shr_p (mmux_$1_t * rop, mmux_$1_t const * op1, mmux_sint_t * op2)
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

DEFINE_BITWISE_OPERATIONS([[[ascii]]])
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
DEFINE_BITWISE_OPERATIONS([[[time]]])
DEFINE_BITWISE_OPERATIONS([[[clock]]])
DEFINE_BITWISE_OPERATIONS([[[libc_socklen]]])
DEFINE_BITWISE_OPERATIONS([[[libc_rlim]]])
DEFINE_BITWISE_OPERATIONS([[[libc_ino]]])
DEFINE_BITWISE_OPERATIONS([[[libc_dev]]])
DEFINE_BITWISE_OPERATIONS([[[libc_nlink]]])
DEFINE_BITWISE_OPERATIONS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Printing and string representation.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_STRINGREP_OPERATIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_sprint_p (mmux_asciizp_t bufptr, mmux_usize_t buflen, mmux_$1_t const * value_ptr)
{
  return mmux_$1_sprint(bufptr, buflen, *value_ptr);
}
mmux_cc_types_inline_decl bool
mmux_$1_sprint_size_p (mmux_usize_t * required_nbytes_ptr, mmux_$1_t const * value_ptr)
{
  return mmux_$1_sprint_size(required_nbytes_ptr, *value_ptr);
}
mmux_cc_types_inline_decl bool
mmux_$1_dprintf_p (mmux_standard_sint_t fd, mmux_$1_t const * value_ptr)
{
  return mmux_$1_dprintf(fd, *value_ptr);
}
mmux_cc_types_inline_decl bool
mmux_$1_fprintf_p (mmux_pointer_t stream, mmux_$1_t const * value_ptr)
{
  return mmux_$1_fprintf(stream, *value_ptr);
}]]])]]])

m4_define([[[DEFINE_STRINGREP_OPERATIONS_INTEGER]]],[[[m4_dnl
DEFINE_STRINGREP_OPERATIONS([[[$1]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_inline_decl bool
mmux_$1_sprint_with_base_p (mmux_asciizp_t bufptr, mmux_usize_t * buflen_ptr, bool * is_negative_ptr,
			    mmux_$1_t const * value_ptr, mmux_uint_t const base)
{
  return mmux_$1_sprint_with_base(bufptr, buflen_ptr, is_negative_ptr, *value_ptr, base);
}
mmux_cc_types_inline_decl bool
mmux_$1_dprintf_with_base_p (int fd, mmux_$1_t const * value_ptr, mmux_uint_t const base)
{
  return mmux_$1_dprintf_with_base(fd, *value_ptr, base);
}]]])]]])

m4_divert(0)m4_dnl

DEFINE_STRINGREP_OPERATIONS_INTEGER([[[pointer]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ascii]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[char]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[schar]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uchar]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sshort]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ushort]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sint]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uint]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[slong]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ulong]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sllong]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ullong]]])

DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sint8]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uint8]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sint16]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uint16]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sint32]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uint32]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sint64]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uint64]]])

DEFINE_STRINGREP_OPERATIONS_INTEGER([[[byte]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[octet]]])

DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ssize]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[usize]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sintmax]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uintmax]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[sintptr]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[uintptr]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[ptrdiff]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_mode]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[off]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_pid]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_uid]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_gid]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[wchar]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[wint]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[time]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[clock]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_socklen]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_rlim]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_ino]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_dev]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_nlink]]])
DEFINE_STRINGREP_OPERATIONS_INTEGER([[[libc_blkcnt]]])

/* ------------------------------------------------------------------ */

DEFINE_STRINGREP_OPERATIONS([[[flonumfl]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumdb]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumldb]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumf32]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumf64]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumf128]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumf32x]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumf64x]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumf128x]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumd32]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumd64]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumd128]]])

/* ------------------------------------------------------------------ */

DEFINE_STRINGREP_OPERATIONS([[[flonumcfl]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcdb]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcldb]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumcf32]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcf64]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcf128]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumcf32x]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcf64x]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcf128x]]])

DEFINE_STRINGREP_OPERATIONS([[[flonumcd32]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcd64]]])
DEFINE_STRINGREP_OPERATIONS([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Printing and string representation: generic macros.
 ** ----------------------------------------------------------------- */

/* FIXME This does not work with pointers to subtypes because GCC's implementation of
   "_Generic" is not integrated with "-fplan9-extensions".  There is nothing I can do
   about it.  (Marco Maggi; Jan 3, 2026) */
#define mmux_ctype_sprint_p(BUFPTR,BUFLEN,VALUE_P) \
  (_Generic((VALUE_P),								\
	   mmux_ascii_t *:		mmux_ascii_sprint_p,			\
	   mmux_char_t *:		mmux_char_sprint_p,			\
           mmux_schar_t *:		mmux_schar_sprint_p,			\
           mmux_uchar_t *:		mmux_uchar_sprint_p,			\
           mmux_sshort_t *:		mmux_sshort_sprint_p,			\
           mmux_ushort_t *:		mmux_ushort_sprint_p,			\
           mmux_sint_t *:		mmux_sint_sprint_p,			\
           mmux_uint_t *:		mmux_uint_sprint_p,			\
           mmux_slong_t *:		mmux_slong_sprint_p,			\
           mmux_ulong_t *:		mmux_ulong_sprint_p,			\
	   mmux_sllong_t *:		mmux_sllong_sprint_p,			\
	   mmux_ullong_t *:		mmux_ullong_sprint_p,			\
	   mmux_flonumfl_t *:		mmux_flonumfl_sprint_p,			\
	   mmux_flonumdb_t *:		mmux_flonumdb_sprint_p,			\
	   mmux_flonumldb_t *:		mmux_flonumldb_sprint_p,		\
	   mmux_flonumf32_t *:		mmux_flonumf32_sprint_p,		\
	   mmux_flonumf64_t *:		mmux_flonumf64_sprint_p,		\
	   mmux_flonumf128_t *:		mmux_flonumf128_sprint_p,		\
	   mmux_flonumf32x_t *:		mmux_flonumf32x_sprint_p,		\
	   mmux_flonumf64x_t *:		mmux_flonumf64x_sprint_p,		\
	   mmux_flonumd32_t *:		mmux_flonumd32_sprint_p,		\
	   mmux_flonumd64_t *:		mmux_flonumd64_sprint_p,		\
	   mmux_flonumd128_t *:		mmux_flonumd128_sprint_p,		\
	   mmux_sint8_t *:		mmux_sint8_sprint_p,			\
	   mmux_uint8_t *:		mmux_uint8_sprint_p,			\
	   mmux_sint16_t *:		mmux_sint16_sprint_p,			\
	   mmux_uint16_t *:		mmux_uint16_sprint_p,			\
	   mmux_sint32_t *:		mmux_sint32_sprint_p,			\
	   mmux_uint32_t *:		mmux_uint32_sprint_p,			\
	   mmux_sint64_t *:		mmux_sint64_sprint_p,			\
	   mmux_uint64_t *:		mmux_uint64_sprint_p,			\
	   mmux_byte_t *:		mmux_byte_sprint_p,			\
	   mmux_octet_t *:		mmux_octet_sprint_p,			\
           mmux_ssize_t *:		mmux_ssize_sprint_p,			\
           mmux_usize_t *:		mmux_usize_sprint_p,			\
           mmux_sintmax_t *:		mmux_sintmax_sprint_p,			\
           mmux_uintmax_t *:		mmux_uintmax_sprint_p,			\
           mmux_sintptr_t *:		mmux_sintptr_sprint_p,			\
           mmux_uintptr_t *:		mmux_uintptr_sprint_p,			\
           mmux_libc_mode_t *:		mmux_libc_mode_sprint_p,		\
           mmux_off_t *:		mmux_off_sprint_p,			\
           mmux_libc_pid_t *:		mmux_libc_pid_sprint_p,			\
           mmux_libc_uid_t *:		mmux_libc_uid_sprint_p,			\
           mmux_libc_gid_t *:		mmux_libc_gid_sprint_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_sprint_p,			\
           mmux_wchar_t *:		mmux_wchar_sprint_p,			\
           mmux_wint_t *:		mmux_wint_sprint_p,			\
           mmux_time_t *:		mmux_time_sprint_p,			\
           mmux_clock_t *:		mmux_clock_sprint_p,			\
           mmux_libc_socklen_t *:	mmux_libc_socklen_sprint_p,		\
           mmux_libc_rlim_t *:		mmux_libc_rlim_sprint_p,		\
           mmux_libc_ino_t *:		mmux_libc_ino_sprint_p,			\
           mmux_libc_dev_t *:		mmux_libc_dev_sprint_p,			\
           mmux_libc_nlink_t *:		mmux_libc_nlink_sprint_p,		\
           mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_sprint_p,		\
	   mmux_flonumcfl_t *:		mmux_flonumcfl_sprint_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_sprint_p,		\
	   mmux_flonumcldb_t *:		mmux_flonumcldb_sprint_p,		\
	   mmux_flonumcf32_t *:		mmux_flonumcf32_sprint_p,		\
	   mmux_flonumcf64_t *:		mmux_flonumcf64_sprint_p,		\
	   mmux_flonumcf128_t *:	mmux_flonumcf128_sprint_p,		\
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_sprint_p,		\
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_sprint_p,		\
	   mmux_flonumcd32_t *:		mmux_flonumcd32_sprint_p,		\
	   mmux_flonumcd64_t *:		mmux_flonumcd64_sprint_p,		\
	   mmux_flonumcd128_t *:	mmux_flonumcd128_sprint_p,		\
	   mmux_pointer_t *:		mmux_pointer_sprint_p)(BUFPTR,BUFLEN,VALUE_P))

/* ------------------------------------------------------------------ */

/* FIXME This does not work with pointers to subtypes because GCC's implementation of
   "_Generic" is not integrated with "-fplan9-extensions".  There is nothing I can do
   about it.  (Marco Maggi; Jan 3, 2026) */
#define mmux_ctype_sprint_size_p(REQUIRED_NBYTES_RESULT_P,VALUE_P)		\
  (_Generic((VALUE_P),								\
	    mmux_ascii_t *:		mmux_ascii_sprint_size_p,		\
	    mmux_char_t *:		mmux_char_sprint_size_p,		\
	    mmux_schar_t *:		mmux_schar_sprint_size_p,		\
	    mmux_uchar_t *:		mmux_uchar_sprint_size_p,		\
	    mmux_sshort_t *:		mmux_sshort_sprint_size_p,		\
	    mmux_ushort_t *:		mmux_ushort_sprint_size_p,		\
	    mmux_sint_t *:		mmux_sint_sprint_size_p,		\
	    mmux_uint_t *:		mmux_uint_sprint_size_p,		\
	    mmux_slong_t *:		mmux_slong_sprint_size_p,		\
	    mmux_ulong_t *:		mmux_ulong_sprint_size_p,		\
	    mmux_sllong_t *:		mmux_sllong_sprint_size_p,		\
	    mmux_ullong_t *:		mmux_ullong_sprint_size_p,		\
	    mmux_flonumfl_t *:		mmux_flonumfl_sprint_size_p,		\
	    mmux_flonumdb_t *:		mmux_flonumdb_sprint_size_p,		\
	    mmux_flonumldb_t *:		mmux_flonumldb_sprint_size_p,		\
	    mmux_flonumf32_t *:		mmux_flonumf32_sprint_size_p,		\
	    mmux_flonumf64_t *:		mmux_flonumf64_sprint_size_p,		\
	    mmux_flonumf128_t *:	mmux_flonumf128_sprint_size_p,		\
	    mmux_flonumf32x_t *:	mmux_flonumf32x_sprint_size_p,		\
	    mmux_flonumf64x_t *:	mmux_flonumf64x_sprint_size_p,		\
	    mmux_flonumd32_t *:		mmux_flonumd32_sprint_size_p,		\
	    mmux_flonumd64_t *:		mmux_flonumd64_sprint_size_p,		\
	    mmux_flonumd128_t *:	mmux_flonumd128_sprint_size_p,		\
	    mmux_sint8_t *:		mmux_sint8_sprint_size_p,		\
	    mmux_uint8_t *:		mmux_uint8_sprint_size_p,		\
	    mmux_sint16_t *:		mmux_sint16_sprint_size_p,		\
	    mmux_uint16_t *:		mmux_uint16_sprint_size_p,		\
	    mmux_sint32_t *:		mmux_sint32_sprint_size_p,		\
	    mmux_uint32_t *:		mmux_uint32_sprint_size_p,		\
	    mmux_sint64_t *:		mmux_sint64_sprint_size_p,		\
	    mmux_uint64_t *:		mmux_uint64_sprint_size_p,		\
	    mmux_byte_t *:		mmux_byte_sprint_size_p,		\
	    mmux_octet_t *:		mmux_octet_sprint_size_p,		\
	    mmux_ssize_t *:		mmux_ssize_sprint_size_p,		\
	    mmux_usize_t *:		mmux_usize_sprint_size_p,		\
	    mmux_sintmax_t *:		mmux_sintmax_sprint_size_p,		\
	    mmux_uintmax_t *:		mmux_uintmax_sprint_size_p,		\
	    mmux_sintptr_t *:		mmux_sintptr_sprint_size_p,		\
	    mmux_uintptr_t *:		mmux_uintptr_sprint_size_p,		\
	    mmux_libc_mode_t *:		mmux_libc_mode_sprint_size_p,		\
	    mmux_off_t *:		mmux_off_sprint_size_p,			\
	    mmux_libc_pid_t *:		mmux_libc_pid_sprint_size_p,		\
	    mmux_libc_uid_t *:		mmux_libc_uid_sprint_size_p,		\
	    mmux_libc_gid_t *:		mmux_libc_gid_sprint_size_p,		\
	    mmux_ptrdiff_t *:		mmux_ptrdiff_sprint_size_p,		\
	    mmux_wchar_t *:		mmux_wchar_sprint_size_p,		\
	    mmux_wint_t *:		mmux_wint_sprint_size_p,		\
	    mmux_time_t *:		mmux_time_sprint_size_p,		\
	    mmux_clock_t *:		mmux_clock_sprint_size_p,		\
	    mmux_libc_socklen_t *:	mmux_libc_socklen_sprint_size_p,	\
	    mmux_libc_rlim_t *:		mmux_libc_rlim_sprint_size_p,		\
	    mmux_libc_ino_t *:		mmux_libc_ino_sprint_size_p,		\
	    mmux_libc_dev_t *:		mmux_libc_dev_sprint_size_p,		\
	    mmux_libc_nlink_t *:	mmux_libc_nlink_sprint_size_p,		\
	    mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_sprint_size_p,		\
	    mmux_flonumcfl_t *:		mmux_flonumcfl_sprint_size_p,		\
	    mmux_flonumcdb_t *:		mmux_flonumcdb_sprint_size_p,		\
	    mmux_flonumcldb_t *:	mmux_flonumcldb_sprint_size_p,		\
	    mmux_flonumcf32_t *:	mmux_flonumcf32_sprint_size_p,		\
	    mmux_flonumcf64_t *:	mmux_flonumcf64_sprint_size_p,		\
	    mmux_flonumcf128_t *:	mmux_flonumcf128_sprint_size_p,		\
	    mmux_flonumcf32x_t *:	mmux_flonumcf32x_sprint_size_p,		\
	    mmux_flonumcf64x_t *:	mmux_flonumcf64x_sprint_size_p,		\
	    mmux_flonumcd32_t *:	mmux_flonumcd32_sprint_size_p,		\
	    mmux_flonumcd64_t *:	mmux_flonumcd64_sprint_size_p,		\
	    mmux_flonumcd128_t *:	mmux_flonumcd128_sprint_size_p,		\
	    mmux_pointer_t *:		mmux_pointer_sprint_size_p)((REQUIRED_NBYTES_RESULT_P),(VALUE_P)))

/* ------------------------------------------------------------------ */

/* FIXME This does not work with pointers to subtypes because GCC's implementation of
   "_Generic" is not integrated with "-fplan9-extensions".  There is nothing I can do
   about it.  (Marco Maggi; Jan 3, 2026) */
#define mmux_ctype_sprint_with_base_p(BUFPTR,BUFLEN_P,IS_NEGATIVE_P,VALUE_P,BASE)	\
  (_Generic((VALUE_P),									\
	    mmux_ascii_t *:		mmux_ascii_sprint_with_base_p,			\
	    mmux_char_t *:		mmux_char_sprint_with_base_p,			\
	    mmux_schar_t *:		mmux_schar_sprint_with_base_p,			\
	    mmux_uchar_t *:		mmux_uchar_sprint_with_base_p,			\
	    mmux_sshort_t *:		mmux_sshort_sprint_with_base_p,			\
	    mmux_ushort_t *:		mmux_ushort_sprint_with_base_p,			\
	    mmux_sint_t *:		mmux_sint_sprint_with_base_p,			\
	    mmux_uint_t *:		mmux_uint_sprint_with_base_p,			\
	    mmux_slong_t *:		mmux_slong_sprint_with_base_p,			\
	    mmux_ulong_t *:		mmux_ulong_sprint_with_base_p,			\
	    mmux_sllong_t *:		mmux_sllong_sprint_with_base_p,			\
	    mmux_ullong_t *:		mmux_ullong_sprint_with_base_p,			\
	    mmux_sint8_t *:		mmux_sint8_sprint_with_base_p,			\
	    mmux_uint8_t *:		mmux_uint8_sprint_with_base_p,			\
	    mmux_sint16_t *:		mmux_sint16_sprint_with_base_p,			\
	    mmux_uint16_t *:		mmux_uint16_sprint_with_base_p,			\
	    mmux_sint32_t *:		mmux_sint32_sprint_with_base_p,			\
	    mmux_uint32_t *:		mmux_uint32_sprint_with_base_p,			\
	    mmux_sint64_t *:		mmux_sint64_sprint_with_base_p,			\
	    mmux_uint64_t *:		mmux_uint64_sprint_with_base_p,			\
	    mmux_byte_t *:		mmux_byte_sprint_with_base_p,			\
	    mmux_octet_t *:		mmux_octet_sprint_with_base_p,			\
	    mmux_ssize_t *:		mmux_ssize_sprint_with_base_p,			\
	    mmux_usize_t *:		mmux_usize_sprint_with_base_p,			\
	    mmux_sintmax_t *:		mmux_sintmax_sprint_with_base_p,		\
	    mmux_uintmax_t *:		mmux_uintmax_sprint_with_base_p,		\
	    mmux_sintptr_t *:		mmux_sintptr_sprint_with_base_p,		\
	    mmux_uintptr_t *:		mmux_uintptr_sprint_with_base_p,		\
	    mmux_off_t *:		mmux_off_sprint_with_base_p,			\
	    mmux_ptrdiff_t *:		mmux_ptrdiff_sprint_with_base_p,		\
	    mmux_wchar_t *:		mmux_wchar_sprint_with_base_p,			\
	    mmux_wint_t *:		mmux_wint_sprint_with_base_p,			\
	    mmux_time_t *:		mmux_time_sprint_with_base_p,			\
	    mmux_clock_t *:		mmux_clock_sprint_with_base_p,			\
	    mmux_libc_mode_t *:		mmux_libc_mode_sprint_with_base_p,		\
	    mmux_libc_pid_t *:		mmux_libc_pid_sprint_with_base_p,		\
	    mmux_libc_uid_t *:		mmux_libc_uid_sprint_with_base_p,		\
	    mmux_libc_gid_t *:		mmux_libc_gid_sprint_with_base_p,		\
	    mmux_libc_socklen_t *:	mmux_libc_socklen_sprint_with_base_p,		\
	    mmux_libc_rlim_t *:		mmux_libc_rlim_sprint_with_base_p,		\
	    mmux_libc_ino_t *:		mmux_libc_ino_sprint_with_base_p,		\
	    mmux_libc_dev_t *:		mmux_libc_dev_sprint_with_base_p,		\
	    mmux_libc_nlink_t *:	mmux_libc_nlink_sprint_with_base_p,		\
	    mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_sprint_with_base_p,		\
	    mmux_pointer_t *:		mmux_pointer_sprint_with_base_p)((BUFPTR),(BUFLEN_P),(IS_NEGATIVE_P),(VALUE_P),(BASE)))

/* ------------------------------------------------------------------ */

/* FIXME This does not work with pointers to subtypes because GCC's implementation of
   "_Generic" is not integrated with "-fplan9-extensions".  There is nothing I can do
   about it.  (Marco Maggi; Jan 3, 2026) */
#define mmux_ctype_dprintf_with_base_p(FD,VALUE_P,BASE)					\
  (_Generic((VALUE_P),									\
	    mmux_ascii_t *:		mmux_ascii_dprintf_with_base_p,			\
	    mmux_char_t *:		mmux_char_dprintf_with_base_p,			\
	    mmux_schar_t *:		mmux_schar_dprintf_with_base_p,			\
	    mmux_uchar_t *:		mmux_uchar_dprintf_with_base_p,			\
	    mmux_sshort_t *:		mmux_sshort_dprintf_with_base_p,		\
	    mmux_ushort_t *:		mmux_ushort_dprintf_with_base_p,		\
	    mmux_sint_t *:		mmux_sint_dprintf_with_base_p,			\
	    mmux_uint_t *:		mmux_uint_dprintf_with_base_p,			\
	    mmux_slong_t *:		mmux_slong_dprintf_with_base_p,			\
	    mmux_ulong_t *:		mmux_ulong_dprintf_with_base_p,			\
	    mmux_sllong_t *:		mmux_sllong_dprintf_with_base_p,		\
	    mmux_ullong_t *:		mmux_ullong_dprintf_with_base_p,		\
	    mmux_sint8_t *:		mmux_sint8_dprintf_with_base_p,			\
	    mmux_uint8_t *:		mmux_uint8_dprintf_with_base_p,			\
	    mmux_sint16_t *:		mmux_sint16_dprintf_with_base_p,		\
	    mmux_uint16_t *:		mmux_uint16_dprintf_with_base_p,		\
	    mmux_sint32_t *:		mmux_sint32_dprintf_with_base_p,		\
	    mmux_uint32_t *:		mmux_uint32_dprintf_with_base_p,		\
	    mmux_sint64_t *:		mmux_sint64_dprintf_with_base_p,		\
	    mmux_uint64_t *:		mmux_uint64_dprintf_with_base_p,		\
	    mmux_byte_t *:		mmux_byte_dprintf_with_base_p,			\
	    mmux_octet_t *:		mmux_octet_dprintf_with_base_p,			\
	    mmux_ssize_t *:		mmux_ssize_dprintf_with_base_p,			\
	    mmux_usize_t *:		mmux_usize_dprintf_with_base_p,			\
	    mmux_sintmax_t *:		mmux_sintmax_dprintf_with_base_p,		\
	    mmux_uintmax_t *:		mmux_uintmax_dprintf_with_base_p,		\
	    mmux_sintptr_t *:		mmux_sintptr_dprintf_with_base_p,		\
	    mmux_uintptr_t *:		mmux_uintptr_dprintf_with_base_p,		\
	    mmux_off_t *:		mmux_off_dprintf_with_base_p,			\
	    mmux_ptrdiff_t *:		mmux_ptrdiff_dprintf_with_base_p,		\
	    mmux_wchar_t *:		mmux_wchar_dprintf_with_base_p,			\
	    mmux_wint_t *:		mmux_wint_dprintf_with_base_p,			\
	    mmux_time_t *:		mmux_time_dprintf_with_base_p,			\
	    mmux_clock_t *:		mmux_clock_dprintf_with_base_p,			\
	    mmux_libc_mode_t *:		mmux_libc_mode_dprintf_with_base_p,		\
	    mmux_libc_pid_t *:		mmux_libc_pid_dprintf_with_base_p,		\
	    mmux_libc_uid_t *:		mmux_libc_uid_dprintf_with_base_p,		\
	    mmux_libc_gid_t *:		mmux_libc_gid_dprintf_with_base_p,		\
	    mmux_libc_socklen_t *:	mmux_libc_socklen_dprintf_with_base_p,		\
	    mmux_libc_rlim_t *:		mmux_libc_rlim_dprintf_with_base_p,		\
	    mmux_libc_ino_t *:		mmux_libc_ino_dprintf_with_base_p,		\
	    mmux_libc_dev_t *:		mmux_libc_dev_dprintf_with_base_p,		\
	    mmux_libc_nlink_t *:	mmux_libc_nlink_dprintf_with_base_p,		\
	    mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_dprintf_with_base_p,		\
	    mmux_pointer_t *:		mmux_pointer_dprintf_with_base_p)((FD),(VALUE_P),(BASE)))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_POINTERS_API_H */

/* end of file */
