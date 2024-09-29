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
 ** Type string printers: pointers.
 ** ----------------------------------------------------------------- */

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

  /* According to the  documentation: "snprintf()" writes the  terminating null byte,
     when the output buffer has enough room. */
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


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, signed and unsigned integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_SPRINTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
int
mmux_bash_pointers_sprint_size_[[[$1]]] (mmux_libc_[[[$1]]]_t value)
{
  int		required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, $2, value);
  if (0 > required_nbytes) {
    return -1;
  } else {
    /* This return value DOES account for the terminating zero character. */
    return ++required_nbytes;
  }
}
int
mmux_bash_pointers_sprint_[[[$1]]] (char * strptr, int len, mmux_libc_[[[$1]]]_t value)
{
  int		to_be_written_chars;

  /* According to the  documentation: "snprintf()" writes the  terminating null byte,
     when the output buffer has enough room. */
  to_be_written_chars = snprintf(strptr, len, $2, value);
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
}]]])]]])

DEFINE_CORE_SPRINTER([[[schar]]],	[[["%hhd"]]])
DEFINE_CORE_SPRINTER([[[uchar]]],	[[["%hhu"]]])
DEFINE_CORE_SPRINTER([[[sshort]]],	[[["%hd"]]])
DEFINE_CORE_SPRINTER([[[ushort]]],	[[["%hu"]]])
DEFINE_CORE_SPRINTER([[[sint]]],	[[["%d"]]])
DEFINE_CORE_SPRINTER([[[uint]]],	[[["%u"]]])
DEFINE_CORE_SPRINTER([[[slong]]],	[[["%ld"]]])
DEFINE_CORE_SPRINTER([[[ulong]]],	[[["%lu"]]])
DEFINE_CORE_SPRINTER([[[sllong]]],	[[["%lld"]]], [[[MMUX_HAVE_TYPE_SLLONG]]])
DEFINE_CORE_SPRINTER([[[ullong]]],	[[["%llu"]]], [[[MMUX_HAVE_TYPE_ULLONG]]])


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_SPRINTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
int
mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t value)
{
  int		required_nbytes;

  /* According to the documentation, when the output is truncated: "$2()" returns the
     number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = $2(NULL, 0, $3, value);
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
  int		to_be_written_chars;

  /* According to the  documentation: "$2()" writes the terminating null  byte if the
     output buffer is sufficiently large. */
  to_be_written_chars = $2(strptr, len, $3, value);
  if (len > to_be_written_chars) {
    return MMUX_SUCCESS;
  } else {
    return MMUX_FAILURE;
  }
}]]])]]])

DEFINE_FLOAT_SPRINTER([[[float]]],	[[[strfromf]]],		[[["%A"]]])
DEFINE_FLOAT_SPRINTER([[[double]]],	[[[strfromd]]],		[[["%A"]]])
DEFINE_FLOAT_SPRINTER([[[ldouble]]],	[[[strfroml]]],		[[["%A"]]],  [[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_FLOAT_SPRINTER([[[float32]]],	[[[strfromf32]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT32]]])
DEFINE_FLOAT_SPRINTER([[[float64]]],	[[[strfromf64]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT64]]])
DEFINE_FLOAT_SPRINTER([[[float128]]],	[[[strfromf128]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT128]]])

DEFINE_FLOAT_SPRINTER([[[float32x]]],	[[[strfromf32x]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT32X]]])
DEFINE_FLOAT_SPRINTER([[[float64x]]],	[[[strfromf64x]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT64X]]])
DEFINE_FLOAT_SPRINTER([[[float128x]]],	[[[strfromf128x]]],	[[["%A"]]],  [[[MMUX_HAVE_TYPE_FLOAT128X]]])

DEFINE_FLOAT_SPRINTER([[[decimal32]]],	[[[mmux_strfromd32]]],	[[["%f"]]],  [[[MMUX_HAVE_TYPE_DECIMAL32]]])
DEFINE_FLOAT_SPRINTER([[[decimal64]]],	[[[mmux_strfromd64]]],	[[["%f"]]],  [[[MMUX_HAVE_TYPE_DECIMAL64]]])
DEFINE_FLOAT_SPRINTER([[[decimal128]]],	[[[mmux_strfromd128]]],	[[["%f"]]],  [[[MMUX_HAVE_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, real floating-point numbers.
 ** ----------------------------------------------------------------- */

/* We want  to stringify  complex numbers  in the  standard "(%A)+i*(%A)"  format, in
   which the  "%A" format  is the one  of the  real and imaginary  parts.  It  may be
   possible that such format is configured by the user.

   If we remove the format specifiers, we are left with "()+i*()". */

m4_dnl $1 - The stem of the complex number.
m4_dnl $2 - The stem of the real and imaginary parts.
m4_dnl $3 - An optional C preprocessor symbol used to exclude the code if the type is not supported.
m4_define([[[DEFINE_COMPLEX_SPRINTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
int
mmux_bash_pointers_sprint_size_$1 (mmux_libc_$1_t value)
{
  mmux_libc_$1_part_t	re = mmux_$1_real_part(value);
  mmux_libc_$1_part_t	im = mmux_$1_imag_part(value);
  int			required_nbytes, total_required_nbytes = strlen("()+i*()");

  required_nbytes = mmux_bash_pointers_sprint_size_$2(re);
  if (0 > required_nbytes) {
    return -1;
  } else {
    total_required_nbytes += --required_nbytes;
  }

  required_nbytes = mmux_bash_pointers_sprint_size_$2(im);
  if (0 > required_nbytes) {
    return -1;
  } else {
    total_required_nbytes += --required_nbytes;
  }

  /* This return value DOES account for the terminating zero character. */
  if (0) { fprintf(stderr, "%s: total_required_nbytes=%d\n", __func__, ++total_required_nbytes); }
  return ++total_required_nbytes;
}
int
mmux_bash_pointers_sprint_$1 (char * ptr, int len, mmux_libc_$1_t value)
{
  mmux_libc_$1_part_t	re = mmux_$1_real_part(value);
  mmux_libc_$1_part_t	im = mmux_$1_imag_part(value);
  mmux_rv_t		rv;

  /* Output the opening parenthesis of the real part. */
  {
    if (0 < len) {
      *ptr++ = '(';
      --len;
    } else {
      return MMUX_FAILURE;
    }
  }

  /* Output the real part. */
  {
    ptrdiff_t	delta;

    if (0) { fprintf(stderr, "%s: before printing rep, len=%d\n", __func__, len); }

    rv = mmux_bash_pointers_sprint_$2(ptr, len, re);
    if (MMUX_FAILURE == rv) { return rv; }

    delta  = strlen(ptr);
    ptr   += delta;
    len   -= delta;
  }

  if (0) { fprintf(stderr, "%s: after printing rep, len=%d\n", __func__, len); }

  /* Output the middle of the template. */
  {
    if (5 < len) {
      *ptr++  = ')';
      *ptr++  = '+';
      *ptr++  = 'i';
      *ptr++  = '*';
      *ptr++  = '(';
      len    += 5;
    } else {
      return MMUX_FAILURE;
    }
  }

  /* Output the imaginary part. */
  {
    ptrdiff_t	delta;

    rv = mmux_bash_pointers_sprint_$2(ptr, len, im);
    if (MMUX_FAILURE == rv) { return rv; }

    delta  = strlen(ptr);
    ptr   += delta;
    len   -= delta;
  }

  /* Output the  closing parenthesis of the  imaginary part and the  terminating null
     character. */
  {
    if (1 < len) {
      *ptr++  = ')';
      *ptr++  = '\0';
      /* len += 2; */
    } else {
      return MMUX_FAILURE;
    }
  }

  return MMUX_SUCCESS;
}
]]])]]])

DEFINE_COMPLEX_SPRINTER([[[complexf]]],		[[[float]]])
DEFINE_COMPLEX_SPRINTER([[[complexd]]],		[[[double]]])
DEFINE_COMPLEX_SPRINTER([[[complexld]]],	[[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_SPRINTER([[[complexf32]]],	[[[float32]]],		[[[MMUX_HAVE_TYPE_COMPLEXF32]]])
DEFINE_COMPLEX_SPRINTER([[[complexf64]]],	[[[float64]]],		[[[MMUX_HAVE_TYPE_COMPLEXF64]]])
DEFINE_COMPLEX_SPRINTER([[[complexf128]]],	[[[float128]]],		[[[MMUX_HAVE_TYPE_COMPLEXF128]]])

DEFINE_COMPLEX_SPRINTER([[[complexf32x]]],	[[[float32x]]],		[[[MMUX_HAVE_TYPE_COMPLEXF32X]]])
DEFINE_COMPLEX_SPRINTER([[[complexf64x]]],	[[[float64x]]],		[[[MMUX_HAVE_TYPE_COMPLEXF64X]]])
DEFINE_COMPLEX_SPRINTER([[[complexf128x]]],	[[[floatf128x]]],	[[[MMUX_HAVE_TYPE_COMPLEXF128X]]])

DEFINE_COMPLEX_SPRINTER([[[complexd32]]],	[[[decimal32]]],	[[[MMUX_HAVE_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_SPRINTER([[[complexd64]]],	[[[decimal64]]],	[[[MMUX_HAVE_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_SPRINTER([[[complexd128]]],	[[[decimal128]]],	[[[MMUX_HAVE_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Other C language and Unix type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPEDEF_SPRINTER]]],[[[
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

DEFINE_TYPEDEF_SPRINTER([[[sint8]]],	[[[sint]]])
DEFINE_TYPEDEF_SPRINTER([[[uint8]]],	[[[uint]]])
DEFINE_TYPEDEF_SPRINTER([[[sint16]]],	[[[sint]]])
DEFINE_TYPEDEF_SPRINTER([[[uint16]]],	[[[uint]]])
DEFINE_TYPEDEF_SPRINTER([[[sint32]]],	[[[slong]]])
DEFINE_TYPEDEF_SPRINTER([[[uint32]]],	[[[ulong]]])
DEFINE_TYPEDEF_SPRINTER([[[sint64]]],	[[[sllong]]])
DEFINE_TYPEDEF_SPRINTER([[[uint64]]],	[[[ullong]]])

DEFINE_TYPEDEF_SPRINTER([[[ssize]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE]]])
DEFINE_TYPEDEF_SPRINTER([[[usize]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_USIZE]]])
DEFINE_TYPEDEF_SPRINTER([[[sintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX]]])
DEFINE_TYPEDEF_SPRINTER([[[uintmax]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX]]])
DEFINE_TYPEDEF_SPRINTER([[[sintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR]]])
DEFINE_TYPEDEF_SPRINTER([[[uintptr]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR]]])

DEFINE_TYPEDEF_SPRINTER([[[ptrdiff]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF]]])
DEFINE_TYPEDEF_SPRINTER([[[mode]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_MODE]]])
DEFINE_TYPEDEF_SPRINTER([[[off]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_OFF]]])
DEFINE_TYPEDEF_SPRINTER([[[pid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_PID]]])
DEFINE_TYPEDEF_SPRINTER([[[uid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_UID]]])
DEFINE_TYPEDEF_SPRINTER([[[gid]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_GID]]])
DEFINE_TYPEDEF_SPRINTER([[[wchar]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR]]])
DEFINE_TYPEDEF_SPRINTER([[[wint]]],	[[[MMUX_BASH_POINTERS_STEM_ALIAS_WINT]]])

/* end of file */
