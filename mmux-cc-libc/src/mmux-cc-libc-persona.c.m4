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

/* end of file */
