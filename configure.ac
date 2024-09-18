# @configure_input@
#

AC_PREREQ([2.72])
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

dnl AC_FUNC_MALLOC
dnl AC_FUNC_MEMCMP

dnl AC_CACHE_SAVE


#### inspecting standard types

MMUX_BASH_TYPE_DETERMINE_SIZEOF([POINTER],    [void *])

MMUX_BASH_TYPE_DETERMINE_SIZEOF([SCHAR],      [signed char])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UCHAR],      [unsigned char])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SSHORT],     [signed short int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([USHORT],     [unsigned short int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINT],       [signed int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINT],       [unsigned int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SLONG],      [signed long int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([ULONG],      [unsigned long int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SLLONG],     [signed long long int])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([ULLONG],     [unsigned long long int])

MMUX_BASH_TYPE_DETERMINE_SIZEOF([FLOAT],      [float])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([DOUBLE],     [double])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([LDOUBLE],    [long double])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([COMPLEX],    [double complex])

MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINT8],      [int8_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINT8],      [uint8_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINT16],     [int16_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINT16],     [uint16_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINT32],     [int32_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINT32],     [uint32_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINT64],     [int64_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINT64],     [uint64_t])

MMUX_BASH_TYPE_DETERMINE_SIZEOF([SSIZE],      [ssize_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([USIZE],      [size_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINTMAX],    [intmax_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINTMAX],    [uintmax_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([SINTPTR],    [intptr_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UINTPTR],    [uintptr_t])

MMUX_BASH_TYPE_DETERMINE_SIZEOF([PTRDIFF],    [ptrdiff_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([MODE],       [mode_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([OFF],        [off_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([UID],        [uid_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([PID],        [pid_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([GID],        [gid_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([WCHAR],      [wchar_t])
MMUX_BASH_TYPE_DETERMINE_SIZEOF([WINT],       [wint_t])


#### limits of standard types

AC_DEFUN([MMUX_BASH_SIGNED_INTEGER_TYPE_MAX_TEST],
  [AC_CACHE_CHECK([the maximum value of '$1' ($2)],
     [mmux_cv_maximumof_[]m4_tolower($1)],
     [AC_COMPUTE_INT([mmux_cv_maximumof_[]m4_tolower($1)],
        [$2],
        [MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],
        [AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],[no])])])
   AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MAX_[]m4_toupper($1)],[$mmux_cv_maximumof_[]m4_tolower($1)],[Maximum value of a "$1".])])

AC_DEFUN([MMUX_BASH_SIGNED_INTEGER_TYPE_MIN_TEST],
  [AC_CACHE_CHECK([the minimum value of '$1' ($2)],
     [mmux_cv_minimumof_[]m4_tolower($1)],
     [AC_COMPUTE_INT([mmux_cv_minimumof_[]m4_tolower($1)],
        [$2],
        [MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],
        [AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],[no])])])
   AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MIN_[]m4_toupper($1)],[$mmux_cv_minimumof_[]m4_tolower($1)],[Minimum value of a "$1"])])

AC_DEFUN([MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST],
  [MMUX_BASH_SIGNED_INTEGER_TYPE_MIN_TEST([$1],[$3])
   MMUX_BASH_SIGNED_INTEGER_TYPE_MAX_TEST([$1],[$2])])

dnl --------------------------------------------------------------------

AC_DEFUN([MMUX_BASH_UNSIGNED_INTEGER_TYPE_MIN_TEST],
  [AC_CACHE_CHECK([the minimum value of '$1'],
     [mmux_cv_minimumof_[]m4_tolower($1)],
     [AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],[0])])
   AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MIN_[]m4_toupper($1)],[$mmux_cv_minimumof_[]m4_tolower($1)],[Minimum value of a "$1".])])

AC_DEFUN([MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAX_TEST],
  [AC_CACHE_CHECK([the maximum value of '$1' ($2)],
     [mmux_cv_maximumof_[]m4_tolower($1)],
     [AC_COMPUTE_INT([mmux_cv_maximumof_[]m4_tolower($1)],
        [$2],
        [MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],
        [AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],[no])])])
   AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MAX_[]m4_toupper($1)],[$mmux_cv_maximumof_[]m4_tolower($1)],[Maximum value of a "$1".])])

AC_DEFUN([MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST],
  [MMUX_BASH_UNSIGNED_INTEGER_TYPE_MIN_TEST([$1])
   MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAX_TEST([$1],[$2])])

dnl --------------------------------------------------------------------

MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST([schar],   [SCHAR_MAX],    [SCHAR_MIN])
MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST([sshort],  [SHRT_MAX],     [SHRT_MIN])
MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST([sint],    [INT_MAX],      [INT_MIN])
MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST([slong],   [LONG_MAX],     [LONG_MIN])
MMUX_BASH_SIGNED_INTEGER_TYPE_MAXMIN_TEST([sllong],  [LLONG_MAX],    [LLONG_MIN])

MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST([uchar],   [UCHAR_MAX])
MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST([ushort],  [USHRT_MAX])
MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST([uint],    [UINT_MAX])
MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST([ulong],   [ULONG_MAX])
MMUX_BASH_UNSIGNED_INTEGER_TYPE_MAXMIN_TEST([ullong],  [ULLONG_MAX])


#### type aliases

MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([SSIZE],        [ssize_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([SINTMAX],      [intmax_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([SINTPTR],      [intptr_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([OFF],          [off_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([PID],          [pid_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([PTRDIFF],      [ptrdiff_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([WCHAR],        [wchar_t])

MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([USIZE],      [size_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([UINTMAX],    [uintmax_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([UINTPTR],    [uintptr_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([MODE],       [mode_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([UID],        [uid_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([GID],        [gid_t])
MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([WINT],       [wint_t])

dnl --------------------------------------------------------------------

dnl AC_DEFUN([MMUX_BASH_TYPE_ALIAS_SIGNED_TEST],
dnl   [AC_CACHE_CHECK([the type alias of the exact signed integer '$2' (size=$ac_cv_sizeof_$2)],
dnl      [mmux_cv_type_alias_[]m4_tolower($1)],
dnl      [AS_CASE([$ac_cv_sizeof_$2],
dnl         [$ac_cv_sizeof_signed_char],
dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_schar_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_schar])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_schar])
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [$mmux_cv_maximumof_schar])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [$mmux_cv_minimumof_schar])],

dnl         [$ac_cv_sizeof_signed_short_int],
dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_sshort_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_sshort])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_sshort])
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [$mmux_cv_maximumof_sshrt])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [$mmux_cv_minimumof_sshrt])],

dnl         [$ac_cv_sizeof_signed_int],
dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_sint_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_sint])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_sint])]
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [$mmux_cv_maximumof_sint])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [$mmux_cv_minimumof_sint]),

dnl         [$ac_cv_sizeof_signed_long_int],
dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_slong_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_slong])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_slong])]
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [$mmux_cv_maximumof_slong])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [$mmux_cv_minimumof_slong]),

dnl         [$ac_cv_sizeof_signed_long_long_int],
dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_sllong_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_sllong])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_sllong])
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [$mmux_cv_maximumof_sllong])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [$mmux_cv_minimumof_sllong])],

dnl         [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_void_t])
dnl          AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [void])
dnl          AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [void])
dnl          AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],      [0])
dnl          AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],      [0])])])
dnl    AC_SUBST(MMUX_BASH_TYPE_ALIAS_[]m4_toupper($1),[$mmux_cv_type_alias_[]m4_tolower($1)])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_PARSE_[]m4_toupper($1)], [$mmux_cv_type_parse_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type parser for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_SPRINT_[]m4_toupper($1)],[$mmux_cv_type_sprint_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type sprinter for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MAX_[]m4_toupper($1)],   [$mmux_cv_maximumof_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type maximum for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MIN_[]m4_toupper($1)],   [$mmux_cv_minimumof_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type minimum for "$2".])])

dnl AC_DEFUN([MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST],
dnl   [AC_CACHE_CHECK([the type alias of the exact unsigned integer '$2' (size=$ac_cv_sizeof_$2)],
dnl      [mmux_cv_type_alias_[]m4_tolower($1)],
dnl      [AS_CASE([$ac_cv_sizeof_$2],
dnl        [$ac_cv_sizeof_unsigned_char],
dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_uchar_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_uchar])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_uchar])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [$mmux_cv_maximumof_uchar])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])],

dnl        [$ac_cv_sizeof_unsigned_short_int],
dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_ushort_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_ushort])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_ushort])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [$mmux_cv_maximumof_ushrt])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])],

dnl        [$ac_cv_sizeof_unsigned_int],
dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_uint_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_uint])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_uint])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [$mmux_cv_maximumof_uint])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])],

dnl        [$ac_cv_sizeof_unsigned_long_int],
dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_ulong_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_ulong])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_ulong])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [$mmux_cv_maximumof_ulong])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])],

dnl        [$ac_cv_sizeof_unsigned_long_long_int],
dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_ullong_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [mmux_bash_pointers_parse_ullong])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [mmux_bash_pointers_sprint_ullong])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [$mmux_cv_maximumof_ullong])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])],

dnl        [AS_VAR_SET([mmux_cv_type_alias_[]m4_tolower($1)],     [mmux_libc_void_t])
dnl         AS_VAR_SET([mmux_cv_type_parse_[]m4_tolower($1)],     [void])
dnl         AS_VAR_SET([mmux_cv_type_sprint_[]m4_tolower($1)],    [void])
dnl         AS_VAR_SET([mmux_cv_maximumof_[]m4_tolower($1)],       [0])
dnl         AS_VAR_SET([mmux_cv_minimumof_[]m4_tolower($1)],       [0])])])
dnl    AC_SUBST(MMUX_BASH_TYPE_ALIAS_[]m4_toupper($1),[$mmux_cv_type_alias_[]m4_tolower($1)])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_PARSE_[]m4_toupper($1)], [$mmux_cv_type_parse_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type parser for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_SPRINT_[]m4_toupper($1)],[$mmux_cv_type_sprint_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type sprinter for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MAX_[]m4_toupper($1)],   [$mmux_cv_maximumof_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type maximum for "$2".])
dnl    AC_DEFINE_UNQUOTED([MMUX_BASH_TYPE_MIN_[]m4_toupper($1)],   [$mmux_cv_minimumof_[]m4_tolower($1)],
dnl                       [MMUX Bash Pointers type minimum for "$2".])])

dnl dnl --------------------------------------------------------------------

dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([SSIZE],        [ssize_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([SINTMAX],      [intmax_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([SINTPTR],      [intptr_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([OFF],          [off_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([PID],          [pid_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([PTRDIFF],      [ptrdiff_t])
dnl MMUX_BASH_TYPE_ALIAS_SIGNED_TEST([WCHAR],        [wchar_t])

dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([USIZE],      [size_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([UINTMAX],    [uintmax_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([UINTPTR],    [uintptr_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([MODE],       [mode_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([UID],        [uid_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([GID],        [gid_t])
dnl MMUX_BASH_TYPE_ALIAS_UNSIGNED_TEST([WINT],       [wint_t])


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
  [src/libmmux-bash-pointers.bash]
  [src/mmux-bash-pointers-config.m4]
  [meta/scripts/mmux-bash-pointers.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
