/*
  Part of: MMUX Bash Pointers
  Contents: implementation of persona builtins
  Date: Nov 14, 2024

  Abstract

	This module implements persona builtins.

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
 ** Getting uid and gid.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getuid]]])
{
  mmux_uid_t	uid = getuid();
  return mmux_uid_bind_to_bash_variable(argv[1], uid, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgid]]])
{
  mmux_uid_t	uid = getgid();
  return mmux_uid_bind_to_bash_variable(argv[1], uid, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_geteuid]]])
{
  mmux_uid_t	uid = geteuid();
  return mmux_uid_bind_to_bash_variable(argv[1], uid, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getegid]]])
{
  mmux_uid_t	uid = getegid();
  return mmux_uid_bind_to_bash_variable(argv[1], uid, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgroups]]])
{
  mmux_sint_t	ngroups = getgroups(0, NULL);

  if (-1 == ngroups ) {
    mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    return MMUX_FAILURE;
  } else {
    mmux_gid_t	gids[ngroups];

    ngroups = getgroups(ngroups, gids);
    if (-1 == ngroups ) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    } else {
      char const *				index_array_name = argv[1];
      mmux_bash_index_array_variable_t *	index_array_variable;
      mmux_bash_rv_t				rv;

      rv = mmux_bash_index_array_find_or_make(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) { return rv; }

      for (mmux_sint_t i=0; i<ngroups; ++i) {
	mmux_bash_index_array_index_t	index_array_key = i;
	mmux_sint_t			required_bytes = mmux_gid_sprint_size(gids[i]);

	if (required_bytes < 0) {
	  fprintf(stderr, "%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	  return MMUX_FAILURE;
	} else {
	  char	index_array_value[required_bytes];

	  if (mmux_gid_sprint(index_array_value, required_bytes, gids[i])) {
	    fprintf(stderr, "%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	    return MMUX_FAILURE;
	  }

	  rv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value,
					  MMUX_BASH_BUILTIN_STRING_NAME);
	  if (MMUX_SUCCESS != rv) { return rv; }
	}
      }
      return MMUX_SUCCESS;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUPS_ARRYNAME"]]])

/* end of file */
