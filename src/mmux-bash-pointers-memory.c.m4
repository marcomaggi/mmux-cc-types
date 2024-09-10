/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory management builtins
  Date: Sep  9, 2024

  Abstract

	This module implements memory management builtins.

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
malloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
{
  void *	ptr;
  size_t	len;
  int		rv;

  rv = mmux_bash_pointers_parse_usize(&len, argv[2], "malloc");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  ptr = malloc(len);
  if (0) {
    fprintf(stderr, "%s: allocated pointer %p\n", __func__, ptr);
  }

  if (ptr) {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	32
    char	str[LEN];
    int		flags = 0;

    snprintf(str, LEN, "%p", ptr);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[malloc]]],[[[(3 != argc)]]],
    [[["malloc PTRVAR SIZE"]]],
    [[["Allocate a memory block, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
calloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
{
  void *	ptr;
  size_t	item_count;
  size_t	item_size;
  int		rv;

  rv = mmux_bash_pointers_parse_usize(&item_count, argv[2], "calloc");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_usize(&item_size, argv[3], "calloc");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr = calloc(item_count, item_size);
  if (0) {
    fprintf(stderr, "%s: allocated pointer %p\n", __func__, ptr);
  }

  if (ptr) {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	32
    char	str[LEN];
    int		flags = 0;

    snprintf(str, LEN, "%p", ptr);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[calloc]]],[[[(4 != argc)]]],
    [[["calloc PTRVAR ITEM_COUNT ITEM_SIZE"]]],
    [[["Allocate a memory block wide enough to hold ITEM_COUNT items of ITEM_SIZE, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
realloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
{
  void *	ptr;
  size_t	len;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[2], "realloc");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_usize(&len, argv[3], "realloc");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  ptr = realloc(ptr, len);
  if (ptr) {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	32
    char	str[LEN];
    int		flags = 0;

    snprintf(str, LEN, "%p", ptr);
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    v = bind_variable(argv[1], str, flags);
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[realloc]]],[[[(4 != argc)]]],
    [[["realloc PTRVAR OLDPTR NEW_SIZE"]]],
    [[["Reallocate a memory block to a new size, store the new pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
free_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
{
  void *	ptr;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer(&ptr, argv[1], "free");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  if (0) {
    fprintf(stderr, "%s: releasing pointer %p\n", __func__, ptr);
  }
  free(ptr);
  return EXECUTION_SUCCESS;
}
MMUX_BASH_POINTERS_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[free]]],[[[(2 != argc)]]],
    [[["free PTR"]]],
    [[["Release a memory block."]]])

/* end of file */
