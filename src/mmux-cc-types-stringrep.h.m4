/*
  Part of: MMUX CC Types
  Contents: string representation facilities
  Date: Sep 14, 2025

  Abstract

	This  public header  file  declares  the string  representation  API.  It  is
	included in the main header file; it must not be included by itself.

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
  __attribute__((__nonnull__(1)));
mmux_cc_types_decl bool mmux_$1_sprint_size (mmux_usize_t * result_required_size_p, mmux_$1_t value)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl bool mmux_$1_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p,
						  bool * is_negative,
						  mmux_$1_t op, mmux_uint_t const base)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl bool mmux_$1_dprintf_with_base (int fd, mmux_$1_t op, mmux_uint_t const base);

mmux_cc_types_decl bool mmux_$1_dprintf (mmux_standard_sint_t fd, mmux_$1_t value);
mmux_cc_types_decl bool mmux_$1_fprintf (mmux_pointer_t stream, mmux_$1_t value)
  __attribute__((__nonnull__(1)));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STRINGREP_PROTOS([[[pointer]]])
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

DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG([[[fprintf]]])
DEFINE_GENERIC_BINARY_FUNCTION_INTEGER_FLONUM_FLONUMC_POINTER_SECOND_ARG([[[dprintf]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* defined MMUX_CC_TYPES_STRINGREP_H */

/* end of file */
