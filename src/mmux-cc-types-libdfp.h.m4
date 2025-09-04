/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Aug 16, 2025

  Abstract

	This is the public header file  defining the API of "_DecimalN" types support
	in  the library  MMUX  CC  Types; it  is  included  by "mmux-cc-types.h"  and
	"mmux-cc-types-libdfp.c"; it must not be included by itself.

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

#ifndef MMUX_CC_TYPES_LIBDFP_H
#define MMUX_CC_TYPES_LIBDFP_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

/* NOTE These are duplicates of the definitions in "mmux-cc-types.h"; they are needed
   for  the functinos  below.  I  do know  that it  is ugly.   (Marco Maggi;  Aug 21,
   2025) */
typedef signed int		mmux_standard_sint_t;
typedef struct mmux_char_t { char value; } mmux_char_t;
typedef struct mmux_sint_t { int  value; } mmux_sint_t;
#  undef  mmux_sint
#  define mmux_sint(VALUE)		((mmux_sint_t){ .value = (VALUE) })
typedef char *			mmux_asciizp_t;
typedef char **			mmux_asciizpp_t;
typedef char ***		mmux_asciizppp_t;
typedef char const *		mmux_asciicp_t;
typedef char const **		mmux_asciicpp_t;
typedef char const ***		mmux_asciicppp_t;
typedef char const *		mmux_asciizcp_t;
typedef char const **		mmux_asciizcpp_t;
typedef char const ***		mmux_asciizcppp_t;


/** --------------------------------------------------------------------
 ** Standard types definitions: typedefs, literals, makers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_TYPE]]],[[[
__extension__ typedef _Decimal$1	mmux_standard_flonumd$1_t;

typedef struct mmux_standard_flonumcd$1_t {
  mmux_standard_flonumd$1_t	re;
  mmux_standard_flonumd$1_t	im;
} mmux_standard_flonumcd$1_t;

typedef mmux_standard_flonumd$1_t		mmux_standard_flonumcd$1_part_t;

typedef struct mmux_flonumd$1_t	 { mmux_standard_flonumd$1_t	value; } mmux_flonumd$1_t;
typedef struct mmux_flonumcd$1_t { mmux_standard_flonumcd$1_t	value; } mmux_flonumcd$1_t;
typedef mmux_flonumd$1_t	mmux_flonumcd$1_part_t;

#define mmux_standard_flonumd$1_literal(VALUE)		(VALUE ## $2)
#define mmux_standard_flonumcd$1_part_literal(VALUE)	(mmux_standard_flonumd$1_literal(VALUE))

/* NOTE I would really like to define the maker as an inline function.  Because.  But
 * with the function we cannot declare a  new variable as "constexpr", while with the
 * macro we can.  For example, the following code:
 *
 *  constexpr auto	X = mmux_flonumd32(1024);
 *
 * works fine  under GCC-C23  with macros,  it does  not work  with functions.   I am
 * disappointed, but for now "constexpr" wins.  (Marco Maggi; Aug 20, 2025)
 */

#define mmux_standard_flonumd$1(STANDARD_DECIMAL)	((mmux_standard_flonumd$1_t)(STANDARD_DECIMAL))
#define mmux_standard_flonumcd$1(STANDARD_FLONUMCDB)	((mmux_standard_flonumcd$1_t)(STANDARD_FLONUMCDB))

#define mmux_standard_flonumcd$1_rectangular(STANDARD_DECIMAL_RE,STANDARD_DECIMAL_IM) \
  ((mmux_standard_flonumcd$1_t){ .re = (STANDARD_DECIMAL_RE), .im = (STANDARD_DECIMAL_IM) })

#define mmux_standard_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,STANDARD_DECIMAL_LITERAL_IM) \
  (mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_RE), \
					mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_IM)))

#define mmux_flonumd$1(STANDARD_DECIMAL)	((mmux_flonumd$1_t){ .value = (STANDARD_DECIMAL) })

#define mmux_flonumd$1_literal(STANDARD_DECIMAL_LITERAL) \
  (mmux_flonumd$1(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL)))

#define mmux_flonumcd$1(STANDARD_FLONUMCD)	((mmux_flonumcd$1_t){ .value = (STANDARD_FLONUMCD) })

/* This is an inline  function, rather than a preprocessor macro, so  that we can use
   it in the macro "mmux_ctype_rectangular()". */
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_rectangular (mmux_flonumd$1_t re, mmux_flonumd$1_t im)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_rectangular(re.value,im.value));
}
#define mmux_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,STANDARD_DECIMAL_LITERAL_IM) \
  (mmux_flonumcd$1(mmux_standard_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,       \
								STANDARD_DECIMAL_LITERAL_IM)))

#define mmux_flonumcd$1_part(VALUE)		(mmux_flonumd$1(VALUE))
#define mmux_flonumcd$1_part_literal(VALUE)	(mmux_flonumd$1(VALUE))

__attribute__((__const__,__always_inline__)) static inline mmux_sint_t
mmux_flonumd$1_sizeof (void)
{
  return mmux_sint(sizeof(mmux_flonumd$1_t));
}
__attribute__((__const__,__always_inline__)) static inline mmux_sint_t
mmux_flonumcd$1_sizeof (void)
{
  return mmux_sint(sizeof(mmux_flonumcd$1_t));
}]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_TYPE(32,	[[[DF]]])
DEFINE_LIBDFP_TYPE(64,	[[[DD]]])
DEFINE_LIBDFP_TYPE(128,	[[[DL]]])


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FUNCTION_PROTOTYPES_TYPES]]],[[[m4_dnl
typedef mmux_standard_$1_t mmux_cc_types_nullary_operation_standard_$1_t (void);
typedef mmux_standard_$1_t mmux_cc_types_unary_operation_standard_$1_t (mmux_standard_$1_t X);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_sint_standard_$1_t  (mmux_standard_sint_t N, mmux_standard_$1_t X);
typedef mmux_standard_$1_t mmux_cc_types_ternary_operation_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);
typedef bool mmux_cc_types_unary_predicate_standard_$1_t   (mmux_standard_$1_t X);
typedef bool mmux_cc_types_binary_predicate_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef bool mmux_cc_types_ternary_predicate_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);
typedef mmux_sint_t mmux_cc_types_comparison_standard_$1_t (mmux_standard_$1_t op1, mmux_standard_$1_t op2);

typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef mmux_$1_t mmux_cc_types_binary_operation_sint_$1_t (mmux_sint_t N, mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_ternary_operation_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef bool mmux_cc_types_unary_predicate_$1_t   (mmux_$1_t X);
typedef bool mmux_cc_types_binary_predicate_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef bool mmux_cc_types_ternary_predicate_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef mmux_sint_t mmux_cc_types_comparison_$1_t (mmux_$1_t op1, mmux_$1_t op2);
]]])
m4_divert(0)m4_dnl
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumd32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumd64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumd128]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumcd32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumcd64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Includes.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-libdfp-constants.h>
#include <mmux-cc-types-libdfp-arithmetics.h>
#include <mmux-cc-types-libdfp-complex.h>
#include <mmux-cc-types-libdfp-comparison.h>
#include <mmux-cc-types-libdfp-mathematics.h>
#include <mmux-cc-types-libdfp-sign-predicates.h>


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

mmux_cc_types_decl bool mmux_flonum$1_sprint (mmux_asciizp_t ptr, mmux_sint_t len, mmux_flonum$1_t value)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl mmux_sint_t mmux_flonum$1_sprint_size (mmux_flonum$1_t value);

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

#endif /* MMUX_CC_TYPES_LIBDFP_H */

/* end of file */
