/*
  Part of: MMUX Bash Libc Mathematics
  Contents: library functions
  Date: Sep  9, 2024

  Abstract

	This module implements library initialisation and version numbers inspection.

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
static regex_t mmux_bash_pointers_complex_rex;


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

char const *
mmux_bash_pointers_version_string (void)
{
  return mmux_bash_pointers_VERSION_INTERFACE_STRING;
}
int
mmux_bash_pointers_version_interface_current (void)
{
  return mmux_bash_pointers_VERSION_INTERFACE_CURRENT;
}
int
mmux_bash_pointers_version_interface_revision (void)
{
  return mmux_bash_pointers_VERSION_INTERFACE_REVISION;
}
int
mmux_bash_pointers_version_interface_age (void)
{
  return mmux_bash_pointers_VERSION_INTERFACE_AGE;
}


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

void
mmux_bash_pointers_create_global_double_variable (const char * name, int value)
{
  SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
#undef  LEN
#define LEN	64
  char		str[LEN];
  /* NOTE I do not know what FLAGS is for, but setting it to zero seems fine.  (Marco
     Maggi; Sep 4, 2024) */
  int		flags = 0;

  snprintf(str, LEN, "%d", value);
  v = bind_global_variable(name, str, flags);
}


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
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ldouble]]],	[[[long double]]],		[[["%Lf"]]],  [[[HAVE_UNSIGNED_LONG_LONG_INT]]])


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
 ** Type string printers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_SPRINT]]],[[[
int
mmux_bash_pointers_sprint_[[[]]]$1 (char * strptr, size_t len, $2 value)
{
#if ($4)
  snprintf(strptr, len, $3, value);
  return EXECUTION_SUCCESS;
#else
  fprintf(stderr, "MMUX Bash Pointers: error: printer \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
]]])

MMUX_BASH_POINTERS_DEFINE_SPRINT([[[pointer]]],		[[[void *]]],			[[["%p"]]],   [[[1]]])

MMUX_BASH_POINTERS_DEFINE_SPRINT([[[schar]]],		[[[signed char]]],		[[["%d"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[uchar]]],		[[[unsigned char]]],		[[["%u"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[sint]]],		[[[signed int]]],		[[["%d"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[uint]]],		[[[unsigned int]]],		[[["%u"]]],   [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[slong]]],		[[[signed long]]],		[[["%ld"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[ulong]]],		[[[unsigned long]]],		[[["%lu"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[sllong]]],		[[[signed long long]]],		[[["%lld"]]], [[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[ullong]]],		[[[unsigned long long]]],	[[["%llu"]]], [[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_SPRINT([[[ssize]]],		[[[ssize_t]]],			[[["%ld"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[usize]]],		[[[size_t]]],			[[["%lu"]]],  [[[1]]])

MMUX_BASH_POINTERS_DEFINE_SPRINT([[[double]]],		[[[double]]],			[[["%lf"]]],  [[[1]]])
MMUX_BASH_POINTERS_DEFINE_SPRINT([[[ldouble]]],		[[[long double]]],		[[["%Lf"]]],  [[[HAVE_LONG_DOUBLE]]])

int
mmux_bash_pointers_sprint_float (char * strptr, size_t len, float value)
{
  snprintf(strptr, len, "%f", (double)value);
  return EXECUTION_SUCCESS;
}
int
mmux_bash_pointers_sprint_complex (char * strptr, size_t len, double complex value)
{
  double	re = creal(value), im = cimag(value);

  snprintf(strptr, len, "(%lf)+i*(%lf)", re, im);
  return EXECUTION_SUCCESS;
}


/** --------------------------------------------------------------------
 ** Type string printers: int8.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_sprint_sint8 (char * strptr, size_t len, int8_t value)
{
  return mmux_bash_pointers_sprint_sint(strptr, len, (signed int)value);
}
int
mmux_bash_pointers_sprint_uint8 (char * strptr, size_t len, uint8_t value)
{
  return mmux_bash_pointers_sprint_uint(strptr, len, (unsigned int)value);
}


/** --------------------------------------------------------------------
 ** Type string printers: int16.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_sprint_sint16 (char * strptr, size_t len, int16_t value)
{
  return mmux_bash_pointers_sprint_sint(strptr, len, (signed int)value);
}
int
mmux_bash_pointers_sprint_uint16 (char * strptr, size_t len, uint16_t value)
{
  return mmux_bash_pointers_sprint_uint(strptr, len, (unsigned int)value);
}


/** --------------------------------------------------------------------
 ** Type string printers: int32.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_sprint_sint32 (char * strptr, size_t len, int32_t value)
{
  return mmux_bash_pointers_sprint_slong(strptr, len, (signed long int)value);
}
int
mmux_bash_pointers_sprint_uint32 (char * strptr, size_t len, uint32_t value)
{
  return mmux_bash_pointers_sprint_ulong(strptr, len, (unsigned long int)value);
}


/** --------------------------------------------------------------------
 ** Type string printers: int64.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_sprint_sint64 (char * strptr, size_t len, int64_t value)
{
#if (HAVE_LONG_LONG_INT)
  return mmux_bash_pointers_sprint_sllong(strptr, len, (signed long long int)value);
#else
  fprintf(stderr, "MMUX Bash Pointers: error: printer \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
int
mmux_bash_pointers_sprint_uint64 (char * strptr, size_t len, uint64_t value)
{
#if (HAVE_UNSIGNED_LONG_LONG_INT)
  return mmux_bash_pointers_sprint_ullong(strptr, len, (unsigned long long int)value);
#else
  fprintf(stderr, "MMUX Bash Pointers: error: printer \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}


/** --------------------------------------------------------------------
 ** Type stdout printers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_print_pointer (void * data)
{
  int	rv = printf("%p", data);
  return (0 < rv)? EXECUTION_SUCCESS : EXECUTION_FAILURE;
}
int
mmux_bash_pointers_print_usize (size_t data)
{
  int	rv = printf("%lu", data);
  return (0 < rv)? EXECUTION_SUCCESS : EXECUTION_FAILURE;
}
int
mmux_bash_pointers_print_complex (double complex data)
{
  double	data_re = creal(data), data_im = cimag(data);
  int		rv;

  if (0.0 == data_im) {
    rv = printf("%lf", data_re);
    return (0 < rv)? EXECUTION_SUCCESS : EXECUTION_FAILURE;
  } else {
    rv = printf("(%lf)+i*(%lf)", data_re, data_im);
    return (0 < rv)? EXECUTION_SUCCESS : EXECUTION_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

static int
mmuxbashpointersinit_builtin (WORD_LIST * list MMUX_BASH_POINTERS_UNUSED)
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
    int	rv = regcomp(&mmux_bash_pointers_complex_rex, "^(\\([^)]\\+\\))+i\\*(\\([^)]\\+\\))$", 0);
    if (rv) {
      fprintf(stderr, "MMUX Bash Pointers: internal error: compiling regular expression\n");
      return EXECUTION_FAILURE;
    }
  }

  /* These constants are defined by the Standard C Library; we make them available as
     global shell variables. */
  {
    mmux_bash_pointers_create_global_double_variable("SIZEOF_POINTER",		sizeof(void *));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SCHAR",		sizeof(signed char));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UCHAR",		sizeof(unsigned char));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT",		sizeof(signed int));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT",		sizeof(unsigned int));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SLONG",		sizeof(signed long));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_ULONG",		sizeof(unsigned long));
#if (HAVE_LONG_LONG_INT)
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SLLONG",		sizeof(signed long long));
#endif
#if (HAVE_UNSIGNED_LONG_LONG_INT)
    mmux_bash_pointers_create_global_double_variable("SIZEOF_ULLONG",		sizeof(unsigned long long));
#endif
    mmux_bash_pointers_create_global_double_variable("SIZEOF_FLOAT",		sizeof(float));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_DOUBLE",		sizeof(double));
#if (HAVE_LONG_DOUBLE)
    mmux_bash_pointers_create_global_double_variable("SIZEOF_LDOUBLE",		sizeof(long double));
#endif

    mmux_bash_pointers_create_global_double_variable("SIZEOF_SSIZE",		sizeof(ssize_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_USIZE",		sizeof(size_t));

    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT8",		sizeof(int8_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT8",		sizeof(uint8_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT16",		sizeof(int16_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT16",		sizeof(uint16_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT32",		sizeof(int32_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT32",		sizeof(uint32_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT64",		sizeof(int64_t));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT64",		sizeof(uint64_t));
  }
  return EXECUTION_SUCCESS;
}
static char * mmuxbashpointersinit_doc[] = {
  "Initialise the library.",
  (char *)NULL
};
struct builtin mmuxbashpointersinit_struct = {
  .name		= "mmuxbashpointersinit",		/* Builtin name */
  .function	= mmuxbashpointersinit_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,			/* Initial flags for builtin */
  .long_doc	= mmuxbashpointersinit_doc,		/* Array of long documentation strings. */
  .short_doc	= "mmuxbashpointersinit",		/* Usage synopsis; becomes short_doc */
  .handle	= 0					/* Reserved for internal use */
};

/* end of file */
