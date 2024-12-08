/*
  Part of: MMUX CC Libc
  Contents: public header file
  Date: Dec  8, 2024

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

#ifndef MMUX_CC_LIBC_H
#define MMUX_CC_LIBC_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

/* The  macro MMUX_CC_LIBC_UNUSED  indicates that  a function,  function argument  or
   variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_CC_LIBC_UNUSED;
   int foo (char unused_argument MMUX_CC_LIBC_UNUSED);
   int unused_variable MMUX_CC_LIBC_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_CC_LIBC_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_CC_LIBC_UNUSED		/* empty */
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
#      define mmux_cc_libc_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_cc_libc_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_cc_libc_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_cc_libc_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_cc_libc_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_cc_libc_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_cc_libc_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_cc_libc_decl		extern
#    define mmux_cc_libc_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-libc-config.h>
#include <mmux-cc-types.h>


/** --------------------------------------------------------------------
 ** Initialisation functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl bool mmux_cc_libc_init (void);


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_cc_libc_decl char const *	mmux_cc_libc_version_string		(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_current	(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_revision	(void);
mmux_cc_libc_decl int		mmux_cc_libc_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Type definitions.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_LIBC_H */

/* end of file */
