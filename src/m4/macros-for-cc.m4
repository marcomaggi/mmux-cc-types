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
m4_dnl This program is free  software: you can redistribute it and/or  modify it under the
m4_dnl terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
m4_dnl Foundation, either version 3 of the License, or (at your option) any later version.
m4_dnl
m4_dnl This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
m4_dnl WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
m4_dnl PARTICULAR PURPOSE.  See the GNU General Public License for more details.
m4_dnl
m4_dnl You should have received  a copy of the GNU General Public  License along with this
m4_dnl program.  If not, see <http://www.gnu.org/licenses/>.
m4_dnl


m4_dnl preamble

m4_changequote(`[[[', `]]]')
m4_changecom([[[/*]]],[[[*/]]])


m4_dnl helpers

m4_dnl Convert its only parameter to upper case.
m4_define([[[MMUX_M4_TOUPPER]]],[[[m4_translit([[[$1]]],[[[abcdefghijklmnopqrstuvwxyz]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]])]]])

m4_dnl Convert its only parameter to lower case.
m4_define([[[MMUX_M4_TOLOWER]]],[[[m4_translit([[[$1]]],[[[ABCDEFGHIJKLMNOPQRSTUVWXYZ]]],[[[abcdefghijklmnopqrstuvwxyz]]])]]])


m4_dnl function definitions

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression, between parentheses, about "argc": if true the number of argumets is correct
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_FUNCTION_NO_OPTIONS]]],[[[m4_dnl
static bool
[[[]]]$1[[[]]]_validate_argc (int argc)
{
  return ($2)? true : false;
}
static mmux_bash_rv_t
[[[]]]$1[[[]]]_builtin (mmux_bash_word_list_t word_list)
{
  return (int)mmux_bash_builtin_implementation_function_no_options(word_list, [[[]]]$1[[[]]]_validate_argc, [[[]]]$1[[[]]]_main);
}
]]])

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression, between parentheses, about "argc": if true the number of argumets is correct
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_FUNCTION]]],[[[m4_dnl
static bool
[[[]]]$1[[[]]]_validate_argc (int argc)
{
  return ($2)? true : false;
}
static mmux_bash_rv_t
[[[]]]$1[[[]]]_builtin (mmux_bash_word_list_t word_list)
{
  return (int) mmux_bash_builtin_implementation_function(word_list, [[[]]]$1[[[]]]_validate_argc, [[[]]]$1[[[]]]_main);
}
]]])

m4_dnl $1 - builtin and implementation-function name
m4_define([[[MMUX_BASH_BUILTIN_MAIN]]],[[[static mmux_bash_rv_t
[[[]]]$1[[[]]]_main (int argc MMUX_BASH_POINTERS_UNUSED, char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BASH_BUILTIN_STRING_NAME
#define MMUX_BASH_BUILTIN_STRING_NAME	"$1"
m4_define([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],[[[$1]]])m4_dnl
]]])


m4_dnl data structures

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing the short documentation
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_STRUCT]]],[[[m4_dnl
/* Bash will search for this struct  building the name "[[[]]]$1[[[]]]_struct" from the command
   line argument "[[[]]]$1[[[]]]" we have given to the "enable" builtin. */
mmux_bash_struct_builtin_t [[[]]]$1[[[]]]_struct = {
  .name		= "[[[]]]$1[[[]]]",		/* Builtin name */
  .function	= [[[]]]$1[[[]]]_builtin,	/* Function implementing the builtin */
  .flags	= MMUX_BASH_BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= [[[]]]$1[[[]]]_doc,		/* Array of long documentation strings. */
  .short_doc	= $2,				/* Usage synopsis; becomes short_doc */
  .reserved0	= NULL				/* Reserved for Bash. */
};
]]])

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing a single-line long documentation
m4_define([[[MMUX_BASH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE]]],[[[m4_dnl
/* A NULL-terminated array of ASCIIZ strings representing the lines of the
   builtin long documentation. */
static char * [[[]]]$1[[[]]]_doc[] = {
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
MMUX_BASH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE([[[$1]]],[[[m4_ifelse([[[$4]]],,[[["A builtin that does something"]]],[[[$4]]])]]])
MMUX_BASH_DEFINE_BUILTIN_STRUCT([[[$1]]],[[[$3]]])
]]])

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


m4_dnl helpers

m4_dnl $1 - Preprocessor symbol: if defined to 1, include the body of code; otherwise include the alternative body.
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

m4_dnl $1 - mmux-cc-libc function call
m4_define([[[MMUX_LIBC_FUNCALL]]],[[[if ($1) {
  mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
}]]])


#### parsing arguments

# Put this at the end of a function that uses the parser macros.
#
# static int
# my_builtin_main (int argc, char const * char argv[])
# {
#   void *	arg;
#
#   MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR([[[arg]]], [[[argv[1]]]]);
#   ...
#   return MMUX_SUCCESS;
#   MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
# }
#
m4_define([[[MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH]]],[[[
 mmux_error_parsing_builtin_argument:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])

# --------------------------------------------------------------------

# $1 - type stem
# $2 - name of the target variable
# $3 - expression evaluating to the string to parse, it is usually "argv[2]" to parse the arg at index 2
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM]]],[[[{
  bool mmux_retval = mmux_$1_parse(&($2), $3, MMUX_BASH_BUILTIN_STRING_NAME);
  if (true == mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - type stem
# $2 - name of the target variable
# $3 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM]]],[[[{
  bool mmux_retval = mmux_$1_parse(&($2), argv[$3], NULL);
  if (true == mmux_retval) { return mmux_bash_pointers_error_parsing_argument_at_index("$1", argv[$3], $3, MMUX_BASH_BUILTIN_STRING_NAME); }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM]]],[[[{ $1 = $2; }]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM]]],[[[{ $1 = argv[$2]; }]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_POINTER]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[pointer]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[pointer]]],[[[$1]]],[[[$2]]])]]])

m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]],[[[{
  mmux_pointer_t  the_pointer;
  bool            mmux_retval = mmux_pointer_parse(&the_pointer, argv[$2], NULL);
  if (false == mmux_retval) {
    $1 = the_pointer;
  } else {
    return mmux_bash_pointers_error_parsing_argument_at_index("pointer", argv[$2], $2, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[schar]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[schar]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uchar]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uchar]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SSHORT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sshort]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sshort]]],[[[$1]]],[[[$2]]])]]])


# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_USHORT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ushort]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_USHORT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ushort]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sint]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uint]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uint]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable, a value of type "mmux_libc_file_descriptor_t".
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FD]]],[[[{
MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint]]],[[[$1.value]]],[[[$2]]])
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[slong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[slong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ulong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_ULONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ulong]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SLLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sllong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SLLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sllong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_ULLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ullong]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_ULLONG]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ullong]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT8]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sint8]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT8]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint8]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT8]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uint8]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT8]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uint8]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT16]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sint16]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT16]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint16]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT16]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uint16]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT16]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uint16]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sint32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uint32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uint32]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sint64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sint64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uint64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uint64]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[double]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_DOUBLE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[double]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ldouble]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_LDOUBLE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ldouble]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float32]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float64]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float128]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float128]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT32X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float32x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT32X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float32x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT64X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float64x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT64X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float64x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[float128x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_FLOAT128X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[float128x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[decimal32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_DECIMAL32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[decimal32]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[decimal64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_DECIMAL64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[decimal64]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[decimal128]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_DECIMAL128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[decimal128]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexd]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXD]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexd]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXLD]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexld]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXLD]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexld]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf32]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf64]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf128]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf128]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF32X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf32x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF32X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf32x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF64X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf64x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF64X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf64x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXF128X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexf128x]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXF128X]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexf128x]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexd32]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXD32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexd32]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexd64]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXD64]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexd64]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_COMPLEXD128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[complexd128]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_COMPLEXD128]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[complexd128]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MODE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[mode]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_MODE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[mode]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SSIZE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ssize]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSIZE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ssize]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_USIZE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[usize]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[usize]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sintmax]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sintmax]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uintmax]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uintmax]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTPTR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[sintptr]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINTPTR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[sintptr]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTPTR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uintptr]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINTPTR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uintptr]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_PTRDIFF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[ptrdiff]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_PTRDIFF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[ptrdiff]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_OFF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[off]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_OFF]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[off]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_PID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[pid]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_PID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[pid]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_UID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[uid]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[uid]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_GID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[gid]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_GID]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[gid]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_WCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[wchar]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_WCHAR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[wchar]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_WINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[wint]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_WINT]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[wint]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_TIME]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[time]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TIME]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[time]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[socklen]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[socklen]]],[[[$1]]],[[[$2]]])]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_RLIM]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_STEM([[[rlim]]],[[[$1]]],[[[$2]]])]]])

# $1 - name of the target variable
# $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_RLIM]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_STEM([[[rlim]]],[[[$1]]],[[[$2]]])]]])


m4_dnl let's go

m4_dnl end of file
m4_dnl Local Variables:
m4_dnl mode: m4
m4_dnl End:
m4_divert(0)m4_dnl
