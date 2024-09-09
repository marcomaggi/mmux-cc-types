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
  char		str[1024];
  /* NOTE I do not know what FLAGS is for, but setting it to zero seems fine.  (Marco
     Maggi; Sep 4, 2024) */
  int		flags = 0;

  snprintf(str, 1024, "%d", value);
  v = bind_global_variable(name, str, flags);
}


/** --------------------------------------------------------------------
 ** Type parsers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_parse_pointer (void ** p_data, char const * s_arg, char const * caller_name)
{
  int	rv;

  rv = sscanf(s_arg, "%p", p_data);
  if ((EOF != rv) && (1 == rv)) {
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected pointer: \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
}

m4_define([[[MMUX_BASH_POINTERS_DEFINE_PARSER]]],[[[
int
mmux_bash_pointers_parse_$1 ($2 * p_data, char const * s_arg, char const * caller_name)
{
  int	rv;

  /* NOTE I  know that to convert  integers there are functions  like "strtol()", but
     let's not be picky.  (Marco Maggi; Sep 9, 2024) */
  rv = sscanf(s_arg, $3, p_data);
  if ((EOF != rv) && (1 == rv)) {
    return EXECUTION_SUCCESS;
  } else {
    fprintf(stderr, "%s: error: invalid argument, expected $2: \"%s\"\n", caller_name, s_arg);
    return EXECUTION_FAILURE;
  }
}
]]])

/* To parse schar and uchar let's just use sint and check the boundaries. */
MMUX_BASH_POINTERS_DEFINE_PARSER([[[sint]]],	[[[signed int]]],	[[["%d"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[uint]]],	[[[unsigned int]]],	[[["%u"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[slong]]],	[[[signed long]]],	[[["%ld"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ulong]]],	[[[unsigned long]]],	[[["%lu"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ssize]]],	[[[ssize_t]]],		[[["%ld"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[usize]]],	[[[size_t]]],		[[["%lu"]]])

MMUX_BASH_POINTERS_DEFINE_PARSER([[[float]]],	[[[float]]],		[[["%f"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[double]]],	[[[double]]],		[[["%lf"]]])
MMUX_BASH_POINTERS_DEFINE_PARSER([[[ldouble]]],	[[[long double]]],	[[["%Lf"]]])


/** --------------------------------------------------------------------
 ** Type printers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_print_pointer (void * data)
{
  printf("%p", data);
  return EXECUTION_SUCCESS;
}
int
mmux_bash_pointers_print_usize (size_t data)
{
  printf("%lu", data);
  return EXECUTION_SUCCESS;
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

static int
mmuxbashpointersinit_builtin (WORD_LIST * list MMUX_BASH_POINTERS_UNUSED)
{
  /* These constants are defined by the Standard C Library; we make them available as
     global shell variables. */
  {
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SCHAR",		sizeof(signed char));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UCHAR",		sizeof(unsigned char));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SINT",		sizeof(signed int));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_UINT",		sizeof(unsigned int));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_SLONG",		sizeof(signed long));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_ULONG",		sizeof(unsigned long));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_FLOAT",		sizeof(float));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_DOUBLE",		sizeof(double));
    mmux_bash_pointers_create_global_double_variable("SIZEOF_LDOUBLE",		sizeof(long double));
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
