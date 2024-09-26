# @configure_input@
#

AC_PREREQ([2.72])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.1])
AC_INIT([MMUX Bash Pointers],[MMUX_PACKAGE_VERSION],
  [mrc.mgg@gmail.com],
  [mmux-bash-pointers],[https://github.com/marcomaggi/mmux-bash-pointers])
MMUX_INIT
MMUX_LIBTOOL_LIBRARY_VERSIONS([mmux_bash_pointers],1,0,0)
AC_REVISION([0.1])
AC_COPYRIGHT([Copyright (c) 2024 Marco Maggi <mrc.mgg@gmail.com>

This program is free software: you  can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by
the Free  Software Foundation, either version  3 of the License,  or (at
your option) any later version.

This program  is distributed  in the  hope that it  will be  useful, but
WITHOUT   ANY   WARRANTY;  without   even   the   implied  warranty   of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
])
AC_CONFIG_SRCDIR([src/])
AC_CONFIG_MACRO_DIR([meta/autotools])
AC_CONFIG_AUX_DIR([meta/autotools])
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([1.17 foreign subdir-objects])
AM_MAINTAINER_MODE

AM_PROG_AR
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

LT_PREREQ([2.4])
LT_INIT


#### basic system inspection

MMUX_CHECK_TARGET_OS
AX_IS_RELEASE([git-directory])

AC_LANG([C])
MMUX_LANG_C11

AM_PROG_AS
AM_PROG_CC_C_O
MMUX_BASH_CHECK_COMMON_HEADERS
AC_CHECK_HEADERS([regex.h])
AC_PATH_PROG([M4_PROGRAM],[m4])
AC_PATH_PROG([BASH_PROGRAM],[/bin/bash],[/bin/bash],[:])
MMUX_BASH_ENABLE_MBFL([v3.0.0])

AC_DEFINE([_ISOC11_SOURCE],[1],[Enable the ISO C11 features.])

# NOTE I am  an ignorant bull; I know  nothing; I understand nothing.  Apparently  defining these is
# needed for  the GNU C  Library to  make available the  "_FloatN" and "_FloatNx"  features.  (Marco
# Maggi; Sep 26, 2024)
AC_DEFINE([__STDC_WANT_IEC_60559_BFP_EXT__],   [1],[Define some standardised features.])
AC_DEFINE([__STDC_WANT_IEC_60559_FUNCS_EXT__], [1],[Define some standardised features.])
AC_DEFINE([__STDC_WANT_IEC_60559_TYPES_EXT__], [1],[Define some standardised features.])

AC_DEFINE([_GNU_SOURCE],[1],[Enable everything GNU (is this actually needed?).])
AC_DEFINE([_POSIX_C_SOURCE],[200809L],[Enable latest(?) POSIX features.])

AC_CACHE_SAVE


#### check for C language types

AC_TYPE_LONG_LONG_INT
AC_TYPE_UNSIGNED_LONG_LONG_INT
AC_TYPE_LONG_DOUBLE

AC_TYPE_INT8_T
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_UINT8_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T

AC_TYPE_MODE_T
AC_TYPE_OFF_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_TYPE_INTMAX_T
AC_TYPE_INTPTR_T

# This defines both "uid_t" and "gid_t".
AC_TYPE_UID_T

AC_CHECK_FUNC([strtof32],   [AC_DEFINE([HAVE_FLOAT32],  [1],[Defined if _Float32 is implemented.])])
AC_CHECK_FUNC([strtof64],   [AC_DEFINE([HAVE_FLOAT64],  [1],[Defined if _Float64 is implemented.])])
AC_CHECK_FUNC([strtof128],  [AC_DEFINE([HAVE_FLOAT128], [1],[Defined if _Float128 is implemented.])])

AC_CHECK_FUNC([strtof32x],  [AC_DEFINE([HAVE_FLOAT32X], [1],[Defined if _Float32x is implemented.])])
AC_CHECK_FUNC([strtof64x],  [AC_DEFINE([HAVE_FLOAT64X], [1],[Defined if _Float64x is implemented.])])
AC_CHECK_FUNC([strtof128x], [AC_DEFINE([HAVE_FLOAT128X],[1],[Defined if _Float128x is implemented.])])


#### checks for library functions

dnl AC_FUNC_MALLOC
dnl AC_FUNC_MEMCMP

dnl AC_CACHE_SAVE


#### inspecting standard C language types

MMUX_BASH_TYPE_DETERMINE_RAW_STANDARD_C_LANGUAGE_TYPES_SIZEOF
MMUX_BASH_TYPE_DETERMINE_TYPEDEF_STANDARD_C_LANGUAGE_TYPES_SIZEOF
MMUX_BASH_TYPE_DETERMINE_CUSTOM_C_LANGUAGE_INTEGER_ALIASES


#### inspecting errno constants

AC_DEFUN([MMUX_ERRNO_TEST],[MMUX_DEFINE_VALUEOF_TEST([$1],[$1],MMUX_BASH_COMMON_INCLUDES_FOR_TESTS)])
AC_DEFUN([MMUX_ERRNO_TESTS],[m4_map_args_w($1,[MMUX_ERRNO_TEST(],[)])])

MMUX_ERRNO_TESTS([EPERM ENOENT ESRCH EINTR EIO ENXIO E2BIG ENOEXEC EBADF ECHILD EAGAIN ENOMEM
                  EACCES EFAULT ENOTBLK EBUSY EEXIST EXDEV ENODEV ENOTDIR EISDIR EINVAL ENFILE
                  EMFILE ENOTTY ETXTBSY EFBIG ENOSPC ESPIPE EROFS EMLINK EPIPE EDOM ERANGE EDEADLK
                  ENAMETOOLONG ENOLCK ENOSYS ENOTEMPTY ELOOP EWOULDBLOCK ENOMSG EIDRM ECHRNG
                  EL2NSYNC EL3HLT EL3RST ELNRNG EUNATCH ENOCSI EL2HLT EBADE EBADR EXFULL ENOANO
                  EBADRQC EBADSLT EDEADLOCK EBFONT ENOSTR ENODATA ETIME ENOSR ENONET ENOPKG EREMOTE
                  ENOLINK EADV ESRMNT ECOMM EPROTO EMULTIHOP EDOTDOT EBADMSG EOVERFLOW ENOTUNIQ EBADFD
                  EREMCHG ELIBACC ELIBBAD ELIBSCN ELIBMAX ELIBEXEC EILSEQ ERESTART ESTRPIPE EUSERS ENOTSOCK
                  EDESTADDRREQ EMSGSIZE EPROTOTYPE ENOPROTOOPT EPROTONOSUPPORT ESOCKTNOSUPPORT EOPNOTSUPP
                  EPFNOSUPPORT EAFNOSUPPORT EADDRINUSE EADDRNOTAVAIL ENETDOWN ENETUNREACH ENETRESET
                  ECONNABORTED ECONNRESET ENOBUFS EISCONN ENOTCONN ESHUTDOWN ETOOMANYREFS ETIMEDOUT
                  ECONNREFUSED EHOSTDOWN EHOSTUNREACH EALREADY EINPROGRESS ESTALE EUCLEAN ENOTNAM
                  ENAVAIL EISNAM EREMOTEIO EDQUOT ENOMEDIUM EMEDIUMTYPE ECANCELED ENOKEY
                  EKEYEXPIRED EKEYREVOKED EKEYREJECTED EOWNERDEAD ENOTRECOVERABLE])

AC_CACHE_SAVE


#### external libraries

PKG_PREREQ([0.29])
PKG_INSTALLDIR
MMUX_CHECK_PKG_CONFIG_MACROS
PKG_CHECK_MODULES([BASH],[bash],,[AC_MSG_WARN([package GNU Bash not found])])

#AC_SEARCH_LIBS(cos, m,, [AC_MSG_ERROR([Cannot find libm])])

AC_CACHE_SAVE


#### finish

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile]
  [src/config.m4]
  [meta/scripts/mmux-bash-pointers.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
