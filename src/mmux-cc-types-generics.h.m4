/*
  Part of: MMUX CC Types
  Contents: public header file, generics definitions
  Date: Aug  5, 2025

  Abstract

	This  a the  public  header included  by "mmux-cc-types.h";  it  must not  be
	included by itself.  It defines uses of the "_Generic" keyword.

	NOTE FROM THE AUTHOR In the  following definition of _Generic macros there is
	a lot  of structure repetition;  it is natural  to think that  generating CPP
	macros from M4 macros is the way to  go.  I have tried both the solutions; my
	experience is that: it is better to  write some CPP macro explicitly, to make
	them more readable.  (Marco Maggi; Sep 14, 2025)

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
           mmux_flonumfl_t:		mmux_flonumfl_$1,		\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_$1,			\
	   mmux_uint8_t:		mmux_uint8_$1,			\
	   mmux_sint16_t:		mmux_sint16_$1,			\
	   mmux_uint16_t:		mmux_uint16_$1,			\
	   mmux_sint32_t:		mmux_sint32_$1,			\
	   mmux_uint32_t:		mmux_uint32_$1,			\
	   mmux_sint64_t:		mmux_sint64_$1,			\
	   mmux_uint64_t:		mmux_uint64_$1,			\
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact real numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_REAL_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function inexact complex numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact complex numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_COMPLEX_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)(VALUE))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: ternary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
  (_Generic((VALUE1),							\
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: binary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_BINARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Macros: unary function inexact numbers only.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_flonumfl_t:		mmux_flonumfl_$1,			\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,		\
]]])m4_dnl
	   mmux_flonumcfl_t:		mmux_flonumcfl_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_$1,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_$1,				\
	   mmux_flonumdb_t:		mmux_flonumdb_$1,				\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_$1,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_$1,			\
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
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
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

#define mmux_ctype_real_part(VALUE)					\
  (_Generic((VALUE),							\
    mmux_sshort_t:		mmux_sshort_real_part,			\
    mmux_ushort_t:		mmux_ushort_real_part,			\
    mmux_sint_t:		mmux_sint_real_part,			\
    mmux_uint_t:		mmux_uint_real_part,			\
    mmux_slong_t:		mmux_slong_real_part,			\
    mmux_ulong_t:		mmux_ulong_real_part,			\
    mmux_sllong_t:		mmux_sllong_real_part,			\
    mmux_ullong_t:		mmux_ullong_real_part,			\
    mmux_sint8_t:		mmux_sint8_real_part,			\
    mmux_uint8_t:		mmux_uint8_real_part,			\
    mmux_sint16_t:		mmux_sint16_real_part,			\
    mmux_uint16_t:		mmux_uint16_real_part,			\
    mmux_sint32_t:		mmux_sint32_real_part,			\
    mmux_uint32_t:		mmux_uint32_real_part,			\
    mmux_sint64_t:		mmux_sint64_real_part,			\
    mmux_uint64_t:		mmux_uint64_real_part,			\
    mmux_byte_t:		mmux_byte_real_part,			\
    mmux_octet_t:		mmux_octet_real_part,			\
    mmux_sintmax_t:		mmux_sintmax_real_part,			\
    mmux_uintmax_t:		mmux_uintmax_real_part,			\
    mmux_sintptr_t:		mmux_sintptr_real_part,			\
    mmux_uintptr_t:		mmux_uintptr_real_part,			\
    \
    mmux_flonumfl_t:		mmux_flonumfl_real_part,		\
    mmux_flonumdb_t:		mmux_flonumdb_real_part,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
    mmux_flonumldb_t:		mmux_flonumldb_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumf32_t:		mmux_flonumf32_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumf64_t:		mmux_flonumf64_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumf128_t:		mmux_flonumf128_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumf32x_t:		mmux_flonumf32x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumf64x_t:		mmux_flonumf64x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumf128x_t:		mmux_flonumf128x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumd32_t:		mmux_flonumd32_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumd64_t:		mmux_flonumd64_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumd128_t:		mmux_flonumd128_real_part,		\
]]])m4_dnl
   \
   mmux_flonumcfl_t:		mmux_flonumcfl_real_part,		\
   mmux_flonumcdb_t:		mmux_flonumcdb_real_part,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
   mmux_flonumcldb_t:		mmux_flonumcldb_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumcf32_t:		mmux_flonumcf32_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumcf64_t:		mmux_flonumcf64_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumcf128_t:		mmux_flonumcf128_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumcf32x_t:		mmux_flonumcf32x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumcf64x_t:		mmux_flonumcf64x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumcf128x_t:		mmux_flonumcf128x_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumcd32_t:		mmux_flonumcd32_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumcd64_t:		mmux_flonumcd64_real_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumcd128_t:		mmux_flonumcd128_real_part,		\
]]])m4_dnl
   default:			mmux_ctype_generic_error)(VALUE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_imag_part(VALUE)					\
  (_Generic((VALUE),							\
    mmux_sshort_t:		mmux_sshort_imag_part,			\
    mmux_ushort_t:		mmux_ushort_imag_part,			\
    mmux_sint_t:		mmux_sint_imag_part,			\
    mmux_uint_t:		mmux_uint_imag_part,			\
    mmux_slong_t:		mmux_slong_imag_part,			\
    mmux_ulong_t:		mmux_ulong_imag_part,			\
    mmux_sllong_t:		mmux_sllong_imag_part,			\
    mmux_ullong_t:		mmux_ullong_imag_part,			\
    mmux_sint8_t:		mmux_sint8_imag_part,			\
    mmux_uint8_t:		mmux_uint8_imag_part,			\
    mmux_sint16_t:		mmux_sint16_imag_part,			\
    mmux_uint16_t:		mmux_uint16_imag_part,			\
    mmux_sint32_t:		mmux_sint32_imag_part,			\
    mmux_uint32_t:		mmux_uint32_imag_part,			\
    mmux_sint64_t:		mmux_sint64_imag_part,			\
    mmux_uint64_t:		mmux_uint64_imag_part,			\
    mmux_byte_t:		mmux_byte_imag_part,			\
    mmux_octet_t:		mmux_octet_imag_part,			\
    mmux_sintmax_t:		mmux_sintmax_imag_part,			\
    mmux_uintmax_t:		mmux_uintmax_imag_part,			\
    mmux_sintptr_t:		mmux_sintptr_imag_part,			\
    mmux_uintptr_t:		mmux_uintptr_imag_part,			\
    \
    mmux_flonumfl_t:		mmux_flonumfl_imag_part,		\
    mmux_flonumdb_t:		mmux_flonumdb_imag_part,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
    mmux_flonumldb_t:		mmux_flonumldb_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumf32_t:		mmux_flonumf32_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumf64_t:		mmux_flonumf64_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumf128_t:		mmux_flonumf128_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumf32x_t:		mmux_flonumf32x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumf64x_t:		mmux_flonumf64x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumf128x_t:		mmux_flonumf128x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumd32_t:		mmux_flonumd32_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumd64_t:		mmux_flonumd64_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumd128_t:		mmux_flonumd128_imag_part,		\
]]])m4_dnl
   \
   mmux_flonumcfl_t:		mmux_flonumcfl_imag_part,		\
   mmux_flonumcdb_t:		mmux_flonumcdb_imag_part,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
   mmux_flonumcldb_t:		mmux_flonumcldb_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumcf32_t:		mmux_flonumcf32_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumcf64_t:		mmux_flonumcf64_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumcf128_t:		mmux_flonumcf128_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumcf32x_t:		mmux_flonumcf32x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumcf64x_t:		mmux_flonumcf64x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumcf128x_t:		mmux_flonumcf128x_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumcd32_t:		mmux_flonumcd32_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumcd64_t:		mmux_flonumcd64_imag_part,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumcd128_t:		mmux_flonumcd128_imag_part,		\
]]])m4_dnl
   default:			mmux_ctype_generic_error)(VALUE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_argument(VALUE)					\
  (_Generic((VALUE),							\
    mmux_sshort_t:		mmux_sshort_argument,			\
    mmux_ushort_t:		mmux_ushort_argument,			\
    mmux_sint_t:		mmux_sint_argument,			\
    mmux_uint_t:		mmux_uint_argument,			\
    mmux_slong_t:		mmux_slong_argument,			\
    mmux_ulong_t:		mmux_ulong_argument,			\
    mmux_sllong_t:		mmux_sllong_argument,			\
    mmux_ullong_t:		mmux_ullong_argument,			\
    mmux_sint8_t:		mmux_sint8_argument,			\
    mmux_uint8_t:		mmux_uint8_argument,			\
    mmux_sint16_t:		mmux_sint16_argument,			\
    mmux_uint16_t:		mmux_uint16_argument,			\
    mmux_sint32_t:		mmux_sint32_argument,			\
    mmux_uint32_t:		mmux_uint32_argument,			\
    mmux_sint64_t:		mmux_sint64_argument,			\
    mmux_uint64_t:		mmux_uint64_argument,			\
    mmux_byte_t:		mmux_byte_argument,			\
    mmux_octet_t:		mmux_octet_argument,			\
    mmux_sintmax_t:		mmux_sintmax_argument,			\
    mmux_uintmax_t:		mmux_uintmax_argument,			\
    mmux_sintptr_t:		mmux_sintptr_argument,			\
    mmux_uintptr_t:		mmux_uintptr_argument,			\
    \
    mmux_flonumfl_t:		mmux_flonumfl_argument,		\
    mmux_flonumdb_t:		mmux_flonumdb_argument,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
    mmux_flonumldb_t:		mmux_flonumldb_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumf32_t:		mmux_flonumf32_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumf64_t:		mmux_flonumf64_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumf128_t:		mmux_flonumf128_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumf32x_t:		mmux_flonumf32x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumf64x_t:		mmux_flonumf64x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumf128x_t:		mmux_flonumf128x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumd32_t:		mmux_flonumd32_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumd64_t:		mmux_flonumd64_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumd128_t:		mmux_flonumd128_argument,		\
]]])m4_dnl
   \
   mmux_flonumcfl_t:		mmux_flonumcfl_argument,		\
   mmux_flonumcdb_t:		mmux_flonumcdb_argument,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
   mmux_flonumcldb_t:		mmux_flonumcldb_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumcf32_t:		mmux_flonumcf32_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumcf64_t:		mmux_flonumcf64_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumcf128_t:		mmux_flonumcf128_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumcf32x_t:		mmux_flonumcf32x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumcf64x_t:		mmux_flonumcf64x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumcf128x_t:		mmux_flonumcf128x_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumcd32_t:		mmux_flonumcd32_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumcd64_t:		mmux_flonumcd64_argument,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumcd128_t:		mmux_flonumcd128_argument,		\
]]])m4_dnl
   default:			mmux_ctype_generic_error)(VALUE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_conjugate(VALUE)					\
  (_Generic((VALUE),							\
    mmux_sshort_t:		mmux_sshort_conjugate,			\
    mmux_ushort_t:		mmux_ushort_conjugate,			\
    mmux_sint_t:		mmux_sint_conjugate,			\
    mmux_uint_t:		mmux_uint_conjugate,			\
    mmux_slong_t:		mmux_slong_conjugate,			\
    mmux_ulong_t:		mmux_ulong_conjugate,			\
    mmux_sllong_t:		mmux_sllong_conjugate,			\
    mmux_ullong_t:		mmux_ullong_conjugate,			\
    mmux_sint8_t:		mmux_sint8_conjugate,			\
    mmux_uint8_t:		mmux_uint8_conjugate,			\
    mmux_sint16_t:		mmux_sint16_conjugate,			\
    mmux_uint16_t:		mmux_uint16_conjugate,			\
    mmux_sint32_t:		mmux_sint32_conjugate,			\
    mmux_uint32_t:		mmux_uint32_conjugate,			\
    mmux_sint64_t:		mmux_sint64_conjugate,			\
    mmux_uint64_t:		mmux_uint64_conjugate,			\
    mmux_byte_t:		mmux_byte_conjugate,			\
    mmux_octet_t:		mmux_octet_conjugate,			\
    mmux_sintmax_t:		mmux_sintmax_conjugate,			\
    mmux_uintmax_t:		mmux_uintmax_conjugate,			\
    mmux_sintptr_t:		mmux_sintptr_conjugate,			\
    mmux_uintptr_t:		mmux_uintptr_conjugate,			\
    \
    mmux_flonumfl_t:		mmux_flonumfl_conjugate,		\
    mmux_flonumdb_t:		mmux_flonumdb_conjugate,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
    mmux_flonumldb_t:		mmux_flonumldb_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumf32_t:		mmux_flonumf32_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumf64_t:		mmux_flonumf64_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumf128_t:		mmux_flonumf128_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumf32x_t:		mmux_flonumf32x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumf64x_t:		mmux_flonumf64x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumf128x_t:		mmux_flonumf128x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumd32_t:		mmux_flonumd32_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumd64_t:		mmux_flonumd64_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumd128_t:		mmux_flonumd128_conjugate,		\
]]])m4_dnl
   \
   mmux_flonumcfl_t:		mmux_flonumcfl_conjugate,		\
   mmux_flonumcdb_t:		mmux_flonumcdb_conjugate,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
   mmux_flonumcldb_t:		mmux_flonumcldb_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
   mmux_flonumcf32_t:		mmux_flonumcf32_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
   mmux_flonumcf64_t:		mmux_flonumcf64_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
   mmux_flonumcf128_t:		mmux_flonumcf128_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
   mmux_flonumcf32x_t:		mmux_flonumcf32x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
   mmux_flonumcf64x_t:		mmux_flonumcf64x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
   mmux_flonumcf128x_t:		mmux_flonumcf128x_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
   mmux_flonumcd32_t:		mmux_flonumcd32_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
   mmux_flonumcd64_t:		mmux_flonumcd64_conjugate,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
   mmux_flonumcd128_t:		mmux_flonumcd128_conjugate,		\
]]])m4_dnl
   default:			mmux_ctype_generic_error)(VALUE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_rectangular(VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
    mmux_flonumfl_t:		mmux_flonumcfl_rectangular,		\
    mmux_flonumdb_t:		mmux_flonumcdb_rectangular,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumcldb_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumcf32_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumcf64_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumcf128_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumcf32x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumcf64x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumcf128x_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumcd32_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumcd64_rectangular,	\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumcd128_rectangular,	\
]]])m4_dnl
default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_FUNCTION([[[is_zero]]])
DEFINE_UNARY_FUNCTION([[[is_positive]]])
DEFINE_UNARY_FUNCTION([[[is_negative]]])
DEFINE_UNARY_FUNCTION([[[is_non_positive]]])
DEFINE_UNARY_FUNCTION([[[is_non_negative]]])
DEFINE_UNARY_FUNCTION([[[is_finite]]])
DEFINE_UNARY_FUNCTION([[[is_infinite]]])
DEFINE_UNARY_FUNCTION([[[is_nan]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[is_normal]]])
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[is_subnormal]]])


/** --------------------------------------------------------------------
 ** Comparison.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_FUNCTION([[[cmp]]])
DEFINE_BINARY_FUNCTION([[[equal]]])
DEFINE_BINARY_FUNCTION([[[not_equal]]])
DEFINE_BINARY_FUNCTION([[[greater]]])
DEFINE_BINARY_FUNCTION([[[less]]])
DEFINE_BINARY_FUNCTION([[[greater_equal]]])
DEFINE_BINARY_FUNCTION([[[less_equal]]])

DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[equal_absmargin]]])
DEFINE_TERNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[equal_relepsilon]]])

DEFINE_BINARY_FUNCTION([[[max]]])
DEFINE_BINARY_FUNCTION([[[min]]])


/** --------------------------------------------------------------------
 ** Arithmetics.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_FUNCTION([[[add]]])
DEFINE_BINARY_FUNCTION([[[sub]]])
DEFINE_BINARY_FUNCTION_NO_POINTER([[[mul]]])
DEFINE_BINARY_FUNCTION_NO_POINTER([[[div]]])
DEFINE_UNARY_FUNCTION_NO_POINTER([[[neg]]])
DEFINE_UNARY_FUNCTION_NO_POINTER([[[inverse]]])
DEFINE_UNARY_FUNCTION_NO_POINTER([[[absolute]]])

DEFINE_BINARY_FUNCTION_REAL_NUMBERS_ONLY([[[modulo]]])
DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY([[[incr]]])
DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY([[[decr]]])
DEFINE_UNARY_FUNCTION_REAL_NUMBERS_ONLY([[[sign]]])


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
DEFINE_UNARY_FUNCTION_INEXACT_NUMBERS_ONLY([[[cbrt]]])
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
  (_Generic((VALUE),							\
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
	   mmux_flonumfl_t:		"mmux_flonumfl_t",			\
	   mmux_flonumdb_t:		"mmux_flonumdb_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		"mmux_flonumldb_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		"mmux_flonumf32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		"mmux_flonumf64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		"mmux_flonumf128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		"mmux_flonumf32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		"mmux_flonumf64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		"mmux_flonumf128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		"mmux_flonumd32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		"mmux_flonumd64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		"mmux_flonumd128_t",		\
]]])m4_dnl
	   mmux_sint8_t:		"mmux_sint8_t",			\
	   mmux_uint8_t:		"mmux_uint8_t",			\
	   mmux_sint16_t:		"mmux_sint16_t",		\
	   mmux_uint16_t:		"mmux_uint16_t",		\
	   mmux_sint32_t:		"mmux_sint32_t",		\
	   mmux_uint32_t:		"mmux_uint32_t",		\
	   mmux_sint64_t:		"mmux_sint64_t",		\
	   mmux_uint64_t:		"mmux_uint64_t",		\
	   mmux_byte_t:			"mmux_byte_t",			\
	   mmux_octet_t:		"mmux_octet_t",			\
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
	   mmux_flonumcfl_t:		"mmux_flonumcfl_t",		\
	   mmux_flonumcdb_t:		"mmux_flonumcdb_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		"mmux_flonumcldb_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		"mmux_flonumcf32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		"mmux_flonumcf64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		"mmux_flonumcf128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		"mmux_flonumcf32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		"mmux_flonumcf64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		"mmux_flonumcf128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		"mmux_flonumcd32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		"mmux_flonumcd64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		"mmux_flonumcd128_t",		\
]]])m4_dnl
           default:			"<unspecified>"))

/* ------------------------------------------------------------------ */

#define mmux_ctype_dispatch_stem(VALUE)				\
  (_Generic((VALUE),						\
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
	   mmux_flonumfl_t:		"flonumfl",		\
	   mmux_flonumdb_t:		"flonumdb",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		"flonumldb",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		"flonumf32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		"flonumf64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		"flonumf128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		"flonumf32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		"flonumf64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		"flonumf128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		"flonumd32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		"flonumd64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		"flonumd128",		\
]]])m4_dnl
	   mmux_sint8_t:		"sint8",		\
	   mmux_uint8_t:		"uint8",		\
	   mmux_sint16_t:		"sint16",		\
	   mmux_uint16_t:		"uint16",		\
	   mmux_sint32_t:		"sint32",		\
	   mmux_uint32_t:		"uint32",		\
	   mmux_sint64_t:		"sint64",		\
	   mmux_uint64_t:		"uint64",		\
           mmux_byte_t:			"byte",			\
	   mmux_octet_t:		"octet",		\
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
	   mmux_flonumcfl_t:		"flonumcfl",		\
	   mmux_flonumcdb_t:		"flonumcdb",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		"flonumcldb",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		"flonumcf32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		"flonumcf64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		"flonumcf128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		"flonumcf32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		"flonumcf64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		"flonumcf128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		"flonumcd32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		"flonumcd64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		"flonumcd128",		\
]]])m4_dnl
           default:			"<unspecified>"))


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
	   mmux_flonumfl_t:		mmux_flonumfl_sprint,			\
	   mmux_flonumdb_t:		mmux_flonumdb_sprint,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_sprint,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_sprint,			\
	   mmux_uint8_t:		mmux_uint8_sprint,			\
	   mmux_sint16_t:		mmux_sint16_sprint,			\
	   mmux_uint16_t:		mmux_uint16_sprint,			\
	   mmux_sint32_t:		mmux_sint32_sprint,			\
	   mmux_uint32_t:		mmux_uint32_sprint,			\
	   mmux_sint64_t:		mmux_sint64_sprint,			\
	   mmux_uint64_t:		mmux_uint64_sprint,			\
	   mmux_byte_t:			mmux_byte_sprint,			\
	   mmux_octet_t:		mmux_octet_sprint,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_sprint,			\
	   mmux_flonumcdb_t:		mmux_flonumcdb_sprint,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_sprint,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_sprint,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_sprint,		\
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
	   mmux_flonumfl_t:		mmux_flonumfl_sprint_size,			\
	   mmux_flonumdb_t:		mmux_flonumdb_sprint_size,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_sprint_size,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_sprint_size,			\
	   mmux_uint8_t:		mmux_uint8_sprint_size,			\
	   mmux_sint16_t:		mmux_sint16_sprint_size,		\
	   mmux_uint16_t:		mmux_uint16_sprint_size,		\
	   mmux_sint32_t:		mmux_sint32_sprint_size,		\
	   mmux_uint32_t:		mmux_uint32_sprint_size,		\
	   mmux_sint64_t:		mmux_sint64_sprint_size,		\
	   mmux_uint64_t:		mmux_uint64_sprint_size,		\
	   mmux_byte_t:			mmux_byte_sprint_size,			\
	   mmux_octet_t:		mmux_octet_sprint_size,			\
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
	   mmux_flonumcfl_t:		mmux_flonumcfl_sprint_size,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_sprint_size,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_sprint_size,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_sprint_size,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((VALUE))


/** --------------------------------------------------------------------
 ** String representation with custom base.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_sprint_with_base(BUFPTR,BUFLEN_P,IS_NEGATIVE_P,VALUE,BASE)		\
  _Generic((VALUE),									\
	   mmux_pointer_t:		mmux_pointer_sprint_with_base,			\
	   mmux_char_t:			mmux_char_sprint_with_base,			\
           mmux_schar_t:		mmux_schar_sprint_with_base,			\
           mmux_uchar_t:		mmux_uchar_sprint_with_base,			\
           mmux_sshort_t:		mmux_sshort_sprint_with_base,			\
           mmux_ushort_t:		mmux_ushort_sprint_with_base,			\
           mmux_sint_t:			mmux_sint_sprint_with_base,			\
           mmux_uint_t:			mmux_uint_sprint_with_base,			\
           mmux_slong_t:		mmux_slong_sprint_with_base,			\
           mmux_ulong_t:		mmux_ulong_sprint_with_base,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_sprint_with_base,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_sprint_with_base,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_sprint_with_base,			\
	   mmux_uint8_t:		mmux_uint8_sprint_with_base,			\
	   mmux_sint16_t:		mmux_sint16_sprint_with_base,			\
	   mmux_uint16_t:		mmux_uint16_sprint_with_base,			\
	   mmux_sint32_t:		mmux_sint32_sprint_with_base,			\
	   mmux_uint32_t:		mmux_uint32_sprint_with_base,			\
	   mmux_sint64_t:		mmux_sint64_sprint_with_base,			\
	   mmux_uint64_t:		mmux_uint64_sprint_with_base,			\
	   mmux_byte_t:			mmux_byte_sprint_with_base,			\
	   mmux_octet_t:		mmux_octet_sprint_with_base,			\
           mmux_ssize_t:		mmux_ssize_sprint_with_base,			\
           mmux_usize_t:		mmux_usize_sprint_with_base,			\
           mmux_sintmax_t:		mmux_sintmax_sprint_with_base,			\
           mmux_uintmax_t:		mmux_uintmax_sprint_with_base,			\
           mmux_sintptr_t:		mmux_sintptr_sprint_with_base,			\
           mmux_uintptr_t:		mmux_uintptr_sprint_with_base,			\
           mmux_mode_t:			mmux_mode_sprint_with_base,			\
           mmux_off_t:			mmux_off_sprint_with_base,			\
           mmux_pid_t:			mmux_pid_sprint_with_base,			\
           mmux_uid_t:			mmux_uid_sprint_with_base,			\
           mmux_gid_t:			mmux_gid_sprint_with_base,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_with_base,			\
           mmux_wchar_t:		mmux_wchar_sprint_with_base,			\
           mmux_wint_t:			mmux_wint_sprint_with_base,			\
           mmux_time_t:			mmux_time_sprint_with_base,			\
           mmux_socklen_t:		mmux_socklen_sprint_with_base,			\
           mmux_rlim_t:			mmux_rlim_sprint_with_base)((BUFPTR),(BUFLEN_P),(IS_NEGATIVE_P),(VALUE),(BASE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_dprintf_with_base(FD,VALUE,BASE)					\
  _Generic((VALUE),									\
	   mmux_pointer_t:		mmux_pointer_dprintf_with_base,			\
	   mmux_char_t:			mmux_char_dprintf_with_base,			\
           mmux_schar_t:		mmux_schar_dprintf_with_base,			\
           mmux_uchar_t:		mmux_uchar_dprintf_with_base,			\
           mmux_sshort_t:		mmux_sshort_dprintf_with_base,			\
           mmux_ushort_t:		mmux_ushort_dprintf_with_base,			\
           mmux_sint_t:			mmux_sint_dprintf_with_base,			\
           mmux_uint_t:			mmux_uint_dprintf_with_base,			\
           mmux_slong_t:		mmux_slong_dprintf_with_base,			\
           mmux_ulong_t:		mmux_ulong_dprintf_with_base,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_dprintf_with_base,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_dprintf_with_base,			\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_dprintf_with_base,			\
	   mmux_uint8_t:		mmux_uint8_dprintf_with_base,			\
	   mmux_sint16_t:		mmux_sint16_dprintf_with_base,			\
	   mmux_uint16_t:		mmux_uint16_dprintf_with_base,			\
	   mmux_sint32_t:		mmux_sint32_dprintf_with_base,			\
	   mmux_uint32_t:		mmux_uint32_dprintf_with_base,			\
	   mmux_sint64_t:		mmux_sint64_dprintf_with_base,			\
	   mmux_uint64_t:		mmux_uint64_dprintf_with_base,			\
	   mmux_byte_t:			mmux_byte_dprintf_with_base,			\
	   mmux_octet_t:		mmux_octet_dprintf_with_base,			\
           mmux_ssize_t:		mmux_ssize_dprintf_with_base,			\
           mmux_usize_t:		mmux_usize_dprintf_with_base,			\
           mmux_sintmax_t:		mmux_sintmax_dprintf_with_base,			\
           mmux_uintmax_t:		mmux_uintmax_dprintf_with_base,			\
           mmux_sintptr_t:		mmux_sintptr_dprintf_with_base,			\
           mmux_uintptr_t:		mmux_uintptr_dprintf_with_base,			\
           mmux_mode_t:			mmux_mode_dprintf_with_base,			\
           mmux_off_t:			mmux_off_dprintf_with_base,			\
           mmux_pid_t:			mmux_pid_dprintf_with_base,			\
           mmux_uid_t:			mmux_uid_dprintf_with_base,			\
           mmux_gid_t:			mmux_gid_dprintf_with_base,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_dprintf_with_base,			\
           mmux_wchar_t:		mmux_wchar_dprintf_with_base,			\
           mmux_wint_t:			mmux_wint_dprintf_with_base,			\
           mmux_time_t:			mmux_time_dprintf_with_base,			\
           mmux_socklen_t:		mmux_socklen_dprintf_with_base,			\
           mmux_rlim_t:			mmux_rlim_dprintf_with_base)((FD),(VALUE),(BASE))



/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_GENERICS_H */

/* end of file */
