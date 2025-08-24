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
m4_define([[[DEFINE_LIBDFP_TYPE_MACROS]]],[[[
__extension__ typedef _Decimal$1	mmux_standard_flonumd$1_t;

typedef struct mmux_standard_flonumcd$1_t {
  mmux_standard_flonumd$1_t	re;
  mmux_standard_flonumd$1_t	im;
} mmux_standard_flonumcd$1_t;

typedef mmux_standard_flonumd$1_t		mmux_standard_flonumcd$1_part_t;

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

#define mmux_standard_flonumcd$1_make_rectangular(STANDARD_DECIMAL_RE,STANDARD_DECIMAL_IM) \
  ((mmux_standard_flonumcd$1_t){ .re = (STANDARD_DECIMAL_RE), .im = (STANDARD_DECIMAL_IM) })

#define mmux_standard_flonumcd$1_make_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,STANDARD_DECIMAL_LITERAL_IM) \
  (mmux_standard_flonumcd$1_make_rectangular(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_RE), \
					     mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL_IM)))
]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_TYPE_MACROS(32,	[[[DF]]])
DEFINE_LIBDFP_TYPE_MACROS(64,	[[[DD]]])
DEFINE_LIBDFP_TYPE_MACROS(128,	[[[DL]]])


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


/** --------------------------------------------------------------------
 ** MMUX CC Types embedded type definitions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_STANDARD_TYPE]]],[[[
typedef struct mmux_flonumd$1_t	 { mmux_standard_flonumd$1_t	value; } mmux_flonumd$1_t;
typedef struct mmux_flonumcd$1_t { mmux_standard_flonumcd$1_t	value; } mmux_flonumcd$1_t;
typedef mmux_flonumd$1_t	mmux_flonumcd$1_part_t;

#define mmux_flonumd$1(STANDARD_DECIMAL)	((mmux_flonumd$1_t){ .value = (STANDARD_DECIMAL) })

#define mmux_flonumd$1_literal(STANDARD_DECIMAL_LITERAL) \
  (mmux_flonumd$1(mmux_standard_flonumd$1_literal(STANDARD_DECIMAL_LITERAL)))

#define mmux_flonumcd$1(STANDARD_FLONUMCDB)	((mmux_flonumcd$1_t){ .value = (STANDARD_FLONUMCDB) })

#define mmux_flonumcd$1_make_rectangular(DECIMAL_RE,DECIMAL_IM) \
  (mmux_flonumcd$1(mmux_standard_flonumcd$1_make_rectangular((DECIMAL_RE).value,(DECIMAL_IM).value)))

#define mmux_flonumcd$1_make_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,STANDARD_DECIMAL_LITERAL_IM) \
  (mmux_flonumcd$1(mmux_standard_flonumcd$1_make_rectangular_literal(STANDARD_DECIMAL_LITERAL_RE,       \
								     STANDARD_DECIMAL_LITERAL_IM)))

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
}
]]])
m4_divert(0)m4_dnl
DEFINE_LIBDFP_STANDARD_TYPE(32)
DEFINE_LIBDFP_STANDARD_TYPE(64)
DEFINE_LIBDFP_STANDARD_TYPE(128)


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FUNCTION_PROTOTYPES_TYPES]]],[[[m4_dnl
typedef mmux_standard_$1_t mmux_cc_types_nullary_operation_standard_$1_t (void);
typedef mmux_standard_$1_t mmux_cc_types_unary_operation_standard_$1_t (mmux_standard_$1_t X);
typedef mmux_standard_$1_t mmux_cc_types_binary_operation_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef mmux_standard_$1_t mmux_cc_types_ternary_operation_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);
typedef bool mmux_cc_types_unary_predicate_standard_$1_t   (mmux_standard_$1_t X);
typedef bool mmux_cc_types_binary_predicate_standard_$1_t  (mmux_standard_$1_t X, mmux_standard_$1_t Y);
typedef bool mmux_cc_types_ternary_predicate_standard_$1_t (mmux_standard_$1_t X, mmux_standard_$1_t Y, mmux_standard_$1_t Z);

typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t X, mmux_$1_t Y);
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
 ** Mathematical constants: standard real types.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_REAL_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_$2 (void)
{
  return mmux_standard_flonumd$1_literal($3);
}]]])

m4_define([[[DEFINE_STANDARD_REAL_CONSTANT_PROTO]]],
[[[mmux_cc_types_decl mmux_cc_types_nullary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_constant_$2
  __attribute__((__const__))]]])

m4_define([[[DEFINE_STANDARD_REAL_CONSTANTS]]],[[[
DEFINE_STANDARD_REAL_CONSTANT_INLINE_FUNCTION($1,	zero,	0.0)
DEFINE_STANDARD_REAL_CONSTANT_INLINE_FUNCTION($1,	one,	1.0)
DEFINE_STANDARD_REAL_CONSTANT_INLINE_FUNCTION($1,	two,	2.0)
DEFINE_STANDARD_REAL_CONSTANT_INLINE_FUNCTION($1,	ten,	10.0)

DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		nan);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		E);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		LOG2E);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		LOG10E);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		LN2);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		LN10);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		PI);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		PI_2);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		PI_4);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		1_PI);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		2_PI);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		2_SQRTPI);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		SQRT2);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		SQRT1_2);

DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		minimum);
DEFINE_STANDARD_REAL_CONSTANT_PROTO($1,		maximum);
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_REAL_CONSTANTS(32)
DEFINE_STANDARD_REAL_CONSTANTS(64)
DEFINE_STANDARD_REAL_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematical constants: standard cplx types.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_constant_$2 (void)
{
  return mmux_standard_flonumcd$1_make_rectangular(mmux_standard_flonumd$1_constant_$3(),
						   mmux_standard_flonumd$1_constant_$4());
}]]])

m4_define([[[DEFINE_STANDARD_CPLX_CONSTANTS]]],[[[
DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION($1,	imag,	zero,	one)
DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION($1,	zero,	zero,	zero)
DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION($1,	one,	one,	zero)
DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION($1,	two,	two,	zero)
DEFINE_STANDARD_CPLX_CONSTANT_INLINE_FUNCTION($1,	ten,	ten,	zero)

mmux_cc_types_decl mmux_cc_types_nullary_operation_standard_flonumcd$1_t mmux_standard_flonumcd$1_constant_nan
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_CPLX_CONSTANTS(32)
DEFINE_STANDARD_CPLX_CONSTANTS(64)
DEFINE_STANDARD_CPLX_CONSTANTS(128)



/** --------------------------------------------------------------------
 ** Mathematical constants: embedded real types.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EMBEDDED_REAL_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_constant_$2 (void)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_constant_$2());
}]]])

m4_define([[[DEFINE_EMBEDDED_REAL_CONSTANT_PROTO]]],
[[[mmux_cc_types_decl mmux_cc_types_nullary_operation_flonumd$1_t mmux_flonumd$1_constant_$2
  __attribute__((__const__))]]])

m4_define([[[DEFINE_EMBEDDED_REAL_CONSTANTS]]],[[[
DEFINE_EMBEDDED_REAL_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_EMBEDDED_REAL_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_EMBEDDED_REAL_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_EMBEDDED_REAL_CONSTANT_INLINE_FUNCTION($1,	ten)

DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		nan);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		E);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		LOG2E);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		LOG10E);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		LN2);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		LN10);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		PI);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		PI_2);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		PI_4);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		1_PI);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		2_PI);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		2_SQRTPI);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		SQRT2);
DEFINE_EMBEDDED_REAL_CONSTANT_PROTO($1,		SQRT1_2);

mmux_cc_types_decl mmux_cc_types_nullary_operation_flonumd$1_t mmux_flonumd$1_minimum __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_nullary_operation_flonumd$1_t mmux_flonumd$1_maximum __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_EMBEDDED_REAL_CONSTANTS(32)
DEFINE_EMBEDDED_REAL_CONSTANTS(64)
DEFINE_EMBEDDED_REAL_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematical constants: embedded cplx types.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_constant_$2 (void)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_constant_$2());
}]]])

m4_define([[[DEFINE_EMBEDDED_CPLX_CONSTANTS]]],[[[
DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION($1,	imag)
DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_EMBEDDED_CPLX_CONSTANT_INLINE_FUNCTION($1,	ten)
mmux_cc_types_decl mmux_cc_types_nullary_operation_flonumcd$1_t mmux_flonumcd$1_constant_nan
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_EMBEDDED_CPLX_CONSTANTS(32)
DEFINE_EMBEDDED_CPLX_CONSTANTS(64)
DEFINE_EMBEDDED_CPLX_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Some complex number functions: real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_BASIC_FUNCTIONS]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_part_t
mmux_flonumcd$1_real_part (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(Z.value.re);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_part_t
mmux_flonumcd$1_imag_part (mmux_flonumcd$1_t Z)
{
  return mmux_flonumd$1(Z.value.im);
}

mmux_cc_types_decl mmux_flonumcd$1_part_t mmux_flonumcd$1_abs (mmux_flonumcd$1_t Z)
  __attribute__((__const__));

mmux_cc_types_decl mmux_flonumcd$1_part_t mmux_flonumcd$1_arg (mmux_flonumcd$1_t Z)
  __attribute__((__const__));

__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_conj (mmux_flonumcd$1_t Z)
{
  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Z.value.re, - Z.value.im) );
}
]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_BASIC_FUNCTIONS(32)
DEFINE_CPLX_BASIC_FUNCTIONS(64)
DEFINE_CPLX_BASIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: real numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_ARITHMETICS_FUNCTIONS]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_add (mmux_flonumd$1_t A, mmux_flonumd$1_t B)
{
  return mmux_flonumd$1(A.value + B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_sub (mmux_flonumd$1_t A, mmux_flonumd$1_t B)
{
  return mmux_flonumd$1(A.value - B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_mul (mmux_flonumd$1_t A, mmux_flonumd$1_t B)
{
  return mmux_flonumd$1(A.value * B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_div (mmux_flonumd$1_t A, mmux_flonumd$1_t B)
{
  return mmux_flonumd$1(A.value / B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_neg (mmux_flonumd$1_t A)
{
  return mmux_flonumd$1(- A.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_inv (mmux_flonumd$1_t A)
{
  return mmux_flonumd$1_div(mmux_flonumd$1_constant_one(), A);
}

mmux_cc_types_decl mmux_flonumd$1_t mmux_flonumd$1_abs (mmux_flonumd$1_t X)
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_ARITHMETICS_FUNCTIONS(32)
DEFINE_REAL_ARITHMETICS_FUNCTIONS(64)
DEFINE_REAL_ARITHMETICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: complex numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_ARITHMETICS_FUNCTIONS]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_add (mmux_flonumcd$1_t A, mmux_flonumcd$1_t B)
{
  auto	Cre = A.value.re + B.value.re;
  auto	Cim = A.value.im + B.value.im;
  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_sub (mmux_flonumcd$1_t A, mmux_flonumcd$1_t B)
{
  auto	Cre = A.value.re - B.value.re;
  auto	Cim = A.value.im - B.value.im;

  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_mul (mmux_flonumcd$1_t A, mmux_flonumcd$1_t B)
{
  auto	Cre = A.value.re * B.value.re - A.value.im * B.value.im;
  auto	Cim = A.value.re * B.value.im + B.value.re * A.value.im;

  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_div (mmux_flonumcd$1_t A, mmux_flonumcd$1_t B)
{
  auto	D   = B.value.re * B.value.re + B.value.im * B.value.im;
  auto	Cre = (A.value.re * B.value.re + A.value.im * B.value.im) / D;
  auto	Cim = (A.value.im * B.value.re - A.value.re * B.value.im) / D;

  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_neg (mmux_flonumcd$1_t A)
{
  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(-A.value.re, - A.value.im) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_inv (mmux_flonumcd$1_t A)
{
  auto	D   = A.value.re * A.value.re + A.value.im * A.value.im;
  auto	Cre = A.value.re / D;
  auto	Cim = - (A.value.im / D);

  return mmux_flonumcd$1( mmux_standard_flonumcd$1_make_rectangular(Cre, Cim) );
}
]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_ARITHMETICS_FUNCTIONS(32)
DEFINE_CPLX_ARITHMETICS_FUNCTIONS(64)
DEFINE_CPLX_ARITHMETICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Mathematics builtins.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_UNARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op) __attribute__((__const__));
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2) __attribute__((__const__));
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_CFUNC]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (int N, mmux_$1_t op) __attribute__((__const__));
]]])]]])]]])

m4_divert(0)m4_dnl

m4_dnl ----------------------------------------------------------------------

m4_dnl  $1 - type stem
m4_dnl  $2 - type parser macro
m4_dnl  $3 - C preprocessor for optional definition

m4_dnl  $4 - identifier of C function implementing sin
m4_dnl  $5 - identifier of C function implementing cos
m4_dnl  $6 - identifier of C function implementing tan
m4_dnl  $7 - identifier of C function implementing asin
m4_dnl  $8 - identifier of C function implementing acos
m4_dnl  $9 - identifier of C function implementing atan
m4_dnl $10 - identifier of C function implementing atan2

m4_dnl $11 - identifier of C function implementing sinh
m4_dnl $12 - identifier of C function implementing cosh
m4_dnl $13 - identifier of C function implementing tanh
m4_dnl $14 - identifier of C function implementing asinh
m4_dnl $15 - identifier of C function implementing acosh
m4_dnl $16 - identifier of C function implementing atanh

m4_dnl $17 - identifier of C function implementing exp
m4_dnl $18 - identifier of C function implementing exp2
m4_dnl $19 - identifier of C function implementing exp10
m4_dnl $20 - identifier of C function implementing log
m4_dnl $21 - identifier of C function implementing log10
m4_dnl $22 - identifier of C function implementing log2
m4_dnl $23 - identifier of C function implementing logb
m4_dnl $24 - identifier of C function implementing pow
m4_dnl $25 - identifier of C function implementing sqrt
m4_dnl $26 - identifier of C function implementing cbrt
m4_dnl $27 - identifier of C function implementing hypot
m4_dnl $28 - identifier of C function implementing expm1
m4_dnl $29 - identifier of C function implementing log1p

m4_dnl $30 - identifier of C function implementing erf
m4_dnl $31 - identifier of C function implementing erfc
m4_dnl $32 - identifier of C function implementing lgamma
m4_dnl $33 - identifier of C function implementing tgamma
m4_dnl $34 - identifier of C function implementing j0
m4_dnl $35 - identifier of C function implementing j1
m4_dnl $36 - identifier of C function implementing jn
m4_dnl $37 - identifier of C function implementing y0
m4_dnl $38 - identifier of C function implementing y1
m4_dnl $39 - identifier of C function implementing yn

m4_define([[[DEFINE_CFUNCS]]],[[[m4_ifelse($#,39,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 39 got: $#
)]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[sin]]],	[[[$4]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cos]]],	[[[$5]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tan]]],	[[[$6]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[asin]]],	[[[$7]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[acos]]],	[[[$8]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[atan]]],	[[[$9]]],  [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[atan2]]],	[[[$10]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[sinh]]],	[[[$11]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cosh]]],	[[[$12]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tanh]]],	[[[$13]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[asinh]]],	[[[$14]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[acosh]]],	[[[$15]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[atanh]]],	[[[$16]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp]]],	[[[$17]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp2]]],	[[[$18]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[exp10]]],	[[[$19]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log]]],	[[[$20]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log10]]],	[[[$21]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log2]]],	[[[$22]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[logb]]],	[[[$23]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[pow]]],	[[[$24]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[sqrt]]],	[[[$25]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[cbrt]]],	[[[$26]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CFUNC([[[$1]]], [[[hypot]]],	[[[$27]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[expm1]]],	[[[$28]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[log1p]]],	[[[$29]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CFUNC([[[$1]]],  [[[erf]]],	[[[$30]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[erfc]]],	[[[$31]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[lgamma]]],	[[[$32]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[tgamma]]],	[[[$33]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j0]]],		[[[$34]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[j1]]],		[[[$35]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[jn]]],		[[[$36]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y0]]],		[[[$37]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CFUNC([[[$1]]],  [[[y1]]],		[[[$38]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CFUNC([[[$1]]],[[[yn]]],		[[[$39]]], [[[$2]]], [[[$3]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[flonumd32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]],
	      [[[sind32]]],		[[[cosd32]]],		[[[tand32]]],
	      [[[asind32]]],		[[[acosd32]]],		[[[atand32]]],		[[[atan2d32]]],
	      [[[sinhd32]]],		[[[coshd32]]],		[[[tanhd32]]],
	      [[[asinhd32]]],		[[[acoshd32]]],		[[[atanhd32]]],
	      [[[expd32]]],		[[[exp2d32]]],		[[[mmux_exp10d32]]],
	      [[[logd32]]],		[[[log10d32]]],		[[[log2d32]]],		[[[logbd32]]],
	      [[[powd32]]],		[[[sqrtd32]]],		[[[cbrtd32]]],		[[[hypotd32]]],
	      [[[expm1d32]]],		[[[log1pd32]]],
	      [[[erfd32]]],		[[[erfcd32]]],
	      [[[lgammad32]]],		[[[tgammad32]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d32]]],		[[[j1d32]]],		[[[jnd32]]],
	      [[[y0d32]]],		[[[y1d32]]],		[[[ynd32]]])
#endif

DEFINE_CFUNCS([[[flonumd64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]],
	      [[[sind64]]],		[[[cosd64]]],		[[[tand64]]],
	      [[[asind64]]],		[[[acosd64]]],		[[[atand64]]],		[[[atan2d64]]],
	      [[[sinhd64]]],		[[[coshd64]]],		[[[tanhd64]]],
	      [[[asinhd64]]],		[[[acoshd64]]],		[[[atanhd64]]],
	      [[[expd64]]],		[[[exp2d64]]],		[[[mmux_exp10d64]]],
	      [[[logd64]]],		[[[log10d64]]],		[[[log2d64]]],		[[[logbd64]]],
	      [[[powd64]]],		[[[sqrtd64]]],		[[[cbrtd64]]],		[[[hypotd64]]],
	      [[[expm1d64]]],		[[[log1pd64]]],
	      [[[erfd64]]],		[[[erfcd64]]],
	      [[[lgammad64]]],		[[[tgammad64]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d64]]],		[[[j1d64]]],		[[[jnd64]]],
	      [[[y0d64]]],		[[[y1d64]]],		[[[ynd64]]])
#endif

DEFINE_CFUNCS([[[flonumd128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMD128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]],
	      [[[sind128]]],		[[[cosd128]]],		[[[tand128]]],
	      [[[asind128]]],		[[[acosd128]]],		[[[atand128]]],		[[[atan2d128]]],
	      [[[sinhd128]]],		[[[coshd128]]],		[[[tanhd128]]],
	      [[[asinhd128]]],		[[[acoshd128]]],	[[[atanhd128]]],
	      [[[expd128]]],		[[[exp2d128]]],		[[[mmux_exp10d128]]],
	      [[[logd128]]],		[[[log10d128]]],	[[[log2d128]]],		[[[logbd128]]],
	      [[[powd128]]],		[[[sqrtd128]]],		[[[cbrtd128]]],		[[[hypotd128]]],
	      [[[expm1d128]]],		[[[log1pd128]]],
	      [[[erfd128]]],		[[[erfcd128]]],
	      [[[lgammad128]]],		[[[tgammad128]]],
	      [[[]]],			[[[]]],			[[[]]],
	      [[[]]],			[[[]]],			[[[]]])
#if 0 /* not implemented by libdfp */
	      [[[j0d128]]],		[[[j1d128]]],		[[[jnd128]]],
	      [[[y0d128]]],		[[[y1d128]]],		[[[ynd128]]])
#endif

/* ------------------------------------------------------------------ */

DEFINE_CFUNCS([[[flonumcd32]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD32]]], [[[MMUX_CC_TYPES_HAS_FLONUMCD32_UNIMPLEMENTED]]],
	      [[[csind32]]],	[[[ccosd32]]],		[[[ctand32]]],
	      [[[casind32]]],	[[[cacosd32]]],		[[[catand32]]],		[[[]]],
	      [[[csinhd32]]],	[[[ccoshd32]]],		[[[ctanhd32]]],
	      [[[casinhd32]]],	[[[cacoshd32]]],	[[[catanhd32]]],
	      [[[cexpd32]]],	[[[]]],			[[[]]],
	      [[[clogd32]]],	[[[clog10d32]]],	[[[]]],			[[[]]],
	      [[[cpowd32]]],	[[[csqrtd32]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[flonumcd64]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD64]]], [[[MMUX_CC_TYPES_HAS_FLONUMCD64_UNIMPLEMENTED]]],
	      [[[csind64]]],	[[[ccosd64]]],		[[[ctand64]]],
	      [[[casind64]]],	[[[cacosd64]]],		[[[catand64]]],		[[[]]],
	      [[[csinhd64]]],	[[[ccoshd64]]],		[[[ctanhd64]]],
	      [[[casinhd64]]],	[[[cacoshd64]]],	[[[catanhd64]]],
	      [[[cexpd64]]],	[[[]]],			[[[]]],
	      [[[clogd64]]],	[[[clog10d64]]],	[[[]]],			[[[]]],
	      [[[cpowd64]]],	[[[csqrtd64]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])

DEFINE_CFUNCS([[[flonumcd128]]],
	      [[[MMUX_BASH_PARSE_CFUNC_ARG_FLONUMCD128]]],[[[MMUX_CC_TYPES_HAS_FLONUMCD128_UNIMPLEMENTED]]],
	      [[[csind128]]],	[[[ccosd128]]],		[[[ctand128]]],
	      [[[casind128]]],	[[[cacosd128]]],	[[[catand128]]],	[[[]]],
	      [[[csinhd128]]],	[[[ccoshd128]]],	[[[ctanhd128]]],
	      [[[casinhd128]]],	[[[cacoshd128]]],	[[[catanhd128]]],
	      [[[cexpd128]]],	[[[]]],			[[[]]],
	      [[[clogd128]]],	[[[clog10d128]]],	[[[]]],			[[[]]],
	      [[[cpowd128]]],	[[[csqrtd128]]],	[[[]]],			[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],
	      [[[]]],		[[[]]],			[[[]]],
	      [[[]]],		[[[]]],			[[[]]])



/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_PREDICATE_PROTOS]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_zero		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_nan		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_infinite	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_negative	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_negative	__attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_PREDICATE_PROTOS(flonumd32)
DEFINE_PREDICATE_PROTOS(flonumd64)
DEFINE_PREDICATE_PROTOS(flonumd128)
DEFINE_PREDICATE_PROTOS(flonumcd32)
DEFINE_PREDICATE_PROTOS(flonumcd64)
DEFINE_PREDICATE_PROTOS(flonumcd128)


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISON_PROTOS]]],[[[
mmux_cc_types_decl mmux_cc_types_comparison_$1_t mmux_$1_cmp			__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_equal		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater_equal	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less_equal	__attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_$1_t mmux_standard_$1_equal_absmargin  __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_ternary_predicate_standard_$1_t mmux_standard_$1_equal_relepsilon __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_COMPARISON_PROTOS(flonumd32)
DEFINE_COMPARISON_PROTOS(flonumd64)
DEFINE_COMPARISON_PROTOS(flonumd128)
DEFINE_COMPARISON_PROTOS(flonumcd32)
DEFINE_COMPARISON_PROTOS(flonumcd64)
DEFINE_COMPARISON_PROTOS(flonumcd128)

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_define([[[DEFINE_APPROX_COMPARISON_INLINE_FUNCTIONS]]],[[[
__attribute__((__const__,__always_inline__)) static inline bool
mmux_flonumd$1_equal_absmargin (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2, mmux_flonumd$1_t margin)
{
  return mmux_standard_flonumd$1_equal_absmargin(op1.value, op2.value, margin.value);
}
__attribute__((__const__,__always_inline__)) static inline bool
mmux_flonumd$1_equal_relepsilon (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2, mmux_flonumd$1_t epsilon)
{
  return mmux_standard_flonumd$1_equal_relepsilon(op1.value, op2.value, epsilon.value);
}
__attribute__((__const__,__always_inline__)) static inline bool
mmux_flonumcd$1_equal_absmargin (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2, mmux_flonumcd$1_t margin)
{
  return (mmux_standard_flonumd$1_equal_absmargin(op1.value.re, op2.value.re, margin.value.re) &&
	  mmux_standard_flonumd$1_equal_absmargin(op1.value.im, op2.value.im, margin.value.im))?
    true : false;
}
__attribute__((__const__,__always_inline__)) static inline bool
mmux_flonumcd$1_equal_relepsilon (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2, mmux_flonumcd$1_t epsilon)
{
  return (mmux_standard_flonumd$1_equal_relepsilon(op1.value.re, op2.value.re, epsilon.value.re) &&
	  mmux_standard_flonumd$1_equal_relepsilon(op1.value.im, op2.value.im, epsilon.value.im))?
    true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_APPROX_COMPARISON_INLINE_FUNCTIONS(32)
DEFINE_APPROX_COMPARISON_INLINE_FUNCTIONS(64)
DEFINE_APPROX_COMPARISON_INLINE_FUNCTIONS(128)

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_define([[[DEFINE_MIN_MAX_PROTOS]]],[[[
mmux_cc_types_decl mmux_cc_types_binary_operation_flonumd$1_t  mmux_flonumd$1_max     __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_flonumd$1_t  mmux_flonumd$1_min     __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_MIN_MAX_PROTOS(32)
DEFINE_MIN_MAX_PROTOS(64)
DEFINE_MIN_MAX_PROTOS(128)


/** --------------------------------------------------------------------
 ** String representation and printing.
 ** ----------------------------------------------------------------- */

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
