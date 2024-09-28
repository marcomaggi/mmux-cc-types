/*
  Part of: MMUX Bash Pointers
  Contents: public header file
  Date: Sep  9, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms of the  GNU Lesser General Public  License as published by  the Free Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MMUX_BASH_POINTERS_H
#define MMUX_BASH_POINTERS_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

/* The  macro  MMUX_BASH_POINTERS_UNUSED  indicates   that  a  function,  function
   argument or variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_BASH_POINTERS_UNUSED;
   int foo (char unused_argument MMUX_BASH_POINTERS_UNUSED);
   int unused_variable MMUX_BASH_POINTERS_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_BASH_POINTERS_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_BASH_POINTERS_UNUSED		/* empty */
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
#      define mmux_bash_pointers_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_bash_pointers_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_bash_pointers_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_bash_pointers_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_bash_pointers_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_bash_pointers_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_bash_pointers_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_bash_pointers_decl		extern
#    define mmux_bash_pointers_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-bash-pointers-config.h>
#include <stdbool.h>
#include <stddef.h>
#include <inttypes.h>
#include <complex.h>


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl char const *	mmux_bash_pointers_version_string		(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_current	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_revision	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Error handling functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_set_ERRNO (int errnum, char const * caller_name);


/** --------------------------------------------------------------------
 ** Type definitions.
 ** ----------------------------------------------------------------- */

/* These definitions can be useful when expanding macros. */
typedef void *				mmux_libc_pointer_t;
typedef signed char			mmux_libc_schar_t;
typedef unsigned char			mmux_libc_uchar_t;
typedef signed short int		mmux_libc_sshort_t;
typedef unsigned short int		mmux_libc_ushort_t;
typedef signed int			mmux_libc_sint_t;
typedef unsigned int			mmux_libc_uint_t;
typedef signed long			mmux_libc_slong_t;
typedef unsigned long			mmux_libc_ulong_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],
[[[typedef signed long long	      mmux_libc_sllong_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],
[[[typedef unsigned long long int      mmux_libc_ullong_t;]]])

typedef int8_t				mmux_libc_sint8_t;
typedef uint8_t				mmux_libc_uint8_t;
typedef int16_t				mmux_libc_sint16_t;
typedef uint16_t			mmux_libc_uint16_t;
typedef int32_t				mmux_libc_sint32_t;
typedef uint32_t			mmux_libc_uint32_t;
typedef int64_t				mmux_libc_sint64_t;
typedef uint64_t			mmux_libc_uint64_t;

typedef float				mmux_libc_float_t;
typedef double				mmux_libc_double_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],  [[[typedef long double		mmux_libc_ldouble_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32]]],  [[[__extension__ typedef _Float32	mmux_libc_float32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64]]],  [[[__extension__ typedef _Float64	mmux_libc_float64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128]]], [[[__extension__ typedef _Float128	mmux_libc_float128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT32X]]], [[[__extension__ typedef _Float32x	mmux_libc_float32x_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT64X]]], [[[__extension__ typedef _Float64x	mmux_libc_float64x_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_FLOAT128X]]],[[[__extension__ typedef _Float128x	mmux_libc_float128x_t;]]])

typedef float complex			mmux_libc_complexf_t;
typedef mmux_libc_float_t		mmux_libc_complexf_part_t;
typedef double complex			mmux_libc_complexd_t;
typedef mmux_libc_double_t		mmux_libc_complexd_part_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[
typedef long double complex	mmux_libc_complexld_t;
typedef mmux_libc_ldouble_t	mmux_libc_complexld_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF32]]],[[[
__extension__ typedef _Float32x complex		mmux_libc_complexf32_t;
typedef mmux_libc_float32_t			mmux_libc_complexf32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF64]]],[[[
__extension__ typedef _Float64x complex		mmux_libc_complexf64_t;
typedef mmux_libc_float64_t			mmux_libc_complexf64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF128]]],[[[
__extension__ typedef _Float128 complex		mmux_libc_complexf128_t;
typedef mmux_libc_float128_t			mmux_libc_complexf128_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF32X]]],[[[
__extension__ typedef _Float32x complex	mmux_libc_complexf32x_t;
typedef mmux_libc_float32x_t	mmux_libc_complexf32x_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF64X]]],[[[
__extension__ typedef _Float64x complex	mmux_libc_complexf64x_t;
typedef mmux_libc_float64x_t	mmux_libc_complexf64x_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXF128X]]],[[[
__extension__ typedef _Float128x complex	mmux_libc_complexf128x_t;
typedef mmux_libc_float128x_t	mmux_libc_complexf128x_part_t;
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL32]]],  [[[__extension__ typedef _Decimal32  mmux_libc_decimal32_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL64]]],  [[[__extension__ typedef _Decimal64  mmux_libc_decimal64_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL128]]], [[[__extension__ typedef _Decimal128 mmux_libc_decimal128_t;]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD32]]],  [[[
struct mmux_libc_complexd32_tag_t {
  mmux_libc_decimal32_t		re;
  mmux_libc_decimal32_t		im;
};
typedef struct mmux_libc_complexd32_tag_t mmux_libc_complexd32_t;
typedef mmux_libc_decimal32_t	mmux_libc_complexd32_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD64]]],  [[[
struct mmux_libc_complexd64_tag_t {
  mmux_libc_decimal64_t		re;
  mmux_libc_decimal64_t		im;
};
typedef struct mmux_libc_complexd64_tag_t mmux_libc_complexd64_t;
typedef mmux_libc_decimal64_t	mmux_libc_complexd64_part_t;
]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_COMPLEXD128]]], [[[
struct mmux_libc_complexd128_tag_t {
  mmux_libc_decimal128_t	re;
  mmux_libc_decimal128_t	im;
};
typedef struct mmux_libc_complexd128_tag_t mmux_libc_complexd128_t;
typedef mmux_libc_decimal128_t	mmux_libc_complexd128_part_t;
]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[DEFINE_ALIAS_TYPEDEF]]],[[[typedef mmux_libc_[[[]]]$2[[[]]]_t mmux_libc_[[[]]]$1[[[]]]_t]]])

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

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL32]]],[[[
mmux_bash_pointers_decl mmux_libc_decimal32_t mmux_strtod32 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_strfromd32 (char * s_value, size_t size, char const * restrict format, mmux_libc_decimal32_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL64]]],[[[
mmux_libc_decimal64_t mmux_strtod64 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_strfromd64 (char * s_value, size_t size, char const * restrict format, mmux_libc_decimal64_t value)
  __attribute__((__nonnull__(3)));
]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_DECIMAL128]]],[[[
mmux_libc_decimal128_t mmux_strtod128 (char const * restrict input_string, char ** restrict tailptr)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_strfromd128 (char * s_value, size_t size, char const * restrict format, mmux_libc_decimal128_t value)
  __attribute__((__nonnull__(3)));
]]])


/** --------------------------------------------------------------------
 ** Complex basic functions.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_bash_pointers_decl mmux_libc_$1_t      mmux_rectangular_$1 (mmux_libc_$1_part_t re, mmux_libc_$1_part_t im);
mmux_bash_pointers_decl mmux_libc_$1_part_t mmux_$1_real_part (mmux_libc_$1_t Z);
mmux_bash_pointers_decl mmux_libc_$1_part_t mmux_$1_imag_part (mmux_libc_$1_t Z);
]]])]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexld]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf32]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf64]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf128]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32X]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64X]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128X]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_PROTOS([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Special parser functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_parse_signed_integer   (mmux_libc_sintmax_t * p_dest, char const * s_source,
								       mmux_libc_sintmax_t target_min, mmux_libc_sintmax_t target_max,
								       char const * target_type_name, char const * caller_name);

mmux_bash_pointers_decl int mmux_bash_pointers_parse_unsigned_integer (mmux_libc_uintmax_t * p_dest, char const * s_source,
								       mmux_libc_uintmax_t target_max,
								       char const * target_type_name, char const * caller_name);


/** --------------------------------------------------------------------
 ** Type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPE_PROTOS_REAL_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
typedef mmux_libc_$1_t mmux_type_unary_operation_$1_t   (mmux_libc_$1_t X);
typedef mmux_libc_$1_t mmux_type_binary_operation_$1_t  (mmux_libc_$1_t X, mmux_libc_$1_t Y);
typedef mmux_libc_$1_t mmux_type_ternary_operation_$1_t (mmux_libc_$1_t X, mmux_libc_$1_t Y, mmux_libc_$1_t Z);
typedef bool           mmux_type_unary_predicate_$1_t   (mmux_libc_$1_t X);
typedef bool           mmux_type_binary_predicate_$1_t  (mmux_libc_$1_t X, mmux_libc_$1_t Y);
typedef bool           mmux_type_ternary_predicate_$1_t (mmux_libc_$1_t X, mmux_libc_$1_t Y, mmux_libc_$1_t Z);

mmux_bash_pointers_decl bool mmux_bash_pointers_string_is_$1 (char const * s_value);
mmux_bash_pointers_decl int mmux_bash_pointers_sizeof_$1 (void)
  __attribute__((__const__));
mmux_bash_pointers_decl mmux_libc_$1_t mmux_bash_pointers_minimum_$1 (void)
  __attribute__((__const__));
mmux_bash_pointers_decl mmux_libc_$1_t mmux_bash_pointers_maximum_$1 (void)
  __attribute__((__const__));

mmux_bash_pointers_decl int mmux_bash_pointers_parse_$1  (mmux_libc_$1_t * p_value, char const * s_value, char const * caller_name)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_$1 (char * ptr, int len, mmux_libc_$1_t value)
  __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t v);
mmux_bash_pointers_decl int mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value);
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
typedef mmux_libc_$1_t mmux_type_unary_operation_$1_t   (mmux_libc_$1_t X);
typedef mmux_libc_$1_t mmux_type_binary_operation_$1_t  (mmux_libc_$1_t X, mmux_libc_$1_t Y);
typedef mmux_libc_$1_t mmux_type_ternary_operation_$1_t (mmux_libc_$1_t X, mmux_libc_$1_t Y, mmux_libc_$1_t Z);
typedef bool           mmux_type_unary_predicate_$1_t   (mmux_libc_$1_t X);
typedef bool           mmux_type_binary_predicate_$1_t  (mmux_libc_$1_t X, mmux_libc_$1_t Y);
typedef bool           mmux_type_ternary_predicate_$1_t (mmux_libc_$1_t X, mmux_libc_$1_t Y, mmux_libc_$1_t Z);

mmux_bash_pointers_decl bool mmux_bash_pointers_string_$1_p (char const * s_arg);
mmux_bash_pointers_decl int mmux_bash_pointers_sizeof_$1 (void)
  __attribute__((__const__));
mmux_bash_pointers_decl int mmux_bash_pointers_parse_$1  (mmux_libc_$1_t * p, char const * s, char const * caller_name)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_$1 (char * s, int l, mmux_libc_$1_t v)
  __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t v);
mmux_bash_pointers_decl int mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value);
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_TYPE_PROTOS_REAL_NUMBERS([[[decimal128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64X]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128X]]])

DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
DEFINE_TYPE_PROTOS_COMPLEX_NUMBERS([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

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
mmux_bash_pointers_decl mmux_type_unary_operation_$1_t	mmux_$1_abs;
mmux_bash_pointers_decl mmux_type_binary_operation_$1_t	mmux_$1_max;
mmux_bash_pointers_decl mmux_type_binary_operation_$1_t mmux_$1_min;
]]])]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[double]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[decimal128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])

DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_TYPE_FUNCTIONS_COMPARISON_MORE([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])


/** --------------------------------------------------------------------
 ** Type predicate prototypes.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PREDICATE_PROTOS_REAL_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_zero;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_nan;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_infinite;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_positive;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_negative;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_non_positive;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_non_negative;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_equal;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_greater;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_lesser;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_greater_equal;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_lesser_equal;
]]])]]])

m4_define([[[DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_zero;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_nan;
mmux_bash_pointers_decl mmux_type_unary_predicate_$1_t  mmux_$1_is_infinite;
mmux_bash_pointers_decl mmux_type_binary_predicate_$1_t mmux_$1_equal;
]]])]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[pointer]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[schar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uchar]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sshort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ushort]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[uint]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[slong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ulong]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ullong]]],		[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[double]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[float128x]]],		[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal32]]],		[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal64]]],		[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_PREDICATE_PROTOS_REAL_NUMBERS([[[decimal128]]],		[[[MMUX_HAVE_TYPE_DECIMAL128]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_PREDICATE_PROTOS_COMPLEX_NUMBERS([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])

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

m4_define([[[DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
mmux_bash_pointers_decl mmux_type_ternary_predicate_$1_t mmux_$1_equal_absmargin;
mmux_bash_pointers_decl mmux_type_ternary_predicate_$1_t mmux_$1_equal_relepsilon;
mmux_bash_pointers_decl mmux_type_ternary_predicate_$2_t mmux_$2_equal_absmargin;
mmux_bash_pointers_decl mmux_type_ternary_predicate_$2_t mmux_$2_equal_relepsilon;
]]])]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float]]],	[[[complexf]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[double]]],	[[[complexd]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[ldouble]]],	[[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32]]],	[[[complexf32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64]]],	[[[complexf64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128]]],	[[[complexf128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float32x]]],	[[[complexf32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float64x]]],	[[[complexf64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[float128x]]],	[[[complexf128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal32]]],	[[[complexd32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal64]]],	[[[complexd64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_TYPE_PROTOS_FLOAT_APPROX_COMPARISONS([[[decimal128]]],	[[[complexd128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Bash interface.
 ** ----------------------------------------------------------------- */

/* This definition  must match the  definition of "BUILTIN_ENABLED" in  Bash's header
   file "builtins.h". */
#undef  MMUX_BUILTIN_ENABLED
#define MMUX_BUILTIN_ENABLED	0x01

typedef enum {
  MMUX_SUCCESS=0,
  MMUX_FAILURE=1
} mmux_rv_t;

/* This is meatn to be an alias for Bash's "WORD_LIST". */
typedef void *		mmux_bash_word_list_t;

typedef bool mmux_bash_builtin_validate_argc_t                  (int argc);
typedef int  mmux_bash_builtin_implementation_function_t        (mmux_bash_word_list_t word_list);
typedef int  mmux_bash_builtin_custom_implementation_function_t (int argc, char const * const argv[]);

/* This definition  must match the  definition of  "struct builtin" in  Bash's header
   file "builtins.h". */
struct mmux_bash_struct_builtin_tag_t {
  char *					name;		/* The name that the user types. */
  mmux_bash_builtin_implementation_function_t *	function;	/* The address of the invoked function. */
  int						flags;		/* One of the #defines above. */
  char * const *				long_doc;	/* NULL terminated array of strings. */
  char const *					short_doc;	/* Short version of documentation. */
  char *					reserved0;	/* Reserved for Bash. */
};

typedef struct mmux_bash_struct_builtin_tag_t	mmux_bash_struct_builtin_t;

mmux_bash_pointers_decl mmux_rv_t mmux_bash_builtin_implementation_function
  (mmux_bash_word_list_t word_list,
   mmux_bash_builtin_validate_argc_t * validate_argc,
   mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
  __attribute__((__nonnull__(1,2,3)));

mmux_bash_pointers_decl mmux_rv_t mmux_bash_builtin_implementation_function_no_options
  (mmux_bash_word_list_t word_list,
   mmux_bash_builtin_validate_argc_t * validate_argc,
   mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
  __attribute__((__nonnull__(1,2,3)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl int mmux_bash_store_string_in_variable        (char const * variable_name, char const * s_value,
								       char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl int mmux_bash_store_string_in_global_variable (char const * variable_name, char const * s_value,
								       char const * caller_name)
  __attribute__((__nonnull__(1,2)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl int mmux_bash_store_sint_in_variable        (char const * variable_name, int value, char const * caller_name)
  __attribute__((__nonnull__(1)));

mmux_bash_pointers_decl int mmux_bash_store_sint_in_global_variable (char const * variable_name, int value, char const * caller_name)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl int mmux_bash_create_global_string_variable (char const * variable_name, char const * s_value,
								     char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl int mmux_bash_create_global_sint_variable   (char const * variable_name, int value, char const * caller_name)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl int mmux_bash_get_shell_variable_string_value (char const ** p_variable_value, char const * variable_name,
								       char const * caller_name)
  __attribute__((__nonnull__(1,2)));


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_H */

/* end of file */
