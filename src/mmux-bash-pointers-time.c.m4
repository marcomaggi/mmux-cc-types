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

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_malloc]]])
{
  char const *	pointer_varname;
  mmux_time_t	seconds      = 0;
  mmux_slong_t	microseconds = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pointer_varname,	argv[1]);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,			argv[2]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(microseconds,		argv[3]);
  }
  {
    struct timeval *	timeval_pointer = malloc(sizeof(struct timeval));

    if (timeval_pointer) {
      mmux_bash_rv_t	rv;

      timeval_pointer->tv_sec  = seconds;
      timeval_pointer->tv_usec = microseconds;
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER_VAR [SECONDS MICROSECONDS]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_set]]])
{
  void *	pointer;
  mmux_time_t	seconds;
  mmux_slong_t	microseconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(microseconds,	argv[3]);
  {
    struct timeval *	timeval_pointer	= pointer;

    timeval_pointer->tv_sec  = seconds;
    timeval_pointer->tv_usec = microseconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_SECONDS SLONG_MICROSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_seconds_set]]])
{
  void *	pointer;
  mmux_time_t	seconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,	argv[2]);
  {
    struct timeval *	timeval_pointer	= pointer;

    timeval_pointer->tv_sec = seconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_microseconds_set]]])
{
  void *	pointer;
  mmux_slong_t	microseconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(microseconds,	argv[2]);
  {
    struct timeval *	timeval_pointer	= pointer;

    timeval_pointer->tv_usec = microseconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAL_POINTER SLONG_MICROSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_ref]]])
{
  char const *	seconds_varname;
  char const *	microseconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(seconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(microseconds_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[3]);
  {
    struct timeval *	timeval_pointer	= pointer;
    mmux_time_t		seconds		= timeval_pointer->tv_sec;
    mmux_slong_t	microseconds	= timeval_pointer->tv_usec;
    mmux_bash_rv_t	rv;

    rv = mmux_slong_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }
    return mmux_slong_bind_to_bash_variable(microseconds_varname, microseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR SLONG_MICROSECONDS_VAR TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_seconds_ref]]])
{
  char const *	seconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(seconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct timeval *	timeval_pointer	= pointer;
    mmux_slong_t	seconds		= timeval_pointer->tv_sec;

    return mmux_slong_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timeval_microseconds_ref]]])
{
  char const *	microseconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(microseconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct timeval *	timeval_pointer	= pointer;
    mmux_slong_t	microseconds	= timeval_pointer->tv_usec;

    return mmux_slong_bind_to_bash_variable(microseconds_varname, microseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_MICROSECONDS_VAR TIMEVAL_POINTER"]]])


/** --------------------------------------------------------------------
 ** Struct timespec.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_malloc]]])
{
  char const *	pointer_varname;
  mmux_time_t	seconds      = 0;
  mmux_slong_t	nanoseconds  = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pointer_varname,	argv[1]);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,			argv[2]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(nanoseconds,		argv[3]);
  }
  {
    struct timespec *	timespec_pointer = malloc(sizeof(struct timespec));

    if (timespec_pointer) {
      mmux_bash_rv_t	rv;

      timespec_pointer->tv_sec  = seconds;
      timespec_pointer->tv_nsec = nanoseconds;
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER_VAR [SECONDS NANOSECONDS]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_set]]])
{
  void *	pointer;
  mmux_time_t	seconds;
  mmux_slong_t	nanoseconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(nanoseconds,	argv[3]);
  {
    struct timespec *	timespec_pointer= pointer;

    timespec_pointer->tv_sec  = seconds;
    timespec_pointer->tv_nsec = nanoseconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_SECONDS SLONG_NANOSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_seconds_set]]])
{
  void *	pointer;
  mmux_time_t	seconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(seconds,	argv[2]);
  {
    struct timespec *	timespec_pointer	= pointer;

    timespec_pointer->tv_sec = seconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_nanoseconds_set]]])
{
  void *	pointer;
  mmux_slong_t	nanoseconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(nanoseconds,	argv[2]);
  {
    struct timespec *	timespec_pointer	= pointer;

    timespec_pointer->tv_nsec = nanoseconds;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMESPEC_POINTER SLONG_NANOSECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_ref]]])
{
  char const *	seconds_varname;
  char const *	nanoseconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(seconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(nanoseconds_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[3]);
  {
    struct timespec *	timespec_pointer= pointer;
    mmux_time_t		seconds		= timespec_pointer->tv_sec;
    mmux_slong_t	nanoseconds	= timespec_pointer->tv_nsec;
    mmux_bash_rv_t	rv;

    rv = mmux_slong_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }
    return mmux_slong_bind_to_bash_variable(nanoseconds_varname, nanoseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR SLONG_NANOSECONDS_VAR TIMESPEC_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_seconds_ref]]])
{
  char const *	seconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(seconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct timespec *	timespec_pointer	= pointer;
    mmux_time_t		seconds			= timespec_pointer->tv_sec;

    return mmux_slong_bind_to_bash_variable(seconds_varname, seconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_SECONDS_VAR TIMESPEC_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timespec_nanoseconds_ref]]])
{
  char const *	nanoseconds_varname;
  void *	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(nanoseconds_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct timespec *	timespec_pointer= pointer;
    mmux_slong_t	nanoseconds	= timespec_pointer->tv_nsec;

    return mmux_slong_bind_to_bash_variable(nanoseconds_varname, nanoseconds, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SLONG_NANOSECONDS_VAR TIMESPEC_POINTER"]]])


/** --------------------------------------------------------------------
 ** Struct tm.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_malloc]]])
{
  char const *	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pointer_varname,	argv[1]);
  {
    struct tm *	tm_pointer = malloc(sizeof(struct tm));

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

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(value,	argv[2]);
  {
    struct tm *	tm_pointer	= pointer;

    tm_pointer->tm_$1 = value;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SINT_VALUE"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_$1_ref]]])
{
  char const *		varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct tm *		tm_pointer	= pointer;
    mmux_sint_t		value		= tm_pointer->tm_$1;

    return mmux_sint_bind_to_bash_variable(varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG(value,	argv[2]);
  {
    struct tm *	tm_pointer	= pointer;

    tm_pointer->tm_gmtoff = value;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SLONG_VALUE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_gmtoff_ref]]])
{
  char const *		varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct tm *		tm_pointer	= pointer;
    mmux_slong_t	value		= tm_pointer->tm_gmtoff;

    return mmux_slong_bind_to_bash_variable(varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER SLONG_VALUE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_tm_reset]]])
{
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(time_varname,	argv[1]);
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

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(T,		argv[2]);
  {
    struct tm *	tm_pointer = pointer;

    *tm_pointer = *localtime(&T);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER TIME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gmtime]]])
{
  mmux_pointer_t	pointer;
  mmux_time_t		T;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(T,		argv[2]);
  {
    struct tm *	tm_pointer = pointer;

    *tm_pointer = *gmtime(&T);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TM_POINTER TIME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mktime]]])
{
  char const *		time_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(time_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct tm *		tm_pointer = pointer;
    mmux_time_t		T          = mktime(tm_pointer);

    return mmux_time_bind_to_bash_variable(time_varname, T, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_timegm]]])
{
  char const *		time_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(time_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct tm *		tm_pointer = pointer;
    mmux_time_t		T          = timegm(tm_pointer);

    return mmux_time_bind_to_bash_variable(time_varname, T, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER TIMEVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_asctime]]])
{
  char const *		string_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(string_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct tm *		tm_pointer = pointer;
    char const *	string     = asctime(tm_pointer);

    return mmux_string_bind_to_bash_variable(string_varname, string, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRINGVAR TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ctime]]])
{
  char const *	string_varname;
  mmux_time_t	T;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(string_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(T,				argv[2]);
  {
    char const *	string     = ctime(&T);

    return mmux_string_bind_to_bash_variable(string_varname, string, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(string_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(template,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[3]);
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(input_string,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(template,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[3]);
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
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER INPUT_STRING TEMPLATE TM_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sleep]]])
{
  char const *		leftover_varname;
  mmux_uint_t		seconds;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(leftover_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT(seconds,			argv[2]);
  {
    mmux_uint_t		leftover = sleep(seconds);

    return mmux_uint_bind_to_bash_variable(leftover_varname, leftover, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER LEFTOVER_SECONDS_UINT_VAR UINT_SECONDS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_nanosleep]]])
{
  mmux_pointer_t	requested_time, remaining_time;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(requested_time,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(remaining_time,	argv[2]);
  {
    struct timespec *	timespec_requested_time = requested_time;
    struct timespec *	timespec_remaining_time = remaining_time;
    mmux_sint_t		rv = nanosleep(timespec_requested_time, timespec_remaining_time);

    if (-1 == rv) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    } else {
      return MMUX_SUCCESS;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
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

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timeval_SIZEOF",  sizeof(struct timeval), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timespec_SIZEOF", sizeof(struct timespec), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_tm_SIZEOF",       sizeof(struct tm), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
