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

static int
mmux_pointer_bitwise_and_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_and"
{
  mmux_pointer_t	op;
  mmux_uintptr_t	op_uintptr, mask;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_uintptr_parse(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr    = (mmux_uintptr_t)op;
  op_uintptr   &= mask;
  op          = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_and]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_and ROPVAR PTR MASK"]]],
    [[["Perform the bitwise AND operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_or_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_or"
{
  mmux_pointer_t	op;
  mmux_uintptr_t	op_uintptr, mask;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_uintptr_parse(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr    = (mmux_uintptr_t)op;
  op_uintptr   |= mask;
  op          = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_or]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_or ROPVAR PTR MASK"]]],
    [[["Perform the bitwise OR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_xor_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_xor"
{
  mmux_pointer_t	op, mask;
  mmux_uintptr_t	op_uintptr, mask_uintptr;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_pointer_parse(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr    = (mmux_uintptr_t)op;
  mask_uintptr  = (mmux_uintptr_t)mask;
  op_uintptr   ^= mask_uintptr;
  op            = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_xor]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_xor ROPVAR PTR MASK"]]],
    [[["Perform the bitwise XOR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_not_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_not"
{
  mmux_pointer_t	op;
  mmux_uintptr_t	op_uintptr;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr  = (mmux_uintptr_t)op;
  op_uintptr  = ~ op_uintptr;
  op          = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_not]]],
    [[[(3 == argc)]]],
    [[["mmux_pointer_bitwise_not ROPVAR PTR"]]],
    [[["Perform the bitwise NOT operation of the pointer PTR, store the result in PTRVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_shl_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_shl"
{
  mmux_pointer_t	op;
  mmux_uintptr_t	op_uintptr;
  mmux_sint_t	nbits;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_sint_parse(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr   = (mmux_uintptr_t)op;
  op_uintptr <<= nbits;
  op           = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_shl]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_shl ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_shr_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_shr"
{
  mmux_pointer_t	op;
  mmux_uintptr_t	op_uintptr;
  mmux_sint_t	nbits;
  int			rv;

  rv = mmux_pointer_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_sint_parse(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op_uintptr   = (mmux_uintptr_t)op;
  op_uintptr >>= nbits;
  op           = (mmux_pointer_t)op_uintptr;

  return mmux_pointer_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_shr]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_shr ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])


m4_dnl --------------------------------------------------------------------
m4_dnl Core bitwise builtins constructors.
m4_dnl ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN]]],[[[
static int
mmux_$1_bitwise_$3_main (int argc,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_$3"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_$1_parse(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] $4= ops[i];
  }
  return mmux_$1_bind_to_variable (argv[1], ops[2], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_$3]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_bitwise_$3 ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise mmux_toupper($3) between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

m4_dnl ------------------------------------------------------------

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPICAL_SHIFT_CORE_BITWISE_BUILTIN]]],[[[
static int
mmux_$1_bitwise_$3_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_$3"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  mmux_sint_t	nbits;
  int			rv;

  rv = mmux_$1_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_sint_parse(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op $4= nbits;
  return mmux_$1_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_$3]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_bitwise_$3 ROPVAR OP NBITS"]]],
    [[["Compute the bitwise $3 of OP, by NBITS, store the result in ROPVAR."]]])
]]])


/** --------------------------------------------------------------------
 ** Core bitwise builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN]]],[[[
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[and]]],[[[&]]])
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[or]]], [[[|]]])
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BINARY_CORE_BITWISE_BUILTIN([[[$1]]],[[[$2]]],[[[xor]]],[[[^]]])

static int
mmux_$1_bitwise_not_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_not"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	op;
  int			rv;

  rv = mmux_$1_parse(&op, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  op = ~ op;
  return mmux_$1_bind_to_variable (argv[1], op, MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_not]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_bitwise_not ROPVAR OP"]]],
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
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_CORE_BITWISE_BUILTIN([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

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
