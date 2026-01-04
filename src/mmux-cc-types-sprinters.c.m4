/*
  Part of: MMUX CC Types
  Contents: functions to print values to string
  Date: Sep 11, 2024

  Abstract

	This module implements functions to print values to string.

	NOTE This  module implements some  functions for  the _DecimalX types;  it is
	more convenient to implement these here rather than in the source file of the
	libdfp API adapter.

  Copyright (C) 2024, 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

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

/* Given that the  length MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN is meant  to include the
   terminating  nul character:  the _MINUS  length is  used to  validate the  maximum
   length (nul excluded) for at format string. */
#undef  MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN_MINUS
#define MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN_MINUS		(MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN-1)

/* This  regular   expression  is  used   to  validate  the  format   specifiers  for
   floating-point numbers.  */
static regex_t	mmux_cc_types_flonumfl_format_rex;
static bool	mmux_cc_types_rex_initialised = false;

m4_divert(-1)
m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[m4_dnl
mmux_asciizcp_t mmux_cc_types_default_output_format_flonum$1=[[[$2]]];

/* Just    to     be    paranoid     we    add     a    character     beyond    index
   MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN and  we will set  that character to nul  in the
   initialisation  function.   That character  should  never  be touched  by  correct
   code. */
static char	mmux_cc_types_output_format_flonum$1[1+MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN];
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(fl,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(db,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(ldb,	"%A")

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f32,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f64,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f128,	"%A")

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f32x,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f64x,	"%A")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(f128x,	"%A")

DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(d32,	"%f")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(d64,	"%f")
DEFINE_FLONUMFL_OUTPUT_FORMAT_VARIABLE(d128,	"%f")


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
  } else {
    mmux_cc_types_rex_initialised = true;
  }

  m4_divert(-1)
  m4_define([[[INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
  mmux_flonum$1_set_output_format(mmux_cc_types_default_output_format_flonum$1, "MMUX CC Types");
  mmux_cc_types_output_format_flonum$1[MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN] = '\0';
  ]]])]]])
  m4_divert(0)m4_dnl

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[fl]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[db]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[ldb]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f32]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f64]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f128]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f32x]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f64x]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[f128x]]])

  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[d32]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[d64]]])
  INITIALISE_FLONUMFL_OUTPUT_FORMAT_VARIABLE([[[d128]]])

  return false;
}
void
mmux_cc_types_final_sprint_module (void)
{
  if (mmux_cc_types_rex_initialised) {
    regfree(&mmux_cc_types_flonumfl_format_rex);
  }
}


/** --------------------------------------------------------------------
 ** Adapters.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_STRING_FROM_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
mmux_cc_types_inline_decl mmux_standard_sint_t
mmux_standard_strfrom$1 (mmux_asciizp_t restrict result_p, size_t size, mmux_asciizcp_t restrict format,
			 mmux_standard_flonum$1_t value)
{
  return $2(result_p, size, format, value);
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(fl,	strfromf)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(db,	strfromd)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(ldb,	strfroml)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f32,	strfromf32)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f64,	strfromf64)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f128,	strfromf128)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f32x,	strfromf32x)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f64x,	strfromf64x)
DEFINE_STANDARD_STRING_FROM_FUNCTIONS(f128x,	strfromf128x)


/** --------------------------------------------------------------------
 ** Selecting printf output format for floating-pont numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_set_output_format (mmux_asciizcp_t const new_result_format, mmux_asciizcp_t const caller_name)
{
  int	new_result_format_len = strlen(new_result_format);

  if (new_result_format_len > MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN_MINUS) {
    if (caller_name) {
      fprintf(stderr, "%s: error setting new flonumfl format, string too long (maxlen=%d): %s\n",
	      caller_name, MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN_MINUS, new_result_format);
    }
    return true;
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
  strncpy(mmux_cc_types_output_format_$1, new_result_format, MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN);
  return false;
}

mmux_asciizcp_t
mmux_$1_ref_output_format (void)
{
  return mmux_cc_types_output_format_$1;
}

void
mmux_$1_save_output_format (mmux_asciizp_t const dest)
{
  /* Turn off the warning  because we do the right thing here.   (Marco Maggi; Aug 6,
     2025) */
  _Pragma("GCC diagnostic push");
  _Pragma("GCC diagnostic ignored \"-Wstringop-truncation\"");
  /* We tell  "strncpy()" to copy  from the internal  state and fill  everything else
     with nul bytes.  See the documentation of "strncpy()". */
  strncpy(dest, mmux_cc_types_output_format_$1, MMUX_CC_TYPES_FLONUM_FORMAT_MAXLEN);
  _Pragma("GCC diagnostic pop");
}
]]])]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumfl]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumdb]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD32]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD64]]])
DEFINE_FLONUMFL_OUTPUT_FORMAT_SETTER_FUNCTION([[[flonumd128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMD128]]])


/** --------------------------------------------------------------------
 ** Type string printers: pointers.
 ** ----------------------------------------------------------------- */

bool
mmux_pointer_sprint_size (mmux_usize_t * result_required_size_p, mmux_pointer_t value)
{
  if (value) {
    int		required_nbytes;

    /* According to  the documentation,  when the  output is  truncated: "snprintf()"
       returns the number of required bytes, EXCLUDING the terminating null byte. */
    required_nbytes = snprintf(NULL, 0, "%p", value);
    if (0 > required_nbytes) {
      return true;
    } else {
      /* This return value DOES account for the terminating zero character. */
      *result_required_size_p = mmux_usize(++required_nbytes);
      return false;
    }
  } else {
    *result_required_size_p = mmux_usize(1 + strlen("0x0"));
    return false;
  }
}
bool
mmux_pointer_sprint (mmux_asciizp_t strptr, mmux_usize_t len, mmux_pointer_t value)
/* This exists because the GNU C Library  prints "(nil)" when the pointer is NULL and
   the template is "%p"; we want a proper number representation. */
{
  mmux_standard_usize_t		to_be_written_chars;

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
bool
mmux_$1_sprint_size (mmux_usize_t * result_required_size_p, mmux_$1_t value)
{
  int		required_nbytes;

  /* According  to the  documentation,  when the  output  is truncated:  "snprintf()"
     returns the number of required bytes, EXCLUDING the terminating null byte. */
  required_nbytes = snprintf(NULL, 0, $2, value.value);
  if (0 > required_nbytes) {
    return true;
  } else {
    /* This return value DOES account for the terminating zero character. */
    *result_required_size_p = mmux_usize(++required_nbytes);
    return false;
  }
}
bool
mmux_$1_sprint (mmux_asciizp_t strptr, mmux_usize_t len, mmux_$1_t value)
{
  mmux_standard_usize_t		to_be_written_chars;

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
 ** Type string printers: flonum
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_REAL_FLONUM_SPRINTER]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
bool
mmux_flonum$1_sprint_size (mmux_usize_t * result_required_size_p, mmux_flonum$1_t value)
{
  if (mmux_flonum$1_is_nan(value)) {
    *result_required_size_p = mmux_usize(strlen(MMUX_CC_TYPES_FLONUM_STRINGREP_NAN));
    return false;
  } else if (mmux_flonum$1_is_infinite(value)) {
    /* It  is possible  for the  representations  of positive  infinity and  negative
       infinity to have the same length.  But not assume it blindly. */
    _Pragma("GCC diagnostic push");
    _Pragma("GCC diagnostic ignored \"-Wduplicated-branches\"");
    if (mmux_flonum$1_is_positive(value)) {
      *result_required_size_p = mmux_usize(strlen(MMUX_CC_TYPES_FLONUM_STRINGREP_POSITIVE_INFINITY));
      return false;
    } else {
      *result_required_size_p = mmux_usize(strlen(MMUX_CC_TYPES_FLONUM_STRINGREP_NEGATIVE_INFINITY));
      return false;
    }
    _Pragma("GCC diagnostic pop");
  } else {
    int		required_nbytes;

    /* According   to    the   documentation,    when   the   output    is   truncated:
       "mmux_standard_strfrom$1()" returns the number  of required bytes, EXCLUDING the
       terminating null byte. */
    required_nbytes = mmux_standard_strfrom$1(NULL, 0, mmux_cc_types_output_format_flonum$1, value.value);
    if (0 > required_nbytes) {
      return true;
    } else {
      /* This return value DOES account for the terminating zero character. */
      *result_required_size_p = mmux_usize(++required_nbytes);
      return false;
    }
  }
}
bool
mmux_flonum$1_sprint (mmux_asciizp_t strptr, mmux_usize_t len, mmux_flonum$1_t value)
{
  if (mmux_flonum$1_is_nan(value)) {
    strncpy(strptr, MMUX_CC_TYPES_FLONUM_STRINGREP_NAN, len.value);
    return false;
  } else if (mmux_flonum$1_is_infinite(value)) {
    if (mmux_flonum$1_is_positive(value)) {
      strncpy(strptr, MMUX_CC_TYPES_FLONUM_STRINGREP_POSITIVE_INFINITY, len.value);
    } else {
      strncpy(strptr, MMUX_CC_TYPES_FLONUM_STRINGREP_NEGATIVE_INFINITY, len.value);
    }
    return false;
  } else {
    mmux_standard_usize_t	to_be_written_chars;

    /* According   to  the   documentation:   "mmux_standard_strfrom$1()"  writes   the
       terminating null byte if the output buffer is sufficiently large. */
    to_be_written_chars = mmux_standard_strfrom$1(strptr, len.value, mmux_cc_types_output_format_flonum$1, value.value);
    if (len.value > to_be_written_chars) {
      return false;
    } else {
      return true;
    }
  }
}]]])]]])
m4_divert(0)m4_dnl
DEFINE_REAL_FLONUM_SPRINTER(fl)
DEFINE_REAL_FLONUM_SPRINTER(db)
DEFINE_REAL_FLONUM_SPRINTER(ldb)

DEFINE_REAL_FLONUM_SPRINTER(f32)
DEFINE_REAL_FLONUM_SPRINTER(f64)
DEFINE_REAL_FLONUM_SPRINTER(f128)

DEFINE_REAL_FLONUM_SPRINTER(f32x)
DEFINE_REAL_FLONUM_SPRINTER(f64x)
DEFINE_REAL_FLONUM_SPRINTER(f128x)

DEFINE_REAL_FLONUM_SPRINTER(d32)
DEFINE_REAL_FLONUM_SPRINTER(d64)
DEFINE_REAL_FLONUM_SPRINTER(d128)


/** --------------------------------------------------------------------
 ** Type string printers: flonumc
 ** ----------------------------------------------------------------- */

m4_divert(-1)
/* We want  to stringify  complex numbers  in the  standard "(%A)+i*(%A)"  format, in
   which the  "%A" format  is the one  of the  real and imaginary  parts.  It  may be
   possible that such format is configured by the user.

   If we remove the format specifiers, we are left with "()+i*()". */

m4_dnl $1 - The stem trail of the type.
m4_define([[[DEFINE_CPLX_FLONUM_SPRINTER]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
bool
mmux_flonumc$1_sprint_size (mmux_usize_t * result_required_size_p, mmux_flonumc$1_t value)
{
  auto			re = mmux_flonumc$1_real_part(value);
  auto			im = mmux_flonumc$1_imag_part(value);
  int			total_required_nbytes = strlen("()+i*()");
  mmux_usize_t		required_nbytes;

  if (mmux_flonum$1_sprint_size(&required_nbytes, re)) {
    return true;
  } else {
    total_required_nbytes += --required_nbytes.value;
  }

  if (mmux_flonum$1_sprint_size(&required_nbytes, im)) {
    return true;
  } else {
    total_required_nbytes += --required_nbytes.value;
  }

  /* This return value DOES account for the terminating zero character. */
  *result_required_size_p = mmux_usize(1 + total_required_nbytes);
  return false;
}
bool
mmux_flonumc$1_sprint (mmux_asciizp_t ptr, mmux_usize_t len, mmux_flonumc$1_t value)
{
  mmux_flonumc$1_part_t	re = mmux_flonumc$1_real_part(value);
  mmux_flonumc$1_part_t	im = mmux_flonumc$1_imag_part(value);
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

    rv = mmux_flonum$1_sprint(ptr, len, re);
    if (true == rv) { return rv; }

    delta  = strlen(ptr);
    ptr       += delta;
    len.value -= delta;
  }

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

    rv = mmux_flonum$1_sprint(ptr, len, im);
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
      /* We  do not  increment  it because  this  value  is no  more  needed: we  are
       * returning.
       *
       * len += 2;
       */
    } else {
      return true;
    }
  }

  return false;
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_CPLX_FLONUM_SPRINTER(fl)
DEFINE_CPLX_FLONUM_SPRINTER(db)
DEFINE_CPLX_FLONUM_SPRINTER(ldb)

DEFINE_CPLX_FLONUM_SPRINTER(f32)
DEFINE_CPLX_FLONUM_SPRINTER(f64)
DEFINE_CPLX_FLONUM_SPRINTER(f128)

DEFINE_CPLX_FLONUM_SPRINTER(f32x)
DEFINE_CPLX_FLONUM_SPRINTER(f64x)
DEFINE_CPLX_FLONUM_SPRINTER(f128x)

DEFINE_CPLX_FLONUM_SPRINTER(d32)
DEFINE_CPLX_FLONUM_SPRINTER(d64)
DEFINE_CPLX_FLONUM_SPRINTER(d128)


/** --------------------------------------------------------------------
 ** Other C language and Unix type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_ALIASED_TYPES_SPRINTER]]],[[[
bool
mmux_$1_sprint_size (mmux_usize_t *result_required_size_p, mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint_size(result_required_size_p, mmux_[[[]]]$2[[[]]](value.value));
}
bool
mmux_$1_sprint (mmux_asciizp_t strptr, mmux_usize_t len, mmux_$1_t value)
{
  return mmux_[[[]]]$2[[[]]]_sprint(strptr, len, mmux_[[[]]]$2[[[]]](value.value));
}
]]])

DEFINE_ALIASED_TYPES_SPRINTER([[[sint8]]],		[[[sint]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uint8]]],		[[[uint]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[sint16]]],		[[[sint]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uint16]]],		[[[uint]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[sint32]]],		[[[slong]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uint32]]],		[[[ulong]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[sint64]]],		[[[sintmax]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uint64]]],		[[[uintmax]]])

DEFINE_ALIASED_TYPES_SPRINTER([[[byte]]],		[[[sint8]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[octet]]],		[[[uint8]]])

DEFINE_ALIASED_TYPES_SPRINTER([[[ssize]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SSIZE]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[usize]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_USIZE]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[sintmax]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SINTMAX]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uintmax]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UINTMAX]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[sintptr]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_SINTPTR]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[uintptr]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_UINTPTR]]])

DEFINE_ALIASED_TYPES_SPRINTER([[[ptrdiff]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[off]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_OFF]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[wchar]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_WCHAR]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[wint]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_WINT]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[time]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_TIME]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[clock]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_CLOCK]]])

DEFINE_ALIASED_TYPES_SPRINTER([[[libc_mode]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_MODE]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_pid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_PID]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_uid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_UID]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_gid]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_GID]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_socklen]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_SOCKLEN]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_rlim]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_RLIM]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_ino]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_INO]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_dev]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_DEV]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_nlink]]],		[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_NLINK]]])
DEFINE_ALIASED_TYPES_SPRINTER([[[libc_blkcnt]]],	[[[MMUX_CC_TYPES_STEM_ALIAS_LIBC_BLKCNT]]])


/** --------------------------------------------------------------------
 ** Formatting exact integers with custom base.
 ** ----------------------------------------------------------------- */

/* We use the same map-to-output of the GNU Multiple Precision library.
 *                                             0         1         2         3         4         5         6
 *                                             01234567890123456789012345678901234567890123456789012345678901
 */
static char const	map_to_output[1+62] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

bool
mmux_sint64_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p,
			      bool * is_negative_p, mmux_sint64_t op, mmux_uint_t const ubase)
{
  mmux_usize_t				buflen = *buflen_p;
  constexpr mmux_standard_usize_t	maximum_buflen = 64;
  char					reverse_result[maximum_buflen];
  mmux_standard_usize_t			cipher_counter = 0;
  mmux_sint64_t				rest;
  bool					is_negative;
  auto					base = mmux_sint64(ubase.value);

  /* Validate the base argument. */
  if (mmux_sint64_less(base,    mmux_sint64_literal(2)) ||
      mmux_sint64_greater(base, mmux_sint64_literal(62))) {
    return true;
  }

  if (mmux_sint64_is_negative(op)) {
    is_negative = true;
    op = mmux_sint64_neg(op);
  } else {
    is_negative = false;
  }

  for (; (! mmux_sint64_is_zero(op)); ++cipher_counter) {
    if (cipher_counter == buflen.value) {
      /* Not enough room in output buffer. */
      return true;
    }
    rest  = mmux_sint64_modulo(op, base);
    op    = mmux_sint64_div(op, base);
    reverse_result[cipher_counter] = map_to_output[rest.value];
  }

  /* Copy in reverse from "reverse_result" to "bufptr". */
  {
    for (mmux_standard_usize_t j = cipher_counter-1, k = 0; k < cipher_counter; --j, ++k) {
      bufptr[k] = reverse_result[j];
      //dprintf(2, "%s: offset %lu, output char %c\n", __func__, k, bufptr[k]);
    }
  }

  *is_negative_p  = is_negative;
  buflen_p->value = cipher_counter;
  return false;
}
bool
mmux_uint64_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p,
			      bool * is_negative_p, mmux_uint64_t op, mmux_uint_t const ubase)
{
  mmux_usize_t				buflen = *buflen_p;
  constexpr mmux_standard_usize_t	maximum_buflen = 64;
  char					reverse_result[maximum_buflen];
  mmux_standard_usize_t			cipher_counter = 0;
  mmux_uint64_t				rest;
  auto					base = mmux_uint64(ubase.value);

  /* Validate the base argument. */
  if (mmux_uint64_less(base,    mmux_uint64_literal(2)) ||
      mmux_uint64_greater(base, mmux_uint64_literal(62))) {
    return true;
  }

  for (; (! mmux_uint64_is_zero(op)); ++cipher_counter) {
    if (cipher_counter == buflen.value) {
      /* Not enough room in output buffer. */
      return true;
    }
    rest  = mmux_uint64_modulo(op, base);
    op    = mmux_uint64_div(op, base);
    reverse_result[cipher_counter] = map_to_output[rest.value];
  }

  /* Copy in reverse from "reverse_result" to "bufptr". */
  {
    for (mmux_standard_usize_t j = cipher_counter-1, k = 0; k < cipher_counter; --j, ++k) {
      bufptr[k] = reverse_result[j];
    }
  }

  *is_negative_p  = false;
  buflen_p->value = cipher_counter;
  return false;
}

m4_divert(-1)
m4_define([[[DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p, bool * is_negative_p,
			  mmux_$1_t op, mmux_uint_t const base)
{
  return mmux_sint64_sprint_with_base(bufptr, buflen_p, is_negative_p, mmux_sint64(op.value), base);
}
]]])]]])

m4_define([[[DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE]]],[[[m4_dnl
MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p, bool * is_negative_p,
			  mmux_$1_t op, mmux_uint_t const base)
{
  return mmux_uint64_sprint_with_base(bufptr, buflen_p, is_negative_p, mmux_uint64(op.value), base);
}
]]])]]])
m4_divert(0)m4_dnl

bool
mmux_pointer_sprint_with_base (mmux_asciizp_t bufptr, mmux_usize_t * buflen_p, bool * is_negative_p,
			       mmux_pointer_t op, mmux_uint_t const base)
{
  auto	U = (mmux_standard_uintptr_t)op;

  return mmux_uint64_sprint_with_base(bufptr, buflen_p, is_negative_p, mmux_uint64(U), base);
}

m4_ifelse([[[MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4]]],[[[1]]],[[[m4_dnl
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[char]]])]]],[[[m4_dnl
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[char]]])]]])

DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[schar]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uchar]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sshort]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[ushort]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sint]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uint]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[slong]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[ulong]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sllong]]], [[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[ullong]]], [[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sint8]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uint8]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sint16]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uint16]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sint32]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uint32]]])

DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[byte]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[octet]]])

DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[ssize]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[usize]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sintmax]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uintmax]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[sintptr]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[uintptr]]])

DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[ptrdiff]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[off]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[wchar]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[wint]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[time]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[clock]]])

DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_mode]]])
DEFINE_SIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_pid]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_uid]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_gid]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_socklen]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_rlim]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_ino]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_dev]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_nlink]]])
DEFINE_UNSIGNED_INTEGER_SPRINTER_WITH_BASE([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Printers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STREAM_AND_CHANNEL_PRINTERS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
bool
mmux_$1_dprintf (mmux_standard_sint_t fd, mmux_$1_t value)
{
  mmux_usize_t	required_nbytes;

  if (mmux_$1_sprint_size(&required_nbytes, value)) {
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
  mmux_usize_t	required_nbytes;

  if (mmux_$1_sprint_size(&required_nbytes, value)) {
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
m4_divert(0)m4_dnl

/* ------------------------------------------------------------------ */

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[pointer]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[char]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[schar]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uchar]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sshort]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[ushort]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sint]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uint]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[slong]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[ulong]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sllong]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[ullong]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumfl]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumdb]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumldb]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf64]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf128]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf32x]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf64x]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumf128x]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumd32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumd64]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumd128]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcfl]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcdb]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcldb]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf64]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf128]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf32x]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf64x]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcf128x]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcd32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcd64]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[flonumcd128]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sint8]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uint8]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sint16]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uint16]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sint32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uint32]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sint64]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uint64]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[byte]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[octet]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[ssize]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[usize]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sintmax]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uintmax]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[sintptr]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[uintptr]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[off]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[ptrdiff]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[wchar]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[wint]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[time]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[clock]]])

DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_mode]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_pid]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_uid]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_gid]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_socklen]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_rlim]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_ino]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_dev]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_nlink]]])
DEFINE_STREAM_AND_CHANNEL_PRINTERS([[[libc_blkcnt]]])


/** --------------------------------------------------------------------
 ** Printers with custom base.
 ** ----------------------------------------------------------------- */

bool
mmux_sint64_dprintf_with_base (int fd, mmux_sint64_t op, mmux_uint_t const base)
{
  auto	buflen = mmux_usize_literal(64);
  char 	bufptr[buflen.value];
  bool	is_negative;

  if (mmux_sint64_sprint_with_base(bufptr, &buflen, &is_negative, op, base)) {
    return true;
  } else {
    /* The longest generated string is of 64  characters; we need a character for the
       sign; we need a character for the terminating zero. */
    char	the_string[64+1+1];
    auto	char_counter = mmux_usize_literal(0);

    the_string[char_counter.value] = (is_negative)? '-' : '+';
    char_counter = mmux_ctype_incr(char_counter);
    memcpy(the_string + char_counter.value, bufptr, buflen.value);
    char_counter = mmux_ctype_add(char_counter, buflen);
    the_string[char_counter.value] = '\0';
    if (0 > dprintf(fd, "%s", the_string)) {
      return true;
    } else {
      return false;
    }
  }
}
bool
mmux_uint64_dprintf_with_base (int fd, mmux_uint64_t op, mmux_uint_t const base)
{
  auto	buflen = mmux_usize_literal(64);
  char 	bufptr[buflen.value];
  bool	is_negative;

  if (mmux_uint64_sprint_with_base(bufptr, &buflen, &is_negative, op, base)) {
    return true;
  } else {
    /* The longest generated string is of 64  characters; we need a character for the
       sign; we need a character for the terminating zero. */
    char	the_string[64+1+1];
    auto	char_counter = mmux_usize_literal(0);

    the_string[char_counter.value] = (is_negative)? '-' : '+';
    char_counter = mmux_ctype_incr(char_counter);
    memcpy(the_string + char_counter.value, bufptr, buflen.value);
    char_counter = mmux_ctype_add(char_counter, buflen);
    the_string[char_counter.value] = '\0';
    if (0 > dprintf(fd, "%s", the_string)) {
      return true;
    } else {
      return false;
    }
  }
}

m4_divert(-1)
m4_define([[[DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_dprintf_with_base (int fd, mmux_$1_t op, mmux_uint_t const base)
{
  return mmux_sint64_dprintf_with_base(fd, mmux_sint64(op.value), base);
}
]]])]]])

m4_define([[[DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_dprintf_with_base (int fd, mmux_$1_t op, mmux_uint_t const base)
{
  return mmux_uint64_dprintf_with_base(fd, mmux_uint64(op.value), base);
}
]]])]]])
m4_divert(0)m4_dnl

bool
mmux_pointer_dprintf_with_base (int fd, mmux_pointer_t op, mmux_uint_t const base)
{
  return mmux_uintptr_dprintf_with_base(fd, mmux_uintptr((mmux_standard_uintptr_t)op), base);
}

m4_ifelse([[[MMUX_CC_TYPES_CHAR_IS_UNSIGNED_M4]]],[[[1]]],[[[m4_dnl
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[char]]])]]],[[[m4_dnl
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[char]]])]]])

DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[schar]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uchar]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sshort]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[ushort]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sint]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uint]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[slong]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[ulong]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sllong]]], [[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[ullong]]], [[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sint8]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uint8]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sint16]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uint16]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sint32]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uint32]]])

DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[byte]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[octet]]])

DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[ssize]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[usize]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sintmax]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uintmax]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[sintptr]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[uintptr]]])

DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[ptrdiff]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_mode]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[off]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_pid]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_uid]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_gid]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[wchar]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[wint]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[time]]])
DEFINE_SIGNED_INTEGER_DPRINTFER_WITH_BASE([[[clock]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_socklen]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_rlim]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_ino]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_dev]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_nlink]]])
DEFINE_UNSIGNED_INTEGER_DPRINTFER_WITH_BASE([[[libc_blkcnt]]])

/* end of file */
