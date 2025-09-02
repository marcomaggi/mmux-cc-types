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
 ** Real decimal floating-point number predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_PREDICATES]]],[[[
__attribute__((__const__)) bool
mmux_flonumd$1_is_zero (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_nan (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_infinite (mmux_flonumd$1_t X)
{
  return MMUX_STANDARD_FLONUMD$1_IS_INFINITE(X.value)? true : false;
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    if (signbit(X.value)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_positive (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() > X.value)? true : false;
  }
}
__attribute__((__const__)) bool
mmux_flonumd$1_is_non_negative (mmux_flonumd$1_t X)
{
  if (MMUX_STANDARD_FLONUMD$1_IS_NAN(X.value)) {
    return false;
  } else if (MMUX_STANDARD_FLONUMD$1_IS_ZERO(X.value)) {
    return true;
  } else {
    return (mmux_standard_flonumd$1_constant_zero() < X.value)? true : false;
  }
}
]]])
m4_divert(0)m4_dnl
DEFINE_REAL_PREDICATES(32)
DEFINE_REAL_PREDICATES(64)
DEFINE_REAL_PREDICATES(128)


/** --------------------------------------------------------------------
 ** Complex decimal floating-point numbers predicates.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_CPLX_PREDICATES]]],[[[
__attribute__((__const__)) bool
mmux_flonumcd$1_is_zero (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.re) && MMUX_STANDARD_FLONUMD$1_IS_ZERO(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_positive (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_non_negative (mmux_flonumcd$1_t Z __attribute__((__unused__)))
{
  return false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_nan (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_NAN(Z.value.im))? true : false;
}
__attribute__((__const__)) bool
mmux_flonumcd$1_is_infinite (mmux_flonumcd$1_t Z)
{
  return (MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.re) ||
	  MMUX_STANDARD_FLONUMD$1_IS_INFINITE(Z.value.im))? true : false;
}
]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_PREDICATES(32)
DEFINE_CPLX_PREDICATES(64)
DEFINE_CPLX_PREDICATES(128)

/* end of file */
