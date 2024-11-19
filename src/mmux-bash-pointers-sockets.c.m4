/*
  Part of: MMUX Bash Pointers
  Contents: implementation of sockets builtins
  Date: Nov 18, 2024

  Abstract

	This module implements sockets builtins.

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
 ** Sockets: struct sockaddr.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_sa_family_ref]]])
{
  char const *		sa_family_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sa_family_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,		argv[2]);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;

    return mmux_sshort_bind_to_bash_variable(sa_family_varname, sockaddr_pointer->sa_family, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SA_FAMILY_VAR SOCKADDR_POINTER"]]])



/** --------------------------------------------------------------------
 ** Sockets: struct sockaddr_un.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_un_malloc]]])
{
  char const *		sockaddr_un_pointer_varname;
  char const *		sockaddr_un_length_varname;
  mmux_sint_t		family;
  char const *		pathname;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sockaddr_un_pointer_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sockaddr_un_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(family,				argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(pathname,			argv[4]);
  {
    struct sockaddr_un	name;

    /* This chunk comes from the documentation of GLIBC. */
    {
      name.sun_family = family;
      strncpy(name.sun_path, pathname, sizeof(name.sun_path));
      name.sun_path[sizeof(name.sun_path) - 1] = '\0';
    }
    {
      /* NOTE: It  appears that "SUN_LEN()" does  not include the terminating  nul of
	 "sun_path" in its computation;  at least this is what I  observe.  So we add
	 it to the memory  block to be able to extract the path  as an ASCIIZ string.
	 The reported length is still the value computed by "SUN_LEN()", because that
	 is what  is needed  to pass  when calling "bind()".   (Marco Maggi;  Nov 18,
	 2024) */
      size_t			addr_len = SUN_LEN(&name);
      struct sockaddr_un *	addr_ptr = calloc(1, 1+addr_len);

      memcpy(addr_ptr, &name, 1+addr_len);
      {
	mmux_bash_rv_t	rv;

	rv = mmux_pointer_bind_to_bash_variable(sockaddr_un_pointer_varname, addr_ptr, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != rv) { goto error_binding_variables; }

	rv = mmux_usize_bind_to_bash_variable(sockaddr_un_length_varname, addr_len, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != rv) { goto error_binding_variables; }

	return rv;

      error_binding_variables:
	free(addr_ptr);
	return rv;
      }
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_UN_POINTER_VAR SOCKADDR_UN_LENGTH_VAR SUN_FAMILY SUN_PATH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_un_sun_family_ref]]])
{
  char const *		sun_family_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sun_family_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct sockaddr_un *	sockaddr_un_pointer = pointer;

    return mmux_sshort_bind_to_bash_variable(sun_family_varname, sockaddr_un_pointer->sun_family, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SUN_FAMILY_VAR SOCKADDR_UN_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_un_sun_path_ref]]])
{
  char const *		sun_path_varname;
  mmux_pointer_t	pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sun_path_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(pointer,			argv[2]);
  {
    struct sockaddr_un *	sockaddr_un_pointer = pointer;

    return mmux_string_bind_to_bash_variable(sun_path_varname, sockaddr_un_pointer->sun_path, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SUN_PATH_VAR SOCKADDR_UN_POINTER"]]])


/** --------------------------------------------------------------------
 ** Sockets: addresses.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_bind]]])
{
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_sint_t		addr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(addr_length,		argv[3]);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    int			rv               = bind(sock, sockaddr_pointer, addr_length);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getsockname]]])
{
  mmux_sint_t		sock;
  char const *		addr_pointer_var;
  char const *		addr_length_var;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(addr_pointer_var,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(addr_length_var,	argv[3]);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK		1024
    socklen_t		addr_length = IS_THIS_ENOUGH_QUESTION_MARK;
    uint8_t		buffer[addr_length];
    struct sockaddr *	addr = (struct sockaddr *)buffer;
    int			rv   = getsockname(sock, addr, &addr_length);


    if (0 == rv) {
      struct sockaddr *	sockaddr_pointer = malloc(addr_length);

      if (NULL == sockaddr_pointer) {
	mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
	return MMUX_FAILURE;
      } else {
	mmux_bash_rv_t	brv;

	memcpy(sockaddr_pointer, addr, addr_length);
	{
	  brv = mmux_pointer_bind_to_bash_variable(addr_pointer_var, sockaddr_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
	  if (MMUX_SUCCESS != brv) {
	    free(sockaddr_pointer);
	    return brv;
	  }
	}
	{
	  brv = mmux_sintmax_bind_to_bash_variable(addr_length_var, addr_length, MMUX_BASH_BUILTIN_STRING_NAME);
	  if (MMUX_SUCCESS != brv) {
	    free(sockaddr_pointer);
	    return brv;
	  }
	}
	return MMUX_SUCCESS;
      }
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD SOCKADDR_POINTER SOCKADDR_LENGTH_VAR"]]])


/** --------------------------------------------------------------------
 ** Sockets: interface naming.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_if_nametoindex]]])
{
  char const *		ifindex_varname;
  char const *		ifname;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ifindex_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ifname,			argv[2]);
  {
    int		rv = if_nametoindex(ifname);

    if (0 == rv) {
      return MMUX_FAILURE;
    } else {
      return mmux_uint_bind_to_bash_variable(ifindex_varname, rv, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IFINDEX_VAR IFNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_if_indextoname]]])
{
  char const *		ifname_varname;
  mmux_uint_t		ifindex;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ifname_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT(ifindex,		argv[2]);
  {
    char	buffer[IFNAMSIZ];
    char *	rv = if_indextoname(ifindex, buffer);

    if (NULL == rv) {
      return MMUX_FAILURE;
    } else {
      return mmux_string_bind_to_bash_variable(ifname_varname, buffer, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IFINDEX_VAR IFNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_if_nameindex_to_array]]])
{
  char const *		index_array_name;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(index_array_name,	argv[1]);
  {
    mmux_bash_index_array_variable_t	index_array_variable;
    mmux_bash_rv_t			rv;

    rv = mmux_bash_index_array_find_or_make_mutable(&index_array_variable, index_array_name, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != rv) { return rv; }
    {
      struct if_nameindex * A = if_nameindex();

      for (int i=0; NULL != A[i].if_name; ++i) {
	mmux_bash_index_array_index_t	index_array_key   = A[i].if_index;
	char *				index_array_value = A[i].if_name;

	rv = mmux_bash_index_array_bind(index_array_variable, index_array_key, index_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != rv) { break; }
      }
      if_freenameindex(A);
      return rv;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IF_NAMEINDEX_ARRAY_VAR"]]])


/** --------------------------------------------------------------------
 ** Sockets: creation, closure, pair.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_socket]]])
{
  char const *	sock_varname;
  mmux_sint_t	namespace, style, protocol;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sock_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(namespace,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(style,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(protocol,		argv[4]);
  {
    int		sock = socket(namespace, style, protocol);

    if (-1 != sock) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(sock_varname, sock, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) {
	close(sock);
      }
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK_VAR NAMESPACE STYLE PROTOCOL"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_shutdown]]])
{
  mmux_sint_t		sock, how;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(how,			argv[2]);
  {
    int		rv = shutdown(sock, how);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK HOW"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_socketpair]]])
{
  char const *	sock_varname1;
  char const *	sock_varname2;
  mmux_sint_t	namespace, style, protocol;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sock_varname1,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sock_varname2,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(namespace,		argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(style,		argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(protocol,		argv[5]);
  {
    int		socks[2];
    int		rv = socketpair(namespace, style, protocol, socks);

    if (0 == rv) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(sock_varname1, socks[0], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_sint_bind_to_bash_variable(sock_varname2, socks[1], MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return brv;

    error_binding_variables:
      close(socks[0]);
      close(socks[1]);
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK HOW"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_connect]]])
{
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(sockaddr_length,	argv[3]);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    int			rv = connect(sock, sockaddr_pointer, sockaddr_length);

    if (0 != rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_listen]]])
{
  mmux_sint_t		sock, N;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(N,		argv[2]);
  {
    int		rv = listen(sock, N);

    if (0 != rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_accept]]])
{
  char const *		connected_sock_varname;
  char const *		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sock_varname,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(allocated_sockaddr_length,			argv[5]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    socklen_t		connected_sockaddr_length = (socklen_t) allocated_sockaddr_length;
    int			connected_sock            = accept(sock, sockaddr_pointer, &connected_sockaddr_length);

    if (-1 != connected_sock) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(connected_sock_varname, connected_sock, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_usize_bind_to_bash_variable(connected_sockaddr_length_varname, (mmux_usize_t)connected_sockaddr_length,
					     MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return brv;

    error_binding_variables:
      close(connected_sock);
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CONNECTED_SOCK_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_accept4]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_ACCEPT4]]],[[[
  char const *		connected_sock_varname;
  char const *		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		allocated_sockaddr_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sock_varname,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(allocated_sockaddr_length,			argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,					argv[6]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    socklen_t		connected_sockaddr_length = (socklen_t) allocated_sockaddr_length;
    int			connected_sock            = accept4(sock, sockaddr_pointer, &connected_sockaddr_length, flags);

    if (-1 != connected_sock) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(connected_sock_varname, connected_sock, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_usize_bind_to_bash_variable(connected_sockaddr_length_varname, (mmux_usize_t)connected_sockaddr_length,
					     MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return brv;

    error_binding_variables:
      close(connected_sock);
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CONNECTED_SOCK_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpeername]]])
{
  char const *		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(allocated_sockaddr_length,			argv[4]);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    socklen_t		connected_sockaddr_length = (socklen_t) allocated_sockaddr_length;
    int			rv = getpeername(sock, sockaddr_pointer, &connected_sockaddr_length);

    if (0 != rv) {
      return mmux_usize_bind_to_bash_variable(connected_sockaddr_length_varname, (mmux_usize_t)connected_sockaddr_length,
					      MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK SOCKADDR_POINTER SOCKADDR_LENGTH"]]])


/** --------------------------------------------------------------------
 ** Sockets: sending and receiving.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_send]]])
{
  char const *		number_of_bytes_sent_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_sent_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,				argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,			argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,				argv[5]);
  {
    mmux_ssize_t	number_of_bytes_sent = send(sock, buffer_pointer, buffer_length, flags);

    if (-1 != number_of_bytes_sent) {
      return mmux_ssize_bind_to_bash_variable(number_of_bytes_sent_varname, number_of_bytes_sent, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_SENT_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_recv]]])
{
  char const *		number_of_bytes_received_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_received_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,				argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,			argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,				argv[5]);
  {
    mmux_ssize_t	number_of_bytes_received = recv(sock, buffer_pointer, buffer_length, flags);

    if (-1 != number_of_bytes_received) {
      return mmux_ssize_bind_to_bash_variable(number_of_bytes_received_varname, number_of_bytes_received, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_RECEIVED_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sendto]]])
{
  char const *		number_of_bytes_sent_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		addr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_sent_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,				argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,			argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,				argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[6]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(addr_length,			argv[7]);
  {
    struct sockaddr *	sockaddr_pointer     = addr_pointer;
    socklen_t		sockaddr_length      = (socklen_t) addr_length;
    mmux_ssize_t	number_of_bytes_sent = sendto(sock, buffer_pointer, buffer_length, flags,
						      sockaddr_pointer, sockaddr_length);

    if (-1 != number_of_bytes_sent) {
      return mmux_ssize_bind_to_bash_variable(number_of_bytes_sent_varname, number_of_bytes_sent, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(8 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_SENT_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_recvfrom]]])
{
  char const *		number_of_bytes_received_varname;
  char const *		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		allocated_addr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_received_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,				argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,					argv[6]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[7]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(allocated_addr_length,			argv[8]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    socklen_t		connected_sockaddr_length = (socklen_t) allocated_addr_length;
    mmux_ssize_t	number_of_bytes_received  = recvfrom(sock, buffer_pointer, buffer_length, flags,
							     sockaddr_pointer, &connected_sockaddr_length);

    if (-1 != number_of_bytes_received) {
      mmux_bash_rv_t	brv;

      brv =  mmux_ssize_bind_to_bash_variable(number_of_bytes_received_varname, number_of_bytes_received,
					      MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_usize_bind_to_bash_variable(connected_sockaddr_length_varname, (mmux_usize_t)connected_sockaddr_length,
					     MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return brv;

    error_binding_variables:
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(8 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_RECEIVED_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_sockets_module (void)
{
  mmux_bash_rv_t	rv;

  rv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_in_SIZEOF",  sizeof(struct sockaddr_in), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_in6_SIZEOF",  sizeof(struct sockaddr_in6), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  rv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_un_SIZEOF",  sizeof(struct sockaddr_un), NULL);
  if (MMUX_SUCCESS != rv) { return rv; }

  return MMUX_SUCCESS;
}

/* end of file */
