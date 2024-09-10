/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory mutator builtins
  Date: Sep  9, 2024

  Abstract

	This module implements raw memory mutator builtins.

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


m4_define([[[MMUX_BASH_POINTERS_DEFINE_MUTATOR]]],[[[
static int
mmuxpointerspointerset[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-$1"
{
  void *	ptr;
  uint8_t *	ptr_byte;
  $2 *		ptr_value;
  size_t	offset;
  $2		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_$1(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr_byte  = ptr;
  ptr_byte += offset;
  ptr_value = ($2 *)ptr_byte;

  *ptr_value = value;
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerset$1]]],[[[(4 != argc)]]],
    [[["pointer-set-$1 POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"$2\"."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[sint]]],		[[[signed   int]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[uint]]],		[[[unsigned int]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[slong]]],		[[[signed   long]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ulong]]],		[[[unsigned long]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[usize]]],		[[[size_t]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ssize]]],		[[[ssize_t]]])

MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[float]]],		[[[float]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[double]]],		[[[double]]])
MMUX_BASH_POINTERS_DEFINE_MUTATOR([[[ldouble]]],	[[[long double]]])


static int
mmuxpointerspointersetschar_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-schar"
/* NOTE The  reason this is a  separate function is that:  to parse the value  we use
   "parse_sint()", then check  the boundaries.  For some reason I  am too ignorant to
   understand: writing a "parse_schar()" like  the other functions causes errors when
   peeking or  poking the values.   I'm sorry about my  ignorance, but life  is hard.
   (Marco Maggi; Sep 9, 2024) */
{
  void *	ptr;
  uint8_t *	ptr_byte;
  signed char *	ptr_value;
  size_t	offset;
  signed int	value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_sint(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  if ((SCHAR_MIN <= value) && (value <= SCHAR_MAX)) {
    ptr_byte   = ptr;
    ptr_byte  += offset;
    ptr_value  = (signed char *)ptr_byte;
    *ptr_value = (signed char)value;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected signed char: \"%s\"\n", MMUX_BUILTIN_NAME, argv[3]);
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointersetschar]]],[[[(4 != argc)]]],
    [[["pointer-set-schar POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"signed char\"."]]])


static int
mmuxpointerspointersetuchar_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-uchar"
/* NOTE The  reason this is a  separate function is that:  to parse the value  we use
   "parse_sint()", then check  the boundaries.  For some reason I  am too ignorant to
   understand: writing a "parse_uchar()" like  the other functions causes errors when
   peeking or  poking the values.   I'm sorry about my  ignorance, but life  is hard.
   (Marco Maggi; Sep 9, 2024) */
{
  void *		ptr;
  uint8_t *		ptr_byte;
  unsigned char *	ptr_value;
  size_t		offset;
  signed int		value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_sint(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  if ((0 <= value) && (value <= UCHAR_MAX)) {
    ptr_byte   = ptr;
    ptr_byte  += offset;
    ptr_value  = (unsigned char *)ptr_byte;
    *ptr_value = (unsigned char)value;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected signed char: \"%s\"\n", MMUX_BUILTIN_NAME, argv[3]);
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointersetuchar]]],[[[(4 != argc)]]],
    [[["pointer-set-uchar POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"signed char\"."]]])


static int
mmuxpointerspointersetcomplex_main (int argc MMUX_BASH_POINTERS_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-complex"
{
  void *		ptr;
  size_t		offset;
  double complex	value;
  int			rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr,   argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_complex(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  if (0) {
    fprintf(stderr, "%s: poking ptr=%p, offset=%lu, re=%lf, im=%lf\n",
	    __func__, ptr, offset, creal(value), cimag(value));
  }

  {
    uint8_t *		ptr_byte;
    double complex *	ptr_value;

    ptr_byte   = ptr;
    ptr_byte  += offset;
    ptr_value  = (double complex *)ptr_byte;
    *ptr_value = (double complex)value;
    return EXECUTION_SUCCESS;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointersetcomplex]]],[[[(4 != argc)]]],
    [[["pointer-set-complex POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"double complex\"."]]])

/* end of file */
