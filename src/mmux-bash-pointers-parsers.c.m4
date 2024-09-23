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
 ** Type parsers: signed and unsigned exact integers of the widest size.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_signed_integer (mmux_libc_sintmax_t * p_dest, char const * s_source,
					 mmux_libc_sintmax_t target_min, mmux_libc_sintmax_t target_max,
					 char const * target_type_name, char const * caller_name)
{
  mmux_libc_sintmax_t	rv;
  char const *		s_source_beg;
  char *		s_source_end	= NULL;
  int			base            = 0;
  size_t		len		= strlen(s_source);

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  }
  if ((! isalnum(s_source[0])) && ('+' != s_source[0]) && ('-' != s_source[0])) {
    /* Parsing error: either the  first character is a sign number or  it is a digit,
       for whatever base  it is selected.  The function  "strtoimax()" accepts spaces
       at the beginning of the source string: we do not want them. */
    goto parsing_error;
  }

  if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  rv = strtoimax(s_source_beg, &s_source_end, base);

  if ((0 == rv) && (s_source_end == s_source_beg)) {
    /* Parsing error: the source string does not represent a valid number. */
    goto parsing_error;
  } else if (ERANGE == errno) {
    /* Parsing error: the source string may represet a number, but it is out of range
       according to the parser function. */
    goto parsing_error;
  } else if (len != (size_t)(s_source_end - s_source)) {
    /* Parsing  error:  there   must  be  no  characters  after   the  number  string
       representation. */
    goto parsing_error;
  } else if ((mmux_bash_pointers_minimum_sintmax() != target_min) && (rv < target_min)) {
    /* Parsing error: the  source string is a fine representable  number according to
       the  parser  function, but  the  resulting  number  is  out of  the  requested
       range. */
    goto parsing_error;
  } else if ((mmux_bash_pointers_maximum_sintmax() != target_max) && (target_max < rv)) {
    /* Parsing error: the  source string is a fine representable  number according to
       the  parser  function, but  the  resulting  number  is  out of  the  requested
       range. */
    goto parsing_error;
  } else {
    /* Success! */
    *p_dest = rv;
    return EXECUTION_SUCCESS;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"%s\": \"%s\"\n", caller_name, target_type_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return EXECUTION_FAILURE;
}
int
mmux_bash_pointers_parse_unsigned_integer (mmux_libc_uintmax_t * p_dest, char const * s_source,
					   mmux_libc_uintmax_t target_max,
					   char const * target_type_name, char const * caller_name)
{
  mmux_libc_uintmax_t	rv;
  char const *		s_source_beg;
  char *		s_source_end	= NULL;
  int			base            = 0;
  size_t		len		= strlen(s_source);

  if (0) { fprintf(stderr, "%s: uintmax=%lu, target_max=%lu\n", __func__, mmux_bash_pointers_maximum_uintmax(), target_max); }

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  }
  if ((! isalnum(s_source[0])) && ('+' != s_source[0])) {
    /* Parsing error:  either the first character  is a plus  sign number or it  is a
       digit, for whatever  base it is selected.  The  function "strtoimax()" accepts
       spaces at the beginning of the source string: we do not want them. */
    goto parsing_error;
  }

  if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  rv = strtoumax(s_source_beg, &s_source_end, base);

  if ((0 == rv) && (s_source_end == s_source_beg)) {
    /* Parsing error: the source string does not represent a valid number. */
    goto parsing_error;
  } else if (ERANGE == errno) {
    /* Parsing error: the source string may represet a number, but it is out of range
       according to the parser function. */
    if (0) { fprintf(stderr, "%s: parsing error: out of range, %s\n", __func__, s_source); }
    goto parsing_error;
  } else if (len != (size_t)(s_source_end - s_source)) {
    /* Parsing  error:  there   must  be  no  characters  after   the  number  string
       representation. */
    if (0) { fprintf(stderr, "%s: parsing error: additional chars after number\n", __func__); }
    goto parsing_error;
  } else if ((mmux_bash_pointers_maximum_uintmax() != target_max) && (target_max < rv)) {
    /* Parsing error: the  source string is a fine representable  number according to
       the  parser  function, but  the  resulting  number  is  out of  the  requested
       range. */
    if (0) { fprintf(stderr, "%s: parsing error: greater than requested maximum\n", __func__); }
    goto parsing_error;
  } else {
    /* Success! */
    *p_dest = rv;
    return EXECUTION_SUCCESS;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"%s\": \"%s\"\n", caller_name, target_type_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return EXECUTION_FAILURE;
}


/** --------------------------------------------------------------------
 ** Type parsers: floating-point types.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_FLOAT_PARSER]]],[[[
int
mmux_bash_pointers_parse_$1 (mmux_libc_$1_t * p_data, char const * s_arg, char const * caller_name)
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  int	rv;

  rv = sscanf(s_arg, $2, p_data);
  if ((EOF != rv) && (1 == rv)) {
    return EXECUTION_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: invalid argument, expected \"$1\": \"%s\"\n", caller_name, s_arg);
    }
    return EXECUTION_FAILURE;
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: parsing function \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
]]])
}
]]])

MMUX_BASH_POINTERS_DEFINE_FLOAT_PARSER([[[float]]],	[[["%f"]]])
MMUX_BASH_POINTERS_DEFINE_FLOAT_PARSER([[[double]]],	[[["%lf"]]])
MMUX_BASH_POINTERS_DEFINE_FLOAT_PARSER([[[ldouble]]],	[[["%Lf"]]],	[[[HAVE_LONG_DOUBLE]]])


/** --------------------------------------------------------------------
 ** Type parsers: signed integers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER]]],[[[
int
mmux_bash_pointers_parse_$1 (mmux_libc_$1_t * p_dest, char const * s_source, char const * caller_name)
{
  mmux_libc_sintmax_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_signed_integer(&value, s_source,
					       mmux_bash_pointers_minimum_$1(), mmux_bash_pointers_maximum_$1(),
					       "$1", caller_name);
  if (EXECUTION_SUCCESS == rv) {
    *p_dest = (mmux_libc_$1_t)value;
  }
  return rv;
}
]]])

MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[slong]]])

MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_SIGNED_INTEGER_PARSER([[[sint64]]])

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_sllong (mmux_libc_sllong_t * p_dest, char const * s_source, char const * caller_name)
{
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
  mmux_libc_sllong_t	rv;
  char const *		s_source_beg;
  char *		s_source_end	= NULL;
  int			base            = 0;
  size_t		len		= strlen(s_source);

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  }
  if ((! isalnum(s_source[0])) && ('+' != s_source[0]) && ('-' != s_source[0])) {
    /* Parsing error:  either the first  character is  a sign or  it is a  digit, for
       whatever base it is selected.  The  function "strtoll()" accepts spaces at the
       beginning of the source string: we do not want them. */
    goto parsing_error;
  }

  if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  rv = strtoll(s_source_beg, &s_source_end, base);

  if ((0 == rv) && (s_source_end == s_source_beg)) {
    /* Parsing error: the source string does not represent a valid number. */
    goto parsing_error;
  } else if (ERANGE == errno) {
    /* Parsing error: the source string may represet a number, but it is out of range
       according to the parser function. */
    goto parsing_error;
  } else if (len != (size_t)(s_source_end - s_source)) {
    /* Parsing  error:  there   must  be  no  characters  after   the  number  string
       representation. */
    goto parsing_error;
  } else {
    /* Success! */
    *p_dest = rv;
    return EXECUTION_SUCCESS;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"sllong\": \"%s\"\n", caller_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return EXECUTION_FAILURE;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: parsing function \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}


/** --------------------------------------------------------------------
 ** Type parsers: signed integers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER]]],[[[
int
mmux_bash_pointers_parse_$1 (mmux_libc_[[[$1]]]_t * p_value, char const * s_arg, char const * caller_name)
{
  mmux_libc_uintmax_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_unsigned_integer(&value, s_arg,
						 (mmux_libc_uintmax_t) mmux_bash_pointers_maximum_$1(),
						 "$1", caller_name);
  if (EXECUTION_SUCCESS == rv) {
    *p_value = (mmux_libc_$1_t)value;
  }
  return rv;
}
]]])

MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[pointer]]])

MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[ulong]]])

MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_UNSIGNED_INTEGER_PARSER([[[uint64]]])

/* ------------------------------------------------------------------ */

int
mmux_bash_pointers_parse_ullong (mmux_libc_ullong_t * p_dest, char const * s_source, char const * caller_name)
{
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
  mmux_libc_ullong_t	rv;
  char const *		s_source_beg;
  char *		s_source_end	= NULL;
  int			base            = 0;
  size_t		len		= strlen(s_source);

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  }
  if ((! isalnum(s_source[0])) && ('+' != s_source[0])) {
    /* Parsing error:  either the first  character is  a sign or  it is a  digit, for
       whatever base it is selected.  The  function "strtoll()" accepts spaces at the
       beginning of the source string: we do not want them. */
    goto parsing_error;
  }

  if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  rv = strtoull(s_source_beg, &s_source_end, base);

  if ((0 == rv) && (s_source_end == s_source_beg)) {
    /* Parsing error: the source string does not represent a valid number. */
    goto parsing_error;
  } else if (ERANGE == errno) {
    /* Parsing error: the source string may represet a number, but it is out of range
       according to the parser function. */
    goto parsing_error;
  } else if (len != (size_t)(s_source_end - s_source)) {
    /* Parsing  error:  there   must  be  no  characters  after   the  number  string
       representation. */
    goto parsing_error;
  } else {
    /* Success! */
    *p_dest = rv;
    return EXECUTION_SUCCESS;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"ullong\": \"%s\"\n", caller_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return EXECUTION_FAILURE;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: parsing function \"%s\" not implemented because underlying C language type not available.\n",
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
	if (caller_name) {
	  fprintf(stderr, "%s: error: invalid argument, expected complex number: \"%s\"\n", caller_name, s_arg);
	}
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

m4_define([[[MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER]]],[[[
int
mmux_bash_pointers_parse_[[[]]]$1 (mmux_libc_[[[$1]]]_t * p_value, char const * s_arg, char const * caller_name)
{
  return mmux_bash_pointers_parse_[[[]]]$2[[[]]](p_value, s_arg, caller_name);
}
]]])

MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[ssize]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[usize]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_USIZE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[sintmax]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[uintmax]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[sintptr]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[uintptr]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR]]])

MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[ptrdiff]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[mode]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_MODE]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[off]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_OFF]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[pid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_PID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[uid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_UID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[gid]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_GID]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[wchar]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR]]])
MMUX_BASH_POINTERS_DEFINE_SUBTYPE_PARSER([[[wint]]],		[[[MMUX_BASH_POINTERS_STEM_ALIAS_WINT]]])

/* end of file */
