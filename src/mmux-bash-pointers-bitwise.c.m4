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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINTPTR(mask,	3);
  {
    op = mmux_pointer_bitwise_and(op, mask);
    return mmux_pointer_bind_to_bash_variable(argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINTPTR(mask,	3);
  {
    op = mmux_pointer_bitwise_or(op, mask);
    return mmux_pointer_bind_to_bash_variable(argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINTPTR(mask,	3);
  {
    op = mmux_pointer_bitwise_xor(op, mask);
    return mmux_pointer_bind_to_bash_variable(argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR PTR MASK"]]],
    [[["Perform the bitwise XOR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_bitwise_not]]])
{
  mmux_pointer_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  {
    op = mmux_pointer_bitwise_not(op);
    return mmux_pointer_bind_to_bash_variable(argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(nbits,	3);
  {
    op = mmux_pointer_bitwise_shl(op, nbits);
    return mmux_pointer_bind_to_bash_variable (argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(nbits,	3);
  {
    op = mmux_pointer_bitwise_shr(op, nbits);
    return mmux_pointer_bind_to_bash_variable (argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])


m4_dnl --------------------------------------------------------------------
m4_dnl Core bitwise builtins constructors.
m4_dnl ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_$3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */

  for (int i = 2; i < argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, ops[i], argv[i]);
  }
  for (int i = 3; i < argc; ++i) {
    ops[2] = mmux_$1_bitwise_$3(ops[2], ops[i]);
  }
  return mmux_$1_bind_to_bash_variable (argv[1], ops[2], MMUX_BASH_BUILTIN_STRING_NAME);
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 <= argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise MMUX_M4_TOUPPER($3) between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

m4_dnl ------------------------------------------------------------

m4_define([[[DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_$3]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  mmux_sint_t	nbits;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM($1, op,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(nbits,	3);
  {
    op = mmux_$1_bitwise_$3(op, nbits);
    return mmux_$1_bind_to_bash_variable (argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
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

m4_define([[[DEFINE_CORE_BITWISE_BUILTIN]]],[[[
DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[and]]])
DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[or]]])
DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[xor]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_bitwise_not]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_STEM($1, op, argv[2]);
  {
    op = mmux_$1_bitwise_not(op);
    return mmux_$1_bind_to_bash_variable (argv[1], op, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
    [[["Compute the bitwise NOT between of the opernot OP, which must be of type \"$1\", store the result in ROPVAR."]]])

DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[shl]]])
DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[shr]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_CORE_BITWISE_BUILTIN([[[schar]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uchar]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sshort]]])
DEFINE_CORE_BITWISE_BUILTIN([[[ushort]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sint]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uint]]])
DEFINE_CORE_BITWISE_BUILTIN([[[slong]]])
DEFINE_CORE_BITWISE_BUILTIN([[[ulong]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_CORE_BITWISE_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_CORE_BITWISE_BUILTIN([[[sint8]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uint8]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sint16]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uint16]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sint32]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uint32]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sint64]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uint64]]])

DEFINE_CORE_BITWISE_BUILTIN([[[ssize]]])
DEFINE_CORE_BITWISE_BUILTIN([[[usize]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sintmax]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uintmax]]])
DEFINE_CORE_BITWISE_BUILTIN([[[sintptr]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uintptr]]])
DEFINE_CORE_BITWISE_BUILTIN([[[ptrdiff]]])
DEFINE_CORE_BITWISE_BUILTIN([[[mode]]])
DEFINE_CORE_BITWISE_BUILTIN([[[off]]])
DEFINE_CORE_BITWISE_BUILTIN([[[pid]]])
DEFINE_CORE_BITWISE_BUILTIN([[[uid]]])
DEFINE_CORE_BITWISE_BUILTIN([[[gid]]])
DEFINE_CORE_BITWISE_BUILTIN([[[wchar]]])
DEFINE_CORE_BITWISE_BUILTIN([[[wint]]])
DEFINE_CORE_BITWISE_BUILTIN([[[time]]])
DEFINE_CORE_BITWISE_BUILTIN([[[socklen]]])

/* end of file */
