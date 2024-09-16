# @configure_input@
#

AC_PREREQ([2.69])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.1])
AC_INIT([MMUX Bash Pointers],[MMUX_PACKAGE_VERSION],
  [mrc.mgg@gmail.com],
  [mmux-bash-pointers],[http://github.com/marcomaggi/mmux-bash-pointers])
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
AM_INIT_AUTOMAKE([1.16 foreign subdir-objects])
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
AC_HEADER_STDC
AC_HEADER_SYS_WAIT
AC_CHECK_HEADERS([assert.h stdint.h inttypes.h strings.h errno.h stddef.h unistd.h math.h complex.h])

AC_PATH_PROG([M4_PROGRAM],[m4])
AC_PATH_PROG([BASH_PROGRAM],[/bin/bash],[/bin/bash],[:])

AC_ARG_ENABLE([mbfl],
  [AS_HELP_STRING([--enable-mbfl],[enable using MBFL for testing (default: yes)])],
  [AS_VAR_SET([MMUX_ENABLED_MBFL],[$enableval])],
  [AS_VAR_SET([MMUX_ENABLED_MBFL],[yes])])

if test "x$MMUX_ENABLED_MBFL" = 'xyes'
then
  MBFL_SETUP(v3.0.0)
fi
AM_CONDITIONAL([MMUX_TESTING_ENABLED],[test "x$MMUX_ENABLED_MBFL" = 'xyes'])

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


#### checks for library functions

AC_FUNC_MALLOC
AC_FUNC_MEMCMP

AC_CACHE_SAVE


#### includes for tests

m4_define([MMUX_INCLUDES_FOR_TESTS],[
AC_INCLUDES_DEFAULT
#ifdef HAVE_COMPLEX_H
#  include <complex.h>
#endif
#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif
#ifdef HAVE_INTTYPES_H
#  include <inttypes.h>
#endif
#ifdef HAVE_MATH_H
#  include <math.h>
#endif
#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif
#ifdef HAVE_STDINT_H
#  include <stdint.h>
#endif
#ifdef HAVE_STRINGS_H
#  include <strings.h>
#endif
#ifdef HAVE_UNISTD_H
#  include <unistd.h>
#endif
])


#### inspecting errno constants

AC_DEFUN([MMUX_VALUEOF_TEST],
  [AC_CACHE_CHECK([the value of '$2'],
     [mmux_cv_valueof_$1],
     [AC_COMPUTE_INT([mmux_cv_valueof_$1],
        [$2],
        [MMUX_INCLUDES_FOR_TESTS],
        [AS_VAR_SET([mmux_cv_valueof_$1],[no])])])
    if test "x$mmux_cv_valueof_$1" = "xno"
    then AS_VAR_SET([MMUX_HAVE_$1],[0])
    else AS_VAR_SET([MMUX_HAVE_$1],[1])
    fi
    AC_DEFINE_UNQUOTED([MMUX_HAVE_$1],[$MMUX_HAVE_$1],[The value $1 of errno is defined.])])

AC_DEFUN([MMUX_ERRNO_TEST],[MMUX_VALUEOF_TEST([$1],[$1])])
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


#### inspecting standard types

AC_CHECK_SIZEOF([void *])
AC_SUBST([MMUX_LIBC_SIZEOF_POINTER],[$ac_cv_sizeof_void_p])

dnl --------------------------------------------------------------------

AC_DEFUN([MMUX_SIZEOF_STANDARD_TYPE],
  [AC_CHECK_SIZEOF([$2],,[MMUX_INCLUDES_FOR_TESTS])
   AC_SUBST([MMUX_LIBC_SIZEOF_$1],[$[]ac_cv_sizeof_$3])])

MMUX_SIZEOF_STANDARD_TYPE([SCHAR],      [signed char],                  [signed_char])
MMUX_SIZEOF_STANDARD_TYPE([UCHAR],      [unsigned char],                [unsigned_char])
MMUX_SIZEOF_STANDARD_TYPE([SSHORT],     [signed short int],             [signed_short_int])
MMUX_SIZEOF_STANDARD_TYPE([USHORT],     [unsigned short int],           [unsigned_short_int])
MMUX_SIZEOF_STANDARD_TYPE([SINT],       [signed int],                   [signed_int])
MMUX_SIZEOF_STANDARD_TYPE([UINT],       [unsigned int],                 [unsigned_int])
MMUX_SIZEOF_STANDARD_TYPE([SLONG],      [signed long int],              [signed_long_int])
MMUX_SIZEOF_STANDARD_TYPE([ULONG],      [unsigned long int],            [unsigned_long_int])
MMUX_SIZEOF_STANDARD_TYPE([SLLONG],     [signed long long int],         [signed_long_long_int])
MMUX_SIZEOF_STANDARD_TYPE([ULLONG],     [unsigned long long int],       [unsigned_long_long_int])

MMUX_SIZEOF_STANDARD_TYPE([FLOAT],      [float],                        [float])
MMUX_SIZEOF_STANDARD_TYPE([DOUBLE],     [double],                       [double])
MMUX_SIZEOF_STANDARD_TYPE([LDOUBLE],    [long double],                  [long_double])
MMUX_SIZEOF_STANDARD_TYPE([COMPLEX],    [double complex],               [double_complex])

dnl We know these, but for uniformity...
MMUX_SIZEOF_STANDARD_TYPE([SINT8],      [int8_t],                       [int8_t])
MMUX_SIZEOF_STANDARD_TYPE([UINT8],      [uint8_t],                      [uint8_t])
MMUX_SIZEOF_STANDARD_TYPE([SINT16],     [int16_t],                      [int16_t])
MMUX_SIZEOF_STANDARD_TYPE([UINT16],     [uint16_t],                     [uint16_t])
MMUX_SIZEOF_STANDARD_TYPE([SINT32],     [int32_t],                      [int32_t])
MMUX_SIZEOF_STANDARD_TYPE([UINT32],     [uint32_t],                     [uint32_t])
MMUX_SIZEOF_STANDARD_TYPE([SINT64],     [int64_t],                      [int64_t])
MMUX_SIZEOF_STANDARD_TYPE([UINT64],     [uint64_t],                     [uint64_t])

MMUX_SIZEOF_STANDARD_TYPE([SSIZE],      [ssize_t],                      [ssize_t])
MMUX_SIZEOF_STANDARD_TYPE([USIZE],      [size_t],                       [size_t])
MMUX_SIZEOF_STANDARD_TYPE([SINTMAX],    [intmax_t],                     [intmax_t])
MMUX_SIZEOF_STANDARD_TYPE([UINTMAX],    [uintmax_t],                    [uintmax_t])
MMUX_SIZEOF_STANDARD_TYPE([SINTPTR],    [intptr_t],                     [intptr_t])
MMUX_SIZEOF_STANDARD_TYPE([UINTPTR],    [uintptr_t],                    [uintptr_t])

MMUX_SIZEOF_STANDARD_TYPE([PTRDIFF],    [ptrdiff_t],                    [ptrdiff_t])
MMUX_SIZEOF_STANDARD_TYPE([MODE],       [mode_t],                       [mode_t])
MMUX_SIZEOF_STANDARD_TYPE([OFF],        [off_t],                        [off_t])
MMUX_SIZEOF_STANDARD_TYPE([UID],        [uid_t],                        [uid_t])
MMUX_SIZEOF_STANDARD_TYPE([PID],        [pid_t],                        [pid_t])
MMUX_SIZEOF_STANDARD_TYPE([GID],        [gid_t],                        [gid_t])


#### type aliasest

AC_DEFUN([MMUX_TYPE_ALIAS_SIGNED_TEST],
  [AC_CACHE_CHECK([the type alias of the exact signed integer '$2' (size=$ac_cv_sizeof_$2)],
     [mmux_cv_type_alias_$1],
     [AS_CASE([$ac_cv_sizeof_$2],
       [$ac_cv_sizeof_signed_char],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_schar_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_schar])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_schar])],

       [$ac_cv_sizeof_signed_short_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_sshort_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_sshort])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_sshort])],

       [$ac_cv_sizeof_signed_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_sint_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_sint])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_sint])],

       [$ac_cv_sizeof_signed_long_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_slong_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_slong])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_slong])],

       [$ac_cv_sizeof_signed_long_long_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_sllong_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_sllong])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_sllong])],

       [AS_VAR_SET([mmux_cv_type_alias_$1],[mmux_libc_void_t])])])
   AC_SUBST([MMUX_TYPE_ALIAS_$1],       [$mmux_cv_type_alias_$1])
   AC_SUBST([MMUX_TYPE_PARSE_$1],       [$mmux_cv_type_parse_$1])
   AC_SUBST([MMUX_TYPE_SPRINT_$1],      [$mmux_cv_type_sprint_$1])])

AC_DEFUN([MMUX_TYPE_ALIAS_UNSIGNED_TEST],
  [AC_CACHE_CHECK([the type alias of the exact unsigned integer '$2' (size=$ac_cv_sizeof_$2)],
     [mmux_cv_type_alias_$1],
     [AS_CASE([$ac_cv_sizeof_$2],
       [$ac_cv_sizeof_unsigned_char],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_uchar_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_uchar])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_uchar])],

       [$ac_cv_sizeof_unsigned_short_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_ushort_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_uint])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_uint])],

       [$ac_cv_sizeof_unsigned_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_uint_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_uint])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_uint])],

       [$ac_cv_sizeof_unsigned_long_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_ulong_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_ulong])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_ulong])],

       [$ac_cv_sizeof_unsigned_long_long_int],
       [AS_VAR_SET([mmux_cv_type_alias_$1],     [mmux_libc_ullong_t])
        AS_VAR_SET([mmux_cv_type_parse_$1],     [mmux_bash_pointers_parse_ullong])
        AS_VAR_SET([mmux_cv_type_sprint_$1],    [mmux_bash_pointers_sprint_ullong])],

       [AS_VAR_SET([mmux_cv_type_alias_$1],[mmux_libc_void_t])])])
   AC_SUBST([MMUX_TYPE_ALIAS_$1],       [$mmux_cv_type_alias_$1])
   AC_SUBST([MMUX_TYPE_PARSE_$1],       [$mmux_cv_type_parse_$1])
   AC_SUBST([MMUX_TYPE_SPRINT_$1],      [$mmux_cv_type_sprint_$1])])

dnl --------------------------------------------------------------------

MMUX_TYPE_ALIAS_SIGNED_TEST([SSIZE],        [ssize_t])
MMUX_TYPE_ALIAS_SIGNED_TEST([SINTMAX],      [intmax_t])
MMUX_TYPE_ALIAS_SIGNED_TEST([SINTPTR],      [intptr_t])
MMUX_TYPE_ALIAS_SIGNED_TEST([OFF],          [off_t])
MMUX_TYPE_ALIAS_SIGNED_TEST([PID],          [pid_t])
MMUX_TYPE_ALIAS_SIGNED_TEST([PTRDIFF],      [ptrdiff_t])

MMUX_TYPE_ALIAS_UNSIGNED_TEST([USIZE],      [size_t])
MMUX_TYPE_ALIAS_UNSIGNED_TEST([UINTMAX],    [uintmax_t])
MMUX_TYPE_ALIAS_UNSIGNED_TEST([UINTPTR],    [uintptr_t])
MMUX_TYPE_ALIAS_UNSIGNED_TEST([MODE],       [mode_t])
MMUX_TYPE_ALIAS_UNSIGNED_TEST([UID],        [uid_t])
MMUX_TYPE_ALIAS_UNSIGNED_TEST([GID],        [gid_t])


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
  [src/mmux-bash-pointers.h]
  [src/mmux-bash-pointers-parsers.c.m4]
  [src/mmux-bash-pointers-sprinters.c.m4]
  [src/libmmux-bash-pointers.bash]
  [meta/scripts/mmux-bash-pointers.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
