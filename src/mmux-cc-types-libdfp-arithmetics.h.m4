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
 ** Arithmetics: standard flonumd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_add (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return op1 + op2;
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_sub (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return op1 - op2;
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_mul (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (op1 * op2);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_div (mmux_standard_flonumd$1_t op1, mmux_standard_flonumd$1_t op2)
{
  return (op1 / op2);
}

mmux_cc_types_decl mmux_cc_types_binary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_mod
  __attribute__((__const__));

__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_neg (mmux_standard_flonumd$1_t op)
{
  return (- op);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_inv (mmux_standard_flonumd$1_t op)
{
  return (mmux_standard_flonumd$1_constant_one() / op);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_incr (mmux_standard_flonumd$1_t op)
{
  return (op + mmux_standard_flonumd$1_constant_one());
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumd$1_t
mmux_standard_flonumd$1_decr (mmux_standard_flonumd$1_t op)
{
  return (op - mmux_standard_flonumd$1_constant_one());
}

mmux_cc_types_decl mmux_cc_types_unary_operation_standard_flonumd$1_t mmux_standard_flonumd$1_absolute
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_flonumd$1_t mmux_standard_flonumd$1_sign (mmux_standard_flonumd$1_t op)
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(32)
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(64)
DEFINE_STANDARD_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: standard flonumcd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_add (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  auto	Cre = op1.re + op2.re;
  auto	Cim = op1.im + op2.im;
  return mmux_standard_flonumcd$1_rectangular(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_sub (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  auto	Cre = op1.re - op2.re;
  auto	Cim = op1.im - op2.im;
  return mmux_standard_flonumcd$1_rectangular(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_mul (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  auto	Cre = op1.re * op2.re - op1.im * op2.im;
  auto	Cim = op1.re * op2.im + op2.re * op1.im;
  return mmux_standard_flonumcd$1_rectangular(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_div (mmux_standard_flonumcd$1_t op1, mmux_standard_flonumcd$1_t op2)
{
  auto	D   =  op2.re * op2.re + op2.im * op2.im;
  auto	Cre = (op1.re * op2.re + op1.im * op2.im) / D;
  auto	Cim = (op1.im * op2.re - op1.re * op2.im) / D;
  return mmux_standard_flonumcd$1_rectangular(Cre, Cim);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_neg (mmux_standard_flonumcd$1_t op)
{
  return mmux_standard_flonumcd$1_rectangular(- op.re, - op.im);
}
__attribute__((__const__,__always_inline__)) static inline mmux_standard_flonumcd$1_t
mmux_standard_flonumcd$1_inv (mmux_standard_flonumcd$1_t op)
{
  auto	D   = op.re * op.re + op.im * op.im;
  auto	Cre = op.re / D;
  auto	Cim = - (op.im / D);

  return mmux_standard_flonumcd$1_rectangular(Cre, Cim);
}
mmux_cc_types_decl mmux_standard_flonumd$1_t mmux_standard_flonumcd$1_absolute (mmux_standard_flonumcd$1_t op)
  __attribute__((__const__));
]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(32)
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(64)
DEFINE_STANDARD_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: flonumd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_$2(op.value));
}]]])

m4_define([[[DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumd$1_$2 (mmux_flonumd$1_t op1, mmux_flonumd$1_t op2)
{
  return mmux_flonumd$1(mmux_standard_flonumd$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION($1,		add)
DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION($1,		sub)
DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION($1,		mul)
DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION($1,		div)
DEFINE_FLONUMD_ARITHMETICS_BINARY_FUNCTION($1,		mod)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		neg)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		inv)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		incr)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		decr)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		absolute)
DEFINE_FLONUMD_ARITHMETICS_UNARY_FUNCTION($1,		sign)
]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(32)
DEFINE_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(64)
DEFINE_FLONUMD_ARITHMETICS_FUNCTIONS_AND_PROTOS(128)


/** --------------------------------------------------------------------
 ** Arithmetics: flonumcd functions.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMCD_ARITHMETICS_UNARY_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_$2(op.value));
}]]])

m4_define([[[DEFINE_FLONUMCD_ARITHMETICS_BINARY_FUNCTION]]],[[[m4_dnl
__attribute__((__const__,__always_inline__)) static inline mmux_flonumcd$1_t
mmux_flonumcd$1_$2 (mmux_flonumcd$1_t op1, mmux_flonumcd$1_t op2)
{
  return mmux_flonumcd$1(mmux_standard_flonumcd$1_$2(op1.value, op2.value));
}]]])

m4_define([[[DEFINE_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS]]],[[[m4_dnl
DEFINE_FLONUMCD_ARITHMETICS_BINARY_FUNCTION($1,		add)
DEFINE_FLONUMCD_ARITHMETICS_BINARY_FUNCTION($1,		sub)
DEFINE_FLONUMCD_ARITHMETICS_BINARY_FUNCTION($1,		mul)
DEFINE_FLONUMCD_ARITHMETICS_BINARY_FUNCTION($1,		div)
DEFINE_FLONUMCD_ARITHMETICS_UNARY_FUNCTION($1,		neg)
DEFINE_FLONUMCD_ARITHMETICS_UNARY_FUNCTION($1,		inv)
__attribute__((__const__,__always_inline__)) static inline mmux_flonumd$1_t
mmux_flonumcd$1_absolute (mmux_flonumcd$1_t op)
{
  return mmux_flonumd$1(mmux_standard_flonumcd$1_absolute(op.value));
}]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(32)
DEFINE_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(64)
DEFINE_FLONUMCD_ARITHMETICS_FUNCTIONS_AND_PROTOS(128)

/* end of file */
