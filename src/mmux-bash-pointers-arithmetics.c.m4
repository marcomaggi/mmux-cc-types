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
 ** Pointer arithmetics builtins.
 ** ----------------------------------------------------------------- */

static int
mmux_pointer_add_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_add"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uint8_t *	op_octets;
  mmux_libc_uint8_t *	rop_octets;
  mmux_libc_ptrdiff_t	delta;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&delta, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_octets  = (mmux_libc_uint8_t *)op;
  rop_octets = op_octets + delta;
  return mmux_bash_pointers_store_result_in_variable_pointer(argv[1], rop_octets);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_add]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_add ROPVAR PTR DELTA"]]],
    [[["Increment the pointer PTR by the signed integer DELTA, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Core arithmetics builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN]]],[[[
static int
mmux_$1_add_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_add"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] += ops[i];
  }

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_add]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_add ROPVAR OP0 OP ..."]]],
    [[["Compute the addition between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_sub_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_sub"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] -= ops[i];
  }

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_sub]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_sub ROPVAR OP0 OP ..."]]],
    [[["Compute the subtraction between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_mul_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_mul"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] *= ops[i];
  }

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_mul]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_mul ROPVAR OP0 OP ..."]]],
    [[["Compute the multiplication between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_div_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_div"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] /= ops[i];
  }

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_div]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_div ROPVAR OP0 OP ..."]]],
    [[["Compute the division between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_neg_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_neg"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op = -op;

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], op);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_neg]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_neg ROPVAR OP"]]],
    [[["Compute the negation of the operand OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_inv_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_inv"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op = 1 / op;

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], op);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_inv]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_inv ROPVAR OP"]]],
    [[["Compute the iverse of the operand OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[float]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[double]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ssize]]])

MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uintptr]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[off]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_ARITHMETICS_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Remainder builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN]]],[[[
static int
mmux_$1_mod_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_mod"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op1, op2;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op1, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_bash_pointers_parse_$1(&op2, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op1 = op1 % op2;

  return mmux_bash_pointers_store_result_in_variable_$1(argv[1], op1);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_mod]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_mod ROPVAR OP0 OP"]]],
    [[["Compute the remainder between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[ssize]]])

MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uintptr]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[off]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_REMAINDER_BUILTIN([[[wint]]])

/* end of file */
