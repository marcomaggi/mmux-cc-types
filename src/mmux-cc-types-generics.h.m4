/*
  Part of: MMUX CC Types
  Contents: public header file, generics definitions
  Date: Aug  5, 2025

  Abstract

	This  a the  public  header included  by "mmux-cc-types.h";  it  must not  be
	included by itself.  It defines uses of the "_Generic" keyword.

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
 ** Macros: binary function no pointer.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_NO_POINTER]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function no pointer.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_NO_POINTER]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function with pointer.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
           mmux_pointer_t:		mmux_pointer_$1,		\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function with pointer.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_pointer_t:		mmux_pointer_$1,		\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary printing function, dispatches on second argument.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_PRINTING_FUNCTION]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE2),							\
           mmux_pointer_t:		mmux_pointer_$1,		\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function exact real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function exact real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function inexact real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function inexact complex numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact complex numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: ternary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
  (_Generic((VALUE1),							\
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_float_t:		mmux_float_$1,			\
	   mmux_double_t:		mmux_double_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,		\
]]])m4_dnl
	   mmux_complexf_t:		mmux_complexf_$1,		\
	   mmux_complexd_t:		mmux_complexd_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function sint and inexact real numbers only.
 ** ----------------------------------------------------------------- */

m4_dnl This is for functions like "jn" and "yn" which take a sint as first
m4_dnl argument and an inexact real number as second argument.

m4_define([[[DEFINE_BINARY_FUNCTION_SINT_AND_INEXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)						\
  _Generic((VALUE2),								\
	   mmux_float_t:		mmux_float_$1,				\
	   mmux_double_t:		mmux_double_$1,				\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_$1,			\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function exact real numbers only and sint.
 ** ----------------------------------------------------------------- */

m4_dnl This is for functions like "shl" and "shr" which take a sint as second
m4_dnl argument and an exact real number as first argument.

m4_define([[[DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY_AND_SINT]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  _Generic((VALUE1),							\
	   mmux_pointer_t:		mmux_pointer_$1,		\
	   mmux_char_t:			mmux_char_$1,			\
           mmux_schar_t:		mmux_schar_$1,			\
           mmux_uchar_t:		mmux_uchar_$1,			\
           mmux_sshort_t:		mmux_sshort_$1,			\
           mmux_ushort_t:		mmux_ushort_$1,			\
           mmux_sint_t:			mmux_sint_$1,			\
           mmux_uint_t:			mmux_uint_$1,			\
           mmux_slong_t:		mmux_slong_$1,			\
           mmux_ulong_t:		mmux_ulong_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_$1,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_mode_t:			mmux_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_pid_t:			mmux_pid_$1,			\
           mmux_uid_t:			mmux_uid_$1,			\
           mmux_gid_t:			mmux_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_socklen_t:		mmux_socklen_$1,		\
           mmux_rlim_t:			mmux_rlim_$1,			\
           default:			mmux_ctype_generic_error)(VALUE1,VALUE2)
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Complex numbers.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY([[[make_rectangular]]])
DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY([[[real_part]]])
DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY([[[imag_part]]])
DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY([[[arg]]])
DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY([[[conj]]])


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_FUNCTION([[[is_zero]]])
DEFINE_UNARY_FUNCTION([[[is_positive]]])
DEFINE_UNARY_FUNCTION([[[is_negative]]])
DEFINE_UNARY_FUNCTION([[[is_non_positive]]])
DEFINE_UNARY_FUNCTION([[[is_non_negative]]])
DEFINE_UNARY_FUNCTION([[[is_infinite]]])
DEFINE_UNARY_FUNCTION([[[is_nan]]])


/** --------------------------------------------------------------------
 ** Comparison.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_FUNCTION([[[cmp]]])
DEFINE_BINARY_FUNCTION([[[equal]]])
DEFINE_BINARY_FUNCTION([[[greater]]])
DEFINE_BINARY_FUNCTION([[[lesser]]])
DEFINE_BINARY_FUNCTION([[[greater_equal]]])
DEFINE_BINARY_FUNCTION([[[lesser_equal]]])

DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[equal_absmargin]]])
DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[equal_relepsilon]]])


/** --------------------------------------------------------------------
 ** Arithmetics.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_FUNCTION([[[add]]])
DEFINE_BINARY_FUNCTION([[[sub]]])
DEFINE_BINARY_FUNCTION_NO_POINTER([[[mul]]])
DEFINE_BINARY_FUNCTION_NO_POINTER([[[div]]])
DEFINE_UNARY_FUNCTION_NO_POINTER([[[inv]]])
DEFINE_UNARY_FUNCTION_NO_POINTER([[[abs]]])

DEFINE_BINARY_FUNCTION_REAL_NUMBERS_ONLY([[[mod]]])
DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY([[[incr]]])
DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY([[[decr]]])

/* No unsigned types for this! */
#define mmux_ctype_neg(VALUE)						\
  (_Generic((VALUE),							\
           mmux_char_t:			mmux_char_neg,			\
           mmux_schar_t:		mmux_schar_neg,			\
           mmux_sshort_t:		mmux_sshort_neg,		\
           mmux_sint_t:			mmux_sint_neg,			\
           mmux_slong_t:		mmux_slong_neg,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_neg,		\
]]])m4_dnl
	   mmux_float_t:		mmux_float_neg,			\
	   mmux_double_t:		mmux_double_neg,		\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_neg,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_neg,			\
	   mmux_sint16_t:		mmux_sint16_neg,		\
	   mmux_sint32_t:		mmux_sint32_neg,		\
	   mmux_sint64_t:		mmux_sint64_neg,		\
           mmux_ssize_t:		mmux_ssize_neg,			\
           mmux_sintmax_t:		mmux_sintmax_neg,		\
           mmux_sintptr_t:		mmux_sintptr_neg,		\
           mmux_off_t:			mmux_off_neg,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_neg,		\
           mmux_wint_t:			mmux_wint_neg,			\
	   mmux_complexf_t:		mmux_complexf_neg,		\
	   mmux_complexd_t:		mmux_complexd_neg,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_neg,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_neg,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))


/** --------------------------------------------------------------------
 ** Mathematics.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[sin]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[cos]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[tan]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[asin]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[acos]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[atan]]])
DEFINE_BINARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[atan2]]])

DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[sinh]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[cosh]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[tanh]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[asinh]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[acosh]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[atanh]]])

DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[exp]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[exp2]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[exp10]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[log]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[log2]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[log10]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[logb]]])

DEFINE_BINARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[pow]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[sqrt]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[cbrt]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[expm1]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[log1p]]])
DEFINE_BINARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[hypot]]])

DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[erf]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[erfc]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[lgamma]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[tgamma]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[j0]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[j1]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[y0]]])
DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY([[[y1]]])

DEFINE_BINARY_FUNCTION_SINT_AND_INEXACT_REAL_NUMBERS_ONLY([[[jn]]])
DEFINE_BINARY_FUNCTION_SINT_AND_INEXACT_REAL_NUMBERS_ONLY([[[yn]]])


/** --------------------------------------------------------------------
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY([[[bitwise_and]]])
DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY([[[bitwise_or]]])
DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY([[[bitwise_xor]]])
DEFINE_UNARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY([[[bitwise_not]]])

DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY_AND_SINT([[[bitwise_shl]]])
DEFINE_BINARY_FUNCTION_EXACT_REAL_NUMBERS_ONLY_AND_SINT([[[bitwise_shr]]])


/** --------------------------------------------------------------------
 ** Printing.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_PRINTING_FUNCTION([[[fprintf]]])
DEFINE_BINARY_PRINTING_FUNCTION([[[dprintf]]])


/** --------------------------------------------------------------------
 ** Dispatching name inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_dispatch_typedef(VALUE)				\
  _Generic((VALUE),							\
           mmux_pointer_t:		"mmux_pointer_t",		\
	   mmux_char_t:			"mmux_char_t",			\
           mmux_schar_t:		"mmux_schar_t",			\
           mmux_uchar_t:		"mmux_uchar_t",			\
           mmux_sshort_t:		"mmux_sshort_t",		\
           mmux_ushort_t:		"mmux_ushort_t",		\
           mmux_sint_t:			"mmux_sint_t",			\
           mmux_uint_t:			"mmux_uint_t",			\
           mmux_slong_t:		"mmux_slong_t",			\
           mmux_ulong_t:		"mmux_ulong_t",			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		"mmux_sllong_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		"mmux_ullong_t",		\
]]])m4_dnl
	   mmux_float_t:		"mmux_float_t",			\
	   mmux_double_t:		"mmux_double_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		"mmux_ldouble_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		"mmux_float32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		"mmux_float64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		"mmux_float128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		"mmux_float32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		"mmux_float64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		"mmux_float128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		"mmux_decimal32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		"mmux_decimal64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		"mmux_decimal128_t",		\
]]])m4_dnl
	   mmux_sint8_t:		"mmux_sint8_t",			\
	   mmux_uint8_t:		"mmux_uint8_t",			\
	   mmux_sint16_t:		"mmux_sint16_t",		\
	   mmux_uint16_t:		"mmux_uint16_t",		\
	   mmux_sint32_t:		"mmux_sint32_t",		\
	   mmux_uint32_t:		"mmux_uint32_t",		\
	   mmux_sint64_t:		"mmux_sint64_t",		\
	   mmux_uint64_t:		"mmux_uint64_t",		\
           mmux_ssize_t:		"mmux_ssize_t",			\
           mmux_usize_t:		"mmux_usize_t",			\
           mmux_sintmax_t:		"mmux_sintmax_t",		\
           mmux_uintmax_t:		"mmux_uintmax_t",		\
           mmux_sintptr_t:		"mmux_sintptr_t",		\
           mmux_uintptr_t:		"mmux_uintptr_t",		\
           mmux_mode_t:			"mmux_mode_t",			\
           mmux_off_t:			"mmux_off_t",			\
           mmux_pid_t:			"mmux_pid_t",			\
           mmux_uid_t:			"mmux_uid_t",			\
           mmux_gid_t:			"mmux_gid_t",			\
           mmux_ptrdiff_t:		"mmux_ptrdiff_t",		\
           mmux_wchar_t:		"mmux_wchar_t",			\
           mmux_wint_t:			"mmux_wint_t",			\
           mmux_time_t:			"mmux_time_t",			\
           mmux_socklen_t:		"mmux_socklen_t",		\
           mmux_rlim_t:			"mmux_rlim_t",			\
	   mmux_complexf_t:		"mmux_complexf_t",		\
	   mmux_complexd_t:		"mmux_complexd_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		"mmux_complexld_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		"mmux_complexf32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		"mmux_complexf64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		"mmux_complexf128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		"mmux_complexf32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		"mmux_complexf64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		"mmux_complexf128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		"mmux_complexd32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		"mmux_complexd64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		"mmux_complexd128_t",		\
]]])m4_dnl
           )

/* ------------------------------------------------------------------ */

#define mmux_ctype_dispatch_stem(VALUE)				\
  _Generic((VALUE),						\
           mmux_pointer_t:		"pointer",		\
	   mmux_char_t:			"char",			\
           mmux_schar_t:		"schar",		\
           mmux_uchar_t:		"uchar",		\
           mmux_sshort_t:		"sshort",		\
           mmux_ushort_t:		"ushort",		\
           mmux_sint_t:			"sint",			\
           mmux_uint_t:			"uint",			\
           mmux_slong_t:		"slong",		\
           mmux_ulong_t:		"ulong",		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		"sllong",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		"ullong",		\
]]])m4_dnl
	   mmux_float_t:		"float",		\
	   mmux_double_t:		"double",		\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		"ldouble",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		"float32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		"float64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		"float128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		"float32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		"float64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		"float128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		"decimal32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		"decimal64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		"decimal128",		\
]]])m4_dnl
	   mmux_sint8_t:		"sint8",		\
	   mmux_uint8_t:		"uint8",		\
	   mmux_sint16_t:		"sint16",		\
	   mmux_uint16_t:		"uint16",		\
	   mmux_sint32_t:		"sint32",		\
	   mmux_uint32_t:		"uint32",		\
	   mmux_sint64_t:		"sint64",		\
	   mmux_uint64_t:		"uint64",		\
           mmux_ssize_t:		"ssize_t",		\
           mmux_usize_t:		"usize_t",		\
           mmux_sintmax_t:		"sintmax",		\
           mmux_uintmax_t:		"uintmax",		\
           mmux_sintptr_t:		"sintptr",		\
           mmux_uintptr_t:		"uintptr",		\
           mmux_mode_t:			"mode",			\
           mmux_off_t:			"off",			\
           mmux_pid_t:			"pid",			\
           mmux_uid_t:			"uid",			\
           mmux_gid_t:			"gid",			\
           mmux_ptrdiff_t:		"ptrdiff",		\
           mmux_wchar_t:		"wchar",		\
           mmux_wint_t:			"wint",			\
           mmux_time_t:			"time",			\
           mmux_socklen_t:		"socklen",		\
           mmux_rlim_t:			"rlim",			\
	   mmux_complexf_t:		"complexf",		\
	   mmux_complexd_t:		"complexd",		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		"complexld",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		"complexf32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		"complexf64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		"complexf128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		"complexf32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		"complexf64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		"complexf128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		"complexd32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		"complexd64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		"complexd128",		\
]]])m4_dnl
           )


/** --------------------------------------------------------------------
 ** String representation.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_sprint(BUFPTR,BUFLEN,VALUE)					\
  _Generic((VALUE),								\
	   mmux_pointer_t:		mmux_pointer_sprint,			\
	   mmux_char_t:			mmux_char_sprint,			\
           mmux_schar_t:		mmux_schar_sprint,			\
           mmux_uchar_t:		mmux_uchar_sprint,			\
           mmux_sshort_t:		mmux_sshort_sprint,			\
           mmux_ushort_t:		mmux_ushort_sprint,			\
           mmux_sint_t:			mmux_sint_sprint,			\
           mmux_uint_t:			mmux_uint_sprint,			\
           mmux_slong_t:		mmux_slong_sprint,			\
           mmux_ulong_t:		mmux_ulong_sprint,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_sprint,			\
]]])m4_dnl
	   mmux_float_t:		mmux_float_sprint,			\
	   mmux_double_t:		mmux_double_sprint,			\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_sprint,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_sprint,			\
	   mmux_uint8_t:		mmux_uint8_sprint,			\
	   mmux_sint16_t:		mmux_sint16_sprint,			\
	   mmux_uint16_t:		mmux_uint16_sprint,			\
	   mmux_sint32_t:		mmux_sint32_sprint,			\
	   mmux_uint32_t:		mmux_uint32_sprint,			\
	   mmux_sint64_t:		mmux_sint64_sprint,			\
	   mmux_uint64_t:		mmux_uint64_sprint,			\
           mmux_ssize_t:		mmux_ssize_sprint,			\
           mmux_usize_t:		mmux_usize_sprint,			\
           mmux_sintmax_t:		mmux_sintmax_sprint,			\
           mmux_uintmax_t:		mmux_uintmax_sprint,			\
           mmux_sintptr_t:		mmux_sintptr_sprint,			\
           mmux_uintptr_t:		mmux_uintptr_sprint,			\
           mmux_mode_t:			mmux_mode_sprint,			\
           mmux_off_t:			mmux_off_sprint,			\
           mmux_pid_t:			mmux_pid_sprint,			\
           mmux_uid_t:			mmux_uid_sprint,			\
           mmux_gid_t:			mmux_gid_sprint,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint,			\
           mmux_wchar_t:		mmux_wchar_sprint,			\
           mmux_wint_t:			mmux_wint_sprint,			\
           mmux_time_t:			mmux_time_sprint,			\
           mmux_socklen_t:		mmux_socklen_sprint,			\
           mmux_rlim_t:			mmux_rlim_sprint,			\
	   mmux_complexf_t:		mmux_complexf_sprint,			\
	   mmux_complexd_t:		mmux_complexd_sprint,			\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_sprint,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((BUFPTR),(BUFLEN),(VALUE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_sprint_size(VALUE)						\
  _Generic((VALUE),								\
	   mmux_pointer_t:		mmux_pointer_sprint_size,		\
	   mmux_char_t:			mmux_char_sprint_size,			\
           mmux_schar_t:		mmux_schar_sprint_size,			\
           mmux_uchar_t:		mmux_uchar_sprint_size,			\
           mmux_sshort_t:		mmux_sshort_sprint_size,		\
           mmux_ushort_t:		mmux_ushort_sprint_size,		\
           mmux_sint_t:			mmux_sint_sprint_size,			\
           mmux_uint_t:			mmux_uint_sprint_size,			\
           mmux_slong_t:		mmux_slong_sprint_size,			\
           mmux_ulong_t:		mmux_ulong_sprint_size,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_sprint_size,		\
]]])m4_dnl
	   mmux_float_t:		mmux_float_sprint_size,			\
	   mmux_double_t:		mmux_double_sprint_size,		\
m4_ifelse(MMUX_CC_TYPES_HAS_LDOUBLE_M4,1,[[[m4_dnl
	   mmux_ldouble_t:		mmux_ldouble_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32_M4,1,[[[m4_dnl
	   mmux_float32_t:		mmux_float32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64_M4,1,[[[m4_dnl
	   mmux_float64_t:		mmux_float64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128_M4,1,[[[m4_dnl
	   mmux_float128_t:		mmux_float128_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT32X_M4,1,[[[m4_dnl
	   mmux_float32x_t:		mmux_float32x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT64X_M4,1,[[[m4_dnl
	   mmux_float64x_t:		mmux_float64x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLOAT128X_M4,1,[[[m4_dnl
	   mmux_float128x_t:		mmux_float128x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL32_M4,1,[[[m4_dnl
	   mmux_decimal32_t:		mmux_decimal32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL64_M4,1,[[[m4_dnl
	   mmux_decimal64_t:		mmux_decimal64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_DECIMAL128_M4,1,[[[m4_dnl
	   mmux_decimal128_t:		mmux_decimal128_sprint_size,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_sprint_size,			\
	   mmux_uint8_t:		mmux_uint8_sprint_size,			\
	   mmux_sint16_t:		mmux_sint16_sprint_size,		\
	   mmux_uint16_t:		mmux_uint16_sprint_size,		\
	   mmux_sint32_t:		mmux_sint32_sprint_size,		\
	   mmux_uint32_t:		mmux_uint32_sprint_size,		\
	   mmux_sint64_t:		mmux_sint64_sprint_size,		\
	   mmux_uint64_t:		mmux_uint64_sprint_size,		\
           mmux_ssize_t:		mmux_ssize_sprint_size,			\
           mmux_usize_t:		mmux_usize_sprint_size,			\
           mmux_sintmax_t:		mmux_sintmax_sprint_size,		\
           mmux_uintmax_t:		mmux_uintmax_sprint_size,		\
           mmux_sintptr_t:		mmux_sintptr_sprint_size,		\
           mmux_uintptr_t:		mmux_uintptr_sprint_size,		\
           mmux_mode_t:			mmux_mode_sprint_size,			\
           mmux_off_t:			mmux_off_sprint_size,			\
           mmux_pid_t:			mmux_pid_sprint_size,			\
           mmux_uid_t:			mmux_uid_sprint_size,			\
           mmux_gid_t:			mmux_gid_sprint_size,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_size,		\
           mmux_wchar_t:		mmux_wchar_sprint_size,			\
           mmux_wint_t:			mmux_wint_sprint_size,			\
           mmux_time_t:			mmux_time_sprint_size,			\
           mmux_socklen_t:		mmux_socklen_sprint_size,		\
           mmux_rlim_t:			mmux_rlim_sprint_size,			\
	   mmux_complexf_t:		mmux_complexf_sprint_size,		\
	   mmux_complexd_t:		mmux_complexd_sprint_size,		\
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXLD_M4,1,[[[m4_dnl
	   mmux_complexld_t:		mmux_complexld_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32_M4,1,[[[m4_dnl
	   mmux_complexf32_t:		mmux_complexf32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64_M4,1,[[[m4_dnl
	   mmux_complexf64_t:		mmux_complexf64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128_M4,1,[[[m4_dnl
	   mmux_complexf128_t:		mmux_complexf128_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF32X_M4,1,[[[m4_dnl
	   mmux_complexf32x_t:		mmux_complexf32x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF64X_M4,1,[[[m4_dnl
	   mmux_complexf64x_t:		mmux_complexf64x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXF128X_M4,1,[[[m4_dnl
	   mmux_complexf128x_t:		mmux_complexf128x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD32_M4,1,[[[m4_dnl
	   mmux_complexd32_t:		mmux_complexd32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD64_M4,1,[[[m4_dnl
	   mmux_complexd64_t:		mmux_complexd64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_COMPLEXD128_M4,1,[[[m4_dnl
	   mmux_complexd128_t:		mmux_complexd128_sprint_size,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_GENERICS_H */

/* end of file */
