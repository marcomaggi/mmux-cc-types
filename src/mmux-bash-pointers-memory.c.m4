/*
  Part of: MMUX Bash Pointers
  Contents: implementation of memory management builtins
  Date: Sep  9, 2024

  Abstract

	This module implements memory management builtins.

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
 ** Standard memory management.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_malloc]]])
{
  char const *	pointer_varname;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			2);
  {
    mmux_pointer_t	ptr;

    MMUX_LIBC_FUNCALL(mmux_libc_malloc(&ptr, len));
    return mmux_pointer_bind_to_bash_variable(pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR SIZE"]]],
    [[["Allocate a memory block, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_calloc]]])
{
  char const *	pointer_varname;
  size_t	item_count;
  size_t	item_size;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(item_count,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(item_size,		3);
  {
    mmux_pointer_t	ptr;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&ptr, item_count, item_size));
    return mmux_pointer_bind_to_bash_variable(pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR ITEM_COUNT ITEM_SIZE"]]],
    [[["Allocate a memory block wide enough to hold ITEM_COUNT items of ITEM_SIZE, store the pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_realloc]]])
{
  char const *		pointer_varname;
  mmux_pointer_t	ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			3);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_realloc(&ptr, len));
    return mmux_pointer_bind_to_bash_variable(pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR OLDPTR NEW_SIZE"]]],
    [[["Reallocate a memory block to a new size, store the new pointer in the given variable."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_free]]])
{
  void *	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,	1);
  {
    mmux_libc_free(ptr);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTR"]]],
    [[["Release a memory block."]]])


/** --------------------------------------------------------------------
 ** Memory operations: setting.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memset]]])
{
  mmux_pointer_t	ptr;
  mmux_uint8_t		octet;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8(octet,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,	3);
  {
    mmux_libc_memset(ptr, octet, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER BLOCK UINT8 SIZE"]]],
    [[["Copy OCTET to each byte of the SIZE bytes of BLOCK."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memzero]]])
{
  mmux_pointer_t	ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,	2);
  {
    mmux_libc_memzero(ptr, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER BLOCK SIZE"]]],
    [[["Reset to zero the SIZE bytes of BLOCK."]]])


/** --------------------------------------------------------------------
 ** Memory operations: duplicating.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memcpy]]])
{
  void *	ptr_to;
  void *	ptr_from;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_to,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_from,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,		3);
  {
    mmux_libc_memcpy(ptr_to, ptr_from, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memcpy_from_bash_string]]])
{
  void *	ptr_to;
  char const *	ptr_from;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_to,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ptr_from,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,		3);
  {
    mmux_libc_memcpy(ptr_to, (mmux_pointer_t)ptr_from, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mempcpy]]])
{
  char const *	after_to_varname;
  void *	ptr_from;
  void *	ptr_to;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(after_to_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_to,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_from,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_pointer_t	after_to;

    MMUX_LIBC_FUNCALL(mmux_libc_mempcpy(&after_to, ptr_to, ptr_from, len));
    return mmux_pointer_bind_to_bash_variable(after_to_varname, after_to, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AFTER_POINTER_TOVAR POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memccpy]]])
{
  char const *	after_to_varname;
  void *	ptr_from;
  void *	ptr_to;
  mmux_uint8_t	octet;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(after_to_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_to,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_from,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8(octet,			4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			5);
  {
    mmux_pointer_t	after_to;

    MMUX_LIBC_FUNCALL(mmux_libc_memccpy(&after_to, ptr_to, ptr_from, octet, len));

    if (after_to) {
      return mmux_pointer_bind_to_bash_variable(after_to_varname, after_to, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return MMUX_SUCCESS;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AFTER_POINTER_TO POINTER_TO POINTER_FROM UINT8 USIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memmove]]])
{
  void *	ptr_from;
  void *	ptr_to;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_to,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr_from,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,	3);
  {
    mmux_libc_memmove(ptr_to, ptr_from, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER POINTER_TO POINTER_FROM SIZE"]]],
    [[["Copy SIZE bytes from POINTER_FROM to POINTER_TO."]]])


/** --------------------------------------------------------------------
 ** Memory operations: comparison.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memcmp]]])
{
  char const *	result_varname;
  void *	ptr1;
  void *	ptr2;
  size_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_sint_t		rv;

    mmux_libc_memcmp(&rv, ptr2, ptr1, len);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2 SIZE"]]],
    [[["Compare memory blocks."]]])


/** --------------------------------------------------------------------
 ** Searching.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memchr]]])
{
  char const *		result_varname;
  mmux_pointer_t	ptr;
  mmux_uint8_t		octet;
  mmux_usize_t		size;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8(octet,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,			4);
  {
    mmux_pointer_t	result;

    MMUX_LIBC_FUNCALL(mmux_libc_memchr(&result, ptr, octet, size));
    return mmux_pointer_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESULT_PTRVAR POINTER UINT8 SIZE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rawmemchr]]])
{
  char const *		result_varname;
  mmux_pointer_t	ptr;
  mmux_uint8_t		octet;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8(octet,			3);
  {
    mmux_pointer_t	result;

    MMUX_LIBC_FUNCALL(mmux_libc_rawmemchr(&result, ptr, octet));
    return mmux_pointer_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESULT_PTRVAR POINTER UINT8"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memrchr]]])
{
  char const *		result_varname;
  mmux_pointer_t	ptr;
  mmux_uint8_t		octet;
  mmux_usize_t		size;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8(octet,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(size,			4);
  {
    mmux_pointer_t	result;

    MMUX_LIBC_FUNCALL(mmux_libc_memrchr(&result, ptr, octet, size));
    return mmux_pointer_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESULT_PTRVAR POINTER UINT8 SIZE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_memmem]]])
{
  char const *		result_varname;
  mmux_pointer_t	haystack_ptr, needle_ptr;
  mmux_usize_t		haystack_len, needle_len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(haystack_ptr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(haystack_len,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(needle_ptr,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(needle_len,		5);
  {
    mmux_pointer_t	result;

    MMUX_LIBC_FUNCALL(mmux_libc_memmem(&result, haystack_ptr, haystack_len, needle_ptr, needle_len));
    return mmux_pointer_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR HAYSTACK_PTR HAYSTACK_USIZE NEEDLE_PTR NEEDLE_USIZE"]]])

/* end of file */
