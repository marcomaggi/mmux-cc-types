/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Sep  2, 2025

  Abstract

	This    module    implements    arithmetics   for    the    standard    types
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
 ** Arithmetics: standard flonumd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS]]],[[[
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_absolute (mmux_standard_flonumd$1_t op)
{
  return fabsd$1(op);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_modulo (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return fmodd$1(op1, op2);
}
mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_remainder (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return remainderd$1(op1, op2);
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: standard flonumcd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS]]],[[[
mmux_standard_flonumd$1_t
mmux_standard_flonumcd$1_absolute (mmux_standard_flonumcd$1_t op)
{
  return sqrtd$1( op.re * op.re + op.im * op.im );
}]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS(32)
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS(64)
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS(128)

/* end of file */
