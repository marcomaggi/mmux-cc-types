/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Sep 12, 2025

  Abstract

	This the public header defines the core types.

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

#ifndef MMUX_CC_TYPES_TYPEDEFS_H
#define MMUX_CC_TYPES_TYPEDEFS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <stddef.h>	/* for "size_t", etc. */
#include <inttypes.h>	/* for "int8_t", etc. */
#include <complex.h>


/** --------------------------------------------------------------------
 ** Standard C types aliases.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_standard_pointer_t;
typedef void const *		mmux_standard_pointerc_t;

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

typedef float				mmux_standard_flonumfl_t;
typedef double				mmux_standard_flonumdb_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMLDB]]],[[[typedef long double		mmux_standard_flonumldb_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32]]],   [[[__extension__ typedef _Float32	mmux_standard_flonumf32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64]]],   [[[__extension__ typedef _Float64	mmux_standard_flonumf64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128]]],  [[[__extension__ typedef _Float128	mmux_standard_flonumf128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32X]]],  [[[__extension__ typedef _Float32x	mmux_standard_flonumf32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64X]]],  [[[__extension__ typedef _Float64x	mmux_standard_flonumf64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128X]]], [[[__extension__ typedef _Float128x	mmux_standard_flonumf128x_t;]]])

typedef float complex		mmux_standard_flonumcfl_t;
typedef double complex		mmux_standard_flonumcdb_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]], [[[typedef long double complex	mmux_standard_flonumcldb_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32]]], [[[__extension__ typedef _Float32 complex	mmux_standard_flonumcf32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64]]], [[[__extension__ typedef _Float64 complex	mmux_standard_flonumcf64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128]]],[[[__extension__ typedef _Float128 complex	mmux_standard_flonumcf128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]], [[[__extension__ typedef _Float32x complex	mmux_standard_flonumcf32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]], [[[__extension__ typedef _Float64x complex	mmux_standard_flonumcf64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]],[[[__extension__ typedef _Float128x complex	mmux_standard_flonumcf128x_t;]]])

typedef mmux_standard_flonumfl_t		mmux_standard_flonumcfl_part_t;
typedef mmux_standard_flonumdb_t		mmux_standard_flonumcdb_part_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]],
[[[typedef mmux_standard_flonumldb_t	mmux_standard_flonumcldb_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32]]],
[[[typedef mmux_standard_flonumf32_t	mmux_standard_flonumcf32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64]]],
[[[typedef mmux_standard_flonumf64_t	mmux_standard_flonumcf64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128]]],
[[[typedef mmux_standard_flonumf128_t	mmux_standard_flonumcf128_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]],
[[[typedef mmux_standard_flonumf32x_t	mmux_standard_flonumcf32x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]],
[[[typedef mmux_standard_flonumf64x_t	mmux_standard_flonumcf64x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]],
[[[typedef mmux_standard_flonumf128x_t	mmux_standard_flonumcf128x_part_t;]]])


/** --------------------------------------------------------------------
 ** Preprocessor macros: generating standard literal values.
 ** ----------------------------------------------------------------- */

#define mmux_standard_unsigned_literal(X)	(X ## U)
#define mmux_standard_pointer_literal(X)	((mmux_standard_pointer_t) (mmux_standard_unsigned_literal(X)))
#define mmux_standard_pointerc_literal(X)	((mmux_standard_pointerc_t)(mmux_standard_unsigned_literal(X)))
m4_ifelse([[[MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4]]],[[[1]]],[[[m4_dnl
#define mmux_standard_char_literal(X)		((mmux_standard_char_t)(mmux_standard_unsigned_literal(X)))]]],[[[m4_dnl
#define mmux_standard_char_literal(X)		((mmux_standard_char_t)(X))]]])
#define mmux_standard_schar_literal(X)		((mmux_standard_schar_t)(X))
#define mmux_standard_uchar_literal(X)		((mmux_standard_uchar_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_sshort_literal(X)		((mmux_standard_sshort_t)(X))
#define mmux_standard_ushort_literal(X)		((mmux_standard_ushort_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_sint_literal(X)		((mmux_standard_sint_t)(X))
#define mmux_standard_uint_literal(X)		((mmux_standard_uint_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_slong_literal(X)		((mmux_standard_slong_t)(X))
#define mmux_standard_ulong_literal(X)		((mmux_standard_ulong_t)(mmux_standard_unsigned_literal(X)))
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[SLLONG]]],[[[m4_dnl
#define mmux_standard_sllong_literal(X)		((mmux_standard_sllong_t)(X ## LL))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[ULLONG]]],[[[m4_dnl
#define mmux_standard_ullong_literal(X)		((mmux_standard_ullong_t)(X ## ULL))]]])
#define mmux_standard_sint8_literal(X)		((mmux_standard_sint8_t)(X))
#define mmux_standard_uint8_literal(X)		((mmux_standard_uint8_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_sint16_literal(X)		((mmux_standard_sint16_t)(X))
#define mmux_standard_uint16_literal(X)		((mmux_standard_uint16_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_sint32_literal(X)		((mmux_standard_sint32_t)(X))
#define mmux_standard_uint32_literal(X)		((mmux_standard_uint32_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_sint64_literal(X)		((mmux_standard_sint64_t)(X))
#define mmux_standard_uint64_literal(X)		((mmux_standard_uint64_t)(mmux_standard_unsigned_literal(X)))
#define mmux_standard_flonumfl_literal(X)	((mmux_standard_flonumfl_t)(X ## F))
#define mmux_standard_flonumdb_literal(X)	((mmux_standard_flonumdb_t)(X))
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMLDB]]],[[[m4_dnl
#define mmux_standard_flonumldb_literal(X)	((mmux_standard_flonumldb_t)(X ## L))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF32]]],[[[m4_dnl
#define mmux_standard_flonumf32_literal(X)	((mmux_standard_flonumf32_t)(X ## f32))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF64]]],[[[m4_dnl
#define mmux_standard_flonumf64_literal(X)	((mmux_standard_flonumf64_t)(X ## f64))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF128]]],[[[m4_dnl
#define mmux_standard_flonumf128_literal(X)	((mmux_standard_flonumf128_t)(X ## f128))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF32X]]],[[[m4_dnl
#define mmux_standard_flonumf32x_literal(X)	((mmux_standard_flonumf32x_t)(X ## f32x))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF64X]]],[[[m4_dnl
#define mmux_standard_flonumf64x_literal(X)	((mmux_standard_flonumf64x_t)(X ## f64x))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMF128X]]],[[[m4_dnl
#define mmux_standard_flonumf128x_literal(X)	((mmux_standard_flonumf128x_t)(X ## f128x))]]])
m4_define([[[DEFINE_ALIASED_INTEGER_LITERAL_MACRO]]],[[[m4_dnl
#define mmux_standard_$1_literal(X)		((mmux_standard_$1_t)(mmux_standard_[[[]]]$2[[[]]]_literal(X)))]]])
#define mmux_standard_byte_literal(X)		((mmux_standard_byte_t)(X))
#define mmux_standard_octet_literal(X)		((mmux_standard_octet_t)(mmux_standard_unsigned_literal(X)))
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

#define mmux_standard_flonumcfl_part_literal(VALUE)	(mmux_standard_flonumfl_literal(VALUE))
#define mmux_standard_flonumcdb_part_literal(VALUE)	(mmux_standard_flonumdb_literal(VALUE))
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCLDB]]],[[[m4_dnl
#define mmux_standard_flonumcldb_part_literal(VALUE)	(mmux_standard_flonumldb_literal(VALUE))]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF32]]],[[[m4_dnl
#define mmux_standard_flonumcf32_part_literal(VALUE)	(mmux_standard_flonumf32_literal(VALUE))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF64]]],[[[m4_dnl
#define mmux_standard_flonumcf64_part_literal(VALUE)	(mmux_standard_flonumf64_literal(VALUE))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF128]]],[[[m4_dnl
#define mmux_standard_flonumcf128_part_literal(VALUE)	(mmux_standard_flonumf128_literal(VALUE))]]])

/* ------------------------------------------------------------------ */

MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF32X]]],[[[m4_dnl
#define mmux_standard_flonumcf32x_part_literal(VALUE)	(mmux_standard_flonumf32x_literal(VALUE))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF64X]]],[[[m4_dnl
#define mmux_standard_flonumcf64x_part_literal(VALUE)	(mmux_standard_flonumf64x_literal(VALUE))]]])
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[FLONUMCF128X]]],[[[m4_dnl
#define mmux_standard_flonumcf128x_part_literal(VALUE)	(mmux_standard_flonumf128x_literal(VALUE))]]])


/** --------------------------------------------------------------------
 ** MMUX CC Types embedded type definitions.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_pointer_t;
typedef void const *		mmux_pointerc_t;

typedef char *			mmux_asciip_t;
typedef char **			mmux_asciipp_t;
typedef char ***		mmux_asciippp_t;

typedef char *			mmux_asciizp_t;
typedef char **			mmux_asciizpp_t;
typedef char ***		mmux_asciizppp_t;

typedef char const *		mmux_asciicp_t;
typedef char const **		mmux_asciicpp_t;
typedef char const ***		mmux_asciicppp_t;

typedef char const *		mmux_asciizcp_t;
typedef char const **		mmux_asciizcpp_t;
typedef char const ***		mmux_asciizcppp_t;

/* ------------------------------------------------------------------ */

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
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[m4_dnl
typedef struct mmux_sllong_t	{ mmux_standard_sllong_t	value; }	mmux_sllong_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_ULLONG]]],[[[
typedef struct mmux_ullong_t	{ mmux_standard_ullong_t	value; }	mmux_ullong_t;]]])

typedef struct mmux_sint8_t	{ mmux_standard_sint8_t		value; }	mmux_sint8_t;
typedef struct mmux_uint8_t	{ mmux_standard_uint8_t		value; }	mmux_uint8_t;
typedef struct mmux_sint16_t	{ mmux_standard_sint16_t	value; }	mmux_sint16_t;
typedef struct mmux_uint16_t	{ mmux_standard_uint16_t	value; }	mmux_uint16_t;
typedef struct mmux_sint32_t	{ mmux_standard_sint32_t	value; }	mmux_sint32_t;
typedef struct mmux_uint32_t	{ mmux_standard_uint32_t	value; }	mmux_uint32_t;
typedef struct mmux_sint64_t	{ mmux_standard_sint64_t	value; }	mmux_sint64_t;
typedef struct mmux_uint64_t	{ mmux_standard_uint64_t	value; }	mmux_uint64_t;

typedef struct mmux_flonumfl_t	{ mmux_standard_flonumfl_t		value; }	mmux_flonumfl_t;
typedef struct mmux_flonumdb_t	{ mmux_standard_flonumdb_t		value; }	mmux_flonumdb_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMLDB]]],  [[[m4_dnl
typedef struct mmux_flonumldb_t	{ mmux_standard_flonumldb_t		value; }	mmux_flonumldb_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32]]],   [[[m4_dnl
typedef struct mmux_flonumf32_t	{ mmux_standard_flonumf32_t		value; }	mmux_flonumf32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64]]],   [[[m4_dnl
typedef struct mmux_flonumf64_t	{ mmux_standard_flonumf64_t		value; }	mmux_flonumf64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128]]],  [[[m4_dnl
typedef struct mmux_flonumf128_t	{ mmux_standard_flonumf128_t	value; }	mmux_flonumf128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32X]]],  [[[m4_dnl
typedef struct mmux_flonumf32x_t	{ mmux_standard_flonumf32x_t	value; }	mmux_flonumf32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64X]]],  [[[m4_dnl
typedef struct mmux_flonumf64x_t	{ mmux_standard_flonumf64x_t	value; }	mmux_flonumf64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128X]]], [[[m4_dnl
typedef struct mmux_flonumf128x_t	{ mmux_standard_flonumf128x_t	value; }	mmux_flonumf128x_t;]]])

/* ------------------------------------------------------------------ */

typedef struct mmux_flonumcfl_t	{ mmux_standard_flonumcfl_t	value; }	mmux_flonumcfl_t;
typedef struct mmux_flonumcdb_t	{ mmux_standard_flonumcdb_t	value; }	mmux_flonumcdb_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]],  [[[m4_dnl
typedef struct mmux_flonumcldb_t	{ mmux_standard_flonumcldb_t	value; }	mmux_flonumcldb_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32]]], [[[m4_dnl
typedef struct mmux_flonumcf32_t { mmux_standard_flonumcf32_t	value; }      mmux_flonumcf32_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64]]], [[[m4_dnl
typedef struct mmux_flonumcf64_t { mmux_standard_flonumcf64_t	value; }      mmux_flonumcf64_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128]]],[[[m4_dnl
typedef struct mmux_flonumcf128_t { mmux_standard_flonumcf128_t	value; }      mmux_flonumcf128_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]], [[[m4_dnl
typedef struct mmux_flonumcf32x_t { mmux_standard_flonumcf32x_t	value; }      mmux_flonumcf32x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]], [[[m4_dnl
typedef struct mmux_flonumcf64x_t { mmux_standard_flonumcf64x_t value; }      mmux_flonumcf64x_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]],[[[m4_dnl
typedef struct mmux_flonumcf128x_t { mmux_standard_flonumcf128x_t value; }	mmux_flonumcf128x_t;]]])

typedef mmux_flonumfl_t		mmux_flonumcfl_part_t;
typedef mmux_flonumdb_t		mmux_flonumcdb_part_t;
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMLDB]]],   [[[typedef mmux_flonumldb_t	 mmux_flonumcldb_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32]]],  [[[typedef mmux_flonumf32_t	 mmux_flonumcf32_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64]]],  [[[typedef mmux_flonumf64_t	 mmux_flonumcf64_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128]]], [[[typedef mmux_flonumf128_t	 mmux_flonumcf128_part_t;]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]], [[[typedef mmux_flonumf32x_t	 mmux_flonumcf32x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]], [[[typedef mmux_flonumf64x_t	 mmux_flonumcf64x_part_t;]]])
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]],[[[typedef mmux_flonumf128x_t mmux_flonumcf128x_part_t;]]])

/* ------------------------------------------------------------------ */

typedef struct mmux_byte_t	{ mmux_sint8_t; }		mmux_byte_t;
typedef struct mmux_octet_t	{ mmux_uint8_t; }		mmux_octet_t;

typedef struct mmux_ssize_t	{ MMUX_CC_TYPES_TYPE_ALIAS_SSIZE;	}     mmux_ssize_t;
typedef struct mmux_usize_t	{ MMUX_CC_TYPES_TYPE_ALIAS_USIZE;	}     mmux_usize_t;
typedef struct mmux_sintmax_t	{ MMUX_CC_TYPES_TYPE_ALIAS_SINTMAX;	}     mmux_sintmax_t;
typedef struct mmux_uintmax_t	{ MMUX_CC_TYPES_TYPE_ALIAS_UINTMAX;	}     mmux_uintmax_t;
typedef struct mmux_sintptr_t	{ MMUX_CC_TYPES_TYPE_ALIAS_SINTPTR;	}     mmux_sintptr_t;
typedef struct mmux_uintptr_t	{ MMUX_CC_TYPES_TYPE_ALIAS_UINTPTR;	}     mmux_uintptr_t;
typedef struct mmux_mode_t	{ MMUX_CC_TYPES_TYPE_ALIAS_MODE;	}     mmux_mode_t;
typedef struct mmux_off_t	{ MMUX_CC_TYPES_TYPE_ALIAS_OFF;		}     mmux_off_t;
typedef struct mmux_pid_t	{ MMUX_CC_TYPES_TYPE_ALIAS_PID;		}     mmux_pid_t;
typedef struct mmux_uid_t	{ MMUX_CC_TYPES_TYPE_ALIAS_UID;		}     mmux_uid_t;
typedef struct mmux_gid_t	{ MMUX_CC_TYPES_TYPE_ALIAS_GID;		}     mmux_gid_t;
typedef struct mmux_ptrdiff_t	{ MMUX_CC_TYPES_TYPE_ALIAS_PTRDIFF;	}     mmux_ptrdiff_t;
typedef struct mmux_wchar_t	{ MMUX_CC_TYPES_TYPE_ALIAS_WCHAR;	}     mmux_wchar_t;
typedef struct mmux_wint_t	{ MMUX_CC_TYPES_TYPE_ALIAS_WINT;	}     mmux_wint_t;
typedef struct mmux_time_t	{ MMUX_CC_TYPES_TYPE_ALIAS_TIME;	}     mmux_time_t;
typedef struct mmux_socklen_t	{ MMUX_CC_TYPES_TYPE_ALIAS_SOCKLEN;	}     mmux_socklen_t;
typedef struct mmux_rlim_t	{ MMUX_CC_TYPES_TYPE_ALIAS_RLIM;	}     mmux_rlim_t;


/** --------------------------------------------------------------------
 ** Makers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer (mmux_standard_pointer_t value)
{
  return (mmux_pointer_t)value;
}
#define mmux_pointer_literal(VALUE)	(mmux_pointer(mmux_standard_pointer_literal(VALUE)))

mmux_cc_types_inline_decl mmux_pointerc_t
mmux_pointerc (mmux_standard_pointerc_t value)
{
  return (mmux_pointerc_t)value;
}
#define mmux_pointerc_literal(VALUE)	(mmux_pointerc(mmux_standard_pointerc_literal(VALUE)))

/* ------------------------------------------------------------------ */

m4_divert(-1)
m4_dnl $1 - type stem
m4_dnl $2 - conditional definition symbol
m4_define([[[DEFINE_TYPE_MAKERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1 (mmux_standard_$1_t the_value)
{
  return (mmux_$1_t){ .value = the_value };
}
#define mmux_$1_literal(VALUE)		(mmux_$1(mmux_standard_$1_literal(VALUE)))]]])]]])
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
DEFINE_TYPE_MAKERS(flonumfl)
DEFINE_TYPE_MAKERS(flonumdb)
DEFINE_TYPE_MAKERS(flonumldb,		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])
DEFINE_TYPE_MAKERS(flonumf32,		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_TYPE_MAKERS(flonumf64,		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_TYPE_MAKERS(flonumf128,		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])
DEFINE_TYPE_MAKERS(flonumf32x,		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_TYPE_MAKERS(flonumf64x,		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_TYPE_MAKERS(flonumf128x,		[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])
DEFINE_TYPE_MAKERS(flonumcfl)
DEFINE_TYPE_MAKERS(flonumcdb)
DEFINE_TYPE_MAKERS(flonumcldb,		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])
DEFINE_TYPE_MAKERS(flonumcf32,		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_TYPE_MAKERS(flonumcf64,		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_TYPE_MAKERS(flonumcf128,		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])
DEFINE_TYPE_MAKERS(flonumcf32x,		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_TYPE_MAKERS(flonumcf64x,		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_TYPE_MAKERS(flonumcf128x,	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])
DEFINE_TYPE_MAKERS(flonumcfl_part)
DEFINE_TYPE_MAKERS(flonumcdb_part)
DEFINE_TYPE_MAKERS(flonumcldb_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])
DEFINE_TYPE_MAKERS(flonumcf32_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_TYPE_MAKERS(flonumcf64_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_TYPE_MAKERS(flonumcf128_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])
DEFINE_TYPE_MAKERS(flonumcf32x_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_TYPE_MAKERS(flonumcf64x_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_TYPE_MAKERS(flonumcf128x_part,	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])
DEFINE_TYPE_MAKERS(byte)
DEFINE_TYPE_MAKERS(octet)
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


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* MMUX_CC_TYPES_TYPEDEFS_H */

/* end of file */
