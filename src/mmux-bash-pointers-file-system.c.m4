/*
  Part of: MMUX Bash Pointers
  Contents: implementation of file system interface builtins
  Date: Nov 13, 2024

  Abstract

	This module implements file system interface builtins.

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
 ** Hard links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_link]]])
{
  char const *	oldname;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[2]);
  {
    int		rv = link(oldname, newname);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_linkat]]])
{
  int		oldfd;
  char const *	oldname;
  int		newfd;
  char const *	newname;
  int		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(oldfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(newfd,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[5]);
  {
    int		rv = linkat(oldfd, oldname, newfd, newname, flags);

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
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDFD OLDNAME NEWFD NEWNAME FLAGS"]]])


/** --------------------------------------------------------------------
 ** Symbolic links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_symlink]]])
{
  char const *	oldname;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[2]);
  {
    int		rv = symlink(oldname, newname);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_readlink]]])
{
  char const *	filename;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(filename,	argv[2]);
  {
    ssize_t	provided_size = 0;

    while (true) {
      provided_size += 1024;
      {
	char	buffer[provided_size];
	ssize_t	required_size;

	memset(buffer, '\0', provided_size);
	required_size = readlink(filename, buffer, provided_size-1);

	if (required_size < 0) {
	  mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	  return MMUX_FAILURE;
	} else if (required_size == provided_size) {
	  continue;
	} else {
	  return mmux_string_bind_to_bash_variable(argv[1], buffer, MMUX_BASH_BUILTIN_STRING_NAME);
	}
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER REAL_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_canonicalize_file_name]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_CANONICALIZE_FILE_NAME]]],[[[
  char const *	in;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(in,	argv[2]);
  {
    char *	ou = canonicalize_file_name(in);

    if (ou) {
      mmux_bash_rv_t	rv = mmux_string_bind_to_bash_variable(argv[1], ou, MMUX_BASH_BUILTIN_STRING_NAME);
      free(ou);
      return rv;
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
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CANON_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_realpath]]])
{
  char const *	in;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(in,	argv[2]);
  {
    char *	ou = realpath(in, NULL);

    if (ou) {
      mmux_bash_rv_t	rv = mmux_string_bind_to_bash_variable(argv[1], ou, MMUX_BASH_BUILTIN_STRING_NAME);
      free(ou);
      return rv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CANON_PATHNAME_VAR PATHNAME"]]])


/** --------------------------------------------------------------------
 ** Deleting links.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_unlink]]])
{
  char const *	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  {
    int		rv = unlink(pathname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_unlinkat]]])
{
  int		dirfd;
  char const *	pathname;
  int		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[3]);
  {
    int		rv = unlinkat(dirfd, pathname, flags);

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
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rmdir]]])
{
  char const *	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  {
    int		rv = rmdir(pathname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_remove]]])
{
  char const *	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  {
    int		rv = remove(pathname);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])


/** --------------------------------------------------------------------
 ** Renaming.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rename]]])
{
  char const *	oldname;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[2]);
  {
    int		rv = rename(oldname, newname);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_renameat]]])
{
  int		olddirfd;
  char const *	oldname;
  int		newdirfd;
  char const *	newname;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(olddirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(newdirfd,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[4]);
  {
    int		rv = renameat(olddirfd, oldname, newdirfd, newname);

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
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDDIRFD OLDNAME NEWDIRFD NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_renameat2]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_RENAMEAT2]]],[[[
  int		olddirfd;
  char const *	oldname;
  int		newdirfd;
  char const *	newname;
  mmux_uint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(olddirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(oldname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(newdirfd,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(newname,	argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT(flags,		argv[5]);
  {
    int		rv = renameat2(olddirfd, oldname, newdirfd, newname, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDDIRFD OLDNAME NEWDIRFD NEWNAME FLAGS"]]])


/** --------------------------------------------------------------------
 ** Directories.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mkdir]]])
{
  char const *	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,		argv[2]);
  {
    int		rv = mkdir(pathname, mode);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME MODE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mkdirat]]])
{
  mmux_sint_t	dirfd;
  char const *	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,		argv[3]);
  {
    int		rv = mkdirat(dirfd, pathname, mode);

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
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME MODE"]]])


/** --------------------------------------------------------------------
 ** File ownership.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_chown]]])
{
  char const *	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,			argv[3]);
  {
    int		rv = chown(pathname, uid, gid);

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
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME UID GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchown]]])
{
  mmux_sint_t	fd;
  mmux_uid_t	uid;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,	argv[3]);
  {
    int		rv = fchown(fd, uid, gid);

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
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD UID GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lchown]]])
{
  char const *	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,			argv[3]);
  {
    int		rv = lchown(pathname, uid, gid);

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
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME UID GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchownat]]])
{
  mmux_sint_t	dirfd;
  char const *	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UID(uid,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_GID(gid,			argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[5]);
  {
    int		rv = fchownat(dirfd, pathname, uid, gid, flags);

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
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME UID GID FLAGS"]]])


/** --------------------------------------------------------------------
 ** File attributes.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_umask]]])
{
  char const *	old_mask_varname;
  mmux_mode_t	new_mask;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(old_mask_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(new_mask,			argv[2]);
  {
    mmux_mode_t		old_mask = umask(new_mask);

    return mmux_mode_bind_to_bash_variable(old_mask_varname, old_mask, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_MASK_VAR NEW_MASK"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getumask]]])
{
  char const *	old_mask_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(old_mask_varname,	argv[1]);
  {
    mmux_mode_t		old_mask = umask(0);
    umask(old_mask);

    return mmux_mode_bind_to_bash_variable(old_mask_varname, old_mask, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_MASK_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_access]]])
{
  char const *	pathname;
  mmux_sint_t	how;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(how,			argv[2]);
  {
    int		rv = access(pathname, how);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else if (0 != errno) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME HOW"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_faccessat]]])
{
  mmux_sint_t	dirfd;
  char const *	pathname;
  mmux_sint_t	how;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(how,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[4]);
  {
    int		rv = faccessat(dirfd, pathname, how, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else if (0 != errno) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME HOW FLAGS"]]])

/* end of file */
