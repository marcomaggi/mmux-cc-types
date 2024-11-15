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
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_time_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timeval_SIZEOF", sizeof(struct timeval), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_timespec_SIZEOF", sizeof(struct timespec), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
