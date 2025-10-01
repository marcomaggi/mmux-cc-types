m4_divert(-1)m4_dnl
m4_dnl
m4_dnl Part of: MMUX Bash Builtins Macros
m4_dnl Contents: macros to define builtins
m4_dnl Date: Sep  9, 2024
m4_dnl
m4_dnl Abstract
m4_dnl
m4_dnl		This library  defines macros to  automatically generate C language
m4_dnl		functions for GNU Bash builtings implementation.
m4_dnl
m4_dnl Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>
m4_dnl
m4_dnl This program is free  software: you can redistribute it and/or  modify it under the
m4_dnl terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
m4_dnl Foundation, either version 3 of the License, or (at your option) any later version.
m4_dnl
m4_dnl This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
m4_dnl WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
m4_dnl PARTICULAR PURPOSE.  See the GNU General Public License for more details.
m4_dnl
m4_dnl You should have received  a copy of the GNU General Public  License along with this
m4_dnl program.  If not, see <http://www.gnu.org/licenses/>.
m4_dnl


m4_dnl preamble

m4_changequote(`[[[', `]]]')
m4_changecom([[[/*]]],[[[*/]]])


m4_dnl helpers

m4_define([[[MMUX_M4_TOUPPER]]],[[[m4_translit([[[$1]]],[[[abcdefghijklmnopqrstuvwxyz]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]])]]])
m4_define([[[MMUX_M4_TOLOWER]]],[[[m4_translit([[[$1]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]],[[[abcdefghijklmnopqrstuvwxyz]]])]]])


m4_dnl helpers

m4_dnl $1 - Preprocessor symbol: if defined to 1, include the body of code; otherwise include the alternative body.
m4_dnl $2 - The body of code.
m4_dnl $3 - The alternative body of code.
m4_define([[[MMUX_CONDITIONAL_CODE]]],[[[m4_ifelse([[[$1]]],,[[[$2]]],[[[m4_dnl
#ifdef $1
$2
m4_ifelse([[[$3]]],,,[[[m4_dnl
#else
$3]]])m4_dnl
#endif]]])]]])

m4_dnl $1 - The lower case type stem.
m4_dnl $2 - The body of code.
m4_define([[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM]]],[[[#ifdef MMUX_CC_TYPES_HAS_[[[]]]MMUX_M4_TOUPPER($1)
$2
#endif]]])


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_pointer_t:		mmux_pointer_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM_FLONUMC]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_FLONUM]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_INTEGER_POINTER]]],[[[m4_dnl
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
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
	   mmux_pointer_t:		mmux_pointer_$1,		\
           mmux_time_t:			mmux_time_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
	   mmux_pointer_t *:		mmux_pointer_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_pointer_t:		mmux_pointer_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE2),							\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_pointer_t:		mmux_pointer_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE2),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_POINTER]]],[[[m4_dnl
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
	   mmux_byte_t:			mmux_byte_$1,			\
	   mmux_octet_t:		mmux_octet_$1,			\
           mmux_ssize_t:		mmux_ssize_$1,			\
           mmux_usize_t:		mmux_usize_$1,			\
           mmux_sintmax_t:		mmux_sintmax_$1,		\
           mmux_uintmax_t:		mmux_uintmax_$1,		\
           mmux_sintptr_t:		mmux_sintptr_$1,		\
           mmux_uintptr_t:		mmux_uintptr_$1,		\
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
	   mmux_pointer_t:		mmux_pointer_$1,		\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
	   mmux_pointer_t *:		mmux_pointer_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_pointer_t:		mmux_pointer_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_INTEGER_FLONUM_FLONUMC]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_INTEGER_FLONUM]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
	   mmux_libc_mode_t:		mmux_libc_mode_$1,		\
	   mmux_libc_pid_t:		mmux_libc_pid_$1,		\
	   mmux_libc_uid_t:		mmux_libc_uid_$1,		\
	   mmux_libc_gid_t:		mmux_libc_gid_$1,		\
	   mmux_libc_socklen_t:		mmux_libc_socklen_$1,		\
	   mmux_libc_rlim_t:		mmux_libc_rlim_$1,		\
	   mmux_libc_ino_t:		mmux_libc_ino_$1,		\
	   mmux_libc_dev_t:		mmux_libc_dev_$1,		\
	   mmux_libc_nlink_t:		mmux_libc_nlink_$1,		\
	   mmux_libc_blkcnt_t:		mmux_libc_blkcnt_$1,		\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
	   mmux_libc_mode_t *:		mmux_libc_mode_$1_p,		\
	   mmux_libc_pid_t *:		mmux_libc_pid_$1_p,		\
	   mmux_libc_uid_t *:		mmux_libc_uid_$1_p,		\
	   mmux_libc_gid_t *:		mmux_libc_gid_$1_p,		\
	   mmux_libc_socklen_t *:	mmux_libc_socklen_$1_p,		\
	   mmux_libc_rlim_t *:		mmux_libc_rlim_$1_p,		\
	   mmux_libc_ino_t *:		mmux_libc_ino_$1_p,		\
	   mmux_libc_dev_t *:		mmux_libc_dev_$1_p,		\
	   mmux_libc_nlink_t *:		mmux_libc_nlink_$1_p,		\
	   mmux_libc_blkcnt_t *:	mmux_libc_blkcnt_$1_p,		\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_pointer_t:		mmux_pointer_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_ARITHINT_FLONUM]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_FLONUM_FLONUMC]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
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

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_UNARY_FUNCTION_FLONUM]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE)						\
  (_Generic((VALUE),							\
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
           default:			mmux_ctype_generic_error)(VALUE))

#define mmux_ctype_$1_p(RESULT,VALUE)					\
  (_Generic((VALUE),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_pointer_t:		mmux_pointer_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM_FLONUMC]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_ARITHINT_FLONUM]]],[[[m4_dnl
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_FLONUM_FLONUMC]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
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

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_FLONUM]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE1),							\
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
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE1),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_BINARY_FUNCTION_FLONUM_SECOND_ARG]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2)					\
  (_Generic((VALUE2),							\
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
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2)				\
  (_Generic((VALUE2),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE1),(VALUE2)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC_POINTER]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1,			\
           mmux_pointer_t:		mmux_pointer_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
	   mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p,			\
           mmux_pointer_t *:		mmux_pointer_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_ARITHINT_FLONUM_FLONUMC]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_ARITHINT_FLONUM]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
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
           mmux_off_t:			mmux_off_$1,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_$1,		\
           mmux_wchar_t:		mmux_wchar_$1,			\
           mmux_wint_t:			mmux_wint_$1,			\
           mmux_time_t:			mmux_time_$1)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
	   mmux_char_t *:		mmux_char_$1_p,			\
           mmux_schar_t *:		mmux_schar_$1_p,		\
           mmux_uchar_t *:		mmux_uchar_$1_p,		\
           mmux_sshort_t *:		mmux_sshort_$1_p,		\
           mmux_ushort_t *:		mmux_ushort_$1_p,		\
           mmux_sint_t *:		mmux_sint_$1_p,			\
           mmux_uint_t *:		mmux_uint_$1_p,			\
           mmux_slong_t *:		mmux_slong_$1_p,		\
           mmux_ulong_t *:		mmux_ulong_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		mmux_sllong_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		mmux_ullong_$1_p,		\
]]])m4_dnl
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_sint8_t *:		mmux_sint8_$1_p,		\
	   mmux_uint8_t *:		mmux_uint8_$1_p,		\
	   mmux_sint16_t *:		mmux_sint16_$1_p,		\
	   mmux_uint16_t *:		mmux_uint16_$1_p,		\
	   mmux_sint32_t *:		mmux_sint32_$1_p,		\
	   mmux_uint32_t *:		mmux_uint32_$1_p,		\
	   mmux_sint64_t *:		mmux_sint64_$1_p,		\
	   mmux_uint64_t *:		mmux_uint64_$1_p,		\
	   mmux_byte_t *:		mmux_byte_$1_p,			\
	   mmux_octet_t *:		mmux_octet_$1_p,		\
           mmux_ssize_t *:		mmux_ssize_$1_p,		\
           mmux_usize_t *:		mmux_usize_$1_p,		\
           mmux_sintmax_t *:		mmux_sintmax_$1_p,		\
           mmux_uintmax_t *:		mmux_uintmax_$1_p,		\
           mmux_sintptr_t *:		mmux_sintptr_$1_p,		\
           mmux_uintptr_t *:		mmux_uintptr_$1_p,		\
           mmux_off_t *:		mmux_off_$1_p,			\
           mmux_ptrdiff_t *:		mmux_ptrdiff_$1_p,		\
           mmux_wchar_t *:		mmux_wchar_$1_p,		\
           mmux_wint_t *:		mmux_wint_$1_p,			\
           mmux_time_t *:		mmux_time_$1_p)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_FLONUM_FLONUMC]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
  (_Generic((VALUE1),							\
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

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
	   mmux_flonumcfl_t *:		mmux_flonumcfl_$1_p,		\
	   mmux_flonumcdb_t *:		mmux_flonumcdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		mmux_flonumcldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		mmux_flonumcf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		mmux_flonumcf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:	mmux_flonumcf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:	mmux_flonumcf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:	mmux_flonumcf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:	mmux_flonumcf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		mmux_flonumcd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		mmux_flonumcd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:	mmux_flonumcd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_define([[[DEFINE_GENERIC_TERNARY_FUNCTION_FLONUM]]],[[[m4_dnl
#define mmux_ctype_$1(VALUE1,VALUE2,VALUE3)				\
  (_Generic((VALUE1),							\
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
           default:			mmux_ctype_generic_error)((VALUE1),(VALUE2),(VALUE3)))

#define mmux_ctype_$1_p(RESULT,VALUE1,VALUE2,VALUE3)			\
  (_Generic((VALUE1),							\
           mmux_flonumfl_t *:		mmux_flonumfl_$1_p,		\
	   mmux_flonumdb_t *:		mmux_flonumdb_$1_p,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		mmux_flonumldb_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		mmux_flonumf32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		mmux_flonumf64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		mmux_flonumf128_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		mmux_flonumf32x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		mmux_flonumf64x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:	mmux_flonumf128x_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		mmux_flonumd32_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		mmux_flonumd64_$1_p,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		mmux_flonumd128_$1_p,		\
]]])m4_dnl
           default:			mmux_ctype_generic_error)((RESULT),(VALUE1),(VALUE2),(VALUE3)))
]]]) m4_dnl


m4_dnl let's go

m4_dnl end of file
m4_dnl Local Variables:
m4_dnl mode: m4
m4_dnl End:
m4_divert(0)m4_dnl
