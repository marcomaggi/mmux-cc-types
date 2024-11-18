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
      char const *			index_array_name = argv[1];
      mmux_bash_index_array_variable_t	index_array_variable;
      mmux_bash_rv_t			rv;

      rv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) { return rv; }

      for (mmux_sint_t i=0; i<ngroups; ++i) {
	mmux_bash_index_array_index_t	index_array_key = i;
	mmux_sint_t			required_bytes = mmux_gid_sprint_size(gids[i]);

	if (required_bytes < 0) {
	  goto error_converting_gid_to_string;
	} else {
	  char	index_array_value[required_bytes];

	  if (mmux_gid_sprint(index_array_value, required_bytes, gids[i])) {
	    goto error_converting_gid_to_string;
	  } else {
	    rv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value,
					    MMUX_BASH_BUILTIN_STRING_NAME);
	    if (MMUX_SUCCESS != rv) { return rv; }
	  }
	}
      }
      return MMUX_SUCCESS;

    error_converting_gid_to_string:
      fprintf(stderr, "%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUPS_ARRYNAME"]]])


/** --------------------------------------------------------------------
 ** Setting uid and gid.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setuid]]])
{
  mmux_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,		argv[1]);
  {
    int		rv = setuid(uid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_seteuid]]])
{
  mmux_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,		argv[1]);
  {
    int		rv = seteuid(uid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setreuid]]])
{
  mmux_uid_t	ruid, euid;

  MMUX_BASH_PARSE_BUILTIN_ARG_UID(ruid,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UID(euid,		argv[2]);
  {
    int		rv = setreuid(ruid, euid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RUID EUID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setegid]]])
{
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,		argv[1]);
  {
    int		rv = setegid(gid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setgid]]])
{
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,		argv[1]);
  {
    int		rv = setgid(gid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setregid]]])
{
  mmux_gid_t	rgid, egid;

  MMUX_BASH_PARSE_BUILTIN_ARG_GID(rgid,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(egid,		argv[2]);
  {
    int		rv = setregid(rgid, egid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER RGID EGID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrouplist]]])
{
  char const *	username;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(username,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,			argv[3]);
  {
    mmux_sint_t		ngroups = 0;

    getgrouplist(username, gid, NULL, &ngroups);
    {
      mmux_gid_t	gids[ngroups];
      mmux_sint_t	rv = getgrouplist(username, gid, gids, &ngroups);

      if (-1 == rv) {
	goto error_reading_groups;
      } else {
	char const *				index_array_name = argv[1];
	mmux_bash_index_array_variable_t	index_array_variable;
	mmux_bash_rv_t				brv;

	brv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { return brv; }

	for (mmux_sint_t i=0; i<ngroups; ++i) {
	  mmux_bash_index_array_index_t	index_array_key = i;
	  mmux_sint_t			required_bytes = mmux_gid_sprint_size(gids[i]);

	  if (required_bytes < 0) {
	    goto error_converting_gid_to_string;
	  } else {
	    char	index_array_value[required_bytes];

	    if (mmux_gid_sprint(index_array_value, required_bytes, gids[i])) {
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
	fprintf(stderr, "%s: error: cannot convert GID value to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	return MMUX_FAILURE;
      }
    }
  error_reading_groups:
    mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    return MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUPS_ARRYNAME USERNAME GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_group_member]]])
{
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,		argv[2]);
  {
    int		rv = group_member(gid);

    return mmux_sint_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER BOOLVAR GID"]]])


/** --------------------------------------------------------------------
 ** Identifying who logged in.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getlogin]]])
{
  char const *	username = getlogin();

  return mmux_string_bind_to_bash_variable(argv[1], username, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER USERNAMEVAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_cuserid]]])
{
  char const *	username = cuserid(NULL);

  return mmux_string_bind_to_bash_variable(argv[1], username, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER USERNAMEVAR"]]])


/** --------------------------------------------------------------------
 ** User database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwuid]]])
{
  mmux_uid_t	uid;

  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,		argv[2]);
  {
    struct passwd *	P = getpwuid(uid);

    if (P) {
      return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwnam]]])
{
  char const *	username;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(username,	argv[2]);
  {
    struct passwd *	P = getpwnam(username);

    if (P) {
      return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR UID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setpwent]]])
{
  setpwent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endpwent]]])
{
  endpwent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpwent]]])
{
  struct passwd *	P = getpwent();

  /* It is fine if P is NULL: it just marks the end of the iteration. */
  return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PASSWD_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_name]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->pw_name, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_NAME_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_passwd]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->pw_passwd, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_PASSWD_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_uid]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_uid_bind_to_bash_variable(argv[1], P->pw_uid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_UID_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_gid]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_gid_bind_to_bash_variable(argv[1], P->pw_gid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_GID_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_gecos]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->pw_gecos, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_GECOS_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_dir]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->pw_dir, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_DIR_VAR PASSWD_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_pw_shell]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct passwd *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->pw_shell, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PW_SHELL_VAR PASSWD_POINTER"]]])


/** --------------------------------------------------------------------
 ** Group database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrgid]]])
{
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,		argv[2]);
  {
    struct group *	P = getgrgid(gid);

    if (P) {
      return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrnam]]])
{
  char const *	username;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(username,	argv[2]);
  {
    struct group *	P = getgrnam(username);

    if (P) {
      return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setgrent]]])
{
  setgrent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endgrent]]])
{
  endgrent();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getgrent]]])
{
  struct group *	P = getgrent();

  /* It is fine if P is NULL: it just marks the end of the iteration. */
  return mmux_pointer_bind_to_bash_variable(argv[1], P, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GROUP_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gr_name]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct group *	P = ptr;

    return mmux_string_bind_to_bash_variable(argv[1], P->gr_name, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GR_NAME_VAR GROUP_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gr_gid]]])
{
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,		argv[2]);
  {
    struct group *	P = ptr;

    return mmux_gid_bind_to_bash_variable(argv[1], P->gr_gid, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GR_GID_VAR GROUP_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gr_mem]]])
{
  char const *		index_array_name;
  mmux_pointer_t	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(index_array_name,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(ptr,			argv[2]);
  {
    struct group *			P = ptr;
    mmux_bash_index_array_variable_t	index_array_variable;
    mmux_bash_index_array_index_t	index_array_key = 0;
    char *				index_array_value;
    mmux_bash_rv_t			rv;

    rv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }

    for (char ** mem=P->gr_mem; *mem; ++mem, ++index_array_key) {
      index_array_value = *mem;
      rv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv) { return rv; }
    }
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER GR_MEM_ARRY_VAR GROUP_POINTER"]]])

/* end of file */
