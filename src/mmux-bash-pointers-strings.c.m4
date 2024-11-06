/*
  Part of: MMUX Bash Pointers
  Contents: implementation of ASCIIZ string builtins
  Date: Nov  6, 2024

  Abstract

	This module implements ASCIIZ string builtins.

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
 ** Conversion.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_from_bash_string]]])
{
  char const *	str;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(str,	argv[2]);
  {
    size_t	len = strlen(str);
    if (0) { fprintf(stderr, "%s: str=%s len=%lu\n", __func__, str, len); }
    void *	ptr = malloc(1+len);

    if (ptr) {
      memcpy(ptr, str, 1+len);
      return mmux_pointer_bind_to_bash_variable(argv[1], ptr, MMUX_BUILTIN_NAME_STR);
    } else {
      mmux_bash_pointers_set_ERRNO(errno, MMUX_BUILTIN_NAME_STR);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR STRING"]]],
    [[["Duplicate a Bash string into newly allocated memory block."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_to_bash_string]]])
{
  void *	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,	argv[2]);
  {
    if (3 == argc) {
      char *	str = ptr;
      return mmux_string_bind_to_bash_variable(argv[1], str, MMUX_BUILTIN_NAME_STR);
    } else {
      size_t	len;

      MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(len,	argv[3]);
      {
	/* I'm really tempted to just do:
	 *
	 *  char str[1+len];
	 *
	 * I  really want  it.  But  who knows  how big  this string  can be?   Uffa!
	 * (Marco Maggi; Nov 6, 2024)
	 */
	char *	str = malloc(1+len);

	if (str) {
	  memcpy(str, ptr, len);
	  str[len] = '\0';
	  {
	    mmux_bash_rv_t	rv = mmux_string_bind_to_bash_variable(argv[1], str, MMUX_BUILTIN_NAME_STR);
	    free(str);
	    return rv;
	  }
	} else {
	  mmux_bash_pointers_set_ERRNO(errno, MMUX_BUILTIN_NAME_STR);
	  return MMUX_FAILURE;
	}
      }
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRVAR POINTER USIZE"]]],
    [[["Duplicate a Bash string into newly allocated memory block."]]])


/** --------------------------------------------------------------------
 ** Standard string operations.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strlen]]])
{
  void *	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,	argv[2]);
  {
    size_t	len = strlen(ptr);
    return mmux_usize_bind_to_bash_variable(argv[1], len, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_PTR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_PTR)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strdup]]])
{
  void *	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,	argv[2]);
  {
    char const *	instr = ptr;
    char *		oustr = strdup(instr);
    return mmux_pointer_bind_to_bash_variable(argv[1], oustr, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DUPLICATE_STRPTRVAR ORIGINAL_STRPTR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(DUPLICATE_STRPTRVAR, ORIGINAL_STRPTR)"]]])


/* end of file */
