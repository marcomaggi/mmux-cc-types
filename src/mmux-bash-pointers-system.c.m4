/*
  Part of: MMUX Bash Pointers
  Contents: interface to system facilities
  Date: Dec  7, 2024

  Abstract

	This module implements system facilities.

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
 ** System configuration.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sysconf]]])
{
  char const *	value_varname;
  mmux_sint_t	parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		2);
  {
    mmux_slong_t	value = sysconf(parameter);

    return mmux_slong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR PARAMETER"]]])

/* end of file */
