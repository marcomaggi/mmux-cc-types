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

typedef char const *	mmux_string_t;


/** --------------------------------------------------------------------
 ** Getting uid and gid.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getuid]]])
{
  char const *		uid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(uid_varname,	1);
  {
    mmux_libc_uid_t	uid;

    mmux_libc_getuid(&uid);
    return mmux_libc_uid_bind_to_bash_variable(uid_varname, uid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgid]]])
{
  char const *		gid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(gid_varname,	1);
  {
    mmux_libc_gid_t	gid;

    mmux_libc_getgid(&gid);
    return mmux_libc_gid_bind_to_bash_variable(gid_varname, gid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_geteuid]]])
{
  char const *		uid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(uid_varname,	1);
  {
    mmux_libc_uid_t	uid;

    mmux_libc_geteuid(&uid);
    return mmux_libc_uid_bind_to_bash_variable(uid_varname, uid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getegid]]])
{
  char const *		gid_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(gid_varname,	1);
  {
    mmux_libc_gid_t	gid;

    mmux_libc_getegid(&gid);
    return mmux_libc_gid_bind_to_bash_variable(gid_varname, gid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UIDVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgroups]]])
{
  char const *	index_array_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(index_array_varname,	1);
  {
    mmux_usize_t	ngroups;

    MMUX_LIBC_FUNCALL(mmux_libc_getgroups_size(&ngroups));
    {
      mmux_libc_gid_t	gids[ngroups];

      MMUX_LIBC_FUNCALL(mmux_libc_getgroups(&ngroups, gids));
      {
	mmux_bash_index_array_variable_t	index_array_variable;
	mmux_bash_rv_t				brv;

	brv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_varname, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { return brv; }

	for (mmux_usize_t i=0; i<ngroups; ++i) {
	  mmux_bash_index_array_key_t	index_array_key = i;
	  mmux_usize_t			required_nchars;

	  if (mmux_libc_gid_sprint_size(&required_nchars, gids[i])) {
	    goto error_converting_gid_to_string;
	  } else {
	    char	index_array_value[required_nchars];

	    if (mmux_libc_gid_sprint(index_array_value, required_nchars, gids[i])) {
	      goto error_converting_gid_to_string;
	    } else {
	      brv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	      if (MMUX_SUCCESS != brv) { return brv; }
	    }
	  }
	}
	return MMUX_SUCCESS;

      error_converting_gid_to_string:
	mmux_libc_dprintfer("%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	return MMUX_FAILURE;
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUPS_ARRYNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrouplist]]])
{
  char const *		index_array_varname;
  char const *		username;
  mmux_libc_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(index_array_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(username,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,			3);
  {
    mmux_usize_t	ngroups = 0;

    MMUX_LIBC_FUNCALL(mmux_libc_getgrouplist_size(&ngroups, username, gid));
    {
      mmux_libc_gid_t	gids[ngroups];

      MMUX_LIBC_FUNCALL(mmux_libc_getgrouplist(username, gid, &ngroups, gids));
      {
	mmux_bash_index_array_variable_t	index_array_variable;
	mmux_bash_rv_t				brv;

	brv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_varname, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { return brv; }

	for (mmux_usize_t i=0; i<ngroups; ++i) {
	  mmux_bash_index_array_key_t	index_array_key = i;
	  mmux_usize_t			required_nchars;

	  if (mmux_libc_gid_sprint_size(&required_nchars, gids[i])) {
	    goto error_converting_gid_to_string;
	  } else {
	    char	index_array_value[required_nchars];

	    if (mmux_libc_gid_sprint(index_array_value, required_nchars, gids[i])) {
	      goto error_converting_gid_to_string;
	    } else {
	      brv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value,
					       MMUX_BASH_BUILTIN_STRING_NAME);
	      if (MMUX_SUCCESS != brv) { return brv; }
	    }
	  }
	}
	return MMUX_SUCCESS;

      error_converting_gid_to_string:
	mmux_libc_dprintfer("%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	return MMUX_FAILURE;
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUPS_ARRYNAME USERNAME GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_group_member]]])
{
  mmux_asciizcp_t	bool_varname;
  mmux_libc_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(bool_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,			2);
  {
    bool	is_member;

    MMUX_LIBC_FUNCALL(mmux_libc_group_member(&is_member, gid));
    return mmux_sint_bind_to_bash_variable(bool_varname, is_member, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER BOOLVAR GID"]]])


/** --------------------------------------------------------------------
 ** Setting UIDs.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setuid]]])
{
  mmux_libc_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_UID(uid,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setuid(uid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_seteuid]]])
{
  mmux_libc_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_UID(uid,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_seteuid(uid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setreuid]]])
{
  mmux_libc_uid_t	uid;
  mmux_libc_uid_t	euid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_UID(uid,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_UID(euid,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setreuid(uid, euid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RUID EUID"]]])


/** --------------------------------------------------------------------
 ** Setting GIDs.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setgid]]])
{
  mmux_libc_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setgid(gid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setegid]]])
{
  mmux_libc_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setegid(gid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setregid]]])
{
  mmux_libc_gid_t	gid;
  mmux_libc_gid_t	egid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(egid,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setregid(gid, egid));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RGID EGID"]]])


/** --------------------------------------------------------------------
 ** Identifying who logged in.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getlogin]]])
{
  char const *	username;

  MMUX_LIBC_FUNCALL(mmux_libc_getlogin(&username));

  return mmux_string_bind_to_bash_variable(argv[1], username, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER USERNAMEVAR"]]])


/** --------------------------------------------------------------------
 ** User database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_passwd_dump]]])
{
  mmux_libc_passwd_t *	passwd_pointer;
  char const *		struct_name = "struct passwd";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(passwd_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    mmux_libc_file_descriptor_t		fd;

    MMUX_LIBC_FUNCALL(mmux_libc_stdou(&fd));
    MMUX_LIBC_FUNCALL(mmux_libc_passwd_dump(fd, passwd_pointer, struct_name));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER [STRUCT_NAME]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwuid]]])
{
  char const *		passwd_pointer_varname;
  mmux_libc_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(passwd_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_UID(uid,				2);
  {
    mmux_libc_passwd_t *	passwd_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getpwuid(&passwd_pointer, uid));
    return mmux_pointer_bind_to_bash_variable(passwd_pointer_varname, passwd_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwnam]]])
{
  char const *	passwd_pointer_varname;
  char const *	username;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(passwd_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(username,			2);
  {
    mmux_libc_passwd_t *	passwd_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getpwnam(&passwd_pointer, username));
    return mmux_pointer_bind_to_bash_variable(passwd_pointer_varname, passwd_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setpwent]]])
{
  mmux_libc_setpwent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endpwent]]])
{
  mmux_libc_endpwent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwent]]])
{
  char const *	passwd_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(passwd_pointer_varname,	1);
  {
    mmux_libc_passwd_t *	passwd_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getpwent(&passwd_pointer));
    /* It is fine if P is NULL: it just marks the end of the iteration. */
    return mmux_pointer_bind_to_bash_variable(passwd_pointer_varname, passwd_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_name]]],	[[[string]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_passwd]]],[[[string]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_uid]]],	[[[libc_uid]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_gid]]],	[[[libc_gid]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_gecos]]],	[[[string]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_dir]]],	[[[string]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_passwd_t]]],[[[pw_shell]]],	[[[string]]])


/** --------------------------------------------------------------------
 ** Group database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_group_dump]]])
{
  mmux_libc_group_t *	group_pointer;
  char const *		struct_name = "struct group";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(group_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    mmux_libc_file_descriptor_t		fd;

    MMUX_LIBC_FUNCALL(mmux_libc_stdou(&fd));
    MMUX_LIBC_FUNCALL(mmux_libc_group_dump(fd, group_pointer, struct_name));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER [STRUCT_NAME]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrgid]]])
{
  char const *		group_pointer_varname;
  mmux_libc_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(group_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_GID(gid,				2);
  {
    mmux_libc_group_t *	group_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getgrgid(&group_pointer, gid));
    return mmux_pointer_bind_to_bash_variable(group_pointer_varname, group_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrnam]]])
{
  char const *	group_pointer_varname;
  char const *	username;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(group_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(username,			2);
  {
    mmux_libc_group_t *	group_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getgrnam(&group_pointer, username));
    return mmux_pointer_bind_to_bash_variable(group_pointer_varname, group_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setgrent]]])
{
  mmux_libc_setgrent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endgrent]]])
{
  mmux_libc_endgrent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrent]]])
{
  char const *	group_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(group_pointer_varname,	1);
  {
    mmux_libc_group_t *	group_pointer;

    MMUX_LIBC_FUNCALL(mmux_libc_getgrent(&group_pointer));
    /* It is fine if P is NULL: it just marks the end of the iteration. */
    return mmux_pointer_bind_to_bash_variable(group_pointer_varname, group_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_group_t]]],[[[gr_name]]],	[[[asciizcp]]])
DEFINE_MMUX_LIBC_STRUCT_GETTER([[[mmux_libc_group_t]]],[[[gr_gid]]],	[[[libc_gid]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gr_mem_ref]]])
{
  char const *		index_array_name;
  mmux_libc_group_t *	group_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(index_array_name,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(group_pointer,	2);
  {
    mmux_bash_index_array_variable_t	index_array_variable;
    mmux_bash_index_array_key_t		index_array_key = 0;
    mmux_asciizcp_t			index_array_value;
    mmux_asciizcp_t *			mem;
    mmux_bash_rv_t			brv;

    brv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { return brv; }

    MMUX_LIBC_FUNCALL(mmux_libc_gr_mem_ref(&mem, group_pointer));

    for (; *mem; ++mem, ++index_array_key) {
      index_array_value = *mem;
      brv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { return brv; }
    }
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GR_MEM_ARRY_VAR GROUP_POINTER"]]])

/* end of file */
