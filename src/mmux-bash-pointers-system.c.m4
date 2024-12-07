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

typedef mmux_sint_t			mmux_libc_file_descriptor_t;
typedef FILE *				mmux_libc_stream_t;

typedef struct rlimit			mmux_libc_rlimit_tag_t;
typedef mmux_libc_rlimit_tag_t *	mmux_libc_rlimit_t;

/* ------------------------------------------------------------------ */

static bool
mmux_libc_rlimit_dump (mmux_libc_stream_t stream, mmux_libc_rlimit_t rlimit_pointer, char const * const struct_name)
{
  int	rv;

  {
    rv = fprintf(stream, "%s = %p\n", struct_name, (mmux_pointer_t)rlimit_pointer);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_rlim_sprint_size(rlimit_pointer->rlim_cur);
    char	str[len];

    mmux_rlim_sprint(str, len, rlimit_pointer->rlim_cur);
    rv = fprintf(stream, "%s->rlim_cur = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  {
    int		len = mmux_rlim_sprint_size(rlimit_pointer->rlim_max);
    char	str[len];

    mmux_rlim_sprint(str, len, rlimit_pointer->rlim_max);
    rv = fprintf(stream, "%s->rlim_max = %s\n", struct_name, str);
    if (0 > rv) { return true; }
  }

  return false;
}


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

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_confstr]]])
{
  char const *	value_varname;
  mmux_sint_t	parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		2);
  {
    mmux_usize_t	required_nbytes = confstr(parameter, NULL, 0);

    if (0 == required_nbytes) {
      return MMUX_FAILURE;
    } else {
      char	value[required_nbytes];

      confstr(parameter, value, required_nbytes);
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
    mmux_slong_t	value = pathconf(pathname, parameter);

    return mmux_slong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VAR PATHNAME PARAMETER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fpathconf]]])
{
  char const *	value_varname;
  mmux_sint_t	fd;
  mmux_sint_t	parameter;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(parameter,		3);
  {
    mmux_slong_t	value = fpathconf(fd, parameter);

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
    mmux_libc_rlimit_tag_t	rlimit_struct = {
      .rlim_cur = rlim_cur,
      .rlim_max = rlim_max
    };
    mmux_libc_rlimit_t		rlimit_pointer = calloc(1, sizeof(mmux_libc_rlimit_tag_t));

    if (rlimit_pointer) {
      *rlimit_pointer = rlimit_struct;
      return mmux_pointer_bind_to_bash_variable(rlimit_pointer_varname, rlimit_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_PTR_VAR [RLIM_CUR RLIM_MAX]"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_RLIMIT_FIELD_SETTER_GETTER]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_set]]])
{
  mmux_libc_rlimit_t	rlimit_pointer;
  mmux_rlim_t		$1;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM($1,			2);
  {
    rlimit_pointer->$1 = $1;
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_POINTER MMUX_M4_TOUPPER($1)"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_ref]]])
{
  char const *		$1_varname;
  mmux_libc_rlimit_t	rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM($1_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	2);
  {
    return mmux_rlim_bind_to_bash_variable($1_varname, rlimit_pointer->$1, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_POINTER MMUX_M4_TOUPPER($1)"]]])
]]])

DEFINE_RLIMIT_FIELD_SETTER_GETTER(rlim_cur)
DEFINE_RLIMIT_FIELD_SETTER_GETTER(rlim_max)

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rlimit_dump]]])
{
  mmux_libc_rlimit_t	rlimit_pointer;
  char const *		struct_name = "struct rlimit";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    bool	rv = mmux_libc_rlimit_dump(stdout, rlimit_pointer, struct_name);

    return (false == rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RLIMIT_POINTER [STRUCT_NAME]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getrlimit]]])
{
  mmux_sint_t		resource;
  mmux_libc_rlimit_t	rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,			1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	2);
  {
    int		rv = getrlimit(resource, rlimit_pointer);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESOURCE RLIMIT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setrlimit]]])
{
  mmux_sint_t		resource;
  mmux_libc_rlimit_t	rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,			1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(rlimit_pointer,	2);
  {
    int		rv = setrlimit(resource, rlimit_pointer);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RESOURCE RLIMIT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_prlimit]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_PRLIMIT]]],[[[
  mmux_pid_t		pid;
  mmux_sint_t		resource;
  mmux_libc_rlimit_t	new_rlimit_pointer;
  mmux_libc_rlimit_t	old_rlimit_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(pid,				1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(resource,				2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(new_rlimit_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(old_rlimit_pointer,	4);
  {
    int		rv = prlimit(pid, resource, new_rlimit_pointer, old_rlimit_pointer);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
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

  rv = mmux_bash_create_global_sint_variable("mmux_libc_rlimit_SIZEOF", sizeof(mmux_libc_rlimit_tag_t), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
