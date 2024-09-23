/*
  Part of: MMUX Bash Pointers
  Contents: implementation of bitwise builtins
  Date: Sep 19, 2024

  Abstract

	This module implements bitwise builtins.

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
 ** Helpers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_VALUE_STORER]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
static int
store_$1_result (char const * variable_name, mmux_libc_$1_t value)
{
  int		rv, required_nbytes;

  required_nbytes = mmux_bash_pointers_sprint_size_$1(value);
  if (0 > required_nbytes) {
    return EXECUTION_FAILURE;
  } else {
    char		str[required_nbytes];

    rv = mmux_bash_pointers_sprint_$1(str, required_nbytes, value);
    if (EXECUTION_SUCCESS == rv) {
      SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
      v = bind_variable(variable_name, str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
]]])]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[pointer]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[schar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sshort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ushort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[slong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ulong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint64]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[usize]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ssize]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ptrdiff]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[mode]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[off]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[pid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[gid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wint]]])


/** --------------------------------------------------------------------
 ** Bitwise AND builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN]]],[[[
static int
mmux_$1_bitwise_and_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_and"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] &= ops[i];
  }
  return store_$1_result (argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_and]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_bitwise_and ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise AND between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_and_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_and"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr, mask;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_uintptr(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr    = (mmux_libc_uintptr_t)op;
  op_uintptr   &= mask;
  op          = (mmux_libc_pointer_t)op_uintptr;

  return store_pointer_result(argv[1], op);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_and]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_and ROPVAR PTR MASK"]]],
    [[["Perform the bitwise AND operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise OR builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN]]],[[[
static int
mmux_$1_bitwise_or_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_or"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] |= ops[i];
  }
  return store_$1_result (argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_or]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_bitwise_or ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise OR between the operors OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_or_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_or"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr, mask;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_uintptr(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr    = (mmux_libc_uintptr_t)op;
  op_uintptr   |= mask;
  op          = (mmux_libc_pointer_t)op_uintptr;

  {
    int		required_nbytes;

    required_nbytes = mmux_bash_pointers_sprint_size_pointer(op);
    if (0 > required_nbytes) {
      return EXECUTION_FAILURE;
    } else {
      char		str[required_nbytes];

      rv = mmux_bash_pointers_sprint_pointer(str, required_nbytes, op);
      if (EXECUTION_SUCCESS == rv) {
	SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
	v = bind_variable(argv[1], str, 0);
      } else {
	return rv;
      }
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_or]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_or ROPVAR PTR MASK"]]],
    [[["Perform the bitwise OR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise XOR builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN]]],[[[
static int
mmux_$1_bitwise_xor_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_xor"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] ^= ops[i];
  }
  return store_$1_result (argv[1], ops[2]);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_xor]]],
    [[[(3 <= argc)]]],
    [[["mmux_$1_bitwise_xor ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise XOR between the operxors OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_xor_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_xor"
{
  mmux_libc_pointer_t	op, mask;
  mmux_libc_uintptr_t	op_uintptr, mask_uintptr;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_pointer(&mask, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr    = (mmux_libc_uintptr_t)op;
  mask_uintptr  = (mmux_libc_uintptr_t)mask;
  op_uintptr   ^= mask_uintptr;
  op            = (mmux_libc_pointer_t)op_uintptr;

  return store_pointer_result(argv[1], op);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_xor]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_xor ROPVAR PTR MASK"]]],
    [[["Perform the bitwise XOR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise NOT builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN]]],[[[
static int
mmux_$1_bitwise_not_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_not"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op = ~ op;
  return store_$1_result (argv[1], op);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_not]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_bitwise_not ROPVAR OP"]]],
    [[["Compute the bitwise NOT between of the opernot OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_not_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_not"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr  = (mmux_libc_uintptr_t)op;
  op_uintptr  = ~ op_uintptr;
  op          = (mmux_libc_pointer_t)op_uintptr;

  return store_pointer_result(argv[1], op);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_not]]],
    [[[(3 == argc)]]],
    [[["mmux_pointer_bitwise_not ROPVAR PTR"]]],
    [[["Perform the bitwise NOT operation of the pointer PTR, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise shl builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN]]],[[[
static int
mmux_$1_bitwise_shl_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_shl"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op <<= nbits;
  return store_$1_result (argv[1], op);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_shl]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_bitwise_shl ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_shl_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_shl"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr   = (mmux_libc_uintptr_t)op;
  op_uintptr <<= nbits;
  op           = (mmux_libc_pointer_t)op_uintptr;

  return store_pointer_result (argv[1], op);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_shl]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_shl ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise shr builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN]]],[[[
static int
mmux_$1_bitwise_shr_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_bitwise_shr"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op >>= nbits;
  return store_$1_result(argv[1], op);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_bitwise_shr]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_bitwise_shr ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

static int
mmux_pointer_bitwise_shr_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_pointer_bitwise_shr"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr   = (mmux_libc_uintptr_t)op;
  op_uintptr >>= nbits;
  op           = (mmux_libc_pointer_t)op_uintptr;

  return store_pointer_result(argv[1], op);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_bitwise_shr]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_bitwise_shr ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])

/* end of file */
