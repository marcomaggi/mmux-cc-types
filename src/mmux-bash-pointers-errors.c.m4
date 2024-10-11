/*
  Part of: MMUX Bash Pointers
  Contents: implementation of error builtins
  Date: Sep 12, 2024

  Abstract

	This module implements error builtins.

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

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Standard error management.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strerror]]])
{
  int		rv, errnum;
  char *	errmsg;

  rv = mmux_sint_parse(&errnum, argv[2], MMUX_BUILTIN_NAME_STR);
  if (MMUX_SUCCESS != rv) { return rv; }

  errmsg = strerror(errnum);
  if (0) {fprintf(stderr, "%s: errnum=%d, message=\"%s\"\n", __func__, errnum, errmsg);}

  return mmux_bash_store_string_in_variable(argv[1], errmsg, MMUX_BUILTIN_NAME_STR);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_strerror]]],
    [[[(3 == argc)]]],
    [[["mmux_libc_strerror MSGVAR ERRNUM"]]],
    [[["Store in MSGVAR the error message corresponding to ERRNUM."]]])


m4_define([[[MMUX_DEFINE_ERRNO_CASE]]],[[[
#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  if ($1 == errnum) {
    errsym = "$1";
  } else
#endif
]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_errno_to_string]]])
{
  int		rv, errnum;
  char *	errsym;

  rv = mmux_sint_parse(&errnum, argv[2], MMUX_BUILTIN_NAME_STR);
  if (MMUX_SUCCESS != rv) { return rv; }

  errsym = strerror(errnum);
  if (0) {fprintf(stderr, "%s: errnum=%d, message=\"%s\"\n", __func__, errnum, errsym);}

  /* We use this chain of ifs rather  than a big switch because the compile complains
     if  there  are  cases with  the  same  constant;  using  ifs we  only  get  some
     warnings. */
  MMUX_DEFINE_ERRNO_CASE([[[EPERM]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOENT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESRCH]]])
  MMUX_DEFINE_ERRNO_CASE([[[EINTR]]])
  MMUX_DEFINE_ERRNO_CASE([[[EIO]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENXIO]]])
  MMUX_DEFINE_ERRNO_CASE([[[E2BIG]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOEXEC]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADF]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECHILD]]])
  MMUX_DEFINE_ERRNO_CASE([[[EAGAIN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOMEM]]])
  MMUX_DEFINE_ERRNO_CASE([[[EACCES]]])
  MMUX_DEFINE_ERRNO_CASE([[[EFAULT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTBLK]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBUSY]]])
  MMUX_DEFINE_ERRNO_CASE([[[EEXIST]]])
  MMUX_DEFINE_ERRNO_CASE([[[EXDEV]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENODEV]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTDIR]]])
  MMUX_DEFINE_ERRNO_CASE([[[EISDIR]]])
  MMUX_DEFINE_ERRNO_CASE([[[EINVAL]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENFILE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EMFILE]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTTY]]])
  MMUX_DEFINE_ERRNO_CASE([[[ETXTBSY]]])
  MMUX_DEFINE_ERRNO_CASE([[[EFBIG]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOSPC]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESPIPE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EROFS]]])
  MMUX_DEFINE_ERRNO_CASE([[[EMLINK]]])
  MMUX_DEFINE_ERRNO_CASE([[[EPIPE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDOM]]])
  MMUX_DEFINE_ERRNO_CASE([[[ERANGE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDEADLK]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENAMETOOLONG]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOLCK]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOSYS]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTEMPTY]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELOOP]]])
  MMUX_DEFINE_ERRNO_CASE([[[EWOULDBLOCK]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOMSG]]])
  MMUX_DEFINE_ERRNO_CASE([[[EIDRM]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECHRNG]]])
  MMUX_DEFINE_ERRNO_CASE([[[EL2NSYNC]]])
  MMUX_DEFINE_ERRNO_CASE([[[EL3HLT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EL3RST]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELNRNG]]])
  MMUX_DEFINE_ERRNO_CASE([[[EUNATCH]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOCSI]]])
  MMUX_DEFINE_ERRNO_CASE([[[EL2HLT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADR]]])
  MMUX_DEFINE_ERRNO_CASE([[[EXFULL]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOANO]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADRQC]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADSLT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDEADLOCK]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBFONT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOSTR]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENODATA]]])
  MMUX_DEFINE_ERRNO_CASE([[[ETIME]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOSR]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENONET]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOPKG]]])
  MMUX_DEFINE_ERRNO_CASE([[[EREMOTE]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOLINK]]])
  MMUX_DEFINE_ERRNO_CASE([[[EADV]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESRMNT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECOMM]]])
  MMUX_DEFINE_ERRNO_CASE([[[EPROTO]]])
  MMUX_DEFINE_ERRNO_CASE([[[EMULTIHOP]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDOTDOT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADMSG]]])
  MMUX_DEFINE_ERRNO_CASE([[[EOVERFLOW]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTUNIQ]]])
  MMUX_DEFINE_ERRNO_CASE([[[EBADFD]]])
  MMUX_DEFINE_ERRNO_CASE([[[EREMCHG]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELIBACC]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELIBBAD]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELIBSCN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELIBMAX]]])
  MMUX_DEFINE_ERRNO_CASE([[[ELIBEXEC]]])
  MMUX_DEFINE_ERRNO_CASE([[[EILSEQ]]])
  MMUX_DEFINE_ERRNO_CASE([[[ERESTART]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESTRPIPE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EUSERS]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTSOCK]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDESTADDRREQ]]])
  MMUX_DEFINE_ERRNO_CASE([[[EMSGSIZE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EPROTOTYPE]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOPROTOOPT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EPROTONOSUPPORT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESOCKTNOSUPPORT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EOPNOTSUPP]]])
  MMUX_DEFINE_ERRNO_CASE([[[EPFNOSUPPORT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EAFNOSUPPORT]]])
  MMUX_DEFINE_ERRNO_CASE([[[EADDRINUSE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EADDRNOTAVAIL]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENETDOWN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENETUNREACH]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENETRESET]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECONNABORTED]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECONNRESET]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOBUFS]]])
  MMUX_DEFINE_ERRNO_CASE([[[EISCONN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTCONN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESHUTDOWN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ETOOMANYREFS]]])
  MMUX_DEFINE_ERRNO_CASE([[[ETIMEDOUT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECONNREFUSED]]])
  MMUX_DEFINE_ERRNO_CASE([[[EHOSTDOWN]]])
  MMUX_DEFINE_ERRNO_CASE([[[EHOSTUNREACH]]])
  MMUX_DEFINE_ERRNO_CASE([[[EALREADY]]])
  MMUX_DEFINE_ERRNO_CASE([[[EINPROGRESS]]])
  MMUX_DEFINE_ERRNO_CASE([[[ESTALE]]])
  MMUX_DEFINE_ERRNO_CASE([[[EUCLEAN]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTNAM]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENAVAIL]]])
  MMUX_DEFINE_ERRNO_CASE([[[EISNAM]]])
  MMUX_DEFINE_ERRNO_CASE([[[EREMOTEIO]]])
  MMUX_DEFINE_ERRNO_CASE([[[EDQUOT]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOMEDIUM]]])
  MMUX_DEFINE_ERRNO_CASE([[[EMEDIUMTYPE]]])
  MMUX_DEFINE_ERRNO_CASE([[[ECANCELED]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOKEY]]])
  MMUX_DEFINE_ERRNO_CASE([[[EKEYEXPIRED]]])
  MMUX_DEFINE_ERRNO_CASE([[[EKEYREVOKED]]])
  MMUX_DEFINE_ERRNO_CASE([[[EKEYREJECTED]]])
  MMUX_DEFINE_ERRNO_CASE([[[EOWNERDEAD]]])
  MMUX_DEFINE_ERRNO_CASE([[[ENOTRECOVERABLE]]])
  {
    return MMUX_FAILURE;
  }

  return mmux_bash_store_string_in_variable(argv[1], errsym, MMUX_BUILTIN_NAME_STR);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_libc_errno_to_string]]],
    [[[(3 == argc)]]],
    [[["mmux_libc_errno_to_string SYMVAR ERRNUM"]]],
    [[["Store in SYMVAR a string representation of the errno code ERRNUM."]]])

/* end of file */
