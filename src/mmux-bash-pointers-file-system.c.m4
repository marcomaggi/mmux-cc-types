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
  mmux_asciizcp_t	oldname;
  mmux_asciizcp_t	newname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_link(oldname, newname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_linkat]]])
{
  mmux_libc_fd_t	oldfd;
  mmux_asciizcp_t	oldname;
  mmux_libc_fd_t	newfd;
  mmux_asciizcp_t	newname;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(oldfd,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(newfd,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,		5);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_linkat(oldfd, oldname, newfd, newname, flags));
    return MMUX_SUCCESS;
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_symlink(oldname, newname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_readlink]]])
{
  mmux_asciizcp_t	pathname_varname;
  mmux_asciizcp_t	linkname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(linkname,		2);
  {
    mmux_asciizcp_t	pathname;

    MMUX_LIBC_FUNCALL(mmux_libc_readlink_malloc(&pathname, linkname));
    {
      mmux_bash_rv_t	brv;

      brv = mmux_string_bind_to_bash_variable(pathname_varname, pathname, MMUX_BASH_BUILTIN_STRING_NAME);
      mmux_libc_free((mmux_pointer_t)pathname);
      return brv;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER REAL_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_readlinkat]]])
{
  mmux_asciizcp_t		pathname_varname;
  mmux_libc_file_descriptor_t	dirfd;
  mmux_asciizcp_t		linkname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(dirfd,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(linkname,		3);
  {
    mmux_asciizcp_t	pathname;

    MMUX_LIBC_FUNCALL(mmux_libc_readlinkat_malloc(&pathname, dirfd, linkname));
    {
      mmux_bash_rv_t	brv;

      brv = mmux_string_bind_to_bash_variable(pathname_varname, pathname, MMUX_BASH_BUILTIN_STRING_NAME);
      mmux_libc_free((mmux_pointer_t)pathname);
      return brv;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER REAL_PATHNAME_VAR DIRFD PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_canonicalize_file_name]]])
{
  mmux_asciizcp_t	result_pathname_varname;
  mmux_asciizcp_t	in;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_pathname_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(in,				2);
  {
    mmux_asciizp_t	ou;
    mmux_bash_rv_t	brv;

    MMUX_LIBC_FUNCALL(mmux_libc_canonicalize_file_name(&ou, in));
    brv = mmux_string_bind_to_bash_variable(result_pathname_varname, ou, MMUX_BASH_BUILTIN_STRING_NAME);
    mmux_libc_free(ou);
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CANON_PATHNAME_VAR PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_realpath]]])
{
  mmux_asciizcp_t	result_pathname_varname;
  mmux_asciizcp_t	in;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(result_pathname_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(in,				2);
  {
    mmux_asciizp_t	ou;
    mmux_bash_rv_t	brv;

    MMUX_LIBC_FUNCALL(mmux_libc_realpath(&ou, in));
    brv = mmux_string_bind_to_bash_variable(result_pathname_varname, ou, MMUX_BASH_BUILTIN_STRING_NAME);
    mmux_libc_free(ou);
    return brv;
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
  mmux_asciizcp_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_unlink(pathname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_unlinkat]]])
{
  mmux_libc_file_descriptor_t	dirfd;
  mmux_asciizcp_t		pathname;
  mmux_sint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(dirfd,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,		3);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_unlinkat(dirfd, pathname, flags));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_rmdir]]])
{
  mmux_asciizcp_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_rmdir(pathname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_remove]]])
{
  mmux_asciizcp_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_remove(pathname));
    return MMUX_SUCCESS;
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
  mmux_asciizcp_t	oldname;
  mmux_asciizcp_t	newname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	2);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_rename(oldname, newname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDNAME NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_renameat]]])
{
  mmux_libc_file_descriptor_t	olddirfd;
  mmux_asciizcp_t		oldname;
  mmux_libc_file_descriptor_t	newdirfd;
  mmux_asciizcp_t		newname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(olddirfd,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(newdirfd,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	4);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_renameat(olddirfd, oldname, newdirfd, newname));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDDIRFD OLDNAME NEWDIRFD NEWNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_renameat2]]])
{
  mmux_libc_file_descriptor_t	olddirfd;
  mmux_asciizcp_t		oldname;
  mmux_libc_file_descriptor_t	newdirfd;
  mmux_asciizcp_t		newname;
  mmux_uint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(olddirfd,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(oldname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD(newdirfd,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(newname,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT(flags,		5);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_renameat2(olddirfd, oldname, newdirfd, newname, flags));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLDDIRFD OLDNAME NEWDIRFD NEWNAME FLAGS"]]])


/** --------------------------------------------------------------------
 ** Directories.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mkdir]]])
{
  mmux_asciizcp_t	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	2);
  {
    int		rv = mkdir(pathname, mode);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME MODE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_mkdirat]]])
{
  mmux_sint_t	dirfd;
  mmux_asciizcp_t	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(dirfd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	3);
  {
    int		rv = mkdirat(dirfd, pathname, mode);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME MODE"]]])


/** --------------------------------------------------------------------
 ** File ownership.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_chown]]])
{
  mmux_asciizcp_t	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UID(uid,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_GID(gid,	3);
  {
    int		rv = chown(pathname, uid, gid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UID(uid,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_GID(gid,	3);
  {
    int		rv = fchown(fd, uid, gid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD UID GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lchown]]])
{
  mmux_asciizcp_t	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UID(uid,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_GID(gid,	3);
  {
    int		rv = lchown(pathname, uid, gid);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME UID GID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchownat]]])
{
  mmux_sint_t	dirfd;
  mmux_asciizcp_t	pathname;
  mmux_uid_t	uid;
  mmux_gid_t	gid;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(dirfd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UID(uid,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_GID(gid,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	5);
  {
    int		rv = fchownat(dirfd, pathname, uid, gid, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME UID GID FLAGS"]]])


/** --------------------------------------------------------------------
 ** File access permissions.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_umask]]])
{
  mmux_asciizcp_t	old_mask_varname;
  mmux_mode_t	new_mask;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(old_mask_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(new_mask,	2);
  {
    mmux_mode_t		old_mask = umask(new_mask);

    return mmux_mode_bind_to_bash_variable(old_mask_varname, old_mask, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OLD_MASK_VAR NEW_MASK"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getumask]]])
{
  mmux_asciizcp_t	old_mask_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(old_mask_varname,	1);
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
  mmux_asciizcp_t	pathname;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	2);
  {
    int		rv = chmod(pathname, mode);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME MODE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchmod]]])
{
  mmux_sint_t	fd;
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	2);
  {
    int		rv = fchmod(fd, mode);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD MODE"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fchmodat]]])
{
  mmux_sint_t	dirfd;
  mmux_asciizcp_t	pathname;
  mmux_mode_t	mode;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(dirfd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	4);
  {
    int		rv = fchmodat(dirfd, pathname, mode, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME MODE FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_access]]])
{
  mmux_asciizcp_t	pathname;
  mmux_sint_t	how;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(how,	2);
  {
    int		rv = access(pathname, how);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else if (0 != errno) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME HOW"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_faccessat]]])
{
  mmux_sint_t	dirfd;
  mmux_asciizcp_t	pathname;
  mmux_sint_t	how;
  mmux_sint_t	flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(dirfd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(how,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	4);
  {
    int		rv = faccessat(dirfd, pathname, how, flags);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else if (0 != errno) {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    }
    return MMUX_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME HOW FLAGS"]]])


/** --------------------------------------------------------------------
 ** Truncating file size.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_truncate]]])
{
  mmux_asciizcp_t	pathname;
  mmux_off_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(len,	2);
  {
    int		rv = truncate(pathname, len);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME LEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ftruncate]]])
{
  mmux_sint_t	fd;
  mmux_off_t	len;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF(len,	2);
  {
    int		rv = ftruncate(fd, len);

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
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME LEN"]]])


/** --------------------------------------------------------------------
 ** File attributes.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_stat_malloc]]])
{
  mmux_asciizcp_t	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
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
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_mode_t		value        = stat_pointer->st_mode;

    return mmux_mode_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_uid_ref]]])
{
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_uid_t		value        = stat_pointer->st_uid;

    return mmux_uid_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_gid_ref]]])
{
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_gid_t		value        = stat_pointer->st_gid;

    return mmux_gid_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_size_ref]]])
{
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_off_t		value        = stat_pointer->st_size;

    return mmux_off_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_GETTER_UINTMAX]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_st_$1_ref]]])
{
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_uintmax_t	value        = (uintmax_t)(stat_pointer->st_$1);

    return mmux_uintmax_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_time_t		value        = (stat_pointer->st_$1);

    return mmux_time_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct stat *	stat_pointer = pointer;
    mmux_ulong_t	value        = (stat_pointer->st_$1.tv_nsec);

    return mmux_ulong_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
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
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fstat]]])
{
  mmux_sint_t		fd;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER FD STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lstat]]])
{
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME STAT_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_fstatat]]])
{
  mmux_sint_t		dirfd;
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	pointer;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(dirfd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	4);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER DIRFD PATHNAME STAT_POINTER FLAGS"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STAT_MODE_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_S_$1]]])
{
  mmux_mode_t	mode;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE(mode,	1);
  {
    int		rv = S_$1(mode);
    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  {
    struct stat *	stat_pointer = pointer;
    int			rv           = S_$1(stat_pointer);
    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
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
  mmux_asciizcp_t	pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pointer_varname,	1);
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
  mmux_asciizcp_t		value_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
  {
    struct utimbuf *	utimbuf_pointer = pointer;
    mmux_time_t		value           = utimbuf_pointer->$1;

    return mmux_time_bind_to_bash_variable(value_varname, value, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER VALUE_VARNAME UTIMBUF_POINTER"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimbuf_$1_set]]])
{
  mmux_pointer_t	pointer;
  mmux_time_t		value;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME(value,	2);
  {
    struct utimbuf *	utimbuf_pointer = pointer;

    utimbuf_pointer->$1 = value;
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UTIMBUF_POINTER TIME"]]])]]])

DEFINE_UTIMBUF_FIELD_GET_SET([[[actime]]])
DEFINE_UTIMBUF_FIELD_GET_SET([[[modtime]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utime]]])
{
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(pointer,	2);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME UTIMBUF_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_utimes]]])
{
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	access_pointer;
  mmux_pointer_t	modification_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(access_pointer,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(modification_pointer,	3);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PATHNAME ACCESS_TIMEVAL_POINTER MODIFICATION_TIMEVAL_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_lutimes]]])
{
  mmux_asciizcp_t		pathname;
  mmux_pointer_t	access_pointer;
  mmux_pointer_t	modification_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(pathname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(access_pointer,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(modification_pointer,	3);
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(fd,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(access_pointer,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(modification_pointer,	3);
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
