/*
  Part of: MMUX CC Types
  Contents: functions to print values to string
  Date: Sep 11, 2024

  Abstract

	This module implements functions to print values to string.

	NOTE This  module implements some  functions for  the _DecimalX types;  it is
	more convenient to implement these here rather than in the source file of the
	libdfp API adapter.

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

/* Given that  the length MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN  is meant to  include the
   terminating  nul character:  the _MINUS  length is  used to  validate the  maximum
   length (nul excluded) for at format string. */
#undef  MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN_MINUS
#define MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN_MINUS		(MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN-1)

/* This  regular   expression  is  used   to  validate  the  format   specifiers  for
   floating-point numbers.  */
static regex_t mmux_cc_types_flonumfl_format_rex;

m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
#undef  MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]])
#define MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]])	[[[$2]]]

/* Just    to     be    paranoid     we    add     a    character     beyond    index
   MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN and  we will  set that character  to nul  in the
   initialisation  function.   That character  should  never  be touched  by  correct
   code. */
char	mmux_cc_types_output_format_$1[1+MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN];
]]])]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumfl]]],	[[["%A"]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumdb]]],	[[["%A"]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumldb]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf32]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf64]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf128]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf32x]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf64x]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf128x]]],	[[["%A"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd32]]],	[[["%f"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd64]]],	[[["%f"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd128]]],	[[["%f"]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Initialisation.
 ** ----------------------------------------------------------------- */

bool
mmux_cc_types_init_sprint_module (void)
{
  /* Compile the POSIX  regular expression required to parse  the string representing
     the output format of floating-point numbers. */
  int rv = regcomp(&mmux_cc_types_flonumfl_format_rex, "^%[+-\\#\\'\\ ]*[0-9]*\\.\\?[0-9]*l\\?[feEgGaA]$", REG_NOSUB);
  if (rv) {
    fprintf(stderr, "MMUX CC Types: internal error: compiling regular expression\n");
    return true;
  }

  m4_define([[[INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_set_output_format(MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]]), "MMUX CC Types");
  mmux_cc_types_output_format_$1[MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN] = '\0';
  ]]])]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumfl]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumdb]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[flonumd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])

  return false;
}


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating-pont numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_set_output_format (char const * const new_result_format, char const * const caller_name)
{
  int	new_result_format_len = strlen(new_result_format);

  if (new_result_format_len > MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN_MINUS) {
    if (caller_name) {
      fprintf(stderr, "%s: error setting new flonumfl format, string too long (maxlen=%d): %s\n",
	      caller_name, MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN_MINUS, new_result_format);
    }
    return true;
  }

  if (0) {
    fprintf(stderr, "%s: setting new flonumfl format: %s\n", __func__, new_result_format);
  }

  /* Validate the format string. */
  {
    int		rv;

    rv = regexec(&mmux_cc_types_flonumfl_format_rex, new_result_format, 0, NULL, 0);
    if (rv) {
      char	error_message[1024];

      regerror(rv, &mmux_cc_types_flonumfl_format_rex, error_message, 1024);
      if (caller_name) {
	fprintf(stderr, "%s: error: invalid argument, expected flonumfl format (%s): \"%s\"\n",
		caller_name, error_message, new_result_format);
      }
      return true;
    }
  }

  /* We tell "strncpy()"  to copy the from  buffer and fill everything  else with nul
     bytes.  See the documentation of "strncpy()". */
  strncpy(mmux_cc_types_output_format_$1, new_result_format, MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN);
  return false;
}

char const *
mmux_$1_ref_output_format (void)
{
  return mmux_cc_types_output_format_$1;
}

void
mmux_$1_save_output_format (char * const dest)
{
  /* Turn off the warning  because we do the right thing here.   (Marco Maggi; Aug 6,
     2025) */
  _Pragma("GCC diagnostic push");
  _Pragma("GCC diagnostic ignored \"-Wstringop-truncation\"");
  /* We tell  "strncpy()" to copy  from the internal  state and fill  everything else
     with nul bytes.  See the documentation of "strncpy()". */
  strncpy(dest, mmux_cc_types_output_format_$1, MMUX_CC_TYPES_FLONUMFL_FORMAT_MAXLEN);
  _Pragma("GCC diagnostic pop");
}
]]])]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumfl]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumdb]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Type string printers: pointers.
 ** ----------------------------------------------------------------- */

mmux_sint_t
mmux_pointer_sprint_size (mmux_pointer_t value)
{
  if (value) {
    int		required_nbytes;

    /* According to  the documentation,  when the  output is  truncated: "snprintf()"
       returns the number of required bytes, EXCLUDING the terminating null byte. */
    required_nbytes = snprintf(NULL, 0, "%p", value);
    if (0 > required_nbytes) {
      return mmux_sint_literal(-1);
    } else {
      /* This return value DOES account for the terminating zero character. */
      return mmux_sint(++required_nbytes);
    }
  } else {
    return mmux_sint(1 + strlen("0x0"));
  }
}
bool
mmux_pointer_sprint (mmux_asciizp_t strptr, mmux_sint_t len, mmux_pointer_t value)
/* This exists because the GNU C Library  prints "(nil)" when the pointer is NULL and
   the template is "%p"; we want a proper number representation. */
{
  int		to_be_written_chars;

  /* According to the  documentation: "snprintf()" writes the  terminating null byte,
     when the output buffer has enough room. */
  if (value) {
    to_be_written_chars = snprintf(strptr, len.value, "%p", value);
  } else {
    to_be_written_chars = snprintf(strptr, len.value, "0x0");
  }
  if (len.value > to_be_written_chars) {
    return false;
  } else {
    return true;
  }
}


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, signed and unsigned integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_INTEGER_SPRINTER]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
mmux_sint_t
mmux_$1_sprint_size (mmux_$1_t value)
{
  int		required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, $2, value.value);
  if (0 > required_nbytes) {
    return mmux_sint_literal(-1);
  } else {
    /* This return value DOES account for the terminating zero character. */
    return mmux_sint(++required_nbytes);
  }
}
bool
mmux_$1_sprint (mmux_asciizp_t strptr, mmux_sint_t len, mmux_$1_t value)
{
  int		to_be_written_chars;

  /* According to the  documentation: "snprintf()" writes the  terminating null byte,
     when the output buffer has enough room. */
  to_be_written_chars = snprintf(strptr, len.value, $2, value.value);
  if (len.value > to_be_written_chars) {
    return false;
  } else {
    return true;
  }
}]]])]]])

DEFINE_INTEGER_SPRINTER([[[char]]],	[[["%c"]]])
DEFINE_INTEGER_SPRINTER([[[schar]]],	[[["%hhd"]]])
DEFINE_INTEGER_SPRINTER([[[uchar]]],	[[["%hhu"]]])
DEFINE_INTEGER_SPRINTER([[[sshort]]],	[[["%hd"]]])
DEFINE_INTEGER_SPRINTER([[[ushort]]],	[[["%hu"]]])
DEFINE_INTEGER_SPRINTER([[[sint]]],	[[["%d"]]])
DEFINE_INTEGER_SPRINTER([[[uint]]],	[[["%u"]]])
DEFINE_INTEGER_SPRINTER([[[slong]]],	[[["%ld"]]])
DEFINE_INTEGER_SPRINTER([[[ulong]]],	[[["%lu"]]])
DEFINE_INTEGER_SPRINTER([[[sllong]]],	[[["%lld"]]], [[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_INTEGER_SPRINTER([[[ullong]]],	[[["%llu"]]], [[[MMUX_CC_TYPES_HAS_ULLONG]]])


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLONUMFL_SPRINTER]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
mmux_sint_t
mmux_$1_sprint_size (mmux_$1_t value)
{
  int		required_nbytes;

  /* According to the documentation, when the output is truncated: "$2()" returns the
     number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = $2(NULL, 0, mmux_cc_types_output_format_$1, value.value);
  if (0 > required_nbytes) {
    return mmux_sint_literal(-1);
  } else {
    /* This return value DOES account for the terminating zero character. */
    return mmux_sint(++required_nbytes);
  }
}
bool
mmux_$1_sprint (mmux_asciizp_t strptr, mmux_sint_t len, mmux_$1_t value)
{
  int		to_be_written_chars;

  /* According to the  documentation: "$2()" writes the terminating null  byte if the
     output buffer is sufficiently large. */
  to_be_written_chars = $2(strptr, len.value, mmux_cc_types_output_format_$1, value.value);
  if (len.value > to_be_written_chars) {
    return false;
  } else {
    return true;
  }
}]]])]]])

DEFINE_FLONUMFL_SPRINTER([[[flonumfl]]],	[[[strfromf]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumdb]]],	[[[strfromd]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumldb]]],	[[[strfroml]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUMFL_SPRINTER([[[flonumf32]]],	[[[strfromf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumf64]]],	[[[strfromf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumf128]]],	[[[strfromf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUMFL_SPRINTER([[[flonumf32x]]],	[[[strfromf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumf64x]]],	[[[strfromf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumf128x]]],	[[[strfromf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUMFL_SPRINTER([[[flonumd32]]],	[[[mmux_strfromd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumd64]]],	[[[mmux_strfromd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUMFL_SPRINTER([[[flonumd128]]],	[[[mmux_strfromd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


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
m4_define([[[DEFINE_COMPLEX_SPRINTER]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
mmux_sint_t
mmux_$1_sprint_size (mmux_$1_t value)
{
  auto		re = mmux_$1_real_part(value);
  auto		im = mmux_$1_imag_part(value);
  auto		required_nbytes       = mmux_$2_sprint_size(re);
  auto		total_required_nbytes = mmux_sint(strlen("()+i*()"));

  if (0 > required_nbytes.value) {
    return mmux_sint_literal(-1);
  } else {
    total_required_nbytes.value += --required_nbytes.value;
  }

  required_nbytes = mmux_$2_sprint_size(im);
  if (0 > required_nbytes.value) {
    return mmux_sint_literal(-1);
  } else {
    total_required_nbytes.value += --required_nbytes.value;
  }

  /* This return value DOES account for the terminating zero character. */
  if (0) { fprintf(stderr, "%s: total_required_nbytes=%d\n", __func__, ++total_required_nbytes.value); }
  return mmux_sint(1 + total_required_nbytes.value);
}
bool
mmux_$1_sprint (mmux_asciizp_t ptr, mmux_sint_t len, mmux_$1_t value)
{
  mmux_$1_part_t	re = mmux_$1_real_part(value);
  mmux_$1_part_t	im = mmux_$1_imag_part(value);
  bool	rv;

  /* Output the opening parenthesis of the real part. */
  {
    if (0 < len.value) {
      *ptr++ = '(';
      --len.value;
    } else {
      return true;
    }
  }

  /* Output the real part. */
  {
    ptrdiff_t	delta;

    if (0) { fprintf(stderr, "%s: before printing rep, len=%d\n", __func__, len.value); }

    rv = mmux_$2_sprint(ptr, len, re);
    if (true == rv) { return rv; }

    delta  = strlen(ptr);
    ptr       += delta;
    len.value -= delta;
  }

  if (0) { fprintf(stderr, "%s: after printing rep, len=%d\n", __func__, len.value); }

  /* Output the middle of the template. */
  {
    if (5 < len.value) {
      *ptr++  = ')';
      *ptr++  = '+';
      *ptr++  = 'i';
      *ptr++  = '*';
      *ptr++  = '(';
      len.value += 5;
    } else {
      return true;
    }
  }

  /* Output the imaginary part. */
  {
    ptrdiff_t	delta;

    rv = mmux_$2_sprint(ptr, len, im);
    if (true == rv) { return rv; }

    delta  = strlen(ptr);
    ptr       += delta;
    len.value -= delta;
  }

  /* Output the  closing parenthesis of the  imaginary part and the  terminating null
     character. */
  {
    if (1 < len.value) {
      *ptr++  = ')';
      *ptr++  = '\0';
      /* len += 2; */
    } else {
      return true;
    }
  }

  return false;
}
]]])]]])

DEFINE_COMPLEX_SPRINTER([[[flonumcfl]]],		[[[flonumfl]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcdb]]],		[[[flonumdb]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcldb]]],	[[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_COMPLEX_SPRINTER([[[flonumcf32]]],	[[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcf64]]],	[[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcf128]]],	[[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_COMPLEX_SPRINTER([[[flonumcf32x]]],	[[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcf64x]]],	[[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcf128x]]],	[[[flonumflf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_COMPLEX_SPRINTER([[[flonumcd32]]],	[[[flonumd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD32]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcd64]]],	[[[flonumd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD64]]])
DEFINE_COMPLEX_SPRINTER([[[flonumcd128]]],	[[[flonumd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD128]]])


/** --------------------------------------------------------------------
 ** Other C language and Unix type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPEDEF_SPRINTER]]],[[[
mmux_sint_t
mmux_$1_sprint_size (mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint_size(mmux_[[[]]]$2[[[]]](value.value));
}
bool
mmux_$1_sprint (mmux_asciizp_t strptr, mmux_sint_t len, mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint(strptr, len, mmux_[[[]]]$2[[[]]](value.value));
}
]]])

DEFINE_TYPEDEF_SPRINTER([[[sint8]]],	[[[sint]]])
DEFINE_TYPEDEF_SPRINTER([[[uint8]]],	[[[uint]]])
DEFINE_TYPEDEF_SPRINTER([[[sint16]]],	[[[sint]]])
DEFINE_TYPEDEF_SPRINTER([[[uint16]]],	[[[uint]]])
DEFINE_TYPEDEF_SPRINTER([[[sint32]]],	[[[slong]]])
DEFINE_TYPEDEF_SPRINTER([[[uint32]]],	[[[ulong]]])
DEFINE_TYPEDEF_SPRINTER([[[sint64]]],	[[[sintmax]]])
DEFINE_TYPEDEF_SPRINTER([[[uint64]]],	[[[uintmax]]])

DEFINE_TYPEDEF_SPRINTER([[[ssize]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_TYPEDEF_SPRINTER([[[usize]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_USIZE]]])
DEFINE_TYPEDEF_SPRINTER([[[sintmax]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTMAX]]])
DEFINE_TYPEDEF_SPRINTER([[[uintmax]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTMAX]]])
DEFINE_TYPEDEF_SPRINTER([[[sintptr]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SINTPTR]]])
DEFINE_TYPEDEF_SPRINTER([[[uintptr]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_UINTPTR]]])

DEFINE_TYPEDEF_SPRINTER([[[ptrdiff]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF]]])
DEFINE_TYPEDEF_SPRINTER([[[mode]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_MODE]]])
DEFINE_TYPEDEF_SPRINTER([[[off]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_OFF]]])
DEFINE_TYPEDEF_SPRINTER([[[pid]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_PID]]])
DEFINE_TYPEDEF_SPRINTER([[[uid]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_UID]]])
DEFINE_TYPEDEF_SPRINTER([[[gid]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_GID]]])
DEFINE_TYPEDEF_SPRINTER([[[wchar]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_WCHAR]]])
DEFINE_TYPEDEF_SPRINTER([[[wint]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_WINT]]])
DEFINE_TYPEDEF_SPRINTER([[[time]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_TIME]]])
DEFINE_TYPEDEF_SPRINTER([[[socklen]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_SOCKLEN]]])
DEFINE_TYPEDEF_SPRINTER([[[rlim]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_RLIM]]])


/** --------------------------------------------------------------------
 ** Printers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PRINTERS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_dprintf (mmux_standard_sint_t fd, mmux_$1_t value)
{
  auto	required_nbytes = mmux_$1_sprint_size(value);

  if (0 > required_nbytes.value) {
    return true;
  } else {
    char	str[required_nbytes.value];

    if (mmux_$1_sprint(str, required_nbytes, value)) {
      return true;
    } else if (0 > dprintf(fd, "%s", str)) {
      return true;
    }
  }
  return false;
}
bool
mmux_$1_fprintf (mmux_pointer_t stream, mmux_$1_t value)
{
  auto	required_nbytes = mmux_$1_sprint_size(value);

  if (0 > required_nbytes.value) {
    return true;
  } else {
    char	str[required_nbytes.value];

    if (mmux_$1_sprint(str, required_nbytes, value)) {
      return true;
    } else if (0 > fprintf(stream, "%s", str)) {
      return true;
    }
  }
  return false;
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_PRINTERS([[[pointer]]])
DEFINE_PRINTERS([[[char]]])
DEFINE_PRINTERS([[[schar]]])
DEFINE_PRINTERS([[[uchar]]])
DEFINE_PRINTERS([[[sshort]]])
DEFINE_PRINTERS([[[ushort]]])
DEFINE_PRINTERS([[[sint]]])
DEFINE_PRINTERS([[[uint]]])
DEFINE_PRINTERS([[[slong]]])
DEFINE_PRINTERS([[[ulong]]])
DEFINE_PRINTERS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_PRINTERS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_PRINTERS([[[flonumfl]]])
DEFINE_PRINTERS([[[flonumdb]]])
DEFINE_PRINTERS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_PRINTERS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_PRINTERS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_PRINTERS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_PRINTERS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_PRINTERS([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_PRINTERS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_PRINTERS([[[flonumd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_PRINTERS([[[flonumd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_PRINTERS([[[flonumd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])

DEFINE_PRINTERS([[[flonumcfl]]])
DEFINE_PRINTERS([[[flonumcdb]]])
DEFINE_PRINTERS([[[flonumcldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_PRINTERS([[[flonumcf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_PRINTERS([[[flonumcf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_PRINTERS([[[flonumcf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_PRINTERS([[[flonumcf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_PRINTERS([[[flonumcf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_PRINTERS([[[flonumcf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_PRINTERS([[[flonumcd32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD32]]])
DEFINE_PRINTERS([[[flonumcd64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD64]]])
DEFINE_PRINTERS([[[flonumcd128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCD128]]])

DEFINE_PRINTERS([[[sint8]]])
DEFINE_PRINTERS([[[uint8]]])
DEFINE_PRINTERS([[[sint16]]])
DEFINE_PRINTERS([[[uint16]]])
DEFINE_PRINTERS([[[sint32]]])
DEFINE_PRINTERS([[[uint32]]])
DEFINE_PRINTERS([[[sint64]]])
DEFINE_PRINTERS([[[uint64]]])

DEFINE_PRINTERS([[[ssize]]])
DEFINE_PRINTERS([[[usize]]])
DEFINE_PRINTERS([[[sintmax]]])
DEFINE_PRINTERS([[[uintmax]]])
DEFINE_PRINTERS([[[sintptr]]])
DEFINE_PRINTERS([[[uintptr]]])
DEFINE_PRINTERS([[[mode]]])
DEFINE_PRINTERS([[[off]]])
DEFINE_PRINTERS([[[pid]]])
DEFINE_PRINTERS([[[uid]]])
DEFINE_PRINTERS([[[gid]]])
DEFINE_PRINTERS([[[ptrdiff]]])
DEFINE_PRINTERS([[[wchar]]])
DEFINE_PRINTERS([[[wint]]])
DEFINE_PRINTERS([[[time]]])
DEFINE_PRINTERS([[[socklen]]])
DEFINE_PRINTERS([[[rlim]]])

/* end of file */
