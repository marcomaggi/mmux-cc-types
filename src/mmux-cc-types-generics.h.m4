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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
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
           mmux_libc_mode_t:			mmux_libc_mode_$1,			\
           mmux_off_t:			mmux_off_$1,			\
           mmux_libc_pid_t:			mmux_libc_pid_$1,			\
           mmux_libc_uid_t:			mmux_libc_uid_$1,			\
           mmux_libc_gid_t:			mmux_libc_gid_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_$1,			\
           mmux_libc_ino_t:			mmux_libc_ino_$1,			\
           mmux_libc_dev_t:			mmux_libc_dev_$1,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_$1,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,			\
           default:			mmux_ctype_generic_error)(VALUE1,VALUE2)
]]]) m4_dnl


/** --------------------------------------------------------------------
 ** Type inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_is_signed(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t:			false,			\
]]],[[[m4_dnl
	   mmux_char_t:			true,			\
]]])m4_dnl
           mmux_schar_t:		true,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:			false,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:			true,			\
           mmux_libc_uid_t:			false,			\
           mmux_libc_gid_t:			false,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			true,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:			false,			\
           mmux_libc_ino_t:			false,			\
           mmux_libc_dev_t:			false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_unsigned(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4,1,[[[m4_dnl
	   mmux_char_t:			true,			\
]]],[[[m4_dnl
	   mmux_char_t:			false,			\
]]])m4_dnl
           mmux_schar_t:		false,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:			true,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:			false,			\
           mmux_libc_uid_t:			true,			\
           mmux_libc_gid_t:			true,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			false,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:			true,			\
           mmux_libc_ino_t:			true,			\
           mmux_libc_dev_t:			true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_exact_integer(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
	   mmux_char_t:			true,			\
           mmux_schar_t:		true,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:			true,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:			true,			\
           mmux_libc_uid_t:			true,			\
           mmux_libc_gid_t:			true,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			true,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:			true,			\
           mmux_libc_ino_t:			true,			\
           mmux_libc_dev_t:			true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_real_number(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		true,			\
	   mmux_char_t:			true,			\
           mmux_schar_t:		true,			\
           mmux_uchar_t:		true,			\
           mmux_sshort_t:		true,			\
           mmux_ushort_t:		true,			\
           mmux_sint_t:			true,			\
           mmux_uint_t:			true,			\
           mmux_slong_t:		true,			\
           mmux_ulong_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		true,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		true,			\
	   mmux_uint8_t:		true,			\
	   mmux_sint16_t:		true,			\
	   mmux_uint16_t:		true,			\
	   mmux_sint32_t:		true,			\
	   mmux_uint32_t:		true,			\
	   mmux_sint64_t:		true,			\
	   mmux_uint64_t:		true,			\
	   mmux_byte_t:			true,			\
	   mmux_octet_t:		true,			\
           mmux_ssize_t:		true,			\
           mmux_usize_t:		true,			\
           mmux_sintmax_t:		true,			\
           mmux_uintmax_t:		true,			\
           mmux_sintptr_t:		true,			\
           mmux_uintptr_t:		true,			\
           mmux_libc_mode_t:			true,			\
           mmux_off_t:			true,			\
           mmux_libc_pid_t:			true,			\
           mmux_libc_uid_t:			true,			\
           mmux_libc_gid_t:			true,			\
           mmux_ptrdiff_t:		true,			\
           mmux_wchar_t:		true,			\
           mmux_wint_t:			true,			\
           mmux_time_t:			true,			\
           mmux_libc_socklen_t:		true,			\
           mmux_libc_rlim_t:			true,			\
           mmux_libc_ino_t:			true,			\
           mmux_libc_dev_t:			true,			\
           mmux_libc_nlink_t:		true,			\
           mmux_libc_blkcnt_t:		true))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_complex_number(VALUE)			\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:			false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:			false,			\
           mmux_libc_uid_t:			false,			\
           mmux_libc_gid_t:			false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:			false,			\
           mmux_libc_ino_t:			false,			\
           mmux_libc_dev_t:			false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_flonum(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		true,			\
	   mmux_flonumdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		true,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		false,			\
	   mmux_flonumcdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		false,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:			false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:			false,			\
           mmux_libc_uid_t:			false,			\
           mmux_libc_gid_t:			false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:			false,			\
           mmux_libc_ino_t:			false,			\
           mmux_libc_dev_t:			false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))

/* ------------------------------------------------------------------ */

#define mmux_ctype_is_flonumc(VALUE)				\
  (_Generic((VALUE),						\
	   mmux_pointer_t:		false,			\
	   mmux_char_t:			false,			\
           mmux_schar_t:		false,			\
           mmux_uchar_t:		false,			\
           mmux_sshort_t:		false,			\
           mmux_ushort_t:		false,			\
           mmux_sint_t:			false,			\
           mmux_uint_t:			false,			\
           mmux_slong_t:		false,			\
           mmux_ulong_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		false,			\
]]])m4_dnl
	   mmux_flonumfl_t:		false,			\
	   mmux_flonumdb_t:		false,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		false,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		false,			\
]]])m4_dnl
	   mmux_flonumcfl_t:		true,			\
	   mmux_flonumcdb_t:		true,			\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		true,			\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		true,			\
]]])m4_dnl
	   mmux_sint8_t:		false,			\
	   mmux_uint8_t:		false,			\
	   mmux_sint16_t:		false,			\
	   mmux_uint16_t:		false,			\
	   mmux_sint32_t:		false,			\
	   mmux_uint32_t:		false,			\
	   mmux_sint64_t:		false,			\
	   mmux_uint64_t:		false,			\
	   mmux_byte_t:			false,			\
	   mmux_octet_t:		false,			\
           mmux_ssize_t:		false,			\
           mmux_usize_t:		false,			\
           mmux_sintmax_t:		false,			\
           mmux_uintmax_t:		false,			\
           mmux_sintptr_t:		false,			\
           mmux_uintptr_t:		false,			\
           mmux_libc_mode_t:			false,			\
           mmux_off_t:			false,			\
           mmux_libc_pid_t:			false,			\
           mmux_libc_uid_t:			false,			\
           mmux_libc_gid_t:			false,			\
           mmux_ptrdiff_t:		false,			\
           mmux_wchar_t:		false,			\
           mmux_wint_t:			false,			\
           mmux_time_t:			false,			\
           mmux_libc_socklen_t:		false,			\
           mmux_libc_rlim_t:			false,			\
           mmux_libc_ino_t:			false,			\
           mmux_libc_dev_t:			false,			\
           mmux_libc_nlink_t:		false,			\
           mmux_libc_blkcnt_t:		false))


/** --------------------------------------------------------------------
 ** Dispatching name inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_typedef_name(VALUE)					\
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
           mmux_libc_mode_t:			"mmux_libc_mode_t",			\
           mmux_off_t:			"mmux_off_t",			\
           mmux_libc_pid_t:			"mmux_libc_pid_t",			\
           mmux_libc_uid_t:			"mmux_libc_uid_t",			\
           mmux_libc_gid_t:			"mmux_libc_gid_t",			\
           mmux_ptrdiff_t:		"mmux_ptrdiff_t",		\
           mmux_wchar_t:		"mmux_wchar_t",			\
           mmux_wint_t:			"mmux_wint_t",			\
           mmux_time_t:			"mmux_time_t",			\
           mmux_libc_socklen_t:		"mmux_libc_socklen_t",		\
           mmux_libc_rlim_t:			"mmux_libc_rlim_t",			\
           mmux_libc_ino_t:			"mmux_libc_ino_t",			\
           mmux_libc_dev_t:			"mmux_libc_dev_t",			\
           mmux_libc_nlink_t:		"mmux_libc_nlink_t",			\
           mmux_libc_blkcnt_t:		"mmux_libc_blkcnt_t",		\
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

#define mmux_ctype_stem_name(VALUE)				\
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
           mmux_libc_mode_t:			"libc_mode",			\
           mmux_off_t:			"off",			\
           mmux_libc_pid_t:			"libc_pid",			\
           mmux_libc_uid_t:			"libc_uid",			\
           mmux_libc_gid_t:			"libc_gid",			\
           mmux_ptrdiff_t:		"ptrdiff",		\
           mmux_wchar_t:		"wchar",		\
           mmux_wint_t:			"wint",			\
           mmux_time_t:			"time",			\
           mmux_libc_socklen_t:		"libc_socklen",		\
           mmux_libc_rlim_t:			"libc_rlim",			\
           mmux_libc_ino_t:			"libc_ino",			\
           mmux_libc_dev_t:			"libc_dev",			\
           mmux_libc_nlink_t:		"libc_nlink",		\
           mmux_libc_blkcnt_t:		"libc_blkcnt",		\
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
           mmux_libc_mode_t:			mmux_libc_mode_sprint,			\
           mmux_off_t:			mmux_off_sprint,			\
           mmux_libc_pid_t:			mmux_libc_pid_sprint,			\
           mmux_libc_uid_t:			mmux_libc_uid_sprint,			\
           mmux_libc_gid_t:			mmux_libc_gid_sprint,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint,			\
           mmux_wchar_t:		mmux_wchar_sprint,			\
           mmux_wint_t:			mmux_wint_sprint,			\
           mmux_time_t:			mmux_time_sprint,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint,			\
           mmux_libc_rlim_t:			mmux_libc_rlim_sprint,			\
           mmux_libc_ino_t:			mmux_libc_ino_sprint,			\
           mmux_libc_dev_t:			mmux_libc_dev_sprint,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_sprint,			\
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

#define mmux_ctype_sprint_size(VALUE1,VALUE2)					\
  _Generic((VALUE2),								\
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
           mmux_libc_mode_t:			mmux_libc_mode_sprint_size,			\
           mmux_off_t:			mmux_off_sprint_size,			\
           mmux_libc_pid_t:			mmux_libc_pid_sprint_size,			\
           mmux_libc_uid_t:			mmux_libc_uid_sprint_size,			\
           mmux_libc_gid_t:			mmux_libc_gid_sprint_size,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_size,		\
           mmux_wchar_t:		mmux_wchar_sprint_size,			\
           mmux_wint_t:			mmux_wint_sprint_size,			\
           mmux_time_t:			mmux_time_sprint_size,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint_size,		\
           mmux_libc_rlim_t:			mmux_libc_rlim_sprint_size,			\
           mmux_libc_ino_t:			mmux_libc_ino_sprint_size,			\
           mmux_libc_dev_t:			mmux_libc_dev_sprint_size,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint_size,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_sprint_size,		\
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
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2))


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
           mmux_libc_mode_t:			mmux_libc_mode_sprint_with_base,			\
           mmux_off_t:			mmux_off_sprint_with_base,			\
           mmux_libc_pid_t:			mmux_libc_pid_sprint_with_base,			\
           mmux_libc_uid_t:			mmux_libc_uid_sprint_with_base,			\
           mmux_libc_gid_t:			mmux_libc_gid_sprint_with_base,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_with_base,			\
           mmux_wchar_t:		mmux_wchar_sprint_with_base,			\
           mmux_wint_t:			mmux_wint_sprint_with_base,			\
           mmux_time_t:			mmux_time_sprint_with_base,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint_with_base,			\
           mmux_libc_rlim_t:			mmux_libc_rlim_sprint_with_base,			\
           mmux_libc_ino_t:			mmux_libc_ino_sprint_with_base,			\
           mmux_libc_dev_t:			mmux_libc_dev_sprint_with_base,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint_with_base,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_sprint_with_base)((BUFPTR),(BUFLEN_P),(IS_NEGATIVE_P),(VALUE),(BASE))

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
           mmux_libc_mode_t:			mmux_libc_mode_dprintf_with_base,			\
           mmux_off_t:			mmux_off_dprintf_with_base,			\
           mmux_libc_pid_t:			mmux_libc_pid_dprintf_with_base,			\
           mmux_libc_uid_t:			mmux_libc_uid_dprintf_with_base,			\
           mmux_libc_gid_t:			mmux_libc_gid_dprintf_with_base,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_dprintf_with_base,			\
           mmux_wchar_t:		mmux_wchar_dprintf_with_base,			\
           mmux_wint_t:			mmux_wint_dprintf_with_base,			\
           mmux_time_t:			mmux_time_dprintf_with_base,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_dprintf_with_base,			\
           mmux_libc_rlim_t:			mmux_libc_rlim_dprintf_with_base,			\
           mmux_libc_ino_t:			mmux_libc_ino_dprintf_with_base,			\
           mmux_libc_dev_t:			mmux_libc_dev_dprintf_with_base,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_dprintf_with_base,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_dprintf_with_base)((FD),(VALUE),(BASE))


/** --------------------------------------------------------------------
 ** Inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_value(VALUE)						\
  (_Generic((VALUE),							\
	   mmux_pointer_t:		(VALUE),			\
	   mmux_char_t:			((VALUE).value),		\
           mmux_schar_t:		((VALUE).value),		\
           mmux_uchar_t:		((VALUE).value),		\
           mmux_sshort_t:		((VALUE).value),		\
           mmux_ushort_t:		((VALUE).value),		\
           mmux_sint_t:			((VALUE).value),		\
           mmux_uint_t:			((VALUE).value),		\
           mmux_slong_t:		((VALUE).value),		\
           mmux_ulong_t:		((VALUE).value),		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		((VALUE).value),		\
]]])m4_dnl
	   mmux_flonumfl_t:		((VALUE).value),		\
	   mmux_flonumdb_t:		((VALUE).value),		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		((VALUE).value),		\
]]])m4_dnl
	   mmux_sint8_t:		((VALUE).value),		\
	   mmux_uint8_t:		((VALUE).value),		\
	   mmux_sint16_t:		((VALUE).value),		\
	   mmux_uint16_t:		((VALUE).value),		\
	   mmux_sint32_t:		((VALUE).value),		\
	   mmux_uint32_t:		((VALUE).value),		\
	   mmux_sint64_t:		((VALUE).value),		\
	   mmux_uint64_t:		((VALUE).value),		\
	   mmux_byte_t:			((VALUE).value),		\
	   mmux_octet_t:		((VALUE).value),		\
           mmux_ssize_t:		((VALUE).value),		\
           mmux_usize_t:		((VALUE).value),		\
           mmux_sintmax_t:		((VALUE).value),		\
           mmux_uintmax_t:		((VALUE).value),		\
           mmux_sintptr_t:		((VALUE).value),		\
           mmux_uintptr_t:		((VALUE).value),		\
	   mmux_flonumcfl_t:		((VALUE).value),		\
	   mmux_flonumcdb_t:		((VALUE).value),		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		((VALUE).value),		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		((VALUE).value),		\
]]])m4_dnl
           mmux_libc_mode_t:			((VALUE).value),		\
           mmux_off_t:			((VALUE).value),		\
           mmux_libc_pid_t:			((VALUE).value),		\
           mmux_libc_uid_t:			((VALUE).value),		\
           mmux_libc_gid_t:			((VALUE).value),		\
           mmux_ptrdiff_t:		((VALUE).value),		\
           mmux_wchar_t:		((VALUE).value),		\
           mmux_wint_t:			((VALUE).value),		\
           mmux_time_t:			((VALUE).value),		\
           mmux_libc_socklen_t:		((VALUE).value),		\
           mmux_libc_rlim_t:			((VALUE).value),		\
           mmux_libc_ino_t:			((VALUE).value),		\
           mmux_libc_dev_t:			((VALUE).value),		\
           mmux_libc_nlink_t:		((VALUE).value),		\
           mmux_libc_blkcnt_t:		((VALUE).value)))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_GENERICS_H */

/* end of file */
