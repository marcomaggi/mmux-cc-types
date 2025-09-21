/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Sep 20, 2025

  Abstract

	Type definitions for "_DecimalN" support.

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
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-typedefs.h>


/** --------------------------------------------------------------------
 ** Standard types definitions: literals.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_LITERALS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
#define mmux_standard_flonumd$1_literal(VALUE)		(VALUE ## $2)
#define mmux_standard_flonumcd$1_part_literal(VALUE)	(mmux_standard_flonumd$1_literal(VALUE))
]]])]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_LITERALS(32,	[[[DF]]])
DEFINE_LIBDFP_LITERALS(64,	[[[DD]]])
DEFINE_LIBDFP_LITERALS(128,	[[[DL]]])


/** --------------------------------------------------------------------
 ** Standard types definitions: typedefs, literals.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_TYPE]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
__extension__ typedef _Decimal$1	mmux_standard_flonumd$1_t;

typedef struct mmux_standard_flonumcd$1_t {
  mmux_standard_flonumd$1_t	re;
  mmux_standard_flonumd$1_t	im;
} mmux_standard_flonumcd$1_t;

typedef mmux_standard_flonumd$1_t		mmux_standard_flonumcd$1_part_t;

typedef struct mmux_flonumd$1_t	 { mmux_standard_flonumd$1_t	value; } mmux_flonumd$1_t;
typedef struct mmux_flonumcd$1_t { mmux_standard_flonumcd$1_t	value; } mmux_flonumcd$1_t;
typedef mmux_flonumd$1_t	mmux_flonumcd$1_part_t;
]]])]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_TYPE(32)
DEFINE_LIBDFP_TYPE(64)
DEFINE_LIBDFP_TYPE(128)


/** --------------------------------------------------------------------
 ** Standard types definitions: makers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_TYPE]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
#define mmux_standard_flonumd$1(STANDARD_DECIMAL)	((mmux_standard_flonumd$1_t)(STANDARD_DECIMAL))
#define mmux_standard_flonumcd$1(STANDARD_FLONUMCDB)	((mmux_standard_flonumcd$1_t)(STANDARD_FLONUMCDB))

mmux_cc_types_inline_decl mmux_flonumd$1_t
mmux_flonumd$1 (mmux_standard_flonumd$1_t value)
{
  return (mmux_flonumd$1_t){ .value = value };
}
mmux_cc_types_inline_decl mmux_flonumcd$1_t
mmux_flonumcd$1 (mmux_standard_flonumcd$1_t value)
{
  return (mmux_flonumcd$1_t){ .value = value };
}

#define mmux_flonumd$1_literal(STANDARD_DECIMAL_LITERAL) \
  (mmux_flonumd$1(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL)))

#define mmux_flonumcd$1_part(VALUE)		(mmux_flonumd$1(VALUE))
#define mmux_flonumcd$1_part_literal(VALUE)	(mmux_flonumd$1(VALUE))
]]])]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_TYPE(32)
DEFINE_LIBDFP_TYPE(64)
DEFINE_LIBDFP_TYPE(128)


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[m4_dnl
typedef mmux_standard_$1_t mmux_cc_types_nullary_operation_standard_$1_t (void);
typedef mmux_standard_$1_t mmux_cc_types_unary_operation_standard_$1_t (mmux_standard_$1_t X);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_sint_standard_$1_t  (mmux_standard_sint_t N, mmux_standard_$1_t X);
typedef mmux_standard_$1_t mmux_cc_types_ternary_operation_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);
typedef bool mmux_cc_types_unary_predicate_standard_$1_t   (mmux_standard_$1_t X);
typedef bool mmux_cc_types_binary_predicate_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef bool mmux_cc_types_ternary_predicate_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);
typedef mmux_standard_sint_t mmux_cc_types_comparison_standard_$1_t (mmux_standard_$1_t op1, mmux_standard_$1_t op2);

typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef mmux_$1_t mmux_cc_types_binary_operation_sint_$1_t (mmux_sint_t N, mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_ternary_operation_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef bool mmux_cc_types_unary_predicate_$1_t   (mmux_$1_t X);
typedef bool mmux_cc_types_binary_predicate_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef bool mmux_cc_types_ternary_predicate_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef mmux_sint_t mmux_cc_types_comparison_$1_t (mmux_$1_t op1, mmux_$1_t op2);
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumd32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumd64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumd128]]])
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumcd32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumcd64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPEDEFS([[[flonumcd128]]])


/** --------------------------------------------------------------------
 ** Complex numbers: functions that are so important that we need them here.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_COMPLEX_NUMBERS_INLINE_FUNCTIONS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumcd$1]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_rectangular (mmux_standard_flonumd$1_t re, mmux_standard_flonumd$1_t im)
{
  return (mmux_standard_flonumcd$1_t){ .re = re, .im = im };
}

mmux_cc_types_inline_decl mmux_flonumcd$1_t
mmux_flonumcd$1_rectangular (mmux_flonumd$1_t re, mmux_flonumd$1_t im)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_rectangular(re.value,im.value));
}

/* ------------------------------------------------------------------ */

#define mmux_standard_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,		      \
						     STANDARD_DECIMAL_LITERAL_IM)		      \
  (mmux_standard_flonumcd$1_rectangular(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_RE), \
                                        mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_IM)))

#define mmux_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,			      \
					    STANDARD_DECIMAL_LITERAL_IM)			      \
  (mmux_flonumcd$1(mmux_standard_flonumcd$1_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,	      \
								STANDARD_DECIMAL_LITERAL_IM)))

/* ------------------------------------------------------------------ */

mmux_cc_types_inline_decl mmux_standard_flonumd$1_t
mmux_standard_flonumcd$1_real_part (mmux_standard_flonumcd$1_t op)
{
  return op.re;
}

mmux_cc_types_inline_decl mmux_standard_flonumd$1_t
mmux_standard_flonumcd$1_imag_part (mmux_standard_flonumcd$1_t op)
{
  return op.im;
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_COMPLEX_NUMBERS_INLINE_FUNCTIONS(32)
DEFINE_LIBDFP_COMPLEX_NUMBERS_INLINE_FUNCTIONS(64)
DEFINE_LIBDFP_COMPLEX_NUMBERS_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* define MMUX_CC_TYPES_LIBDFP_H */

/* end of file */
