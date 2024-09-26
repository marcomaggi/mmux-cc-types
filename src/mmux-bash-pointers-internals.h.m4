/*
  Part of: MMUX Bash Pointers
  Contents: private header file
  Date: Sep  9, 2024

  Abstract

	This header file is for internal definitions.  It must be included by all the
	source files in this package.

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

#ifndef MMUX_BASH_POINTERS_INTERNALS_H
#define MMUX_BASH_POINTERS_INTERNALS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

/* Look  into "configure.ac"  and "config.h"  for  the definition  of C  preprocessor
   symbols that enable  some standardised features.  For example:  whatever is needed
   for  the GNU  C Library  to make  available the  "_FloatN" and  "_FloatNx" related
   features.*/
#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#include <mmux-bash-pointers.h>

#ifdef HAVE_INTTYPES_H
#  include <inttypes.h>
#endif

#ifdef HAVE_STDINT_H
#  include <stdint.h>
#endif

#ifdef HAVE_STDIO_H
#  include <stdio.h>
#endif

#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif

#ifdef HAVE_STRING_H
#  include <string.h>
#endif

#ifdef HAVE_STRINGS_H
#  include <strings.h>
#endif

#ifdef HAVE_SYS_STAT_H
#  include <sys/stat.h>
#endif

/* for the type: mode_t, uid_t, gid_t */
#ifdef HAVE_SYS_TYPES_H
#  include <sys/types.h>
#endif

/* for the type: ssize_t, pid_t */
#ifdef HAVE_UNISTD_H
#  include <unistd.h>
#endif

/* ------------------------------------------------------------------ */

#ifdef HAVE_ASSERT_H
#  include <assert.h>
#endif

#ifdef HAVE_COMPLEX_H
#  include <complex.h>
#endif

#ifdef HAVE_CTYPE_H
#  include <ctype.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif

#ifdef HAVE_LIMITS_H
#  include <limits.h>
#endif

#ifdef HAVE_MATH_H
#  include <math.h>
#endif

#ifdef HAVE_STDBOOL_H
#  include <stdbool.h>
#endif

#ifdef HAVE_WCHAR_H
#  include <wchar.h>
#endif

/* ------------------------------------------------------------------ */

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

mmux_bash_pointers_private_decl regex_t mmux_bash_pointers_complex_rex;


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_INTERNALS_H */

/* end of file */
