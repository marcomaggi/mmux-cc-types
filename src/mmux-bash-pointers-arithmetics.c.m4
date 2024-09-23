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
 ** Addition builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_ADDITION_BUILTIN]]],[[[
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
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] += ops[i];
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
]]])

MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[float]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[double]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[complex]]])

MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_ADDITION_BUILTIN([[[wint]]])

/* ------------------------------------------------------------------ */

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
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_ptrdiff(&delta, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op_octets  = (mmux_libc_uint8_t *)op;
  rop_octets = op_octets + delta;
  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
    char	str[LEN];
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 19, 2024) */
    int		flags = 0;

    rv = mmux_bash_pointers_sprint_pointer(str,LEN,rop_octets);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, flags);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_pointer_add]]],
    [[[(4 == argc)]]],
    [[["mmux_pointer_add ROPVAR PTR DELTA"]]],
    [[["Increment the pointer PTR by the signed integer DELTA, store the result in PTRVAR."]]])


/** --------------------------------------------------------------------
 ** Subtraction builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN]]],[[[
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
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] -= ops[i];
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
]]])

MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[float]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[double]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[complex]]])

MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_SUBTRACTION_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Multiplication builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN]]],[[[
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
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] *= ops[i];
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
]]])

MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[float]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[double]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[complex]]])

MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_MULTIPLICATION_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Division builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_DIVISION_BUILTIN]]],[[[
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
    if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }
  }

  for (int i = 3; i < argc; ++i) {
    ops[2] /= ops[i];
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
]]])

MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[float]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[double]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[complex]]])

MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_DIVISION_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Remainder builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_REMAINDER_BUILTIN]]],[[[
static int
mmux_$1_mod_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_mod"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op1, op2;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op1, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  rv = mmux_bash_pointers_parse_$1(&op2, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op1 = op1 % op2;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[LEN];

    rv = mmux_bash_pointers_sprint_$1(str,LEN,op1);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_variable(argv[1], str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
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

MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_REMAINDER_BUILTIN([[[wint]]])


/** --------------------------------------------------------------------
 ** Negation builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_NEGATION_BUILTIN]]],[[[
static int
mmux_$1_neg_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_neg"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	op;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  op = -op;

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
]]])

MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[schar]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uchar]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sshort]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ushort]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sint]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uint]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[slong]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ulong]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[float]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[double]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[complex]]])

MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sint8]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uint8]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sint16]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uint16]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sint32]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uint32]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sint64]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uint64]]])

MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[usize]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ssize]]])

MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sintmax]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uintmax]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[sintptr]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uintptr]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[ptrdiff]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[mode]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[off]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[pid]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[uid]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[gid]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[wchar]]])
MMUX_BASH_DEFINE_NEGATION_BUILTIN([[[wint]]])

/* end of file */
