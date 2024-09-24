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

static int
mmux_bash_pointers_create_global_sint_variable (char * name, int value)
{
  int		requested_nbytes;

  requested_nbytes = mmux_bash_pointers_sprint_size_sint(value);
  if (0 > requested_nbytes) {
    return EXECUTION_FAILURE;
  } else {
    SHELL_VAR *		v MMUX_BASH_POINTERS_UNUSED;
    char		str[requested_nbytes];
    /* NOTE I have found these "att_*"  flags in Bash's source code, file "variable.h";
       I do not know if I am using them correctly (Marco Maggi; Sep 11, 2024) */
    int			rv, flags = att_integer;

    rv = mmux_bash_pointers_sprint_sint(str, requested_nbytes, value);
    if (EXECUTION_SUCCESS == rv) {
      v = bind_global_variable(name, str, flags);
    } else {
      return rv;
    }
  }
  return EXECUTION_SUCCESS;
}
static void
mmux_bash_pointers_create_global_string_variable (char const * name, char * p_value)
{
  SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
  int		flags = 0;

  v = bind_global_variable(name, p_value, flags);
}
int
mmux_bash_pointers_set_ERRNO (int errnum)
{
  return mmux_bash_pointers_store_result_in_variable_sint("ERRNO", errnum);
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

m4_divert(-1)m4_dnl
m4_define([[[MMUX_DEFINE_SIZEOF_VARIABLE]]],[[[
  mmux_bash_pointers_create_global_sint_variable("mmux_libc_SIZEOF_[[[]]]mmux_toupper([[[$1]]])",
                                                 mmux_bash_pointers_sizeof_$1());
]]])

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_DEFINE_MAXIMUM_VARIABLE]]],[[[{
  mmux_libc_$1_t value = mmux_bash_pointers_maximum_$1();
  int requested_nbytes = mmux_bash_pointers_sprint_size_$1(value);

  if (0 > requested_nbytes) {
    return EXECUTION_FAILURE;
  } else {
    char	str[requested_nbytes];

    mmux_bash_pointers_sprint_maximum_$1(str, requested_nbytes);
    mmux_bash_pointers_create_global_string_variable("mmux_libc_MAX_[[[]]]mmux_toupper([[[$1]]])", str);
  }
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_DEFINE_MINIMUM_VARIABLE]]],[[[{
  mmux_libc_$1_t value = mmux_bash_pointers_minimum_$1();
  int requested_nbytes = mmux_bash_pointers_sprint_size_$1(value);

  if (0 > requested_nbytes) {
    return EXECUTION_FAILURE;
  } else {
    char	str[requested_nbytes];

    mmux_bash_pointers_sprint_minimum_$1(str, requested_nbytes);
    mmux_bash_pointers_create_global_string_variable("mmux_libc_MIN_[[[]]]mmux_toupper([[[$1]]])", str);
  }
}]]])

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_DEFINE_ERRNO_VARIABLE]]],[[[#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  mmux_bash_pointers_create_global_sint_variable("mmux_libc_$1",	$1);
#endif
]]])

/* ------------------------------------------------------------------ */
m4_divert(0)m4_dnl

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
    MMUX_DEFINE_SIZEOF_VARIABLE([[[pointer]]]);

    MMUX_DEFINE_SIZEOF_VARIABLE([[[schar]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uchar]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sshort]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[ushort]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sint]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uint]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[slong]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[ulong]]]);
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[MMUX_DEFINE_SIZEOF_VARIABLE([[[sllong]]]);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[MMUX_DEFINE_SIZEOF_VARIABLE([[[ullong]]]);]]])
    MMUX_DEFINE_SIZEOF_VARIABLE([[[float]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[double]]]);
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_LONG_DOUBLE]]],[[[MMUX_DEFINE_SIZEOF_VARIABLE([[[ldouble]]]);]]])
    MMUX_DEFINE_SIZEOF_VARIABLE([[[complexf]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[complexd]]]);
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_LONG_DOUBLE]]],[[[MMUX_DEFINE_SIZEOF_VARIABLE([[[complexld]]]);]]])

    MMUX_DEFINE_SIZEOF_VARIABLE([[[sint8]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uint8]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sint16]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uint16]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sint32]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uint32]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sint64]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uint64]]]);

    MMUX_DEFINE_SIZEOF_VARIABLE([[[ssize]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[usize]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sintmax]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uintmax]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[sintptr]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uintptr]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[ptrdiff]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[mode]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[off]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[pid]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[uid]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[gid]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[wchar]]]);
    MMUX_DEFINE_SIZEOF_VARIABLE([[[wint]]]);
  }
  {
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[pointer]]]);

    MMUX_DEFINE_MAXIMUM_VARIABLE([[[schar]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uchar]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sshort]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[ushort]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sint]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uint]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[slong]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[ulong]]]);
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[MMUX_DEFINE_MAXIMUM_VARIABLE([[[sllong]]]);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[MMUX_DEFINE_MAXIMUM_VARIABLE([[[ullong]]]);]]])
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[float]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[double]]]);
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_LONG_DOUBLE]]],[[[MMUX_DEFINE_MAXIMUM_VARIABLE([[[ldouble]]]);]]])

    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sint8]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uint8]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sint16]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uint16]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sint32]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uint32]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sint64]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uint64]]]);

    MMUX_DEFINE_MAXIMUM_VARIABLE([[[ssize]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[usize]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sintmax]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uintmax]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[sintptr]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uintptr]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[ptrdiff]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[mode]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[off]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[pid]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[uid]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[gid]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[wchar]]]);
    MMUX_DEFINE_MAXIMUM_VARIABLE([[[wint]]]);
  }
  {
    MMUX_DEFINE_MINIMUM_VARIABLE([[[pointer]]]);

    MMUX_DEFINE_MINIMUM_VARIABLE([[[schar]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uchar]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sshort]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[ushort]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sint]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uint]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[slong]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[ulong]]]);
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[MMUX_DEFINE_MINIMUM_VARIABLE([[[sllong]]]);]]])
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[MMUX_DEFINE_MINIMUM_VARIABLE([[[ullong]]]);]]])
    MMUX_DEFINE_MINIMUM_VARIABLE([[[float]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[double]]]);
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_LONG_DOUBLE]]],[[[MMUX_DEFINE_MINIMUM_VARIABLE([[[ldouble]]]);]]])

    MMUX_DEFINE_MINIMUM_VARIABLE([[[sint8]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uint8]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sint16]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uint16]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sint32]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uint32]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sint64]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uint64]]]);

    MMUX_DEFINE_MINIMUM_VARIABLE([[[ssize]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[usize]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sintmax]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uintmax]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[sintptr]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uintptr]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[ptrdiff]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[mode]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[off]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[pid]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[uid]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[gid]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[wchar]]]);
    MMUX_DEFINE_MINIMUM_VARIABLE([[[wint]]]);
  }
  {
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPERM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOENT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESRCH]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EINTR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EIO]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENXIO]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[E2BIG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOEXEC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADF]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECHILD]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EAGAIN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOMEM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EACCES]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EFAULT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTBLK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBUSY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EEXIST]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EXDEV]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENODEV]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTDIR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EISDIR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EINVAL]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENFILE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EMFILE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTTY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ETXTBSY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EFBIG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOSPC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESPIPE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EROFS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EMLINK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPIPE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDOM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ERANGE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDEADLK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENAMETOOLONG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOLCK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOSYS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTEMPTY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELOOP]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EWOULDBLOCK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOMSG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EIDRM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECHRNG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EL2NSYNC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EL3HLT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EL3RST]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELNRNG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EUNATCH]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOCSI]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EL2HLT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EXFULL]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOANO]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADRQC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADSLT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDEADLOCK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBFONT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOSTR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENODATA]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ETIME]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOSR]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENONET]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOPKG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EREMOTE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOLINK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EADV]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESRMNT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECOMM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPROTO]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EMULTIHOP]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDOTDOT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADMSG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EOVERFLOW]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTUNIQ]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EBADFD]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EREMCHG]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELIBACC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELIBBAD]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELIBSCN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELIBMAX]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ELIBEXEC]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EILSEQ]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ERESTART]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESTRPIPE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EUSERS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTSOCK]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDESTADDRREQ]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EMSGSIZE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPROTOTYPE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOPROTOOPT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPROTONOSUPPORT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESOCKTNOSUPPORT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EOPNOTSUPP]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EPFNOSUPPORT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EAFNOSUPPORT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EADDRINUSE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EADDRNOTAVAIL]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENETDOWN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENETUNREACH]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENETRESET]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECONNABORTED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECONNRESET]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOBUFS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EISCONN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTCONN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESHUTDOWN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ETOOMANYREFS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ETIMEDOUT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECONNREFUSED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EHOSTDOWN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EHOSTUNREACH]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EALREADY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EINPROGRESS]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ESTALE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EUCLEAN]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTNAM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENAVAIL]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EISNAM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EREMOTEIO]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EDQUOT]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOMEDIUM]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EMEDIUMTYPE]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ECANCELED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOKEY]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EKEYEXPIRED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EKEYREVOKED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EKEYREJECTED]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[EOWNERDEAD]]]);
    MMUX_DEFINE_ERRNO_VARIABLE([[[ENOTRECOVERABLE]]]);
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
