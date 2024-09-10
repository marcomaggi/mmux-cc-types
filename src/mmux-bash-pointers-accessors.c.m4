/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory accessors builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory accessor builtins.

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


m4_define([[[MMUX_BASH_POINTERS_DEFINE_ACCESSOR]]],[[[
static int
mmuxpointerspointerref[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-$1"
{
  void *	ptr;
  uint8_t *	ptr_byte;
  $2 *		ptr_value;
  size_t	offset;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = ($2 *)ptr_byte;

  value = *ptr_value;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  STRLEN
#define STRLEN	1024 /* This size has to be good for every type. Ha! Ha! */
    char	str[STRLEN];
    int		flags = 0;

    snprintf(str, STRLEN, $3, value);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerref$1]]],[[[(4 != argc)]]],
    [[["pointer-ref-$1 VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"$2\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[schar]]],		[[[signed char]]],	[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uchar]]],		[[[unsigned char]]],	[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[sint]]],		[[[signed   int]]],	[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[uint]]],		[[[unsigned int]]],	[[["%u"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[slong]]],		[[[signed   long]]],	[[["%ld"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ulong]]],		[[[unsigned long]]],	[[["%lu"]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[usize]]],		[[[size_t]]],		[[["%lu"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ssize]]],		[[[ssize_t]]],		[[["%ld"]]])

MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[double]]],	[[[double]]],		[[["%lf"]]])
MMUX_BASH_POINTERS_DEFINE_ACCESSOR([[[ldouble]]],	[[[long double]]],	[[["%Lf"]]])


static int
mmuxpointerspointerreffloat_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-float"
/* NOTE The only reason this is a separate function is that the call to "snprintf()",
   when compiled  with GCC, causes a  warning of implicit conversion  from "float" to
   "double"; it irritates me.  So I do the explicit conversion.  (Marco Maggi; Sep 9,
   2024) */
{
  void *	ptr;
  uint8_t *	ptr_byte;
  float *		ptr_value;
  size_t	offset;
  float		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = (float *)ptr_byte;

  value = *ptr_value;

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  STRLEN
#define STRLEN	64
    char	str[STRLEN];
    int		flags = 0;

    snprintf(str, STRLEN, "%lf", (double)value);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerreffloat]]],[[[(4 != argc)]]],
    [[["pointer-ref-float VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"float\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])


static int
mmuxpointerspointerrefcomplex_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-complex"
{
  void *		ptr;
  size_t		offset;
  double complex	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  {
    uint8_t *		ptr_byte;
    double complex *	ptr_value;

    ptr_byte  = ptr;
    ptr_byte += offset;
    ptr_value = (double complex *)ptr_byte;

    value = *ptr_value;
  }

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  STRLEN
#define STRLEN	1024
    char	str[STRLEN];
    int		flags = 0;

    snprintf(str, STRLEN, "(%lf)+i*(%lf)", creal(value), cimag(value));
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerrefcomplex]]],[[[(4 != argc)]]],
    [[["pointer-ref-complex VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"double complex\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])

/* end of file */
