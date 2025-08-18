/*
  Part of: MMUX CC Types
  Contents: public header file for _DecimalN support
  Date: Aug 16, 2025

  Abstract

	This is the public header file defining the API of _DecimalN support.

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
 ** Preprocessor macros.
 ** ----------------------------------------------------------------- */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL32]]],[[[
#undef  mmux_standard_decimal32_literal
#define mmux_standard_decimal32_literal(VALUE)	(VALUE ## DF)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL64]]],[[[
#undef  mmux_standard_decimal64_literal
#define mmux_standard_decimal64_literal(VALUE)	(VALUE ## DD)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL128]]],[[[
#undef  mmux_standard_decimal128_literal
#define mmux_standard_decimal128_literal(VALUE)	(VALUE ## DL)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD32]]],[[[
#undef  mmux_standard_complexd32_part_literal
#define mmux_standard_complexd32_part_literal(VALUE)	(mmux_standard_decimal32_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD64]]],[[[
#undef  mmux_standard_complexd64_part_literal
#define mmux_standard_complexd64_part_literal(VALUE)	(mmux_standard_decimal64_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD128]]],[[[
#undef  mmux_standard_complexd128_part_literal
#define mmux_standard_complexd128_part_literal(VALUE)	(mmux_standard_decimal128_literal(VALUE))
]]])


/** --------------------------------------------------------------------
 ** Standard C types aliases.
 ** ----------------------------------------------------------------- */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL32]]],
[[[__extension__ typedef _Decimal32	mmux_standard_decimal32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL64]]],
[[[__extension__ typedef _Decimal64	mmux_standard_decimal64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL128]]],
[[[__extension__ typedef _Decimal128	mmux_standard_decimal128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD32]]],[[[typedef struct mmux_standard_complexd32_t {
  mmux_standard_decimal32_t	re;
  mmux_standard_decimal32_t	im;
} mmux_standard_complexd32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD64]]],[[[typedef struct mmux_standard_complexd64_t {
  mmux_standard_decimal64_t	re;
  mmux_standard_decimal64_t	im;
} mmux_standard_complexd64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD128]]],[[[typedef struct mmux_standard_complexd128_t {
  mmux_standard_decimal128_t	re;
  mmux_standard_decimal128_t	im;
} mmux_standard_complexd128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD32]]],
[[[typedef mmux_standard_decimal32_t		mmux_standard_complexd32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD64]]],
[[[typedef mmux_standard_decimal64_t		mmux_standard_complexd64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD128]]],
[[[typedef mmux_standard_decimal128_t		mmux_standard_complexd128_part_t;]]])


/** --------------------------------------------------------------------
 ** MMUX CC Types embedded type definitions.
 ** ----------------------------------------------------------------- */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL32]]], [[[
typedef struct mmux_decimal32_t	{ mmux_standard_decimal32_t	value; }	mmux_decimal32_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL64]]], [[[
typedef struct mmux_decimal64_t	{ mmux_standard_decimal64_t	value; }	mmux_decimal64_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL128]]],[[[
typedef struct mmux_decimal128_t { mmux_standard_decimal128_t	value; }	mmux_decimal128_t;
]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD32]]],
[[[typedef struct mmux_complexd32_t { mmux_standard_complexd32_t	value; }	mmux_complexd32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD64]]],
[[[typedef struct mmux_complexd64_t { mmux_standard_complexd64_t	value; }	mmux_complexd64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD128]]],
[[[typedef struct mmux_complexd128_t { mmux_standard_complexd128_t	value; }	mmux_complexd128_t;]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD32]]],  [[[typedef mmux_decimal32_t	mmux_complexd32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD64]]],  [[[typedef mmux_decimal64_t	mmux_complexd64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXD128]]], [[[typedef mmux_decimal128_t	mmux_complexd128_part_t;]]])


/** --------------------------------------------------------------------
 ** Makers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_dnl $1 - type stem
m4_dnl $2 - conditional definition symbol
m4_define([[[DEFINE_TYPE_MAKERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
#define mmux_$1(VALUE)		((mmux_$1_t){ .value = (VALUE) })
#define mmux_$1_literal(VALUE)	((mmux_$1_t){ .value = mmux_standard_$1_literal(VALUE) })
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_make (mmux_standard_$1_t value)
{
  return mmux_$1(value);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_TYPE_MAKERS(decimal32,		[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_TYPE_MAKERS(decimal64,		[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_TYPE_MAKERS(decimal128,		[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])
DEFINE_TYPE_MAKERS(complexd32,		[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_TYPE_MAKERS(complexd64,		[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_TYPE_MAKERS(complexd128,		[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])
DEFINE_TYPE_MAKERS(complexd32_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_TYPE_MAKERS(complexd64_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_TYPE_MAKERS(complexd128_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Prototypes of functions not implemented by the C compiler or the C library.
 ** ----------------------------------------------------------------- */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL32]]],[[[
mmux_cc_types_decl mmux_standard_decimal32_t mmux_strtod32 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd32 (char * s_value, size_t size, char const * restrict format,
					mmux_standard_decimal32_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL64]]],[[[
mmux_cc_types_decl mmux_standard_decimal64_t mmux_strtod64 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd64 (char * s_value, size_t size, char const * restrict format,
					mmux_standard_decimal64_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_DECIMAL128]]],[[[
mmux_cc_types_decl mmux_standard_decimal128_t mmux_strtod128 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd128 (char * s_value, size_t size, char const * restrict format,
					 mmux_standard_decimal128_t value)
  __attribute__((__nonnull__(3)));
]]])


/** --------------------------------------------------------------------
 ** Some complex number type functions: string_is, sizeof, make_rectangular, real part, imag part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - real part type stem
m4_define([[[DEFINE_COMPLEXD_BASIC_FUNCTIONS]]],[[[
__attribute__((__const__,__always_inline__)) static inline int
mmux_$1_sizeof (void)
{
  return sizeof(mmux_$1_t);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_make_rectangular (mmux_standard_$1_part_t re, mmux_standard_$1_part_t im)
{
  return ((mmux_standard_$1_t){re, im});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im)
{
  return mmux_$1_make( ((mmux_standard_$1_t){re.value, im.value}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_make_rectangular_literal (mmux_standard_$1_part_t re, mmux_standard_$1_part_t im)
{
  return mmux_$1_make( ((mmux_standard_$1_t){re, im}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_part_t
mmux_$1_real_part (mmux_$1_t Z)
{
  return mmux_$2_make(Z.value.re);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_part_t
mmux_$1_imag_part (mmux_$1_t Z)
{
  return mmux_$2_make(Z.value.im);
}

mmux_cc_types_decl mmux_$1_part_t mmux_$1_abs (mmux_$1_t Z)
  __attribute__((__const__));

mmux_cc_types_decl mmux_$1_part_t mmux_$1_arg (mmux_$1_t Z)
  __attribute__((__const__));

__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_conj (mmux_$1_t Z)
{
  return mmux_$1_make( ((mmux_standard_$1_t){Z.value.re, - Z.value.im}) );
}
]]])

DEFINE_COMPLEXD_BASIC_FUNCTIONS([[[complexd32]]],   [[[decimal32]]])
DEFINE_COMPLEXD_BASIC_FUNCTIONS([[[complexd64]]],   [[[decimal64]]])
DEFINE_COMPLEXD_BASIC_FUNCTIONS([[[complexd128]]],  [[[decimal128]]])


/** --------------------------------------------------------------------
 ** Arithmetics: real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_REAL_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){A.value + B.value});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){A.value - B.value});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){A.value * B.value});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){A.value / B.value});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return ((mmux_$1_t){- A.value});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  return mmux_$1_div((mmux_$1_t){1}, A);
}
]]])]]])

DEFINE_CORE_REAL_ARITHMETICS_FUNCTIONS([[[decimal32]]],		[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_CORE_REAL_ARITHMETICS_FUNCTIONS([[[decimal64]]],		[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_CORE_REAL_ARITHMETICS_FUNCTIONS([[[decimal128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Arithmetics: complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  auto	Cre = A.value.re + B.value.re;
  auto	Cim = A.value.im + B.value.im;
  return mmux_$1_make( ((mmux_standard_$1_t){Cre, Cim}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  auto	Cre = A.value.re - B.value.re;
  auto	Cim = A.value.im - B.value.im;

  return mmux_$1_make( ((mmux_standard_$1_t){Cre, Cim}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  auto	Cre = A.value.re * B.value.re - A.value.im * B.value.im;
  auto	Cim = A.value.re * B.value.im + B.value.re * A.value.im;

  return mmux_$1_make( ((mmux_standard_$1_t){Cre, Cim}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  auto	D   = B.value.re * B.value.re + B.value.im * B.value.im;
  auto	Cre = (A.value.re * B.value.re + A.value.im * B.value.im) / D;
  auto	Cim = (A.value.im * B.value.re - A.value.re * B.value.im) / D;

  return mmux_$1_make( ((mmux_standard_$1_t){Cre, Cim}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return mmux_$1_make( ((mmux_standard_$1_t){A.value.re, - A.value.im}) );
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  auto	D   = A.value.re * A.value.re + A.value.im * A.value.im;
  auto	Cre = A.value.re / D;
  auto	Cim = - (A.value.im / D);

  return mmux_$1_make( ((mmux_standard_$1_t){Cre, Cim}) );
}
]]])]]])

DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Mathematical constants.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATH_INEXACT_REAL_CONSTANTS_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_zero		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_one		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_two		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_E		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_LOG2E		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_LOG10E		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_LN2		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_LN10		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_PI		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_PI_2		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_PI_4		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_1_PI		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_2_PI		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_2_SQRTPI	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_SQRT2		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_SQRT1_2		(void) __attribute__((__const__));

mmux_cc_types_decl mmux_$1_t mmux_$1_constant_zero	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_one	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_two	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_E		(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_LOG2E	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_LOG10E	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_LN2	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_LN10	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_PI	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_PI_2	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_PI_4	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_1_PI	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_2_PI	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_2_SQRTPI	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_SQRT2	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_SQRT1_2	(void) __attribute__((__const__));
]]])]]])

DEFINE_MATH_INEXACT_REAL_CONSTANTS_PROTOS(decimal32,	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_MATH_INEXACT_REAL_CONSTANTS_PROTOS(decimal64,	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_MATH_INEXACT_REAL_CONSTANTS_PROTOS(decimal128,	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_MATH_COMPLEX_CONSTANTS_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_imag	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_zero	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_one	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_two	(void) __attribute__((__const__));

mmux_cc_types_decl mmux_$1_t mmux_$1_constant_imag	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_zero	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_one	(void) __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_constant_two	(void) __attribute__((__const__));
]]])]]])

DEFINE_MATH_COMPLEX_CONSTANTS_PROTOS(complexd32,	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_MATH_COMPLEX_CONSTANTS_PROTOS(complexd64,	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_MATH_COMPLEX_CONSTANTS_PROTOS(complexd128,	[[[MMUX_CC_TYPES_HAS_COPMLEXD32]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_LIBDFP_H */

/* end of file */
