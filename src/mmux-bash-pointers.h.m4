/*
  Part of: MMUX Bash Pointers
  Contents: public header file
  Date: Sep  9, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

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

#ifndef MMUX_BASH_POINTERS_H
#define MMUX_BASH_POINTERS_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

/* The  macro  MMUX_BASH_POINTERS_UNUSED  indicates   that  a  function,  function
   argument or variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_BASH_POINTERS_UNUSED;
   int foo (char unused_argument MMUX_BASH_POINTERS_UNUSED);
   int unused_variable MMUX_BASH_POINTERS_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_BASH_POINTERS_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_BASH_POINTERS_UNUSED		/* empty */
#endif

#ifndef __GNUC__
#  define __attribute__(...)	/* empty */
#endif

#ifndef __GNUC__
#  define __builtin_expect(...)	/* empty */
#endif

#if defined _WIN32 || defined __CYGWIN__
#  ifdef BUILDING_DLL
#    ifdef __GNUC__
#      define mmux_bash_pointers_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_bash_pointers_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_bash_pointers_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_bash_pointers_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_bash_pointers_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_bash_pointers_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_bash_pointers_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_bash_pointers_decl		extern
#    define mmux_bash_pointers_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-bash-pointers-config.h>
#include <stdbool.h>
#include <stddef.h>


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl char const *	mmux_bash_pointers_version_string		(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_current	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_revision	(void);
mmux_bash_pointers_decl int		mmux_bash_pointers_version_interface_age	(void);


/** --------------------------------------------------------------------
 ** Type definitions.
 ** ----------------------------------------------------------------- */

typedef enum {
  MMUX_SUCCESS=MMUX_BASH_EXECUTION_SUCCESS,
  MMUX_FAILURE=MMUX_BASH_EXECUTION_FAILURE
} mmux_bash_rv_t;

#include <mmux-cc-types.h>


/** --------------------------------------------------------------------
 ** Type functions prototypes.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - type stem
m4_define([[[DEFINE_PROTOS]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
mmux_bash_pointers_decl mmux_bash_rv_t mmux_$1_bind_to_bash_variable (char const * variable_name, mmux_$1_t value, char const * who);
]]])]]])

DEFINE_PROTOS([[[pointer]]])
DEFINE_PROTOS([[[schar]]])
DEFINE_PROTOS([[[uchar]]])
DEFINE_PROTOS([[[sshort]]])
DEFINE_PROTOS([[[ushort]]])
DEFINE_PROTOS([[[sint]]])
DEFINE_PROTOS([[[uint]]])
DEFINE_PROTOS([[[slong]]])
DEFINE_PROTOS([[[ulong]]])
DEFINE_PROTOS([[[sllong]]],		[[[MMUX_HAVE_CC_TYPE_SLLONG]]])
DEFINE_PROTOS([[[ullong]]],		[[[MMUX_HAVE_CC_TYPE_ULLONG]]])

DEFINE_PROTOS([[[float]]])
DEFINE_PROTOS([[[double]]])
DEFINE_PROTOS([[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_PROTOS([[[float32]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32]]])
DEFINE_PROTOS([[[float64]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64]]])
DEFINE_PROTOS([[[float128]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128]]])

DEFINE_PROTOS([[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT32X]]])
DEFINE_PROTOS([[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT64X]]])
DEFINE_PROTOS([[[float128x]]],		[[[MMUX_HAVE_CC_TYPE_FLOAT128X]]])

DEFINE_PROTOS([[[decimal32]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL32]]])
DEFINE_PROTOS([[[decimal64]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_PROTOS([[[decimal128]]],		[[[MMUX_HAVE_CC_TYPE_DECIMAL128]]])

DEFINE_PROTOS([[[complexf]]])
DEFINE_PROTOS([[[complexd]]])
DEFINE_PROTOS([[[complexld]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_PROTOS([[[complexf32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_PROTOS([[[complexf64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_PROTOS([[[complexf128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_PROTOS([[[complexf32x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_PROTOS([[[complexf64x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_PROTOS([[[complexf128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_PROTOS([[[complexd32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_PROTOS([[[complexd64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_PROTOS([[[complexd128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

DEFINE_PROTOS([[[sint8]]])
DEFINE_PROTOS([[[uint8]]])
DEFINE_PROTOS([[[sint16]]])
DEFINE_PROTOS([[[uint16]]])
DEFINE_PROTOS([[[sint32]]])
DEFINE_PROTOS([[[uint32]]])
DEFINE_PROTOS([[[sint64]]])
DEFINE_PROTOS([[[uint64]]])

DEFINE_PROTOS([[[ssize]]])
DEFINE_PROTOS([[[usize]]])
DEFINE_PROTOS([[[sintmax]]])
DEFINE_PROTOS([[[uintmax]]])
DEFINE_PROTOS([[[sintptr]]])
DEFINE_PROTOS([[[uintptr]]])
DEFINE_PROTOS([[[mode]]])
DEFINE_PROTOS([[[off]]])
DEFINE_PROTOS([[[pid]]])
DEFINE_PROTOS([[[uid]]])
DEFINE_PROTOS([[[gid]]])
DEFINE_PROTOS([[[ptrdiff]]])
DEFINE_PROTOS([[[wchar]]])
DEFINE_PROTOS([[[wint]]])
DEFINE_PROTOS([[[time]]])
DEFINE_PROTOS([[[socklen]]])


/** --------------------------------------------------------------------
 ** GNU Bash interface: word list.
 ** ----------------------------------------------------------------- */

/* This is meatn to be an alias for Bash's "WORD_LIST". */
typedef void *		mmux_bash_word_list_t;



/** --------------------------------------------------------------------
 ** GNU Bash interface: loadable builtins.
 ** ----------------------------------------------------------------- */

typedef bool mmux_bash_builtin_validate_argc_t (int argc);
typedef mmux_bash_rv_t mmux_bash_builtin_implementation_function_t        (mmux_bash_word_list_t word_list);
typedef mmux_bash_rv_t mmux_bash_builtin_custom_implementation_function_t (int argc, char const * const argv[]);

/* This definition  must match the  definition of  "struct builtin" in  Bash's header
   file "builtins.h". */
struct mmux_bash_struct_builtin_tag_t {
  char *					name;		/* The name that the user types. */
  mmux_bash_builtin_implementation_function_t *	function;	/* The address of the invoked function. */
  int						flags;		/* One of the #defines above. */
  char * const *				long_doc;	/* NULL terminated array of strings. */
  char const *					short_doc;	/* Short version of documentation. */
  char *					reserved0;	/* Reserved for Bash. */
};

typedef struct mmux_bash_struct_builtin_tag_t	mmux_bash_struct_builtin_t;

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_builtin_implementation_function
  (mmux_bash_word_list_t word_list,
   mmux_bash_builtin_validate_argc_t * validate_argc,
   mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
  __attribute__((__nonnull__(1,2,3)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_builtin_implementation_function_no_options
  (mmux_bash_word_list_t word_list,
   mmux_bash_builtin_validate_argc_t * validate_argc,
   mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
  __attribute__((__nonnull__(1,2,3)));

mmux_bash_pointers_decl int mmux_bash_builtin_wrong_num_of_args (void);


/** --------------------------------------------------------------------
 ** GNU Bash interface: scalar variables.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl mmux_bash_rv_t mmux_string_bind_to_bash_variable
  (char const * variable_name, char const * s_value, char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_string_bind_to_bash_global_variable
  (char const * v, char const * s_value, char const * caller_name)
  __attribute__((__nonnull__(1,2)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_store_string_in_variable (char const * variable_name, char const * s_value,
									   char const * who)
  __attribute__((__nonnull__(1,2),
		 __deprecated__("use the newest mmux_string_bind_to_bash_variable")));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_store_string_in_global_variable (char const * variable_name, char const * s_value,
										  char const * who)
  __attribute__((__nonnull__(1,2),
		 __deprecated__("use the newest mmux_string_bind_to_bash_global_variable")));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_create_global_string_variable (char const * variable_name, char const * s_value,
										char const * who)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_create_global_sint_variable   (char const * variable_name, int value, char const * who)
  __attribute__((__nonnull__(1)));

/* ------------------------------------------------------------------ */

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_get_shell_variable_string_value (char const ** p_variable_value, char const * variable_name,
										  char const * who)
  __attribute__((__nonnull__(1,2)));


/** --------------------------------------------------------------------
 ** GNU Bash interface: index array variables.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_bash_index_array_variable_t;
typedef mmux_sintmax_t		mmux_bash_index_array_key_t;

mmux_bash_pointers_decl bool mmux_bash_index_array_mutable_p (mmux_bash_index_array_variable_t index_array_variable)
  __attribute__((__nonnull__(1)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_index_array_find_or_make_mutable (mmux_bash_index_array_variable_t * index_array_variable_p,
										   char const * index_array_name,
										   char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_index_array_find_existent (mmux_bash_index_array_variable_t * index_array_variable_p,
									    char const * index_array_name,
									    char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_index_array_bind (mmux_bash_index_array_variable_t index_array_variable,
								   mmux_bash_index_array_key_t index_array_key,
								   char const * index_array_value,
								   char const * caller_name)
  __attribute__((__nonnull__(1,3)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_index_array_ref (mmux_bash_index_array_variable_t index_array_variable,
								  mmux_bash_index_array_key_t index_array_key,
								  char const ** index_array_value_p,
								  char const * caller_name)
  __attribute__((__nonnull__(1,3)));


/** --------------------------------------------------------------------
 ** GNU Bash interface: associative array variables.
 ** ----------------------------------------------------------------- */

typedef void *			mmux_bash_assoc_array_variable_t;
typedef char const *		mmux_bash_assoc_array_key_t;

mmux_bash_pointers_decl bool mmux_bash_assoc_array_mutable_p (mmux_bash_assoc_array_variable_t assoc_array_variable)
  __attribute__((__nonnull__(1)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_assoc_array_find_or_make_mutable (mmux_bash_assoc_array_variable_t * assoc_array_variable_p,
										   char const * assoc_array_name,
										   char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_assoc_array_find_existent (mmux_bash_assoc_array_variable_t * assoc_array_variable_p,
									    char const * assoc_array_name,
									    char const * caller_name)
  __attribute__((__nonnull__(1,2)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_assoc_array_bind (mmux_bash_assoc_array_variable_t assoc_array_variable,
								   mmux_bash_assoc_array_key_t assoc_array_key,
								   char const * assoc_array_value,
								   char const * caller_name)
  __attribute__((__nonnull__(1,2,3)));

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_assoc_array_ref (mmux_bash_assoc_array_variable_t assoc_array_variable,
								  mmux_bash_assoc_array_key_t assoc_array_key,
								  char const ** assoc_array_value_p,
								  char const * caller_name)
  __attribute__((__nonnull__(1,2,3)));


/** --------------------------------------------------------------------
 ** Error handling functions.
 ** ----------------------------------------------------------------- */

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_pointers_set_ERRNO (int errnum, char const * who);
mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_pointers_consume_errno (char const * who);

mmux_bash_pointers_decl mmux_bash_rv_t mmux_bash_pointers_error_parsing_argument_at_index \
    (char const * stemstr, char const * argstr, mmux_uint_t argidx, char const * caller_name)
  __attribute__((__nonnull__(1,2,4)));


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_POINTERS_H */

/* end of file */
