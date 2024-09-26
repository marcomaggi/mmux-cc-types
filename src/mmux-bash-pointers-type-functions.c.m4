/*
  Part of: MMUX Bash Pointers
  Contents: type functions
  Date: Sep 18, 2024

  Abstract

	This module implements type functions.

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
 ** Standard low-level type functions: string validation, minimum, maximum, sprint, parse.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_$1 (void)
{
  return sizeof(mmux_libc_$1_t);
}
mmux_libc_$1_t
mmux_bash_pointers_maximum_$1 (void)
{
  return $2;
}
mmux_libc_$1_t
mmux_bash_pointers_minimum_$1 (void)
{
  return $3;
}
]]])

MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(schar,	SCHAR_MAX,	SCHAR_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uchar,	UCHAR_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sshort,	SHRT_MAX,	SHRT_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ushort,	USHRT_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint,	INT_MAX,	INT_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint,	UINT_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(slong,	LONG_MAX,	LONG_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ulong,	ULONG_MAX,	0)
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sllong,	LLONG_MAX,	LLONG_MIN)
#endif
#if ((defined HAVE_UNSIGNED_LONG_LONG_INT) && (1 == HAVE_UNSIGNED_LONG_LONG_INT))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ullong,	ULLONG_MAX,	0)
#endif

/* FIXME Should we do something to make available the "_MIN" constants defined by the
   C language standard?  (Marco Maggi; Sep 18, 2024) */
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(float,	FLT_MAX,	-FLT_MAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(double,	DBL_MAX,	-DBL_MAX)
#if ((defined HAVE_LONG_DOUBLE) && (1 == HAVE_LONG_DOUBLE))
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(ldouble,	LDBL_MAX,	-LDBL_MAX)
#endif

MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint8,	INT8_MAX,	INT8_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint8,	UINT8_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint16,	INT16_MAX,	INT16_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint16,	UINT16_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint32,	INT32_MAX,	INT32_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint32,	UINT32_MAX,	0)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(sint64,	INT64_MAX,	INT64_MIN)
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_TYPE_FUNCTIONS(uint64,	UINT64_MAX,	0)

/* ------------------------------------------------------------------ */

bool
mmux_bash_pointers_string_pointer_p (char const * s_arg)
{
  mmux_libc_pointer_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_pointer(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_pointer (void)
{
  return sizeof(mmux_libc_pointer_t);
}
mmux_libc_pointer_t
mmux_bash_pointers_minimum_pointer (void)
{
  return (mmux_libc_pointer_t)mmux_bash_pointers_minimum_uintptr();
}
mmux_libc_pointer_t
mmux_bash_pointers_maximum_pointer (void)
{
  return (mmux_libc_pointer_t) mmux_bash_pointers_maximum_uintptr();
}

/* ------------------------------------------------------------------ */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
int
mmux_bash_pointers_sizeof_$1 (void)
{
  return sizeof(mmux_libc_$1_t);
}
]]])]]])

MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexf]]])
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexd]]])
MMUX_BASH_POINTERS_DEFINE_STANDARD_LOW_LEVEL_COMPLEX_TYPE_FUNCTIONS([[[complexld]]],	[[[MMUX_HAVE_TYPE_LDOUBLE]]])


/** --------------------------------------------------------------------
 ** Standard high-level type functions: string validation, minimum, maximum, sprint, parse.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - CUSTOM_STEM
m4_dnl $2 - STANDARD_STEM
m4_define([[[MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS]]],[[[
bool
mmux_bash_pointers_string_$1_p (char const * s_arg)
{
  mmux_libc_$1_t	value;

  if (MMUX_SUCCESS == mmux_bash_pointers_parse_$1(&value, s_arg, NULL)) {
    return true;
  } else {
    return false;
  }
}
  int
  mmux_bash_pointers_sizeof_$1 (void)
  {
    return sizeof(mmux_libc_$1_t);
  }
  mmux_libc_$1_t
  mmux_bash_pointers_maximum_$1 (void)
  {
    return mmux_bash_pointers_maximum_[[[]]]$2[[[]]] ();
  }
  mmux_libc_$1_t
  mmux_bash_pointers_minimum_$1 (void)
  {
    return mmux_bash_pointers_minimum_[[[]]]$2[[[]]] ();
  }
]]])

MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ssize,	MMUX_BASH_POINTERS_STEM_ALIAS_SSIZE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(usize,	MMUX_BASH_POINTERS_STEM_ALIAS_USIZE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTMAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintmax,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTMAX)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(sintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_SINTPTR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uintptr,	MMUX_BASH_POINTERS_STEM_ALIAS_UINTPTR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(mode,	MMUX_BASH_POINTERS_STEM_ALIAS_MODE)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(off,	MMUX_BASH_POINTERS_STEM_ALIAS_OFF)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(pid,	MMUX_BASH_POINTERS_STEM_ALIAS_PID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(uid,	MMUX_BASH_POINTERS_STEM_ALIAS_UID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(gid,	MMUX_BASH_POINTERS_STEM_ALIAS_GID)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(ptrdiff,	MMUX_BASH_POINTERS_STEM_ALIAS_PTRDIFF)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wchar,	MMUX_BASH_POINTERS_STEM_ALIAS_WCHAR)
MMUX_BASH_POINTERS_DEFINE_STANDARD_HIGH_LEVEL_TYPE_FUNCTIONS(wint,	MMUX_BASH_POINTERS_STEM_ALIAS_WINT)


/** --------------------------------------------------------------------
 ** Store result value in result variable.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_VALUE_STORER]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
int
mmux_bash_pointers_store_result_in_variable_$1 (char const * variable_name, mmux_libc_$1_t value)
{
  int		rv, required_nbytes;

  required_nbytes = mmux_bash_pointers_sprint_size_$1(value);
  if (0 > required_nbytes) {
    return MMUX_FAILURE;
  } else {
    char	s_value[required_nbytes];

    rv = mmux_bash_pointers_sprint_$1(s_value, required_nbytes, value);
    if (MMUX_SUCCESS == rv) {
      return mmux_bash_store_string_in_variable(variable_name, s_value, NULL);
    } else {
      return rv;
    }
  }
}
]]])]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[pointer]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[schar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sshort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ushort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[slong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ulong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sllong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ullong]]],		[[[MMUX_HAVE_TYPE_SLLONG]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint64]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[double]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ldouble]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexd]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexld]]],		[[[MMUX_HAVE_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[usize]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ssize]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ptrdiff]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[mode]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[off]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[pid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[gid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wint]]])



/** --------------------------------------------------------------------
 ** Core C language predicates: floating-point and complex numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_POINTERS_DEFINE_CORE_FLOAT_PREDICATES]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (FP_ZERO == (fpclassify(X)))? true : false;
}
bool
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
bool
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
bool
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
bool
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
bool
mmux_$1_is_nan (mmux_libc_$1_t X)
{
  return (FP_NAN == (fpclassify(X)))? true : false;
}
bool
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
bool
mmux_$1_is_zero (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_zero(re) && mmux_$2_is_zero(im))? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
bool
mmux_$1_is_negative (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t Z MMUX_BASH_POINTERS_UNUSED)
/* FIXME Is it better  like this, or if it is not defined?   The ideal solution would
   be to raise  an exception, but it  is not possible under GNU  Bash.  (Marco Maggi;
   Sep 22, 2024) */
{
  return false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t Z)
{
  mmux_libc_$1_part_t	re = creal(Z), im = cimag(Z);

  return (mmux_$2_is_nan(re) || mmux_$2_is_nan(im))? true : false;
}
bool
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
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) > X)? true : false;
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) >= X)? true : false;
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) <= X)? true : false;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
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
bool
mmux_$1_is_zero (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) == X)? true : false;
}
bool
mmux_$1_is_positive (mmux_libc_$1_t X)
{
  return (MMUX_INTEGER_ZERO($1) < X)? true : false;
}
bool
mmux_$1_is_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
mmux_$1_is_non_positive (mmux_libc_$1_t X)
{
  return mmux_$1_is_zero(X);
}
bool
mmux_$1_is_non_negative (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return true;
}
bool
mmux_$1_is_nan (mmux_libc_$1_t X MMUX_BASH_POINTERS_UNUSED)
{
  return false;
}
bool
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

/* end of file */
