/*
  Part of: MMUX Bash Pointers
  Contents: shell variable binding functions
  Date: Nov 16, 2024

  Abstract

	This module implements shell variable binding functions.

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
 ** Binding values to shell variables.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_VALUE_STORER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
mmux_bash_rv_t
mmux_$1_bind_to_bash_variable (char const * variable_name, mmux_$1_t value, char const * caller_name)
{
  int		rv, required_nbytes;

  required_nbytes = mmux_$1_sprint_size(value);
  if (0 > required_nbytes) {
    return MMUX_FAILURE;
  } else {
    char	s_value[required_nbytes];

    rv = mmux_$1_sprint(s_value, required_nbytes, value);
    if (false == rv) {
      return mmux_string_bind_to_bash_variable(variable_name, s_value, caller_name);
    } else {
      return MMUX_FAILURE;
    }
  }
}
]]])]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[pointer]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[schar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sshort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ushort]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[slong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ulong]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint8]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint16]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sint64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uint64]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[double]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[float128x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[decimal128]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[complexf]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexd]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexld]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[complexf32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[complexd32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexd64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[usize]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ssize]]])

MMUX_BASH_DEFINE_VALUE_STORER([[[sintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintmax]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[sintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uintptr]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[ptrdiff]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[mode]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[off]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[pid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[uid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[gid]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wchar]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[wint]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[time]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[socklen]]])
MMUX_BASH_DEFINE_VALUE_STORER([[[rlim]]])

mmux_bash_rv_t
mmux_fd_bind_to_bash_variable (char const * fd_varname, mmux_libc_file_descriptor_t fd, char const * caller_name)
{
  return mmux_sint_bind_to_bash_variable(fd_varname, fd.value, caller_name);
}

/* end of file */
