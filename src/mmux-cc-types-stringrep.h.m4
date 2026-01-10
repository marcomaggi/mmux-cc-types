/*
  Part of: MMUX CC Types
  Contents: string representation facilities
  Date: Sep 14, 2025

  Abstract

	This  public header  file  declares  the string  representation  API.  It  is
	included in the main header file; it must not be included by itself.

  Copyright (C) 2024, 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_CC_TYPES_STRINGREP_H
#define MMUX_CC_TYPES_STRINGREP_H 1


/** --------------------------------------------------------------------
 ** String parsers, sprinters, fd output, stream output.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STRINGREP_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
mmux_cc_types_decl bool mmux_$1_parse  (mmux_$1_t * p_value, mmux_asciizcp_t s_value, mmux_asciizcp_t who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_types_decl bool mmux_string_is_$1 (mmux_asciizcp_t s_value)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_$1_sprint (mmux_asciizp_t ptr, mmux_usize_t len, mmux_$1_t value)
  __attribute__((__nonnull__(1),__warn_unused_result__));

mmux_cc_types_decl bool mmux_$1_sprint_size (mmux_usize_t * result_required_size_p, mmux_$1_t value)
  __attribute__((__nonnull__(1),__warn_unused_result__));

mmux_cc_types_decl bool mmux_$1_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p,
						  bool * is_negative,
						  mmux_$1_t op, mmux_uint_t base)
  __attribute__((__nonnull__(1),__warn_unused_result__));

mmux_cc_types_decl bool mmux_$1_dprintf_with_base (int fd, mmux_$1_t op, mmux_uint_t base)
  __attribute__((__warn_unused_result__));

mmux_cc_types_decl bool mmux_$1_dprintf (mmux_standard_sint_t fd_num, mmux_$1_t value)
  __attribute__((__warn_unused_result__));

mmux_cc_types_inline_no_retval_decl void
mmux_$1_dprintf_no_error (mmux_standard_sint_t fd_num, mmux_$1_t value)
{
  mmux_cc_types_ignore_retval(mmux_$1_dprintf(fd_num, value));
}

mmux_cc_types_decl bool mmux_$1_fprintf (mmux_pointer_t stream, mmux_$1_t value)
  __attribute__((__nonnull__(1),__warn_unused_result__));

mmux_cc_types_decl bool mmux_$1_sprint (mmux_asciizp_t ptr, mmux_usize_t len, mmux_$1_t value)
  __attribute__((__nonnull__(1),__warn_unused_result__));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STRINGREP_PROTOS([[[pointer]]])
DEFINE_STRINGREP_PROTOS([[[ascii]]])
DEFINE_STRINGREP_PROTOS([[[char]]])
DEFINE_STRINGREP_PROTOS([[[schar]]])
DEFINE_STRINGREP_PROTOS([[[uchar]]])
DEFINE_STRINGREP_PROTOS([[[sshort]]])
DEFINE_STRINGREP_PROTOS([[[ushort]]])
DEFINE_STRINGREP_PROTOS([[[sint]]])
DEFINE_STRINGREP_PROTOS([[[uint]]])
DEFINE_STRINGREP_PROTOS([[[slong]]])
DEFINE_STRINGREP_PROTOS([[[ulong]]])
DEFINE_STRINGREP_PROTOS([[[sllong]]])
DEFINE_STRINGREP_PROTOS([[[ullong]]])

DEFINE_STRINGREP_PROTOS([[[sint8]]])
DEFINE_STRINGREP_PROTOS([[[uint8]]])
DEFINE_STRINGREP_PROTOS([[[sint16]]])
DEFINE_STRINGREP_PROTOS([[[uint16]]])
DEFINE_STRINGREP_PROTOS([[[sint32]]])
DEFINE_STRINGREP_PROTOS([[[uint32]]])
DEFINE_STRINGREP_PROTOS([[[sint64]]])
DEFINE_STRINGREP_PROTOS([[[uint64]]])

DEFINE_STRINGREP_PROTOS([[[byte]]])
DEFINE_STRINGREP_PROTOS([[[octet]]])

DEFINE_STRINGREP_PROTOS([[[ssize]]])
DEFINE_STRINGREP_PROTOS([[[usize]]])
DEFINE_STRINGREP_PROTOS([[[sintmax]]])
DEFINE_STRINGREP_PROTOS([[[uintmax]]])
DEFINE_STRINGREP_PROTOS([[[sintptr]]])
DEFINE_STRINGREP_PROTOS([[[uintptr]]])
DEFINE_STRINGREP_PROTOS([[[libc_mode]]])
DEFINE_STRINGREP_PROTOS([[[off]]])
DEFINE_STRINGREP_PROTOS([[[libc_pid]]])
DEFINE_STRINGREP_PROTOS([[[libc_uid]]])
DEFINE_STRINGREP_PROTOS([[[libc_gid]]])
DEFINE_STRINGREP_PROTOS([[[ptrdiff]]])
DEFINE_STRINGREP_PROTOS([[[wchar]]])
DEFINE_STRINGREP_PROTOS([[[wint]]])
DEFINE_STRINGREP_PROTOS([[[time]]])
DEFINE_STRINGREP_PROTOS([[[clock]]])
DEFINE_STRINGREP_PROTOS([[[libc_socklen]]])
DEFINE_STRINGREP_PROTOS([[[libc_rlim]]])
DEFINE_STRINGREP_PROTOS([[[libc_ino]]])
DEFINE_STRINGREP_PROTOS([[[libc_dev]]])
DEFINE_STRINGREP_PROTOS([[[libc_nlink]]])
DEFINE_STRINGREP_PROTOS([[[libc_blkcnt]]])

DEFINE_STRINGREP_PROTOS([[[flonumfl]]])
DEFINE_STRINGREP_PROTOS([[[flonumdb]]])
DEFINE_STRINGREP_PROTOS([[[flonumldb]]])

DEFINE_STRINGREP_PROTOS([[[flonumf32]]])
DEFINE_STRINGREP_PROTOS([[[flonumf64]]])
DEFINE_STRINGREP_PROTOS([[[flonumf128]]])

DEFINE_STRINGREP_PROTOS([[[flonumf32x]]])
DEFINE_STRINGREP_PROTOS([[[flonumf64x]]])
DEFINE_STRINGREP_PROTOS([[[flonumf128x]]])

DEFINE_STRINGREP_PROTOS([[[flonumcfl]]])
DEFINE_STRINGREP_PROTOS([[[flonumcdb]]])
DEFINE_STRINGREP_PROTOS([[[flonumcldb]]])

DEFINE_STRINGREP_PROTOS([[[flonumcf32]]])
DEFINE_STRINGREP_PROTOS([[[flonumcf64]]])
DEFINE_STRINGREP_PROTOS([[[flonumcf128]]])

DEFINE_STRINGREP_PROTOS([[[flonumcf32x]]])
DEFINE_STRINGREP_PROTOS([[[flonumcf64x]]])
DEFINE_STRINGREP_PROTOS([[[flonumcf128x]]])


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-stringrep.h>
#endif


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating point numbers.
 ** ----------------------------------------------------------------- */

#undef  MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN
#define MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN		(1+8)

m4_divert(-1)
m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
mmux_cc_types_decl bool mmux_$1_set_output_format (mmux_asciizcp_t new_result_format, mmux_asciizcp_t who)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl mmux_asciizcp_t mmux_$1_ref_output_format  (void);
mmux_cc_types_decl void            mmux_$1_save_output_format (char * dest);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumfl]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumdb]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumldb]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf128]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf32x]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf64x]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumf128x]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumd32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumd64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS([[[flonumd128]]])


/** --------------------------------------------------------------------
 ** Generic macros.
 ** ----------------------------------------------------------------- */

DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG_NO_RESULT([[[fprintf]]])
DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG_NO_RESULT([[[dprintf]]])
DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG_NO_RESULT([[[dprintf_no_error]]])


/** --------------------------------------------------------------------
 ** Generic macros: type name inspection.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_typedef_name(VALUE)					\
  (_Generic((VALUE),							\
           mmux_pointer_t:		"mmux_pointer_t",		\
	   mmux_ascii_t:		"mmux_ascii_t",			\
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
	   mmux_flonumfl_t:		"mmux_flonumfl_t",		\
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
           mmux_libc_mode_t:		"mmux_libc_mode_t",		\
           mmux_off_t:			"mmux_off_t",			\
           mmux_libc_pid_t:		"mmux_libc_pid_t",		\
           mmux_libc_uid_t:		"mmux_libc_uid_t",		\
           mmux_libc_gid_t:		"mmux_libc_gid_t",		\
           mmux_ptrdiff_t:		"mmux_ptrdiff_t",		\
           mmux_wchar_t:		"mmux_wchar_t",			\
           mmux_wint_t:			"mmux_wint_t",			\
           mmux_time_t:			"mmux_time_t",			\
           mmux_clock_t:		"mmux_clock_t",			\
           mmux_libc_socklen_t:		"mmux_libc_socklen_t",		\
           mmux_libc_rlim_t:		"mmux_libc_rlim_t",		\
           mmux_libc_ino_t:		"mmux_libc_ino_t",		\
           mmux_libc_dev_t:		"mmux_libc_dev_t",		\
           mmux_libc_nlink_t:		"mmux_libc_nlink_t",		\
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

#define mmux_ctype_typedef_name_p(VALUE)					\
  (_Generic((VALUE),							\
           mmux_pointer_t *:		"mmux_pointer_t",		\
	   mmux_ascii_t *:		"mmux_ascii_t",			\
	   mmux_char_t *:		"mmux_char_t",			\
           mmux_schar_t *:		"mmux_schar_t",			\
           mmux_uchar_t *:		"mmux_uchar_t",			\
           mmux_sshort_t *:		"mmux_sshort_t",		\
           mmux_ushort_t *:		"mmux_ushort_t",		\
           mmux_sint_t *:			"mmux_sint_t",			\
           mmux_uint_t *:			"mmux_uint_t",			\
           mmux_slong_t *:		"mmux_slong_t",			\
           mmux_ulong_t *:		"mmux_ulong_t",			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		"mmux_sllong_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		"mmux_ullong_t",		\
]]])m4_dnl
	   mmux_flonumfl_t *:		"mmux_flonumfl_t",		\
	   mmux_flonumdb_t *:		"mmux_flonumdb_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		"mmux_flonumldb_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		"mmux_flonumf32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		"mmux_flonumf64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		"mmux_flonumf128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		"mmux_flonumf32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		"mmux_flonumf64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		"mmux_flonumf128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		"mmux_flonumd32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		"mmux_flonumd64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		"mmux_flonumd128_t",		\
]]])m4_dnl
	   mmux_sint8_t *:		"mmux_sint8_t",			\
	   mmux_uint8_t *:		"mmux_uint8_t",			\
	   mmux_sint16_t *:		"mmux_sint16_t",		\
	   mmux_uint16_t *:		"mmux_uint16_t",		\
	   mmux_sint32_t *:		"mmux_sint32_t",		\
	   mmux_uint32_t *:		"mmux_uint32_t",		\
	   mmux_sint64_t *:		"mmux_sint64_t",		\
	   mmux_uint64_t *:		"mmux_uint64_t",		\
	   mmux_byte_t *:			"mmux_byte_t",			\
	   mmux_octet_t *:		"mmux_octet_t",			\
           mmux_ssize_t *:		"mmux_ssize_t",			\
           mmux_usize_t *:		"mmux_usize_t",			\
           mmux_sintmax_t *:		"mmux_sintmax_t",		\
           mmux_uintmax_t *:		"mmux_uintmax_t",		\
           mmux_sintptr_t *:		"mmux_sintptr_t",		\
           mmux_uintptr_t *:		"mmux_uintptr_t",		\
           mmux_libc_mode_t *:		"mmux_libc_mode_t",		\
           mmux_off_t *:			"mmux_off_t",			\
           mmux_libc_pid_t *:		"mmux_libc_pid_t",		\
           mmux_libc_uid_t *:		"mmux_libc_uid_t",		\
           mmux_libc_gid_t *:		"mmux_libc_gid_t",		\
           mmux_ptrdiff_t *:		"mmux_ptrdiff_t",		\
           mmux_wchar_t *:		"mmux_wchar_t",			\
           mmux_wint_t *:			"mmux_wint_t",			\
           mmux_time_t *:			"mmux_time_t",			\
           mmux_clock_t *:		"mmux_clock_t",			\
           mmux_libc_socklen_t *:		"mmux_libc_socklen_t",		\
           mmux_libc_rlim_t *:		"mmux_libc_rlim_t",		\
           mmux_libc_ino_t *:		"mmux_libc_ino_t",		\
           mmux_libc_dev_t *:		"mmux_libc_dev_t",		\
           mmux_libc_nlink_t *:		"mmux_libc_nlink_t",		\
           mmux_libc_blkcnt_t *:		"mmux_libc_blkcnt_t",		\
	   mmux_flonumcfl_t *:		"mmux_flonumcfl_t",		\
	   mmux_flonumcdb_t *:		"mmux_flonumcdb_t",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		"mmux_flonumcldb_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		"mmux_flonumcf32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		"mmux_flonumcf64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		"mmux_flonumcf128_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		"mmux_flonumcf32x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		"mmux_flonumcf64x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		"mmux_flonumcf128x_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		"mmux_flonumcd32_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		"mmux_flonumcd64_t",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		"mmux_flonumcd128_t",		\
]]])m4_dnl
           default:			"<unspecified>"))

/* ------------------------------------------------------------------ */

#define mmux_ctype_stem_name(VALUE)				\
  (_Generic((VALUE),						\
           mmux_pointer_t:		"pointer",		\
	   mmux_ascii_t:		"ascii",			\
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
           mmux_libc_mode_t:		"libc_mode",		\
           mmux_off_t:			"off",			\
           mmux_libc_pid_t:		"libc_pid",		\
           mmux_libc_uid_t:		"libc_uid",		\
           mmux_libc_gid_t:		"libc_gid",		\
           mmux_ptrdiff_t:		"ptrdiff",		\
           mmux_wchar_t:		"wchar",		\
           mmux_wint_t:			"wint",			\
           mmux_time_t:			"time",			\
           mmux_clock_t:		"clock",		\
           mmux_libc_socklen_t:		"libc_socklen",		\
           mmux_libc_rlim_t:		"libc_rlim",		\
           mmux_libc_ino_t:		"libc_ino",		\
           mmux_libc_dev_t:		"libc_dev",		\
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

#define mmux_ctype_stem_name_p(VALUE)				\
  (_Generic((VALUE),						\
           mmux_pointer_t *:		"pointer",		\
	   mmux_ascii_t *:		"ascii",			\
	   mmux_char_t *:		"char",			\
           mmux_schar_t *:		"schar",		\
           mmux_uchar_t *:		"uchar",		\
           mmux_sshort_t *:		"sshort",		\
           mmux_ushort_t *:		"ushort",		\
           mmux_sint_t *:			"sint",			\
           mmux_uint_t *:			"uint",			\
           mmux_slong_t *:		"slong",		\
           mmux_ulong_t *:		"ulong",		\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t *:		"sllong",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t *:		"ullong",		\
]]])m4_dnl
	   mmux_flonumfl_t *:		"flonumfl",		\
	   mmux_flonumdb_t *:		"flonumdb",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t *:		"flonumldb",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t *:		"flonumf32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t *:		"flonumf64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t *:		"flonumf128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t *:		"flonumf32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t *:		"flonumf64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t *:		"flonumf128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t *:		"flonumd32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t *:		"flonumd64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t *:		"flonumd128",		\
]]])m4_dnl
	   mmux_sint8_t *:		"sint8",		\
	   mmux_uint8_t *:		"uint8",		\
	   mmux_sint16_t *:		"sint16",		\
	   mmux_uint16_t *:		"uint16",		\
	   mmux_sint32_t *:		"sint32",		\
	   mmux_uint32_t *:		"uint32",		\
	   mmux_sint64_t *:		"sint64",		\
	   mmux_uint64_t *:		"uint64",		\
           mmux_byte_t *:			"byte",			\
	   mmux_octet_t *:		"octet",		\
           mmux_ssize_t *:		"ssize_t",		\
           mmux_usize_t *:		"usize_t",		\
           mmux_sintmax_t *:		"sintmax",		\
           mmux_uintmax_t *:		"uintmax",		\
           mmux_sintptr_t *:		"sintptr",		\
           mmux_uintptr_t *:		"uintptr",		\
           mmux_libc_mode_t *:		"libc_mode",		\
           mmux_off_t *:			"off",			\
           mmux_libc_pid_t *:		"libc_pid",		\
           mmux_libc_uid_t *:		"libc_uid",		\
           mmux_libc_gid_t *:		"libc_gid",		\
           mmux_ptrdiff_t *:		"ptrdiff",		\
           mmux_wchar_t *:		"wchar",		\
           mmux_wint_t *:			"wint",			\
           mmux_time_t *:			"time",			\
           mmux_clock_t *:		"clock",		\
           mmux_libc_socklen_t *:		"libc_socklen",		\
           mmux_libc_rlim_t *:		"libc_rlim",		\
           mmux_libc_ino_t *:		"libc_ino",		\
           mmux_libc_dev_t *:		"libc_dev",		\
           mmux_libc_nlink_t *:		"libc_nlink",		\
           mmux_libc_blkcnt_t *:		"libc_blkcnt",		\
	   mmux_flonumcfl_t *:		"flonumcfl",		\
	   mmux_flonumcdb_t *:		"flonumcdb",		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t *:		"flonumcldb",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t *:		"flonumcf32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t *:		"flonumcf64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t *:		"flonumcf128",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t *:		"flonumcf32x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t *:		"flonumcf64x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t *:		"flonumcf128x",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t *:		"flonumcd32",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t *:		"flonumcd64",		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t *:		"flonumcd128",		\
]]])m4_dnl
           default:			"<unspecified>"))


/** --------------------------------------------------------------------
 ** Generic macros: string representation.
 ** ----------------------------------------------------------------- */

#define mmux_ctype_sprint(BUFPTR,BUFLEN,VALUE)					\
  _Generic((VALUE),								\
	   mmux_pointer_t:		mmux_pointer_sprint,			\
	   mmux_ascii_t:		mmux_ascii_sprint,			\
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
	   mmux_flonumf128x_t:		mmux_flonumf128x_sprint,		\
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
           mmux_libc_mode_t:		mmux_libc_mode_sprint,			\
           mmux_off_t:			mmux_off_sprint,			\
           mmux_libc_pid_t:		mmux_libc_pid_sprint,			\
           mmux_libc_uid_t:		mmux_libc_uid_sprint,			\
           mmux_libc_gid_t:		mmux_libc_gid_sprint,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint,			\
           mmux_wchar_t:		mmux_wchar_sprint,			\
           mmux_wint_t:			mmux_wint_sprint,			\
           mmux_time_t:			mmux_time_sprint,			\
           mmux_clock_t:		mmux_clock_sprint,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint,		\
           mmux_libc_rlim_t:		mmux_libc_rlim_sprint,			\
           mmux_libc_ino_t:		mmux_libc_ino_sprint,			\
           mmux_libc_dev_t:		mmux_libc_dev_sprint,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint,			\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_sprint,		\
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
	   mmux_ascii_t:		mmux_ascii_sprint_size,			\
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
	   mmux_flonumfl_t:		mmux_flonumfl_sprint_size,		\
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
           mmux_libc_mode_t:		mmux_libc_mode_sprint_size,		\
           mmux_off_t:			mmux_off_sprint_size,			\
           mmux_libc_pid_t:		mmux_libc_pid_sprint_size,		\
           mmux_libc_uid_t:		mmux_libc_uid_sprint_size,		\
           mmux_libc_gid_t:		mmux_libc_gid_sprint_size,		\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_size,		\
           mmux_wchar_t:		mmux_wchar_sprint_size,			\
           mmux_wint_t:			mmux_wint_sprint_size,			\
           mmux_time_t:			mmux_time_sprint_size,			\
           mmux_clock_t:		mmux_clock_sprint_size,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint_size,		\
           mmux_libc_rlim_t:		mmux_libc_rlim_sprint_size,		\
           mmux_libc_ino_t:		mmux_libc_ino_sprint_size,		\
           mmux_libc_dev_t:		mmux_libc_dev_sprint_size,		\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint_size,		\
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
	   mmux_ascii_t:		mmux_ascii_sprint_with_base,			\
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
           mmux_libc_mode_t:		mmux_libc_mode_sprint_with_base,		\
           mmux_off_t:			mmux_off_sprint_with_base,			\
           mmux_libc_pid_t:		mmux_libc_pid_sprint_with_base,			\
           mmux_libc_uid_t:		mmux_libc_uid_sprint_with_base,			\
           mmux_libc_gid_t:		mmux_libc_gid_sprint_with_base,			\
           mmux_ptrdiff_t:		mmux_ptrdiff_sprint_with_base,			\
           mmux_wchar_t:		mmux_wchar_sprint_with_base,			\
           mmux_wint_t:			mmux_wint_sprint_with_base,			\
           mmux_time_t:			mmux_time_sprint_with_base,			\
           mmux_clock_t:		mmux_clock_sprint_with_base,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_sprint_with_base,		\
           mmux_libc_rlim_t:		mmux_libc_rlim_sprint_with_base,		\
           mmux_libc_ino_t:		mmux_libc_ino_sprint_with_base,			\
           mmux_libc_dev_t:		mmux_libc_dev_sprint_with_base,			\
           mmux_libc_nlink_t:		mmux_libc_nlink_sprint_with_base,		\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_sprint_with_base)((BUFPTR),(BUFLEN_P),(IS_NEGATIVE_P),(VALUE),(BASE))

/* ------------------------------------------------------------------ */

#define mmux_ctype_dprintf_with_base(FD,VALUE,BASE)					\
  _Generic((VALUE),									\
	   mmux_pointer_t:		mmux_pointer_dprintf_with_base,			\
	   mmux_ascii_t:		mmux_ascii_dprintf_with_base,			\
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
           mmux_libc_mode_t:		mmux_libc_mode_dprintf_with_base,		\
           mmux_off_t:			mmux_off_dprintf_with_base,			\
           mmux_libc_pid_t:		mmux_libc_pid_dprintf_with_base,		\
           mmux_libc_uid_t:		mmux_libc_uid_dprintf_with_base,		\
           mmux_libc_gid_t:		mmux_libc_gid_dprintf_with_base,		\
           mmux_ptrdiff_t:		mmux_ptrdiff_dprintf_with_base,			\
           mmux_wchar_t:		mmux_wchar_dprintf_with_base,			\
           mmux_wint_t:			mmux_wint_dprintf_with_base,			\
           mmux_time_t:			mmux_time_dprintf_with_base,			\
           mmux_clock_t:		mmux_clock_dprintf_with_base,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_dprintf_with_base,		\
           mmux_libc_rlim_t:		mmux_libc_rlim_dprintf_with_base,		\
           mmux_libc_ino_t:		mmux_libc_ino_dprintf_with_base,		\
           mmux_libc_dev_t:		mmux_libc_dev_dprintf_with_base,		\
           mmux_libc_nlink_t:		mmux_libc_nlink_dprintf_with_base,		\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_dprintf_with_base)((FD),(VALUE),(BASE))


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_STRINGREP_H */

/* end of file */
