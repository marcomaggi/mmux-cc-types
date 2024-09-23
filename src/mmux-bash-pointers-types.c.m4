/*
  Part of: MMUX Bash Pointers
  Contents: type functions
  Date: Sep 18, 2024

  Abstract

	This module implements type functions.

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
 ** Standard low-level type functions.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (EXECUTION_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_$1 (void)
{
  return sizeof(mmux_libc_$1_t);
}
mmux_libc_$1_t
mmux_bash_pointers_maximum_$1 (void)
{
  return $2;
}
mmux_libc_$1_t
mmux_bash_pointers_minimum_$1 (void)
{
  return $3;
}
int
mmux_bash_pointers_sprint_maximum_$1 (char * s, size_t l)
{
  return mmux_bash_pointers_sprint_$1(s, l, $2);
}
int
mmux_bash_pointers_sprint_minimum_$1(char * s, size_t l)
{
  return mmux_bash_pointers_sprint_$1(s, l, $3);
}
]]])

MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(schar,	SCHAR_MAX,	SCHAR_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uchar,	UCHAR_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sshort,	SHRT_MAX,	SHRT_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ushort,	USHRT_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint,	INT_MAX,	INT_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint,	UINT_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(slong,	LONG_MAX,	LONG_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ulong,	ULONG_MAX,	0)
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sllong,	LLONG_MAX,	LLONG_MIN)
#endif
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ullong,	ULLONG_MAX,	0)
#endif

/* FIXME Should we do something to make available the "_MIN" constants defined by the
   C language standard?  (Marco Maggi; Sep 18, 2024) */
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float,	FLT_MAX,	-FLT_MAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(double,	DBL_MAX,	-DBL_MAX)
#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ldouble,	LDBL_MAX,	-LDBL_MAX)
#endif

MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint8,	INT8_MAX,	INT8_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint8,	UINT8_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint16,	INT16_MAX,	INT16_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint16,	UINT16_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint32,	INT32_MAX,	INT32_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint32,	UINT32_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint64,	INT64_MAX,	INT64_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint64,	UINT64_MAX,	0)

/* ------------------------------------------------------------------ */

bool
mmux_bash_pointers_string_pointer_p (char const * s_arg)
{
  mmux_libc_pointer_t	value;

  if (EXECUTION_SUCCESS == mmux_bash_pointers_parse_pointer(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_pointer (void)
{
  return sizeof(mmux_libc_pointer_t);
}
mmux_libc_pointer_t
mmux_bash_pointers_minimum_pointer (void)
{
  return (mmux_libc_pointer_t)mmux_bash_pointers_minimum_uintptr();
}
mmux_libc_pointer_t
mmux_bash_pointers_maximum_pointer (void)
{
  return (mmux_libc_pointer_t) mmux_bash_pointers_maximum_uintptr();
}
int
mmux_bash_pointers_sprint_maximum_pointer (char * s, size_t l)
{
  return mmux_bash_pointers_sprint_pointer(s, l, mmux_bash_pointers_maximum_pointer());
}
int
mmux_bash_pointers_sprint_minimum_pointer (char * s, size_t l)
{
  /* We want a proper number, not "(nul)" as the GNU C Library does. */
  size_t	to_be_written_chars;

  to_be_written_chars = snprintf(s, l, "%x", 0);
  if (l > to_be_written_chars) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_bash_pointers_string_complex_p (char const * s_arg)
{
  double complex	value;

  if (EXECUTION_SUCCESS == mmux_bash_pointers_parse_complex(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_complex (void)
{
  return sizeof(mmux_libc_complex_t);
}


/** --------------------------------------------------------------------
 ** Standard high-level type functions.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (EXECUTION_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
  int
  mmux_bash_pointers_sizeof_$1 (void)
  {
    return sizeof(mmux_libc_$1_t);
  }
  mmux_libc_$1_t
  mmux_bash_pointers_maximum_$1 (void)
  {
    return mmux_bash_pointers_maximum_[[[]]]$2[[[]]] ();
  }
  mmux_libc_$1_t
  mmux_bash_pointers_minimum_$1 (void)
  {
    return mmux_bash_pointers_minimum_[[[]]]$2[[[]]] ();
  }
  int
  mmux_bash_pointers_sprint_maximum_$1 (char * s, size_t l)
  {
    return mmux_bash_pointers_sprint_maximum_[[[]]]$2[[[]]] (s,l);
  }
  int
  mmux_bash_pointers_sprint_minimum_$1 (char * s, size_t l)
  {
    return mmux_bash_pointers_sprint_minimum_[[[]]]$2[[[]]] (s,l);
  }
]]])

MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ssize,	MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(usize,	MMUX_BASH_POINTERS_STEM_ALIAS_USIZE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(mode,	MMUX_BASH_POINTERS_STEM_ALIAS_MODE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(off,	MMUX_BASH_POINTERS_STEM_ALIAS_OFF)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(pid,	MMUX_BASH_POINTERS_STEM_ALIAS_PID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uid,	MMUX_BASH_POINTERS_STEM_ALIAS_UID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(gid,	MMUX_BASH_POINTERS_STEM_ALIAS_GID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ptrdiff,	MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wchar,	MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wint,	MMUX_BASH_POINTERS_STEM_ALIAS_WINT)


/** --------------------------------------------------------------------
 ** Store result value in result vaiable.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_VALUE_STORER]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
int
mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value)
{
  int		rv, required_nbytes;

  required_nbytes = mmux_bash_pointers_sprint_size_$1(value);
  if (0 > required_nbytes) {
    return EXECUTION_FAILURE;
  } else {
    char		str[required_nbytes];

    rv = mmux_bash_pointers_sprint_$1(str, required_nbytes, value);
    if (EXECUTION_SUCCESS == rv) {
      SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
      v = bind_variable(variable_name, str, 0);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
]]])]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[pointer]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[schar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sshort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ushort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[slong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ulong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ullong]]],		[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint64]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[double]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ldouble]]],		[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complex]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[usize]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ssize]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ptrdiff]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[mode]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[off]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[pid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[gid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wint]]])

/* end of file */
