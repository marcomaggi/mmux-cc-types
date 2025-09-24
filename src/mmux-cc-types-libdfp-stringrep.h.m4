/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Sep 20, 2025

  Abstract

	String representation handling for "_DecimalN" types.

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

#ifndef MMUX_CC_TYPES_LIBDFP_STRINGS_H
#define MMUX_CC_TYPES_LIBDFP_STRINGS_H 1


/** --------------------------------------------------------------------
 ** Standard types adapters: sprinter and parser.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_PROTOS]]],[[[
mmux_cc_types_decl mmux_standard_sint_t mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p,
								 size_t size, mmux_asciizcp_t restrict format,
								 mmux_standard_flonum$1_t value)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_flonum$1_t mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value,
								   mmux_asciizpp_t restrict tailptr)
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_PROTOS(d32)
DEFINE_STANDARD_STRING_TO_FROM_PROTOS(d64)
DEFINE_STANDARD_STRING_TO_FROM_PROTOS(d128)

m4_divert(-1)
m4_define([[[DEFINE_STRINGREP_PRINTING_PROTOS]]],[[[m4_dnl
mmux_cc_types_decl bool mmux_string_is_flonum$1 (mmux_asciizcp_t s_value);

mmux_cc_types_decl bool mmux_flonum$1_parse  (mmux_flonum$1_t * p_value, mmux_asciizcp_t s_value, mmux_asciizcp_t who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_types_decl bool mmux_flonum$1_sprint (mmux_asciizp_t ptr, mmux_usize_t len, mmux_flonum$1_t value)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl bool mmux_flonum$1_sprint_size (mmux_usize_t *result_required_size_p, mmux_flonum$1_t value);

mmux_cc_types_decl bool mmux_flonum$1_dprintf (mmux_standard_sint_t fd, mmux_flonum$1_t value);

mmux_cc_types_decl bool mmux_flonum$1_fprintf (void * stream, mmux_flonum$1_t value)
  __attribute__((__nonnull__(1)));
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STRINGREP_PRINTING_PROTOS(d32)
DEFINE_STRINGREP_PRINTING_PROTOS(d64)
DEFINE_STRINGREP_PRINTING_PROTOS(d128)
DEFINE_STRINGREP_PRINTING_PROTOS(cd32)
DEFINE_STRINGREP_PRINTING_PROTOS(cd64)
DEFINE_STRINGREP_PRINTING_PROTOS(cd128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* define MMUX_CC_TYPES_LIBDFP_STRINGS_H */

/* end of file */
