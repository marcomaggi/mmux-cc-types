/*
  Part of: MMUX Bash Pointers
  Contents: GNU Bash API
  Date: Sep 25, 2024

  Abstract

	As much as possible: everything Bash  should go here.  Ideally: Bash's header
	files should be inluded only here.

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
 ** Accessing shell variables.
 ** ----------------------------------------------------------------- */

int
mmux_bash_pointers_get_shell_variable_string_value (char const ** p_variable_value, char const * const variable_name,
						    char const * const caller_name)
{
  SHELL_VAR *		shell_variable;

  shell_variable = find_variable(variable_name);
  if (shell_variable && var_isset(shell_variable)) {
    *p_variable_value = value_cell(shell_variable);
    return EXECUTION_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: failed access to variable: \"%s\"\n", caller_name, variable_name);
    }
    return EXECUTION_FAILURE;
  }
}

/* end of file */
