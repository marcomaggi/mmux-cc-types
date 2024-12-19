/*
  Part of: MMUX Bash Pointers
  Contents: GNU Bash API
  Date: Sep 25, 2024

  Abstract

	As much as possible: everything Bash  should go here.  Ideally: Bash's header
	files should be inluded only here.

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

/* We  really need  to pay  attention to  the order  in which  we include  the files,
   otherwise errors will ensue. */
#ifdef HAVE_BASHTYPES_H
#  include "bashtypes.h"
#endif
#ifdef HAVE_BASHJMP_H
#  include "bashjmp.h"
#endif
#ifdef HAVE_BUILTINS_H
#  include "builtins.h"
#endif
#ifdef HAVE_SHELL_H
#  include "shell.h"
#endif
#ifdef HAVE_COMMON_H
#  include "common.h"
#endif


/** --------------------------------------------------------------------
 ** Shell builtins interface.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_builtin_implementation_function (mmux_bash_word_list_t word_list,
					   mmux_bash_builtin_validate_argc_t * validate_argc,
                                           mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
{
  WORD_LIST *	list = (WORD_LIST *) word_list;
  char **	argv;
  int		argc;
  int		rv;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    if (validate_argc(argc)) {
      rv = custom_implementation_function(argc, (char const * const *) argv);
    } else {
      builtin_usage();
      rv = MMUX_BASH_EX_USAGE;
    }
    free(argv);
  } else {
    fprintf(stderr, "MMUX Bash Pointers: error: internal error accessing list of builtin operands\n");
    rv = MMUX_BASH_EXECUTION_FAILURE;
  }
  return rv;
}
mmux_bash_rv_t
mmux_bash_builtin_implementation_function_no_options (mmux_bash_word_list_t word_list,
						      mmux_bash_builtin_validate_argc_t * validate_argc,
						      mmux_bash_builtin_custom_implementation_function_t * custom_implementation_function)
{
  WORD_LIST *	list = (WORD_LIST *) word_list;

  if (no_options(list)) {
    return (MMUX_BASH_EX_USAGE);
  } else {
    char **	argv;
    int		argc;
    int		rv;

    argv = make_builtin_argv(list, &argc);
    if (argv) {
      if (validate_argc(argc)) {
	rv = custom_implementation_function(argc, (char const * const *) argv);
      } else {
	builtin_usage();
	rv = MMUX_BASH_EX_USAGE;
      }
      free(argv);
    } else {
      fprintf(stderr, "MMUX Bash Pointers: error: internal error accessing list of builtin operands\n");
      rv = MMUX_BASH_EXECUTION_FAILURE;
    }
    return rv;
  }
}

int
mmux_bash_builtin_wrong_num_of_args (void)
{
  builtin_usage();
  return MMUX_BASH_EX_USAGE;
}


/** --------------------------------------------------------------------
 ** Binding string values to shell variables.
 ** ----------------------------------------------------------------- */

static mmux_bash_rv_t
string_bind_to_bash_variable (char const * variable_name, char const * const s_value, char const * const caller_name, bool global_variable)
{
  SHELL_VAR *	shell_variable MMUX_BASH_POINTERS_UNUSED;
  int		flags = 0;

  if (global_variable) {
    shell_variable = bind_global_variable(variable_name, (char *)s_value, flags);
  } else {
    shell_variable = builtin_bind_variable((char *)variable_name, (char *)s_value, flags);
  }

  if (shell_variable) {
    return MMUX_BASH_EXECUTION_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: failed binding value to %s shell variable: \"%s\"=\"%s\"\n",
	      caller_name, ((global_variable)? " global" : ""), variable_name, s_value);
    }
    return MMUX_BASH_EXECUTION_FAILURE;
  }
}
mmux_bash_rv_t
mmux_string_bind_to_bash_variable (char const * variable_name, char const * const s_value, char const * const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, false);
}
mmux_bash_rv_t
mmux_string_bind_to_bash_global_variable (char const * variable_name, char const * const s_value, char const * const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, true);
}
mmux_bash_rv_t
mmux_asciizcp_bind_to_bash_variable (mmux_asciizcp_t variable_name, mmux_asciizcp_t const s_value, mmux_asciizcp_t const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, false);
}
mmux_bash_rv_t
mmux_asciizcp_bind_to_bash_global_variable (mmux_asciizcp_t variable_name, mmux_asciizcp_t const s_value, mmux_asciizcp_t const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, true);
}

/* ------------------------------------------------------------------ */

mmux_bash_rv_t
mmux_bash_store_string_in_variable (char const * variable_name, char const * const s_value, char const * const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, false);
}
mmux_bash_rv_t
mmux_bash_store_string_in_global_variable (char const * variable_name, char const * const s_value, char const * const caller_name)
{
  return string_bind_to_bash_variable(variable_name, s_value, caller_name, true);
}


/** --------------------------------------------------------------------
 ** Creating global string and sint variables.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_create_global_string_variable (char const * const variable_name, char const * const s_value, char const * const caller_name)
{
  SHELL_VAR	* shell_variable = find_global_variable(variable_name);

  if (NULL == shell_variable) {
    return mmux_string_bind_to_bash_variable(variable_name, s_value, caller_name);
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: failed creation of global variable, it already exists: \"%s\"\n", caller_name, variable_name);
    }
    return MMUX_BASH_EXECUTION_FAILURE;
  }
}
mmux_bash_rv_t
mmux_bash_create_global_sint_variable (char const * const variable_name, int value, char const * const caller_name)
{
  int	required_nbytes;

  /* Compute the number of required characters, INCLUDING the terminating zero. */
  {
    /* According to  the documentation,  when the  output is  truncated: "snprintf()"
       returns the number of required bytes, EXCLUDING the terminating null byte. */
    required_nbytes = snprintf(NULL, 0, "%d", value);
    if (0 > required_nbytes) {
      return MMUX_BASH_EXECUTION_FAILURE;
    }
    ++required_nbytes;
  }

  /* Convert the value to string then store it. */
  {
    char	s_value[required_nbytes];
    int		to_be_written_chars;

    /* According  to  the documentation:  "snprintf()"  writes  the terminating  null
       byte. */
    to_be_written_chars = snprintf(s_value, required_nbytes, "%d", value);
    if (required_nbytes == (1+to_be_written_chars)) {
      return mmux_bash_create_global_string_variable(variable_name, s_value, caller_name);
    } else {
      if (caller_name) {
	fprintf(stderr, "%s: failed creation of global sint variable, conversion error: \"%s\"=\"%d\"\n",
		caller_name, variable_name, value);
      }
      return MMUX_BASH_EXECUTION_FAILURE;
    }
  }
}


/** --------------------------------------------------------------------
 ** Retrieving values from shell variables.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_get_shell_variable_string_value (char const ** p_variable_value, char const * const variable_name,
					   char const * const caller_name)
{
  SHELL_VAR *		shell_variable;

  shell_variable = find_variable(variable_name);
  if (shell_variable && var_isset(shell_variable)) {
    *p_variable_value = value_cell(shell_variable);
    return MMUX_BASH_EXECUTION_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: failed access to shell variable: \"%s\"\n", caller_name, variable_name);
    }
    return MMUX_BASH_EXECUTION_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Operating on Bash index arrays.
 ** ----------------------------------------------------------------- */

bool
mmux_bash_index_array_mutable_p (mmux_bash_index_array_variable_t index_array_variable)
{
  SHELL_VAR *	var = (SHELL_VAR *) index_array_variable;

  if ((! readonly_p(var)) && (! noassign_p(var))) {
    return true;
  } else {
    return false;
  }
}
mmux_bash_rv_t
mmux_bash_index_array_find_existent (mmux_bash_index_array_variable_t * index_array_variable_p,
				     char const * index_array_name,
				     char const * caller_name)
{
  SHELL_VAR *		shell_variable;

  shell_variable = find_variable(index_array_name);
  if (shell_variable && var_isset(shell_variable) && array_p(shell_variable)) {
    *index_array_variable_p = shell_variable;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: could not find existent index array: \"%s\"\n", caller_name, index_array_name);
    }
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_bash_index_array_find_or_make_mutable (mmux_bash_index_array_variable_t * index_array_variable_p,
					    char const * index_array_name,
					    char const * const caller_name)
{
  mmux_bash_index_array_variable_t	index_array_variable;
  /* By setting flags so that:
   *
   * (1 & flags) == true)
   *
   * we request a validation  for the array as not being  read-only or no-assign.  If
   * the array already exists  and it is read-only or no-assign:  the return value of
   * "find_or_make_array_variable()" is NULL.
   */
  int					flags = 1;

  index_array_variable = find_or_make_array_variable((char *)index_array_name, flags);
  if (index_array_variable) {
    *index_array_variable_p = index_array_variable;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: failed access to shell array variable: \"%s\"\n", caller_name, index_array_name);
    }
    return MMUX_BASH_EXECUTION_FAILURE;
  }
}
mmux_bash_rv_t
mmux_bash_index_array_bind (mmux_bash_index_array_variable_t index_array_variable,
			    mmux_bash_index_array_key_t index_array_key,
			    char const * const index_array_value,
			    char const * const caller_name)
{
  SHELL_VAR *	v;
  mmux_sint_t	flags = 0;

  v = bind_array_element(index_array_variable, index_array_key, (char *)index_array_value, flags);
  if (NULL == v) {
    if (caller_name) {
      fprintf(stderr, "%s: error: failure while binding index array element\n", caller_name);
    }
    return MMUX_FAILURE;
  }
  return MMUX_SUCCESS;
}
mmux_bash_rv_t
mmux_bash_index_array_ref (mmux_bash_index_array_variable_t index_array_variable,
			   mmux_bash_index_array_key_t index_array_key,
			   char const ** index_array_value_p,
			   char const * const caller_name)
/* The  argument  "index_array_variable"  must   reference  an  existent  indexiative
   array. */
{
  SHELL_VAR *	var               = (SHELL_VAR *) index_array_variable;
  char const *	index_array_value = array_reference(array_cell(var), index_array_key);

  if (index_array_value) {
    *index_array_value_p = index_array_value;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: missing requested key '%jd' from index array: '%s'\n", caller_name, index_array_key, var->name);
    }
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Operating on Bash associative arrays.
 ** ----------------------------------------------------------------- */

bool
mmux_bash_assoc_array_mutable_p (mmux_bash_assoc_array_variable_t assoc_array_variable)
{
  SHELL_VAR *	var = (SHELL_VAR *) assoc_array_variable;

  if ((! readonly_p(var)) && (! noassign_p(var))) {
    return true;
  } else {
    return false;
  }
}
mmux_bash_rv_t
mmux_bash_assoc_array_find_existent (mmux_bash_assoc_array_variable_t * assoc_array_variable_p,
				     char const * assoc_array_name,
				     char const * caller_name)
{
  SHELL_VAR *		shell_variable;

  shell_variable = find_variable(assoc_array_name);
  if (shell_variable && var_isset(shell_variable) && assoc_p(shell_variable)) {
    *assoc_array_variable_p = shell_variable;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: could not find existent assoc array: \"%s\"\n", caller_name, assoc_array_name);
    }
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_bash_assoc_array_find_or_make_mutable (mmux_bash_assoc_array_variable_t * assoc_array_variable_p,
					    char const * assoc_array_name,
					    char const * const caller_name)
{
  mmux_bash_assoc_array_variable_t	assoc_array_variable;
  /* By setting flags so that:
   *
   *	(1 & flags) == true)
   *
   * we request a validation  for the array as not being  read-only or no-assign.  If
   * the array already exists  and it is read-only or no-assign:  the return value of
   * "find_or_make_array_variable()" is NULL.
   *
   * By setting flags so that:
   *
   *	(2 & flags) == true)
   *
   * we request finding or making an associative array.
   */
  int					flags = (1 | 2);

  assoc_array_variable = find_or_make_array_variable((char *)assoc_array_name, flags);
  if (assoc_array_variable) {
    *assoc_array_variable_p = assoc_array_variable;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: failed access to shell array variable: \"%s\"\n", caller_name, assoc_array_name);
    }
    return MMUX_BASH_EXECUTION_FAILURE;
  }
}

mmux_bash_rv_t
mmux_bash_assoc_array_bind (mmux_bash_assoc_array_variable_t assoc_array_variable,
			    mmux_bash_assoc_array_key_t assoc_array_key,
			    char const * const assoc_array_value,
			    char const * const caller_name)
{
  SHELL_VAR *	var = (SHELL_VAR *) assoc_array_variable;
  SHELL_VAR *	rv;
  mmux_sint_t	flags = 0;
  char *	internal_assoc_array_key;

  /* NOTE For some reason  Bash requires the key to be duplicated  by us, rather than
     being internalised  by Bash  itself.  Apparently the  value string,  instead, is
     internalised by Bash.  (Marco Maggi; Nov 20, 2024) */
  {
    mmux_ssize_t	len = 1+strlen(assoc_array_key);

    internal_assoc_array_key = malloc(len);
    if (NULL ==internal_assoc_array_key) {
      mmux_bash_pointers_consume_errno(caller_name);
      return MMUX_FAILURE;
    }
    memcpy(internal_assoc_array_key, assoc_array_key, len);
  }

  /* The function  "bind_assoc_variable()" requires  the name  of the  shell variable
     itself  as second  argument;  as of  GNU  Bash 5.2  it is  used  only for  error
     reporting. */
  rv = bind_assoc_variable(assoc_array_variable, var->name, (char *)internal_assoc_array_key, (char *)assoc_array_value, flags);
  if (NULL == rv) {
    if (caller_name) {
      fprintf(stderr, "%s: error: failure while binding assoc array element\n", caller_name);
    }
    return MMUX_FAILURE;
  }
  return MMUX_SUCCESS;
}

mmux_bash_rv_t
mmux_bash_assoc_array_ref (mmux_bash_assoc_array_variable_t assoc_array_variable,
			   mmux_bash_assoc_array_key_t assoc_array_key,
			   char const ** assoc_array_value_p,
			   char const * const caller_name)
/* The  argument  "assoc_array_variable"  must   reference  an  existent  associative
   array. */
{
  SHELL_VAR *	var               = (SHELL_VAR *) assoc_array_variable;
  char const *	assoc_array_value = assoc_reference(assoc_cell(var), (char *)assoc_array_key);

  if (assoc_array_value) {
    *assoc_array_value_p = assoc_array_value;
    return MMUX_SUCCESS;
  } else {
    if (caller_name) {
      fprintf(stderr, "%s: error: missing requested key '%s' from associative array: '%s'\n", caller_name, assoc_array_key, var->name);
    }
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Handlers of builtin argument parser errors.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_error_parsing_argument_at_index (char const * const stemstr, char const * const argstr,
						    mmux_uint_t argidx, char const * const caller_name)
{
  fprintf(stderr, "%s: error parsing argument: expected \"%s\" value at index %d, got: \"%s\"\n",
	  caller_name, stemstr, argidx, argstr);
  mmux_bash_pointers_set_ERRNO(EINVAL, caller_name);
  return MMUX_FAILURE;
}

/* end of file */
