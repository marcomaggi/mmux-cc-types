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


/** --------------------------------------------------------------------
 ** Library management.
 ** ----------------------------------------------------------------- */

mmux_cc_types_decl bool mmux_cc_types_init (void)
  __attribute__((__constructor__));

mmux_cc_types_decl void mmux_cc_types_final (void)
  __attribute__((__destructor__));

mmux_cc_types_decl char const *	mmux_cc_types_version_string		(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_current	(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_revision(void);
mmux_cc_types_decl int		mmux_cc_types_version_interface_age	(void);

mmux_cc_types_decl int mmux_ctype_generic_error (...);

/* This is a helper to make it easier to debug inline functions defined by the header
   files when we do not include the standard headers. */
mmux_cc_types_decl int mmux_cc_types_dprintf (int fd, char const * restrict fmt, ...);


/** --------------------------------------------------------------------
 ** Include files.
 ** ----------------------------------------------------------------- */

/* Order is important here!  There are a lot of inline functions. */

#include <mmux-cc-types-typedefs.h>
#include <mmux-cc-types-sign-predicates.h>
#include <mmux-cc-types-complex-numbers.h>
#include <mmux-cc-types-constants.h>
#include <mmux-cc-types-arithmetics.h>
#include <mmux-cc-types-comparison.h>
#include <mmux-cc-types-mathematics.h>
#include <mmux-cc-types-bitwise.h>
#include <mmux-cc-types-real-numbers.h>
#include <mmux-cc-types-stringrep.h>
#include <mmux-cc-types-generics.h>


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_CC_TYPES_H */

/* end of file */
