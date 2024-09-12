/*
  Part of: MMUX Bash Pointers
  Contents: implementation of error builtins
  Date: Sep 12, 2024

  Abstract

	This module implements error builtins.

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


/** --------------------------------------------------------------------
 ** Standard error management.
 ** ----------------------------------------------------------------- */

static int
mmux_bash_pointers_strerror_main (int argc MMUX_BASH_POINTERS_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"strerror"
{
  int		rv, errnum;
  char *	errmsg;

  rv = mmux_bash_pointers_parse_sint(&errnum, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  errmsg = strerror(errnum);
  if (0) {fprintf(stderr, "%s: errnum=%d, message=\"%s\"\n", __func__, errnum, errmsg);}

  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
    int		flags = 0;

    v = bind_variable(argv[1], errmsg, flags);
    return EXECUTION_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_pointers_strerror]]],
    [[[(3 == argc)]]],
    [[["strerror MSGVAR ERRNUM"]]],
    [[["Store in MSGVAR the error message corresponding to ERRNUM."]]])

/* end of file */
