/*
  Part of: MMUX CC Libc
  Contents: operative system processes management
  Date: Dec 17, 2024

  Abstract

	This module implements the operative system processes management API.

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
mmux_libc_make_pid (mmux_libc_pid_t * result_p, mmux_pid_t pid_num)
{
  if (0 <= pid_num) {
    result_p->value = pid_num;
    return false;
  } else {
    return true;
  }
}

/* ------------------------------------------------------------------ */

bool
mmux_libc_getpid (mmux_libc_pid_t * result_p)
{
  mmux_pid_t	rv = getpid();
  return mmux_libc_make_pid(result_p, rv);
}
bool
mmux_libc_getppid (mmux_libc_pid_t * result_p)
{
  mmux_pid_t	rv = getppid();
  return mmux_libc_make_pid(result_p, rv);
}
bool
mmux_libc_gettid (mmux_libc_pid_t * result_p)
{
MMUX_CONDITIONAL_FUNCTION_BODY([[[HAVE_GETTID]]],[[[
  mmux_pid_t	rv = gettid();
  return mmux_libc_make_pid(result_p, rv);
]]])
}

/* end of file */
