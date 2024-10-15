/*
  Part of: MMUX Bash Pointers
  Contents: implementation of mathematics builtins
  Date: Oct 15, 2024

  Abstract

	This module implements mathematics builtins.

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
 ** Mathematics builtins.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_dnl $2 - mathematical function identifier
m4_dnl $3 - type parser macro
m4_dnl $4 - C preprocessor for optional definition
m4_define([[[DEFINE_MATHEMATICS_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_sin]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  mmux_$1_t	rop, op;

  $3(op, argv[2]);

  rop = $3(op);
  return mmux_$1_bind_to_variable(argv[1], op, MMUX_BUILTIN_NAME_STR);

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME_STR);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ROPVAR OP"]]],
    [[["Compute the trigonometric sine of OP, store the result in ROPVAR."]]])

]]])

/* ------------------------------------------------------------------ */

DEFINE_MATHEMATICS_BUILTIN([[[float]]],     [[[sinf]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]])
DEFINE_MATHEMATICS_BUILTIN([[[double]]],    [[[sin]]],   [[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_MATHEMATICS_BUILTIN([[[ldouble]]],   [[[sinl]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]], [[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_MATHEMATICS_BUILTIN([[[float32]]],   [[[sinf32]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_MATHEMATICS_BUILTIN([[[float64]]],   [[[sinf64]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_MATHEMATICS_BUILTIN([[[float128]]],  [[[sinf128]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_MATHEMATICS_BUILTIN([[[float32x]]],  [[[sinf32x]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_MATHEMATICS_BUILTIN([[[float64x]]],  [[[sinf64x]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64X]]],  [[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_MATHEMATICS_BUILTIN([[[float128x]]], [[[sinf128x]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128X]]], [[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_MATHEMATICS_BUILTIN([[[decimal32]]], [[[sind32]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL32]]], [[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_MATHEMATICS_BUILTIN([[[decimal64]]], [[[sind64]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]], [[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_MATHEMATICS_BUILTIN([[[decimal128]]],[[[sind128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]],[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_MATHEMATICS_BUILTIN([[[complexf]]],  [[[csinf]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexd]]],  [[[csind]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexld]]], [[[csinl]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXLD]]], [[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_MATHEMATICS_BUILTIN([[[complexf32]]], [[[csinf32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexf64]]], [[[csinf64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64]]],  [[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexf128]]],[[[csinf128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_MATHEMATICS_BUILTIN([[[complexf32x]]], [[[csinf32x]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexf64x]]], [[[csinf64x]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_MATHEMATICS_BUILTIN([[[complexf128x]]],[[[csinf128x]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

/* end of file */
