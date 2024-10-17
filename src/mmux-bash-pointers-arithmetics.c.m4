/*
  Part of: MMUX Bash Pointers
  Contents: implementation of arithmetics builtins
  Date: Sep 19, 2024

  Abstract

	This module implements arithmetics builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

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

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Pointer arithmetics builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_add]]])
{
  mmux_pointer_t	op;
  mmux_ptrdiff_t	delta;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_PTRDIFF(delta,	argv[3]);
  {
    mmux_uint8_t *	op_octets  = (mmux_uint8_t *)op;
    mmux_uint8_t *	rop_octets = op_octets + delta;
    return mmux_pointer_bind_to_variable(argv[1], rop_octets, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR DELTA"]]],
    [[["Increment the pointer PTR by the signed integer DELTA, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Core arithmetics builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_ARITHMETICS_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_add]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_add(ops[2], ops[i]);
  }
  return mmux_$1_bind_to_variable(argv[1], ops[2], MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP ..."]]],
    [[["Compute the addition between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_sub]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_sub(ops[2], ops[i]);
  }
  return mmux_$1_bind_to_variable(argv[1], ops[2], MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP ..."]]],
    [[["Compute the subtraction between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_mul]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_mul(ops[2], ops[i]);
  }
  return mmux_$1_bind_to_variable(argv[1], ops[2], MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP ..."]]],
    [[["Compute the multiplication between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_div]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_div(ops[2], ops[i]);
  }
  return mmux_$1_bind_to_variable(argv[1], ops[2], MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP ..."]]],
    [[["Compute the division between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_neg]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  op = mmux_$1_neg(op);
  return mmux_$1_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
    [[["Compute the negation of the operand OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_inv]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  op = mmux_$1_inv(op);
  return mmux_$1_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
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
DEFINE_CORE_ARITHMETICS_BUILTIN([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[double]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexld]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_CORE_ARITHMETICS_BUILTIN([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

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

m4_define([[[DEFINE_FOR_INTEGERS_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_mod]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op1, argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op2, argv[3]);
  {
    op1 = mmux_$1_mod(op1, op2);
    return mmux_$1_bind_to_variable(argv[1], op1, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP"]]],
    [[["Compute the remainder between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_incr]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  {
    op = mmux_$1_incr(op);
    return mmux_$1_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
    [[["Increment by one the value OP, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_decr]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  {
    op = mmux_$1_decr(op);
    return mmux_$1_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
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
DEFINE_FOR_INTEGERS_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_FOR_INTEGERS_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

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
