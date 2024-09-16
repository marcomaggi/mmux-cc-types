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
  /* NOTE I have found these "att_*"  flags in Bash's source code, file "variable.h";
     I do not know if I am using them correctly (Marco Maggi; Sep 11, 2024) */
  int		flags = att_integer;

  snprintf(str, LEN, "%d", value);
  v = bind_global_variable(name, str, flags);
}
int
mmux_bash_pointers_set_ERRNO (int errnum)
{
  SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
  /* NOTE I have found these "att_*"  flags in Bash's source code, file "variable.h";
     I do not know if I am using them correctly (Marco Maggi; Sep 11, 2024) */
  int		flags = att_integer;
#undef  LEN
#define LEN	32
  char	str[LEN];

  mmux_bash_pointers_sprint_sint(str, LEN, errnum);
  v = bind_variable("ERRNO", str, flags);
  return EXECUTION_SUCCESS;
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

m4_define([[[MMUX_DEFINE_ERRNO_VARIABLE]]],[[[
#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  mmux_bash_pointers_create_global_sint_variable("libc_$1",	$1);
#endif
]]])

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
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_POINTER",	sizeof(void *));

    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SCHAR",		sizeof(signed char));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UCHAR",		sizeof(unsigned char));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SSHORT",	sizeof(signed short int));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_USHORT",	sizeof(unsigned short int));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINT",		sizeof(signed int));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINT",		sizeof(unsigned int));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SLONG",		sizeof(signed long));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_ULONG",		sizeof(unsigned long));
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SLLONG",	sizeof(signed long long));
#endif
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_ULLONG",	sizeof(unsigned long long));
#endif
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_FLOAT",		sizeof(float));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_DOUBLE",	sizeof(double));
#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_LDOUBLE",	sizeof(long double));
#endif

    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINT8",		sizeof(int8_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINT8",		sizeof(uint8_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINT16",	sizeof(int16_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINT16",	sizeof(uint16_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINT32",	sizeof(int32_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINT32",	sizeof(uint32_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINT64",	sizeof(int64_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINT64",	sizeof(uint64_t));

    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_USIZE",		sizeof(size_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SSIZE",		sizeof(ssize_t));

    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_SINTMAX",	sizeof(intmax_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINTMAX",	sizeof(uintmax_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_sINTPTR",	sizeof(intptr_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UINTPTR",	sizeof(uintptr_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_PTRDIFF",	sizeof(ptrdiff_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_MODE",		sizeof(mode_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_OFF",		sizeof(off_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_PID",		sizeof(pid_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_UID",		sizeof(uid_t));
    mmux_bash_pointers_create_global_sint_variable("libc_SIZEOF_GID",		sizeof(gid_t));

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
