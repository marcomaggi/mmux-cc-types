/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Aug 31, 2025

  Abstract

	This  module  implements  mathematical   constants  for  the  standard  types
	"mmux_standard_flonumcd$1_t".

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


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-libdfp-internals.h>


/** --------------------------------------------------------------------
 ** Maximums and MINIMUMS.
 ** ----------------------------------------------------------------- */

/* NOTE I'm a stupid ignorant that can do  nothing: I do not know where the constants
   "DEC*_MAX" are  defined, but  they are  defined somewhere.   (Marco Maggi;  Sep 2,
   2025) */

constexpr static const mmux_standard_flonumd32_t   mmux_libc_maximum_flonumd32=DEC32_MAX;
constexpr static const mmux_standard_flonumd32_t   mmux_libc_minimum_flonumd32=-(mmux_libc_maximum_flonumd32);

constexpr static const mmux_standard_flonumd64_t   mmux_libc_maximum_flonumd64=DEC64_MAX;
constexpr static const mmux_standard_flonumd64_t   mmux_libc_minimum_flonumd64=-(mmux_libc_maximum_flonumd64);

constexpr static const mmux_standard_flonumd128_t   mmux_libc_maximum_flonumd128=DEC128_MAX;
constexpr static const mmux_standard_flonumd128_t   mmux_libc_minimum_flonumd128=-(mmux_libc_maximum_flonumd128);


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd constants.
 ** ----------------------------------------------------------------- */

/* Inspection of  the header  files in  the libdfp distribution  shows that  only the
   "M_*dl" constants are defined. */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION]]],[[[mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_$2 (void)
{
  return (mmux_standard_flonumd$1_t) M_$2dl;
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTIONS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		E);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		LOG2E);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		LOG10E);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		LN2);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		LN10);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		PI_2);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		PI_4);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		1_PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		2_PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		2_SQRTPI);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		SQRT2);
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTION($1,		SQRT1_2);
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_nan (void)
{
  return nand$1("nan(0)");
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_maximum (void)
{
  return mmux_libc_maximum_flonumd$1;
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_minimum (void)
{
  return mmux_libc_minimum_flonumd$1;
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_positive_infinity (void)
{
  return (mmux_standard_flonumd$1_t)(+ INFINITY);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_negative_infinity (void)
{
  return (mmux_standard_flonumd$1_t)(- INFINITY);
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_CONSTANT_FUNCTIONS(128)

/* end of file */
