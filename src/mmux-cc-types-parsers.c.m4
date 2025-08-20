/*
  Part of: MMUX CC Types
  Contents: parsers from strings to internal values
  Date: Sep 11, 2024

  Abstract

	This module implements parsers from strings to internal values.

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

#include <mmux-cc-types-internals.h>

/* This regular expression is used to parse this package's standard format of complex
   double numbers.  */
static regex_t mmux_cc_types_complex_rex;


/** --------------------------------------------------------------------
 ** Initialisation.
 ** ----------------------------------------------------------------- */

bool
mmux_cc_types_init_parsers_module (void)
{
  /* Compile the POSIX regular expression required to parse the string representation
   * of complex numbers.
   *
   * We expect complex numbers represented as:
   *
   *   (+1.2)+i*(-3.4)
   *
   * with the real and imaginary parts  always enclosed in parentheses.  Whatever the
   * sign, whatever the format of the double number: it should always work.
   *
   * FIXME  The compiled  regular expression  is never  released; it  stays allocated
   * forever.  Ideally it  should be released if this library  is unloaded, which, it
   * is my understanding, is actually possible.  (Marco Maggi; Sep  4, 2024)
   */
  {
    int	rv = regcomp(&mmux_cc_types_complex_rex, "^(\\([^)]\\+\\))+i\\*(\\([^)]\\+\\))$", 0);
    if (rv) {
      fprintf(stderr, "MMUX CC Types: internal error: compiling regular expression\n");
      return true;
    }
  }
  return false;
}


/** --------------------------------------------------------------------
 ** Type parsers: signed exact integers of the widest size.
 ** ----------------------------------------------------------------- */

static bool
mmux_cc_types_parse_signed_integer
  (mmux_standard_sintmax_t * result_p,	/* Pointer to result variable. */
   char const * s_source,		/* Pointer to source string. */
   mmux_standard_sintmax_t target_min,	/* The range minimum value of the integer to parse. */
   mmux_standard_sintmax_t target_max,	/* The range maximum value of the integer to parse. */
   char const * target_type_name,	/* Type name to be used for error messages. */
   char const * caller_name)		/* Caller name to be used for error messages. */
/* NOTE This function is written assuming that "standard_sintmax" is the widest exact
   signed integer; this is  no longer the case under C23.  For now  it is what it is.
   (Marco Maggi; Aug 16, 2025) */
{
  char const *	s_source_beg;
  char *	s_source_end	= NULL;
  int		base            = 0;
  size_t	len		= strlen(s_source);

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  } else if ((! isalnum(s_source[0])) && ('+' != s_source[0]) && ('-' != s_source[0])) {
    /* Parsing error: either the  first character is a sign number or  it is a digit,
       for whatever base  it is selected.  The function  "strtoimax()" accepts spaces
       at the beginning of the source string: we do not want them. */
    goto parsing_error;
  } else if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  {
    mmux_standard_sintmax_t	rv = strtoimax(s_source_beg, &s_source_end, base);

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
    } else if ((mmux_standard_sintmax_minimum() != target_min) && (rv < target_min)) {
      /* Parsing error: the  source string is a fine representable  number according to
	 the  parser  function, but  the  resulting  number  is  out of  the  requested
	 range. */
      goto parsing_error;
    } else if ((mmux_standard_sintmax_maximum() != target_max) && (target_max < rv)) {
      /* Parsing error: the  source string is a fine representable  number according to
	 the  parser  function, but  the  resulting  number  is  out of  the  requested
	 range. */
      goto parsing_error;
    } else {
      /* Success! */
      *result_p = rv;
      return false;
    }
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"%s\": \"%s\"\n",
	    caller_name, target_type_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return true;
}


/** --------------------------------------------------------------------
 ** Type parsers: unsigned exact integers of the widest size.
 ** ----------------------------------------------------------------- */

static bool
mmux_cc_types_parse_unsigned_integer
  (mmux_standard_uintmax_t * result_p,	/* Pointer to result variable. */
   char const * s_source,		/* Pointer to source string. */
   mmux_standard_uintmax_t target_max,	/* The range minimum value of the integer to parse. */
   char const * target_type_name,	/* Type name to be used for error messages. */
   char const * caller_name)		/* Caller name to be used for error messages. */
/* NOTE This function is written assuming that "standard_uintmax" is the widest exact
   unsigned integer; this is no longer the case under C23.  For now it is what it is.
   (Marco Maggi; Aug 16, 2025) */
{
  char const *	s_source_beg;
  char *	s_source_end	= NULL;
  int		base            = 0;
  size_t	len		= strlen(s_source);

  if (0 == len) {
    /* Parsing error: empty strings are not valid number representations. */
    goto parsing_error;
  } else if ((! isalnum(s_source[0])) && ('+' != s_source[0])) {
    /* Parsing error:  either the first character  is a plus  sign number or it  is a
       digit, for whatever  base it is selected.  The  function "strtoimax()" accepts
       spaces at the beginning of the source string: we do not want them. */
    goto parsing_error;
  } else if ((3 <= len) && ('0' == s_source[0]) && ('b' == s_source[1])) {
    /* String specifications like "0b101100110" are parsed with base 2. */
    s_source_beg = 2 + s_source;
    base         = 2;
  } else {
    s_source_beg = s_source;
  }

  errno = 0;
  {
    mmux_standard_uintmax_t	rv = strtoumax(s_source_beg, &s_source_end, base);

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
    } else if ((mmux_standard_uintmax_maximum() != target_max) && (target_max < rv)) {
      /* Parsing error: the  source string is a fine representable  number according to
	 the  parser  function, but  the  resulting  number  is  out of  the  requested
	 range. */
      if (0) { fprintf(stderr, "%s: parsing error: greater than requested maximum\n", __func__); }
      goto parsing_error;
    } else {
      /* Success! */
      *result_p = rv;
      return false;
    }
  }

 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"%s\": \"%s\"\n", caller_name, target_type_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return true;
}


/** --------------------------------------------------------------------
 ** Parsing complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_COMPLEX_PARSER]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
static bool parse_$1_parentheses_format (mmux_$1_t * result_p, const char * s_arg, const char * caller_name);

bool
mmux_$1_parse (mmux_$1_t * result_p, const char * s_arg, const char * caller_name)
{
  int	len = strlen(s_arg);

  if (len > 2048) {
    if (caller_name) {
      fprintf(stderr, "%s: error: invalid argument, string too long (max 2048 chars): \"%s\"\n", caller_name, s_arg);
    }
    return true;
  } else if (parse_$1_parentheses_format(result_p, s_arg, caller_name)) {
    /* Parsing as complex number failed.  Try to parse as real number. */
    mmux_$2_t	op_re;

    if (mmux_$2_parse(&op_re, s_arg, caller_name)) {
      /* Parsing as real number failed.  Return error. */
      if (caller_name) {
	fprintf(stderr, "%s: error: invalid argument, expected complex number: \"%s\"\n", caller_name, s_arg);
      }
      return true;
    } else {
      /* Successfully parsed string as real number. */
      *result_p = mmux_$1_make_rectangular(op_re, mmux_$2_constant_zero());
      return false;
    }
  } else {
    /* Successfully parsed string as complex number. */
    return false;
  }
}

bool
parse_$1_parentheses_format (mmux_$1_t * result_p, const char * s_arg, const char * caller_name)
/* Try to parse a complex number in the format:
 *
 *   (1.2)+i*(3.4)
 *
 * first use  a regular  expression to  extract the real  and imaginary  parts.  Then
 * parse the real part and the imaginary part separately.
 */
{
  mmux_$1_part_t	op_re, op_im;
  int			rv;
  char			s_arg_re[1024];
  char			s_arg_im[1024];
  size_t		nmatch = 3;
  regmatch_t		match[3];

  rv = regexec(&mmux_cc_types_complex_rex, s_arg, nmatch, &(match[0]), 0);
  if (rv) {
    if (0) {
      char	error_message[1024];

      regerror(rv, &mmux_cc_types_complex_rex, error_message, 1024);
      if (caller_name) {
	fprintf(stderr, "%s: error: invalid argument, expected complex number (%s): \"%s\"\n", caller_name, error_message, s_arg);
      }
    }
    return true;
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
    rv = mmux_$2_parse(&op_re, s_arg_re, caller_name);
    if (true == rv) { return rv; }
  }

  /* Parse the imaginary part. */
  {
    rv = mmux_$2_parse(&op_im, s_arg_im, caller_name);
    if (true == rv) { return rv; }
  }

  /* Assemble the complex number. */
  {
    *result_p = mmux_$1_make_rectangular(op_re, op_im);
    return false;
  }
}
]]])]]])

DEFINE_COMPLEX_PARSER([[[complexf]]],		[[[float]]])
DEFINE_COMPLEX_PARSER([[[complexd]]],		[[[double]]])
DEFINE_COMPLEX_PARSER([[[complexld]]],		[[[ldouble]]],		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_COMPLEX_PARSER([[[complexf32]]],		[[[float32]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF32]]])
DEFINE_COMPLEX_PARSER([[[complexf64]]],		[[[float64]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF64]]])
DEFINE_COMPLEX_PARSER([[[complexf128]]],	[[[float128]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF128]]])

DEFINE_COMPLEX_PARSER([[[complexf32x]]],	[[[float32x]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF32X]]])
DEFINE_COMPLEX_PARSER([[[complexf64x]]],	[[[float64x]]],		[[[MMUX_CC_TYPES_HAS_COMPLEXF64X]]])
DEFINE_COMPLEX_PARSER([[[complexf128x]]],	[[[float128x]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXF128X]]])

DEFINE_COMPLEX_PARSER([[[complexd32]]],		[[[decimal32]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD32]]])
DEFINE_COMPLEX_PARSER([[[complexd64]]],		[[[decimal64]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD64]]])
DEFINE_COMPLEX_PARSER([[[complexd128]]],	[[[decimal128]]],	[[[MMUX_CC_TYPES_HAS_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Type parsers: floating-point types.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_PARSER]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_parse (mmux_$1_t * result_p, char const * s_value, char const * caller_name)
{
  mmux_standard_$1_t	value;
  char *		tailptr;

  errno = 0;
  value = $2(s_value, &tailptr);
  if (errno || (s_value == tailptr)) {
    if (caller_name) {
      fprintf(stderr, "%s: error: invalid argument, expected \"$1\": \"%s\"\n", caller_name, s_value);
    }
    errno = 0; /* The error is consumed. */
    return true;
  } else {
    *result_p = mmux_$1(value);
    return false;
  }
}
]]])]]])

DEFINE_FLOAT_PARSER([[[float]]],	[[[strtof]]])
DEFINE_FLOAT_PARSER([[[double]]],	[[[strtod]]])
DEFINE_FLOAT_PARSER([[[ldouble]]],	[[[strtold]]],		[[[MMUX_CC_TYPES_HAS_LDOUBLE]]])

DEFINE_FLOAT_PARSER([[[float32]]],	[[[strtof32]]],		[[[MMUX_CC_TYPES_HAS_FLOAT32]]])
DEFINE_FLOAT_PARSER([[[float64]]],	[[[strtof64]]],		[[[MMUX_CC_TYPES_HAS_FLOAT64]]])
DEFINE_FLOAT_PARSER([[[float128]]],	[[[strtof128]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128]]])

DEFINE_FLOAT_PARSER([[[float32x]]],	[[[strtof32x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT32X]]])
DEFINE_FLOAT_PARSER([[[float64x]]],	[[[strtof64x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT64X]]])
DEFINE_FLOAT_PARSER([[[float128x]]],	[[[strtof128x]]],	[[[MMUX_CC_TYPES_HAS_FLOAT128X]]])

DEFINE_FLOAT_PARSER([[[decimal32]]],	[[[mmux_strtod32]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL32]]])
DEFINE_FLOAT_PARSER([[[decimal64]]],	[[[mmux_strtod64]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL64]]])
DEFINE_FLOAT_PARSER([[[decimal128]]],	[[[mmux_strtod128]]],	[[[MMUX_CC_TYPES_HAS_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Type parsers: signed integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_SIGNED_INTEGER_PARSER]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_parse (mmux_$1_t * result_p, char const * s_source, char const * caller_name)
{
  mmux_standard_sintmax_t	value;

  if (mmux_cc_types_parse_signed_integer(&value, s_source,
					 (mmux_standard_sintmax_t)mmux_standard_$1_minimum(),
					 (mmux_standard_sintmax_t)mmux_standard_$1_maximum(),
					 "$1", caller_name)) {
    return true;
  } else {
    *result_p = mmux_$1((mmux_standard_$1_t)value);
    return false;
  }
}
]]])]]])

DEFINE_SIGNED_INTEGER_PARSER([[[schar]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sshort]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sint]]])
DEFINE_SIGNED_INTEGER_PARSER([[[slong]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sllong]]],	[[[MMUX_CC_TYPES_HAS_SLLONG]]])

DEFINE_SIGNED_INTEGER_PARSER([[[sint8]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sint16]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sint32]]])
DEFINE_SIGNED_INTEGER_PARSER([[[sint64]]])

/* ------------------------------------------------------------------ */

#if 0
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_SLLONG]]],[[[
bool
mmux_sllong_parse (mmux_sllong_t * result_p, char const * s_source, char const * caller_name)
{
  mmux_sllong_t	rv;
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
    *result_p = rv;
    return false;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"sllong\": \"%s\"\n", caller_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return true;
}]]])
#endif


/** --------------------------------------------------------------------
 ** Type parsers: unsigned integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_UNSIGNED_INTEGER_PARSER]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_parse (mmux_$1_t * p_value, char const * s_arg, char const * caller_name)
{
  mmux_standard_uintmax_t	value;

  if (mmux_cc_types_parse_unsigned_integer(&value, s_arg, (mmux_standard_uintmax_t)mmux_standard_$1_maximum(),
					   "$1", caller_name)) {
    return true;
  } else {
    *p_value = mmux_$1((mmux_standard_$1_t)value);
    return false;
  }
}
]]])]]])

DEFINE_UNSIGNED_INTEGER_PARSER([[[pointer]]])

DEFINE_UNSIGNED_INTEGER_PARSER([[[uchar]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[ushort]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[uint]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[ulong]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[ullong]]],	[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_UNSIGNED_INTEGER_PARSER([[[uint8]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[uint16]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[uint32]]])
DEFINE_UNSIGNED_INTEGER_PARSER([[[uint64]]])

/* ------------------------------------------------------------------ */

#if 0
MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_ULLONG]]],[[[
bool
mmux_ullong_parse (mmux_ullong_t * p_dest, char const * s_source, char const * caller_name)
{
  mmux_ullong_t		rv;
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
    return false;
  }
 parsing_error:
  if (caller_name) {
    fprintf(stderr, "%s: error: invalid argument, expected \"ullong\": \"%s\"\n", caller_name, s_source);
  }
  errno = 0; /* We consider the error consumed here. */
  return true;
}]]])
#endif


/** --------------------------------------------------------------------
 ** Other C language and Unix type parsers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPEDEF_PARSER]]],[[[
bool
mmux_$1_parse (mmux_$1_t * p_value, char const * s_arg, char const * caller_name)
{
  return mmux_[[[]]]$2[[[]]]_parse(p_value, s_arg, caller_name);
}
]]])

DEFINE_TYPEDEF_PARSER([[[ssize]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_TYPEDEF_PARSER([[[usize]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_USIZE]]])
DEFINE_TYPEDEF_PARSER([[[sintmax]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SINTMAX]]])
DEFINE_TYPEDEF_PARSER([[[uintmax]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UINTMAX]]])
DEFINE_TYPEDEF_PARSER([[[sintptr]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SINTPTR]]])
DEFINE_TYPEDEF_PARSER([[[uintptr]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UINTPTR]]])

DEFINE_TYPEDEF_PARSER([[[ptrdiff]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF]]])
DEFINE_TYPEDEF_PARSER([[[mode]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_MODE]]])
DEFINE_TYPEDEF_PARSER([[[off]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_OFF]]])
DEFINE_TYPEDEF_PARSER([[[pid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_PID]]])
DEFINE_TYPEDEF_PARSER([[[uid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UID]]])
DEFINE_TYPEDEF_PARSER([[[gid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_GID]]])
DEFINE_TYPEDEF_PARSER([[[wchar]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_WCHAR]]])
DEFINE_TYPEDEF_PARSER([[[wint]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_WINT]]])
DEFINE_TYPEDEF_PARSER([[[time]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_TIME]]])
DEFINE_TYPEDEF_PARSER([[[socklen]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN]]])
DEFINE_TYPEDEF_PARSER([[[rlim]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_RLIM]]])


/** --------------------------------------------------------------------
 ** Char support.
 ** ----------------------------------------------------------------- */

#ifdef __CHAR_UNSIGNED__
DEFINE_SIGNED_INTEGER_PARSER([[[char]]])
#else
DEFINE_UNSIGNED_INTEGER_PARSER([[[char]]])
#endif

/* end of file */
