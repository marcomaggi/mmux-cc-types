/*
  Part of: MMUX Bash Pointers
  Contents: functions to validate the string representation of C language types
  Date: Sep 18, 2024

  Abstract

	This module  functions to  validate the string  representation of  C language
	types.

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

#undef  MMUX_FLOAT_ZERO
#define MMUX_FLOAT_ZERO(STEM)		((mmux_libc_ ## STEM ## _t)0.0)

#undef  MMUX_INTEGER_ZERO
#define MMUX_INTEGER_ZERO(STEM)		((mmux_libc_ ## STEM ## _t)0)


/** --------------------------------------------------------------------
 ** Core C language predicate: floating-point and complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES]]],[[[
#if ($2)
typedef bool mmux_core_predicate_$1_t (mmux_libc_$1_t X);

static inline mmux_core_predicate_$1_t mmux_$1_is_zero;
static inline mmux_core_predicate_$1_t mmux_$1_is_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_nan;
static inline mmux_core_predicate_$1_t mmux_$1_is_infinite;

static inline bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (FP_ZERO == (fpclassify(X)))? true : false;
}
static inline bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (MMUX_FLOAT_ZERO($1) < X)? true : false;
  }
}
static inline bool
mmux_$1_is_negative (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    if (signbit(X)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (MMUX_FLOAT_ZERO($1) > X)? true : false;
  }
}
static inline bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (MMUX_FLOAT_ZERO($1) > X)? true : false;
  }
}
static inline bool
mmux_$1_is_non_negative (mmux_libc_$1_t X)
{
  if (mmux_$1_is_nan(X)) {
    return false;
  } else if (mmux_$1_is_zero(X)) {
    return true;
  } else {
    return (MMUX_FLOAT_ZERO($1) < X)? true : false;
  }
}
static inline bool
mmux_$1_is_nan (mmux_libc_$1_t X)
{
  return (FP_NAN == (fpclassify(X)))? true : false;
}
static inline bool
mmux_$1_is_infinite (mmux_libc_$1_t X)
{
  return (FP_INFINITE == (fpclassify(X)))? true : false;
}
#endif
]]])

MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[float]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[double]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])

/* ------------------------------------------------------------------ */

static inline bool
mmux_complex_is_zero (mmux_libc_complex_t Z)
{
  double	re = creal(Z), im = cimag(Z);

  return (mmux_double_is_zero(re) && mmux_double_is_zero(im))? true : false;
}
static inline bool
mmux_complex_is_positive (mmux_libc_complex_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_complex_is_negative (mmux_libc_complex_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_complex_is_non_positive (mmux_libc_complex_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_complex_is_non_negative (mmux_libc_complex_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_complex_is_nan (mmux_libc_complex_t Z)
{
  double	re = creal(Z), im = cimag(Z);

  return (mmux_double_is_nan(re) || mmux_double_is_nan(im))? true : false;
}
static inline bool
mmux_complex_is_infinite (mmux_libc_complex_t Z)
{
  double	re = creal(Z), im = cimag(Z);

  return (mmux_double_is_infinite(re) || mmux_double_is_infinite(im))? true : false;
}


/** --------------------------------------------------------------------
 ** Core C language predicate: signed integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES]]],[[[
#if ($2)
typedef bool mmux_core_predicate_$1_t (mmux_libc_$1_t X);

static inline mmux_core_predicate_$1_t mmux_$1_is_zero;
static inline mmux_core_predicate_$1_t mmux_$1_is_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_nan;
static inline mmux_core_predicate_$1_t mmux_$1_is_infinite;

static inline bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
static inline bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
static inline bool
mmux_$1_is_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) > X)? true : false;
}
static inline bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) >= X)? true : false;
}
static inline bool
mmux_$1_is_non_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) <= X)? true : false;
}
static inline bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
static inline bool
mmux_$1_is_infinite (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
#endif
]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[schar]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sshort]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[slong]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint8]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint16]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint32]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint64]]],		[[[1]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[ssize]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sintmax]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sintptr]]],		[[[1]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[ptrdiff]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[off]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[pid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[wchar]]],		[[[1]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: unsigned integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES]]],[[[
#if ($2)
typedef bool mmux_core_predicate_$1_t (mmux_libc_$1_t X);

static inline mmux_core_predicate_$1_t mmux_$1_is_zero;
static inline mmux_core_predicate_$1_t mmux_$1_is_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_positive;
static inline mmux_core_predicate_$1_t mmux_$1_is_non_negative;
static inline mmux_core_predicate_$1_t mmux_$1_is_nan;
static inline mmux_core_predicate_$1_t mmux_$1_is_infinite;

static inline bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
static inline bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
static inline bool
mmux_$1_is_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
static inline bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return mmux_$1_is_zero(X);
}
static inline bool
mmux_$1_is_non_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return true;
}
static inline bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
static inline bool
mmux_$1_is_infinite (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
#endif
]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[pointer]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uchar]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ushort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ulong]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint8]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint64]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[usize]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uintptr]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[mode]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[gid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[wint]]],		[[[1]]])


/** --------------------------------------------------------------------
 ** Type predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE]]],[[[static int
mmux_$1_is_string_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_is_string"
{
#if ($2)
  mmux_libc_$1_t	data;

  return mmux_bash_pointers_parse_$1(&data, argv[1], MMUX_BUILTIN_NAME);
#else
  fprintf(stderr, "MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_is_string]]],
    [[[(2 == argc)]]],
    [[["mmux_$1_is_string STRING_REP"]]],
    [[["Return true if STRING_REP is a valid string representation for the C language type."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pointer]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[schar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sshort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ushort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[slong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ulong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[float]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[double]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[complex]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint64]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint64]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ssize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[usize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintptr]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintptr]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[mode]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[off]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[gid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wint]]],		[[[1]]])


/** --------------------------------------------------------------------
 ** Arithmetic predicates: zero, positive, negative, non-positive, non-negative, nan, infinite.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE]]],[[[
static int
mmux_$1_is_$3_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_is_$3"
{
#if ($4)
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&value, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  if (mmux_$1_is_$3(value)) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
#else
  fprintf(stderr, "MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
#endif
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_is_$3]]],
    [[[(2 == argc)]]],
    [[["mmux_$1_is_$3 OP"]]],
    [[["Return true if OP is a valid representation of a $2 value for the C language type \"$1\"."]]])
]]])

m4_define([[[MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES]]],[[[
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[zero]]],		[[[zero]]],	      [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[positive]]],		[[[positive]]],	      [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[negative]]],		[[[negative]]],	      [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[non-positive]]],	[[[non_positive]]],   [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[non-negative]]],	[[[non_negative]]],   [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[nan]]],		[[[nan]]],	      [[[$2]]])
MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE([[[$1]]],	[[[infinite]]],		[[[infinite]]],	      [[[$2]]])
]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[pointer]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[schar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sshort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ushort]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[slong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ulong]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sllong]]],	[[[HAVE_LONG_LONG_INT]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[float]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[double]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[complex]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint8]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint16]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint32]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint64]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint64]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ssize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[usize]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintmax]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintptr]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintptr]]],	[[[1]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ptrdiff]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[mode]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[off]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[pid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[gid]]],		[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[wchar]]],	[[[1]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[wint]]],		[[[1]]])

/* end of file */
