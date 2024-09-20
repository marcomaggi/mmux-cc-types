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
 ** Bitwise AND builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_and_$1_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-and-$1"
{
#if ($2)
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] &= ops[i];
  }

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,ops[2]);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_and_$1]]],
    [[[(3 <= argc)]]],
    [[["bitwise-and-$1 ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise AND between the operands OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sshort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ushort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sint64]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uint64]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[sintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[off]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[pid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[uid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[gid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_AND_BUILTIN([[[wint]]],		[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_and_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-and-pointer"
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

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_and_pointer]]],
    [[[(4 == argc)]]],
    [[["bitwise-and-pointer ROPVAR PTR MASK"]]],
    [[["Perform the bitwise AND operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise OR builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_or_$1_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-or-$1"
{
#if ($2)
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] |= ops[i];
  }

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,ops[2]);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_or_$1]]],
    [[[(3 <= argc)]]],
    [[["bitwise-or-$1 ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise OR between the operors OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sshort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ushort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sint64]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uint64]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[sintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[mode]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[off]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[pid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[uid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[gid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_OR_BUILTIN([[[wint]]],			[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_or_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-or-pointer"
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
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_or_pointer]]],
    [[[(4 == argc)]]],
    [[["bitwise-or-pointer ROPVAR PTR MASK"]]],
    [[["Perform the bitwise OR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise XOR builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_xor_$1_main (int argc,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-xor-$1"
{
#if ($2)
  mmux_libc_$1_t	ops[argc]; /* we allocate two more of these, not a problem */
  int			rv;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_pointers_parse_$1(&ops[i], argv[i], MMUX_BUILTIN_NAME);
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] ^= ops[i];
  }

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,ops[2]);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_xor_$1]]],
    [[[(3 <= argc)]]],
    [[["bitwise-xor-$1 ROPVAR OP0 OP ..."]]],
    [[["Compute the bitwise XOR between the operxors OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sshort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ushort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sint64]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uint64]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[sintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[off]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[pid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[uid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[gid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_XOR_BUILTIN([[[wint]]],		[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_xor_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-xor-pointer"
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

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_xor_pointer]]],
    [[[(4 == argc)]]],
    [[["bitwise-xor-pointer ROPVAR PTR MASK"]]],
    [[["Perform the bitwise XOR operation between the pointer PTR by the unsigned integer MASK, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise NOT builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_not_$1_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-not-$1"
{
#if ($2)
  mmux_libc_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op = ~ op;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_not_$1]]],
    [[[(3 == argc)]]],
    [[["bitwise-not-$1 ROPVAR OP"]]],
    [[["Compute the bitwise NOT between of the opernot OP, which must be of type \"$1\", store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[schar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sshort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ushort]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[slong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ulong]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint8]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint16]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint32]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sint64]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uint64]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[usize]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ssize]]],		[[[1]]])

MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uintmax]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[sintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uintptr]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[off]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[pid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[uid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[gid]]],			[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[wchar]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_NOT_BUILTIN([[[wint]]],		[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_not_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-not-pointer"
{
  mmux_libc_pointer_t	op;
  mmux_libc_uintptr_t	op_uintptr;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_uintptr  = (mmux_libc_uintptr_t)op;
  op_uintptr  = ~ op_uintptr;
  op          = (mmux_libc_pointer_t)op_uintptr;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_not_pointer]]],
    [[[(3 == argc)]]],
    [[["bitwise-not-pointer ROPVAR PTR"]]],
    [[["Perform the bitwise NOT operation of the pointer PTR, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise shl builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_shl_$1_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-shl-$1"
{
#if ($2)
  mmux_libc_$1_t	op;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op <<= nbits;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_shl_$1]]],
    [[[(4 == argc)]]],
    [[["bitwise-shl-$1 ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[schar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uchar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sshort]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ushort]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[slong]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ulong]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint8]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint8]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint16]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint16]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint32]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint32]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sint64]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uint64]]],	[[[1]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[usize]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ssize]]],	[[[1]]])

MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[sintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[off]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[pid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[uid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[gid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[wchar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHL_BUILTIN([[[wint]]],		[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_shl_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-shl-pointer"
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

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_shl_pointer]]],
    [[[(4 == argc)]]],
    [[["bitwise-shl-pointer ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shl of OP, by NBITS, store the result in ROPVAR."]]])


/** --------------------------------------------------------------------
 ** Bitwise shr builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN]]],[[[
static int
mmux_bash_pointers_bitwise_shr_$1_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-shr-$1"
{
#if ($2)
  mmux_libc_$1_t	op;
  mmux_libc_sint_t	nbits;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_sint(&nbits, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op >>= nbits;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: accessor \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_shr_$1]]],
    [[[(4 == argc)]]],
    [[["bitwise-shr-$1 ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])
]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[schar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uchar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sshort]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ushort]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[slong]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ulong]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint8]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint8]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint16]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint16]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint32]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint32]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sint64]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uint64]]],	[[[1]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[usize]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ssize]]],	[[[1]]])

MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uintmax]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[sintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uintptr]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[mode]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[off]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[pid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[uid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[gid]]],		[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[wchar]]],	[[[1]]])
MMUX_BASH_DEFINE_BITWISE_SHR_BUILTIN([[[wint]]],		[[[1]]])

/* ------------------------------------------------------------------ */

static int
mmux_bash_pointers_bitwise_shr_pointer_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"bitwise-shr-pointer"
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

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,op);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_bitwise_shr_pointer]]],
    [[[(4 == argc)]]],
    [[["bitwise-shr-pointer ROPVAR OP NBITS"]]],
    [[["Compute the bitwise shr of OP, by NBITS, store the result in ROPVAR."]]])

/* end of file */
