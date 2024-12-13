/*
  Part of: MMUX Bash Pointers
  Contents: implementation of time and date builtins
  Date: Nov 15, 2024

  Abstract

	This module implements time and date builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Struct timeval.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_calloc]]])
{
  char const *	pointer_varname;
  mmux_time_t	seconds      = 0;
  mmux_slong_t	microseconds = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,		2);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(microseconds,		3);
  }
  {
    mmux_libc_timeval_t *	timeval_pointer = calloc(1, sizeof(mmux_libc_timeval_t));

    if (timeval_pointer) {
      mmux_bash_rv_t	rv;

      mmux_libc_tv_sec_set(timeval_pointer, seconds);
      mmux_libc_tv_usec_set(timeval_pointer, microseconds);
      rv = mmux_pointer_bind_to_bash_variable(pointer_varname, timeval_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) {
	free(timeval_pointer);
      }
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER_VAR [SECONDS MICROSECONDS]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_set]]])
{
  mmux_libc_timeval_t *	timeval_pointer;
  mmux_time_t		seconds;
  mmux_slong_t		microseconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(microseconds,		3);
  {
    mmux_libc_tv_sec_set(timeval_pointer, seconds);
    mmux_libc_tv_usec_set(timeval_pointer, microseconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_SECONDS SLONG_MICROSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_seconds_set]]])
{
  mmux_libc_timeval_t *	timeval_pointer;
  mmux_time_t		seconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,			2);
  {
    mmux_libc_tv_sec_set(timeval_pointer, seconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_microseconds_set]]])
{
  mmux_libc_timeval_t *	timeval_pointer;
  mmux_time_t		microseconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(microseconds,		2);
  {
    mmux_libc_tv_usec_set(timeval_pointer, microseconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_MICROSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_ref]]])
{
  char const *		seconds_varname;
  char const *		microseconds_varname;
  mmux_libc_timeval_t *	timeval_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(seconds_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(microseconds_varname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,		3);
  {
    mmux_time_t		seconds		= mmux_libc_tv_sec_ref(timeval_pointer);
    mmux_slong_t	microseconds	= mmux_libc_tv_usec_ref(timeval_pointer);
    mmux_bash_rv_t	rv;

    rv = mmux_time_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }
    return mmux_slong_bind_to_bash_variable(microseconds_varname, microseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR SLONG_MICROSECONDS_VAR TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_seconds_ref]]])
{
  char const *		seconds_varname;
  mmux_libc_timeval_t *	timeval_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(seconds_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,	2);
  {
    mmux_time_t		seconds = mmux_libc_tv_sec_ref(timeval_pointer);

    return mmux_time_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_microseconds_ref]]])
{
  char const *		microseconds_varname;
  mmux_libc_timeval_t *	timeval_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(microseconds_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timeval_pointer,		2);
  {
    mmux_time_t		microseconds = mmux_libc_tv_usec_ref(timeval_pointer);

    return mmux_slong_bind_to_bash_variable(microseconds_varname, microseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_MICROSECONDS_VAR TIMEVAL_POINTER"]]])


/** --------------------------------------------------------------------
 ** Struct timespec.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_calloc]]])
{
  char const *	pointer_varname;
  mmux_time_t	seconds      = 0;
  mmux_slong_t	nanoseconds = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,		2);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(nanoseconds,		3);
  }
  {
    mmux_libc_timespec_t *	timespec_pointer = calloc(1, sizeof(mmux_libc_timespec_t));

    if (timespec_pointer) {
      mmux_bash_rv_t	rv;

      mmux_libc_ts_sec_set(timespec_pointer, seconds);
      mmux_libc_ts_nsec_set(timespec_pointer, nanoseconds);
      rv = mmux_pointer_bind_to_bash_variable(pointer_varname, timespec_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) {
	free(timespec_pointer);
      }
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER_VAR [SECONDS NANOSECONDS]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_set]]])
{
  mmux_libc_timespec_t *	timespec_pointer;
  mmux_time_t		seconds;
  mmux_slong_t		nanoseconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(nanoseconds,		3);
  {
    mmux_libc_ts_sec_set(timespec_pointer, seconds);
    mmux_libc_ts_nsec_set(timespec_pointer, nanoseconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_SECONDS SLONG_NANOSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_seconds_set]]])
{
  mmux_libc_timespec_t *	timespec_pointer;
  mmux_time_t			seconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(seconds,				2);
  {
    mmux_libc_ts_sec_set(timespec_pointer, seconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_nanoseconds_set]]])
{
  mmux_libc_timespec_t *	timespec_pointer;
  mmux_time_t			nanoseconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(nanoseconds,			2);
  {
    mmux_libc_ts_nsec_set(timespec_pointer, nanoseconds);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_NANOSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_ref]]])
{
  char const *			seconds_varname;
  char const *			nanoseconds_varname;
  mmux_libc_timespec_t *	timespec_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(seconds_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(nanoseconds_varname,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	3);
  {
    mmux_time_t		seconds		= mmux_libc_ts_sec_ref(timespec_pointer);
    mmux_slong_t	nanoseconds	= mmux_libc_ts_nsec_ref(timespec_pointer);
    mmux_bash_rv_t	rv;

    rv = mmux_time_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }
    return mmux_slong_bind_to_bash_variable(nanoseconds_varname, nanoseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR SLONG_NANOSECONDS_VAR TIMESPEC_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_seconds_ref]]])
{
  char const *			seconds_varname;
  mmux_libc_timespec_t *	timespec_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(seconds_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	2);
  {
    mmux_time_t		seconds = mmux_libc_ts_sec_ref(timespec_pointer);

    return mmux_time_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR TIMESPEC_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_nanoseconds_ref]]])
{
  char const *			nanoseconds_varname;
  mmux_libc_timespec_t *	timespec_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(nanoseconds_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_pointer,	2);
  {
    mmux_time_t		nanoseconds = mmux_libc_ts_nsec_ref(timespec_pointer);

    return mmux_slong_bind_to_bash_variable(nanoseconds_varname, nanoseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_NANOSECONDS_VAR TIMESPEC_POINTER"]]])


/** --------------------------------------------------------------------
 ** Struct tm.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_calloc]]])
{
  char const *	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
  {
    struct tm *	tm_pointer = calloc(1, sizeof(struct tm));

    if (tm_pointer) {
      mmux_time_t	T;
      mmux_bash_rv_t	rv;

      T           = time(NULL);
      *tm_pointer = *localtime(&T);
      rv = mmux_pointer_bind_to_bash_variable(pointer_varname, tm_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) {
	free(tm_pointer);
      }
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_$1_set]]])
{
  mmux_pointer_t	pointer;
  mmux_sint_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(value,	2);
  {
    struct tm *	tm_pointer	= pointer;

    tm_pointer->tm_$1 = value;
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SINT_VALUE"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_$1_ref]]])
{
  char const *		varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct tm *		tm_pointer	= pointer;
    mmux_sint_t		value		= tm_pointer->tm_$1;

    return mmux_sint_bind_to_bash_variable(varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SINT_VALUE"]]])
]]])

DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[sec]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[min]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[hour]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[mday]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[mon]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[year]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[wday]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[yday]]])
DEFINE_STRUCT_TM_INT_SETTER_AND_GETTER([[[isdst]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_gmtoff_set]]])
{
  mmux_pointer_t	pointer;
  mmux_slong_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG(value,	2);
  {
    struct tm *	tm_pointer	= pointer;

    tm_pointer->tm_gmtoff = value;
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SLONG_VALUE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_gmtoff_ref]]])
{
  char const *		varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct tm *		tm_pointer	= pointer;
    mmux_slong_t	value		= tm_pointer->tm_gmtoff;

    return mmux_slong_bind_to_bash_variable(varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SLONG_VALUE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_reset]]])
{
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  {
    struct tm *	tm_pointer	= pointer;

    tm_pointer->tm_sec    = 0;
    tm_pointer->tm_min    = 0;
    tm_pointer->tm_hour   = 0;
    tm_pointer->tm_mday   = 1;
    tm_pointer->tm_mon    = 0;
    tm_pointer->tm_year   = 0;
    tm_pointer->tm_wday   = 0;
    tm_pointer->tm_yday   = 0;
    tm_pointer->tm_isdst  = 0;
    tm_pointer->tm_gmtoff = 0;
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER"]]])


/** --------------------------------------------------------------------
 ** Time builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_time]]])
{
  char const *	time_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(time_varname,	1);
  {
    mmux_time_t		T = time(NULL);

    return mmux_time_bind_to_bash_variable(time_varname, T, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_localtime]]])
{
  mmux_pointer_t	pointer;
  mmux_time_t		T;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(T,	2);
  {
    struct tm *	tm_pointer = pointer;

    *tm_pointer = *localtime(&T);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER TIME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gmtime]]])
{
  mmux_pointer_t	pointer;
  mmux_time_t		T;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(T,	2);
  {
    struct tm *	tm_pointer = pointer;

    *tm_pointer = *gmtime(&T);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER TIME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mktime]]])
{
  char const *		time_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(time_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct tm *		tm_pointer = pointer;
    mmux_time_t		T          = mktime(tm_pointer);

    return mmux_time_bind_to_bash_variable(time_varname, T, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timegm]]])
{
  char const *		time_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(time_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct tm *		tm_pointer = pointer;
    mmux_time_t		T          = timegm(tm_pointer);

    return mmux_time_bind_to_bash_variable(time_varname, T, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_asctime]]])
{
  char const *		string_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(string_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct tm *		tm_pointer = pointer;
    char const *	string     = asctime(tm_pointer);

    return mmux_string_bind_to_bash_variable(string_varname, string, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRINGVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ctime]]])
{
  char const *	string_varname;
  mmux_time_t	T;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(string_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(T,	2);
  {
    char const *	string     = ctime(&T);

    return mmux_string_bind_to_bash_variable(string_varname, string, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRINGVAR TIME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strftime]]])
{
  char const *		string_varname;
  char const *		template;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(string_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(template,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	3);
  {
    struct tm *		tm_pointer    = pointer;
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK	4096
    char		string[IS_THIS_ENOUGH_QUESTION_MARK];
    mmux_usize_t	len;

    /* See the documentation  of "strftime()" in the GLIBC manual  for an explanation
       of this nonsense. */
    string[0] = '\1';
    len       = strftime(string, IS_THIS_ENOUGH_QUESTION_MARK, template, tm_pointer);
    if ((0 == len) && ('\0' != string[0])) {
      fprintf(stderr, "%s: error converting broken-time to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    } else {
      return mmux_string_bind_to_bash_variable(string_varname, string, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRINGVAR TEMPLATE TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_strptime]]])
{
  char const *		input_string;
  char const *		template;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(input_string,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(template,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	3);
  {
    struct tm *		tm_pointer    = pointer;
    char *		rv;

    rv = strptime(input_string, template, tm_pointer);
    if (rv) {
      return MMUX_SUCCESS;
    } else {
      fprintf(stderr, "%s: error parsing time string: '%s'\n", MMUX_BASH_BUILTIN_STRING_NAME, input_string);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER INPUT_STRING TEMPLATE TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sleep]]])
{
  char const *		leftover_varname;
  mmux_uint_t		seconds;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(leftover_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT(seconds,	2);
  {
    mmux_uint_t		leftover = sleep(seconds);

    return mmux_uint_bind_to_bash_variable(leftover_varname, leftover, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER LEFTOVER_SECONDS_UINT_VAR UINT_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_nanosleep]]])
{
  mmux_libc_timespec_t *	timespec_requested_time;
  mmux_libc_timespec_t *	timespec_remaining_time;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_requested_time,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(timespec_remaining_time,	2);
  {
    if (mmux_libc_nanosleep(timespec_requested_time, timespec_remaining_time)) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER REQUESTED_TIME_TIMESPEC_POINTER REMAINING_TIME_TIMESPEC_POINTER"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_time_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timeval_SIZEOF",  sizeof(mmux_libc_timeval_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timespec_SIZEOF", sizeof(mmux_libc_timespec_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_tm_SIZEOF",       sizeof(struct tm), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
