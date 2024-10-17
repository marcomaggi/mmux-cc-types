/*
  Part of: MMUX Bash Pointers
  Contents: implementation of bitwise builtins
  Date: Sep 19, 2024

  Abstract

	This module implements bitwise builtins.

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
 ** Pointer bitwise operations.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_and]]])
{
  mmux_pointer_t	op;
  mmux_uintptr_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINTPTR(mask,	argv[3]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr  = (mmux_uintptr_t)op;
    op_uintptr &= mask;
    op          = (mmux_pointer_t)op_uintptr;
    return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR MASK"]]],
    [[["Perform the bitwise AND operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_or]]])
{
  mmux_pointer_t	op;
  mmux_uintptr_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINTPTR(mask,	argv[3]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr  = (mmux_uintptr_t)op;
    op_uintptr |= mask;
    op          = (mmux_pointer_t)op_uintptr;
    return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR MASK"]]],
    [[["Perform the bitwise OR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_xor]]])
{
  mmux_pointer_t	op;
  mmux_uintptr_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINTPTR(mask,	argv[3]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr  = (mmux_uintptr_t)op;
    op_uintptr ^= mask;
    op          = (mmux_pointer_t)op_uintptr;

    return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR MASK"]]],
    [[["Perform the bitwise XOR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_not]]])
{
  mmux_pointer_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr = (mmux_uintptr_t)op;
    op_uintptr = ~ op_uintptr;
    op         = (mmux_pointer_t)op_uintptr;
    return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR"]]],
    [[["Perform the bitwise NOT operation of the pointer PTR, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_shl]]])
{
  mmux_pointer_t	op;
  mmux_sint_t		nbits;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(nbits,	argv[3]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr   = (mmux_uintptr_t)op;
    op_uintptr <<= nbits;
    op           = (mmux_pointer_t)op_uintptr;
    return mmux_pointer_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_shr]]])
{
  mmux_pointer_t	op;
  mmux_sint_t		nbits;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(op,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(nbits,	argv[3]);
  {
    mmux_uintptr_t	op_uintptr;

    op_uintptr   = (mmux_uintptr_t)op;
    op_uintptr >>= nbits;
    op           = (mmux_pointer_t)op_uintptr;
    return mmux_pointer_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])


m4_dnl --------------------------------------------------------------------
m4_dnl Core bitwise builtins constructors.
m4_dnl ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_$3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] $4= ops[i];
  }
  return mmux_$1_bind_to_variable (argv[1], ops[2], MMUX_BUILTIN_NAME_STR);
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
    [[["Compute the bitwise MMUX_M4_TOUPPER($3) between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

m4_dnl ------------------------------------------------------------

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_$3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  mmux_sint_t	nbits;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(nbits,  argv[3]);
  {
    op $4= nbits;
    return mmux_$1_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME_STR);
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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP NBITS"]]],
    [[["Compute the bitwise $3 of OP, by NBITS, store the result in ROPVAR."]]])
]]])


/** --------------------------------------------------------------------
 ** Core bitwise builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN]]],[[[
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[and]]],[[[&]]])
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[or]]], [[[|]]])
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[xor]]],[[[^]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_not]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  {
    op = ~ op;
    return mmux_$1_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME_STR);
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
    [[["Compute the bitwise NOT between of the opernot OP, which must be of type \"$1\", store the result in ROPVAR."]]])

MMUX_BASH_POINTERS_DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[shl]]],[[[<<]]])
MMUX_BASH_POINTERS_DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[shr]]],[[[>>]]])
]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ssize]]])

MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uintptr]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[off]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[wint]]])

/* end of file */
