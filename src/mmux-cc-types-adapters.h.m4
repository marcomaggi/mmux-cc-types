/*
  Part of: MMUX CC Types
  Contents: private header file
  Date: Aug 22, 2025

  Abstract

	This header file is for internal definitions.

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

#ifndef MMUX_CC_TYPES_ADAPTERS_H
#define MMUX_CC_TYPES_ADAPTERS_H 1


/** --------------------------------------------------------------------
 ** Sprinter and parser adapters.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
__attribute__((__const__,__always_inline__))
static inline mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return $2(result_p, size, format, value);
}
__attribute__((__const__,__always_inline__))
static inline mmux_standard_flonum$1_t
mmux_standard_strto$1 (mmux_asciizcp_t restrict s_input_value, mmux_asciizpp_t restrict tailptr)
{
  return $3(s_input_value, tailptr);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(fl,	strfromf,	strtof)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(db,	strfromd,	strtod)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(ldb,	strfroml,	strtold)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f32,	strfromf32,	strtof32)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f64,	strfromf64,	strtof64)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f128,	strfromf128,	strtof128)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f32x,	strfromf32x,	strtof32x)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f64x,	strfromf64x,	strtof64x)
DEFINE_STANDARD_STRING_TO_FROM_FUNCTIONS(f128x,	strfromf128x,	strtof128x)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_ADAPTERS_H */

/* end of file */
