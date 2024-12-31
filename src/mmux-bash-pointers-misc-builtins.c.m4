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
 ** Output format selection for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_SETTER_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_set_format]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  char	old_format[MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN];
  bool	rv;

  mmux_$1_save_output_format(old_format);

  /* Set the new format. */
  rv = mmux_$1_set_output_format(argv[1], MMUX_BASH_BUILTIN_STRING_NAME);
  if (false == rv) {
    /* If  requested: store  the old  format  string into  a variable  whose name  is
       specified as  second argument.   If an  error occurs:  restore the  old format
       before returning. */
    if (3 == argc) {
      mmux_bash_rv_t	rv2 = mmux_string_bind_to_bash_variable(argv[2], old_format, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != rv2) {
	mmux_$1_set_output_format(old_format, NULL);
	mmux_bash_pointers_set_ERRNO(MMUX_LIBC_EINVAL, MMUX_BASH_BUILTIN_STRING_NAME);
	return rv2;
      }
    }
  }
  return MMUX_SUCCESS;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
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


/** --------------------------------------------------------------------
 ** Output format selection for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_ref_format]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[
  return mmux_string_bind_to_bash_variable(argv[1], mmux_$1_ref_output_format(), MMUX_BASH_BUILTIN_STRING_NAME);
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_ref_format]]],
    [[[(2 == argc)]]],
    [[["mmux_$1_ref_format FORMATVAR"]]],
    [[["Retrieve the current output format for floating-point numbers of type \"$1\"."]]])
]]])

DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[double]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[ldouble]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float32x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float64x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_FLOAT_OUTPUT_FORMAT_GETTER_BUILTIN([[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Reformatting real floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex floating-point number stem
m4_dnl $2 - complex floating-point number parser macro
m4_dnl $3 - C language preprocessor symbol for conditional definition

m4_define([[[DEFINE_REAL_FLOAT_REFORMAT_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_reformat]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$1_t		value;

  $2(value, argv[3], MMUX_BASH_BUILTIN_STRING_NAME);
  {
    char		old_format[MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN];
    mmux_bash_rv_t	bash_rv;

    mmux_$1_save_output_format(old_format);
    {
      bool	rv = mmux_$1_set_output_format(argv[2], MMUX_BASH_BUILTIN_STRING_NAME);
      if (true == rv) { bash_rv = MMUX_FAILURE; goto get_out; }
      bash_rv = mmux_$1_bind_to_bash_variable(argv[1], value, MMUX_BASH_BUILTIN_STRING_NAME);
    }
   get_out:
    mmux_$1_set_output_format(old_format, NULL);
    return bash_rv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_reformat]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_reformat OUTPUTVAR FORMAT INPUT"]]],
    [[["Reformat the number INPUT according to FORMAT, store the result in OUTPUTVAR."]]])
]]])

DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[double]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[ldouble]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float32]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float64]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float128]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float32x]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32X]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float64x]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64X]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[float128x]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128X]]],	[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[decimal32]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL32]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[decimal64]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_REAL_FLOAT_REFORMAT_BUILTIN([[[decimal128]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]],	[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Reformatting complex floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex floating-point number stem
m4_dnl $2 - real part floating-point number stem
m4_dnl $3 - complex floating-point number parser macro
m4_dnl $4 - C language preprocessor symbol for conditional definition
m4_define([[[DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_$1_reformat]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
  mmux_$1_t		value;

  $3(value, argv[3], MMUX_BASH_BUILTIN_STRING_NAME);
  {
    char		old_format[MMUX_CC_TYPES_FLOAT_FORMAT_MAXLEN];
    mmux_bash_rv_t	bash_rv;

    mmux_$2_save_output_format(old_format);
    {
      bool	rv = mmux_$2_set_output_format(argv[2], MMUX_BASH_BUILTIN_STRING_NAME);
      if (true == rv) { bash_rv = MMUX_FAILURE; goto get_out; }
      bash_rv = mmux_$1_bind_to_bash_variable(argv[1], value, MMUX_BASH_BUILTIN_STRING_NAME);
    }
   get_out:
    mmux_$2_set_output_format(old_format, NULL);
    return bash_rv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_reformat]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_reformat OUTPUTVAR FORMAT INPUT"]]],
    [[["Reformat the number INPUT according to FORMAT, store the result in OUTPUTVAR."]]])
]]])

DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf]]],		[[[float]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexd]]],		[[[double]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexld]]],		[[[ldouble]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXLD]]],	[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf32]]],		[[[float32]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf64]]],		[[[float64]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf128]]],	[[[float128]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf32x]]],	[[[float32x]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32X]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf64x]]],	[[[float64x]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64X]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexf128x]]],	[[[float128x]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128X]]],[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexd32]]],		[[[decimal32]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexd64]]],		[[[decimal64]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_COMPLEX_FLOAT_REFORMAT_BUILTIN([[[complexd128]]],	[[[decimal128]]],
				      [[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

/* end of file */
