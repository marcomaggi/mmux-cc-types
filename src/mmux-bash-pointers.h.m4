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

#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
typedef signed long long		mmux_libc_sllong_t;
#endif
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
typedef unsigned long long int		mmux_libc_ullong_t;
#endif

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
#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
typedef long double			mmux_libc_ldouble_t;
#endif
typedef double complex			mmux_libc_complex_t;

m4_divert(-1)m4_dnl
m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[MMUX_BASH_POINTERS_DEFINE_ALIAS_TYPEDEF]]],
  [[[typedef mmux_libc_[[[]]]$2[[[]]]_t		mmux_libc_[[[]]]$1[[[]]]_t]]])
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
 ** Type functions definition.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl
m4_dnl $1 - type stem
m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES]]],[[[m4_dnl
mmux_bash_pointers_decl bool mmux_bash_pointers_string_[[[]]]$1[[[]]]_p (char const * s_arg);
mmux_bash_pointers_decl int mmux_bash_pointers_sizeof_[[[]]]$1[[[]]] (void)
     __attribute__((__const__));
mmux_bash_pointers_decl mmux_libc_[[[]]]$1[[[]]]_t mmux_bash_pointers_minimum_$1 (void)
     __attribute__((__const__));
mmux_bash_pointers_decl mmux_libc_[[[]]]$1[[[]]]_t mmux_bash_pointers_maximum_$1 (void)
     __attribute__((__const__));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_maximum_$1 (char * s, size_t l)
       __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_minimum_$1 (char * s, size_t l)
       __attribute__((__nonnull__(1)));
mmux_bash_pointers_decl int mmux_bash_pointers_parse_$1  (mmux_libc_[[[]]]$1[[[]]]_t * p, char const * s, char const * who)
       __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_$1 (char * s, size_t l, mmux_libc_[[[]]]$1[[[]]]_t v)
       __attribute__((__nonnull__(1)))]]])
m4_divert(0)m4_dnl

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(pointer);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(schar);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uchar);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sshort);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ushort);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(slong);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ulong);
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sllong);
#endif
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ullong);
#endif

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(float);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(double);
#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ldouble);
#endif

/* The type "complex" has neither maximum nor minimum functions. */
mmux_bash_pointers_decl bool mmux_bash_pointers_string_complex_p (char const * s_arg);
mmux_bash_pointers_decl int mmux_bash_pointers_sizeof_complex (void)
  __attribute__((__const__));
mmux_bash_pointers_decl int mmux_bash_pointers_parse_complex (mmux_libc_complex_t * p, char const * s, char const * who)
  __attribute__((__nonnull__(1,2)));
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_complex (char * s, size_t l, mmux_libc_complex_t v)
  __attribute__((__nonnull__(1)));

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint8);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint8);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint16);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint16);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint32);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint32);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sint64);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uint64);

MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ssize);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(usize);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sintmax);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uintmax);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(sintptr);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uintptr);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(mode);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(off);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(pid);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(uid);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(gid);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(ptrdiff);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(wchar);
MMUX_BASH_POINTERS_DEFINE_TYPE_FUNCTION_PROTOTYPES(wint);


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl char const *	mmux_bash_pointers_version_string		(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_current	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_revision	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Type stdout printers.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_print_pointer (void * data);
mmux_bash_pointers_decl int mmux_bash_pointers_print_usize   (size_t data);
mmux_bash_pointers_decl int mmux_bash_pointers_print_complex (double complex data);


/** --------------------------------------------------------------------
 ** Error handling functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_set_ERRNO (int errnum);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_H */

/* end of file */
