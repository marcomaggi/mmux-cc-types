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
mmux_libc_malloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_malloc"
{
  void *	ptr;
  size_t	len;
  int		rv;

  rv = mmux_usize_parse(&len, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  ptr = malloc(len);
  if (0) {
    fprintf(stderr, "%s: allocated pointer %p\n", __func__, ptr);
  }

  if (ptr) {
    return mmux_pointer_bind_to_variable(argv[1], ptr, MMUX_BUILTIN_NAME);
  } else {
    mmux_bash_pointers_set_ERRNO(errno, MMUX_BUILTIN_NAME);
    return MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_malloc]]],
    [[[(3 == argc)]]],
    [[["mmux_libc_malloc PTRVAR SIZE"]]],
    [[["Allocate a memory block, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
mmux_libc_calloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_calloc"
{
  void *	ptr;
  size_t	item_count;
  size_t	item_size;
  int		rv;

  rv = mmux_usize_parse(&item_count, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_usize_parse(&item_size, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  ptr = calloc(item_count, item_size);
  if (0) {
    fprintf(stderr, "%s: allocated pointer %p\n", __func__, ptr);
  }

  if (ptr) {
    return mmux_pointer_bind_to_variable(argv[1], ptr, MMUX_BUILTIN_NAME);
  } else {
    mmux_bash_pointers_set_ERRNO(errno, MMUX_BUILTIN_NAME);
    return MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_calloc]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_calloc PTRVAR ITEM_COUNT ITEM_SIZE"]]],
    [[["Allocate a memory block wide enough to hold ITEM_COUNT items of ITEM_SIZE, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
mmux_libc_realloc_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_realloc"
{
  void *	ptr;
  size_t	len;
  int		rv;

  rv = mmux_pointer_parse(&ptr, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_usize_parse(&len, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  ptr = realloc(ptr, len);

  if (ptr) {
    return mmux_pointer_bind_to_variable(argv[1], ptr, MMUX_BUILTIN_NAME);
  } else {
    mmux_bash_pointers_set_ERRNO(errno, MMUX_BUILTIN_NAME);
    return MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_realloc]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_realloc PTRVAR OLDPTR NEW_SIZE"]]],
    [[["Reallocate a memory block to a new size, store the new pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

static int
mmux_libc_free_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_free"
{
  void *	ptr;
  int		rv;

  rv = mmux_pointer_parse(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  if (0) {
    fprintf(stderr, "%s: releasing pointer %p\n", __func__, ptr);
  }
  free(ptr);
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_free]]],
    [[[(2 == argc)]]],
    [[["mmux_libc_free PTR"]]],
    [[["Release a memory block."]]])


/** --------------------------------------------------------------------
 ** Standard memory operations.
 ** ----------------------------------------------------------------- */

static int
mmux_libc_memset_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_memset"
{
  void *	ptr;
  unsigned char	c;
  int		i;
  size_t	len;
  int		rv;

  rv = mmux_pointer_parse(&ptr, argv[1], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_uchar_parse(&c, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_usize_parse(&len, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  i = (int)c;

  memset(ptr, i, len);
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_memset]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_memset BLOCK C SIZE"]]],
    [[["Copy C to each of the SIZE bytes of BLOCK."]]])

/* ------------------------------------------------------------------ */

static int
mmux_libc_memcpy_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_memcpy"
{
  void *	ptr_from;
  void *	ptr_to;
  size_t	len;
  int		rv;

  rv = mmux_pointer_parse(&ptr_to,   argv[1], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_pointer_parse(&ptr_from, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_usize_parse(&len,        argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  memcpy(ptr_to, ptr_from, len);
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_memcpy]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_memcpy POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* ------------------------------------------------------------------ */

static int
mmux_libc_memmove_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_libc_memmove"
{
  void *	ptr_from;
  void *	ptr_to;
  size_t	len;
  int		rv;

  rv = mmux_pointer_parse(&ptr_to,   argv[1], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_pointer_parse(&ptr_from, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  rv = mmux_usize_parse(&len,        argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }

  memmove(ptr_to, ptr_from, len);
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_memmove]]],
    [[[(4 == argc)]]],
    [[["mmux_libc_memmove POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* end of file */
