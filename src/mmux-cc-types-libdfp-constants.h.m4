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
 ** Mathematics: standard flonumd constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_$2 (void)
{
  return mmux_standard_flonumd$1_literal($3);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO]]],
[[[mmux_cc_types_decl mmux_cc_types_nullary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_constant_$2
  __attribute__((__const__))]]])

m4_define([[[DEFINE_STANDARD_FLONUMD_CONSTANTS]]],[[[
DEFINE_STANDARD_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	zero,	0.0)
DEFINE_STANDARD_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	one,	1.0)
DEFINE_STANDARD_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	two,	2.0)
DEFINE_STANDARD_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	ten,	10.0)

__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_one_half (void)
{
  /* FIXME There probably  is a better way  to compute this constant.  Or  the use of
     this constant.  (Marco Maggi; Sep 1, 2025) */
  return (mmux_standard_flonumd$1_t)(mmux_standard_flonumd$1_literal(1.0) / mmux_standard_flonumd$1_literal(2.0));
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_constant_one_third (void)
{
  /* FIXME There probably  is a better way  to compute this constant.  Or  the use of
     this constant.  (Marco Maggi; Sep 1, 2025) */
  return (mmux_standard_flonumd$1_t)(mmux_standard_flonumd$1_literal(1.0) / mmux_standard_flonumd$1_literal(3.0));
}

DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		nan);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		E);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		LOG2E);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		LOG10E);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		LN2);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		LN10);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		PI_2);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		PI_4);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		1_PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		2_PI);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		2_SQRTPI);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		SQRT2);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		SQRT1_2);

DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		minimum);
DEFINE_STANDARD_FLONUMD_CONSTANT_PROTO($1,		maximum);
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_CONSTANTS(32)
DEFINE_STANDARD_FLONUMD_CONSTANTS(64)
DEFINE_STANDARD_FLONUMD_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematics: standard flonumcd constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION]]],
[[[__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_constant_$2 (void)
{
  return (mmux_standard_flonumcd$1_t) {
    .re = mmux_standard_flonumd$1_constant_$2(),
    .im = mmux_standard_flonumd$1_constant_zero(),
  };
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMCD_CONSTANTS]]],[[[m4_dnl
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_STANDARD_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one_third)

__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_constant_imag (void)
{
  return (mmux_standard_flonumcd$1_t) {
    .re = mmux_standard_flonumd$1_constant_zero(),
    .im = mmux_standard_flonumd$1_constant_one(),
  };
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_constant_nan (void)
{
  return (mmux_standard_flonumcd$1_t) {
    .re = mmux_standard_flonumd$1_constant_nan(),
    .im = mmux_standard_flonumd$1_constant_nan(),
  };
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_CONSTANTS(32)
DEFINE_STANDARD_FLONUMCD_CONSTANTS(64)
DEFINE_STANDARD_FLONUMCD_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematics: flonumd constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_constant_$2 (void)
{
  return (mmux_flonumd$1_t) { .value = mmux_standard_flonumd$1_constant_$2() };
}]]])

m4_define([[[DEFINE_FLONUMD_CONSTANTS]]],[[[m4_dnl
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	one_third)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	maximum)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	minimum)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	nan)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	E)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	LOG2E)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	LOG10E)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	LN2)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	LN10)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	PI)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	PI_2)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	PI_4)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	1_PI)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	2_PI)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	2_SQRTPI)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	SQRT2)
DEFINE_FLONUMD_CONSTANT_INLINE_FUNCTION($1,	SQRT1_2)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_CONSTANTS(32)
DEFINE_FLONUMD_CONSTANTS(64)
DEFINE_FLONUMD_CONSTANTS(128)


/** --------------------------------------------------------------------
 ** Mathematics: flonumcd constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_constant_$2 (void)
{
  /* FIXME   Why    GCC   tells   me   to    put   braces   around   the    call   to
     "mmux_standard_flonumd$1_constant_$2()" ?  (Marco Maggi; Sep 1, 2025) */
  return (mmux_flonumcd$1_t) { .value = { mmux_standard_flonumd$1_constant_$2() } };
}]]])

m4_define([[[DEFINE_FLONUMCD_CONSTANTS]]],[[[m4_dnl
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	nan)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_FLONUMCD_CONSTANT_INLINE_FUNCTION($1,	one_third)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_CONSTANTS(32)
DEFINE_FLONUMCD_CONSTANTS(64)
DEFINE_FLONUMCD_CONSTANTS(128)

/* end of file */
