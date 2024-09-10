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

/*
  #include <setjmp.h>
  #include <errno.h>
  #include <unistd.h>
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <inttypes.h>
#include <complex.h>


/** --------------------------------------------------------------------
 ** Constants and preprocessor macros.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl char const *	mmux_bash_pointers_version_string		(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_current	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_revision(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Type string parsers.
 ** ----------------------------------------------------------------- */

#undef  mmux_bash_pointers_parse_offset
#define mmux_bash_pointers_parse_offset(P_DATA,S_ARG,CALLER_NAME) \
  mmux_bash_pointers_parse_usize(P_DATA,S_ARG,CALLER_NAME)

mmux_bash_pointers_decl int mmux_bash_pointers_parse_pointer (void **  p_data, char const * s_arg, char const * caller_name);

mmux_bash_pointers_decl int mmux_bash_pointers_parse_schar   (signed   char * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uchar   (unsigned char * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_sint    (signed   int  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uint    (unsigned int  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_slong   (signed   long * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_ulong   (unsigned long * p, char const * s, char const * caller_name);
#if (HAVE_LONG_LONG_INT)
mmux_bash_pointers_decl int mmux_bash_pointers_parse_sllong  (signed   long long * p, char const * s, char const * caller_name);
#endif
#if (HAVE_UNSIGNED_LONG_LONG_INT)
mmux_bash_pointers_decl int mmux_bash_pointers_parse_ullong  (unsigned long long * p, char const * s, char const * caller_name);
#endif
mmux_bash_pointers_decl int mmux_bash_pointers_parse_float   (float   * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_double  (double  * p, char const * s, char const * caller_name);
#if (HAVE_LONG_DOUBLE)
mmux_bash_pointers_decl int mmux_bash_pointers_parse_ldouble (long double * p, char const * s, char const * caller_name);
#endif
mmux_bash_pointers_decl int mmux_bash_pointers_parse_complex (double complex * p, const char * s, char const * caller_name);

mmux_bash_pointers_decl int mmux_bash_pointers_parse_sint8   (int8_t   * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uint8   (uint8_t  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_sint16  (int16_t  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uint16  (uint16_t * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_sint32  (int32_t  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uint32  (uint32_t * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_sint64  (int64_t  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_uint64  (uint64_t * p, char const * s, char const * caller_name);

mmux_bash_pointers_decl int mmux_bash_pointers_parse_usize   (size_t  * p, char const * s, char const * caller_name);
mmux_bash_pointers_decl int mmux_bash_pointers_parse_ssize   (ssize_t * p, char const * s, char const * caller_name);


/** --------------------------------------------------------------------
 ** Type string printers.
 ** ----------------------------------------------------------------- */

#undef  mmux_bash_pointers_sprint_offset
#define mmux_bash_pointers_sprint_offset(STRPTR,LEN,VALUE) \
  mmux_bash_pointers_sprint_usize(STRPTR,LEN,VALUE)

mmux_bash_pointers_decl int mmux_bash_pointers_sprint_pointer (char * strptr, size_t len, void * value);

mmux_bash_pointers_decl int mmux_bash_pointers_sprint_schar   (char * strptr, size_t len, signed   char value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uchar   (char * strptr, size_t len, unsigned char value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sint    (char * strptr, size_t len, signed   int  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uint    (char * strptr, size_t len, unsigned int  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_slong   (char * strptr, size_t len, signed   long value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_ulong   (char * strptr, size_t len, unsigned long value);
#if (HAVE_LONG_LONG_INT)
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sllong  (char * strptr, size_t len, signed   long long value);
#endif
#if (HAVE_UNSIGNED_LONG_LONG_INT)
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_ullong  (char * strptr, size_t len, unsigned long long value);
#endif
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_float   (char * strptr, size_t len, float   value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_double  (char * strptr, size_t len, double  value);
#if (HAVE_LONG_DOUBLE)
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_ldouble (char * strptr, size_t len, long double value);
#endif
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_complex (char * strptr, size_t len, double complex value);

mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sint8   (char * strptr, size_t len, int8_t   value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uint8   (char * strptr, size_t len, uint8_t  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sint16  (char * strptr, size_t len, int16_t  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uint16  (char * strptr, size_t len, uint16_t value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sint32  (char * strptr, size_t len, int32_t  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uint32  (char * strptr, size_t len, uint32_t value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_sint64  (char * strptr, size_t len, int64_t  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_uint64  (char * strptr, size_t len, uint64_t value);

mmux_bash_pointers_decl int mmux_bash_pointers_sprint_usize   (char * strptr, size_t len, size_t  value);
mmux_bash_pointers_decl int mmux_bash_pointers_sprint_ssize   (char * strptr, size_t len, ssize_t value);


/** --------------------------------------------------------------------
 ** Type stdout printers.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl int mmux_bash_pointers_print_pointer (void * data);
mmux_bash_pointers_decl int mmux_bash_pointers_print_usize   (size_t data);
mmux_bash_pointers_decl int mmux_bash_pointers_print_complex (double complex data);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_H */

/* end of file */
