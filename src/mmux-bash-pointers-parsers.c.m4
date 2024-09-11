/*
  Part of: MMUX Bash Pointers
  Contents: parsers from strings to internal values
  Date: Sep 11, 2024

  Abstract

	This module implements parsers from strings to internal values.

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

/* This regular expression is used to parse this package's standard format of complex
   double numbers.  */
regex_t mmux_bash_pointers_complex_rex;


/** --------------------------------------------------------------------
 ** Type parsers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_PARSER]]],[[[
int
mmux_bash_pointers_parse_$1 ($2 * p_data, char const * s_arg, char const * caller_name)
{
#if ($4)
  int	rv;

  /* NOTE I  know that to convert  integers there are functions  like "strtol()", but
     let's not be picky.  (Marco Maggi; Sep 9, 2024) */
  rv = sscanf(s_arg, $3, p_data);
  if ((EOF != rv) && (1 == rv)) {
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"$2\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
#else
  fprintf(stderr, "MMUX Bash Pointers: error: parsing function \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
]]])

MMUX_BASH_POINTERS_DEFINE_PARSER([[[pointer]]],	[[[void *]]],			[[["%p"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[sint]]],	[[[signed int]]],		[[["%d"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[uint]]],	[[[unsigned int]]],		[[["%u"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[slong]]],	[[[signed long]]],		[[["%ld"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ulong]]],	[[[unsigned long]]],		[[["%lu"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[sllong]]],	[[[signed long long]]],		[[["%lld"]]], [[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ullong]]],	[[[unsigned long long]]],	[[["%llu"]]], [[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_PARSER([[[ssize]]],	[[[ssize_t]]],			[[["%ld"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[usize]]],	[[[size_t]]],			[[["%lu"]]],  [[[1]]])

MMUX_BASH_POINTERS_DEFINE_PARSER([[[float]]],	[[[float]]],			[[["%f"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[double]]],	[[[double]]],			[[["%lf"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ldouble]]],	[[[long double]]],		[[["%Lf"]]],  [[[HAVE_LONG_DOUBLE]]])


/** --------------------------------------------------------------------
 ** Type parsers: char.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_schar (signed char * p_data, char const * s_arg, char const * caller_name)
{
  int	data;
  int	rv;

  rv = mmux_bash_pointers_parse_sint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if ((SCHAR_MIN <= data) && (data <= SCHAR_MAX)) {
    *p_data = (signed char)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"signed char\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}
int
mmux_bash_pointers_parse_uchar (unsigned char * p_data, char const * s_arg, char const * caller_name)
{
  unsigned	data;
  int		rv;

  rv = mmux_bash_pointers_parse_uint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if (data <= UCHAR_MAX) {
    *p_data = (unsigned char)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"unsigned char\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}


/** --------------------------------------------------------------------
 ** Type parsers: int8.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_sint8 (int8_t * p_data, char const * s_arg, char const * caller_name)
{
  int	data;
  int	rv;

  rv = mmux_bash_pointers_parse_sint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if ((INT8_MIN <= data) && (data <= INT8_MAX)) {
    *p_data = (int8_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"int8_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}
int
mmux_bash_pointers_parse_uint8 (uint8_t * p_data, char const * s_arg, char const * caller_name)
{
  unsigned	data;
  int		rv;

  rv = mmux_bash_pointers_parse_uint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if (data <= UINT8_MAX) {
    *p_data = (uint8_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"uint8_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}


/** --------------------------------------------------------------------
 ** Type parsers: int16.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_sint16 (int16_t * p_data, char const * s_arg, char const * caller_name)
{
  int	data;
  int	rv;

  rv = mmux_bash_pointers_parse_sint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if ((INT16_MIN <= data) && (data <= INT16_MAX)) {
    *p_data = (int16_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"int16_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}
int
mmux_bash_pointers_parse_uint16 (uint16_t * p_data, char const * s_arg, char const * caller_name)
{
  unsigned	data;
  int		rv;

  rv = mmux_bash_pointers_parse_uint(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if (data <= UINT16_MAX) {
    *p_data = (uint16_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"uint16_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}


/** --------------------------------------------------------------------
 ** Type parsers: int32.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_sint32 (int32_t  * p_data, char const * s_arg, char const * caller_name)
{
  long 	data;
  int	rv;

  rv = mmux_bash_pointers_parse_slong(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if ((INT32_MIN <= data) && (data <= INT32_MAX)) {
    *p_data = (int32_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"int32_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}
int
mmux_bash_pointers_parse_uint32  (uint32_t * p_data, char const * s_arg, char const * caller_name)
{
  unsigned long	data;
  int		rv;

  rv = mmux_bash_pointers_parse_ulong(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if (data <= UINT32_MAX) {
    *p_data = (uint32_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"uint32_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
}


/** --------------------------------------------------------------------
 ** Type parsers: int64.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_sint64  (int64_t  * p_data, char const * s_arg, char const * caller_name)
{
#if (HAVE_LONG_LONG_INT)
  long long 	data;
  int		rv;

  rv = mmux_bash_pointers_parse_sllong(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if ((INT64_MIN <= data) && (data <= INT64_MAX)) {
    *p_data = (int64_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"int64_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: parser \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
int
mmux_bash_pointers_parse_uint64  (uint64_t * p_data, char const * s_arg, char const * caller_name)
{
#if (HAVE_UNSIGNED_LONG_LONG_INT)
  unsigned long	long	data;
  int			rv;

  rv = mmux_bash_pointers_parse_ullong(&data, s_arg, caller_name);
  if (EXECUTION_FAILURE == rv) {
    return rv;
  }
  if (data <= UINT64_MAX) {
    *p_data = (uint64_t)data;
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected \"uint64_t\": \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
  return rv;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: parser \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}


/** --------------------------------------------------------------------
 ** Parsing complex numbers in double format.
 ** ----------------------------------------------------------------- */

static int parse_complex_parentheses_format (double complex * p_value, const char * s_arg, const char * caller_name);

int
mmux_bash_pointers_parse_complex (double complex * p_value, const char * s_arg, const char * caller_name)
{
  int	len = strlen(s_arg);

  if (len > 2048) {
    fprintf(stderr, "%s: error: invalid argument, string too long (max 2048 chars): \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  } else {
    int		rv;

    rv = parse_complex_parentheses_format(p_value, s_arg, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      return rv;
    } else {
      double	op_re;

      rv = mmux_bash_pointers_parse_double(&op_re, s_arg, caller_name);
      if (EXECUTION_SUCCESS == rv) {
	*p_value = op_re + 0.0 * ((double complex)_Complex_I);
	return EXECUTION_SUCCESS;
      } else {
	fprintf(stderr, "%s: error: invalid argument, expected complex number: \"%s\"\n", caller_name, s_arg);
	return EXECUTION_FAILURE;
      }
    }
  }
}

int
parse_complex_parentheses_format (double complex * p_value, const char * s_arg, const char * caller_name)
/* Try to parse a complex number in the format: (1.2)+i*(3.4)

   First use  a regular  expression to  extract the real  and imaginary  parts.  Then
   parse the real part and the imaginary part separately. */
{
  double	op_re, op_im;
  int		rv;
  char		s_arg_re[1024];
  char		s_arg_im[1024];
  size_t	nmatch = 3;
  regmatch_t	match[3];

  rv = regexec(&mmux_bash_pointers_complex_rex, s_arg, nmatch, &(match[0]), 0);
  if (rv) {
    if (0) {
      char	error_message[1024];

      regerror(rv, &mmux_bash_pointers_complex_rex, error_message, 1024);
      fprintf(stderr, "%s: error: invalid argument, expected complex number (%s): \"%s\"\n", caller_name, error_message, s_arg);
    }
    return EXECUTION_FAILURE;
  }

  /* Extract the first matching parentetical subexpression, which represents the real
     part. */
  {
    int	i, imax = match[1].rm_eo - match[1].rm_so;

    for (i=0; i < imax; ++i) {
      s_arg_re[i] = s_arg[match[1].rm_so + i];
    }
    s_arg_re[imax] = '\0';
  }

  /* Extract  the second  matching parentetical  subexpression, which  represents the
     imaginary part. */
  {
    int	i, imax = match[2].rm_eo - match[2].rm_so;

    for (i=0; i < imax; ++i) {
      s_arg_im[i] = s_arg[match[2].rm_so + i];
    }
    s_arg_im[imax] = '\0';
  }

  if (0) {
    fprintf(stderr, "%s: scanned re='%s' im='%s'\n", __func__, s_arg_re, s_arg_im);
  }

  /* Parse the real part. */
  {
    rv = mmux_bash_pointers_parse_double(&op_re, s_arg_re, caller_name);
    if (EXECUTION_FAILURE == rv) { return rv; }
  }

  /* Parse the imaginary part. */
  {
    rv = mmux_bash_pointers_parse_double(&op_im, s_arg_im, caller_name);
    if (EXECUTION_FAILURE == rv) { return rv; }
  }

  /* Assemble the complex number. */
  {
    *p_value = op_re + op_im * ((double complex)_Complex_I);
    return EXECUTION_SUCCESS;
  }
}


/** --------------------------------------------------------------------
 ** Other C language and Unix type parsers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_intmax (intmax_t * p, char const * s, char const * caller_name)
{
#if (HAVE_LONG_LONG_INT)
  if (sizeof(intmax_t) == sizeof(signed long long int)) {
    signed long long int	value;
    int				rv;

    rv = mmux_bash_pointers_parse_sllong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intmax_t)value;
    }
    return rv;
  }
#endif
  if (sizeof(intmax_t) == sizeof(signed long int)) {
    long int	value;
    int		rv;

    rv = mmux_bash_pointers_parse_slong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intmax_t)value;
    }
    return rv;
  } else if (sizeof(intmax_t) == sizeof(signed int)) {
    int		value;
    int		rv;

    rv = mmux_bash_pointers_parse_sint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intmax_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_intptr (intptr_t * p, char const * s, char const * caller_name)
{
#if (HAVE_LONG_LONG_INT)
  if (sizeof(intptr_t) == sizeof(signed long long int)) {
    signed long long int	value;
    int				rv;

    rv = mmux_bash_pointers_parse_sllong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intptr_t)value;
    }
    return rv;
  }
#endif
  if (sizeof(intptr_t) == sizeof(signed long int)) {
    long int	value;
    int		rv;

    rv = mmux_bash_pointers_parse_slong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intptr_t)value;
    }
    return rv;
  } else if (sizeof(intptr_t) == sizeof(signed int)) {
    int		value;
    int		rv;

    rv = mmux_bash_pointers_parse_sint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (intptr_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_uintptr (uintptr_t * p, char const * s, char const * caller_name)
{
#if (HAVE_UNSIGNED_LONG_LONG)
  if (sizeof(uintptr_t) == sizeof(unsigned long long int)) {
    unsigned long long int	value;
    int				rv;

    rv = mmux_bash_pointers_parse_ullong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (uintptr_t)value;
    }
    return rv;
  }
#endif
  if (sizeof(uintptr_t) == sizeof(unsigned long int)) {
    unsigned long int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_ulong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (uintptr_t)value;
    }
    return rv;
  } else if (sizeof(uintptr_t) == sizeof(unsigned int)) {
    unsigned int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_uint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (uintptr_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_ptrdiff (ptrdiff_t * p, char const * s, char const * caller_name)
{
#if (HAVE_LONG_LONG_INT)
  if (sizeof(ptrdiff_t) == sizeof(signed long long int)) {
    signed long long int	value;
    int				rv;

    rv = mmux_bash_pointers_parse_sllong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (ptrdiff_t)value;
    }
    return rv;
  }
#endif
  if (sizeof(ptrdiff_t) == sizeof(signed long int)) {
    long int	value;
    int		rv;

    rv = mmux_bash_pointers_parse_slong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (ptrdiff_t)value;
    }
    return rv;
  } else if (sizeof(ptrdiff_t) == sizeof(signed int)) {
    int		value;
    int		rv;

    rv = mmux_bash_pointers_parse_sint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (ptrdiff_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_mode (mode_t  * p, char const * s, char const * caller_name)
{
  if (sizeof(mode_t) == sizeof(unsigned long int)) {
    unsigned long int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_ulong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (mode_t)value;
    }
    return rv;
  } else if (sizeof(mode_t) == sizeof(unsigned int)) {
    unsigned int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_uint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (mode_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_off     (off_t   * p, char const * s, char const * caller_name)
{
#if (HAVE_LONG_LONG_INT)
  if (sizeof(off_t) == sizeof(signed long long int)) {
    signed long long int	value;
    int				rv;

    rv = mmux_bash_pointers_parse_sllong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (off_t)value;
    }
    return rv;
  }
#endif
  if (sizeof(off_t) == sizeof(signed long int)) {
    long int	value;
    int		rv;

    rv = mmux_bash_pointers_parse_slong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (off_t)value;
    }
    return rv;
  } else if (sizeof(off_t) == sizeof(signed int)) {
    int		value;
    int		rv;

    rv = mmux_bash_pointers_parse_sint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (off_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_pid     (pid_t   * p, char const * s, char const * caller_name)
{
  if (sizeof(pid_t) == sizeof(signed long int)) {
    signed long int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_slong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (pid_t)value;
    }
    return rv;
  } else if (sizeof(pid_t) == sizeof(int)) {
    int		value;
    int		rv;

    rv = mmux_bash_pointers_parse_sint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (pid_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_uid     (uid_t   * p, char const * s, char const * caller_name)
{
  if (sizeof(uid_t) == sizeof(unsigned long int)) {
    unsigned long int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_ulong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (uid_t)value;
    }
    return rv;
  } else if (sizeof(uid_t) == sizeof(unsigned int)) {
    unsigned int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_uint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (uid_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_gid     (gid_t   * p, char const * s, char const * caller_name)
{
  if (sizeof(gid_t) == sizeof(unsigned long int)) {
    unsigned long int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_ulong(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (gid_t)value;
    }
    return rv;
  } else if (sizeof(gid_t) == sizeof(unsigned int)) {
    unsigned int	value;
    int			rv;

    rv = mmux_bash_pointers_parse_uint(&value, s, caller_name);
    if (EXECUTION_SUCCESS == rv) {
      *p = (gid_t)value;
    }
    return rv;
  } else {
    return EXECUTION_FAILURE;
  }
}

/* end of file */
