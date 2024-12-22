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
    mmux_slong_t	value;

    MMUX_LIBC_FUNCALL(mmux_libc_sysconf(&value, parameter));
    return mmux_slong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR PARAMETER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_confstr]]])
{
  char const *	value_varname;
  mmux_sint_t	parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		2);
  {
    mmux_usize_t	required_nbytes;

    MMUX_LIBC_FUNCALL(mmux_libc_confstr_size(&required_nbytes, parameter));
    {
      char	value[required_nbytes];

      MMUX_LIBC_FUNCALL(mmux_libc_confstr(parameter, value, required_nbytes));
      return mmux_string_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR PARAMETER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pathconf]]])
{
  char const *	value_varname;
  char const *	pathname;
  mmux_sint_t	parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		3);
  {
    mmux_slong_t	value;

    MMUX_LIBC_FUNCALL(mmux_libc_pathconf(&value, pathname, parameter));
    return mmux_slong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR PATHNAME PARAMETER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fpathconf]]])
{
  char const *			value_varname;
  mmux_libc_file_descriptor_t	fd;
  mmux_sint_t			parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_FD(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		3);
  {
    mmux_slong_t	value;

    MMUX_LIBC_FUNCALL(mmux_libc_fpathconf(&value, fd, parameter));
    return mmux_slong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR FD PARAMETER"]]])


/** --------------------------------------------------------------------
 ** struct rlimit.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rlimit_calloc]]])
{
  char const *	rlimit_pointer_varname;
  mmux_rlim_t	rlim_cur = 0;
  mmux_rlim_t	rlim_max = 0;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(rlimit_pointer_varname,	1);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM(rlim_cur,			2);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM(rlim_max,			3);
  }
  {
    mmux_libc_rlimit_t *	rlimit_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&rlimit_pointer, 1, sizeof(mmux_libc_rlimit_t)));
    mmux_libc_rlim_cur_set(rlimit_pointer, rlim_cur);
    mmux_libc_rlim_max_set(rlimit_pointer, rlim_max);
    return mmux_pointer_bind_to_bash_variable(rlimit_pointer_varname, rlimit_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_PTR_VAR [RLIM_CUR RLIM_MAX]"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_rlimit_t,rlim_cur,rlim, [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_rlimit_t,rlim_max,rlim, [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rlimit_dump]]])
{
  mmux_libc_rlimit_t *	rlimit_pointer;
  char const *		struct_name = "struct rlimit";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    mmux_libc_file_descriptor_t		fd;

    mmux_libc_stdou(&fd);
    MMUX_LIBC_FUNCALL(mmux_libc_rlimit_dump(fd, rlimit_pointer, struct_name));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_POINTER [STRUCT_NAME]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getrlimit]]])
{
  mmux_sint_t		resource;
  mmux_libc_rlimit_t *	rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,			1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_getrlimit(resource, rlimit_pointer));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESOURCE RLIMIT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setrlimit]]])
{
  mmux_sint_t		resource;
  mmux_libc_rlimit_t *	rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,			1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setrlimit(resource, rlimit_pointer));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESOURCE RLIMIT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_prlimit]]])
{
  mmux_libc_pid_t	pid;
  mmux_sint_t		resource;
  mmux_libc_rlimit_t *	new_rlimit_pointer;
  mmux_libc_rlimit_t *	old_rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_PID(pid,				1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,				2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(new_rlimit_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(old_rlimit_pointer,	4);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_prlimit(pid, resource, new_rlimit_pointer, old_rlimit_pointer));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PID RESOURCE NEW_RLIMIT_POINTER OLD_RLIMIT_POINTER"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_system_configuration_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_rlimit_SIZEOF", sizeof(mmux_libc_rlimit_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
