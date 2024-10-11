/*
  Part of: MMUX Bash Pointers
  Contents: implementation of miscellaneous builtins
  Date: Sep 30, 2024

  Abstract

	This module implements miscellaneous builtins.

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
 ** Output forma selection for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_set_format]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  /* If  requested:  store the  old  format  string into  a  variable  whose name  is
     specified as second argument. */
  if (3 == argc) {
    int		rv;

    rv = mmux_bash_store_string_in_variable(argv[2], mmux_bash_pointers_output_format_$1, MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) { mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME); return rv; }
  }

  if (0) { printf("%s: old format: \"%s\"\n", __func__, mmux_bash_pointers_output_format_$1); }
  if (0) { printf("%s: new format: \"%s\"\n", __func__, argv[1]); }

  return mmux_$1_set_output_format(argv[1], MMUX_BUILTIN_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_set_format]]],
    [[[((3 == argc) || (2 == argc))]]],
    [[["mmux_$1_set_format FORMAT_STRING [OLD_FORMAT_VARNAME]"]]],
    [[["Configure the output format for floating-point numbers of type \"$1\"."]]])
]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[double]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

/* end of file */
