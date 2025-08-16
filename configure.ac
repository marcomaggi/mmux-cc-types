# @configure_input@
#

AC_PREREQ([2.72])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.0])
AC_INIT([MMUX CC Types],[MMUX_PACKAGE_VERSION],
  [mrc.mgg@gmail.com],
  [mmux-cc-types],[https://github.com/marcomaggi/mmux-cc-types])
MMUX_INIT
MMUX_LIBTOOL_LIBRARY_VERSIONS([mmux_cc_types],0,0,0)
AC_REVISION([0.1])
AC_COPYRIGHT([Copyright (c) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

This program is free software: you  can redistribute it and/or modify it
under  the  terms of  the GNU  General Public  License as  published  by
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
AC_USE_SYSTEM_EXTENSIONS
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

LT_PREREQ([2.4.7])
LT_INIT([disable-static])


#### basic system inspection

MMUX_CHECK_TARGET_OS
AX_IS_RELEASE([git-directory])

AC_LANG([C])
MMUX_LANG_GCC23

AM_PROG_AS
AM_PROG_CC_C_O
AC_PATH_PROG([M4_PROGRAM],[m4])
AC_PATH_PROG([BASH_PROGRAM],[/bin/bash],[/bin/bash],[:])

AC_CACHE_SAVE


#### external libraries

PKG_PREREQ([0.29])
PKG_INSTALLDIR
MMUX_CHECK_PKG_CONFIG_MACROS

AC_SEARCH_LIBS(cos, m,, [AC_MSG_ERROR([Cannot find libm])])

AC_CACHE_SAVE


#### check for C language types

MMUX_CC_CHECK_STANDARD_TYPES
MMUX_CC_CHECK_STANDARD_TYPE_EXTENSION_FLOAT
MMUX_CC_CHECK_STANDARD_TYPE_EXTENSION_DECIMAL_FLOAT

MMUX_CC_INSPECT_STANDARD_TYPES
MMUX_CC_INSPECT_STANDARD_FEATURE_TYPES


#### external packages

AC_ARG_WITH([emacs],
  AS_HELP_STRING([--with-emacs],[enable installation of GNU Emacs module]),
  [true],[with_emacs=no])
AC_MSG_CHECKING([whether GNU Emacs module will be installed])
AS_VAR_IF(with_emacs,'yes',
  [AC_MSG_RESULT([yes])],
  [AC_MSG_RESULT([no])])
AM_CONDITIONAL([WANT_EMACS],[test x$with_emacs = xyes])
AS_VAR_IF(with_emacs,'yes',
  [AM_PATH_LISPDIR])


#### finish

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile]
  [src/mmux-cc-types-config.h.m4]
  [src/m4/mmux-cc-types-config.m4]
  [doc/mmux-version.texi]
  [meta/scripts/mmux-cc-types.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
