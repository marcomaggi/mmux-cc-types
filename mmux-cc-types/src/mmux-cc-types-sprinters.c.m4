/*
  Part of: MMUX CC Types
  Contents: functions to print values to string
  Date: Sep 11, 2024

  Abstract

	This module implements functions to print values to string.

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

#include <mmux-cc-types-internals.h>

/* Given that  the length MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN  is meant to  include the
   terminating  nul character:  the _MINUS  length is  used to  validate the  maximum
   length (nul excluded) for at format string. */
#undef  MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN_MINUS
#define MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN_MINUS		(MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN-1)

/* This  regular   expression  is  used   to  validate  the  format   specifiers  for
   floating-point numbers.  */
static regex_t mmux_cc_types_float_format_rex;

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
#undef  MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]])
#define MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]])	[[[$2]]]

/* Just    to     be    paranoid     we    add     a    character     beyond    index
   MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN and  we will  set that character  to nul  in the
   initialisation  function.   That character  should  never  be touched  by  correct
   code. */
char	mmux_cc_types_output_format_$1[1+MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN];
]]])]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float]]],	[[["%A"]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[double]]],	[[["%A"]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[ldouble]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float32]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float64]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float128]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float32x]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float64x]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float128x]]],	[[["%A"]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal32]]],	[[["%f"]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal64]]],	[[["%f"]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal128]]],	[[["%f"]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Initialisation.
 ** ----------------------------------------------------------------- */

bool
mmux_cc_types_init_sprint_module (void)
{
  /* Compile the POSIX  regular expression required to parse  the string representing
     the output format of floating-point numbers. */
  int rv = regcomp(&mmux_cc_types_float_format_rex, "^%[+-\\#\\'\\ ]*[0-9]*\\.\\?[0-9]*l\\?[feEgGaA]$", REG_NOSUB);
  if (rv) {
    fprintf(stderr, "MMUX CC Types: internal error: compiling regular expression\n");
    return true;
  }

  m4_define([[[INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_set_output_format(MMUX_CC_TYPES_DEFAULT_OUTPUT_FORMAT_[[[]]]MMUX_M4_TOUPPER([[[$1]]]), "MMUX CC Types");
  mmux_cc_types_output_format_$1[MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN] = '\0';
  ]]])]]])

  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[double]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
  INITIALISE_FLOAT_OUTPUT_FORMAT_VARIABLE([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

  return false;
}


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating-pont numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_set_output_format (char const * const new_result_format, char const * const caller_name)
{
  int	new_result_format_len = strlen(new_result_format);

  if (new_result_format_len > MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN_MINUS) {
    if (caller_name) {
      fprintf(stderr, "%s: error setting new float format, string too long (maxlen=%d): %s\n",
	      caller_name, MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN_MINUS, new_result_format);
    }
    return true;
  }

  if (0) {
    fprintf(stderr, "%s: setting new float format: %s\n", __func__, new_result_format);
  }

  /* Validate the format string. */
  {
    int		rv;

    rv = regexec(&mmux_cc_types_float_format_rex, new_result_format, 0, NULL, 0);
    if (rv) {
      char	error_message[1024];

      regerror(rv, &mmux_cc_types_float_format_rex, error_message, 1024);
      if (caller_name) {
	fprintf(stderr, "%s: error: invalid argument, expected float format (%s): \"%s\"\n",
		caller_name, error_message, new_result_format);
      }
      return true;
    }
  }

  /* We tell "strncpy()"  to copy the from  buffer and fill everything  else with nul
     bytes.  See the documentation of "strncpy()". */
  strncpy(mmux_cc_types_output_format_$1, new_result_format, MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN);
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
  /* We tell  "strncpy()" to copy  the from internal  state and fill  everything else
     with nul bytes.  See the documentation of "strncpy()". */
  strncpy(dest, mmux_cc_types_output_format_$1, MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN);
}
]]])]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[double]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_FUNCTION([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Type string printers: pointers.
 ** ----------------------------------------------------------------- */

int
mmux_pointer_sprint_size (mmux_pointer_t value)
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
bool
mmux_pointer_sprint (char * strptr, int len, mmux_pointer_t value)
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
    return false;
  } else {
    return true;
  }
}


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, signed and unsigned integers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CORE_SPRINTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
int
mmux_$1_sprint_size (mmux_$1_t value)
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
bool
mmux_$1_sprint (char * strptr, int len, mmux_$1_t value)
{
  int		to_be_written_chars;

  /* According to the  documentation: "snprintf()" writes the  terminating null byte,
     when the output buffer has enough room. */
  to_be_written_chars = snprintf(strptr, len, $2, value);
  if (len > to_be_written_chars) {
    return false;
  } else {
    return true;
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
DEFINE_CORE_SPRINTER([[[sllong]]],	[[["%lld"]]], [[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_CORE_SPRINTER([[[ullong]]],	[[["%llu"]]], [[[MMUX_HAVE_CC_TYPE_ULLONG]]])


/** --------------------------------------------------------------------
 ** Type string printers: raw C standard types, real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_SPRINTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
int
mmux_$1_sprint_size (mmux_$1_t value)
{
  int		required_nbytes;

  if (0) {
    fprintf(stderr, "%s: enter %s value=%Lf format=\"%s\"\n",
	    __func__, "$2",
	    (long double)value, mmux_cc_types_output_format_$1);
  }

  /* According to the documentation, when the output is truncated: "$2()" returns the
     number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = $2(NULL, 0, mmux_cc_types_output_format_$1, value);

  if (0) { fprintf(stderr, "%s: %s required_nbytes=%d\n", __func__, "$2", required_nbytes); }

  if (0 > required_nbytes) {
    return -1;
  } else {
    /* This return value DOES account for the terminating zero character. */
    return ++required_nbytes;
  }
}
bool
mmux_$1_sprint (char * strptr, int len, mmux_$1_t value)
{
  int		to_be_written_chars;

  if (0) { fprintf(stderr, "%s: enter len=%d, value=%Lf\n", __func__, len, (long double)value); }

  /* According to the  documentation: "$2()" writes the terminating null  byte if the
     output buffer is sufficiently large. */
  to_be_written_chars = $2(strptr, len, mmux_cc_types_output_format_$1, value);
  if (len > to_be_written_chars) {
    return false;
  } else {
    return true;
  }
}]]])]]])

DEFINE_FLOAT_SPRINTER([[[float]]],	[[[strfromf]]])
DEFINE_FLOAT_SPRINTER([[[double]]],	[[[strfromd]]])
DEFINE_FLOAT_SPRINTER([[[ldouble]]],	[[[strfroml]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_SPRINTER([[[float32]]],	[[[strfromf32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_SPRINTER([[[float64]]],	[[[strfromf64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_SPRINTER([[[float128]]],	[[[strfromf128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_SPRINTER([[[float32x]]],	[[[strfromf32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_SPRINTER([[[float64x]]],	[[[strfromf64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_SPRINTER([[[float128x]]],	[[[strfromf128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_SPRINTER([[[decimal32]]],	[[[mmux_strfromd32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_SPRINTER([[[decimal64]]],	[[[mmux_strfromd64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_SPRINTER([[[decimal128]]],	[[[mmux_strfromd128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


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
mmux_$1_sprint_size (mmux_$1_t value)
{
  mmux_$1_part_t	re = mmux_$1_real_part(value);
  mmux_$1_part_t	im = mmux_$1_imag_part(value);
  int			required_nbytes, total_required_nbytes = strlen("()+i*()");

  required_nbytes = mmux_$2_sprint_size(re);
  if (0 > required_nbytes) {
    return -1;
  } else {
    total_required_nbytes += --required_nbytes;
  }

  required_nbytes = mmux_$2_sprint_size(im);
  if (0 > required_nbytes) {
    return -1;
  } else {
    total_required_nbytes += --required_nbytes;
  }

  /* This return value DOES account for the terminating zero character. */
  if (0) { fprintf(stderr, "%s: total_required_nbytes=%d\n", __func__, ++total_required_nbytes); }
  return ++total_required_nbytes;
}
bool
mmux_$1_sprint (char * ptr, int len, mmux_$1_t value)
{
  mmux_$1_part_t	re = mmux_$1_real_part(value);
  mmux_$1_part_t	im = mmux_$1_imag_part(value);
  bool	rv;

  /* Output the opening parenthesis of the real part. */
  {
    if (0 < len) {
      *ptr++ = '(';
      --len;
    } else {
      return true;
    }
  }

  /* Output the real part. */
  {
    ptrdiff_t	delta;

    if (0) { fprintf(stderr, "%s: before printing rep, len=%d\n", __func__, len); }

    rv = mmux_$2_sprint(ptr, len, re);
    if (true == rv) { return rv; }

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
      return true;
    }
  }

  /* Output the imaginary part. */
  {
    ptrdiff_t	delta;

    rv = mmux_$2_sprint(ptr, len, im);
    if (true == rv) { return rv; }

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
      return true;
    }
  }

  return false;
}
]]])]]])

DEFINE_COMPLEX_SPRINTER([[[complexf]]],		[[[float]]])
DEFINE_COMPLEX_SPRINTER([[[complexd]]],		[[[double]]])
DEFINE_COMPLEX_SPRINTER([[[complexld]]],	[[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_SPRINTER([[[complexf32]]],	[[[float32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_COMPLEX_SPRINTER([[[complexf64]]],	[[[float64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_COMPLEX_SPRINTER([[[complexf128]]],	[[[float128]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_COMPLEX_SPRINTER([[[complexf32x]]],	[[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_COMPLEX_SPRINTER([[[complexf64x]]],	[[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_COMPLEX_SPRINTER([[[complexf128x]]],	[[[floatf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_COMPLEX_SPRINTER([[[complexd32]]],	[[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_SPRINTER([[[complexd64]]],	[[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_SPRINTER([[[complexd128]]],	[[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])


/** --------------------------------------------------------------------
 ** Other C language and Unix type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_TYPEDEF_SPRINTER]]],[[[
int
mmux_$1_sprint_size (mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint_size(value);
}
bool
mmux_$1_sprint (char * strptr, int len, mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint(strptr, len, value);
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

/* end of file */
