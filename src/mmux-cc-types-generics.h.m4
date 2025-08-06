/*
  Part of: MMUX CC Types
  Contents: public header file, generics definitions
  Date: Aug  5, 2025

  Abstract

	This a the  public header included by "mmux-cc-types.h".  It  defines uses of
	the "_Generic" keyword.

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

#ifndef MMUX_CC_TYPES_GENERICS_H
#define MMUX_CC_TYPES_GENERICS_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

/* The keywork "_Generic" does not support  compatible types in its association list;
   among the exact integers there are compatible types.

   We  support "sint8",  "uint8",  "sint16",  "uint16", "sint32",  "uint32","sint64",
   "uint64" and  assume that  "schar", "uchar",  "sshort", "ushort",  "sint", "uint",
   "slong", "ulong",  "sintmax", "uintmax",  "sintptr", "uintptr",  "ssize", "usize",
   "mode", "pid", "uid", "gid", "wchar", "wint", "off", "rlim", "socklen", "time" are
   compatible with them. */

m4_define([[[DEFINE_REAL_PREDICATE]]],[[[m4_dnl
#define mmux_ctype_is_$1(VALUE)							\
  _Generic((VALUE),								\
	   mmux_pointer_t:		mmux_pointer_is_$1,			\
	   mmux_char_t:			mmux_char_is_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_sllong_is_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_is_$1,			\
	   mmux_double_t:		mmux_double_is_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_is_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_is_$1,			\
	   mmux_uint8_t:		mmux_uint8_is_$1,			\
	   mmux_sint16_t:		mmux_sint16_is_$1,			\
	   mmux_uint16_t:		mmux_uint16_is_$1,			\
	   mmux_sint32_t:		mmux_sint32_is_$1,			\
	   mmux_uint32_t:		mmux_uint32_is_$1,			\
	   mmux_sint64_t:		mmux_sint64_is_$1,			\
	   mmux_uint64_t:		mmux_uint64_is_$1,			\
	   mmux_complexf_t:		mmux_complexf_is_$1,			\
	   mmux_complexd_t:		mmux_complexd_is_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_is_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_is_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE)
]]]) m4_dnl

DEFINE_REAL_PREDICATE([[[zero]]])
DEFINE_REAL_PREDICATE([[[positive]]])
DEFINE_REAL_PREDICATE([[[negative]]])
DEFINE_REAL_PREDICATE([[[non_positive]]])
DEFINE_REAL_PREDICATE([[[non_negative]]])
DEFINE_REAL_PREDICATE([[[infinite]]])
DEFINE_REAL_PREDICATE([[[nan]]])


/** --------------------------------------------------------------------
 ** Comparison.
 ** ----------------------------------------------------------------- */

/* The keywork "_Generic" does not support  compatible types in its association list;
   among the exact integers there are compatible types.

   We  support "sint8",  "uint8",  "sint16",  "uint16", "sint32",  "uint32","sint64",
   "uint64" and  assume that  "schar", "uchar",  "sshort", "ushort",  "sint", "uint",
   "slong", "ulong",  "sintmax", "uintmax",  "sintptr", "uintptr",  "ssize", "usize",
   "mode", "pid", "uid", "gid", "wchar", "wint", "off", "rlim", "socklen", "time" are
   compatible with them. */

m4_define([[[DEFINE_COMPARISON_FUNCTIONS]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE1),								\
           mmux_pointer_t:		mmux_pointer_$1,			\
	   mmux_char_t:			mmux_char_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,				\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_sllong_$1,				\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,				\
	   mmux_uint8_t:		mmux_uint8_$1,				\
	   mmux_sint16_t:		mmux_sint16_$1,				\
	   mmux_uint16_t:		mmux_uint16_$1,				\
	   mmux_sint32_t:		mmux_sint32_$1,				\
	   mmux_uint32_t:		mmux_uint32_$1,				\
	   mmux_sint64_t:		mmux_sint64_$1,				\
	   mmux_uint64_t:		mmux_uint64_$1,				\
	   mmux_complexf_t:		mmux_complexf_$1,			\
	   mmux_complexd_t:		mmux_complexd_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl

DEFINE_COMPARISON_FUNCTIONS([[[cmp]]])
DEFINE_COMPARISON_FUNCTIONS([[[equal]]])
DEFINE_COMPARISON_FUNCTIONS([[[greater]]])
DEFINE_COMPARISON_FUNCTIONS([[[lesser]]])
DEFINE_COMPARISON_FUNCTIONS([[[greater_equal]]])
DEFINE_COMPARISON_FUNCTIONS([[[lesser_equal]]])


/** --------------------------------------------------------------------
 ** Arithmetics.
 ** ----------------------------------------------------------------- */

/* The keywork "_Generic" does not support  compatible types in its association list;
   among the exact integers there are compatible types.

   We  support "sint8",  "uint8",  "sint16",  "uint16", "sint32",  "uint32","sint64",
   "uint64" and  assume that  "schar", "uchar",  "sshort", "ushort",  "sint", "uint",
   "slong", "ulong",  "sintmax", "uintmax",  "sintptr", "uintptr",  "ssize", "usize",
   "mode", "pid", "uid", "gid", "wchar", "wint", "off", "rlim", "socklen", "time" are
   compatible with them. */

m4_define([[[DEFINE_ARITHMETICS_UNARY]]],[[[m4_dnl
#define mmux_ctype_is_$1(VALUE)							\
  _Generic((VALUE),								\
	   mmux_pointer_t:		mmux_pointer_$1,			\
	   mmux_char_t:			mmux_char_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,				\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_sllong_$1,				\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,				\
	   mmux_uint8_t:		mmux_uint8_$1,				\
	   mmux_sint16_t:		mmux_sint16_$1,				\
	   mmux_uint16_t:		mmux_uint16_$1,				\
	   mmux_sint32_t:		mmux_sint32_$1,				\
	   mmux_uint32_t:		mmux_uint32_$1,				\
	   mmux_sint64_t:		mmux_sint64_$1,				\
	   mmux_uint64_t:		mmux_uint64_$1,				\
	   mmux_complexf_t:		mmux_complexf_$1,			\
	   mmux_complexd_t:		mmux_complexd_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE)
]]]) m4_dnl

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_ARITHMETICS_BINARY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE1),								\
           mmux_pointer_t:		mmux_pointer_$1,			\
	   mmux_char_t:			mmux_char_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,				\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_sllong_$1,				\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,				\
	   mmux_uint8_t:		mmux_uint8_$1,				\
	   mmux_sint16_t:		mmux_sint16_$1,				\
	   mmux_uint16_t:		mmux_uint16_$1,				\
	   mmux_sint32_t:		mmux_sint32_$1,				\
	   mmux_uint32_t:		mmux_uint32_$1,				\
	   mmux_sint64_t:		mmux_sint64_$1,				\
	   mmux_uint64_t:		mmux_uint64_$1,				\
	   mmux_complexf_t:		mmux_complexf_$1,			\
	   mmux_complexd_t:		mmux_complexd_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl

/* ------------------------------------------------------------------ */

DEFINE_ARITHMETICS_BINARY([[[add]]])
DEFINE_ARITHMETICS_BINARY([[[sub]]])
DEFINE_ARITHMETICS_BINARY([[[mul]]])
DEFINE_ARITHMETICS_BINARY([[[div]]])
DEFINE_ARITHMETICS_UNARY([[[neg]]])
DEFINE_ARITHMETICS_UNARY([[[inv]]])
DEFINE_ARITHMETICS_UNARY([[[abs]]])
DEFINE_ARITHMETICS_BINARY([[[mod]]])
DEFINE_ARITHMETICS_UNARY([[[incr]]])
DEFINE_ARITHMETICS_UNARY([[[decr]]])


/** --------------------------------------------------------------------
 ** Mathematics.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATHEMATICS_UNARY]]],[[[m4_dnl
#define mmux_ctype_is_$1(VALUE)							\
  _Generic((VALUE),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
	   mmux_complexf_t:		mmux_complexf_$1,			\
	   mmux_complexd_t:		mmux_complexd_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE)
]]]) m4_dnl

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_MATHEMATICS_REAL_UNARY]]],[[[m4_dnl
#define mmux_ctype_is_$1(VALUE)							\
  _Generic((VALUE),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE)
]]]) m4_dnl

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_MATHEMATICS_BINARY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE1),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
	   mmux_complexf_t:		mmux_complexf_$1,			\
	   mmux_complexd_t:		mmux_complexd_$1,			\
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_MATHEMATICS_REAL_BINARY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE1),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_MATHEMATICS_REAL_SINT_BINARY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE2),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_HAVE_CC_TYPE_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_HAVE_CC_TYPE_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl

/* ------------------------------------------------------------------ */

DEFINE_MATHEMATICS_UNARY([[[sin]]])
DEFINE_MATHEMATICS_UNARY([[[cos]]])
DEFINE_MATHEMATICS_UNARY([[[tan]]])
DEFINE_MATHEMATICS_UNARY([[[asin]]])
DEFINE_MATHEMATICS_UNARY([[[acos]]])
DEFINE_MATHEMATICS_UNARY([[[atan]]])
DEFINE_MATHEMATICS_REAL_BINARY([[[atan2]]])

DEFINE_MATHEMATICS_UNARY([[[sinh]]])
DEFINE_MATHEMATICS_UNARY([[[cosh]]])
DEFINE_MATHEMATICS_UNARY([[[tanh]]])
DEFINE_MATHEMATICS_UNARY([[[asinh]]])
DEFINE_MATHEMATICS_UNARY([[[acosh]]])
DEFINE_MATHEMATICS_UNARY([[[atanh]]])

DEFINE_MATHEMATICS_REAL_UNARY([[[exp]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[exp2]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[exp10]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[log]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[log2]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[log10]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[logb]]])

DEFINE_MATHEMATICS_REAL_UNARY([[[pow]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[sqrt]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[cbrt]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[expm1]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[log1p]]])
DEFINE_MATHEMATICS_REAL_BINARY([[[hypot]]])

DEFINE_MATHEMATICS_REAL_UNARY([[[erf]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[erfc]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[lgamma]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[tgamma]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[j0]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[j1]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[y0]]])
DEFINE_MATHEMATICS_REAL_UNARY([[[y1]]])

DEFINE_MATHEMATICS_REAL_SINT_BINARY([[[jn]]])
DEFINE_MATHEMATICS_REAL_SINT_BINARY([[[yn]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_TYPES_GENERICS_H */

/* end of file */
