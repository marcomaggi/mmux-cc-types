/*
  Part of: MMUX Bash Pointers
  Contents: functions to print values to string
  Date: Sep 11, 2024

  Abstract

	This module implements functions to print values to string.

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
 ** Type string printers: raw C standard types, no typedefs.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_SPRINTER]]],[[[
int
mmux_bash_pointers_sprint_size_[[[$1]]] (mmux_libc_[[[$1]]]_t value)
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  int		required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, $2, value);
  if (0 > required_nbytes) {
    return -1;
  }

  /* This return value DOES account for the terminating zero character. */
  return ++required_nbytes;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: printer \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return -1;
]]])}

int
mmux_bash_pointers_sprint_[[[$1]]] (char * strptr, int len, mmux_libc_[[[$1]]]_t value)
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  int		to_be_written_chars;

  /* According  to  the  documentation:  "snprintf()"  writes  the  terminating  null
     byte. */
  to_be_written_chars = snprintf(strptr, len, $2, value);
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: printer \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return MMUX_FAILURE;
]]])}]]])

MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[schar]]],		[[["%hhd"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[uchar]]],		[[["%hhu"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[sshort]]],	[[["%hd"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[ushort]]],	[[["%hu"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[sint]]],		[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[uint]]],		[[["%u"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[slong]]],		[[["%ld"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[ulong]]],		[[["%lu"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[sllong]]],	[[["%lld"]]], [[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[ullong]]],	[[["%llu"]]], [[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[double]]],	[[["%lA"]]])
MMUX_BASH_POINTERS_DEFINE_SPRINTER([[[ldouble]]],	[[["%LA"]]],  [[[MMUX_HAVE_TYPE_LDOUBLE]]])

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_sprint_size_pointer (mmux_libc_pointer_t value)
{
  if (value) {
    int		required_nbytes;

    /* According to  the documentation,  when the  output is  truncated: "snprintf()"
       returns the number of required bytes, EXCLUDING the terminating null byte. */
    required_nbytes = snprintf(NULL, 0, "%p", value);
    if (0 > required_nbytes) {
      return -1;
    } else {
      /* This return value DOES account for the terminating zero character. */
      return ++required_nbytes;
    }
  } else {
    return (1 + strlen("0x0"));
  }
}
int
mmux_bash_pointers_sprint_pointer (char * strptr, int len, mmux_libc_pointer_t value)
/* This exists because the GNU C Library  prints "(nil)" when the pointer is NULL and
   the template is "%p"; we want a proper number representation. */
{
  int		to_be_written_chars;

  /* According  to  the  documentation:  "snprintf()"  writes  the  terminating  null
     byte. */
  if (value) {
    to_be_written_chars = snprintf(strptr, len, "%p", value);
  } else {
    to_be_written_chars = snprintf(strptr, len, "0x0");
  }
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_sprint_size_float (mmux_libc_float_t value)
{
  int		required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, "%A", (double)value);
  if (0 > required_nbytes) {
    return -1;
  } else {
    /* This return value DOES account for the terminating zero character. */
    return ++required_nbytes;
  }
}
int
mmux_bash_pointers_sprint_float (char * strptr, int len, float value)
/* This exists  because of the  explicit cast to "double";  without it: GCC  raises a
   warning. */
{
  int		to_be_written_chars;

  /* According  to  the  documentation:  "snprintf()"  writes  the  terminating  null
     byte. */
  to_be_written_chars = snprintf(strptr, len, "%A", (double)value);
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_COMPLEX_SPRINTER]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
int
mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t value)
{
  mmux_libc_$1_part_t	re = mmux_bash_pointers_$1_real_part(value);
  mmux_libc_$1_part_t	im = mmux_bash_pointers_$1_imag_part(value);
  int			required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, $2, $3 re, $3 im);
  if (0 > required_nbytes) {
    return -1;
  } else {
    /* This return value DOES account for the terminating zero character. */
    return ++required_nbytes;
  }
}
int
mmux_bash_pointers_sprint_$1 (char * strptr, int len, mmux_libc_$1_t value)
{
  mmux_libc_$1_part_t	re = mmux_bash_pointers_$1_real_part(value);
  mmux_libc_$1_part_t	im = mmux_bash_pointers_$1_imag_part(value);
  int			to_be_written_chars;

  /* According  to  the  documentation:  "snprintf()"  writes  the  terminating  null
     byte. */
  to_be_written_chars = snprintf(strptr, len, $2, $3 re, $3 im);
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
}
]]])]]])

MMUX_BASH_POINTERS_DEFINE_COMPLEX_SPRINTER([[[complexf]]],	[[["(%A)+i*(%A)"]]],    [[[(mmux_libc_double_t)]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_SPRINTER([[[complexd]]],	[[["(%lA)+i*(%lA)"]]])
MMUX_BASH_POINTERS_DEFINE_COMPLEX_SPRINTER([[[complexld]]],	[[["(%LA)+i*(%LA)"]]],, [[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Other C language and Unix type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER]]],[[[
int
mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t value)
{
  return mmux_bash_pointers_sprint_size_[[[]]]$2[[[]]](value);
}
int
mmux_bash_pointers_sprint_$1 (char * strptr, int len, mmux_libc_$1_t value)
{
  return mmux_bash_pointers_sprint_[[[]]]$2[[[]]](strptr, len, value);
}
]]])

MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sint8]]],		[[[sint]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uint8]]],		[[[uint]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sint16]]],	[[[sint]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uint16]]],	[[[uint]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sint32]]],	[[[slong]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uint32]]],	[[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sint64]]],	[[[sllong]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uint64]]],	[[[ullong]]])

MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[ssize]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[usize]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_USIZE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[sintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR]]])

MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[ptrdiff]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[mode]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_MODE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[off]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_OFF]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[pid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_PID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[uid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_UID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[gid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_GID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[wchar]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_SPRINTER([[[wint]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_WINT]]])

/* end of file */
