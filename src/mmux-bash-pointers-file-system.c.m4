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
 ** File access permissions.
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_MASK_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_chmod]]])
{
  char const *	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,		argv[2]);
  {
    int		rv = chmod(pathname, mode);

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

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchmod]]])
{
  mmux_sint_t	fd;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,	argv[2]);
  {
    int		rv = fchmod(fd, mode);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD MODE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchmodat]]])
{
  mmux_sint_t	dirfd;
  char const *	pathname;
  mmux_mode_t	mode;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[4]);
  {
    int		rv = fchmodat(dirfd, pathname, mode, flags);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME MODE FLAGS"]]])

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


/** --------------------------------------------------------------------
 ** Truncating file size.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_truncate]]])
{
  char const *	pathname;
  mmux_off_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF(len,			argv[2]);
  {
    int		rv = truncate(pathname, len);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME LEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ftruncate]]])
{
  mmux_sint_t	fd;
  mmux_off_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_OFF(len,	argv[2]);
  {
    int		rv = ftruncate(fd, len);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME LEN"]]])


/** --------------------------------------------------------------------
 ** File attributes.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_stat_malloc]]])
{
  char const *	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pointer_varname,	argv[1]);
  {
    struct stat *	stat_pointer = calloc(1, sizeof(struct stat));

    if (stat_pointer) {
      return mmux_pointer_bind_to_bash_variable(pointer_varname, stat_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAT_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_mode_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_mode_t		value        = stat_pointer->st_mode;

    return mmux_mode_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_uid_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_uid_t		value        = stat_pointer->st_uid;

    return mmux_uid_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_gid_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_gid_t		value        = stat_pointer->st_gid;

    return mmux_gid_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_size_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_off_t		value        = stat_pointer->st_size;

    return mmux_off_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_GETTER_UINTMAX]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_$1_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_uintmax_t	value        = (uintmax_t)(stat_pointer->st_$1);

    return mmux_uintmax_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])]]])

DEFINE_STAT_GETTER_UINTMAX([[[ino]]])
DEFINE_STAT_GETTER_UINTMAX([[[dev]]])
DEFINE_STAT_GETTER_UINTMAX([[[nlink]]])
DEFINE_STAT_GETTER_UINTMAX([[[blocks]]])
DEFINE_STAT_GETTER_UINTMAX([[[blksize]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_GETTER_TIME]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_$1_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_time_t		value        = (stat_pointer->st_$1);

    return mmux_time_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])]]])

DEFINE_STAT_GETTER_TIME([[[atime]]])
DEFINE_STAT_GETTER_TIME([[[mtime]]])
DEFINE_STAT_GETTER_TIME([[[ctime]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_GETTER_ULONG]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_$1e_nsec_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    mmux_ulong_t	value        = (stat_pointer->st_$1.tv_nsec);

    return mmux_ulong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])]]])

DEFINE_STAT_GETTER_ULONG([[[atim]]])
DEFINE_STAT_GETTER_ULONG([[[mtim]]])
DEFINE_STAT_GETTER_ULONG([[[ctim]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_stat]]])
{
  char const *		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = stat(pathname, stat_pointer);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fstat]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = fstat(fd, stat_pointer);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lstat]]])
{
  char const *		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = lstat(pathname, stat_pointer);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fstatat]]])
{
  mmux_sint_t		dirfd;
  char const *		pathname;
  mmux_pointer_t	pointer;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(dirfd,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,		argv[4]);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = fstatat(dirfd, pathname, stat_pointer, flags);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME STAT_POINTER FLAGS"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_MODE_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_S_$1]]])
{
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARG_MODE(mode,	argv[1]);
  {
    int		rv = S_$1(mode);
    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ST_MODE"]]])]]])

DEFINE_STAT_MODE_PREDICATE([[[ISDIR]]])
DEFINE_STAT_MODE_PREDICATE([[[ISCHR]]])
DEFINE_STAT_MODE_PREDICATE([[[ISBLK]]])
DEFINE_STAT_MODE_PREDICATE([[[ISREG]]])
DEFINE_STAT_MODE_PREDICATE([[[ISFIFO]]])
DEFINE_STAT_MODE_PREDICATE([[[ISLNK]]])
DEFINE_STAT_MODE_PREDICATE([[[ISSOCK]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_PTR_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_S_$1]]])
{
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,	argv[1]);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = S_$1(stat_pointer);
    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAT_POINTER"]]])]]])

DEFINE_STAT_PTR_PREDICATE([[[TYPEISMQ]]])
DEFINE_STAT_PTR_PREDICATE([[[TYPEISSEM]]])
DEFINE_STAT_PTR_PREDICATE([[[TYPEISSHM]]])


/** --------------------------------------------------------------------
 ** File times.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimbuf_malloc]]])
{
  char const *	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pointer_varname,	argv[1]);
  {
    struct utimbuf *	utimbuf_pointer = calloc(1, sizeof(struct utimbuf));

    if (utimbuf_pointer) {
      return mmux_pointer_bind_to_bash_variable(pointer_varname, utimbuf_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UTIMBUF_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_UTIMBUF_FIELD_GET_SET]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimbuf_$1_ref]]])
{
  char const *		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct utimbuf *	utimbuf_pointer = pointer;
    mmux_time_t		value           = utimbuf_pointer->$1;

    return mmux_time_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME UTIMBUF_POINTER"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimbuf_$1_set]]])
{
  mmux_pointer_t	pointer;
  mmux_time_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_TIME(value,		argv[2]);
  {
    struct utimbuf *	utimbuf_pointer = pointer;

    utimbuf_pointer->$1 = value;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UTIMBUF_POINTER TIME"]]])]]])

DEFINE_UTIMBUF_FIELD_GET_SET([[[actime]]])
DEFINE_UTIMBUF_FIELD_GET_SET([[[modtime]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utime]]])
{
  char const *		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,		argv[2]);
  {
    struct utimbuf *	utimbuf_pointer = pointer;
    int			rv = utime(pathname, utimbuf_pointer);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME UTIMBUF_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimes]]])
{
  char const *		pathname;
  mmux_pointer_t	access_pointer;
  mmux_pointer_t	modification_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(access_pointer,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(modification_pointer,	argv[3]);
  {
    struct timeval *	access_timeval_pointer       = access_pointer;
    struct timeval *	modification_timeval_pointer = modification_pointer;
    struct timeval	T[2] = { *access_timeval_pointer, *modification_timeval_pointer };
    int			rv   = utimes(pathname, T);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME ACCESS_TIMEVAL_POINTER MODIFICATION_TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lutimes]]])
{
  char const *		pathname;
  mmux_pointer_t	access_pointer;
  mmux_pointer_t	modification_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(pathname,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(access_pointer,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(modification_pointer,	argv[3]);
  {
    struct timeval *	access_timeval_pointer       = access_pointer;
    struct timeval *	modification_timeval_pointer = modification_pointer;
    struct timeval	T[2] = { *access_timeval_pointer, *modification_timeval_pointer };
    int			rv   = lutimes(pathname, T);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME ACCESS_TIMEVAL_POINTER MODIFICATION_TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_futimes]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	access_pointer;
  mmux_pointer_t	modification_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(fd,				argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(access_pointer,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(modification_pointer,	argv[3]);
  {
    struct timeval *	access_timeval_pointer       = access_pointer;
    struct timeval *	modification_timeval_pointer = modification_pointer;
    struct timeval	T[2] = { *access_timeval_pointer, *modification_timeval_pointer };
    int			rv   = futimes(fd, T);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME ACCESS_TIMEVAL_POINTER MODIFICATION_TIMEVAL_POINTER"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_file_system_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_stat_SIZEOF",  sizeof(struct stat), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_utimbuf_SIZEOF",  sizeof(struct utimbuf), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
