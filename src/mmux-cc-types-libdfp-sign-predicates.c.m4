/*
  Part of: MMUX CC Types
  Contents: support for _DecimalN types through libdfp
  Date: Aug 30, 2025

  Abstract

	This module implements sign predicates for _DecimalN types through libdfp.

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
 ** Includes.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-libdfp-internal.h>


/** --------------------------------------------------------------------
 ** Sign predicates: flonumd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_PREDICATES]]],[[[m4_dnl
bool
mmux_standard_flonumd$1_is_zero (mmux_standard_flonumd$1_t op)
{
  return MMUX_STANDARD_FLONUMD$1_IS_ZERO(op)? true : false;
}
bool
mmux_standard_flonumd$1_is_nan (mmux_standard_flonumd$1_t op)
{
  return MMUX_STANDARD_FLONUMD$1_IS_NAN(op)? true : false;
}
bool
mmux_standard_flonumd$1_is_infinite (mmux_standard_flonumd$1_t op)
{
  return MMUX_STANDARD_FLONUMD$1_IS_INFINITE(op)? true : false;
}
bool
mmux_standard_flonumd$1_is_positive (mmux_standard_flonumd$1_t op)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(op)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(op)) {
    if (signbit(op)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < op)? true : false;
  }
}
bool
mmux_standard_flonumd$1_is_negative (mmux_standard_flonumd$1_t op)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(op)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(op)) {
    if (signbit(op)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > op)? true : false;
  }
}
bool
mmux_standard_flonumd$1_is_non_positive (mmux_standard_flonumd$1_t op)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(op)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(op)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > op)? true : false;
  }
}
bool
mmux_standard_flonumd$1_is_non_negative (mmux_standard_flonumd$1_t op)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(op)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(op)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < op)? true : false;
  }
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_PREDICATES(32)
DEFINE_STANDARD_FLONUMD_PREDICATES(64)
DEFINE_STANDARD_FLONUMD_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Sign predicates: flonumcd.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_PREDICATES]]],[[[
bool
mmux_standard_flonumcd$1_is_zero (mmux_standard_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.re) && MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.im))? true : false;
}
bool
mmux_standard_flonumcd$1_is_positive (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
bool
mmux_standard_flonumcd$1_is_negative (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
bool
mmux_standard_flonumcd$1_is_non_positive (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
bool
mmux_standard_flonumcd$1_is_non_negative (mmux_standard_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
bool
mmux_standard_flonumcd$1_is_nan (mmux_standard_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.im))? true : false;
}
bool
mmux_standard_flonumcd$1_is_infinite (mmux_standard_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.im))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_PREDICATES(32)
DEFINE_STANDARD_FLONUMCD_PREDICATES(64)
DEFINE_STANDARD_FLONUMCD_PREDICATES(128)

/* end of file */
