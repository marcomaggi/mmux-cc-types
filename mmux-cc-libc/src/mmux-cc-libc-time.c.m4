/*
  Part of: MMUX CC Libc
  Contents: time and dates
  Date: Dec 12, 2024

  Abstract

	This module implements the time and dates API.

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

#include <mmux-cc-libc-internals.h>


/** --------------------------------------------------------------------
 ** Struct timeval.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER(timeval,	tv_sec,		mmux_time_t)
DEFINE_STRUCT_SETTER_GETTER(timeval,	tv_usec,	mmux_slong_t)

bool
mmux_libc_timeval_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timeval_t const * const timeval_p, char const * struct_name)
{
  int	rv;

  if (NULL == struct_name) {
    struct_name = "struct timeval";
  }

  {
    rv = dprintf(fd.value, "%s = %p\n", struct_name, (mmux_pointer_t)timeval_p);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_time_sprint_size(timeval_p->tv_sec);
    char	str[len];

    mmux_time_sprint(str, len, timeval_p->tv_sec);
    rv = dprintf(fd.value, "%s->tv_sec = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_time_sprint_size(timeval_p->tv_usec);
    char	str[len];

    mmux_time_sprint(str, len, timeval_p->tv_usec);
    rv = dprintf(fd.value, "%s->tv_usec = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  return false;
}


/** --------------------------------------------------------------------
 ** Struct timespec.
 ** ----------------------------------------------------------------- */

void
mmux_libc_ts_sec_set (mmux_libc_timespec_t * const P, mmux_time_t value)
{
  P->tv_sec = value;
}
mmux_time_t
mmux_libc_ts_sec_ref (mmux_libc_timespec_t const * const P)
{
  return P->tv_sec;
}
void
mmux_libc_ts_nsec_set (mmux_libc_timespec_t * const P, mmux_slong_t value)
{
  P->tv_nsec = value;
}
mmux_slong_t
mmux_libc_ts_nsec_ref (mmux_libc_timespec_t const * const P)
{
  return P->tv_nsec;
}
bool
mmux_libc_timespec_dump (mmux_libc_file_descriptor_t fd, mmux_libc_timespec_t const * const timespec_p, char const * struct_name)
{
  int	rv;

  if (NULL == struct_name) {
    struct_name = "struct timespec";
  }

  {
    rv = dprintf(fd.value, "%s = %p\n", struct_name, (mmux_pointer_t)timespec_p);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_time_sprint_size(timespec_p->tv_sec);
    char	str[len];

    mmux_time_sprint(str, len, timespec_p->tv_sec);
    rv = dprintf(fd.value, "%s->ts_sec = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_time_sprint_size(timespec_p->tv_nsec);
    char	str[len];

    mmux_time_sprint(str, len, timespec_p->tv_nsec);
    rv = dprintf(fd.value, "%s->ts_nsec = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  return false;
}


/** --------------------------------------------------------------------
 ** Struct tm.
 ** ----------------------------------------------------------------- */

DEFINE_STRUCT_SETTER_GETTER(tm,	tm_sec,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_min,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_hour,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_mday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_mon,		mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_year,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_wday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_yday,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_isdst,	mmux_sint_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_gmtoff,	mmux_slong_t)
DEFINE_STRUCT_SETTER_GETTER(tm,	tm_zone,	char const *)

bool
mmux_libc_tm_dump (mmux_libc_file_descriptor_t fd, mmux_libc_tm_t const * tm_p, char const * struct_name)
{
  int	rv;

  if (NULL == struct_name) {
    struct_name = "struct tm";
  }

  /* Dump the pointer itself. */
  {
    rv = dprintf(fd.value, "%s = %p\n", struct_name, (mmux_pointer_t)tm_p);
    if (0 > rv) { return true; }
  }

m4_define([[[DEFINE_TM_FIELD_DUMPER]]],[[[
  {
    int		len = mmux_$2_sprint_size(tm_p->$1);
    char	str[len];

    mmux_$2_sprint(str, len, tm_p->$1);
    rv = dprintf(fd.value, "%s->$1 = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }
]]])
DEFINE_TM_FIELD_DUMPER(tm_sec,		sint)
DEFINE_TM_FIELD_DUMPER(tm_min,		sint)
DEFINE_TM_FIELD_DUMPER(tm_hour,		sint)
DEFINE_TM_FIELD_DUMPER(tm_mday,		sint)
DEFINE_TM_FIELD_DUMPER(tm_mon,		sint)
DEFINE_TM_FIELD_DUMPER(tm_year,		sint)
DEFINE_TM_FIELD_DUMPER(tm_wday,		sint)
DEFINE_TM_FIELD_DUMPER(tm_yday,		sint)
DEFINE_TM_FIELD_DUMPER(tm_isdst,	sint)
DEFINE_TM_FIELD_DUMPER(tm_gmtoff,	slong)

  {
    rv = dprintf(fd.value, "%s->tm_zone = %s\n", struct_name, tm_p->tm_zone);
    if (0 > rv) { return true; }
  }

  return false;
}


/** --------------------------------------------------------------------
 ** Sleeping.
 ** ----------------------------------------------------------------- */

bool
mmux_libc_nanosleep (mmux_libc_timespec_t * requested_time, mmux_libc_timespec_t * remaining_time)
{
  mmux_sint_t	rv = nanosleep(requested_time, remaining_time);

  return ((-1 == rv)? true : false);
}

/* end of file */
