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

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
#  define HAVE_SIGNED_LONG_LONG_INT	1
#endif

#include <mmux-bash-pointers.h>

/* Enable everything GNU. */
#define _GNU_SOURCE		1

/* Enable latest POSIX features. */
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE		200809L

/* ------------------------------------------------------------------ */

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

/* ------------------------------------------------------------------ */

/* We  really need  to pay  attention to  the order  in which  we include  the files,
   otherwise errors will ensue. */
#include "bashtypes.h"
#include "bashjmp.h"
#include "builtins.h"
#include "shell.h"
#include "common.h"


/** --------------------------------------------------------------------
 ** Preprocessor macros.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Constants and variables.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_private_decl regex_t mmux_bash_pointers_complex_rex;


/** --------------------------------------------------------------------
 ** Inline functions.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_FUNCTIONS]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
static inline mmux_libc_$1_part_t
mmux_bash_pointers_$1_real_part (mmux_libc_$1_t Z)
{
  return $2(Z);
}
static inline mmux_libc_$1_part_t
mmux_bash_pointers_$1_imag_part (mmux_libc_$1_t Z)
{
  return $3(Z);
}
static inline mmux_libc_$1_t
mmux_bash_pointers_rectangular_$1 (mmux_libc_$1_part_t re, mmux_libc_$1_part_t im)
{
  return (re + im * $4 _Complex_I);
}
]]])]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexf]]],  [[[crealf]]], [[[cimagf]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexd]]],  [[[creal]]],  [[[cimag]]],  [[[(mmux_libc_complexd_t)]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_BASIC_FUNCTIONS([[[complexld]]], [[[creall]]], [[[cimagl]]], [[[(mmux_libc_complexld_t)]]],
                                                  [[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_INTERNALS_H */

/* end of file */
