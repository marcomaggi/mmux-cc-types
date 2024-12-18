/*
  Part of: MMUX CC Libc
  Contents: operative system persona management
  Date: Dec 17, 2024

  Abstract

	This module implements the operative system persona management API.

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
 ** Identifier functions.
 ** ----------------------------------------------------------------- */

bool
mmux_libc_make_uid (mmux_libc_uid_t * result_p, mmux_uid_t uid_num)
{
  if (0 <= uid_num) {
    result_p->value = uid_num;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_make_gid (mmux_libc_gid_t * result_p, mmux_gid_t gid_num)
{
  if (0 <= gid_num) {
    result_p->value = gid_num;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_uid_parse (mmux_libc_uid_t * p_value, char const * s_value, char const * who)
{
  mmux_libc_uid_t	the_uid;

  if (mmux_uid_parse(&the_uid.value, s_value, who)) {
    return true;
  }
  *p_value = the_uid;
  return false;
}
bool
mmux_libc_uid_sprint (char * ptr, mmux_usize_t len, mmux_libc_uid_t uid)
{
  if (MMUX_LIBC_UID_MAXIMUM_STRING_REPRESENTATION_LENGTH < len) {
    errno = MMUX_LIBC_EINVAL;
    return true;
  }
  return mmux_uid_sprint(ptr, len, uid.value);
}
bool
mmux_libc_uid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_uid_t uid)
{
  mmux_sint_t	required_nchars = mmux_uid_sprint_size(uid.value);

  if (0 <= required_nchars) {
    *required_nchars_p = required_nchars;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_gid_parse (mmux_libc_gid_t * p_value, char const * s_value, char const * who)
{
  mmux_libc_gid_t	the_gid;

  if (mmux_gid_parse(&the_gid.value, s_value, who)) {
    return true;
  }
  *p_value = the_gid;
  return false;
}
bool
mmux_libc_gid_sprint (char * ptr, mmux_usize_t len, mmux_libc_gid_t gid)
{
  if (MMUX_LIBC_GID_MAXIMUM_STRING_REPRESENTATION_LENGTH < len) {
    errno = MMUX_LIBC_EINVAL;
    return true;
  }
  return mmux_gid_sprint(ptr, len, gid.value);
}
bool
mmux_libc_gid_sprint_size (mmux_usize_t * required_nchars_p, mmux_libc_gid_t gid)
{
  mmux_sint_t	required_nchars = mmux_gid_sprint_size(gid.value);

  if (0 <= required_nchars) {
    *required_nchars_p = required_nchars;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_getuid (mmux_libc_uid_t * result_p)
{
  return mmux_libc_make_uid(result_p, getuid());
}
bool
mmux_libc_getgid (mmux_libc_gid_t * result_p)
{
  return mmux_libc_make_gid(result_p, getgid());
}
bool
mmux_libc_geteuid (mmux_libc_uid_t * result_p)
{
  return mmux_libc_make_uid(result_p, geteuid());
}
bool
mmux_libc_getegid (mmux_libc_gid_t * result_p)
{
  return mmux_libc_make_gid(result_p, getegid());
}
bool
mmux_libc_getgroups_size (mmux_usize_t * ngroups_p)
{
  mmux_sint_t	ngroups = getgroups(0, NULL);

  if (0 <= ngroups) {
    *ngroups_p = ngroups;
    return false;
  } else {
    return true;
  }
}
bool
mmux_libc_getgroups (mmux_usize_t * ngroups_p, mmux_libc_gid_t * groups_p)
{
  mmux_sint_t	ngroups1 = *ngroups_p;
  mmux_gid_t	gids[ngroups1];
  mmux_sint_t	ngroups2 = getgroups(ngroups1, gids);

  if (0 <= ngroups2) {
    for (mmux_sint_t i=0; i<ngroups1; ++i) {
      mmux_libc_make_gid(&(groups_p[i]), gids[i]);
    }
    *ngroups_p = ngroups2;
    return false;
  } else {
    return true;
  }
}

/* end of file */
