/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory management builtins
  Date: Sep  9, 2024

  Abstract

	This module implements memory arrays accessor and mutator builtins.

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
 ** Standard memory management.
 ** ----------------------------------------------------------------- */

static int
mmuxpointerspointersetsint_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-set-sint"
{
  int *		ptr;
  size_t	offset;
  int		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_sint(&value, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  *(ptr + offset) = value;
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointersetsint]]],[[[(4 != argc)]]],
    [[["pointer-set-sint POINTER OFFSET VALUE"]]],
    [[["Store VALUE at OFFSET from POINTER, VALUE must fit a C language type \"int\"."]]])


/* ------------------------------------------------------------------ */

static int
mmuxpointerspointerrefsint_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"pointer-ref-sint"
{
  int *		ptr;
  size_t	offset;
  int		value;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_offset(&offset, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  value = *(ptr + offset);
  if (0) {
    fprintf(stderr, "%s: pointer %p, offset %lu, value %d\n", __func__, ptr, offset, value);
  }

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
    char	str[64];
    int		flags = 0;

    snprintf(str, 1024, "%d", value);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmuxpointerspointerrefsint]]],[[[(4 != argc)]]],
    [[["pointer-ref-sint VALUEVAR POINTER OFFSET"]]],
    [[["Retrieve a C language type \"int\" value at OFFSET from POINTER, store it in the given VALUEVAR."]]])


/* end of file */
