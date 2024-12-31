/*
  Part of: MMUX Bash Pointers
  Contents: private header file
  Date: Sep  9, 2024

  Abstract

	This header file is for internal definitions.  It must be included by all the
	source files in this package.

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

#ifndef MMUX_BASH_POINTERS_INTERNALS_H
#define MMUX_BASH_POINTERS_INTERNALS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

/* Look  into "configure.ac"  and "config.h"  for  the definition  of C  preprocessor
   symbols that enable some standardised features. */
#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#include <mmux-bash-pointers.h>

#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif

#ifdef HAVE_STRING_H
#  include <string.h>
#endif

#ifdef HAVE_STRINGS_H
#  include <strings.h>
#endif

#ifdef HAVE_CTYPE_H
#  include <ctype.h>
#endif

#ifdef HAVE_REGEX_H
#  include <regex.h>
#endif


/** --------------------------------------------------------------------
 ** Preprocessor macros.
 ** ----------------------------------------------------------------- */

#undef  MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN
#define MMUX_BASH_POINTERS_DEFAULT_COMPARISON_ABSOLUTE_MARGIN	1e-6

#undef  MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON
#define MMUX_BASH_POINTERS_DEFAULT_COMPARISON_RELATIVE_EPSILON	1e-6


/** --------------------------------------------------------------------
 ** Constants and variables.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_private_decl mmux_bash_rv_t mmux_bash_pointers_init_time_module (void);
mmux_bash_pointers_private_decl mmux_bash_rv_t mmux_bash_pointers_init_file_descriptors_module (void);
mmux_bash_pointers_private_decl mmux_bash_rv_t mmux_bash_pointers_init_file_system_module (void);
mmux_bash_pointers_private_decl mmux_bash_rv_t mmux_bash_pointers_init_sockets_module (void);
mmux_bash_pointers_private_decl mmux_bash_rv_t mmux_bash_pointers_init_system_configuration_module (void);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_INTERNALS_H */

/* end of file */
