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
#include <stddef.h>	/* for "size_t", etc. */
#include <inttypes.h>	/* for "int8_t", etc. */
#include <complex.h>
#include <mmux-cc-types-generics.h>


/** --------------------------------------------------------------------
 ** Preprocessor macros.
 ** ----------------------------------------------------------------- */

#undef  mmux_standard_unsigned_literal
#define mmux_standard_unsigned_literal(X)	(X ## U)

#undef  mmux_standard_pointer_literal
#define mmux_standard_pointer_literal(X)	((void *)(mmux_standard_unsigned_literal(X)))

#undef  mmux_standard_pointerc_literal
#define mmux_standard_pointerc_literal(X)	((void const *)(mmux_standard_unsigned_literal(X)))

#undef  mmux_standard_char_literal
m4_ifelse([[[MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4]]],[[[1]]],[[[m4_dnl
#define mmux_standard_char_literal(X)		(mmux_standard_unsigned_literal(X))
]]],[[[m4_dnl
#define mmux_standard_char_literal(X)		(X)
]]])m4_dnl

#undef  mmux_standard_schar_literal
#define mmux_standard_schar_literal(X)		(X)

#undef  mmux_standard_uchar_literal
#define mmux_standard_uchar_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_sshort_literal
#define mmux_standard_sshort_literal(X)		(X)

#undef  mmux_standard_ushort_literal
#define mmux_standard_ushort_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_sint_literal
#define mmux_standard_sint_literal(X)		(X)

#undef  mmux_standard_uint_literal
#define mmux_standard_uint_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_slong_literal
#define mmux_standard_slong_literal(X)		(X)

#undef  mmux_standard_ulong_literal
#define mmux_standard_ulong_literal(X)		(mmux_standard_unsigned_literal(X))

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[
#undef  mmux_standard_sllong_literal
#define mmux_standard_sllong_literal(X)		(X ## LL)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_ULLONG]]],[[[
#undef  mmux_standard_ullong_literal
#define mmux_standard_ullong_literal(X)		(X ## ULL)
]]])

#undef  mmux_standard_sint8_literal
#define mmux_standard_sint8_literal(X)		(X)

#undef  mmux_standard_uint8_literal
#define mmux_standard_uint8_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_sint16_literal
#define mmux_standard_sint16_literal(X)		(X)

#undef  mmux_standard_uint16_literal
#define mmux_standard_uint16_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_sint32_literal
#define mmux_standard_sint32_literal(X)		(X)

#undef  mmux_standard_uint32_literal
#define mmux_standard_uint32_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_sint64_literal
#define mmux_standard_sint64_literal(X)		(X)

#undef  mmux_standard_uint64_literal
#define mmux_standard_uint64_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_byte_literal
#define mmux_standard_byte_literal(X)		(X)

#undef  mmux_standard_octet_literal
#define mmux_standard_octet_literal(X)		(mmux_standard_unsigned_literal(X))

#undef  mmux_standard_float_literal
#define mmux_standard_float_literal(X)		(X ## F)

#undef  mmux_standard_double_literal
#define mmux_standard_double_literal(X)		(X)

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_LDOUBLE]]],[[[
#undef  mmux_standard_ldouble_literal
#define mmux_standard_ldouble_literal(X)	(X ## L)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32]]],[[[
#undef  mmux_standard_float32_literal
#define mmux_standard_float32_literal(X)	(X ## f32)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64]]],[[[
#undef  mmux_standard_float64_literal
#define mmux_standard_float64_literal(X)	(X ## f64)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128]]],[[[
#undef  mmux_standard_float128_literal
#define mmux_standard_float128_literal(X)	(X ## f128)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32X]]],[[[
#undef  mmux_standard_float32x_literal
#define mmux_standard_float32x_literal(X)	(X ## f32x)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64X]]],[[[
#undef  mmux_standard_float64x_literal
#define mmux_standard_float64x_literal(X)	(X ## f64x)
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128X]]],[[[
#undef  mmux_standard_float128x_literal
#define mmux_standard_float128x_literal(X)	(X ## f128x)
]]])

m4_define([[[DEFINE_ALIASED_INTEGER_LITERAL_MACRO]]],[[[
#undef  mmux_standard_$1_literal
#define mmux_standard_$1_literal(X)		(mmux_standard_[[[]]]$2[[[]]]_literal(X))
]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(ssize,	[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(usize,	[[[MMUX_CC_TYPES_STEM_ALIAS_USIZE]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(sintmax,	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTMAX]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(uintmax,	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTMAX]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(sintptr,	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTPTR]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(uintptr,	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTPTR]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(mode,	[[[MMUX_CC_TYPES_STEM_ALIAS_MODE]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(off,	[[[MMUX_CC_TYPES_STEM_ALIAS_OFF]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(pid,	[[[MMUX_CC_TYPES_STEM_ALIAS_PID]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(uid,	[[[MMUX_CC_TYPES_STEM_ALIAS_UID]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(gid,	[[[MMUX_CC_TYPES_STEM_ALIAS_GID]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(ptrdiff,	[[[MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(wchar,	[[[MMUX_CC_TYPES_STEM_ALIAS_WCHAR]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(wint,	[[[MMUX_CC_TYPES_STEM_ALIAS_WINT]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(time,	[[[MMUX_CC_TYPES_STEM_ALIAS_TIME]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(socklen,	[[[MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN]]])
DEFINE_ALIASED_INTEGER_LITERAL_MACRO(rlim,	[[[MMUX_CC_TYPES_STEM_ALIAS_RLIM]]])

/* ------------------------------------------------------------------ */

#undef  mmux_standard_complexf_part_literal
#define mmux_standard_complexf_part_literal(VALUE)	(mmux_standard_float_literal(VALUE))

#undef  mmux_standard_complexd_part_literal
#define mmux_standard_complexd_part_literal(VALUE)	(mmux_standard_double_literal(VALUE))

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXLD]]],[[[
#undef  mmux_standard_complexld_part_literal
#define mmux_standard_complexld_part_literal(VALUE)	(mmux_standard_ldouble_literal(VALUE))
]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32]]],[[[
#undef  mmux_standard_complexf32_part_literal
#define mmux_standard_complexf32_part_literal(VALUE)	(mmux_standard_float32_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64]]],[[[
#undef  mmux_standard_complexf64_part_literal
#define mmux_standard_complexf64_part_literal(VALUE)	(mmux_standard_float64_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128]]],[[[
#undef  mmux_standard_complexf128_part_literal
#define mmux_standard_complexf128_part_literal(VALUE)	(mmux_standard_float128_literal(VALUE))
]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]],[[[
#undef  mmux_standard_complexf32x_part_literal
#define mmux_standard_complexf32x_part_literal(VALUE)	(mmux_standard_float32x_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]],[[[
#undef  mmux_standard_complexf64x_part_literal
#define mmux_standard_complexf64x_part_literal(VALUE)	(mmux_standard_float64x_literal(VALUE))
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],[[[
#undef  mmux_standard_complexf128x_part_literal
#define mmux_standard_complexf128x_part_literal(VALUE)	(mmux_standard_float128x_literal(VALUE))
]]])


/** --------------------------------------------------------------------
 ** Initialisation functions.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_cc_types_init (void)
  __attribute__((__constructor__));


/** --------------------------------------------------------------------
 ** Standard C types aliases.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_standard_pointer_t;

typedef char			mmux_standard_char_t;
typedef signed char		mmux_standard_schar_t;
typedef unsigned char		mmux_standard_uchar_t;

typedef signed short int	mmux_standard_sshort_t;
typedef unsigned short int	mmux_standard_ushort_t;
typedef signed int		mmux_standard_sint_t;
typedef unsigned int		mmux_standard_uint_t;
typedef signed long int		mmux_standard_slong_t;
typedef unsigned long int	mmux_standard_ulong_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[typedef signed long long int	mmux_standard_sllong_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[typedef unsigned long long int	mmux_standard_ullong_t;]]])

typedef int8_t			mmux_standard_sint8_t;
typedef uint8_t			mmux_standard_uint8_t;
typedef int16_t			mmux_standard_sint16_t;
typedef uint16_t		mmux_standard_uint16_t;
typedef int32_t			mmux_standard_sint32_t;
typedef uint32_t		mmux_standard_uint32_t;
typedef int64_t			mmux_standard_sint64_t;
typedef uint64_t		mmux_standard_uint64_t;

typedef mmux_standard_sint8_t	mmux_standard_byte_t;
typedef mmux_standard_uint8_t	mmux_standard_octet_t;

typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SSIZE[[[]]]_t	mmux_standard_ssize_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_USIZE[[[]]]_t	mmux_standard_usize_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SINTMAX[[[]]]_t	mmux_standard_sintmax_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UINTMAX[[[]]]_t	mmux_standard_uintmax_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SINTPTR[[[]]]_t	mmux_standard_sintptr_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UINTPTR[[[]]]_t	mmux_standard_uintptr_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_MODE[[[]]]_t	mmux_standard_mode_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_OFF[[[]]]_t	mmux_standard_off_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_PID[[[]]]_t	mmux_standard_pid_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UID[[[]]]_t	mmux_standard_uid_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_GID[[[]]]_t	mmux_standard_gid_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF[[[]]]_t	mmux_standard_ptrdiff_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_WCHAR[[[]]]_t	mmux_standard_wchar_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_WINT[[[]]]_t	mmux_standard_wint_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_TIME[[[]]]_t	mmux_standard_time_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN[[[]]]_t	mmux_standard_socklen_t;
typedef mmux_standard_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_RLIM[[[]]]_t	mmux_standard_rlim_t;

typedef float			mmux_standard_float_t;
typedef double			mmux_standard_double_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_LDOUBLE]]],[[[typedef long double	mmux_standard_ldouble_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32]]],   [[[__extension__ typedef _Float32	mmux_standard_float32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64]]],   [[[__extension__ typedef _Float64	mmux_standard_float64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128]]],  [[[__extension__ typedef _Float128	mmux_standard_float128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32X]]],  [[[__extension__ typedef _Float32x	mmux_standard_float32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64X]]],  [[[__extension__ typedef _Float64x	mmux_standard_float64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128X]]], [[[__extension__ typedef _Float128x	mmux_standard_float128x_t;]]])

typedef float complex		mmux_standard_complexf_t;
typedef double complex		mmux_standard_complexd_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXLD]]], [[[typedef long double complex	mmux_standard_complexld_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32]]], [[[__extension__ typedef _Float32 complex	mmux_standard_complexf32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64]]], [[[__extension__ typedef _Float64 complex	mmux_standard_complexf64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128]]],[[[__extension__ typedef _Float128 complex	mmux_standard_complexf128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]], [[[__extension__ typedef _Float32x complex	mmux_standard_complexf32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]], [[[__extension__ typedef _Float64x complex	mmux_standard_complexf64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],[[[__extension__ typedef _Float128x complex	mmux_standard_complexf128x_t;]]])

typedef mmux_standard_float_t		mmux_standard_complexf_part_t;
typedef mmux_standard_double_t		mmux_standard_complexd_part_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXLD]]],
[[[typedef mmux_standard_ldouble_t	mmux_standard_complexld_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32]]],
[[[typedef mmux_standard_float32_t	mmux_standard_complexf32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64]]],
[[[typedef mmux_standard_float64_t	mmux_standard_complexf64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128]]],
[[[typedef mmux_standard_float128_t	mmux_standard_complexf128_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]],
[[[typedef mmux_standard_float32x_t	mmux_standard_complexf32x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]],
[[[typedef mmux_standard_float64x_t	mmux_standard_complexf64x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],
[[[typedef mmux_standard_float128x_t	mmux_standard_complexf128x_part_t;]]])


/** --------------------------------------------------------------------
 ** MMUX CC Types embedded type definitions.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_pointer_t;
typedef void const *		mmux_pointerc_t;

/* NOTE  We cannot  declare the  "value" field  as "const"  in the  structures below.
 * Let's say we declare:
 *
 *   typedef struct mmux_sint_t { mmux_standard_sint_t const value; } mmux_sint_t;
 *
 * then we define a function like:
 *
 *   void
 *   doit (mmux_sint_t * result_p)
 *   {
 *     *result_p = mmux_sint(123);
 *   }
 *
 * compiling  the function  fails because  assigning the  variable referenced  by the
 * pointer "result_p"  would mutate the  immutable field "value".  (Marco  Maggi; Aug
 * 15, 2025)
 */
typedef struct mmux_char_t	{ mmux_standard_char_t		value; }	mmux_char_t;
typedef struct mmux_schar_t	{ mmux_standard_schar_t		value; }	mmux_schar_t;
typedef struct mmux_uchar_t	{ mmux_standard_uchar_t		value; }	mmux_uchar_t;

typedef struct mmux_sshort_t	{ mmux_standard_sshort_t	value; }	mmux_sshort_t;
typedef struct mmux_ushort_t	{ mmux_standard_ushort_t	value; }	mmux_ushort_t;
typedef struct mmux_sint_t	{ mmux_standard_sint_t		value; }	mmux_sint_t;
typedef struct mmux_uint_t	{ mmux_standard_uint_t		value; }	mmux_uint_t;
typedef struct mmux_slong_t	{ mmux_standard_slong_t		value; }	mmux_slong_t;
typedef struct mmux_ulong_t	{ mmux_standard_ulong_t		value; }	mmux_ulong_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[
typedef struct mmux_sllong_t	{ mmux_standard_sllong_t	value; }	mmux_sllong_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_ULLONG]]],[[[
typedef struct mmux_ullong_t	{ mmux_standard_ullong_t	value; }	mmux_ullong_t;
]]])

typedef struct mmux_sint8_t	{ mmux_standard_sint8_t		value; }	mmux_sint8_t;
typedef struct mmux_uint8_t	{ mmux_standard_uint8_t		value; }	mmux_uint8_t;
typedef struct mmux_sint16_t	{ mmux_standard_sint16_t	value; }	mmux_sint16_t;
typedef struct mmux_uint16_t	{ mmux_standard_uint16_t	value; }	mmux_uint16_t;
typedef struct mmux_sint32_t	{ mmux_standard_sint32_t	value; }	mmux_sint32_t;
typedef struct mmux_uint32_t	{ mmux_standard_uint32_t	value; }	mmux_uint32_t;
typedef struct mmux_sint64_t	{ mmux_standard_sint64_t	value; }	mmux_sint64_t;
typedef struct mmux_uint64_t	{ mmux_standard_uint64_t	value; }	mmux_uint64_t;

typedef struct mmux_byte_t	{ mmux_sint8_t; }		mmux_byte_t;
typedef struct mmux_octet_t	{ mmux_uint8_t; }		mmux_octet_t;

typedef struct mmux_float_t	{ mmux_standard_float_t		value; }	mmux_float_t;
typedef struct mmux_double_t	{ mmux_standard_double_t	value; }	mmux_double_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_LDOUBLE]]],  [[[
typedef struct mmux_ldouble_t	{ mmux_standard_ldouble_t	value; }	mmux_ldouble_t;
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32]]],   [[[
typedef struct mmux_float32_t	{ mmux_standard_float32_t	value; }	mmux_float32_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64]]],   [[[
typedef struct mmux_float64_t	{ mmux_standard_float64_t	value; }	mmux_float64_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128]]],  [[[
typedef struct mmux_float128_t	{ mmux_standard_float128_t	value; }	mmux_float128_t;
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT32X]]],  [[[
typedef struct mmux_float32x_t	{ mmux_standard_float32x_t	value; }	mmux_float32x_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT64X]]],  [[[
typedef struct mmux_float64x_t	{ mmux_standard_float64x_t	value; }	mmux_float64x_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLOAT128X]]], [[[
typedef struct mmux_float128x_t	{ mmux_standard_float128x_t	value; }	mmux_float128x_t;
]]])

/* ------------------------------------------------------------------ */

typedef struct mmux_complexf_t	{ mmux_standard_complexf_t	value; }	mmux_complexf_t;
typedef struct mmux_complexd_t	{ mmux_standard_complexd_t	value; }	mmux_complexd_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXLD]]],  [[[
typedef struct mmux_complexld_t	{ mmux_standard_complexld_t	value; }	mmux_complexld_t;
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32]]], [[[
typedef struct mmux_complexf32_t { mmux_standard_complexf32_t	value; }      mmux_complexf32_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64]]], [[[
typedef struct mmux_complexf64_t { mmux_standard_complexf64_t	value; }      mmux_complexf64_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128]]],[[[
typedef struct mmux_complexf128_t { mmux_standard_complexf128_t	value; }      mmux_complexf128_t;
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]], [[[
typedef struct mmux_complexf32x_t { mmux_standard_complexf32x_t	value; }      mmux_complexf32x_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]], [[[
typedef struct mmux_complexf64x_t { mmux_standard_complexf64x_t value; }      mmux_complexf64x_t;
]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],[[[
typedef struct mmux_complexf128x_t { mmux_standard_complexf128x_t value; }	mmux_complexf128x_t;
]]])

typedef mmux_float_t		mmux_complexf_part_t;
typedef mmux_double_t		mmux_complexd_part_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_LDOUBLE]]],     [[[typedef mmux_ldouble_t	mmux_complexld_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32]]],  [[[typedef mmux_float32_t	mmux_complexf32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64]]],  [[[typedef mmux_float64_t	mmux_complexf64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128]]], [[[typedef mmux_float128_t	mmux_complexf128_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]], [[[typedef mmux_float32x_t	mmux_complexf32x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]], [[[typedef mmux_float64x_t	mmux_complexf64x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],[[[typedef mmux_float128x_t	mmux_complexf128x_part_t;]]])

/* ------------------------------------------------------------------ */

typedef struct mmux_ssize_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SSIZE[[[]]]_t;	}     mmux_ssize_t;
typedef struct mmux_usize_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_USIZE[[[]]]_t;	}     mmux_usize_t;
typedef struct mmux_sintmax_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SINTMAX[[[]]]_t;	}     mmux_sintmax_t;
typedef struct mmux_uintmax_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UINTMAX[[[]]]_t;	}     mmux_uintmax_t;
typedef struct mmux_sintptr_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SINTPTR[[[]]]_t;	}     mmux_sintptr_t;
typedef struct mmux_uintptr_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UINTPTR[[[]]]_t;	}     mmux_uintptr_t;
typedef struct mmux_mode_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_MODE[[[]]]_t;	}     mmux_mode_t;
typedef struct mmux_off_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_OFF[[[]]]_t;	}     mmux_off_t;
typedef struct mmux_pid_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_PID[[[]]]_t;	}     mmux_pid_t;
typedef struct mmux_uid_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_UID[[[]]]_t;	}     mmux_uid_t;
typedef struct mmux_gid_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_GID[[[]]]_t;	}     mmux_gid_t;
typedef struct mmux_ptrdiff_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF[[[]]]_t;	}     mmux_ptrdiff_t;
typedef struct mmux_wchar_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_WCHAR[[[]]]_t;	}     mmux_wchar_t;
typedef struct mmux_wint_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_WINT[[[]]]_t;	}     mmux_wint_t;
typedef struct mmux_time_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_TIME[[[]]]_t;	}     mmux_time_t;
typedef struct mmux_socklen_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN[[[]]]_t;	}     mmux_socklen_t;
typedef struct mmux_rlim_t	{ mmux_[[[]]]MMUX_CC_TYPES_STEM_ALIAS_RLIM[[[]]]_t;	}     mmux_rlim_t;

/* ------------------------------------------------------------------ */

typedef char *				mmux_asciip_t;
typedef char **				mmux_asciipp_t;
typedef char ***			mmux_asciippp_t;

typedef char *				mmux_asciizp_t;
typedef char **				mmux_asciizpp_t;
typedef char ***			mmux_asciizppp_t;

typedef char const *			mmux_asciicp_t;
typedef char const **			mmux_asciicpp_t;
typedef char const ***			mmux_asciicppp_t;

typedef char const *			mmux_asciizcp_t;
typedef char const **			mmux_asciizcpp_t;
typedef char const ***			mmux_asciizcppp_t;


/** --------------------------------------------------------------------
 ** Makers.
 ** ----------------------------------------------------------------- */

#if 0
__attribute__((__const__,__always_inline__))
static inline mmux_pointer_t
mmux_pointer (void * value)
{
  return (mmux_pointer_t) value;
}
__attribute__((__const__,__always_inline__)) static inline mmux_pointerc_t
mmux_pointerc (void const * value)
{
  return ((mmux_pointerc_t)(value));
}
#else
#  undef  mmux_pointer
#  define mmux_pointer(VALUE)		((mmux_pointer_t)(VALUE))
#  undef  mmux_pointerc
#  define mmux_pointerc(VALUE)		((mmux_pointer_t)(VALUE))
#endif

#undef  mmux_pointer_literal
#define mmux_pointer_literal(VALUE)	(mmux_pointer(mmux_standard_pointer_literal(VALUE)))

#undef  mmux_pointerc_literal
#define mmux_pointerc_literal(VALUE)	(mmux_pointerc(mmux_standard_pointerc_literal(VALUE)))

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_dnl $1 - type stem
m4_dnl $2 - conditional definition symbol
m4_define([[[DEFINE_TYPE_MAKERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
/* NOTE I would really like to define the maker as an inline function.  Because.  But
 * with the function we cannot declare a  new variable as "constexpr", while with the
 * macro we can.  For example, the following code:
 *
 *  constexpr auto	buflen = mmux_usize(1024);
 *
 * works fine  under GCC-C23  with macros,  it does  not work  with functions.   I am
 * disappointed, but for now "constexpr" wins.  (Marco Maggi; Aug 20, 2025)
 */
#if 0
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1 (mmux_standard_$1_t value)
{
  return ((mmux_$1_t){ .value = value });
}
#else
#  undef  mmux_$1
#  define mmux_$1(VALUE)		((mmux_$1_t){ .value = (VALUE) })
#endif

#undef  mmux_$1_literal
#define mmux_$1_literal(VALUE)		(mmux_$1(mmux_standard_$1_literal(VALUE)))
]]])]]])
m4_divert(0)m4_dnl
DEFINE_TYPE_MAKERS(char)
DEFINE_TYPE_MAKERS(schar)
DEFINE_TYPE_MAKERS(uchar)
DEFINE_TYPE_MAKERS(sshort)
DEFINE_TYPE_MAKERS(ushort)
DEFINE_TYPE_MAKERS(sint)
DEFINE_TYPE_MAKERS(uint)
DEFINE_TYPE_MAKERS(slong)
DEFINE_TYPE_MAKERS(ulong)
DEFINE_TYPE_MAKERS(sllong,		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_TYPE_MAKERS(ullong,		[[[MMUX_CC_TYPES_HAS_ULLONG]]])
DEFINE_TYPE_MAKERS(sint8)
DEFINE_TYPE_MAKERS(uint8)
DEFINE_TYPE_MAKERS(sint16)
DEFINE_TYPE_MAKERS(uint16)
DEFINE_TYPE_MAKERS(sint32)
DEFINE_TYPE_MAKERS(uint32)
DEFINE_TYPE_MAKERS(sint64)
DEFINE_TYPE_MAKERS(uint64)
DEFINE_TYPE_MAKERS(byte)
DEFINE_TYPE_MAKERS(octet)
DEFINE_TYPE_MAKERS(float)
DEFINE_TYPE_MAKERS(double)
DEFINE_TYPE_MAKERS(ldouble,		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])
DEFINE_TYPE_MAKERS(float32,		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_TYPE_MAKERS(float64,		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_TYPE_MAKERS(float128,		[[[MMUX_CC_TYPES_HAS_FLOAT128]]])
DEFINE_TYPE_MAKERS(float32x,		[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_TYPE_MAKERS(float64x,		[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_TYPE_MAKERS(float128x,		[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])
DEFINE_TYPE_MAKERS(complexf)
DEFINE_TYPE_MAKERS(complexd)
DEFINE_TYPE_MAKERS(complexld,		[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])
DEFINE_TYPE_MAKERS(complexf32,		[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_TYPE_MAKERS(complexf64,		[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_TYPE_MAKERS(complexf128,		[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])
DEFINE_TYPE_MAKERS(complexf32x,		[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_TYPE_MAKERS(complexf64x,		[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_TYPE_MAKERS(complexf128x,	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])
DEFINE_TYPE_MAKERS(complexf_part)
DEFINE_TYPE_MAKERS(complexd_part)
DEFINE_TYPE_MAKERS(complexld_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])
DEFINE_TYPE_MAKERS(complexf32_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_TYPE_MAKERS(complexf64_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_TYPE_MAKERS(complexf128_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])
DEFINE_TYPE_MAKERS(complexf32x_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_TYPE_MAKERS(complexf64x_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_TYPE_MAKERS(complexf128x_part,	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])
DEFINE_TYPE_MAKERS(ssize)
DEFINE_TYPE_MAKERS(usize)
DEFINE_TYPE_MAKERS(sintmax)
DEFINE_TYPE_MAKERS(uintmax)
DEFINE_TYPE_MAKERS(sintptr)
DEFINE_TYPE_MAKERS(uintptr)
DEFINE_TYPE_MAKERS(mode)
DEFINE_TYPE_MAKERS(off)
DEFINE_TYPE_MAKERS(pid)
DEFINE_TYPE_MAKERS(uid)
DEFINE_TYPE_MAKERS(gid)
DEFINE_TYPE_MAKERS(ptrdiff)
DEFINE_TYPE_MAKERS(wchar)
DEFINE_TYPE_MAKERS(wint)
DEFINE_TYPE_MAKERS(time)
DEFINE_TYPE_MAKERS(socklen)
DEFINE_TYPE_MAKERS(rlim)


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl char const *	mmux_cc_types_version_string		(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_current	(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_revision(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Support for _DecimalN.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_DECIMAL32) || \
     (defined MMUX_CC_TYPES_HAS_DECIMAL64) || \
     (defined MMUX_CC_TYPES_HAS_DECIMAL128))
#  include <mmux-cc-types-libdfp.h>
#endif


/** --------------------------------------------------------------------
 ** Basic functions for complex floating-point types.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_make_rectangular (mmux_standard_$1_part_t re,
									 mmux_standard_$1_part_t im)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t      mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t      mmux_$1_make_rectangular_literal (mmux_standard_$1_part_t re,
								    mmux_standard_$1_part_t im)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_part_t mmux_$1_real_part (mmux_$1_t Z)	__attribute__((__const__));
mmux_cc_types_decl mmux_$1_part_t mmux_$1_imag_part (mmux_$1_t Z)	__attribute__((__const__));
mmux_cc_types_decl mmux_$1_part_t mmux_$1_abs  (mmux_$1_t Z)		__attribute__((__const__));
mmux_cc_types_decl mmux_$1_part_t mmux_$1_arg  (mmux_$1_t Z)		__attribute__((__const__));
mmux_cc_types_decl mmux_$1_t      mmux_$1_conj (mmux_$1_t Z)		__attribute__((__const__));
]]])]]])

DEFINE_PROTOS([[[complexf]]])
DEFINE_PROTOS([[[complexd]]])
DEFINE_PROTOS([[[complexld]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_PROTOS([[[complexf32]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_PROTOS([[[complexf64]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_PROTOS([[[complexf128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_PROTOS([[[complexf32x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_PROTOS([[[complexf64x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_PROTOS([[[complexf128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_PROTOS([[[complexd32]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_PROTOS([[[complexd64]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_PROTOS([[[complexd128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_define([[[DEFINE_TYPE_PROTOS_ALL_NUMBERS]]],[[[m4_dnl
typedef mmux_$1_t mmux_cc_types_nullary_operation_$1_t (void);
typedef mmux_$1_t mmux_cc_types_unary_operation_$1_t   (mmux_$1_t X);
typedef mmux_$1_t mmux_cc_types_binary_operation_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef mmux_$1_t mmux_cc_types_ternary_operation_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);
typedef bool      mmux_cc_types_unary_predicate_$1_t   (mmux_$1_t X);
typedef bool      mmux_cc_types_binary_predicate_$1_t  (mmux_$1_t X, mmux_$1_t Y);
typedef bool      mmux_cc_types_ternary_predicate_$1_t (mmux_$1_t X, mmux_$1_t Y, mmux_$1_t Z);

mmux_cc_types_decl bool mmux_string_is_$1 (char const * s_value);
mmux_cc_types_decl int mmux_$1_sizeof (void)
  __attribute__((__const__));
mmux_cc_types_decl bool mmux_$1_parse  (mmux_$1_t * p_value, char const * s_value, char const * who)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl bool mmux_$1_sprint (char * ptr, int len, mmux_$1_t value)
  __attribute__((__nonnull__(1)));
mmux_cc_types_decl int mmux_$1_sprint_size (mmux_$1_t value);
mmux_cc_types_decl bool mmux_$1_dprintf (mmux_standard_sint_t fd, mmux_$1_t value);
mmux_cc_types_decl bool mmux_$1_fprintf (mmux_pointer_t stream, mmux_$1_t value)
  __attribute__((__nonnull__(1)));
]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_REAL_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
mmux_cc_types_decl mmux_cc_types_nullary_operation_$1_t mmux_$1_minimum __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_nullary_operation_$1_t mmux_$1_maximum __attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_operation_$1_t	mmux_$1_abs	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_$1_t	mmux_$1_max	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_operation_$1_t	mmux_$1_min	__attribute__((__const__));

mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_minimum (void) __attribute__((__const__));
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_maximum (void) __attribute__((__const__));
]]])]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
]]])]]])

m4_dnl ----------------------------------------------------------------

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

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint8]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint8]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint16]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint16]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint64]]])

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
 ** Type predicate prototypes.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_char_is_unsigned (void)
  __attribute__((__const__));

m4_define([[[DEFINE_PREDICATE_PROTOS_REAL_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_zero		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_nan		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_infinite	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_negative	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_negative	__attribute__((__const__));
mmux_cc_types_decl int mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_equal		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater_equal	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less_equal	__attribute__((__const__));
]]])]]])

m4_define([[[DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_zero		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_negative	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_positive	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_negative	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_nan		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_infinite	__attribute__((__const__));
mmux_cc_types_decl int mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_equal		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less		__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater_equal	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_less_equal	__attribute__((__const__));
]]])]]])

m4_define([[[DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_ternary_predicate_$1_t mmux_$1_equal_absmargin	__attribute__((__const__));
mmux_cc_types_decl mmux_cc_types_ternary_predicate_$1_t mmux_$1_equal_relepsilon __attribute__((__const__));
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[char]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint8]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint8]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint16]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint16]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint64]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ssize]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[usize]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sintmax]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uintmax]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sintptr]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uintptr]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[mode]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[off]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[pid]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uid]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[gid]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ptrdiff]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[wchar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[wint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[time]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[socklen]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[rlim]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[double]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[ldouble]]],	[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal32]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal64]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexld]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf32x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf64x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating point numbers.
 ** ----------------------------------------------------------------- */

#undef  MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN
#define MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN		(1+8)

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl bool mmux_$1_set_output_format (char const * new_result_format, char const * who)
  __attribute__((__nonnull__(1)));

mmux_cc_types_decl char const * mmux_$1_ref_output_format  (void);
mmux_cc_types_decl void         mmux_$1_save_output_format (char * dest);
]]])]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[double]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[ldouble]]],	[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float32]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float64]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float128]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float32x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float64x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float128x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal32]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal64]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Mathematical constants: exact real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_zero (void)
{
  return (mmux_standard_$1_t)(0);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_one (void)
{
  return (mmux_standard_$1_t)(1);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_two (void)
{
  return (mmux_standard_$1_t)(2);
}

__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_zero (void)
{
  return mmux_$1(mmux_standard_$1_literal(0));
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_one (void)
{
  return mmux_$1(mmux_standard_$1_literal(1));
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_two (void)
{
  return mmux_$1(mmux_standard_$1_literal(2));
}
]]])]]])

DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(char)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(schar)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uchar)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sshort)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(ushort)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sint)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uint)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(slong)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(ulong)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sllong)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(ullong)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sint8)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uint8)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sint16)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uint16)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sint32)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uint32)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sint64)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uint64)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(byte)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(octet)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(ssize)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(usize)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sintmax)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uintmax)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(sintptr)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uintptr)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(mode)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(off)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(pid)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(uid)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(gid)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(ptrdiff)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(wchar)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(wint)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(time)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(socklen)
DEFINE_MATH_EXACT_REAL_CONSTANTS_FUNCS(rlim)


/** --------------------------------------------------------------------
 ** Mathematical constants: inexact real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_zero (void)
{
  return mmux_standard_$1_literal(0.0);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_one (void)
{
  return mmux_standard_$1_literal(1.0);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_two (void)
{
  return mmux_standard_$1_literal(2.0);
}
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

__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_zero (void)
{
  return mmux_$1(mmux_standard_$1_constant_zero());
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_one (void)
{
  return mmux_$1(mmux_standard_$1_constant_one());
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_two (void)
{
  return mmux_$1(mmux_standard_$1_constant_two());
}
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

DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float)
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(double)
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(ldouble,		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float32,		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float64,		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float128,	[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float32x,	[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float64x,	[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_INEXACT_REAL_CONSTANTS_PROTOS_AND_FUNCS(float128x,	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Mathematical constants: inexact complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_imag (void)
{
  return mmux_standard_$1_make_rectangular(mmux_standard_$2_constant_zero(), mmux_standard_$2_constant_one());
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_zero (void)
{
  return mmux_standard_$1_make_rectangular(mmux_standard_$2_constant_zero(), mmux_standard_$2_constant_zero());
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_one (void)
{
  return mmux_standard_$1_make_rectangular(mmux_standard_$2_constant_one(), mmux_standard_$2_constant_zero());
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_$1_t
mmux_standard_$1_constant_two (void)
{
  return mmux_standard_$1_make_rectangular(mmux_standard_$2_constant_two(), mmux_standard_$2_constant_zero());
}

/* ------------------------------------------------------------------ */

__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_imag (void)
{
  return mmux_$1(mmux_standard_$1_constant_imag());
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_zero (void)
{
  return mmux_$1(mmux_standard_$1_constant_zero());
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_one (void)
{
  return mmux_$1(mmux_standard_$1_constant_one());
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_constant_two (void)
{
  return mmux_$1(mmux_standard_$1_constant_two());
}
]]])]]])

DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf,		float)
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexd,		double)
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexld,		ldouble,	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf32,		float32,	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf64,		float64,	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf128,	float128,	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf32x,	float32x,	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf64x,	float64x,	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_MATH_COMPLEX_CONSTANTS_FUNCS(complexf128x,	float128x,	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])


/** --------------------------------------------------------------------
 ** Core arithmetics functions.
 ** ----------------------------------------------------------------- */

__attribute__((__const__,__always_inline__)) static inline mmux_pointer_t
mmux_pointer_add (mmux_pointer_t op, mmux_ptrdiff_t delta)
{
  auto	op_octets  = (mmux_standard_uint8_t *)op;
  auto	rop_octets = op_octets + delta.value;
  auto	rop        = mmux_pointer(rop_octets);
  return rop;
}
__attribute__((__const__,__always_inline__)) static inline mmux_ptrdiff_t
mmux_pointer_sub (mmux_pointer_t ptr1, mmux_pointer_t ptr2)
{
  auto	ptr1_octets  = (mmux_standard_uint8_t *)ptr1;
  auto	ptr2_octets  = (mmux_standard_uint8_t *)ptr2;
  auto	delta        = mmux_ptrdiff(ptr1_octets - ptr2_octets);
  return delta;
}

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  return mmux_$1(A.value + B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  return mmux_$1(A.value - B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  return mmux_$1(A.value * B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  return mmux_$1(A.value / B.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return mmux_$1(- A.value);
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  return mmux_$1_div(mmux_$1_constant_one(), A);
}
]]])]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[char]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[schar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uchar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sshort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ushort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[slong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ulong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[double]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ldouble]]],	[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexd]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexld]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXLD]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint64]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){{A.value + B.value}});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){{A.value - B.value}});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){{A.value * B.value}});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  return ((mmux_$1_t){{A.value / B.value}});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return ((mmux_$1_t){{- A.value}});
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  return mmux_$1_div((mmux_$1_t){{1}}, A);
}
]]])]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[usize]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[ssize]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[sintmax]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTMAX]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[uintmax]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTMAX]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[sintptr]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTPTR]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[uintptr]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTPTR]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[ptrdiff]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[mode]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_MODE]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[off]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_OFF]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[pid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_PID]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[uid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UID]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[gid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_GID]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[wchar]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_WCHAR]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[wint]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_WINT]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[time]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_TIME]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[socklen]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS_FOR_ALIASED_TYPES([[[rlim]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_RLIM]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mod (mmux_$1_t A, mmux_$1_t B)
{
  return (mmux_$1_t){A.value % B.value};
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_incr (mmux_$1_t A)
{
  return (mmux_$1_t){A.value + 1};
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_decr (mmux_$1_t A)
{
  return (mmux_$1_t){A.value - 1};
}
]]])]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[char]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[schar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uchar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sshort]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ushort]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[slong]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ulong]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint8]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint8]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint16]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint16]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint32]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint32]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint64]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint64]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_mod (mmux_$1_t A, mmux_$1_t B)
{
  return (mmux_$1_t){{A.value % B.value}};
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_incr (mmux_$1_t A)
{
  return (mmux_$1_t){{A.value + 1}};
}
__attribute__((__const__,__always_inline__)) static inline mmux_$1_t
mmux_$1_decr (mmux_$1_t A)
{
  return (mmux_$1_t){{A.value - 1}};
}
]]])]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[usize]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[ssize]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[sintmax]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[uintmax]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[sintptr]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[uintptr]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[ptrdiff]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[mode]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[off]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[pid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[uid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[gid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[wchar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[wint]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[time]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[socklen]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS_FOR_ALIASED_TYPES([[[rlim]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_mod (mmux_$1_t A, mmux_$1_t B)
  __attribute__((__const__));

mmux_cc_types_decl mmux_$1_t mmux_$1_incr (mmux_$1_t A)
  __attribute__((__const__));

mmux_cc_types_decl mmux_$1_t mmux_$1_decr (mmux_$1_t A)
  __attribute__((__const__));
]]])]]])

DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[double]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[ldouble]]],		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float32]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float64]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float128]]],		[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float32x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float64x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[float128x]]],		[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[decimal32]]],		[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[decimal64]]],		[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_REAL_FLOAT_NUMBER_ARITHMETICS_FUNCTIONS([[[decimal128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Mathematics C type functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl
m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_UNARY_CPROTO]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op);
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_CPROTO]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2);
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_CPROTO]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_sint_t N, mmux_$1_t op);
]]])]]])]]])

m4_dnl  $1 - type stem
m4_dnl  $2 - unused
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

m4_define([[[DEFINE_CPROTOS]]],[[[m4_ifelse($#,39,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 39 got: $#
)]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[sin]]],	[[[$4]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[cos]]],	[[[$5]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[tan]]],	[[[$6]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[asin]]],	[[[$7]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[acos]]],	[[[$8]]],  [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[atan]]],	[[[$9]]],  [[[$2]]], [[[$3]]])
DEFINE_BINARY_CPROTO([[[$1]]], [[[atan2]]],	[[[$10]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CPROTO([[[$1]]],  [[[sinh]]],	[[[$11]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[cosh]]],	[[[$12]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[tanh]]],	[[[$13]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[asinh]]],	[[[$14]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[acosh]]],	[[[$15]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[atanh]]],	[[[$16]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CPROTO([[[$1]]],  [[[exp]]],	[[[$17]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[exp2]]],	[[[$18]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[exp10]]],	[[[$19]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[log]]],	[[[$20]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[log10]]],	[[[$21]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[log2]]],	[[[$22]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[logb]]],	[[[$23]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CPROTO([[[$1]]], [[[pow]]],	[[[$24]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[sqrt]]],	[[[$25]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[cbrt]]],	[[[$26]]], [[[$2]]], [[[$3]]])
DEFINE_BINARY_CPROTO([[[$1]]], [[[hypot]]],	[[[$27]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[expm1]]],	[[[$28]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[log1p]]],	[[[$29]]], [[[$2]]], [[[$3]]])

DEFINE_UNARY_CPROTO([[[$1]]],  [[[erf]]],	[[[$30]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[erfc]]],	[[[$31]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[lgamma]]],	[[[$32]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[tgamma]]],	[[[$33]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[j0]]],	[[[$34]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[j1]]],	[[[$35]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CPROTO([[[$1]]],[[[jn]]],	[[[$36]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[y0]]],	[[[$37]]], [[[$2]]], [[[$3]]])
DEFINE_UNARY_CPROTO([[[$1]]],  [[[y1]]],	[[[$38]]], [[[$2]]], [[[$3]]])
DEFINE_BINARYN_CPROTO([[[$1]]],[[[yn]]],	[[[$39]]], [[[$2]]], [[[$3]]])
]]])

/* ------------------------------------------------------------------ */
m4_divert(0)m4_dnl

DEFINE_CPROTOS([[[float]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT]]],		[[[]]],
	       [[[sinf]]],		[[[cosf]]],		[[[tanf]]],
	       [[[asinf]]],		[[[acosf]]],		[[[atanf]]],		[[[atan2f]]],
	       [[[sinhf]]],		[[[coshf]]],		[[[tanhf]]],
	       [[[asinhf]]],		[[[acoshf]]],		[[[atanhf]]],
	       [[[expf]]],		[[[exp2f]]],		[[[exp10f]]],
	       [[[logf]]],		[[[log10f]]],		[[[log2f]]],		[[[logbf]]],
	       [[[powf]]],		[[[sqrtf]]],		[[[cbrtf]]],		[[[hypotf]]],
	       [[[expm1f]]],		[[[log1pf]]],
	       [[[erff]]],		[[[erfcf]]],
	       [[[lgammaf]]],		[[[tgammaf]]],
	       [[[j0f]]],		[[[j1f]]],		[[[jnf]]],
	       [[[y0f]]],		[[[y1f]]],		[[[ynf]]])
DEFINE_CPROTOS([[[double]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DOUBLE]]],		[[[]]],
	       [[[sin]]],		[[[cos]]],		[[[tan]]],
	       [[[asin]]],		[[[acos]]],		[[[atan]]],		[[[atan2f]]],
	       [[[sinh]]],		[[[cosh]]],		[[[tanh]]],
	       [[[asinh]]],		[[[acosh]]],		[[[atanh]]],
	       [[[exp]]],		[[[exp2]]],		[[[exp10]]],
	       [[[log]]],		[[[log10]]],		[[[log2]]],		[[[logb]]],
	       [[[pow]]],		[[[sqrt]]],		[[[cbrt]]],		[[[hypot]]],
	       [[[expm1]]],		[[[log1p]]],
	       [[[erf]]],		[[[erfc]]],
	       [[[lgamma]]],		[[[tgamma]]],
	       [[[j0]]],		[[[j1]]],		[[[jn]]],
	       [[[y0]]],		[[[y1]]],		[[[yn]]])
DEFINE_CPROTOS([[[ldouble]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_LDOUBLE]]], [[[MMUX_CC_TYPES_HAS_LDOUBLE]]],
	       [[[sinl]]],		[[[cosl]]],		[[[tanl]]],
	       [[[asinl]]],		[[[acosl]]],		[[[atanl]]],		[[[atan2l]]],
	       [[[sinhl]]],		[[[coshl]]],		[[[tanhl]]],
	       [[[asinhl]]],		[[[acoshl]]],		[[[atanhl]]],
	       [[[expl]]],		[[[exp2l]]],		[[[exp10l]]],
	       [[[logl]]],		[[[log10l]]],		[[[log2l]]],		[[[logbl]]],
	       [[[powl]]],		[[[sqrtl]]],		[[[cbrtl]]],		[[[hypotl]]],
	       [[[expm1l]]],		[[[log1pl]]],
	       [[[erfl]]],		[[[erfcl]]],
	       [[[lgammal]]],		[[[tgammal]]],
	       [[[j0l]]],		[[[j1l]]],		[[[jnl]]],
	       [[[y0l]]],		[[[y1l]]],		[[[ynl]]])

DEFINE_CPROTOS([[[float32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT32]]],  [[[MMUX_CC_TYPES_HAS_FLOAT32]]],
	       [[[sinf32]]],		[[[cosf32]]],		[[[tanf32]]],
	       [[[asinf32]]],		[[[acosf32]]],		[[[atanf32]]],		[[[atan2f32]]],
	       [[[sinhf32]]],		[[[coshf32]]],		[[[tanhf32]]],
	       [[[asinhf32]]],		[[[acoshf32]]],		[[[atanhf32]]],
	       [[[expf32]]],		[[[exp2f32]]],		[[[exp10f32]]],
	       [[[logf32]]],		[[[log10f32]]],		[[[log2f32]]],		[[[logbf32]]],
	       [[[powf32]]],		[[[sqrtf32]]],		[[[cbrtf32]]],		[[[hypotf32]]],
	       [[[expm1f32]]],		[[[log1pf32]]],
	       [[[erff32]]],		[[[erfcf32]]],
	       [[[lgammaf32]]],		[[[tgammaf32]]],
	       [[[j0f32]]],		[[[j1f32]]],		[[[jnf32]]],
	       [[[y0f32]]],		[[[y1f32]]],		[[[ynf32]]])
DEFINE_CPROTOS([[[float64]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT64]]],  [[[MMUX_CC_TYPES_HAS_FLOAT64]]],
	       [[[sinf64]]],		[[[cosf64]]],		[[[tanf64]]],
	       [[[asinf64]]],		[[[acosf64]]],		[[[atanf64]]],		[[[atan2f64]]],
	       [[[sinhf64]]],		[[[coshf64]]],		[[[tanhf64]]],
	       [[[asinhf64]]],		[[[acoshf64]]],		[[[atanhf64]]],
	       [[[expf64]]],		[[[exp2f64]]],		[[[exp10f64]]],
	       [[[logf64]]],		[[[log10f64]]],		[[[log2f64]]],		[[[logbf64]]],
	       [[[powf64]]],		[[[sqrtf64]]],		[[[cbrtf64]]],		[[[hypotf64]]],
	       [[[expm1f64]]],		[[[log1pf64]]],
	       [[[erff64]]],		[[[erfcf64]]],
	       [[[lgammaf64]]],		[[[tgammaf64]]],
	       [[[j0f64]]],		[[[j1f64]]],		[[[jnf64]]],
	       [[[y0f64]]],		[[[y1f64]]],		[[[ynf64]]])
DEFINE_CPROTOS([[[float128]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT128]]], [[[MMUX_CC_TYPES_HAS_FLOAT128]]],
	       [[[sinf128]]],		[[[cosf128]]],		[[[tanf128]]],
	       [[[asinf128]]],		[[[acosf128]]],		[[[atanf128]]],		[[[atan2f128]]],
	       [[[sinhf128]]],		[[[coshf128]]],		[[[tanhf128]]],
	       [[[asinhf128]]],		[[[acoshf128]]],	[[[atanhf128]]],
	       [[[expf128]]],		[[[exp2f128]]],		[[[exp10f128]]],
	       [[[logf128]]],		[[[log10f128]]],	[[[log2f128]]],		[[[logbf128]]],
	       [[[powf128]]],		[[[sqrtf128]]],		[[[cbrtf128]]],		[[[hypotf128]]],
	       [[[expm1f128]]],		[[[log1pf128]]],
	       [[[erff128]]],		[[[erfcf128]]],
	       [[[lgammaf128]]],	[[[tgammaf128]]],
	       [[[j0f128]]],		[[[j1f128]]],		[[[jnf128]]],
	       [[[y0f128]]],		[[[y1f128]]],		[[[ynf128]]])

DEFINE_CPROTOS([[[float32x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT32X]]],  [[[MMUX_CC_TYPES_HAS_FLOAT32X]]],
	       [[[sinf32x]]],		[[[cosf32x]]],		[[[tanf32x]]],
	       [[[asinf32x]]],		[[[acosf32x]]],		[[[atanf32x]]],		[[[atan2f32x]]],
	       [[[sinhf32x]]],		[[[coshf32x]]],		[[[tanhf32x]]],
	       [[[asinhf32x]]],		[[[acoshf32x]]],	[[[atanhf32x]]],
	       [[[expf32x]]],		[[[exp2f32x]]],		[[[exp10f32x]]],
	       [[[logf32x]]],		[[[log10f32x]]],	[[[log2f32x]]],		[[[logbf32x]]],
	       [[[powf32x]]],		[[[sqrtf32x]]],		[[[cbrtf32x]]],		[[[hypotf32x]]],
	       [[[expm1f32x]]],		[[[log1pf32x]]],
	       [[[erff32x]]],		[[[erfcf32x]]],
	       [[[lgammaf32x]]],	[[[tgammaf32x]]],
	       [[[j0f32x]]],		[[[j1f32x]]],		[[[jnf32x]]],
	       [[[y0f32x]]],		[[[y1f32x]]],		[[[ynf32x]]])
DEFINE_CPROTOS([[[float64x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT64X]]],  [[[MMUX_CC_TYPES_HAS_FLOAT64X]]],
	       [[[sinf64x]]],		[[[cosf64x]]],		[[[tanf64x]]],
	       [[[asinf64x]]],		[[[acosf64x]]],		[[[atanf64x]]],		[[[atan2f64x]]],
	       [[[sinhf64x]]],		[[[coshf64x]]],		[[[tanhf64x]]],
	       [[[asinhf64x]]],		[[[acoshf64x]]],	[[[atanhf64x]]],
	       [[[expf64x]]],		[[[exp2f64x]]],		[[[exp10f64x]]],
	       [[[logf64x]]],		[[[log10f64x]]],	[[[log2f64x]]],		[[[logbf64x]]],
	       [[[powf64x]]],		[[[sqrtf64x]]],		[[[cbrtf64x]]],		[[[hypotf64x]]],
	       [[[expm1f64x]]],		[[[log1pf64x]]],
	       [[[erff64x]]],		[[[erfcf64x]]],
	       [[[lgammaf64x]]],	[[[tgammaf64x]]],
	       [[[j0f64x]]],		[[[j1f64x]]],		[[[jnf64x]]],
	       [[[y0f64x]]],		[[[y1f64x]]],		[[[ynf64x]]])
DEFINE_CPROTOS([[[float128x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT128X]]], [[[MMUX_CC_TYPES_HAS_FLOAT128X]]],
	       [[[sinf128x]]],		[[[cosf128x]]],		[[[tanf128x]]],
	       [[[asinf128x]]],		[[[acosf128x]]],	[[[atanf128x]]],	[[[atan2f128x]]],
	       [[[sinhf128x]]],		[[[coshf128x]]],	[[[tanhf128x]]],
	       [[[asinhf128x]]],	[[[acoshf128x]]],	[[[atanhf128x]]],
	       [[[expf128x]]],		[[[exp2f128x]]],	[[[exp10f128x]]],
	       [[[logf128x]]],		[[[log10f128x]]],	[[[log2f128x]]],	[[[logbf128x]]],
	       [[[powf128x]]],		[[[sqrtf128x]]],	[[[cbrtf128x]]],	[[[hypotf128x]]],
	       [[[expm1f128x]]],	[[[log1pf128x]]],
	       [[[erff128x]]],		[[[erfc128x]]],
	       [[[lgammaf128x]]],	[[[tgammaf128x]]],
	       [[[j0f128x]]],		[[[j1f128x]]],		[[[jnf128x]]],
	       [[[y0f128x]]],		[[[y1f128x]]],		[[[ynf128x]]])

DEFINE_CPROTOS([[[decimal32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL32]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]],
	       [[[sind32]]],		[[[cosd32]]],		[[[tand32]]],
	       [[[asind32]]],		[[[acosd32]]],		[[[atand32]]],		[[[atan2d32]]],
	       [[[sinhd32]]],		[[[coshd32]]],		[[[tanhd32]]],
	       [[[asinhd32]]],		[[[acoshd32]]],		[[[atanhd32]]],
	       [[[expd32]]],		[[[exp2d32]]],		[[[exp10d32]]],
	       [[[logd32]]],		[[[log10d32]]],		[[[log2d32]]],		[[[logbd32]]],
	       [[[powd32]]],		[[[sqrtd32]]],		[[[cbrtd32]]],		[[[hypotd32]]],
	       [[[expm1d32]]],		[[[log1pd32]]],
	       [[[erfd32]]],		[[[erfcd32x]]],
	       [[[lgammad32]]],		[[[tgammad32]]],
	       [[[j0d32]]],		[[[j1d32]]],		[[[jnd32]]],
	       [[[y0d32]]],		[[[y1d32]]],		[[[ynd32]]])
DEFINE_CPROTOS([[[decimal64]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL64]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL64]]],
	       [[[sind64]]],		[[[cosd64]]],		[[[tand64]]],
	       [[[asind64]]],		[[[acosd64]]],		[[[atand64]]],		[[[atan2d64]]],
	       [[[sinhd64]]],		[[[coshd64]]],		[[[tanhd64]]],
	       [[[asinhd64]]],		[[[acoshd64]]],		[[[atanhd64]]],
	       [[[expd64]]],		[[[exp2d64]]],		[[[exp10d64]]],
	       [[[logd64]]],		[[[log10d64]]],		[[[log2d64]]],		[[[logbd64]]],
	       [[[powd64]]],		[[[sqrtd64]]],		[[[cbrtd64]]],		[[[hypotd64]]],
	       [[[expm1d64]]],		[[[log1pd64]]],
	       [[[erfd64]]],		[[[erfcd64x]]],
	       [[[lgammad64]]],		[[[tgammad64]]],
	       [[[j0d64]]],		[[[j1d64]]],		[[[jnd64]]],
	       [[[y0d64]]],		[[[y1d64]]],		[[[ynd64]]])
DEFINE_CPROTOS([[[decimal128]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]],
	       [[[sind128]]],		[[[cosd128]]],		[[[tand128]]],
	       [[[asind128]]],		[[[acosd128]]],		[[[atand128]]],		[[[atan2d128]]],
	       [[[sinhd128]]],		[[[coshd128]]],		[[[tanhd128]]],
	       [[[asinhd128]]],		[[[acoshd128]]],	[[[atanhd128]]],
	       [[[expd128]]],		[[[exp2d128]]],		[[[exp10d128]]],
	       [[[logd128]]],		[[[log10d128]]],	[[[log2d128]]],		[[[logbd128]]],
	       [[[powd128]]],		[[[sqrtd128]]],		[[[cbrtd128]]],		[[[hypotd128]]],
	       [[[expm1d128]]],		[[[log1pd128]]],
	       [[[erfd128]]],		[[[erfcd128x]]],
	       [[[lgammad128]]],	[[[tgammad128]]],
	       [[[j0d128]]],		[[[j1d128]]],		[[[jnd128]]],
	       [[[y0d128]]],		[[[y1d128]]],		[[[ynd128]]])

DEFINE_CPROTOS([[[complexf]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF]]],	[[[]]],
	       [[[csinf]]],		[[[ccosf]]],		[[[ctanf]]],
	       [[[casinf]]],		[[[cacosf]]],		[[[catanf]]],		[[[]]],
	       [[[csinhf]]],		[[[ccoshf]]],		[[[ctanhf]]],
	       [[[casinhf]]],		[[[cacoshf]]],		[[[catanhf]]],
	       [[[cexpf]]],		[[[cexp2f]]],		[[[cexp10f]]],
	       [[[clogf]]],		[[[clog10f]]],		[[[clog2f]]],		[[[]]],
	       [[[cpowf]]],		[[[csqrtf]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexd]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD]]],	[[[]]],
	       [[[csin]]],		[[[ccos]]],		[[[ctan]]],
	       [[[casin]]],		[[[cacos]]],		[[[catan]]],		[[[]]],
	       [[[csinh]]],		[[[ccosh]]],		[[[ctanh]]],
	       [[[casinh]]],		[[[cacosh]]],		[[[catanh]]],
	       [[[cexp]]],		[[[cexp2]]],		[[[cexp10]]],
	       [[[clog]]],		[[[clog10]]],		[[[clog2f]]],		[[[]]],
	       [[[cpow]]],		[[[csqrt]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexld]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXLD]]], [[[MMUX_CC_TYPES_HAS_COMPLEXLD]]],
	       [[[csinl]]],		[[[ccosl]]],		[[[ctanl]]],
	       [[[casinl]]],		[[[cacosl]]],		[[[catanl]]],		[[[]]],
	       [[[csinhl]]],		[[[ccoshl]]],		[[[ctanhl]]],
	       [[[casinhl]]],		[[[cacoshl]]],		[[[catanhl]]],
	       [[[cexpl]]],		[[[cexp2l]]],		[[[cexp10l]]],
	       [[[clogl]]],		[[[clog10l]]],		[[[clog2fl]]],		[[[]]],
	       [[[cpowl]]],		[[[csqrtl]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexf32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF32]]],  [[[MMUX_CC_TYPES_HAS_COMPLEXF32]]],
	       [[[csinf32]]],		[[[ccosf32]]],		[[[ctanf32]]],
	       [[[casinf32]]],		[[[cacosf32]]],		[[[catanf32]]],		[[[]]],
	       [[[csinhf32]]],		[[[ccoshf32]]],		[[[ctanhf32]]],
	       [[[casinhf32]]],		[[[cacoshf32]]],	[[[catanhf32]]],
	       [[[cexpf32]]],		[[[cexp2f32]]],		[[[cexp10f32]]],
	       [[[clogf32]]],		[[[clog10f32]]],	[[[clog2f32]]],		[[[]]],
	       [[[cpowf32]]],		[[[csqrtf32]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf64]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF64]]],  [[[MMUX_CC_TYPES_HAS_COMPLEXF64]]],
	       [[[csinf64]]],		[[[ccosf64]]],		[[[ctanf64]]],
	       [[[casinf64]]],		[[[cacosf64]]],		[[[catanf64]]],		[[[]]],
	       [[[csinhf64]]],		[[[ccoshf64]]],		[[[ctanhf64]]],
	       [[[casinhf64]]],		[[[cacoshf64]]],	[[[catanhf64]]],
	       [[[cexpf64]]],		[[[cexp2f64]]],		[[[cexp10f64]]],
	       [[[clogf64]]],		[[[clog10f64]]],	[[[clog2f64]]],		[[[]]],
	       [[[cpowf64]]],		[[[csqrtf64]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf128]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF128]]],[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]],
	       [[[csinf128]]],		[[[ccosf128]]],		[[[ctanf128]]],
	       [[[casinf128]]],		[[[cacosf128]]],	[[[catanf128]]],	[[[]]],
	       [[[csinhf128]]],		[[[ccoshf128]]],	[[[ctanhf128]]],
	       [[[casinhf128]]],	[[[cacoshf128]]],	[[[catanhf128]]],
	       [[[cexpf128]]],		[[[cexp2f128]]],	[[[cexp10f128]]],
	       [[[clogf128]]],		[[[clog10f128]]],	[[[clog2f128]]],	[[[]]],
	       [[[cpowf128]]],		[[[csqrtf128]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexf32x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF32X]]],[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]],
	       [[[csinf32x]]],		[[[ccosf32x]]],		[[[ctanf32x]]],
	       [[[casinf32x]]],		[[[cacosf32x]]],	[[[catanf32x]]],	[[[]]],
	       [[[csinhf32x]]],		[[[ccoshf32x]]],	[[[ctanhf32x]]],
	       [[[casinhf32x]]],	[[[cacoshf32x]]],	[[[catanhf32x]]],
	       [[[cexpf32x]]],		[[[cexp2f32x]]],	[[[cexp10f32x]]],
	       [[[clogf32x]]],		[[[clog10f32x]]],	[[[clog2f32x]]],	[[[]]],
	       [[[cpowf32x]]],		[[[csqrtf32x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf64x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF64X]]],[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]],
	       [[[csinf64x]]],		[[[ccosf64x]]],		[[[ctanf64x]]],
	       [[[casinf64x]]],		[[[cacosf64x]]],	[[[catanf64x]]],	[[[]]],
	       [[[csinhf64x]]],		[[[ccoshf64x]]],	[[[ctanhf64x]]],
	       [[[casinhf64x]]],	[[[cacoshf64x]]],	[[[catanhf64x]]],
	       [[[cexpf64x]]],		[[[cexp2f64x]]],	[[[cexp10f64x]]],
	       [[[clogf64x]]],		[[[clog10f64x]]],	[[[clog2f64x]]],	[[[]]],
	       [[[cpowf64x]]],		[[[csqrtf64x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf128x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF128X]]],[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]],
	       [[[csinf128x]]],		[[[ccosf128x]]],	[[[ctanf128x]]],
	       [[[casinf128x]]],	[[[cacosf128x]]],	[[[catanf128x]]],	[[[]]],
	       [[[csinhf128x]]],	[[[ccoshf128x]]],	[[[ctanhf128x]]],
	       [[[casinhf128x]]],	[[[cacoshf128x]]],	[[[catanhf128x]]],
	       [[[cexpf128x]]],		[[[cexp2f128x]]],	[[[cexp10f128x]]],
	       [[[clogf128x]]],		[[[clog10f128x]]],	[[[clog2f128x]]],	[[[]]],
	       [[[cpowf128x]]],		[[[csqrtf128x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexd32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD32]]], [[[MMUX_CC_TYPES_HAS_COMPLEXD32_UNIMPLEMENTED]]],
	       [[[csind32]]],		[[[ccosd32]]],		[[[ctand32]]],
	       [[[casind32]]],		[[[cacosd32]]],		[[[catand32]]],		[[[]]],
	       [[[csinhd32]]],		[[[ccoshd32]]],		[[[ctanhd32]]],
	       [[[casinhd32]]],		[[[cacoshd32]]],	[[[catanhd32]]],
	       [[[cexpd32]]],		[[[]]],			[[[]]],
	       [[[clogd32]]],		[[[clog10d32]]],	[[[]]],			[[[]]],
	       [[[cpowd32]]],		[[[csqrtd32]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexd64]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD64]]], [[[MMUX_CC_TYPES_HAS_COMPLEXD64_UNIMPLEMENTED]]],
	       [[[csind64]]],		[[[ccosd64]]],		[[[ctand64]]],
	       [[[casind64]]],		[[[cacosd64]]],		[[[catand64]]],		[[[]]],
	       [[[csinhd64]]],		[[[ccoshd64]]],		[[[ctanhd64]]],
	       [[[casinhd64]]],		[[[cacoshd64]]],	[[[catanhd64]]],
	       [[[cexpd64]]],		[[[]]],			[[[]]],
	       [[[clogd64]]],		[[[clog10d64]]],	[[[]]],			[[[]]],
	       [[[cpowd64]]],		[[[csqrtd64]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexd128]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD128]]],[[[MMUX_CC_TYPES_HAS_COMPLEXD128_UNIMPLEMENTED]]],
	       [[[csind128]]],		[[[ccosd128]]],		[[[ctand128]]],
	       [[[casind128]]],		[[[cacosd128]]],	[[[catand128]]],	[[[]]],
	       [[[csinhd128]]],		[[[ccoshd128]]],	[[[ctanhd128]]],
	       [[[casinhd128]]],	[[[cacoshd128]]],	[[[catanhd128]]],
	       [[[cexpd128]]],		[[[]]],			[[[]]],
	       [[[clogd128]]],		[[[clog10d128]]],	[[[]]],			[[[]]],
	       [[[cpowd128]]],		[[[csqrtd128]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])


/** --------------------------------------------------------------------
 ** Bitwise operations.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_and (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_or  (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_xor (mmux_pointer_t op, mmux_uintptr_t mask)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_not (mmux_pointer_t op)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_shl (mmux_pointer_t op, mmux_sint_t nbits)
  __attribute__((__const__));
mmux_cc_types_decl mmux_pointer_t mmux_pointer_bitwise_shr (mmux_pointer_t op, mmux_sint_t nbits)
  __attribute__((__const__));

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_BITWISE_PROTOS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_and (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_or  (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_xor (mmux_$1_t op1, mmux_$1_t op2)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_not (mmux_$1_t op)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_shl (mmux_$1_t op, mmux_sint_t nbits)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_bitwise_shr (mmux_$1_t op, mmux_sint_t nbits)
  __attribute__((__const__));
]]])]]])

DEFINE_BITWISE_PROTOS([[[char]]])
DEFINE_BITWISE_PROTOS([[[schar]]])
DEFINE_BITWISE_PROTOS([[[uchar]]])
DEFINE_BITWISE_PROTOS([[[sshort]]])
DEFINE_BITWISE_PROTOS([[[ushort]]])
DEFINE_BITWISE_PROTOS([[[sint]]])
DEFINE_BITWISE_PROTOS([[[uint]]])
DEFINE_BITWISE_PROTOS([[[slong]]])
DEFINE_BITWISE_PROTOS([[[ulong]]])
DEFINE_BITWISE_PROTOS([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_BITWISE_PROTOS([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_BITWISE_PROTOS([[[sint8]]])
DEFINE_BITWISE_PROTOS([[[uint8]]])
DEFINE_BITWISE_PROTOS([[[sint16]]])
DEFINE_BITWISE_PROTOS([[[uint16]]])
DEFINE_BITWISE_PROTOS([[[sint32]]])
DEFINE_BITWISE_PROTOS([[[uint32]]])
DEFINE_BITWISE_PROTOS([[[sint64]]])
DEFINE_BITWISE_PROTOS([[[uint64]]])

DEFINE_BITWISE_PROTOS([[[ssize]]])
DEFINE_BITWISE_PROTOS([[[usize]]])
DEFINE_BITWISE_PROTOS([[[sintmax]]])
DEFINE_BITWISE_PROTOS([[[uintmax]]])
DEFINE_BITWISE_PROTOS([[[sintptr]]])
DEFINE_BITWISE_PROTOS([[[uintptr]]])
DEFINE_BITWISE_PROTOS([[[ptrdiff]]])
DEFINE_BITWISE_PROTOS([[[mode]]])
DEFINE_BITWISE_PROTOS([[[off]]])
DEFINE_BITWISE_PROTOS([[[pid]]])
DEFINE_BITWISE_PROTOS([[[uid]]])
DEFINE_BITWISE_PROTOS([[[gid]]])
DEFINE_BITWISE_PROTOS([[[wchar]]])
DEFINE_BITWISE_PROTOS([[[wint]]])
DEFINE_BITWISE_PROTOS([[[time]]])
DEFINE_BITWISE_PROTOS([[[socklen]]])
DEFINE_BITWISE_PROTOS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl mmux_sint_t mmux_ctype_generic_error (...);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_TYPES_H */

/* end of file */
