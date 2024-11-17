/*
  Part of: MMUX Bash Pointers
  Contents: implementation of character builtins
  Date: Nov 16, 2024

  Abstract

	This module implements character builtins.

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
 ** Conversion.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_schar_from_string]]])
{
  char const *	schar_varname;
  char const *	string;
  mmux_usize_t	idx = 0;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(schar_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(string,	argv[2]);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(idx,		argv[3]);
  }
  {
    mmux_usize_t	len = strlen(string);

    if (idx >= len) {
      fprintf(stderr, "%s: the index %lu is too big for the string length %lu\n", MMUX_BASH_BUILTIN_STRING_NAME, idx, len);
      return MMUX_FAILURE;
    } else {
      mmux_schar_t	ch = string[idx];

      return mmux_schar_bind_to_bash_variable(schar_varname, ch, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SCHARVAR STRING [USIZE_INDEX]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_schar_to_string]]])
{
  char const *	string_varname;
  mmux_schar_t	ch;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(string_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SCHAR(ch,				argv[2]);
  {
    char	str[2];

    str[0] = ch;
    str[1] = '\0';
    return mmux_string_bind_to_bash_variable(string_varname, str, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRINGVAR SCHAR"]]])


/** --------------------------------------------------------------------
 ** Classes.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_CHARACTER_PREDICATE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1]]])
{
  mmux_schar_t	ch;

  MMUX_BASH_PARSE_BUILTIN_ARG_SCHAR(ch,		argv[1]);
  {
    int		rv = $1(ch);

    return (rv)? MMUX_SUCCESS : MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SCHAR"]]])]]])

DEFINE_CHARACTER_PREDICATE_BUILTIN([[[islower]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isupper]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isalpha]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isdigit]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isalnum]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isxdigit]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[ispunct]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isspace]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isblank]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isgraph]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isprint]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[iscntrl]]])
DEFINE_CHARACTER_PREDICATE_BUILTIN([[[isascii]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_CHARACTER_CASE_CONVERSION_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1]]])
{
  char const *	output_ch_varname;
  mmux_schar_t	input_ch;

  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR(output_ch_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SCHAR(input_ch,			argv[2]);
  {
    mmux_schar_t	output_ch = $1(input_ch);

    return mmux_schar_bind_to_bash_variable(output_ch_varname, output_ch, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OUTPUT_SCHAR_VAR INPUT_SCHAR"]]])]]])

DEFINE_CHARACTER_CASE_CONVERSION_BUILTIN([[[tolower]]])
DEFINE_CHARACTER_CASE_CONVERSION_BUILTIN([[[toupper]]])

/* end of file */
