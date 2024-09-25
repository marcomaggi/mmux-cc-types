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

mmux_bash_pointers_decl int mmux_bash_pointers_set_ERRNO (int errnum);


/** --------------------------------------------------------------------
 ** Type definitions preprocessor symbols.
 ** ----------------------------------------------------------------- */

#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
#  define MMUX_HAVE_TYPE_SLLONG		1
#endif

#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
#  define MMUX_HAVE_TYPE_ULLONG		1
#endif

#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
#  define MMUX_HAVE_TYPE_LDOUBLE	1
#endif


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
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[typedef signed long long	      mmux_libc_sllong_t;]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[typedef unsigned long long int      mmux_libc_ullong_t;]]])

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
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[typedef long double		mmux_libc_ldouble_t;]]])
typedef float complex			mmux_libc_complexf_t;
typedef mmux_libc_float_t		mmux_libc_complexf_part_t;
typedef double complex			mmux_libc_complexd_t;
typedef mmux_libc_double_t		mmux_libc_complexd_part_t;
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[
typedef long double complex	mmux_libc_complexld_t;
typedef mmux_libc_ldouble_t	mmux_libc_complexld_part_t;
]]])

m4_divert(-1)m4_dnl
m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF]]],[[[typedef mmux_libc_[[[]]]$2[[[]]]_t mmux_libc_[[[]]]$1[[[]]]_t]]])
m4_divert(0)m4_dnl

MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[ssize]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[usize]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_USIZE]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[sintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[uintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[sintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[uintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[mode]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_MODE]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[off]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_OFF]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[pid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PID]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[uid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UID]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[gid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_GID]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[ptrdiff]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[wchar]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR]]]);
MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF([[[wint]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WINT]]]);


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
 ** Type functions definition.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl
m4_dnl $1 - type stem
m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES_NO_MAXMIN]]],[[[m4_dnl
mmux_bash_pointers_decl bool mmux_bash_pointers_string_[[[]]]$1[[[]]]_p (char const * s_arg);
mmux_bash_pointers_decl int mmux_bash_pointers_sizeof_[[[]]]$1[[[]]] (void)
     __attribute__((__const__));
mmux_bash_pointers_decl int mmux_bash_pointers_parse_$1  (mmux_libc_[[[]]]$1[[[]]]_t * p, char const * s, char const * who)
       __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_$1 (char * s, int l, mmux_libc_[[[]]]$1[[[]]]_t v)
       __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_size_$1 (mmux_libc_[[[]]]$1[[[]]]_t v);
mmux_bash_pointers_decl int mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value);
]]])

m4_dnl $1 - type stem
m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES]]],[[[m4_dnl
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES_NO_MAXMIN([[[$1]]])
mmux_bash_pointers_decl mmux_libc_[[[]]]$1[[[]]]_t mmux_bash_pointers_minimum_$1 (void)
     __attribute__((__const__));
mmux_bash_pointers_decl mmux_libc_[[[]]]$1[[[]]]_t mmux_bash_pointers_maximum_$1 (void)
     __attribute__((__const__));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_maximum_$1 (char * s, size_t l)
       __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_minimum_$1 (char * s, size_t l)
       __attribute__((__nonnull__(1)));
]]])
m4_divert(0)m4_dnl

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(pointer)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(schar)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uchar)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sshort)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ushort)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(slong)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ulong)
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sllong)]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ullong)]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(float)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(double)
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ldouble)]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES_NO_MAXMIN([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES_NO_MAXMIN([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES_NO_MAXMIN([[[complexld]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint8)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint8)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint16)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint16)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint32)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint32)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint64)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint64)

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ssize)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(usize)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sintmax)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uintmax)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sintptr)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uintptr)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(mode)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(off)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(pid)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uid)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(gid)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ptrdiff)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(wchar)
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(wint)


/** --------------------------------------------------------------------
 ** Type predicate functions.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
typedef bool mmux_type_predicate_$1_t (mmux_libc_$1_t X);

mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_zero;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_positive;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_negative;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_non_positive;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_non_negative;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_nan;
mmux_bash_pointers_decl mmux_type_predicate_$1_t mmux_$1_is_infinite;
]]])]]])

MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[pointer]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[float]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[double]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ssize]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uintptr]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[off]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_PREDICATE_PROTOS([[[wint]]])

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl bool mmux_float_equal_absmargin (mmux_libc_float_t op1, mmux_libc_float_t op2, mmux_libc_float_t margin);
mmux_bash_pointers_decl bool mmux_float_equal_relepsilon (mmux_libc_float_t op1, mmux_libc_float_t op2, mmux_libc_float_t epsilon);
mmux_bash_pointers_decl bool mmux_complexf_equal_absmargin (mmux_libc_complexf_t op1, mmux_libc_complexf_t op2, mmux_libc_complexf_t margin);
mmux_bash_pointers_decl bool mmux_complexf_equal_relepsilon (mmux_libc_complexf_t op1, mmux_libc_complexf_t op2, mmux_libc_complexf_t epsilon);

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl bool mmux_double_equal_absmargin (mmux_libc_double_t op1, mmux_libc_double_t op2, mmux_libc_double_t margin);
mmux_bash_pointers_decl bool mmux_double_equal_relepsilon (mmux_libc_double_t op1, mmux_libc_double_t op2, mmux_libc_double_t epsilon);
mmux_bash_pointers_decl bool mmux_complexd_equal_absmargin (mmux_libc_complexd_t op1, mmux_libc_complexd_t op2, mmux_libc_complexd_t margin);
mmux_bash_pointers_decl bool mmux_complexd_equal_relepsilon (mmux_libc_complexd_t op1, mmux_libc_complexd_t op2, mmux_libc_complexd_t epsilon);

/* ------------------------------------------------------------------ */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_LDOUBLE]]],[[[
mmux_bash_pointers_decl bool mmux_ldouble_equal_absmargin (mmux_libc_ldouble_t op1, mmux_libc_ldouble_t op2, mmux_libc_ldouble_t margin);
mmux_bash_pointers_decl bool mmux_ldouble_equal_relepsilon (mmux_libc_ldouble_t op1, mmux_libc_ldouble_t op2, mmux_libc_ldouble_t epsilon);
mmux_bash_pointers_decl bool mmux_complexld_equal_absmargin (mmux_libc_complexld_t op1, mmux_libc_complexld_t op2, mmux_libc_complexld_t margin);
mmux_bash_pointers_decl bool mmux_complexld_equal_relepsilon (mmux_libc_complexld_t op1, mmux_libc_complexld_t op2, mmux_libc_complexld_t epsilon);
]]])


/** --------------------------------------------------------------------
 ** Bash interface.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_get_shell_variable_string_value (char const ** p_variable_value,
										char const * const variable_name,
										char const * const caller_name)
  __attribute__((__nonnull__(1,2)));


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_H */

/* end of file */
