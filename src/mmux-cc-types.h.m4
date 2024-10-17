/*
  Part of: MMUX CC Types
  Contents: public header file
  Date: Oct 17, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

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

/* The macro  MMUX_CC_TYPES_UNUSED indicates  that a  function, function  argument or
   variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_CC_TYPES_UNUSED;
   int foo (char unused_argument MMUX_CC_TYPES_UNUSED);
   int unused_variable MMUX_CC_TYPES_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_CC_TYPES_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_CC_TYPES_UNUSED		/* empty */
#endif

#ifndef __GNUC__
#  define __attribute__(...)	/* empty */
#endif

#ifndef __GNUC__
#  define __builtin_expect(...)	/* empty */
#endif

#if defined _WIN32 || defined __CYGWIN__
#  ifdef BUILDING_DLL
#    ifdef __GNUC__
#      define mmux_cc_types_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_cc_types_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_cc_types_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_cc_types_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_cc_types_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_cc_types_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_cc_types_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_cc_types_decl		extern
#    define mmux_cc_types_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-config.h>
#include <stdbool.h>
#include <stddef.h>
#include <inttypes.h>
#include <complex.h>


/** --------------------------------------------------------------------
 ** Initialisation functions.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_cc_types_init_sprint_module (void);
mmux_cc_types_decl bool mmux_cc_types_init_parsers_module (void);


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl char const *	mmux_cc_types_version_string		(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_current	(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_revision(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Type definitions.
 ** ----------------------------------------------------------------- */

typedef void *				mmux_pointer_t;
typedef signed char			mmux_schar_t;
typedef unsigned char			mmux_uchar_t;
typedef signed short int		mmux_sshort_t;
typedef unsigned short int		mmux_ushort_t;
typedef signed int			mmux_sint_t;
typedef unsigned int			mmux_uint_t;
typedef signed long			mmux_slong_t;
typedef unsigned long			mmux_ulong_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_SLLONG]]],[[[typedef signed long long	      mmux_sllong_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_ULLONG]]],[[[typedef unsigned long long int   mmux_ullong_t;]]])

typedef int8_t				mmux_sint8_t;
typedef uint8_t				mmux_uint8_t;
typedef int16_t				mmux_sint16_t;
typedef uint16_t			mmux_uint16_t;
typedef int32_t				mmux_sint32_t;
typedef uint32_t			mmux_uint32_t;
typedef int64_t				mmux_sint64_t;
typedef uint64_t			mmux_uint64_t;

typedef float				mmux_float_t;
typedef double				mmux_double_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_LDOUBLE]]],  [[[typedef long double		mmux_ldouble_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT32]]],  [[[__extension__ typedef _Float32	mmux_float32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT64]]],  [[[__extension__ typedef _Float64	mmux_float64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT128]]], [[[__extension__ typedef _Float128	mmux_float128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT32X]]], [[[__extension__ typedef _Float32x	mmux_float32x_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT64X]]], [[[__extension__ typedef _Float64x	mmux_float64x_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT128X]]],[[[__extension__ typedef _Float128x mmux_float128x_t;]]])

typedef float complex		mmux_complexf_t;
typedef mmux_float_t		mmux_complexf_part_t;
typedef double complex		mmux_complexd_t;
typedef mmux_double_t		mmux_complexd_part_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]],[[[
typedef long double complex	mmux_complexld_t;
typedef mmux_ldouble_t	mmux_complexld_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]],[[[
__extension__ typedef _Float32x complex		mmux_complexf32_t;
typedef mmux_float32_t				mmux_complexf32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]],[[[
__extension__ typedef _Float64x complex		mmux_complexf64_t;
typedef mmux_float64_t				mmux_complexf64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]],[[[
__extension__ typedef _Float128 complex		mmux_complexf128_t;
typedef mmux_float128_t				mmux_complexf128_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]],[[[
__extension__ typedef _Float32x complex	mmux_complexf32x_t;
typedef mmux_float32x_t	mmux_complexf32x_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]],[[[
__extension__ typedef _Float64x complex	mmux_complexf64x_t;
typedef mmux_float64x_t	mmux_complexf64x_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]],[[[
__extension__ typedef _Float128x complex	mmux_complexf128x_t;
typedef mmux_float128x_t	mmux_complexf128x_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],  [[[__extension__ typedef _Decimal32  mmux_decimal32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],  [[[__extension__ typedef _Decimal64  mmux_decimal64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL128]]], [[[__extension__ typedef _Decimal128 mmux_decimal128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]],  [[[
struct mmux_complexd32_tag_t {
  mmux_decimal32_t		re;
  mmux_decimal32_t		im;
};
typedef struct mmux_complexd32_tag_t mmux_complexd32_t;
typedef mmux_decimal32_t	mmux_complexd32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]],  [[[
struct mmux_complexd64_tag_t {
  mmux_decimal64_t		re;
  mmux_decimal64_t		im;
};
typedef struct mmux_complexd64_tag_t mmux_complexd64_t;
typedef mmux_decimal64_t	mmux_complexd64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]], [[[
struct mmux_complexd128_tag_t {
  mmux_decimal128_t	re;
  mmux_decimal128_t	im;
};
typedef struct mmux_complexd128_tag_t mmux_complexd128_t;
typedef mmux_decimal128_t	mmux_complexd128_part_t;
]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[DEFINE_ALIAS_TYPEDEF]]],[[[typedef mmux_[[[]]]$2[[[]]]_t mmux_[[[]]]$1[[[]]]_t]]])

DEFINE_ALIAS_TYPEDEF([[[ssize]]],	MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE);
DEFINE_ALIAS_TYPEDEF([[[usize]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_USIZE]]]);
DEFINE_ALIAS_TYPEDEF([[[sintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX]]]);
DEFINE_ALIAS_TYPEDEF([[[uintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX]]]);
DEFINE_ALIAS_TYPEDEF([[[sintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR]]]);
DEFINE_ALIAS_TYPEDEF([[[uintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR]]]);
DEFINE_ALIAS_TYPEDEF([[[mode]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_MODE]]]);
DEFINE_ALIAS_TYPEDEF([[[off]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_OFF]]]);
DEFINE_ALIAS_TYPEDEF([[[pid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_PID]]]);
DEFINE_ALIAS_TYPEDEF([[[uid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_UID]]]);
DEFINE_ALIAS_TYPEDEF([[[gid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_GID]]]);
DEFINE_ALIAS_TYPEDEF([[[ptrdiff]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF]]]);
DEFINE_ALIAS_TYPEDEF([[[wchar]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR]]]);
DEFINE_ALIAS_TYPEDEF([[[wint]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WINT]]]);


/** --------------------------------------------------------------------
 ** Prototypes of functions not implemented by the C compiler or the C library.
 ** ----------------------------------------------------------------- */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],[[[
mmux_cc_types_decl mmux_decimal32_t mmux_strtod32 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd32 (char * s_value, size_t size, char const * restrict format, mmux_decimal32_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],[[[
mmux_cc_types_decl mmux_decimal64_t mmux_strtod64 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd64 (char * s_value, size_t size, char const * restrict format, mmux_decimal64_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL128]]],[[[
mmux_cc_types_decl mmux_decimal128_t mmux_strtod128 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_cc_types_decl int mmux_strfromd128 (char * s_value, size_t size, char const * restrict format, mmux_decimal128_t value)
  __attribute__((__nonnull__(3)));
]]])


/** --------------------------------------------------------------------
 ** Basic functions for complex floating-point types.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PROTOS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_$1_t      mmux_$1_make_rectangular (mmux_$1_part_t re, mmux_$1_part_t im);
mmux_cc_types_decl mmux_$1_part_t mmux_$1_real_part (mmux_$1_t Z);
mmux_cc_types_decl mmux_$1_part_t mmux_$1_imag_part (mmux_$1_t Z);
mmux_cc_types_decl mmux_$1_part_t mmux_$1_abs  (mmux_$1_t Z);
mmux_cc_types_decl mmux_$1_part_t mmux_$1_arg  (mmux_$1_t Z);
mmux_cc_types_decl mmux_$1_t      mmux_$1_conj (mmux_$1_t Z);
]]])]]])

DEFINE_PROTOS([[[complexf]]])
DEFINE_PROTOS([[[complexd]]])
DEFINE_PROTOS([[[complexld]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_PROTOS([[[complexf32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_PROTOS([[[complexf64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_PROTOS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_PROTOS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_PROTOS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_PROTOS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_PROTOS([[[complexd32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_PROTOS([[[complexd64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_PROTOS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Special parser functions.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_cc_types_parse_signed_integer (mmux_sintmax_t * p_dest, char const * s_source,
							    mmux_sintmax_t target_min, mmux_sintmax_t target_max,
							    char const * target_type_name, char const * who);

mmux_cc_types_decl bool mmux_cc_types_parse_unsigned_integer (mmux_uintmax_t * p_dest, char const * s_source,
							      mmux_uintmax_t target_max,
							      char const * target_type_name, char const * who);


/** --------------------------------------------------------------------
 ** Type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_define([[[DEFINE_TYPE_PROTOS_ALL_NUMBERS]]],[[[m4_dnl
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
mmux_cc_types_decl int mmux_$1_sprint_size (mmux_$1_t v);
]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_REAL_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
mmux_cc_types_decl mmux_$1_t mmux_$1_minimum (void)
  __attribute__((__const__));
mmux_cc_types_decl mmux_$1_t mmux_$1_maximum (void)
  __attribute__((__const__));
]]])]]])

m4_dnl ----------------------------------------------------------------

m4_dnl $1 - type stem
m4_dnl $2 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_TYPE_PROTOS_ALL_NUMBERS([[[$1]]],[[[$2]]])
]]])]]])

m4_dnl ----------------------------------------------------------------

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

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


/** --------------------------------------------------------------------
 ** More type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_operation_$1_t	mmux_$1_abs;
mmux_cc_types_decl mmux_cc_types_binary_operation_$1_t	mmux_$1_max;
mmux_cc_types_decl mmux_cc_types_binary_operation_$1_t mmux_$1_min;
]]])]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[double]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Type predicate prototypes.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PREDICATE_PROTOS_REAL_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_zero;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_nan;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_infinite;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_positive;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_negative;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_positive;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_non_negative;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_equal;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_lesser;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_greater_equal;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_lesser_equal;
]]])]]])

m4_define([[[DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_zero;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_nan;
mmux_cc_types_decl mmux_cc_types_unary_predicate_$1_t  mmux_$1_is_infinite;
mmux_cc_types_decl mmux_cc_types_binary_predicate_$1_t mmux_$1_equal;
]]])]]])

m4_define([[[DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl mmux_cc_types_ternary_predicate_$1_t mmux_$1_equal_absmargin;
mmux_cc_types_decl mmux_cc_types_ternary_predicate_$1_t mmux_$1_equal_relepsilon;
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal128]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

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

/* ------------------------------------------------------------------ */

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[double]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating point numbers.
 ** ----------------------------------------------------------------- */

#undef  MMUX_BASH_POINTERS_FLOAT_FORMAT_MAXLEN
#define MMUX_BASH_POINTERS_FLOAT_FORMAT_MAXLEN		8

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_cc_types_decl char mmux_bash_pointers_output_format_$1[1+MMUX_BASH_POINTERS_FLOAT_FORMAT_MAXLEN];

mmux_cc_types_decl bool mmux_$1_set_output_format (char const * const new_result_format, char const * const who)
  __attribute__((__nonnull__(1)));

]]])]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[double]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARS_AND_PROTOS([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Core arithmetics functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_ARITHMETICS_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  return A + B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  return A - B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  return A * B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  return A / B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return (- A);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  return (((mmux_$1_t)1) / A);
}
]]])]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[schar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uchar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sshort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ushort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[slong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ulong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[double]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexd]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint64]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[usize]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ssize]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sintmax]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uintmax]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sintptr]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uintptr]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ptrdiff]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[mode]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[off]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[pid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[gid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[wchar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[wint]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = Are + Bre;
  mmux_$1_part_t	Cim = Aim + Bim;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = Are - Bre;
  mmux_$1_part_t	Cim = Aim - Bim;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = (Are * Bre - Aim * Bim);
  mmux_$1_part_t	Cim = (Are * Bim + Bre * Aim);

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	D   = Bre * Bre + Bim * Bim;
  mmux_$1_part_t	Cre = (Are * Bre + Aim * Bim) / D;
  mmux_$1_part_t	Cim = (Aim * Bre - Are * Bim) / D;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);

  return mmux_$1_make_rectangular (-Are, -Aim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	D   = Are * Are + Aim * Aim;
  mmux_$1_part_t	Cre = + Are / D;
  mmux_$1_part_t	Cim = - Aim / D;

  return mmux_$1_make_rectangular (Cre, Cim);
}
]]])]]])

DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_mod (mmux_$1_t A, mmux_$1_t B)
{
  return A % B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_incr (mmux_$1_t A)
{
  return ++A;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_decr (mmux_$1_t A)
{
  return --A;
}
]]])]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[schar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uchar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sshort]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ushort]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[slong]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ulong]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint8]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint8]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint16]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint16]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint32]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint32]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sint64]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uint64]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[usize]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ssize]]])

DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sintmax]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uintmax]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[sintptr]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uintptr]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[ptrdiff]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[mode]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[off]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[pid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[uid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[gid]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[wchar]]])
DEFINE_CORE_ARITHMETICS_INTEGER_FUNCTIONS([[[wint]]])


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
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op);
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARY_CPROTO]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_$1_t op1, mmux_$1_t op2);
]]])]]])]]])

m4_dnl $1 - type stem
m4_dnl $2 - builtin tail identifier
m4_dnl $3 - mathematical function identifier, empty if not to be implemented
m4_dnl $4 - type parser macro
m4_dnl $5 - C preprocessor for optional definition
m4_define([[[DEFINE_BINARYN_CPROTO]]],[[[m4_ifelse($#,5,,
[[[m4_fatal_error(m4___program__:m4___file__:m4___line__: wrong number of arguments expected 5 got: $#
)]]])MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[m4_ifelse([[[$3]]],,,[[[
mmux_cc_types_decl mmux_$1_t mmux_$1_$2 (mmux_sint_t N, mmux_$1_t op);
]]])]]])]]])

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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_LDOUBLE]]], [[[MMUX_HAVE_CC_TYPE_LDOUBLE]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT32]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT64]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT128]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT32X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT64X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_FLOAT128X]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128X]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_DECIMAL128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]],
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
	       [[[cexpf]]],		[[[]]],			[[[]]],
	       [[[clogf]]],		[[[clog10f]]],		[[[]]],			[[[]]],
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
	       [[[cexp]]],		[[[]]],			[[[]]],
	       [[[clog]]],		[[[clog10]]],		[[[]]],			[[[]]],
	       [[[cpow]]],		[[[csqrt]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexld]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXLD]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]],
	       [[[csinl]]],		[[[ccosl]]],		[[[ctanl]]],
	       [[[casinl]]],		[[[cacosl]]],		[[[catanl]]],		[[[]]],
	       [[[csinhl]]],		[[[ccoshl]]],		[[[ctanhl]]],
	       [[[casinhl]]],		[[[cacoshl]]],		[[[catanhl]]],
	       [[[cexpl]]],		[[[]]],			[[[]]],
	       [[[clogl]]],		[[[clog10l]]],		[[[]]],			[[[]]],
	       [[[cpowl]]],		[[[csqrtl]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexf32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF32]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]],
	       [[[csinf32]]],		[[[ccosf32]]],		[[[ctanf32]]],
	       [[[casinf32]]],		[[[cacosf32]]],		[[[catanf32]]],		[[[]]],
	       [[[csinhf32]]],		[[[ccoshf32]]],		[[[ctanhf32]]],
	       [[[casinhf32]]],		[[[cacoshf32]]],	[[[catanhf32]]],
	       [[[cexpf32]]],		[[[]]],			[[[]]],
	       [[[clogf32]]],		[[[clog10f32]]],	[[[]]],			[[[]]],
	       [[[cpowf32]]],		[[[csqrtf32]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf64]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF64]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]],
	       [[[csinf64]]],		[[[ccosf64]]],		[[[ctanf64]]],
	       [[[casinf64]]],		[[[cacosf64]]],		[[[catanf64]]],		[[[]]],
	       [[[csinhf64]]],		[[[ccoshf64]]],		[[[ctanhf64]]],
	       [[[casinhf64]]],		[[[cacoshf64]]],	[[[catanhf64]]],
	       [[[cexpf64]]],		[[[]]],			[[[]]],
	       [[[clogf64]]],		[[[clog10f64]]],	[[[]]],			[[[]]],
	       [[[cpowf64]]],		[[[csqrtf64]]],		[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf128]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]],
	       [[[csinf128]]],		[[[ccosf128]]],		[[[ctanf128]]],
	       [[[casinf128]]],		[[[cacosf128]]],	[[[catanf128]]],	[[[]]],
	       [[[csinhf128]]],		[[[ccoshf128]]],	[[[ctanhf128]]],
	       [[[casinhf128]]],	[[[cacoshf128]]],	[[[catanhf128]]],
	       [[[cexpf128]]],		[[[]]],			[[[]]],
	       [[[clogf128]]],		[[[clog10f128]]],	[[[]]],			[[[]]],
	       [[[cpowf128]]],		[[[csqrtf128]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexf32x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF32X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]],
	       [[[csinf32x]]],		[[[ccosf32x]]],		[[[ctanf32x]]],
	       [[[casinf32x]]],		[[[cacosf32x]]],	[[[catanf32x]]],	[[[]]],
	       [[[csinhf32x]]],		[[[ccoshf32x]]],	[[[ctanhf32x]]],
	       [[[casinhf32x]]],	[[[cacoshf32x]]],	[[[catanhf32x]]],
	       [[[cexpf32x]]],		[[[]]],			[[[]]],
	       [[[clogf32x]]],		[[[clog10f32x]]],	[[[]]],			[[[]]],
	       [[[cpowf32x]]],		[[[csqrtf32x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf64x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF64X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]],
	       [[[csinf64x]]],		[[[ccosf64x]]],		[[[ctanf64x]]],
	       [[[casinf64x]]],		[[[cacosf64x]]],	[[[catanf64x]]],	[[[]]],
	       [[[csinhf64x]]],		[[[ccoshf64x]]],	[[[ctanhf64x]]],
	       [[[casinhf64x]]],	[[[cacoshf64x]]],	[[[catanhf64x]]],
	       [[[cexpf64x]]],		[[[]]],			[[[]]],
	       [[[clogf64x]]],		[[[clog10f64x]]],	[[[]]],			[[[]]],
	       [[[cpowf64x]]],		[[[csqrtf64x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])
DEFINE_CPROTOS([[[complexf128x]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXF128X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]],
	       [[[csinf128x]]],		[[[ccosf128x]]],	[[[ctanf128x]]],
	       [[[casinf128x]]],	[[[cacosf128x]]],	[[[catanf128x]]],	[[[]]],
	       [[[csinhf128x]]],	[[[ccoshf128x]]],	[[[ctanhf128x]]],
	       [[[casinhf128x]]],	[[[cacoshf128x]]],	[[[catanhf128x]]],
	       [[[cexpf128x]]],		[[[]]],			[[[]]],
	       [[[clogf128x]]],		[[[clog10f128x]]],	[[[]]],			[[[]]],
	       [[[cpowf128x]]],		[[[csqrtf128x]]],	[[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]],
	       [[[]]],			[[[]]],			[[[]]])

DEFINE_CPROTOS([[[complexd32]]],
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD32]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD32_UNIMPLEMENTED]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD64]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXD64_UNIMPLEMENTED]]],
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
	       [[[MMUX_BASH_PARSE_CPROTO_ARG_COMPLEXD128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXD128_UNIMPLEMENTED]]],
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
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_TYPES_H */

/* end of file */
