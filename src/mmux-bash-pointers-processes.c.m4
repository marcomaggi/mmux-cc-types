/*
  Part of: MMUX Bash Pointers
  Contents: interface to process control functions
  Date: Dec  6, 2024

  Abstract

	This module implements an interface to process control functions.

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
 ** Process identification.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpid]]])
{
  char const *	pid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pid_varname,	1);
  {
    mmux_pid_t	rv = getpid();

    return mmux_pid_bind_to_bash_variable(pid_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PID_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getppid]]])
{
  char const *	pid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pid_varname,	1);
  {
    mmux_pid_t	rv = getppid();

    return mmux_pid_bind_to_bash_variable(pid_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PID_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gettid]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_GETTID]]],[[[

  char const *	pid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pid_varname,	1);
  {
    mmux_pid_t	rv = gettid();

    return mmux_pid_bind_to_bash_variable(pid_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PID_VAR"]]])

/* end of file */
