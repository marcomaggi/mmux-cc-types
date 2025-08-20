/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Aug 16, 2025

  Abstract

	This is the public  header file defining the API of  _DecimalN support; it is
	included by  "mmux-cc-types.h" and  "mmux-cc-types-libdfp.c"; it must  not be
	included by itself.

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
 ** Literals definitions, standard types definitions, standard C functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_LITERAL_MACROS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[m4_dnl
#undef  mmux_standard_decimal$1_literal
#define mmux_standard_decimal$1_literal(VALUE)	(VALUE ## $2)

#undef  mmux_standard_complexd$1_part_literal
#define mmux_standard_complexd$1_part_literal(VALUE)	(mmux_standard_decimal$1_literal(VALUE))

__extension__ typedef _Decimal$1	mmux_standard_decimal$1_t;

typedef struct mmux_standard_complexd$1_t {
  mmux_standard_decimal$1_t	re;
  mmux_standard_decimal$1_t	im;
} mmux_standard_complexd$1_t;

typedef mmux_standard_decimal$1_t		mmux_standard_complexd$1_part_t;

#undef  mmux_standard_decimal$1
#define mmux_standard_decimal$1(VALUE)		((mmux_standard_decimal$1_t)(VALUE))

__attribute__((__const__,__always_inline__)) static inline mmux_standard_complexd$1_t
mmux_standard_complexd$1 (mmux_standard_decimal$1_t re, mmux_standard_decimal$1_t im)
{
  return (mmux_standard_complexd$1_t){ .re = re, .im = im };
}

#undef  mmux_standard_complexd$1_literal
#define mmux_standard_complexd$1_literal(RE,IM)		\
  (mmux_standard_complexd$1(mmux_standard_decimal$1_literal(RE), mmux_standard_decimal$1_literal(IM)))
]]])]]])
m4_divert(0)m4_dnl

DEFINE_LIBDFP_LITERAL_MACROS(32,	[[[DF]]])
DEFINE_LIBDFP_LITERAL_MACROS(64,	[[[DD]]])
DEFINE_LIBDFP_LITERAL_MACROS(128,	[[[DL]]])


/** --------------------------------------------------------------------
 ** MMUX CC Types embedded type definitions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_LIBDFP_STANDARD_TYPE]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[m4_dnl
typedef struct mmux_decimal$1_t	 { mmux_standard_decimal$1_t	value; } mmux_decimal$1_t;
typedef struct mmux_complexd$1_t { mmux_standard_complexd$1_t	value; } mmux_complexd$1_t;
typedef mmux_decimal$1_t	mmux_complexd$1_part_t;

#undef  mmux_decimal$1_literal
#define mmux_decimal$1_literal(VALUE)	(mmux_decimal$1(mmux_standard_decimal$1_literal(VALUE)))

__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1 (mmux_standard_decimal$1_t value)
{
  return ((mmux_decimal$1_t){ .value = value });
}

__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1 (mmux_standard_complexd$1_t value)
{
  return ((mmux_complexd$1_t){ .value = value });
}

#undef  mmux_complexd$1_literal
#define mmux_complexd$1_literal(RE,IM)		(mmux_complexd$1(mmux_standard_complexd$1_literal((RE),(IM))))

#undef  mmux_complexd$1_part_literal
#define mmux_complexd$1_part_literal(VALUE)	(mmux_decimal$1(VALUE))

__attribute__((__const__,__always_inline__)) static inline int
mmux_decimal$1_sizeof (void)
{
  return sizeof(mmux_decimal$1_t);
}
__attribute__((__const__,__always_inline__)) static inline int
mmux_complexd$1_sizeof (void)
{
  return sizeof(mmux_complexd$1_t);
}
]]])]]])
m4_divert(0)m4_dnl

DEFINE_LIBDFP_STANDARD_TYPE(32)
DEFINE_LIBDFP_STANDARD_TYPE(64)
DEFINE_LIBDFP_STANDARD_TYPE(128)


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FUNCTION_PROTOTYPES_TYPES]]],[[[m4_dnl
typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef mmux_$1_t mmux_cc_types_ternary_operation_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef bool      mmux_cc_types_unary_predicate_$1_t   (mmux_$1_t X);
typedef bool      mmux_cc_types_binary_predicate_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef bool      mmux_cc_types_ternary_predicate_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
]]])

DEFINE_FUNCTION_PROTOTYPES_TYPES([[[decimal32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[decimal64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[decimal128]]])

DEFINE_FUNCTION_PROTOTYPES_TYPES([[[complexd32]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[complexd64]]])
DEFINE_FUNCTION_PROTOTYPES_TYPES([[[complexd128]]])


/** --------------------------------------------------------------------
 ** Mathematical constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_MATH_CONSTANTS_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_zero	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_one	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_two	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_E		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_LOG2E	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_LOG10E	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_LN2	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_LN10	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_PI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_PI_2	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_PI_4	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_1_PI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_2_PI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_2_SQRTPI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_SQRT2	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_constant_SQRT1_2	(void)
  __attribute__((__const__));

mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_zero	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_one		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_two		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_E		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_LOG2E	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_LOG10E	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_LN2		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_LN10	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_PI		(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_PI_2	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_PI_4	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_1_PI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_2_PI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_2_SQRTPI	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_SQRT2	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_constant_SQRT1_2	(void)
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_complexd$1_t mmux_standard_complexd$1_constant_imag	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_complexd$1_t mmux_standard_complexd$1_constant_zero	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_complexd$1_t mmux_standard_complexd$1_constant_one	(void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_standard_complexd$1_t mmux_standard_complexd$1_constant_two	(void)
  __attribute__((__const__));

mmux_cc_types_decl mmux_complexd$1_t mmux_complexd$1_constant_imag (void) __attribute__((__const__));
mmux_cc_types_decl mmux_complexd$1_t mmux_complexd$1_constant_zero (void) __attribute__((__const__));
mmux_cc_types_decl mmux_complexd$1_t mmux_complexd$1_constant_one  (void) __attribute__((__const__));
mmux_cc_types_decl mmux_complexd$1_t mmux_complexd$1_constant_two  (void) __attribute__((__const__));

mmux_cc_types_decl mmux_cc_types_nullary_operation_decimal$1_t mmux_decimal$1_minimum __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_nullary_operation_decimal$1_t mmux_decimal$1_maximum __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_decimal$1_t  mmux_decimal$1_max     __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_decimal$1_t  mmux_decimal$1_min     __attribute__((__const__));

mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_minimum (void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_standard_decimal$1_maximum (void) __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl

DEFINE_MATH_CONSTANTS_PROTOS(32)
DEFINE_MATH_CONSTANTS_PROTOS(64)
DEFINE_MATH_CONSTANTS_PROTOS(128)


/** --------------------------------------------------------------------
 ** Some complex number functions: sizeof, make_rectangular, real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_BASIC_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_standard_complexd$1_t
mmux_standard_complexd$1_make_rectangular (mmux_standard_complexd$1_part_t re, mmux_standard_complexd$1_part_t im)
{
  return mmux_standard_complexd$1(re, im);
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_make_rectangular (mmux_complexd$1_part_t re, mmux_complexd$1_part_t im)
{
  return mmux_complexd$1( mmux_standard_complexd$1(re.value, im.value) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_make_rectangular_literal (mmux_standard_complexd$1_part_t re, mmux_standard_complexd$1_part_t im)
{
  return mmux_complexd$1( mmux_standard_complexd$1(re, im) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_part_t
mmux_complexd$1_real_part (mmux_complexd$1_t Z)
{
  return mmux_decimal$1(Z.value.re);
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_part_t
mmux_complexd$1_imag_part (mmux_complexd$1_t Z)
{
  return mmux_decimal$1(Z.value.im);
}

mmux_cc_types_decl mmux_complexd$1_part_t mmux_complexd$1_abs (mmux_complexd$1_t Z)
  __attribute__((__const__));

mmux_cc_types_decl mmux_complexd$1_part_t mmux_complexd$1_arg (mmux_complexd$1_t Z)
  __attribute__((__const__));

__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_conj (mmux_complexd$1_t Z)
{
  return mmux_complexd$1( mmux_standard_complexd$1(Z.value.re, - Z.value.im) );
}
]]])]]])
m4_divert(0)m4_dnl

DEFINE_CPLX_BASIC_FUNCTIONS(32)
DEFINE_CPLX_BASIC_FUNCTIONS(64)
DEFINE_CPLX_BASIC_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: real numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_add (mmux_decimal$1_t A, mmux_decimal$1_t B)
{
  return mmux_decimal$1(A.value + B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_sub (mmux_decimal$1_t A, mmux_decimal$1_t B)
{
  return mmux_decimal$1(A.value - B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_mul (mmux_decimal$1_t A, mmux_decimal$1_t B)
{
  return mmux_decimal$1(A.value * B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_div (mmux_decimal$1_t A, mmux_decimal$1_t B)
{
  return mmux_decimal$1(A.value / B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_neg (mmux_decimal$1_t A)
{
  return mmux_decimal$1(- A.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_decimal$1_t
mmux_decimal$1_inv (mmux_decimal$1_t A)
{
  return mmux_decimal$1_div(mmux_decimal$1_constant_one(), A);
}

mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_abs (mmux_decimal$1_t X)
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl

DEFINE_REAL_ARITHMETICS_FUNCTIONS(32)
DEFINE_REAL_ARITHMETICS_FUNCTIONS(64)
DEFINE_REAL_ARITHMETICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: complex numbers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_add (mmux_complexd$1_t A, mmux_complexd$1_t B)
{
  auto	Cre = A.value.re + B.value.re;
  auto	Cim = A.value.im + B.value.im;
  return mmux_complexd$1( mmux_standard_complexd$1(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_sub (mmux_complexd$1_t A, mmux_complexd$1_t B)
{
  auto	Cre = A.value.re - B.value.re;
  auto	Cim = A.value.im - B.value.im;

  return mmux_complexd$1( mmux_standard_complexd$1(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_mul (mmux_complexd$1_t A, mmux_complexd$1_t B)
{
  auto	Cre = A.value.re * B.value.re - A.value.im * B.value.im;
  auto	Cim = A.value.re * B.value.im + B.value.re * A.value.im;

  return mmux_complexd$1( mmux_standard_complexd$1(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_div (mmux_complexd$1_t A, mmux_complexd$1_t B)
{
  auto	D   = B.value.re * B.value.re + B.value.im * B.value.im;
  auto	Cre = (A.value.re * B.value.re + A.value.im * B.value.im) / D;
  auto	Cim = (A.value.im * B.value.re - A.value.re * B.value.im) / D;

  return mmux_complexd$1( mmux_standard_complexd$1(Cre, Cim) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_neg (mmux_complexd$1_t A)
{
  return mmux_complexd$1( mmux_standard_complexd$1(-A.value.re, - A.value.im) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_complexd$1_t
mmux_complexd$1_inv (mmux_complexd$1_t A)
{
  auto	D   = A.value.re * A.value.re + A.value.im * A.value.im;
  auto	Cre = A.value.re / D;
  auto	Cim = - (A.value.im / D);

  return mmux_complexd$1( mmux_standard_complexd$1(Cre, Cim) );
}
]]])]]])
m4_divert(0)m4_dnl

DEFINE_CPLX_ARITHMETICS_FUNCTIONS(32)
DEFINE_CPLX_ARITHMETICS_FUNCTIONS(64)
DEFINE_CPLX_ARITHMETICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Comparison functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_COMPARISON_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL$1]]],[[[m4_dnl

mmux_cc_types_decl bool mmux_decimal$1_equal (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_greater (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_less (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_greater_equal (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_less_equal (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl int mmux_decimal$1_cmp (mmux_decimal$1_t op1, mmux_decimal$1_t op2)
  __attribute__((__const__));

/* ------------------------------------------------------------------ */

mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_max (mmux_decimal$1_t X, mmux_decimal$1_t Y)
  __attribute__((__const__));

mmux_cc_types_decl mmux_decimal$1_t mmux_decimal$1_min (mmux_decimal$1_t X, mmux_decimal$1_t Y)
  __attribute__((__const__));

/* ------------------------------------------------------------------ */

mmux_cc_types_decl bool mmux_complexd$1_equal (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl int mmux_complexd$1_cmp (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_greater (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_less (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_greater_equal (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_less_equal (mmux_complexd$1_t op1, mmux_complexd$1_t op2)
  __attribute__((__const__));

/* ------------------------------------------------------------------ */

mmux_cc_types_decl bool mmux_standard_decimal$1_equal_absmargin (mmux_standard_decimal$1_t op1,
								 mmux_standard_decimal$1_t op2,
								 mmux_standard_decimal$1_t margin)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_standard_decimal$1_equal_relepsilon (mmux_standard_decimal$1_t op1,
								  mmux_standard_decimal$1_t op2,
								  mmux_standard_decimal$1_t epsilon)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_equal_absmargin (mmux_decimal$1_t op1,
							mmux_decimal$1_t op2,
							mmux_decimal$1_t margin)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_decimal$1_equal_relepsilon (mmux_decimal$1_t op1,
							 mmux_decimal$1_t op2,
							 mmux_decimal$1_t epsilon)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_equal_absmargin (mmux_complexd$1_t op1,
							 mmux_complexd$1_t op2,
							 mmux_complexd$1_t margin)
  __attribute__((__const__));

mmux_cc_types_decl bool mmux_complexd$1_equal_relepsilon (mmux_complexd$1_t op1,
							  mmux_complexd$1_t op2,
							  mmux_complexd$1_t epsilon)
  __attribute__((__const__));
]]])]]])
m4_divert(0)m4_dnl

DEFINE_COMPARISON_PROTOS(32)
DEFINE_COMPARISON_PROTOS(64)
DEFINE_COMPARISON_PROTOS(128)


/** --------------------------------------------------------------------
 ** String representation and printing.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STRINGREP_PRINTING_PROTOS]]],[[[m4_dnl
mmux_cc_types_decl mmux_standard_decimal$1_t mmux_strtod$1 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));

mmux_cc_types_decl int mmux_strfromd$1 (char * s_value, size_t size, char const * restrict format,
					mmux_standard_decimal$1_t value)
  __attribute__((__nonnull__(3)));

/* ------------------------------------------------------------------ */

mmux_cc_types_decl bool mmux_string_is_decimal$1 (char const * s_value);

mmux_cc_types_decl bool mmux_decimal$1_parse  (mmux_decimal$1_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_types_decl bool mmux_decimal$1_sprint (char * ptr, int len, mmux_decimal$1_t value)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl int mmux_decimal$1_sprint_size (mmux_decimal$1_t value);

mmux_cc_types_decl bool mmux_decimal$1_dprintf (int fd, mmux_decimal$1_t value);

mmux_cc_types_decl bool mmux_decimal$1_fprintf (void * stream, mmux_decimal$1_t value)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_cc_types_decl bool mmux_string_is_complexd$1 (char const * s_value);

mmux_cc_types_decl bool mmux_complexd$1_parse  (mmux_complexd$1_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_cc_types_decl bool mmux_complexd$1_sprint (char * ptr, int len, mmux_complexd$1_t value)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl int mmux_complexd$1_sprint_size (mmux_complexd$1_t value);

mmux_cc_types_decl bool mmux_complexd$1_dprintf (int fd, mmux_complexd$1_t value);

mmux_cc_types_decl bool mmux_complexd$1_fprintf (void * stream, mmux_complexd$1_t value)
  __attribute__((__nonnull__(1)));
]]])]]])
m4_divert(0)m4_dnl

DEFINE_STRINGREP_PRINTING_PROTOS(32)
DEFINE_STRINGREP_PRINTING_PROTOS(64)
DEFINE_STRINGREP_PRINTING_PROTOS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_LIBDFP_H */

/* end of file */
