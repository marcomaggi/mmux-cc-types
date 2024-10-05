### mmux.m4 --
#
# Part of: MMUX Packages Infrastructure
# Contents: common GNU Autoconf macros
# Date: a long time ago
#
# Abstract
#
#       This  is a  collection of  GNU Autoconf  macros used,  by the  author, in  most of  the MMUX
#       packages.  To use it put the following in the "acinclude.m4" file:
#
#               m4_include(path/to/mmux.m4)
#
# Copyright (c) 2018, 2019, 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU
# General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# General Public License for more details.
#
# You should  have received a copy  of the GNU General  Public License along with  this program.  If
# not, see <http://www.gnu.org/licenses/>.
#


# Synopsis
#
#   MMUX_PKG_VERSIONS([MAJOR_VERSION], [MINOR_VERSION], [PATCH_LEVEL],
#                     [PRERELEASE_TAG], [BUILD_METADATA])
#
# Description
#
#   Define the appropriate m4  macros used to set various package  semantic version components.  For
#   the definition of semantic versioning see:
#
#                         <http://semver.org/>
#
#   This macro is meant to be used right before AC_INIT as:
#
#      MMUX_PKG_VERSIONS([MAJOR_VERSION],[MINOR_VERSION],[PATCH_LEVEL],[PRERELEASE_TAG],[BUILD_METADATA])
#      AC_INIT(..., MMUX_PACKAGE_VERSION, ...)
#
#   the arguments PRERELEASE_TAG and BUILD_METADATA are optional.  For example:
#
#      MMUX_PKG_VERSIONS([0],[1],[0],[devel.0],[x86_64])
#
#   The value of PRERELEASE_TAG must be a string  like "devel.0", without a leading dash.  The value
#   of BUILD_METADATA_TAG must be a string like "x86_64", without a leading plus.
#
#   This macro defines the following m4 macros:
#
#     MMUX_PACKAGE_MAJOR_VERSION: the major version number.
#
#     MMUX_PACKAGE_MINOR_VERSION: the minor version number.
#
#     MMUX_PACKAGE_PATCH_LEVEL: the patch level number.
#
#     MMUX_PACKAGE_PRERELEASE_TAG: the prerelease tag string as specified by semantic versioning.
#
#     MMUX_PACKAGE_BUILD_METADATA: the build metadata string as specified by semantic versioning.
#
#     MMUX_PACKAGE_VERSION: the package  version string as required by AC_INIT;  it includes neither
#     the prerelease tag nor the build metadata.
#
#     MMUX_PACKAGE_SEMANTIC_VERSION: the full semantic version string, with a leading "v".
#
#     MMUX_PACKAGE_PKG_CONFIG_VERSION:  the   version  number  to   use  in  the  module   file  for
#     "pkg-config".
#
m4_define([MMUX_PKG_VERSIONS],[
  m4_define([MMUX_PACKAGE_MAJOR_VERSION],  [$1])
  m4_define([MMUX_PACKAGE_MINOR_VERSION],  [$2])
  m4_define([MMUX_PACKAGE_PATCH_LEVEL],    [$3])
  m4_define([MMUX_PACKAGE_PRERELEASE_TAG], [$4])
  m4_define([MMUX_PACKAGE_BUILD_METADATA], [$5])

  # If a prerelease tag argument is present: define the associated component for the PACKAGE_VERSION
  # variable; otherwise define the component to the empty string.
  #
  # Note:  "m4_ifval" is  an Autoconf  macro,  see the  documentation  in the  node "Programming  in
  # M4sugar".
  m4_define([MMUX_PACKAGE_VERSION__COMPONENT_PRERELEASE_TAG],
    m4_ifval(MMUX_PACKAGE_PRERELEASE_TAG,[-]MMUX_PACKAGE_PRERELEASE_TAG))

  # If a build metadata argument is present: define the associated component for the PACKAGE_VERSION
  # variable; otherwise define the component to the empty string.
  #
  # Note:  "m4_ifval" is  an Autoconf  macro,  see the  documentation  in the  node "Programming  in
  # M4sugar".
  m4_define([MMUX_PACKAGE_VERSION__COMPONENT_BUILD_METADATA],
    m4_ifval(MMUX_PACKAGE_BUILD_METADATA,[+]MMUX_PACKAGE_BUILD_METADATA))

  # Result variables.
  m4_define([MMUX_PACKAGE_VERSION],MMUX_PACKAGE_MAJOR_VERSION[.]MMUX_PACKAGE_MINOR_VERSION[.]MMUX_PACKAGE_PATCH_LEVEL[]MMUX_PACKAGE_VERSION__COMPONENT_PRERELEASE_TAG)
  m4_define([MMUX_PACKAGE_SEMANTIC_VERSION],[v]MMUX_PACKAGE_MAJOR_VERSION[.]MMUX_PACKAGE_MINOR_VERSION[.]MMUX_PACKAGE_PATCH_LEVEL[]MMUX_PACKAGE_VERSION__COMPONENT_PRERELEASE_TAG[]MMUX_PACKAGE_VERSION__COMPONENT_BUILD_METADATA)
  m4_define([MMUX_PACKAGE_PKG_CONFIG_VERSION],MMUX_PACKAGE_MAJOR_VERSION[.]MMUX_PACKAGE_MINOR_VERSION[.]MMUX_PACKAGE_PATCH_LEVEL)
])


# Synopsis
#
#   MMUX_INIT
#
# Description
#
#   Initialisation code for MMUX macros.
#
AC_DEFUN([MMUX_INIT],[
  AC_MSG_NOTICE([package major version:]  MMUX_PACKAGE_MAJOR_VERSION)
  AC_MSG_NOTICE([package minor version:]  MMUX_PACKAGE_MINOR_VERSION)
  AC_MSG_NOTICE([package patch level:]    MMUX_PACKAGE_PATCH_LEVEL)
  AC_MSG_NOTICE([package prerelease tag:] MMUX_PACKAGE_PRERELEASE_TAG)
  AC_MSG_NOTICE([package build metadata:] MMUX_PACKAGE_BUILD_METADATA)
  AC_MSG_NOTICE([package version:] MMUX_PACKAGE_VERSION)
  AC_MSG_NOTICE([package semantic version:] MMUX_PACKAGE_SEMANTIC_VERSION)
  AC_MSG_NOTICE([package pkg-config module version:] MMUX_PACKAGE_PKG_CONFIG_VERSION)

  # This is used to generate TAGS files for the C language.
  AS_VAR_SET([MMUX_DEPENDENCIES_INCLUDES])
])


# Synopsis
#
#   MMUX_OUTPUT
#
# Description
#
#   Define what  is needed to  end the MMUX  package preparations.  This macro  is meant to  be used
#   right before AC_output, as follows:
#
#     MMUX_OUTPUT
#     AC_OUTPUT
#
#   This macro defines the following substitutions:
#
#     MMUX_PKG_CONFIG_VERSION: the version string to be used in the module for pkg-config.
#
#     SLACKWARE_PACKAGE_VERSION: the  version string to  be used  when building a  Slackware package
#     file.
#
AC_DEFUN([MMUX_OUTPUT],[
  AC_SUBST([MMUX_PKG_MAJOR_VERSION],MMUX_PACKAGE_MAJOR_VERSION)
  AC_SUBST([MMUX_PKG_MINOR_VERSION],MMUX_PACKAGE_MINOR_VERSION)
  AC_SUBST([MMUX_PKG_PATCH_LEVEL],MMUX_PACKAGE_PATCH_LEVEL)
  AC_SUBST([MMUX_PKG_PRERELEASE_TAG],MMUX_PACKAGE_PRERELEASE_TAG)
  AC_SUBST([MMUX_PKG_BUILD_METADATA],MMUX_PACKAGE_BUILD_METADATA)
  AC_SUBST([MMUX_PKG_VERSION],MMUX_PACKAGE_VERSION)
  AC_SUBST([MMUX_PKG_SEMANTIC_VERSION],MMUX_PACKAGE_SEMANTIC_VERSION)

  # This is the version stored in the pkg-config data file.
  AC_SUBST([MMUX_PKG_CONFIG_VERSION],MMUX_PACKAGE_PKG_CONFIG_VERSION)

  # This  is the  version number  to be  used when  generating Slackware
  # packages.
  AC_SUBST([SLACKWARE_PACKAGE_VERSION],MMUX_PACKAGE_MAJOR_VERSION[.]MMUX_PACKAGE_MINOR_VERSION[.]MMUX_PACKAGE_PATCH_LEVEL[]MMUX_PACKAGE_PRERELEASE_TAG)

  # This  is  the build  metadata  string  to  be used  when  generating
  # Slackware  packages.   It  should  be  something  like  "noarch"  or
  # "x84_64".
  AC_SUBST([SLACKWARE_BUILD_METADATA],MMUX_PACKAGE_BUILD_METADATA)

  # This is used to generate TAGS files for the C language.
  AC_SUBST([MMUX_DEPENDENCIES_INCLUDES])
])


# Synopsis:
#
#       MMUX_CHECK_TARGET_OS
#
# Description:
#
#       Inspect  the value  of the  variable "target_os"  and defines  variables, substitutions  and
#       Automake conditionals according to it.
#
#       The following variables, substitutions and preprocessor macros are defined:
#
#       MMUX_ON_LINUX - set to 1 on a GNU+Linux system, otherwise set to 0.
#
#       MMUX_ON_BSD: set to 1 on a BSD system, otherwise set to 0.
#
#       MMUX_ON_CYGWIN: set to 1 on a CYGWIN system, otherwise set to 0.
#
#       MMUX_ON_DARWIN: set to 1 on a Darwin system, otherwise set to 0.
#
#       The following GNU Automake conditionals are defined:
#
#       ON_LINUX: set to 1 on a GNU+Linux system, otherwise set to 0.
#
#       ON_BSD: set to 1 on a BSD system, otherwise set to 0.
#
#       ON_CYGWIN: set to 1 on a CYGWIN system, otherwise set to 0.
#
#       ON_DARWIN: set to 1 on a Darwin system, otherwise set to 0.
#
AC_DEFUN([MMUX_CHECK_TARGET_OS],
  [AS_VAR_SET([MMUX_ON_LINUX], [0])
   AS_VAR_SET([MMUX_ON_BSD],   [0])
   AS_VAR_SET([MMUX_ON_CYGWIN],[0])
   AS_VAR_SET([MMUX_ON_DARWIN],[0])

   AS_CASE("$target_os",
     [*linux*],
     [AS_VAR_SET([MMUX_ON_LINUX],[1])
      AC_MSG_NOTICE([detected OS: linux])],
     [*bsd*],
     [AS_VAR_SET([MMUX_ON_BSD],[1])
      AC_MSG_NOTICE([detected OS: BSD])],
     [*cygwin*],
     [AS_VAR_SET([MMUX_ON_CYGWIN],[1])
      AC_MSG_NOTICE([detected OS: CYGWIN])],
     [*darwin*],
     [AS_VAR_SET([MMUX_ON_DARWIN],[1])
      AC_MSG_NOTICE([detected OS: DARWIN])])

   AM_CONDITIONAL([ON_LINUX], [test "x$MMUX_ON_LINUX"  = x1])
   AM_CONDITIONAL([ON_BSD],   [test "x$MMUX_ON_BSD"    = x1])
   AM_CONDITIONAL([ON_CYGWIN],[test "x$MMUX_ON_CYGWIN" = x1])
   AM_CONDITIONAL([ON_DARWIN],[test "x$MMUX_ON_DARWIN" = x1])

   AC_SUBST([MMUX_ON_LINUX], [$MMUX_ON_LINUX])
   AC_SUBST([MMUX_ON_BSD],   [$MMUX_ON_BSD])
   AC_SUBST([MMUX_ON_CYGWIN],[$MMUX_ON_CYGWIN])
   AC_SUBST([MMUX_ON_DARWIN],[$MMUX_ON_DARWIN])

   AC_DEFINE_UNQUOTED([MMUX_ON_LINUX], [$MMUX_ON_LINUX],  [True if the underlying platform is GNU+Linux])
   AC_DEFINE_UNQUOTED([MMUX_ON_BSD],   [$MMUX_ON_BSD],    [True if the underlying platform is BSD])
   AC_DEFINE_UNQUOTED([MMUX_ON_CYGWIN],[$MMUX_ON_CYGWIN], [True if the underlying platform is Cygwin])
   AC_DEFINE_UNQUOTED([MMUX_ON_DARWIN],[$MMUX_ON_DARWIN], [True if the underlying platform is Darwin])
   ])


# Synopsis:
#
#       MMUX_LIBTOOL_LIBRARY_VERSIONS(stem,current,revision,age)
#
# Parameters:
#
#       $1 - The library stem; if the library is "libspiffy.so", its stem is "spiffy"
#       $2 - The current version number.
#       $3 - The revision version number.
#       $4 - The age version number.
#
# Description:
#
#       Set version numbers for libraries built with GNU Libtool.  For details see the node "Libtool
#       versioning" in the GNU Libtool Info documentation.
#
AC_DEFUN([MMUX_LIBTOOL_LIBRARY_VERSIONS],
  [$1_VERSION_INTERFACE_CURRENT=$2
   $1_VERSION_INTERFACE_REVISION=$3
   $1_VERSION_INTERFACE_AGE=$4
   AC_DEFINE_UNQUOTED([$1_VERSION_INTERFACE_CURRENT],
     [$$1_VERSION_INTERFACE_CURRENT],
     [current interface number])
   AC_DEFINE_UNQUOTED([$1_VERSION_INTERFACE_REVISION],
     [$$1_VERSION_INTERFACE_REVISION],
     [current interface implementation number])
   AC_DEFINE_UNQUOTED([$1_VERSION_INTERFACE_AGE],
     [$$1_VERSION_INTERFACE_AGE],
     [current interface age number])
   AC_DEFINE_UNQUOTED([$1_VERSION_INTERFACE_STRING],
     ["$$1_VERSION_INTERFACE_CURRENT.$$1_VERSION_INTERFACE_REVISION"],
     [library interface version])
   AC_SUBST([$1_VERSION_INTERFACE_CURRENT])
   AC_SUBST([$1_VERSION_INTERFACE_REVISION])
   AC_SUBST([$1_VERSION_INTERFACE_AGE])])


# Synopsis:
#
#   MMUX_AUTOCONF_ENABLE_OPTION(UPCASE_OPNAME, COMMAND_LINE_OPTION, DEFAULT, CHECKING_OPTION_MESSAGE, ENABLE_OPTION_MESSAGE)
#
# Parameters:
#
#   $1 - upper case option name
#   $2 - command line option name "--enable-$2"
#   $3 - default (yes, no)
#   $4 - text for the "checking option... " message
#   $5 - text for the "enable option... " message
#
# Description:
#
#       Wrapper  for  AC_ARG_ENABLE  which  adds  verbose messages  and  defines  a  shell  variable
#       "mmux_enable_$1" set to "yes" or "no".
#
AC_DEFUN([MMUX_AUTOCONF_ENABLE_OPTION],
  [AS_VAR_SET(mmux_enable_$1,$3)
   AC_MSG_CHECKING([$4])
   AC_ARG_ENABLE([$2],
     [AS_HELP_STRING([--enable-$2],
        [$5 (default is $3)])],
     [AS_CASE([$enableval],
        [yes],[mmux_enable_$1=yes],
        [no], [mmux_enable_$1=no],
        [AC_MSG_ERROR([bad value $enableval for --enable-$2])])],
     [AS_VAR_SET(mmux_enable_$1,$3)])
   AC_MSG_RESULT([$mmux_enable_$1])])


# Synopsis:
#
#       MMUX_CHECK_PKG_CONFIG_MACROS
#
# Description:
#
#       Test if  the macro PKG_CHECK_MODULES  is defined at  macro-expansion time.  This  test works
#       only if the file "configure.ac" also contains an actual expansion of PKG_CHECK_MODULES.
#
AC_DEFUN([MMUX_CHECK_PKG_CONFIG_MACROS],
  [AC_MSG_CHECKING([availability of pkg-config m4 macros])
   AS_IF([test m4_ifdef([PKG_CHECK_MODULES],[yes],[no]) == yes],
     [AC_MSG_RESULT([yes])],
     [AC_MSG_RESULT([no])
      AC_MSG_ERROR([pkg-config is required.  See pkg-config.freedesktop.org])])])


# Synopsis:
#
#       MMUX_LANG_C11
#
# Description:
#
#       Define the appropriate flags  to use the C11 standard language.  Such  flags are appended to
#       the current definition of the variable "CC".
#
#       This macro is meant to be used as:
#
#               AC_LANG([C])
#               MMUX_LANG_C11
#
#       If the variable "GCC" is set to "yes": select additional warning flags to be handed to the C
#       compiler.  Such flags are appended to the  variable MMUX_CFLAGS, which is also configured as
#       substitution  (and so  it becomes  a Makefile  variable).  We  should use  such variable  to
#       compile commands as follows, in "Makefile.am":
#
#               AM_CFLAGS = $(MMUX_CFLAGS)
#
AC_DEFUN([MMUX_LANG_C11],[
  AX_REQUIRE_DEFINED([AX_CHECK_COMPILE_FLAG])
  AX_REQUIRE_DEFINED([AX_APPEND_COMPILE_FLAGS])
  AX_REQUIRE_DEFINED([AX_GCC_VERSION])
  AC_REQUIRE([AX_IS_RELEASE])

  AC_PROG_CC_C99
  AX_CHECK_COMPILE_FLAG([-std=c11],
    [AX_APPEND_FLAG([-std=c11], [CC])],
    [AC_MSG_ERROR([*** Compiler does not support -std=c11])],
    [-pedantic])

  AS_VAR_IF(GCC,'yes',
    [AX_GCC_VERSION])

  AC_SUBST([MMUX_CFLAGS])
  AC_DEFINE([_ISOC11_SOURCE],[1],[Enable the ISO C11 features.])

  # These flags are for every compiler.
  AS_VAR_IF(ax_is_release,'no',
    [AX_APPEND_COMPILE_FLAGS([-Wall -Wextra -pedantic], [MMUX_CFLAGS], [-Werror])])

  # These flags are for GCC only.
  AS_VAR_IF(ax_is_release,'no',
    [AS_VAR_IF(GCC,'yes',
      [AX_APPEND_COMPILE_FLAGS([-Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict], [MMUX_CFLAGS], [-Werror])
       AX_APPEND_COMPILE_FLAGS([-Wnull-dereference -Wjump-misses-init -Wdouble-promotion -Wshadow], [MMUX_CFLAGS], [-Werror])
       AX_APPEND_COMPILE_FLAGS([-Wformat=2 -Wmisleading-indentation], [MMUX_CFLAGS], [-Werror])])])
  ])


# Define macros  that expand into C  preprocessor directives to  include the most common  C language
# header files.  We can use the expansion of the macros as "INCLUDES" argument to other macros.
#

AC_DEFUN([MMUX_INCLUDE_UNISTD_H],[
#ifdef HAVE_UNISTD_H
#  include <unistd.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_ARPA_INET_H],[
#ifdef HAVE_ARPA_INET_H
#  include <arpa/inet.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_DIRENT_H],[
#ifdef HAVE_DIRENT_H
#  include <dirent.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_ERRNO_H],[
#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_FCNTL_H],[
#ifdef HAVE_FCNTL_H
#  include <fcntl.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_FLOAT_H],[
#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_GRP_H],[
#ifdef HAVE_GRP_H
#  include <grp.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_LIMITS_H],[
#ifdef HAVE_LIMITS_H
#  include <limits.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_LINUX_FS_H],[
#ifdef HAVE_LINUX_FS_H
#  include <linux/fs.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_MATH_H],[
#ifdef HAVE_MATH_H
#  include <math.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_NETINET_IN_H],[
#ifdef HAVE_NETINET_IN_H
#  include <netinet/in.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_NETDB_H],[
#ifdef HAVE_NETDB_H
#  include <netdb.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_PWD_H],[
#ifdef HAVE_PWD_H
#  include <pwd.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SIGNAL_H],[
#ifdef HAVE_SIGNAL_H
#  include <signal.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_SELECT_H],[
#ifdef HAVE_SYS_SELECT_H
#  include <sys/select.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_SOCKET_H],[
#ifdef HAVE_SYS_SOCKET_H
#  include <sys/socket.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_SYSCALL_H],[
#ifdef HAVE_SYS_SYSCALL_H
#  include <sys/syscall.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_UN_H],[
#ifdef HAVE_SYS_UN_H
#  include <sys/un.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_STDDEF_H],[
#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_STDIO_H],[
#include <stdio.h>
])

AC_DEFUN([MMUX_INCLUDE_STDLIB_H],[
#ifdef HAVE_STDLIB_H
#  include <stdlib.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_AUXV_H],[
#ifdef HAVE_SYS_AUXV_H
#  include <sys/auxv.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_TYPES_H],[
#ifdef HAVE_SYS_TYPES_H
#  include <sys/types.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_MMAN_H],[
#ifdef HAVE_SYS_MMAN_H
#  include <sys/mman.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_UIO_H],[
#ifdef HAVE_SYS_UIO_H
#  include <sys/uio.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_RESOURCE_H],[
#ifdef HAVE_SYS_RESOURCE_H
#  include <sys/resource.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_STAT_H],[
#ifdef HAVE_SYS_STAT_H
#  include <sys/stat.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_SYS_TIME_H],[
#ifdef HAVE_SYS_TIME_H
#  include <sys/time.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_TIME_H],[
#ifdef HAVE_TIME_H
#  include <time.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_UNISTD_H],[
#ifdef HAVE_UNISTD_H
#  include <unistd.h>
#endif
])

AC_DEFUN([MMUX_INCLUDE_WAIT_H],[
#ifdef HAVE_WAIT_H
#  include <wait.h>
#endif
])


# Synopsis:
#
#       MMUX_CC_DETERMINE_VALUEOF(STEM, EXPRESSION, INCLUDES)
#
# Parameters:
#
#       $1 - Mandatory uppercase stem used to generate output variables and C preprocessor symbols.
#       $2 - Mandatory C language expression which, executed in a C program, returns the constant.
#       $3 - Optional include directives for the C language preprocessor.
#
# Description:
#
#       Determine the value of a C language constant expression returning an exact integer.
#
# Usage example:
#
#       MMUX_CC_DETERMINE_VALUEOF([EINVAL], [EINVAL], [#ifdef HAVE_ERRNO_H
#       #  include <errno.h>
#       #endif])
#
# to determine the existence and value of the "errno" constant "EINVAL"; results:
#
# mmux_cv_valueof_EINVAL
#
#     A shell variable used  to cache the result.  If the symbol "EINVAL"  exists: the shell value
#     is the value of the constant itself.  If the symbol "EINVAL" does not exist: the shell value
#     is the string "MMUX_META_VALUE_UNDEFINED".
#
# MMUX_HAVE_EINVAL
#
#     A C language  preprocessor symbol.  If the symbol "EINVAL"  exists: the preprocessor symbols
#     is defined to  be "1".  If the symbol  "EINVAL" does not exist: the  preprocessor symbols is
#     defined to be "0".
#
# MMUX_VALUEOF_EINVAL
#
#     A C language preprocessor symbol.  Its uses expand to the value of EINVAL itself.
#
# MMUX_VALUEOF_EINVAL
#
#     A GNU Autoconf substitution symbol.  Its uses expand to the value of EINVAL itself.
#
AC_DEFUN([MMUX_CC_DETERMINE_VALUEOF],
  [AC_CACHE_CHECK([the value of '$2'],
     [mmux_cv_valueof_$1],
     [AC_COMPUTE_INT([mmux_cv_valueof_$1], [$2], [$3],
        [AS_VAR_SET([mmux_cv_valueof_$1],[MMUX_META_VALUE_UNDEFINED])])])
    AS_IF([test "x$mmux_cv_valueof_$1" = xMMUX_META_VALUE_UNDEFINED],
          [AS_VAR_SET([MMUX_HAVE_$1],[0])],
          [AS_VAR_SET([MMUX_HAVE_$1],[1])])
    AC_DEFINE_UNQUOTED([MMUX_HAVE_$1],   [$MMUX_HAVE_$1],[The constant value $1 is defined.])
    AC_DEFINE_UNQUOTED([MMUX_VALUEOF_$1],[$mmux_cv_valueof_$1],[The constant value $1.])
    AC_SUBST([MMUX_VALUEOF_$1],[$mmux_cv_valueof_$1])])


# Synopsis:
#
#       MMUX_CC_DETERMINE_SIZEOF(STEM, TYPE, INCLUDES)
#
# Parameters:
#
#       $1 - A stem used to build variable names.
#       $2 - The C language type of which we want to determine the size.
#       $3 - The preprocessor include directives we need to include the required headers.
#
# Description:
#
#       Determine the size in bytes of the C  language type TYPE, using the header files selected by
#       the directives in INCLUDES.
#
#       Define    the   variable    variable   "MMUX_SIZEOF_$STEM"    and   the    cached   variable
#       "mmux_cv_sizeof_$STEM" to the number of bytes.
#
#       Define the preprocessor macro "MMUX_SIZEOF_$STEM" to the number of bytes.
#
# Usage example:
#
#       To determine the size of "size_t":
#
#               MMUX_CC_DETERMINE_SIZEOF([SIZE_T],[size_t],[#ifdef HAVE_STDDEF_H
#               #  include <stddef.h>
#               #endif])
#
AC_DEFUN([MMUX_CC_DETERMINE_SIZEOF],
  [AS_VAR_SET([MMUX_SIZEOF_$1],[0])
   AC_CACHE_CHECK([the size of '$2'],
     [mmux_cv_sizeof_$1],
     [AC_COMPUTE_INT([mmux_cv_sizeof_$1],
        [sizeof($2)],
        [$3],
        [mmux_cv_sizeof_$1=0])])
    AS_VAR_SET([MMUX_SIZEOF_$1],["$mmux_cv_sizeof_$1"])
    AC_DEFINE_UNQUOTED([MMUX_SIZEOF_$1],[$MMUX_SIZEOF_[]$1],[the size of '$2'])])


#### let's go

### end of file
# Local Variables:
# mode: autoconf
# fill-column: 100
# End:
