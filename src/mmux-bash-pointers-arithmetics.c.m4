/*
  Part of: MMUX Bash Pointers
  Contents: implementation of arithmetics builtins
  Date: Sep 19, 2024

  Abstract

	This module implements arithmetics builtins.

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


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Core arithmetics functions.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_ARITHMETICS_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  return A + B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  return A - B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  return A * B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  return A / B;
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  return (- A);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  return (((mmux_$1_t)1) / A);
}
]]])]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[schar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uchar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sshort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ushort]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[slong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ulong]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ullong]]],		[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[double]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32]]],	[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64]]],	[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128]]],	[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float32x]]],	[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float64x]]],	[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[decimal128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexd]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64X]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128X]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint8]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint16]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint32]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sint64]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uint64]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[usize]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ssize]]])

DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sintmax]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uintmax]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[sintptr]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uintptr]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[ptrdiff]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[mode]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[off]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[pid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[uid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[gid]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[wchar]]])
DEFINE_CORE_ARITHMETICS_FUNCTIONS([[[wint]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_add (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = Are + Bre;
  mmux_$1_part_t	Cim = Aim + Bim;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_sub (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = Are - Bre;
  mmux_$1_part_t	Cim = Aim - Bim;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_mul (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	Cre = (Are * Bre - Aim * Bim);
  mmux_$1_part_t	Cim = (Are * Bim + Bre * Aim);

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_div (mmux_$1_t A, mmux_$1_t B)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	Bre = mmux_$1_real_part (B);
  mmux_$1_part_t	Bim = mmux_$1_imag_part (B);
  mmux_$1_part_t	D   = Bre * Bre + Bim * Bim;
  mmux_$1_part_t	Cre = (Are * Bre + Aim * Bim) / D;
  mmux_$1_part_t	Cim = (Aim * Bre - Are * Bim) / D;

  return mmux_$1_make_rectangular (Cre, Cim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_neg (mmux_$1_t A)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);

  return mmux_$1_make_rectangular (-Are, -Aim);
}
__attribute__((__const__)) static inline mmux_$1_t
mmux_$1_inv (mmux_$1_t A)
{
  mmux_$1_part_t	Are = mmux_$1_real_part (A);
  mmux_$1_part_t	Aim = mmux_$1_imag_part (A);
  mmux_$1_part_t	D   = Are * Are + Aim * Aim;
  mmux_$1_part_t	Cre = + Are / D;
  mmux_$1_part_t	Cim = - Aim / D;

  return mmux_$1_make_rectangular (Cre, Cim);
}
]]])]]])

DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_CORE_COMPLEXD_ARITHMETICS_FUNCTIONS([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Pointer arithmetics builtins.
 ** ----------------------------------------------------------------- */

static int
mmux_pointer_add_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_add"
{
  mmux_pointer_t	op;
  mmux_uint8_t *	op_octets;
  mmux_uint8_t *	rop_octets;
  mmux_ptrdiff_t	delta;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&delta, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_octets  = (mmux_uint8_t *)op;
  rop_octets = op_octets + delta;
  return mmux_bash_pointers_bind_to_variable_pointer(argv[1], rop_octets, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_add]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_add ROPVAR PTR DELTA"]]],
    [[["Increment the pointer PTR by the signed integer DELTA, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Core arithmetics builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_ARITHMETICS_BUILTIN]]],[[[
static int
mmux_$1_add_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_add"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_add(ops[2], ops[i]);
  }

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], ops[2], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_add]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_add ROPVAR OP0 OP ..."]]],
    [[["Compute the addition between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_sub_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_sub"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_sub(ops[2], ops[i]);
  }

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], ops[2], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_sub]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_sub ROPVAR OP0 OP ..."]]],
    [[["Compute the subtraction between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_mul_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_mul"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_mul(ops[2], ops[i]);
  }

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], ops[2], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_mul]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_mul ROPVAR OP0 OP ..."]]],
    [[["Compute the multiplication between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_div_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_div"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_div(ops[2], ops[i]);
  }

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], ops[2], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_div]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_div ROPVAR OP0 OP ..."]]],
    [[["Compute the division between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_neg_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_neg"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op = mmux_$1_neg(op);

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], op, MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_neg]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_neg ROPVAR OP"]]],
    [[["Compute the negation of the operand OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_inv_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_inv"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op = mmux_$1_inv(op);

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], op, MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_inv]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_inv ROPVAR OP"]]],
    [[["Compute the iverse of the operand OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_CORE_ARITHMETICS_BUILTIN([[[schar]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uchar]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sshort]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ushort]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[slong]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ulong]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ullong]]],		[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[double]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float32]]],		[[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float64]]],		[[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float128]]],		[[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float32x]]],		[[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float64x]]],		[[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float128x]]],	[[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal32]]],	[[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal64]]],	[[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal128]]],	[[[MMUX_HAVE_TYPE_DECIMAL128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf32]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf64]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf128]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf32x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF32X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf64x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF64X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf128x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128X]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint8]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint8]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint16]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint16]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint64]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[usize]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ssize]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[sintmax]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uintmax]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sintptr]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uintptr]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ptrdiff]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[mode]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[off]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[pid]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[uid]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[gid]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[wchar]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Remainder builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FOR_INTEGERS_BUILTIN]]],[[[
static int
mmux_$1_mod_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_mod"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op1, op2;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op1, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  rv = mmux_bash_pointers_parse_$1(&op2, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  op1 = op1 % op2;

  return mmux_bash_pointers_bind_to_variable_$1(argv[1], op1, MMUX_BUILTIN_NAME);

error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_mod]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_mod ROPVAR OP0 OP"]]],
    [[["Compute the remainder between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_incr_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_incr"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  ++op;
  return mmux_bash_pointers_bind_to_variable_$1(argv[1], op, MMUX_BUILTIN_NAME);

error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_incr]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_incr ROPVAR OP"]]],
    [[["Increment by one the value OP, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_decr_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_decr"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  --op;
  return mmux_bash_pointers_bind_to_variable_$1(argv[1], op, MMUX_BUILTIN_NAME);

error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_decr]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_decr ROPVAR OP"]]],
    [[["Decrement by one the value OP, store the result in ROPVAR."]]])

]]])

DEFINE_FOR_INTEGERS_BUILTIN([[[schar]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uchar]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sshort]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ushort]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sint]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uint]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[slong]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ulong]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

DEFINE_FOR_INTEGERS_BUILTIN([[[sint8]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uint8]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sint16]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uint16]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sint32]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uint32]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sint64]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uint64]]])

DEFINE_FOR_INTEGERS_BUILTIN([[[usize]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ssize]]])

DEFINE_FOR_INTEGERS_BUILTIN([[[sintmax]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uintmax]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[sintptr]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uintptr]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ptrdiff]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[mode]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[off]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[pid]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[uid]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[gid]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[wchar]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[wint]]])

/* end of file */
