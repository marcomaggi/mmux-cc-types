/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep  2, 2025

  Abstract

	This  module implements  complex  numbers functions  for  the standard  types
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
 ** Complex numbers functions: standard flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_real_part (mmux_standard_flonumd$1_t op)
{
  return op;
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_imag_part (mmux_standard_flonumd$1_t op MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_flonumd$1_constant_zero();
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_argument (mmux_standard_flonumd$1_t op  MMUX_CC_TYPES_UNUSED)
{
  return mmux_standard_flonumd$1_constant_zero();
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_conjugate (mmux_standard_flonumd$1_t op)
{
  return op;
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_COMPLEX_INLINE_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_COMPLEX_INLINE_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_COMPLEX_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Complex numbers functions: flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMD_COMPLEX_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumd$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_real_part (mmux_flonumd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_real_part(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_imag_part (mmux_flonumd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_imag_part(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_argument (mmux_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_argument(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_conjugate (mmux_flonumd$1_t op __attribute__((__unused__)))
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_conjugate(op.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_COMPLEX_INLINE_FUNCTIONS(32)
DEFINE_FLONUMD_COMPLEX_INLINE_FUNCTIONS(64)
DEFINE_FLONUMD_COMPLEX_INLINE_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Complex numbers functions: standard flonumcd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumcd$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumcd$1_real_part (mmux_standard_flonumcd$1_t op)
{
  return op.re;
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumcd$1_imag_part (mmux_standard_flonumcd$1_t op)
{
  return op.im;
}
mmux_cc_types_decl mmux_standard_flonumd$1_t mmux_standard_flonumcd$1_argument (mmux_standard_flonumcd$1_t op)
  __attribute__((__const__));
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_conjugate (mmux_standard_flonumcd$1_t op)
{
  return (mmux_standard_flonumcd$1_t) { .re = op.re , .im = - op.im };
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(32)
DEFINE_STANDARD_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(64)
DEFINE_STANDARD_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(128)


/** --------------------------------------------------------------------
 ** Complex numbers functions: flonumcd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumcd$1]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumcd$1_real_part (mmux_flonumcd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumcd$1_real_part(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumcd$1_imag_part (mmux_flonumcd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumcd$1_imag_part(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumcd$1_argument (mmux_flonumcd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumcd$1_argument(op.value));
}
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_conjugate (mmux_flonumcd$1_t op)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_conjugate(op.value));
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(32)
DEFINE_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(64)
DEFINE_FLONUMCD_COMPLEX_INLINE_FUNCTIONS_AND_PROTOS(128)

/* end of file */
