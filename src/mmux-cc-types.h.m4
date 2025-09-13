/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Oct 17, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

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

#ifndef MMUX_CC_TYPES_H
#define MMUX_CC_TYPES_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-config.h>


/** --------------------------------------------------------------------
 ** Library management.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_cc_types_init (void)
  __attribute__((__constructor__));

mmux_cc_types_decl void mmux_cc_types_final (void)
  __attribute__((__destructor__));

mmux_cc_types_decl char const *	mmux_cc_types_version_string		(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_current	(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_revision(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_age	(void);

mmux_cc_types_decl int mmux_ctype_generic_error (...);

/* This is a helper to make it easier to debug inline functions defined by the header
   files when we do not include the standard headers. */
mmux_cc_types_decl int mmux_cc_types_dprintf (int fd, char const * restrict fmt, ...);


/** --------------------------------------------------------------------
 ** Some includes (more later).
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-typedefs.h>


/** --------------------------------------------------------------------
 ** Prototypes typedefs.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_PROTOTYPES_TYPEDEFS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
typedef mmux_standard_$1_t mmux_cc_types_nullary_operation_standard_$1_t (void);
typedef mmux_standard_$1_t mmux_cc_types_unary_operation_standard_$1_t   (mmux_standard_$1_t op1);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_standard_$1_t  (mmux_standard_$1_t op1, mmux_standard_$1_t op2);
typedef mmux_standard_$1_t mmux_cc_types_binary_sint_operation_standard_$1_t (mmux_standard_sint_t op1, mmux_standard_$1_t op2);
typedef mmux_standard_$1_t mmux_cc_types_ternary_operation_standard_$1_t (mmux_standard_$1_t op1, mmux_standard_$1_t op2, mmux_standard_$1_t op3);
typedef bool mmux_cc_types_unary_predicate_standard_$1_t   (mmux_standard_$1_t op1);
typedef bool mmux_cc_types_binary_predicate_standard_$1_t  (mmux_standard_$1_t op1, mmux_standard_$1_t op2);
typedef bool mmux_cc_types_ternary_predicate_standard_$1_t (mmux_standard_$1_t op1, mmux_standard_$1_t op2, mmux_standard_$1_t op3);
typedef mmux_sint_t mmux_cc_types_comparison_standard_$1_t (mmux_standard_$1_t op1, mmux_standard_$1_t op2);

typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t op1);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t op1, mmux_$1_t op2);
typedef mmux_$1_t mmux_cc_types_binary_sint_operation_$1_t (mmux_sint_t op1, mmux_$1_t op2);
typedef mmux_$1_t mmux_cc_types_ternary_operation_$1_t (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t op3);
typedef bool mmux_cc_types_unary_predicate_$1_t   (mmux_$1_t op1);
typedef bool mmux_cc_types_binary_predicate_$1_t  (mmux_$1_t op1, mmux_$1_t op2);
typedef bool mmux_cc_types_ternary_predicate_$1_t (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t op3);
typedef mmux_sint_t mmux_cc_types_comparison_$1_t (mmux_$1_t op1, mmux_$1_t op2);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_PROTOTYPES_TYPEDEFS([[[pointer]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[char]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[schar]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uchar]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sshort]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[ushort]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sint]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uint]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[slong]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[ulong]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumfl]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumdb]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumf128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcfl]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcdb]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[flonumcf128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[sint8]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uint8]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sint16]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uint16]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sint32]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uint32]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sint64]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uint64]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[byte]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[octet]]])

DEFINE_PROTOTYPES_TYPEDEFS([[[ssize]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[usize]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sintmax]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uintmax]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[sintptr]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uintptr]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[mode]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[off]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[pid]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[uid]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[gid]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[ptrdiff]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[wchar]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[wint]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[time]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[socklen]]])
DEFINE_PROTOTYPES_TYPEDEFS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Include files.
 ** ----------------------------------------------------------------- */

/* Order is important here!  There are a lot of inline functions. */

#include <mmux-cc-types-complex.h>
#include <mmux-cc-types-constants.h>
#include <mmux-cc-types-sign-predicates.h>
#include <mmux-cc-types-arithmetics.h>
#include <mmux-cc-types-comparison.h>
#include <mmux-cc-types-mathematics.h>
#include <mmux-cc-types-bitwise.h>
#include <mmux-cc-types-generics.h>

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp.h>
#endif


/** --------------------------------------------------------------------
 ** Type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_dnl $1 - type stem
m4_define([[[DEFINE_TYPE_PROTOS_ALL_NUMBERS]]],[[[m4_dnl
mmux_cc_types_decl bool mmux_string_is_$1 (mmux_asciizcp_t s_value);
__attribute__((__const,__always_inline__)) static inline
mmux_sint_t mmux_$1_constant_sizeof (void)
{
  return mmux_sint(sizeof(mmux_$1_t));
}
mmux_cc_types_decl bool mmux_$1_parse  (mmux_$1_t * p_value, mmux_asciizcp_t s_value, mmux_asciizcp_t who)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl bool mmux_$1_sprint (mmux_asciizp_t ptr, mmux_sint_t len, mmux_$1_t value)
  __attribute__((__nonnull__(1)));
mmux_cc_types_decl mmux_sint_t mmux_$1_sprint_size (mmux_$1_t value);
mmux_cc_types_decl bool mmux_$1_dprintf (mmux_standard_sint_t fd, mmux_$1_t value);
mmux_cc_types_decl bool mmux_$1_fprintf (mmux_pointer_t stream, mmux_$1_t value)
  __attribute__((__nonnull__(1)));
]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_REAL_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
mmux_cc_types_decl mmux_cc_types_unary_operation_$1_t	mmux_$1_absolute	__attribute__((__const__));
]]])]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
]]])]]])

m4_dnl ----------------------------------------------------------------
m4_divert(0)m4_dnl
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[char]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumfl]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumdb]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcfl]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcdb]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[flonumcf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint8]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint8]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint16]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint16]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint64]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[byte]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[octet]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ssize]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[usize]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sintmax]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uintmax]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sintptr]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uintptr]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[mode]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[off]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[pid]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uid]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[gid]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ptrdiff]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[wchar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[wint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[time]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[socklen]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating point numbers.
 ** ----------------------------------------------------------------- */

#undef  MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN
#define MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN		(1+8)

m4_divert(-1)
m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_VARS_AND_PROTOS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
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
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_TYPES_H */

/* end of file */
