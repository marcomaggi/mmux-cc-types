/*
  Part of: MMUX CC Libc
  Contents: file system API
  Date: Dec 19, 2024

  Abstract

	This module implements the file system API.

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

#include <mmux-cc-libc-internals.h>


/** --------------------------------------------------------------------
 ** File system: links.
 ** ----------------------------------------------------------------- */

bool
mmux_libc_link (mmux_asciizcp_t oldname, mmux_asciizcp_t newname)
{
  int	rv = link(oldname, newname);

  return ((0 == rv)? false : true);
}
bool
mmux_libc_linkat (mmux_libc_file_descriptor_t oldfd, mmux_asciizcp_t oldname,
		  mmux_libc_file_descriptor_t newfd, mmux_asciizcp_t newname,
		  mmux_sint_t flags)
{
  int	rv = linkat(oldfd.value, oldname, newfd.value, newname, flags);

  return ((0 == rv)? false : true);
}
bool
mmux_libc_symlink (mmux_asciizcp_t oldname, mmux_asciizcp_t newname)
{
  int	rv = symlink(oldname, newname);

  return ((0 == rv)? false : true);
}
bool
mmux_libc_readlink (mmux_usize_t * required_nbytes_p, mmux_asciizcp_t linkname, mmux_asciizp_t buffer, mmux_usize_t provided_nbytes)
{
  mmux_ssize_t	required_nbytes = readlink(linkname, buffer, provided_nbytes);

  if (required_nbytes < 0) {
    return true;
  } else if (required_nbytes == provided_nbytes) {
    *required_nbytes_p = required_nbytes;
    return false;
  } else {
    return false;
  }
}
bool
mmux_libc_readlink_malloc (mmux_asciizcp_t * result_pathname_p, mmux_asciizcp_t linkname)
{
  mmux_ssize_t	provided_nbytes_with_nul = 0;

  while (true) {
    provided_nbytes_with_nul += 1024;
    {
      char		buffer[provided_nbytes_with_nul];
      mmux_usize_t	required_nbytes_no_nul;

      memset(buffer, '\0', provided_nbytes_with_nul);
      if (mmux_libc_readlink(&required_nbytes_no_nul, linkname, buffer, provided_nbytes_with_nul-1)) {
	return true;
      } else if (required_nbytes_no_nul == provided_nbytes_with_nul) {
	continue;
      } else {
	mmux_asciizp_t	pathname;

	if (mmux_libc_malloc(&pathname, provided_nbytes_with_nul)) {
	  return true;
	};
	memcpy(pathname, buffer, provided_nbytes_with_nul);
	*result_pathname_p = pathname;
	return false;
      }
    }
  }
}
bool
mmux_libc_readlinkat (mmux_usize_t * required_nbytes_p, mmux_libc_file_descriptor_t dirfd,
		      mmux_asciizcp_t linkname, mmux_asciizp_t buffer, mmux_usize_t provided_nbytes)
{
  mmux_ssize_t	required_nbytes = readlinkat(dirfd.value, linkname, buffer, provided_nbytes);

  if (required_nbytes < 0) {
    return true;
  } else if (required_nbytes == provided_nbytes) {
    *required_nbytes_p = required_nbytes;
    return false;
  } else {
    return false;
  }
}
bool
mmux_libc_readlinkat_malloc (mmux_asciizcp_t * result_pathname_p, mmux_libc_file_descriptor_t dirfd, mmux_asciizcp_t linkname)
{
  mmux_ssize_t	provided_nbytes_with_nul = 0;

  while (true) {
    provided_nbytes_with_nul += 1024;
    {
      char		buffer[provided_nbytes_with_nul];
      mmux_usize_t	required_nbytes_no_nul;

      memset(buffer, '\0', provided_nbytes_with_nul);
      if (mmux_libc_readlinkat(&required_nbytes_no_nul, dirfd, linkname, buffer, provided_nbytes_with_nul-1)) {
	return true;
      } else if (required_nbytes_no_nul == provided_nbytes_with_nul) {
	continue;
      } else {
	mmux_asciizp_t	pathname;

	if (mmux_libc_malloc(&pathname, provided_nbytes_with_nul)) {
	  return true;
	};
	memcpy(pathname, buffer, provided_nbytes_with_nul);
	*result_pathname_p = pathname;
	return false;
      }
    }
  }
}

/* end of file */
