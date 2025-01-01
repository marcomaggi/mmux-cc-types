/*
  Part of: MMUX Bash Pointers
  Contents: implementation of ASCIIZ string builtins
  Date: Nov  6, 2024

  Abstract

	This module implements ASCIIZ string builtins.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

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
  mmux_asciizcp_t	pointer_varname;
  mmux_asciizcp_t	str;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(str,			2);
  {
    size_t	len = strlen(str);
    void *	ptr;

    MMUX_LIBC_FUNCALL(mmux_libc_malloc(&ptr, 1+len));
    mmux_libc_strncpy(ptr, str, 1+len);
    return mmux_pointer_bind_to_bash_variable(pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PTRVAR STRING"]]],
    [[["Duplicate a Bash string into newly allocated memory block."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_pointer_to_bash_string]]])
{
  mmux_asciizcp_t	string_varname;
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(string_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  {
    if (3 == argc) {
      char *	str = ptr;
      return mmux_string_bind_to_bash_variable(string_varname, str, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_usize_t	len;

      MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,	3);
      {
	/* I'm really tempted to just do:
	 *
	 *  char str[1+len];
	 *
	 * I  really want  it.  But  who knows  how big  this string  can be?   Uffa!
	 * (Marco Maggi; Nov 6, 2024)
	 */
	char *	str;

	MMUX_LIBC_FUNCALL(mmux_libc_malloc(&str, 1+len));
	{
	  mmux_libc_strncpy(str, ptr, len);
	  str[len] = '\0';
	  {
	    mmux_bash_rv_t	brv = mmux_string_bind_to_bash_variable(string_varname, str, MMUX_BASH_BUILTIN_STRING_NAME);
	    mmux_libc_free(str);
	    return brv;
	  }
	}
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRVAR POINTER [USIZE]"]]],
    [[["Duplicate a raw ASCIIZ string into a Bash string."]]])


/** --------------------------------------------------------------------
 ** Inspection.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strlen]]])
{
  mmux_asciizcp_t	len_varname;
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(len_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,		2);
  {
    mmux_usize_t	len;

    mmux_libc_strlen(&len, ptr);
    return mmux_usize_bind_to_bash_variable(len_varname, len, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_PTR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_PTR)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strnlen]]])
{
  mmux_asciizcp_t	len_varname;
  mmux_pointer_t	ptr;
  mmux_usize_t		maxlen;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(len_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(maxlen,		3);
  {
    mmux_usize_t	len;

    mmux_libc_strnlen(&len, ptr, maxlen);
    return mmux_usize_bind_to_bash_variable(len_varname, len, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_PTR USIZE_MAXLEN"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_PTR, USIZE_MAXLEN)"]]])


/** --------------------------------------------------------------------
 ** Duplication.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcpy]]])
{
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,	2);
  {
    mmux_libc_strcpy(dst_ptr, src_ptr);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strncpy]]])
{
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,		3);
  {
    mmux_libc_strncpy(dst_ptr, src_ptr, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC USIZE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC, USIZE)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_stpcpy]]])
{
  mmux_asciizcp_t	after_ptr_varname;
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(after_ptr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,		3);
  {
    mmux_asciizp_t	after_ptr;

    mmux_libc_stpcpy(&after_ptr, dst_ptr, src_ptr);
    return mmux_pointer_bind_to_bash_variable(after_ptr_varname, after_ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_VAR ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_VAR, ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_stpncpy]]])
{
  mmux_asciizcp_t	after_ptr_varname;
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(after_ptr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_asciizp_t	after_ptr;

    mmux_libc_stpncpy(&after_ptr, dst_ptr, src_ptr, len);
    return mmux_pointer_bind_to_bash_variable(after_ptr_varname, after_ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_VAR ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC USIZE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_VAR, ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC, USIZE)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strdup]]])
{
  mmux_asciizcp_t	oustr_ptr_varname;
  mmux_asciizcp_t	instr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oustr_ptr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(instr,		2);
  {
    mmux_asciizcp_t	oustr;

    mmux_libc_strdup(&oustr, instr);
    return mmux_asciizcp_bind_to_bash_variable(oustr_ptr_varname, oustr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DUPLICATE_PTRVAR ASCIIZ_POINTER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(DUPLICATE_PTRVAR, ASCIIZ_POINTER)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strndup]]])
{
  mmux_asciizcp_t	oustr_ptr_varname;
  mmux_asciizcp_t	instr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oustr_ptr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(instr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			3);
  {
    mmux_asciizcp_t	oustr;

    mmux_libc_strndup(&oustr, instr, len);
    return mmux_asciizcp_bind_to_bash_variable(oustr_ptr_varname, oustr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DUPLICATE_PTRVAR ASCIIZ_POINTER USIZE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(DUPLICATE_PTRVAR, ASCIIZ_POINTER, USIZE)"]]])


/** --------------------------------------------------------------------
 ** Concatenation.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcat]]])
{
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,	2);
  {
    mmux_libc_strcat(dst_ptr, src_ptr);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC)"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strncat]]])
{
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,		3);
  {
    mmux_libc_strncat(dst_ptr, src_ptr, len);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC USIZE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC, USIZE)"]]])


/** --------------------------------------------------------------------
 ** Comparison.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcmp]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  {
    mmux_sint_t		rv;

    mmux_libc_strcmp(&rv, ptr2, ptr1);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2"]]],
    [[["Compare ASCIIZ strings."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strncmp]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_sint_t		rv;

    mmux_libc_strncmp(&rv, ptr2, ptr1, len);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2 LEN"]]],
    [[["Compare ASCIIZ strings."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcasecmp]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  {
    mmux_sint_t		rv;

    mmux_libc_strcasecmp(&rv, ptr2, ptr1);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2"]]],
    [[["Compare ASCIIZ strings."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strncasecmp]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_sint_t		rv;

    mmux_libc_strncasecmp(&rv, ptr2, ptr1, len);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2 LEN"]]],
    [[["Compare ASCIIZ strings."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strverscmp]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  {
    mmux_sint_t		rv;

    mmux_libc_strverscmp(&rv, ptr2, ptr1);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2"]]],
    [[["Compare ASCIIZ strings."]]])


/** --------------------------------------------------------------------
 ** Collation.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcoll]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr1;
  mmux_pointer_t	ptr2;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr2,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr1,			3);
  {
    mmux_sint_t		rv;

    mmux_libc_strcoll(&rv, ptr2, ptr1);
    return mmux_sint_bind_to_bash_variable(result_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SINTVAR PTR1 PTR2"]]],
    [[["Compare ASCIIZ strings."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strxfrm]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	dst_ptr;
  mmux_pointer_t	src_ptr;
  mmux_usize_t		len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(dst_ptr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(src_ptr,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(len,			4);
  {
    mmux_usize_t	result_size;

    mmux_libc_strxfrm(&result_size, dst_ptr, src_ptr, len);
    return mmux_usize_bind_to_bash_variable(result_varname, result_size, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESULT_USIZE_VAR ASCIIZ_POINTER_DST ASCIIZ_POINTER_SRC USIZE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(RESULT_USIZE_VAR, ASCIIZ_POINTER_DST, ASCIIZ_POINTER_SRC, USIZE)"]]])


/** --------------------------------------------------------------------
 ** Searching.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strchr]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr;
  mmux_schar_t		schar;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SCHAR(schar,			3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strchr(&result, ptr, schar);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_POINTER SHCAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strchrnul]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr;
  mmux_schar_t		schar;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SCHAR(schar,			3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strchrnul(&result, ptr, schar);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_PTR SCHAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strrchr]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	ptr;
  mmux_schar_t		schar;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ptr,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SCHAR(schar,			3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strrchr(&result, ptr, schar);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_POINTER SHCAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strstr]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	haystack, needle;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(haystack,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(needle,		3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strstr(&result, haystack, needle);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR HAYSTACK_ASCIIZ_PTR NEEDLE_ASCIIZ_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcasestr]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	haystack, needle;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(haystack,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(needle,		3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strcasestr(&result, haystack, needle);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR HAYSTACK_ASCIIZ_PTR NEEDLE_ASCIIZ_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strspn]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	str, skipset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(str,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(skipset,		3);
  {
    mmux_usize_t	len;

    mmux_libc_strspn(&len, str, skipset);
    return mmux_usize_bind_to_bash_variable(result_varname, len, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER USIZEVAR ASCIIZ_PTR SKIPSET_ASCIIZ_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strcspn]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	str, stopset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(str,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(stopset,		3);
  {
    mmux_usize_t	len;

    mmux_libc_strcspn(&len, str, stopset);
    return mmux_usize_bind_to_bash_variable(result_varname, len, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER USIZEVAR ASCIIZ_PTR STOPSET_ASCIIZ_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strpbrk]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	str, stopset;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(str,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(stopset,		3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strpbrk(&result, str, stopset);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_PTR STOPSET_ASCIIZ_PTR"]]])


/** --------------------------------------------------------------------
 ** Finding tokens.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strtok]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	newstring, delimiters;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(newstring,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(delimiters,		3);
  {
    mmux_asciizcp_t	result;

    mmux_libc_strtok(&result, newstring, delimiters);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_NEWSTRING_PTR ASCIIZ_DELIMITERS_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_basename]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pathname,		2);
  {
    mmux_asciizcp_t	result;

    mmux_libc_basename(&result, pathname);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_PATHNAME_PTR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_dirname]]])
{
  mmux_asciizcp_t	result_varname;
  mmux_pointer_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pathname,		2);
  {
    mmux_asciizcp_t	result;

    mmux_libc_dirname(&result, pathname);
    return mmux_asciizcp_bind_to_bash_variable(result_varname, result, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCIIZ_RESULT_PTRVAR ASCIIZ_PATHNAME_PTR"]]])

/* end of file */
