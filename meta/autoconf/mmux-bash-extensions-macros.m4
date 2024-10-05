dnl mmux-bash-extensions-macros.m4 --
dnl
dnl Basic definitions for MMUX packages.
dnl
dnl LICENSE
dnl
dnl Copyright (c) 2024 Marco Maggi <mrc.mgg@gmail.com>
dnl
dnl This program is free  software: you can redistribute it and/or modify it  under the terms of the
dnl GNU General Public License as published by the Free Software Foundation, either version 3 of the
dnl License, or (at your option) any later version.
dnl
dnl This program  is distributed  in the  hope that  it will  be useful,  but WITHOUT  ANY WARRANTY;
dnl without even the implied  warranty of MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See
dnl the GNU General Public License for more details.
dnl
dnl You should have received  a copy of the GNU General Public License  along with this program.  If
dnl not, see <http://www.gnu.org/licenses/>.
dnl


dnl MMUX_BASH_SAVE_VARIABLE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_SAVE_VARIABLE([VARNAME],[BODY])
dnl
dnl Parameters:
dnl
dnl     $1 - The name of the variable to save.
dnl     $2 - The body to evaluate while the variable has been saved.
dnl
dnl Description:
dnl
dnl     Save the value of a shell variable while evaluating  a body of code.  Uses of this macro can
dnl     be nested, but not for the same variable.
dnl
dnl             MMUX_BASH_SAVE_VARIABLE([LIBS],
dnl               [AS_VAR_APPEND([LIBS],[" -lmylib"])
dnl                ...])
dnl
AC_DEFUN([MMUX_BASH_SAVE_VARIABLE],[mmux_OLD_$1=$[]$1
$2
$1=$[]mmux_OLD_$1])


dnl MMUX_BASH_CHECK_COMMON_HEADERS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_CHECK_COMMON_HEADERS
dnl
dnl Description:
dnl
dnl     Check  for all  the  common C  language  headers needed  when writing  a  GNU Bash  builtins
dnl     extension; and probably something more.  We should just use this macro somewhere like this:
dnl
dnl             AC_LANG([C])
dnl             ...
dnl             MMUX_BASH_CHECK_COMMON_HEADERS
dnl
AC_DEFUN([MMUX_BASH_CHECK_COMMON_HEADERS],
  [AC_HEADER_ASSERT
   AC_HEADER_STDBOOL
   dnl AC_HEADER_SYS_WAIT
   AC_CHECK_HEADERS([complex.h ctype.h errno.h float.h limits.h math.h stddef.h wchar.h])])


dnl MMUX_BASH_COMMON_INCLUDES_FOR_TESTS --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_COMMON_INCLUDES_FOR_TESTS
dnl
dnl Description:
dnl
dnl     Expand into include  directives for all the  common C language headers.  We  should use this
dnl     macro as parameter for  all the GNU Autoconf macros that preprocess a  C language program in
dnl     tests.
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

#ifdef HAVE_CTYPE_H
#  include <ctype.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_FCNTL_H
#  include <fcntl.h>
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


dnl MMUX_CHECK_C_LANGUAGE_TYPES_CORE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_C_LANGUAGE_TYPES_CORE
dnl
dnl Description:
dnl
dnl     Check the availability of all the supported C language types.
dnl
dnl     Even if we test for types that the package does not use: it does not hurt anyone.
dnl
AC_DEFUN([MMUX_CHECK_C_LANGUAGE_TYPES_CORE],
  [MMUX_CHECK_TYPE_SLLONG
   MMUX_CHECK_TYPE_ULLONG
   MMUX_CHECK_TYPE_LDOUBLE

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
   AC_TYPE_UID_T])


dnl MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_FLOAT --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_FLOAT
dnl
dnl Description:
dnl
dnl     Check  the availability  of all  the supported  C language  types "_FloatN"  and "_FloatNx".
dnl     These types should not require an external library.
dnl
AC_DEFUN([MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_FLOAT],
  [MMUX_CHECK_TYPE_FLOAT32
   MMUX_CHECK_TYPE_FLOAT64
   MMUX_CHECK_TYPE_FLOAT128
   MMUX_CHECK_TYPE_FLOAT32X
   MMUX_CHECK_TYPE_FLOAT64X
   MMUX_CHECK_TYPE_FLOAT128X])


dnl MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_DECIMAL_FLOAT --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_DECIMAL_FLOAT
dnl
dnl Description:
dnl
dnl     Check the availability of all the supported C language types "_DecimalN".
dnl
dnl     At the  time of  this writing (Oct  2, 2024)  support for these  types probably  requires an
dnl     external library, so the macro:
dnl
dnl             MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY
dnl
dnl     should be  used to search  for such library.   All the macros used  to check for  a specific
dnl     "_DecimalN" type should "AC_REQUIRE" such macro, so we do not do it here.
dnl
AC_DEFUN([MMUX_CHECK_C_LANGUAGE_TYPES_EXTENSION_DECIMAL_FLOAT],
  [MMUX_CHECK_TYPE_DECIMAL32
   MMUX_CHECK_TYPE_DECIMAL64
   MMUX_CHECK_TYPE_DECIMAL128])



dnl MMUX_CHECK_TYPE_SLLONG --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_SLLONG
dnl
dnl Description:
dnl
dnl     Check if  the underlying platform  supports the standard C  language type "signed  long long
dnl     int".  If it does: define the C language preprocessor symbol "MMUX_HAVE_TYPE_SLLONG" to "1".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_SLLONG],
  [AC_TYPE_LONG_LONG_INT
   AS_IF([test "x$ac_cv_type_long_long_int" = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_SLLONG],[1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_SLLONG],[0])])
   AC_SUBST([MMUX_HAVE_TYPE_SLLONG])])


dnl MMUX_CHECK_TYPE_ULLONG --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_ULLONG
dnl
dnl Description:
dnl
dnl     Check if the underlying  platform supports the standard C language  type "unsigned long long
dnl     int".  If it does: define the C language preprocessor symbol "MMUX_HAVE_TYPE_ULLONG" to "1".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_ULLONG],
  [AC_TYPE_UNSIGNED_LONG_LONG_INT
   AS_IF([test "x$ac_cv_type_unsigned_long_long_int" = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_ULLONG],[1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_ULLONG],[0])])
   AC_SUBST([MMUX_HAVE_TYPE_ULLONG])])


dnl MMUX_CHECK_TYPE_LDOUBLE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_LDOUBLE
dnl
dnl Description:
dnl
dnl     Check if the underlying platform supports the standard C language type "long double".  If it
dnl     does:
dnl
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_LDOUBLE";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXLD".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_LDOUBLE],
  [AC_TYPE_LONG_DOUBLE
   AS_IF([test "x$ac_cv_type_long_double"   = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_LDOUBLE],  [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXLD],[1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_LDOUBLE],  [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXLD],[0])])
   AC_SUBST([MMUX_HAVE_TYPE_LDOUBLE])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXLD])])


dnl MMUX_CHECK_TYPE_FLOAT32 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT32
dnl
dnl Description:
dnl
dnl     Check if the  underlying platform supports the  standard C language type  "_Float32".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT32";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF32";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT32";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF32".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT32],
  [AC_CHECK_TYPE([_Float32])
   AC_CHECK_FUNC([strtof32])
   AC_CHECK_FUNC([strfromf32])
   AC_CHECK_FUNC([fabsf32])
   AC_CHECK_FUNC([fmaxf32])
   AC_CHECK_FUNC([fminf32])
   AC_CHECK_FUNC([crealf32])
   AC_CHECK_FUNC([cimagf32])
   AS_IF([test "x$ac_cv_type__Float32"          = "xyes"        \
            -a "x$ac_cv_func_strtof32"          = "xyes"        \
            -a "x$ac_cv_func_strfromf32"        = "xyes"        \
            -a "x$ac_cv_func_fabsf32"           = "xyes"        \
            -a "x$ac_cv_func_fmaxf32"           = "xyes"        \
            -a "x$ac_cv_func_fminf32"           = "xyes"        \
            -a "x$ac_cv_func_crealf32"          = "xyes"        \
            -a "x$ac_cv_func_cimagf32"          = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT32],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF32], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT32],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF32], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT32],   [$MMUX_HAVE_TYPE_FLOAT32],    [Defined to 1 if the platform supports _Float32.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF32],[$MMUX_HAVE_TYPE_COMPLEXF32], [Defined to 1 if the platform supports _Float32 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT32])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF32])])


dnl MMUX_CHECK_TYPE_FLOAT64 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT64
dnl
dnl Description:
dnl
dnl     Check if the  underlying platform supports the  standard C language type  "_Float64".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT64";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF64";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT64";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF64".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT64],
  [AC_CHECK_TYPE([_Float64])
   AC_CHECK_FUNC([strtof64])
   AC_CHECK_FUNC([strfromf64])
   AC_CHECK_FUNC([fabsf64])
   AC_CHECK_FUNC([fmaxf64])
   AC_CHECK_FUNC([fminf64])
   AC_CHECK_FUNC([crealf64])
   AC_CHECK_FUNC([cimagf64])
   AS_IF([test "x$ac_cv_type__Float64"          = "xyes"        \
            -a "x$ac_cv_func_strtof64"          = "xyes"        \
            -a "x$ac_cv_func_strfromf64"        = "xyes"        \
            -a "x$ac_cv_func_fabsf64"           = "xyes"        \
            -a "x$ac_cv_func_fmaxf64"           = "xyes"        \
            -a "x$ac_cv_func_fminf64"           = "xyes"        \
            -a "x$ac_cv_func_crealf64"          = "xyes"        \
            -a "x$ac_cv_func_cimagf64"          = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT64],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF64], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT64],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF64], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT64],   [$MMUX_HAVE_TYPE_FLOAT64],    [Defined to 1 if the platform supports _Float64.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF64],[$MMUX_HAVE_TYPE_COMPLEXF64], [Defined to 1 if the platform supports _Float64 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT64])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF64])])


dnl MMUX_CHECK_TYPE_FLOAT128 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT128
dnl
dnl Description:
dnl
dnl     Check if the underlying  platform supports the standard C language  type "_Float128".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT128";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF128";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT128";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF128".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT128],
  [AC_CHECK_TYPE([_Float128])
   AC_CHECK_FUNC([strtof128])
   AC_CHECK_FUNC([strfromf128])
   AC_CHECK_FUNC([fabsf128])
   AC_CHECK_FUNC([fmaxf128])
   AC_CHECK_FUNC([fminf128])
   AC_CHECK_FUNC([crealf128])
   AC_CHECK_FUNC([cimagf128])
   AS_IF([test "x$ac_cv_type__Float128"         = "xyes"        \
            -a "x$ac_cv_func_strtof128"         = "xyes"        \
            -a "x$ac_cv_func_strfromf128"       = "xyes"        \
            -a "x$ac_cv_func_fabsf128"          = "xyes"        \
            -a "x$ac_cv_func_fmaxf128"          = "xyes"        \
            -a "x$ac_cv_func_fminf128"          = "xyes"        \
            -a "x$ac_cv_func_crealf128"         = "xyes"        \
            -a "x$ac_cv_func_cimagf128"         = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT128],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF128], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT128],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF128], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT128],   [$MMUX_HAVE_TYPE_FLOAT128],    [Defined to 1 if the platform supports _Float128.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF128],[$MMUX_HAVE_TYPE_COMPLEXF128], [Defined to 1 if the platform supports _Float128 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT128])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF128])])


dnl MMUX_CHECK_TYPE_FLOAT32X --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT32X
dnl
dnl Description:
dnl
dnl     Check if the underlying  platform supports the standard C language  type "_Float32x".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT32X";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF32X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT32X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF32X".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT32X],
  [AC_CHECK_TYPE([_Float32x])
   AC_CHECK_FUNC([strtof32x])
   AC_CHECK_FUNC([strfromf32x])
   AC_CHECK_FUNC([fabsf32x])
   AC_CHECK_FUNC([fmaxf32x])
   AC_CHECK_FUNC([fminf32x])
   AC_CHECK_FUNC([crealf32x])
   AC_CHECK_FUNC([cimagf32x])
   AS_IF([test "x$ac_cv_type__Float32x"         = "xyes"        \
            -a "x$ac_cv_func_strtof32x"         = "xyes"        \
            -a "x$ac_cv_func_strfromf32x"       = "xyes"        \
            -a "x$ac_cv_func_fabsf32x"          = "xyes"        \
            -a "x$ac_cv_func_fmaxf32x"          = "xyes"        \
            -a "x$ac_cv_func_fminf32x"          = "xyes"        \
            -a "x$ac_cv_func_crealf32x"         = "xyes"        \
            -a "x$ac_cv_func_cimagf32x"         = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT32X],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF32X], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT32X],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF32X], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT32X],   [$MMUX_HAVE_TYPE_FLOAT32X],    [Defined to 1 if the platform supports _Float32x.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF32X],[$MMUX_HAVE_TYPE_COMPLEXF32X], [Defined to 1 if the platform supports _Float32x complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT32X])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF32X])])


dnl MMUX_CHECK_TYPE_FLOAT64X --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT64X
dnl
dnl Description:
dnl
dnl     Check if the underlying  platform supports the standard C language  type "_Float64x".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT64X";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF64X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT64X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF64X".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT64X],
  [AC_CHECK_TYPE([_Float64x])
   AC_CHECK_FUNC([strtof64x])
   AC_CHECK_FUNC([strfromf64x])
   AC_CHECK_FUNC([fabsf64x])
   AC_CHECK_FUNC([fmaxf64x])
   AC_CHECK_FUNC([fminf64x])
   AC_CHECK_FUNC([crealf64x])
   AC_CHECK_FUNC([cimagf64x])
   AS_IF([test "x$ac_cv_type__Float64x"         = "xyes"        \
            -a "x$ac_cv_func_strtof64x"         = "xyes"        \
            -a "x$ac_cv_func_strfromf64x"       = "xyes"        \
            -a "x$ac_cv_func_fabsf64x"          = "xyes"        \
            -a "x$ac_cv_func_fmaxf64x"          = "xyes"        \
            -a "x$ac_cv_func_fminf64x"          = "xyes"        \
            -a "x$ac_cv_func_crealf64x"         = "xyes"        \
            -a "x$ac_cv_func_cimagf64x"         = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT64X],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF64X], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT64X],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF64X], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT64X],   [$MMUX_HAVE_TYPE_FLOAT64X],    [Defined to 1 if the platform supports _Float64x.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF64X],[$MMUX_HAVE_TYPE_COMPLEXF64X], [Defined to 1 if the platform supports _Float64x complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT64X])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF64X])])


dnl MMUX_CHECK_TYPE_FLOAT128X --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_FLOAT128X
dnl
dnl Description:
dnl
dnl     Check if the underlying platform supports the  standard C language type "_Float128x".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_FLOAT128X";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXF128X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_FLOAT128X";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF128X".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_FLOAT128X],
  [AC_CHECK_TYPE([_Float128x])
   AC_CHECK_FUNC([strtof128x])
   AC_CHECK_FUNC([strfromf128x])
   AC_CHECK_FUNC([fabsf128x])
   AC_CHECK_FUNC([fmaxf128x])
   AC_CHECK_FUNC([fminf128x])
   AC_CHECK_FUNC([crealf128x])
   AC_CHECK_FUNC([cimagf128x])
   AS_IF([test "x$ac_cv_type__Float128x"        = "xyes"        \
            -a "x$ac_cv_func_strtof128x"        = "xyes"        \
            -a "x$ac_cv_func_strfromf128x"      = "xyes"        \
            -a "x$ac_cv_func_fabsf128x"         = "xyes"        \
            -a "x$ac_cv_func_fmaxf128x"         = "xyes"        \
            -a "x$ac_cv_func_fminf128x"         = "xyes"        \
            -a "x$ac_cv_func_crealf128x"        = "xyes"        \
            -a "x$ac_cv_func_cimagf128x"        = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT128X],    [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF128X], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_FLOAT128X],    [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXF128X], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_FLOAT128X],   [$MMUX_HAVE_TYPE_FLOAT128X],    [Defined to 1 if the platform supports _Float128x.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXF128X],[$MMUX_HAVE_TYPE_COMPLEXF128X], [Defined to 1 if the platform supports _Float128x complex.])
   AC_SUBST([MMUX_HAVE_TYPE_FLOAT128X])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXF128X])])


dnl MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY
dnl
dnl Description:
dnl
dnl     Check  the  availability of  a  Decimal  Floating Point  C  Library  implementing the  usual
dnl     functions for the decimal floating-point  number types: _Decimal32, _Decimal64, _Decimal128.
dnl     If the library is found:
dnl
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXF128X".
dnl
dnl     * set  the variable "MMUX_DECIMAL_FLOATING_POINT_LIBRARY_LIBS"  to the list of  linker flags
dnl     required to link with the library;
dnl
dnl     *  set the  variable "MMUX_DECIMAL_FLOATING_POINT_LIBRARY_CFLAGS"  to the  list of  compiler
dnl     flags required to compile with the library.
dnl
AC_DEFUN([MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY],
  [PKG_CHECK_MODULES([LIBDFP],[libdfp],,[AC_MSG_WARN([package libdfp not found])])
dnl AC_CHECK_LIB([dfp],[strtod32])
   AS_IF([test -n "$pkg_cv_LIBDFP_LIBS"],
         [AS_VAR_SET([MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY],[1])],
         [AS_VAR_SET([MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY],[0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY],[$MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY],
                      [Defined to 1 if a Decimal Floating Point C Library is available.])
   AC_SUBST([MMUX_HAVE_DECIMAL_FLOATING_POINT_C_LIBRARY])
   AS_VAR_SET([MMUX_DECIMAL_FLOATING_POINT_LIBRARY_LIBS],[$LIBDFP_LIBS])
   AS_VAR_SET([MMUX_DECIMAL_FLOATING_POINT_LIBRARY_CFLAGS],[$LIBDFP_CFLAGS])])


dnl MMUX_CHECK_TYPE_DECIMAL32 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_DECIMAL32
dnl
dnl Description:
dnl
dnl     Check if the underlying platform supports the  standard C language type "_Decimal32".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_DECIMAL32";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXD32";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_DECIMAL32";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXD32".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_DECIMAL32],
  [AC_REQUIRE([MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY])
   AC_CHECK_TYPE([_Decimal32])
   mmux_OLD_CFLAGS=$CFLAGS
   CFLAGS="$CFLAGS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_CFLAGS"
   {
     mmux_OLD_LIBS=$LIBS
     LIBS="$LIBS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_LIBS"
     {
       AC_CHECK_FUNC([strtod32])
       AC_CHECK_FUNC([strfromd32])
       AC_CHECK_FUNC([fabsd32])
       AC_CHECK_FUNC([fmaxd32])
       AC_CHECK_FUNC([fmind32])
     }
     LIBS=$mmux_OLDLIBS
   }
   CFLAGS=$mmux_OLDCFLAGS
   AS_IF([test "x$ac_cv_type__Decimal32"   = "xyes"  \
            -a "x$ac_cv_func_strtod32"     = "xyes"  \
            -a "x$ac_cv_func_strfromd32"   = "xyes"  \
            -a "x$ac_cv_func_fabsd32"      = "xyes"  \
            -a "x$ac_cv_func_fmaxd32"      = "xyes"  \
            -a "x$ac_cv_func_fmind32"      = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL32],  [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD32], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL32],  [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD32], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_DECIMAL32],  [$MMUX_HAVE_TYPE_DECIMAL32],  [Defined to 1 if the platform supports _Decimal32.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXD32], [$MMUX_HAVE_TYPE_COMPLEXD32], [Defined to 1 if the platform supports _Decimal32 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_DECIMAL32])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXD32])])


dnl MMUX_CHECK_TYPE_DECIMAL64 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_DECIMAL64
dnl
dnl Description:
dnl
dnl     Check if the underlying platform supports the  standard C language type "_Decimal64".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_DECIMAL64";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXD64";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_DECIMAL64";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXD64".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_DECIMAL64],
  [AC_REQUIRE([MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY])
   AC_CHECK_TYPE([_Decimal64])
   mmux_OLD_CFLAGS=$CFLAGS
   CFLAGS="$CFLAGS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_CFLAGS"
   {
     mmux_OLD_LIBS=$LIBS
     LIBS="$LIBS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_LIBS"
     {
       AC_CHECK_FUNC([strtod64])
       AC_CHECK_FUNC([strfromd64])
       AC_CHECK_FUNC([fabsd64])
       AC_CHECK_FUNC([fmaxd64])
       AC_CHECK_FUNC([fmind64])
     }
     LIBS=$mmux_OLDLIBS
   }
   CFLAGS=$mmux_OLDCFLAGS
   AS_IF([test "x$ac_cv_type__Decimal64"   = "xyes"  \
            -a "x$ac_cv_func_strtod64"     = "xyes"  \
            -a "x$ac_cv_func_strfromd64"   = "xyes"  \
            -a "x$ac_cv_func_fabsd64"      = "xyes"  \
            -a "x$ac_cv_func_fmaxd64"      = "xyes"  \
            -a "x$ac_cv_func_fmind64"      = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL64],  [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD64], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL64],  [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD64], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_DECIMAL64],  [$MMUX_HAVE_TYPE_DECIMAL64],  [Defined to 1 if the platform supports _Decimal64.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXD64], [$MMUX_HAVE_TYPE_COMPLEXD64], [Defined to 1 if the platform supports _Decimal64 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_DECIMAL64])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXD64])])


dnl MMUX_CHECK_TYPE_DECIMAL128 --
dnl
dnl Synopsis:
dnl
dnl     MMUX_CHECK_TYPE_DECIMAL128
dnl
dnl Description:
dnl
dnl     Check if the underlying platform supports the  standard C language type "_Decimal128".  If it
dnl     does:
dnl
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_DECIMAL128";
dnl     * define to "1" the C language preprocessor symbol "MMUX_HAVE_TYPE_COMPLEXD128";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_DECIMAL128";
dnl     * define to "1" the GNU Autoconf substitution symbol "MMUX_HAVE_TYPE_COMPLEXD128".
dnl
AC_DEFUN([MMUX_CHECK_TYPE_DECIMAL128],
  [AC_REQUIRE([MMUX_CHECK_DECIMAL_FLOATING_POINT_C_LIBRARY])
   AC_CHECK_TYPE([_Decimal128])
   mmux_OLD_CFLAGS=$CFLAGS
   CFLAGS="$CFLAGS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_CFLAGS"
   {
     mmux_OLD_LIBS=$LIBS
     LIBS="$LIBS $MMUX_DECIMAL_FLOATING_POINT_LIBRARY_LIBS"
     {
       AC_CHECK_FUNC([strtod128])
       AC_CHECK_FUNC([strfromd128])
       AC_CHECK_FUNC([fabsd128])
       AC_CHECK_FUNC([fmaxd128])
       AC_CHECK_FUNC([fmind128])
     }
     LIBS=$mmux_OLDLIBS
   }
   CFLAGS=$mmux_OLDCFLAGS
   AS_IF([test "x$ac_cv_type__Decimal128"  = "xyes"  \
            -a "x$ac_cv_func_strtod128"    = "xyes"  \
            -a "x$ac_cv_func_strfromd128"  = "xyes"  \
            -a "x$ac_cv_func_fabsd128"     = "xyes"  \
            -a "x$ac_cv_func_fmaxd128"     = "xyes"  \
            -a "x$ac_cv_func_fmind128"     = "xyes"],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL128],  [1])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD128], [1])],
         [AS_VAR_SET([MMUX_HAVE_TYPE_DECIMAL128],  [0])
          AS_VAR_SET([MMUX_HAVE_TYPE_COMPLEXD128], [0])])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_DECIMAL128],  [$MMUX_HAVE_TYPE_DECIMAL128],  [Defined to 1 if the platform supports _Decimal128.])
   AC_DEFINE_UNQUOTED([MMUX_HAVE_TYPE_COMPLEXD128], [$MMUX_HAVE_TYPE_COMPLEXD128], [Defined to 1 if the platform supports _Decimal128 complex.])
   AC_SUBST([MMUX_HAVE_TYPE_DECIMAL128])
   AC_SUBST([MMUX_HAVE_TYPE_COMPLEXD128])])


dnl MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE
dnl
dnl Description:
dnl
dnl     Determine the size, measured  in bytes, of all the standard C language  types; only the core
dnl     types  are checked  (int, long,  int32_t, ...),  none of  the feature-specific  typedefs are
dnl     checked (size_t, pid_t, ...).
dnl
AC_DEFUN([MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE],
  [AX_REQUIRE_DEFINED([MMUX_BASH_COMMON_INCLUDES_FOR_TESTS])
   AC_REQUIRE([MMUX_BASH_CHECK_COMMON_HEADERS])
   AC_REQUIRE([AC_TYPE_INT8_T])
   AC_REQUIRE([AC_TYPE_INT16_T])
   AC_REQUIRE([AC_TYPE_INT32_T])
   AC_REQUIRE([AC_TYPE_INT64_T])
   AC_REQUIRE([AC_TYPE_UINT8_T])
   AC_REQUIRE([AC_TYPE_UINT16_T])
   AC_REQUIRE([AC_TYPE_UINT32_T])
   AC_REQUIRE([AC_TYPE_UINT64_T])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([POINTER],    [void *])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SCHAR],      [signed char])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UCHAR],      [unsigned char])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SSHORT],     [signed short int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([USHORT],     [unsigned short int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINT],       [signed int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINT],       [unsigned int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SLONG],      [signed long int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([ULONG],      [unsigned long int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SLLONG],     [signed long long int])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([ULLONG],     [unsigned long long int])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([FLOAT],      [float])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([DOUBLE],     [double])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([LDOUBLE],    [long double])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([COMPLEX],    [double complex])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINT8],      [int8_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINT8],      [uint8_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINT16],     [int16_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINT16],     [uint16_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINT32],     [int32_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINT32],     [uint32_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINT64],     [int64_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINT64],     [uint64_t])])


dnl MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_FEATURES --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_FEATURES
dnl
dnl Description:
dnl
dnl     Determine the  size, measured in bytes,  of all the supported  standard, feature-specific, C
dnl     language  types  (size_t,  pid_t,  ...).   It   also  determines  aliases  that  match  each
dnl     feature-specific type with the raw type; for example:  we expect "size_t" to be an alias for
dnl     "unsigned long" or something like that.
dnl
AC_DEFUN([MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_FEATURES],
  [AX_REQUIRE_DEFINED([MMUX_BASH_COMMON_INCLUDES_FOR_TESTS])
   AC_REQUIRE([MMUX_BASH_CHECK_COMMON_HEADERS])
   AC_REQUIRE([MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE])
   AC_REQUIRE([AC_TYPE_MODE_T])
   AC_REQUIRE([AC_TYPE_OFF_T])
   AC_REQUIRE([AC_TYPE_PID_T])
   AC_REQUIRE([AC_TYPE_SIZE_T])
   AC_REQUIRE([AC_TYPE_SSIZE_T])
   AC_REQUIRE([AC_TYPE_INTMAX_T])
   AC_REQUIRE([AC_TYPE_INTPTR_T])
   AC_REQUIRE([AC_TYPE_UID_T])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SSIZE],      [ssize_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([USIZE],      [size_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINTMAX],    [intmax_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINTMAX],    [uintmax_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([SINTPTR],    [intptr_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UINTPTR],    [uintptr_t])

   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([PTRDIFF],    [ptrdiff_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([MODE],       [mode_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([OFF],        [off_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([UID],        [uid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([PID],        [pid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([GID],        [gid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([WCHAR],      [wchar_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF([WINT],       [wint_t])

   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([SSIZE],        [ssize_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([SINTMAX],      [intmax_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([SINTPTR],      [intptr_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([OFF],          [off_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([PID],          [pid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([PTRDIFF],      [ptrdiff_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([WCHAR],        [wchar_t])

   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([USIZE],      [size_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([UINTMAX],    [uintmax_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([UINTPTR],    [uintptr_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([MODE],       [mode_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([UID],        [uid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([GID],        [gid_t])
   MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([WINT],       [wint_t])])


dnl MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF(STEM, TYPEDEF, INCLUDES)
dnl
dnl Parameters:
dnl
dnl     $1 - The custom type stem, used to define output names.
dnl     $2 - The custom type name, usually a C language "typedef".
dnl     $3 - Optional  C language  preprocessor  directives to  include header  files; defaults  to
dnl          MMUX_BASH_COMMON_INCLUDES_FOR_TESTS.
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
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF(SSIZE, ssize_t)
dnl
dnl     determine the size  of the standard C  language type "ssize_t"; we  expect it to be  4 or 8.
dnl     Usage example results:
dnl
dnl     mmux_cv_sizeof_ssize
dnl
dnl             Cached shell  variable representing  the result  of the test:  the size  measured in
dnl             bytes.  The  stem "ssize" is  the result of converting  the parameter STEM  to lower
dnl             case.
dnl
dnl     MMUX_BASH_TYPE_SIZEOF_SSIZE
dnl
dnl             C language preprocessor symbol which will expand to the size measured in bytes.  The
dnl             stem "SSIZE" is the result of converting the parameter STEM to upper case.
dnl
AC_DEFUN([MMUX_BASH_DETERMINE_C_LANGUAGE_TYPE_SIZEOF],
  [AC_CACHE_CHECK([the size in bytes of the C language type '$2'],
     [mmux_cv_sizeof_[]m4_tolower($1)],
     [AC_COMPUTE_INT([mmux_cv_sizeof_[]m4_tolower($1)],
        [sizeof($2)],
        [m4_ifblank([$3],[MMUX_BASH_COMMON_INCLUDES_FOR_TESTS],[$3])],
        [AS_VAR_SET([mmux_cv_sizeof_[]m4_tolower($1)],[0])])])
   AC_DEFINE_UNQUOTED(MMUX_BASH_TYPE_SIZEOF_[]m4_toupper($1),
                      [$mmux_cv_sizeof_[]m4_tolower($1)],
                      [The size measured in bytes of '$2'.])])


dnl MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE(STEM, TYPEDEF)
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
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([SSIZE],[ssize_t])
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
AC_DEFUN([MMUX_BASH_DETERMINE_C_LANGUAGE_SIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE],
  [AC_REQUIRE([MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE])
   AC_CACHE_CHECK([the standard exact signed integer type alias of the custom exact signed integer '$2' (size=$mmux_cv_sizeof_[]m4_tolower($1))],
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


dnl MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE --
dnl
dnl Synopsis:
dnl
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE(STEM, TYPEDEF)
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
dnl     MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE([USIZE],[size_t])
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
AC_DEFUN([MMUX_BASH_DETERMINE_C_LANGUAGE_UNSIGNED_INTEGER_ALIAS_FOR_CUSTOM_TYPE],
  [AC_REQUIRE([MMUX_BASH_INSPECT_STANDARD_C_LANGUAGE_TYPES_CORE])
   AC_CACHE_CHECK([the standard exact signed integer type alias of the custom exact signed integer '$2' (size=$mmux_cv_sizeof_[]m4_tolower($1))],
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


dnl MMUX_DEFINE_VALUEOF_TEST --
dnl
dnl Synopsis:
dnl
dnl     MMUX_DEFINE_VALUEOF_TEST(STEM, EXPRESSION, INCLUDES)
dnl
dnl Parameters:
dnl
dnl     $1 - Mandatory uppercase stem used to generate output variables and C preprocessor symbols.
dnl     $2 - Mandatory C language expression which, executed in a C program, returns the constant.
dnl     $3 - Optional include directives for the C language preprocessor.
dnl
dnl Description:
dnl
dnl     Determine the value of a C language constant expression returning an exact integer.
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
    AC_DEFINE_UNQUOTED([MMUX_HAVE_$1],   [$MMUX_HAVE_$1],[The constant value $1 is defined.])
    AC_DEFINE_UNQUOTED([MMUX_VALUEOF_$1],[$mmux_cv_valueof_$1],[The constant value $1.])
    AC_SUBST([MMUX_VALUEOF_$1],[$mmux_cv_valueof_$1])])


dnl let's go

dnl end of file
dnl Local Variables:
dnl mode: autoconf
dnl End:
