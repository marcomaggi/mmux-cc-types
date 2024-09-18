dnl mmux-bash-extensions-macros.m4 --
dnl
dnl Basic definitions for MMUX packages.
dnl
dnl LICENSE
dnl
dnl Copyright (c) 2024 Marco Maggi <mrc.mgg@gmail.com>
dnl
dnl This is  free software;  you can redistribute  it and/or modify  it under  the terms of  the GNU
dnl Lesser General Public License  as published by the Free Software  Foundation; either version 3.0
dnl of the License, or (at your option) any later version.
dnl
dnl This library  is distributed  in the  hope that  it will  be useful,  but WITHOUT  ANY WARRANTY;
dnl without even the implied  warranty of MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See
dnl the GNU Lesser General Public License for more details.
dnl
dnl You  should have  received a  copy of  the GNU  Lesser General  Public License  along with  this
dnl library;  if not,  write to  the Free  Software Foundation,  Inc., 59  Temple Place,  Suite 330,
dnl Boston, MA 02111-1307 USA.
dnl


dnl MMUX_BASH_CHECK_COMMON_HEADERS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_CHECK_COMMON_HEADERS
dnl
dnl Check for all the  common C language headers needed when writing a  GNU Bash builtins extension;
dnl and probably something more.  We should just use this macro somewhere like this:
dnl
dnl     AC_LANG([C])
dnl     ...
dnl     MMUX_BASH_CHECK_COMMON_HEADERS
dnl
m4_define([MMUX_BASH_CHECK_COMMON_HEADERS],[
AC_HEADER_ASSERT
AC_HEADER_STDBOOL
dnl AC_HEADER_SYS_WAIT
AC_CHECK_HEADERS([complex.h errno.h float.h limits.h math.h stddef.h wchar.h])
])


dnl MMUX_BASH_COMMON_INCLUDES_FOR_TESTS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_COMMON_INCLUDES_FOR_TESTS
dnl
dnl Expand into include directives for all the common  C language headers.  We should use this macro
dnl as parameter for all the GNU Autoconf macros that preprocess a C language program in tests.
dnl
dnl Usage example:
dnl
dnl     MMUX_DEFINE_VALUEOF_TEST([SIZEOF_MY_TYPE], [sizeof(my_type_t)],
dnl       [MMUX_BASH_COMMON_INCLUDES_FOR_TESTS])
dnl
m4_define([MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],[
dnl According to the documentation of GNU  Autoconf 2.72: "AC_INCLUDES_DEFAULT" should expand to the
dnl include   directives  for:   "stdio.h",   "stdlib.h",   "string.h",  "inttypes.h",   "stdint.h",
dnl "strings.h", "sys/types.h", "sys/stat.h", and "unistd.h".
dnl
dnl It also checks all those headers as a side effect of this macro use's expansion.
dnl
AC_INCLUDES_DEFAULT

dnl Let's try to keep this in alphabetical order.
dnl
AC_INCLUDES_DEFAULT([
#ifdef HAVE_ASSERT_H
#  include <assert.h>
#endif

#ifdef HAVE_COMPLEX_H
#  include <complex.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_FLOAT_H
#  include <float.h>
#endif

#ifdef HAVE_LIMITS_H
#  include <limits.h>
#endif

#ifdef HAVE_MATH_H
#  include <math.h>
#endif

#ifdef HAVE_STDBOOL_H
#  include <stdbool.h>
#endif

#ifdef HAVE_STDDEF_H
#  include <stddef.h>
#endif

#ifdef HAVE_WCHAR_H
#  include <wchar.h>
#endif
])])


dnl MMUX_DEFINE_VALUEOF_TEST --
dnl
dnl Synopsis:
dnl
dnl     MMUX_DEFINE_VALUEOF_TEST(STEM, EXPRESSION, INCLUDES)
dnl
dnl Determine the value of a C language constant expression returning an exact integer.
dnl
dnl $1 - Mandatory uppercase stem used to generate output variables and C preprocessor symbols.
dnl $2 - Mandatory C language expression which, executed in a C program, returns the constant.
dnl $3 - Optional include directives for the C language preprocessor.
dnl
dnl Usage example:
dnl
dnl     MMUX_DEFINE_VALUEOF_TEST([EINVAL], [EINVAL])
dnl
dnl determine the existence and value of the "errno" constant "EINVAL"; results:
dnl
dnl mmux_cv_valueof_EINVAL
dnl
dnl     A shell variable used  to cache the result.  If the symbol "EINVAL"  exists: the shell value
dnl     is the value of the constant itself.  If the symbol "EINVAL" does not exist: the shell value
dnl     is the string "MMUX_META_VALUE_UNDEFINED".
dnl
dnl MMUX_HAVE_EINVAL
dnl
dnl     A C language  preprocessor symbol.  If the symbol "EINVAL"  exists: the preprocessor symbols
dnl     is defined to  be "1".  If the symbol  "EINVAL" does not exist: the  preprocessor symbols is
dnl     defined to be "0".
dnl
AC_DEFUN([MMUX_DEFINE_VALUEOF_TEST],
  [AC_CACHE_CHECK([the value of '$2'],
     [mmux_cv_valueof_$1],
     [AC_COMPUTE_INT([mmux_cv_valueof_$1], [$2], [$3],
        [AS_VAR_SET([mmux_cv_valueof_$1],[MMUX_META_VALUE_UNDEFINED])])])
    AS_IF([test "x$mmux_cv_valueof_$1" = xMMUX_META_VALUE_UNDEFINED],
          [AS_VAR_SET([MMUX_HAVE_$1],[0])],
          [AS_VAR_SET([MMUX_HAVE_$1],[1])])
    AC_DEFINE_UNQUOTED([MMUX_HAVE_$1],   [$MMUX_HAVE_$1],[The value $1 of errno is defined.])
    AC_DEFINE_UNQUOTED([MMUX_VALUEOF_$1],[$mmux_cv_valueof_$1],[The value $1 of errno.])])


dnl MMUX_BASH_ENABLE_MBFL --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_ENABLE_MBFL([MBFL_REQUIRED_VERSION])
dnl
dnl Add to "configure" the command line option  "--enable-mbfl" to enble use of the external package
dnl MBFL for testing.  The default is to enable it.
dnl
dnl $1 - Mandatory semantic version specification requiring a version of MBFL.
dnl
dnl Usage example:
dnl
dnl     MMUX_BASH_ENABLE_MBFL([v3.0.0])
dnl
AC_DEFUN([MMUX_BASH_ENABLE_MBFL],[
  AC_ARG_ENABLE([mbfl],
    [AS_HELP_STRING([--enable-mbfl],[enable using MBFL for testing (default: yes)])],
    [AS_VAR_SET([MMUX_ENABLED_MBFL],[$enableval])],
    [AS_VAR_SET([MMUX_ENABLED_MBFL],[yes])])
  AS_IF([test "x$MMUX_ENABLED_MBFL" = 'xyes'],
        [MBFL_SETUP(v3.0.0)])
  AM_CONDITIONAL([MMUX_BASH_TESTING_ENABLED],[test "x$MMUX_ENABLED_MBFL" = 'xyes'])])


dnl MMUX_BASH_TYPE_DETERMINE_SIZEOF --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_SIZEOF(STEM, TYPEDEF, INCLUDES)
dnl
dnl Parameters:
dnl
dnl $1 - The custom type stem, used to define output names.
dnl $2 - The custom type name, usually a C language "typedef".
dnl $3 - Optional C language preprocessor directives to include header files;
dnl      defaults to MMUX_BASH_COMMON_INCLUDES_FOR_TESTS.
dnl
dnl Description:
dnl
dnl     Determine the size in bytes of the C language type TYEPDEF, which can be either a standard C
dnl     language type or a custom type definition.
dnl
dnl     If an error occurs determining the type size: all the results will report a size of zero.
dnl
dnl     The parameter STEM is conerted to upper case or  lower case as needed, so it does not matter
dnl     if tha parameter itself is upper case or lower case.
dnl
dnl     Notice  that GNU  Autoconf already  defines "AC_CHECK_SIZEOF",  but sometimes  someone might
dnl     prefer this macros.
dnl
dnl Usage example:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_SIZEOF(SSIZE, ssize_t)
dnl
dnl determine the size of the standard C language type  "ssize_t"; we expect it to be 4 or 8.  Usage
dnl example results:
dnl
dnl mmux_cv_sizeof_ssize
dnl
dnl     Cached shell variable representing the result of  the test: the size measured in bytes.  The
dnl     stem "ssize" is the result of converting the parameter STEM to lower case.
dnl
dnl MMUX_BASH_TYPE_SIZEOF_SSIZE
dnl
dnl     C language preprocessor  symbol which will expand  to the size measured in  bytes.  The stem
dnl     "SSIZE" is the result of converting the parameter STEM to upper case.
dnl
AC_DEFUN([MMUX_BASH_TYPE_DETERMINE_SIZEOF],
  [AC_CACHE_CHECK([the size in bytes of the C language type '$2'],
     [mmux_cv_sizeof_[]m4_tolower($1)],
     [AC_COMPUTE_INT([mmux_cv_sizeof_[]m4_tolower($1)],
        [sizeof($2)],
        [m4_ifblank([$3],[MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],[$3])],
        [AS_VAR_SET([mmux_cv_sizeof_[]m4_tolower($1)],[0])])])
   AC_DEFINE_UNQUOTED(MMUX_BASH_TYPE_SIZEOF_[]m4_toupper($1),
                      [$mmux_cv_sizeof_[]m4_tolower($1)],
                      [The size measured in bytes of '$2'.])])


dnl MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS(STEM, TYPEDEF)
dnl
dnl Parameters:
dnl
dnl $1 - The custom type stem, used to define output names.
dnl $2 - The custom type name, usually a C language "typedef".
dnl
dnl Description:
dnl
dnl     Determine the standard C  language type of which the exact signed  integer type "TYPEDEF" is
dnl     an alias; the  standard type is represented  by one of the stems:  "schar", "sshrt", "sint",
dnl     "slong", "sllong", "sint8", "sint16", "sint32", "sint64".
dnl
dnl     It is a fatal error if a standard stem alias is not found.
dnl
dnl     The parameter STEM is conerted to upper case or  lower case as needed, so it does not matter
dnl     if tha parameter itself is upper case or lower case.
dnl
dnl Prerequisites:
dnl
dnl     The expansion of this macro must be executed only after the expansion of the following macro
dnl     use has been executed:
dnl
dnl             MMUX_BASH_TYPE_DETERMINE_SIZEOF(STEM, TYPEDEF)
dnl
dnl Usage example:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS([SSIZE],[ssize_t])
dnl
dnl determine the standard  C language type of which  the exact signed integer type  "ssize_t" is an
dnl alias; we expect the alias to be "sint" or "slong".  Usage example results:
dnl
dnl mmux_cv_type_stem_alias_of_ssize
dnl
dnl     Cached  shell variable  representing the  result of  the test:  the variable  is set  to the
dnl     standard stem.   The stem "ssize" is  the result of  converting the parameter STEM  to lower
dnl     case.
dnl
dnl MMUX_BASH_TYPE_STANDARD_STEM_ALIAS_OF_SSIZE
dnl
dnl     Substitution symbol which expands into the standard stem.  The stem "SSIZE" is the result of
dnl     converting the parameter STEM to upper case.
dnl
AC_DEFUN([MMUX_BASH_TYPE_DETERMINE_CUSTOM_SIGNED_INTEGER_ALIAS],
  [AC_CACHE_CHECK([the standard exact signed integer type alias of the custom exact signed integer '$2' (size=$mmux_cv_sizeof_[]m4_tolower($1))],
     [mmux_cv_type_stem_alias_of_[]m4_tolower($1)],
     [AS_CASE([$mmux_cv_sizeof_[]m4_tolower($1)],

        [$mmux_cv_sizeof_schar],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[schar])],

        [$mmux_cv_sizeof_sshort],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sshort])],

        [$mmux_cv_sizeof_sint],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sint])],

        [$mmux_cv_sizeof_slong],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[slong])],

        [$mmux_cv_sizeof_sllong],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sllong])],

        [$mmux_cv_sizeof_sint8],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sint8])],

        [$mmux_cv_sizeof_sint16],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sint16])],

        [$mmux_cv_sizeof_sint32],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sint32])],

        [$mmux_cv_sizeof_sint64],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[sint64])],

        dnl There is no stadard alias.  This should not happen.
        [AC_MSG_ERROR([unable to determine exact signed integer standard C language type alias of '$2'])])])
   AC_SUBST(MMUX_BASH_TYPE_STANDARD_STEM_ALIAS_OF_[]m4_toupper($1),[$mmux_cv_type_stem_alias_of_[]m4_tolower($1)])])


dnl MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS(STEM, TYPEDEF)
dnl
dnl Parameters:
dnl
dnl $1 - The custom type stem, used to define output names.
dnl $2 - The custom type name, usually a C language "typedef".
dnl
dnl Description:
dnl
dnl     Determine the standard C language type of which the exact unsigned integer type "TYPEDEF" is
dnl     an alias; the  standard type is represented  by one of the stems:  "uchar", "ushrt", "uint",
dnl     "ulong", "ullong", "uint8", "uint16", "uint32", "uint64".
dnl
dnl     It is a fatal error if a standard stem alias is not found.
dnl
dnl     The parameter STEM is conerted to upper case or  lower case as needed, so it does not matter
dnl     if tha parameter itself is upper case or lower case.
dnl
dnl Prerequisites:
dnl
dnl     The expansion of this macro must be executed only after the expansion of the following macro
dnl     use has been executed:
dnl
dnl             MMUX_BASH_TYPE_DETERMINE_SIZEOF(STEM, TYPEDEF)
dnl
dnl Usage example:
dnl
dnl     MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS([USIZE],[size_t])
dnl
dnl determine the standard C  language type of which the exact unsigned integer  type "size_t" is an
dnl alias; we expect the alias to be "uint" or "ulong".  Usage example results:
dnl
dnl mmux_cv_type_stem_alias_of_usize
dnl
dnl     Cached  shell variable  representing the  result of  the test:  the variable  is set  to the
dnl     standard stem.   The stem "usize" is  the result of  converting the parameter STEM  to lower
dnl     case.
dnl
dnl MMUX_BASH_TYPE_STANDARD_STEM_ALIAS_OF_USIZE
dnl
dnl     Substitution symbol which expands into the standard stem.  The stem "USIZE" is the result of
dnl     converting the parameter STEM to upper case.
dnl
AC_DEFUN([MMUX_BASH_TYPE_DETERMINE_CUSTOM_UNSIGNED_INTEGER_ALIAS],
  [AC_CACHE_CHECK([the standard exact signed integer type alias of the custom exact signed integer '$2' (size=$mmux_cv_sizeof_[]m4_tolower($1))],
     [mmux_cv_type_stem_alias_of_[]m4_tolower($1)],
     [AS_CASE([$mmux_cv_sizeof_[]m4_tolower($1)],

        [$mmux_cv_sizeof_uchar],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uchar])],

        [$mmux_cv_sizeof_ushort],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[ushort])],

        [$mmux_cv_sizeof_uint],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uint])],

        [$mmux_cv_sizeof_ulong],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[ulong])],

        [$mmux_cv_sizeof_ullong],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[ullong])],

        [$mmux_cv_sizeof_uint8],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uint8])],

        [$mmux_cv_sizeof_uint16],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uint16])],

        [$mmux_cv_sizeof_uint32],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uint32])],

        [$mmux_cv_sizeof_uint64],
        [AS_VAR_SET([mmux_cv_type_stem_alias_of_[]m4_tolower($1)],[uint64])],

        dnl There is no stadard alias.  This should not happen.
        [AC_MSG_ERROR([unable to determine exact signed integer standard C language type alias of '$2'])])])
   AC_SUBST(MMUX_BASH_TYPE_STANDARD_STEM_ALIAS_OF_[]m4_toupper($1),[$mmux_cv_type_stem_alias_of_[]m4_tolower($1)])])


dnl let's go

dnl end of file
dnl Local Variables:
dnl mode: autoconf
dnl End:
