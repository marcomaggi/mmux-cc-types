/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Aug 30, 2025

  Abstract

	This module implements some internal definitions for libdfp adapter code.

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

#ifndef MMUX_CC_TYPES_LIBDFP_INTERNAL_H
#define MMUX_CC_TYPES_LIBDFP_INTERNAL_H		1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

/* NOTE We  do not include  "mmux-cc-types-internals.h" because "libdfp"  messes with
   the  standard headers.   So  we  duplicate, in  this  file,  definitions from  the
   internals file; it is ugly, but better for me.  (Marco Maggi; Aug 16, 2025) */
#include <mmux-cc-types-config.h>

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_STDBOOL_H
#  include <stdbool.h>
#endif

/* When using libdfp: this will load <dfp/stdlib.h> */
#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif

#ifdef HAVE_STDIO_H
#  include <stdio.h>
#endif

#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif

/* When using libdfp: this will load <dfp/math.h> */
#ifdef HAVE_MATH_H
#  include <math.h>
#endif

/* When using libdfp: this will load <dfp/float.h> */
#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif

#include <mmux-cc-types-libdfp.h>


/** --------------------------------------------------------------------
 ** Macros.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_SOME_MACROS]]],[[[
#define MMUX_STANDARD_FLONUMD$1_IS_ZERO(X)	(FP_ZERO	== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_NAN(X)	(FP_NAN		== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X)	(FP_INFINITE	== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_NORMAL(X)	(FP_NORMAL	== (fpclassify(X)))
#define MMUX_STANDARD_FLONUMD$1_IS_SUBNORMAL(X)	(FP_SUBNORMAL	== (fpclassify(X)))
]]])
m4_divert(0)m4_dnl
DEFINE_SOME_MACROS(32)
DEFINE_SOME_MACROS(64)
DEFINE_SOME_MACROS(128)


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* define MMUX_CC_TYPES_LIBDFP_INTERNAL_H */

/* end of file */
