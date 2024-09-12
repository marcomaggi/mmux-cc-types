/*
  Part of: MMUX Bash Pointers
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
mmux_bash_pointers_create_global_sint_variable (const char * name, int value)
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
mmux_bash_pointers_library_init_builtin (WORD_LIST * list MMUX_BASH_POINTERS_UNUSED)
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
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_POINTER",		sizeof(void *));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SCHAR",		sizeof(signed char));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UCHAR",		sizeof(unsigned char));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SINT",		sizeof(signed int));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINT",		sizeof(unsigned int));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SLONG",		sizeof(signed long));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_ULONG",		sizeof(unsigned long));
#if (HAVE_LONG_LONG_INT)
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SLLONG",		sizeof(signed long long));
#endif
#if (HAVE_UNSIGNED_LONG_LONG_INT)
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_ULLONG",		sizeof(unsigned long long));
#endif
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_FLOAT",		sizeof(float));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_DOUBLE",		sizeof(double));
#if (HAVE_LONG_DOUBLE)
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_LDOUBLE",		sizeof(long double));
#endif

    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SINT8",		sizeof(int8_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINT8",		sizeof(uint8_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SINT16",		sizeof(int16_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINT16",		sizeof(uint16_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SINT32",		sizeof(int32_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINT32",		sizeof(uint32_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SINT64",		sizeof(int64_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINT64",		sizeof(uint64_t));

    mmux_bash_pointers_create_global_sint_variable("SIZEOF_USIZE",		sizeof(size_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_SSIZE",		sizeof(ssize_t));

    mmux_bash_pointers_create_global_sint_variable("SIZEOF_INTMAX",		sizeof(intmax_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_INTPTR",		sizeof(intptr_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UINTPTR",		sizeof(uintptr_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_PTRDIFF",		sizeof(ptrdiff_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_MODE",		sizeof(mode_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_OFF",		sizeof(off_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_PID",		sizeof(pid_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_UID",		sizeof(uid_t));
    mmux_bash_pointers_create_global_sint_variable("SIZEOF_GID",		sizeof(gid_t));
  }
  return EXECUTION_SUCCESS;
}
static char * mmux_bash_pointers_library_init_doc[] = {
  "Initialise the library.",
  (char *)NULL
};
struct builtin mmux_bash_pointers_library_init_struct = {
  .name		= "mmux_bash_pointers_library_init",	/* Builtin name */
  .function	= mmux_bash_pointers_library_init_builtin,	/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,			/* Initial flags for builtin */
  .long_doc	= mmux_bash_pointers_library_init_doc,	/* Array of long documentation strings. */
  .short_doc	= "mmux_bash_pointers_library_init",	/* Usage synopsis; becomes short_doc */
  .handle	= 0					/* Reserved for internal use */
};

/* end of file */
