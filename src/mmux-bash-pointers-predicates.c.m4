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

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
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
]]])]]])

MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[float]]])
MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[double]]])
MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES([[[ldouble]]],	[[[HAVE_LONG_DOUBLE]]])

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_COMPLEX_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
static inline bool
mmux_$1_is_zero (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
static inline bool
mmux_$1_is_positive (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_$1_is_negative (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_$1_is_non_positive (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_$1_is_non_negative (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
static inline bool
mmux_$1_is_nan (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
static inline bool
mmux_$1_is_infinite (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_infinite(re) || mmux_$2_is_infinite(im))? true : false;
}
]]])]]])

MMUX_BASH_POINTERS_DEFINE_CORE_COMPLEX_PREDICATES([[[complexf]]],	[[[float]]])
MMUX_BASH_POINTERS_DEFINE_CORE_COMPLEX_PREDICATES([[[complexd]]],	[[[double]]])
MMUX_BASH_POINTERS_DEFINE_CORE_COMPLEX_PREDICATES([[[complexld]]],	[[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: signed integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
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
]]])]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sllong]]],		[[[HAVE_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sint64]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[ssize]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[sintptr]]])

MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[off]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_SIGNED_INTEGER_PREDICATES([[[wchar]]])


/** --------------------------------------------------------------------
 ** Core C language predicate: unsigned integer numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
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
]]])]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[pointer]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[ullong]]],	[[[HAVE_UNSIGNED_LONG_LONG_INT]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uintptr]]])

MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_CORE_UNSIGNED_INTEGER_PREDICATES([[[wint]]])


/** --------------------------------------------------------------------
 ** Type predicates.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE]]],[[[static int
mmux_$1_is_string_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_is_string"
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_libc_$1_t	data;

  return mmux_bash_pointers_parse_$1(&data, argv[1], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_is_string]]],
    [[[(2 == argc)]]],
    [[["mmux_$1_is_string STRING_REP"]]],
    [[["Return true if STRING_REP is a valid string representation for the C language type."]]])
]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pointer]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[float]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[double]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ssize]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uintptr]]])

MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[off]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_TYPE_STRING_REP_PREDICATE([[[wint]]])


/** --------------------------------------------------------------------
 ** Arithmetic predicates: zero, positive, negative, non-positive, non-negative, nan, infinite.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_ARITHMETIC_PREDICATE]]],[[[
static int
mmux_$1_is_$3_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_is_$3"
{
MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
  mmux_libc_$1_t	value;
  int			rv;

  rv = mmux_bash_pointers_parse_$1(&value, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL); return rv; }

  if (mmux_$1_is_$3(value)) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: predicate \"%s\" not implemented because underlying C language type not available.\n",
	  __func__);
  return EXECUTION_FAILURE;
]]])
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

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[pointer]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[schar]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uchar]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sshort]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ushort]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[slong]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ulong]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sllong]]],	[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ullong]]],	[[[MMUX_HAVE_TYPE_ULLONG]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[float]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[double]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ldouble]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint8]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint8]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint16]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint16]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint32]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint32]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sint64]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uint64]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ssize]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[usize]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintmax]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintmax]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[sintptr]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uintptr]]])

MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[ptrdiff]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[mode]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[off]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[pid]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[uid]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[gid]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[wchar]]])
MMUX_BASH_POINTERS_DEFINE_ALL_ARITHMETIC_PREDICATES([[[wint]]])

/* end of file */
