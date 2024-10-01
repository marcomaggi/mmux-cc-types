m4_divert(-1)m4_dnl
m4_dnl
m4_dnl Part of: MMUX Bash Builtins Macros
m4_dnl Contents: macros to define builtins
m4_dnl Date: Sep  9, 2024
m4_dnl
m4_dnl Abstract
m4_dnl
m4_dnl		This library  defines macros to  automatically generate C language
m4_dnl		functions for GNU Bash builtings implementation.
m4_dnl
m4_dnl Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
m4_dnl
m4_dnl This is free software; you can redistribute  it and/or modify it under the terms of
m4_dnl the GNU Lesser General Public License as published by the Free Software Foundation;
m4_dnl either version 3.0 of the License, or (at your option) any later version.
m4_dnl
m4_dnl This library  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
m4_dnl WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
m4_dnl PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
m4_dnl
m4_dnl You should have received a copy of the GNU Lesser General Public License along with
m4_dnl this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
m4_dnl Suite 330, Boston, MA 02111-1307 USA.
m4_dnl


m4_dnl preamble

m4_changequote(`[[[', `]]]')
m4_changecom([[[/*]]],[[[*/]]])


m4_dnl helpers

m4_define([[[mmux_toupper]]],[[[m4_translit([[[$1]]],[[[abcdefghijklmnopqrstuvwxyz]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]])]]])
m4_define([[[mmux_tolower]]],[[[m4_translit([[[$1]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]],[[[abcdefghijklmnopqrstuvwxyz]]])]]])


m4_dnl function definitions

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression, between parentheses, about "argc": if true the number of argumets is correct
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_FUNCTION_NO_OPTIONS]]],[[[m4_dnl
static bool
$1_validate_argc (int argc)
{
  return ($2)? true : false;
}
static int
$1_builtin (mmux_bash_word_list_t word_list)
{
  return (int) mmux_bash_builtin_implementation_function_no_options(word_list, $1_validate_argc, $1_main);
}
]]])

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression, between parentheses, about "argc": if true the number of argumets is correct
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_FUNCTION]]],[[[m4_dnl
static bool
$1_validate_argc (int argc)
{
  return ($2)? true : false;
}
static int
$1_builtin (mmux_bash_word_list_t word_list)
{
  return (int) mmux_bash_builtin_implementation_function(word_list, $1_validate_argc, $1_main);
}
]]])


m4_dnl data structures

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing the short documentation
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_STRUCT]]],[[[m4_dnl
/* Bash will search for this struct  building the name "$1_struct" from the command
   line argument "$1" we have given to the "enable" builtin. */
mmux_bash_struct_builtin_t $1_struct = {
  .name		= "$1",				/* Builtin name */
  .function	= $1_builtin,			/* Function implementing the builtin */
  .flags	= MMUX_BUILTIN_ENABLED | MMUX_ARRAYREF_BUILTIN,		/* Initial flags for builtin */
  .long_doc	= $1_doc,			/* Array of long documentation strings. */
  .short_doc	= $2,				/* Usage synopsis; becomes short_doc */
  .reserved0	= NULL				/* Reserved for Bash. */
};
]]])

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing a single-line long documentation
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE]]],[[[m4_dnl
/* A NULL-terminated array of ASCIIZ strings representing the lines of the
   builtin long documentation. */
static char * $1_doc[] = {
  $2,
  (char *)NULL
};
]]])


m4_dnl usages

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression about "argc": if true the number of argumets is wrong
m4_dnl $3 - C language string representing the short documentation
m4_dnl $4 - C language string representing the long documentation, a single-line
m4_define([[[MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION]]],[[[m4_dnl
m4_dnl Here we do not use the NO_OPTION  version of the implementation function: with that
m4_dnl version an argument  like "-1.2" is interpreted  as an option, and  an error raised
m4_dnl because there  are no  options allowed.   Here we  want such  arguments to  just go
m4_dnl through any validation and come to us as they are.
MMUX_BASH_DEFINE_BUILTIN_FUNCTION([[[$1]]],[[[$2]]])
MMUX_BASH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE([[[$1]]],[[[$4]]])
MMUX_BASH_DEFINE_BUILTIN_STRUCT([[[$1]]],[[[$3]]])
]]])

m4_dnl m4_dnlif 0
m4_dnl /* Called when  the builtin is  enabled and loaded from  the shared object.   If this
m4_dnl    function returns 0, the load fails. */
m4_dnl int
m4_dnl add_builtin_load (char *name MMUX_BASH_POINTERS_UNUSED)
m4_dnl {
m4_dnl   return (1);
m4_dnl }
m4_dnl /* Called when `add' is disabled. */
m4_dnl void
m4_dnl add_builtin_unload (char *name)
m4_dnl {
m4_dnl }
m4_dnl #endif


m4_dnl helpers

m4_dnl $1 - Preprocessor symbol: if defined, include the body of code; otherwise include the alternative body.
m4_dnl $2 - The body of code.
m4_dnl $3 - The alternative of code.
m4_define([[[MMUX_BASH_CONDITIONAL_CODE]]],[[[m4_ifelse([[[$1]]],,[[[$2]]],[[[m4_dnl
#if ((defined $1) && (1 == $1))
$2
m4_ifelse([[[$3]]],,,[[[m4_dnl
#else
$3
]]])
#endif
]]])]]])


#### parsing arguments

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_POINTER]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SCHAR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_schar(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UCHAR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uchar(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SSHORT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sshort(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_USHORT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ushort(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uint(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_slong(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ulong(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SLLONG]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sllong(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_ULLONG]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ullong(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT8]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint8(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT8]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uint8(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT16]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint16(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT16]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uint16(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uint32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sint64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uint64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_double(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ldouble(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float128(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32X]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float32x(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64X]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float64x(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128X]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_float128x(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_decimal32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_decimal64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_decimal128(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexf(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexd(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXLD]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexld(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexf32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])
# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexf64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexf128(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD32]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexd32(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD64]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexd64(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD128]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_complexd128(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MODE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_mode(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SSIZE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ssize(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_USIZE]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_usize(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTMAX]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sintmax(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTMAX]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uintmax(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTPTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_sintptr(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTPTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uintptr(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_PTRDIFF]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_ptrdiff(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_OFF]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_off(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_PID]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pid(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UID]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_uid(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_GID]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_gid(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_WCHAR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_wchar(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_WINT]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_wint(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])


m4_dnl let's go

m4_dnl end of file
m4_dnl Local Variables:
m4_dnl mode: m4
m4_dnl End:
m4_divert(0)m4_dnl
