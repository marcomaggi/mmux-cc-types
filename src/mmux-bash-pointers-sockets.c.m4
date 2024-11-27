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

#undef  IS_POINTER_REPRESENTATION
#define IS_POINTER_REPRESENTATION(ARGVJ)	((2 < strlen(ARGVJ)) && ('0' == ARGVJ[0]) && ('1' == ARGVJ[1]))


/** --------------------------------------------------------------------
 ** Sockets: struct sockaddr.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sa_family_ref]]])
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

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_un_calloc]]])
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
 ** Sockets: struct sockaddr_in.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_in_calloc]]])
{
  char const *		sockaddr_in_pointer_varname;
  mmux_sshort_t		sin_family;
  char const *		sin_addr_pointer_varname;
  mmux_ushort_t		host_byteorder_sin_port;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sockaddr_in_pointer_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SSHORT(sin_family,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin_addr_pointer_varname,	argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USHORT(host_byteorder_sin_port,		argv[4]);
  {
    mmux_uint32_t		network_byteorder_sin_addr	= INADDR_NONE;
    mmux_ushort_t		network_byteorder_sin_port	= htons(host_byteorder_sin_port);
    struct sockaddr_in *	name				= calloc(1, sizeof(struct sockaddr_in));
    mmux_bash_rv_t		brv;

    name->sin_family      = (sa_family_t)sin_family;
    name->sin_addr.s_addr = network_byteorder_sin_addr;
    name->sin_port        = network_byteorder_sin_port;

    brv = mmux_pointer_bind_to_bash_variable(sockaddr_in_pointer_varname, name, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    brv = mmux_pointer_bind_to_bash_variable(sin_addr_pointer_varname, &(name->sin_addr), MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    free(name);
    return brv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN_POINTER_VAR SIN_FAMILY IN_ADDR_POINTER SIN_PORT"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_family_ref]]])
{
  char const *		sin_family_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin_family_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,		argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer = addr_pointer;

    return mmux_sshort_bind_to_bash_variable(sin_family_varname, sockaddr_in_pointer->sin_family, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SIN_FAMILY_VAR SOCKADDR_IN_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_family_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_sint_t		sin_family;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sin_family,		argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer = addr_pointer;

    sockaddr_in_pointer->sin_family = sin_family;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN_POINTER SIN_FAMILY"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_addr_ref]]])
{
  char const *		network_byteorder_sin_addr_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_byteorder_sin_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer        = addr_pointer;
    mmux_uint32_t		network_byteorder_sin_addr = sockaddr_in_pointer->sin_addr.s_addr;

    return mmux_uint32_bind_to_bash_variable(network_byteorder_sin_addr_varname, network_byteorder_sin_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_SIN_ADDR_VAR SOCKADDR_IN_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_addr_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_uint32_t		network_byteorder_sin_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(network_byteorder_sin_addr,	argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer = addr_pointer;

    sockaddr_in_pointer->sin_addr.s_addr = network_byteorder_sin_addr;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN_POINTER NETWORK_BYTEORDER_SIN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_addr_pointer_ref]]])
{
  char const *		sin_addr_pointer_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin_addr_pointer_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer = addr_pointer;
    mmux_pointer_t		sin_addr_pointer    = &(sockaddr_in_pointer->sin_addr.s_addr);

    return mmux_pointer_bind_to_bash_variable(sin_addr_pointer_varname, sin_addr_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SIN_ADDR_POINTER_VAR SOCKADDR_IN_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_port_ref]]])
{
  char const *		host_byteorder_sin_port_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(host_byteorder_sin_port_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer        = addr_pointer;
    mmux_uint16_t		network_byteorder_sin_port = sockaddr_in_pointer->sin_port;
    mmux_uint16_t		host_byteorder_sin_port    = ntohs(network_byteorder_sin_port);

    return mmux_uint16_bind_to_bash_variable(host_byteorder_sin_port_varname, host_byteorder_sin_port, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_SIN_PORT_VAR SOCKADDR_IN_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_port_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_uint16_t		host_byte_order_sin_port;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT16(host_byte_order_sin_port,	argv[2]);
  {
    struct sockaddr_in *	sockaddr_in_pointer = addr_pointer;

    sockaddr_in_pointer->sin_port = htons(host_byte_order_sin_port);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN_POINTER HOST_BYTEORDER_SIN_PORT"]]])


/** --------------------------------------------------------------------
 ** Sockets: struct sockaddr_in6.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_in6_calloc]]])
{
  char const *		sockaddr_in6_pointer_varname;
  mmux_sshort_t		sin6_family;
  char const *		sin6_addr_pointer_varname;
  mmux_uint32_t		network_byteorder_sin6_flowinfo;
  mmux_uint32_t		network_byteorder_sin6_scope_id;
  mmux_uint16_t		host_byteorder_sin6_port;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sockaddr_in6_pointer_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SSHORT(sin6_family,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin6_addr_pointer_varname,	argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(network_byteorder_sin6_flowinfo,	argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(network_byteorder_sin6_scope_id,	argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT16(host_byteorder_sin6_port,		argv[6]);
  {
    mmux_ushort_t		network_byteorder_sin6_port	= htons(host_byteorder_sin6_port);
    struct sockaddr_in6 *	name				= calloc(1, sizeof(struct sockaddr_in6));
    mmux_bash_rv_t		brv;

    name->sin6_family      = (sa_family_t)sin6_family;
    name->sin6_flowinfo    = network_byteorder_sin6_flowinfo;
    name->sin6_scope_id    = network_byteorder_sin6_scope_id;
    name->sin6_port        = network_byteorder_sin6_port;

    brv = mmux_pointer_bind_to_bash_variable(sockaddr_in6_pointer_varname, name, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    brv = mmux_pointer_bind_to_bash_variable(sin6_addr_pointer_varname, &(name->sin6_addr), MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    free(name);
    return brv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN6_POINTER_VAR SIN6_FAMILY SIN6_ADDR_POINTER_VAR SIN6_FLOWINFO SIN6_SCOPE_ID SIN6_PORT"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_family_ref]]])
{
  char const *		sin6_family_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin6_family_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,		argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;

    return mmux_sshort_bind_to_bash_variable(sin6_family_varname, sockaddr_in6_pointer->sin6_family, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SIN6_FAMILY_VAR SOCKADDR_IN6_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_family_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_sint_t		sin6_family;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sin6_family,		argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;

    sockaddr_in6_pointer->sin6_family = sin6_family;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN6_POINTER SIN6_FAMILY"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_addr_pointer_ref]]])
{
  char const *		sin6_addr_pointer_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(sin6_addr_pointer_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;
    struct in6_addr *		sin6_addr_pointer    = &(sockaddr_in6_pointer->sin6_addr);

    return mmux_pointer_bind_to_bash_variable(sin6_addr_pointer_varname, sin6_addr_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_SIN6_ADDR_VAR SOCKADDR_IN6_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_flowinfo_ref]]])
{
  char const *		network_byteorder_sin6_flowinfo_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_byteorder_sin6_flowinfo_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer            = addr_pointer;
    mmux_uint32_t		network_byteorder_sin6_flowinfo = sockaddr_in6_pointer->sin6_flowinfo;

    return mmux_uint32_bind_to_bash_variable(network_byteorder_sin6_flowinfo_varname, network_byteorder_sin6_flowinfo,
					     MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_SIN6_FLOWINFO_VAR SOCKADDR_IN6_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_flowinfo_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_uint32_t		sin6_flowinfo;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(sin6_flowinfo,	argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;

    sockaddr_in6_pointer->sin6_flowinfo = sin6_flowinfo;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN6_POINTER SIN6_FLOWINFO"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_scope_id_ref]]])
{
  char const *		network_byteorder_sin6_scope_id_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_byteorder_sin6_scope_id_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,					argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer            = addr_pointer;
    mmux_uint32_t		network_byteorder_sin6_scope_id = sockaddr_in6_pointer->sin6_scope_id;

    return mmux_uint32_bind_to_bash_variable(network_byteorder_sin6_scope_id_varname, network_byteorder_sin6_scope_id,
					     MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_SIN6_SCOPE_ID_VAR SOCKADDR_IN6_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_scope_id_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_uint32_t		sin6_scope_id;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(sin6_scope_id,	argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;

    sockaddr_in6_pointer->sin6_scope_id = sin6_scope_id;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN6_POINTER SIN6_SCOPE_ID"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_port_ref]]])
{
  char const *		host_byteorder_sin6_port_varname;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(host_byteorder_sin6_port_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer        = addr_pointer;
    mmux_uint16_t		network_byteorder_sin6_port = sockaddr_in6_pointer->sin6_port;
    mmux_uint16_t		host_byteorder_sin6_port    = ntohs(network_byteorder_sin6_port);

    return mmux_uint16_bind_to_bash_variable(host_byteorder_sin6_port_varname, host_byteorder_sin6_port, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_SIN6_PORT_VAR SOCKADDR_IN6_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin6_port_set]]])
{
  mmux_pointer_t	addr_pointer;
  mmux_uint16_t		sin6_port;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT16(sin6_port,		argv[2]);
  {
    struct sockaddr_in6 *	sockaddr_in6_pointer = addr_pointer;

    sockaddr_in6_pointer->sin6_port = htons(sin6_port);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN6_POINTER SIN6_PORT"]]])


/** --------------------------------------------------------------------
 ** Sockets: struct addrinfo.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_addrinfo_calloc]]])
{
  char const *		addrinfo_pointer_varname;
  mmux_sint_t		ai_flags		= 0;
  mmux_sint_t		ai_family		= AF_UNSPEC;
  mmux_sint_t		ai_socktype		= 0;
  mmux_sint_t		ai_protocol		= 0;
  mmux_socklen_t	ai_addrlen		= 0;
  mmux_pointer_t	addr_pointer		= NULL;
  mmux_pointer_t	canonname_pointer	= NULL;
  mmux_pointer_t	next_pointer		= NULL;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(addrinfo_pointer_varname,	argv[1]);
  if (10 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARG_SINT(ai_flags,				argv[2]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SINT(ai_family,				argv[3]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SINT(ai_socktype,			argv[4]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SINT(ai_protocol,			argv[5]);
    MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(ai_addrlen,			argv[6]);
    MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[7]);
    MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(canonname_pointer,		argv[8]);
    MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(next_pointer,			argv[9]);
  }
  {
    struct sockaddr *	ai_addr           = addr_pointer;
    char *		ai_canonname      = canonname_pointer;
    struct addrinfo *	ai_next           = next_pointer;
    struct addrinfo *	addrinfo_pointer  = calloc(1, sizeof(struct addrinfo));
    mmux_bash_rv_t	brv;

    addrinfo_pointer->ai_flags		= ai_flags;
    addrinfo_pointer->ai_family		= ai_family;
    addrinfo_pointer->ai_socktype	= ai_socktype;
    addrinfo_pointer->ai_protocol	= ai_protocol;
    addrinfo_pointer->ai_addrlen	= ai_addrlen;
    addrinfo_pointer->ai_addr		= ai_addr;
    addrinfo_pointer->ai_canonname	= ai_canonname;
    addrinfo_pointer->ai_next		= ai_next;

    brv = mmux_pointer_bind_to_bash_variable(addrinfo_pointer_varname, addrinfo_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    free(addrinfo_pointer);
    return brv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (10 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ADDRINFO_POINTER_VAR [AI_FLAGS AI_FAMILY AI_SOCKTYPE AI_PROTOCOL AI_ADDRLEN AI_ADDR AI_CANONNAME AI_NEXT]"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_STRUCT_ADDRINFO_SETTER_GETTER]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_ref]]])
{
  char const *		$1_varname;
  mmux_pointer_t	_addrinfo_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM($1_varname,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(_addrinfo_pointer,	argv[2]);
  {
    struct addrinfo *	addrinfo_pointer = _addrinfo_pointer;

    return mmux_$2_bind_to_bash_variable($1_varname, addrinfo_pointer->$1, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MMUX_M4_TOUPPER([[[$1]]])_VAR ADDRINFO_POINTER"]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_set]]])
{
  mmux_pointer_t	_addrinfo_pointer;
  mmux_$2_t		$1;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(_addrinfo_pointer,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_$3($1,				argv[2]);
  {
    struct addrinfo *	addrinfo_pointer = _addrinfo_pointer;

    addrinfo_pointer->$1 = $1;
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MMUX_M4_TOUPPER([[[$1]]])_VAR ADDRINFO_POINTER"]]])
]]])

DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_flags]]],		[[[sint]]],[[[SINT]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_family]]],		[[[sint]]],[[[SINT]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_socktype]]],		[[[sint]]],[[[SINT]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_protocol]]],		[[[sint]]],[[[SINT]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_addrlen]]],		[[[socklen]]],[[[SOCKLEN]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_addr]]],		[[[pointer]]],[[[POINTER]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_canonname]]],	[[[pointer]]],[[[POINTER]]])
DEFINE_STRUCT_ADDRINFO_SETTER_GETTER([[[ai_next]]],		[[[pointer]]],[[[POINTER]]])


/** --------------------------------------------------------------------
 ** Sockets: byte order.
 ** ----------------------------------------------------------------- */

/* Host-to-network short int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_htons]]])
{
  char const *		network_byteorder_number_varname;
  mmux_uint16_t		host_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_byteorder_number_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT16(host_byteorder_number,			argv[2]);
  {
    mmux_uint16_t	network_byteorder_number = htons(host_byteorder_number);

    return mmux_uint16_bind_to_bash_variable(network_byteorder_number_varname, network_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_NUMBER_VAR HOST_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-host short int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ntohs]]])
{
  char const *		host_byteorder_number_varname;
  mmux_uint16_t		network_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(host_byteorder_number_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT16(network_byteorder_number,		argv[2]);
  {
    mmux_uint16_t	host_byteorder_number = ntohs(network_byteorder_number);

    return mmux_uint16_bind_to_bash_variable(host_byteorder_number_varname, host_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_NUMBER_VAR NETWORK_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Host-to-network long int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_htonl]]])
{
  char const *		network_byteorder_number_varname;
  mmux_uint32_t		host_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_byteorder_number_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(host_byteorder_number,			argv[2]);
  {
    mmux_uint32_t	network_byteorder_number = htonl(host_byteorder_number);

    return mmux_uint32_bind_to_bash_variable(network_byteorder_number_varname, network_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_NUMBER_VAR HOST_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-host long int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ntohl]]])
{
  char const *		host_byteorder_number_varname;
  mmux_uint32_t		network_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(host_byteorder_number_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(network_byteorder_number,		argv[2]);
  {
    mmux_uint32_t	host_byteorder_number = ntohl(network_byteorder_number);

    return mmux_uint32_bind_to_bash_variable(host_byteorder_number_varname, host_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_NUMBER_VAR NETWORK_BYTEORDER_NUMBER"]]])


/** --------------------------------------------------------------------
 ** Sockets: host address conversion.
 ** ----------------------------------------------------------------- */

/* ASCII-to-network */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_aton]]])
{
  char const *		in_addr_varname;
  char const *		ascii_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_in_addr,		argv[2]);
  {
    struct in_addr	name;
    int			rv   = inet_aton(ascii_in_addr, &name);

    if (0 != rv) {
      mmux_uint32_t	addr = name.s_addr;

      return mmux_uint32_bind_to_bash_variable(in_addr_varname, addr, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_addr]]])
{
  char const *		in_addr_varname;
  char const *		ascii_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_in_addr,		argv[2]);
  {
    mmux_uint32_t	addr = inet_addr(ascii_in_addr);

    return mmux_uint32_bind_to_bash_variable(in_addr_varname, addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Network to ASCII. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_ntoa]]])
{
  char const *		ascii_in_addr_varname;
  mmux_uint32_t		addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(addr,			argv[2]);
  {
    struct in_addr	name          = { .s_addr = addr };
    char const *	ascii_in_addr = inet_ntoa(name);

    return mmux_string_bind_to_bash_variable(ascii_in_addr_varname, ascii_in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCII_IN_ADDR_VAR IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_network]]])
{
  char const *		network_in_addr_varname;
  char const *		ascii_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(network_in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_in_addr,			argv[2]);
  {
    mmux_uint32_t	network_addr = inet_network(ascii_in_addr);

    if (INADDR_NONE != network_addr) {
      return mmux_uint32_bind_to_bash_variable(network_in_addr_varname, network_addr, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_makeaddr]]])
{
  char const *		uint32_in_addr_varname;
  mmux_uint32_t		uint32_net_in_addr;
  mmux_uint32_t		uint32_local_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(uint32_in_addr_varname,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(uint32_net_in_addr,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(uint32_local_in_addr,		argv[3]);
  {
    struct	in_addr	addr = inet_makeaddr(uint32_net_in_addr, uint32_local_in_addr);

    return mmux_uint32_bind_to_bash_variable(uint32_in_addr_varname, addr.s_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCII_IN_ADDR_VAR UINT32_NET_IN_ADDR UINT32_LOCAL_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Local network address of. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_lnaof]]])
{
  char const *		uint32_local_in_addr_varname;
  mmux_uint32_t		uint32_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(uint32_local_in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(uint32_in_addr,			argv[2]);
  {
    struct in_addr	name          = { .s_addr = uint32_in_addr };
    mmux_uint32_t	local_in_addr = inet_lnaof(name);

    return mmux_uint32_bind_to_bash_variable(uint32_local_in_addr_varname, local_in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UINT32_LOCAL_IN_ADDR_VAR UINT32_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* network part address of. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_netof]]])
{
  char const *		uint32_local_in_addr_varname;
  mmux_uint32_t		uint32_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(uint32_local_in_addr_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_UINT32(uint32_in_addr,			argv[2]);
  {
    struct in_addr	name          = { .s_addr = uint32_in_addr };
    mmux_uint32_t	local_in_addr = inet_netof(name);

    return mmux_uint32_bind_to_bash_variable(uint32_local_in_addr_varname, local_in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UINT32_NET_IN_ADDR_VAR UINT32_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Presentation-to-network. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_pton]]])
{
  mmux_sint_t		af_type;
  char const *		ascii_addr;
  mmux_pointer_t	addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(af_type,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_addr,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[3]);
  {
    int		rv = inet_pton(af_type, ascii_addr, addr_pointer);

    if (rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AF_TYPE ASCII_ADDR ADDR_POINTER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-presentation. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_ntop]]])
{
  mmux_sint_t		af_type;
  mmux_pointer_t	addr_pointer;
  char const *		ascii_addr_varname;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(af_type,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,		argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(ascii_addr_varname,	argv[3]);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK	512
    char		ascii_addr[IS_THIS_ENOUGH_QUESTION_MARK];
    char const *	rv = inet_ntop(af_type, addr_pointer, (char *)ascii_addr, (socklen_t)IS_THIS_ENOUGH_QUESTION_MARK);

    if (NULL != rv) {
      return mmux_string_bind_to_bash_variable(ascii_addr_varname, ascii_addr, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AF_TYPE ASCII_ADDR ADDR_POINTER"]]])


/** --------------------------------------------------------------------
 ** Sockets: addresses.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getaddrinfo]]])
{
  char const *		node;
  char const *		service;
  mmux_pointer_t	_hints_pointer;
  char const *		addrinfo_linked_list_varname;

  if (IS_POINTER_REPRESENTATION(argv[1])) {
    mmux_pointer_t	_node;
    MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(_node,		argv[1]);
    node = _node;
  } else {
    MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(node,		argv[1]);
  }
  if (IS_POINTER_REPRESENTATION(argv[2])) {
    mmux_pointer_t	_service;
    MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(_service,	argv[2]);
    service = _service;
  } else {
    MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(service,	argv[2]);
  }
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(_hints_pointer,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(addrinfo_linked_list_varname,	argv[4]);
  {
    struct addrinfo *	hints_pointer = _hints_pointer;
    struct addrinfo *	addrinfo_linked_list;

    if (0 == strlen(node))    { node    = NULL; }
    if (0 == strlen(service)) { service = NULL; }
    {
      int	rv = getaddrinfo(node, service, hints_pointer, &addrinfo_linked_list);

      if (0 == rv) {
	return mmux_pointer_bind_to_bash_variable(addrinfo_linked_list_varname, addrinfo_linked_list, MMUX_BASH_BUILTIN_STRING_NAME);
      } else {
	mmux_bash_rv_t	brv;

	brv = mmux_sint_bind_to_bash_variable("GAI_ERRNUM", rv, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { return brv; }

	return mmux_string_bind_to_bash_variable("GAI_ERRMSG", gai_strerror(rv), MMUX_BASH_BUILTIN_STRING_NAME);
      }
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NODE SERVICE HINTS_ADDRINFO_POINTER ADDRINFO_LINKED_LIST_VARNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_freeaddrinfo]]])
{
  mmux_pointer_t	addrinfo_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addrinfo_pointer,	argv[1]);
  {
    free(addrinfo_pointer);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ADDRINFO_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_bind]]])
{
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_socklen_t	addr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,		argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(addr_length,	argv[3]);
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
    mmux_socklen_t	addr_length = IS_THIS_ENOUGH_QUESTION_MARK;
    mmux_uint8_t	buffer[addr_length];
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

	brv = mmux_pointer_bind_to_bash_variable(addr_pointer_var, sockaddr_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

	brv = mmux_socklen_bind_to_bash_variable(addr_length_var, addr_length, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

	return brv;

      error_binding_variables:
	free(sockaddr_pointer);
	return brv;
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
	mmux_bash_index_array_key_t	index_array_key   = A[i].if_index;
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
  mmux_socklen_t	allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sock_varname,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(allocated_sockaddr_length,		argv[5]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    mmux_socklen_t	connected_sockaddr_length = allocated_sockaddr_length;
    int			connected_sock            = accept(sock, sockaddr_pointer, &connected_sockaddr_length);

    if (-1 != connected_sock) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(connected_sock_varname, connected_sock, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_socklen_bind_to_bash_variable(connected_sockaddr_length_varname, connected_sockaddr_length, MMUX_BASH_BUILTIN_STRING_NAME);
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
  mmux_socklen_t	allocated_sockaddr_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sock_varname,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(allocated_sockaddr_length,		argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,					argv[6]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    mmux_socklen_t	connected_sockaddr_length = allocated_sockaddr_length;
    int			connected_sock            = accept4(sock, sockaddr_pointer, &connected_sockaddr_length, flags);

    if (-1 != connected_sock) {
      mmux_bash_rv_t	brv;

      brv = mmux_sint_bind_to_bash_variable(connected_sock_varname, connected_sock, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_socklen_bind_to_bash_variable(connected_sockaddr_length_varname, connected_sockaddr_length, MMUX_BASH_BUILTIN_STRING_NAME);
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
  mmux_socklen_t	allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(allocated_sockaddr_length,		argv[4]);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    mmux_socklen_t	connected_sockaddr_length = allocated_sockaddr_length;
    int			rv = getpeername(sock, sockaddr_pointer, &connected_sockaddr_length);

    if (0 != rv) {
      return mmux_socklen_bind_to_bash_variable(connected_sockaddr_length_varname, connected_sockaddr_length, MMUX_BASH_BUILTIN_STRING_NAME);
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
  mmux_socklen_t	sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_sent_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,				argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,			argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,				argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,			argv[6]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(sockaddr_length,			argv[7]);
  {
    struct sockaddr *	sockaddr_pointer     = addr_pointer;
    mmux_ssize_t	number_of_bytes_sent = sendto(sock, buffer_pointer, buffer_length, flags, sockaddr_pointer, sockaddr_length);

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
  mmux_socklen_t	allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(number_of_bytes_received_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(connected_sockaddr_length_varname,	argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,					argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(buffer_pointer,				argv[4]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(buffer_length,				argv[5]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(flags,					argv[6]);
  MMUX_BASH_PARSE_BUILTIN_ARG_POINTER(addr_pointer,				argv[7]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SOCKLEN(allocated_sockaddr_length,		argv[8]);
  {
    struct sockaddr *	sockaddr_pointer          = addr_pointer;
    mmux_socklen_t	connected_sockaddr_length = allocated_sockaddr_length;
    mmux_ssize_t	number_of_bytes_received  = recvfrom(sock, buffer_pointer, buffer_length, flags,
							     sockaddr_pointer, &connected_sockaddr_length);

    if (-1 != number_of_bytes_received) {
      mmux_bash_rv_t	brv;

      brv =  mmux_ssize_bind_to_bash_variable(number_of_bytes_received_varname, number_of_bytes_received, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_socklen_bind_to_bash_variable(connected_sockaddr_length_varname, connected_sockaddr_length, MMUX_BASH_BUILTIN_STRING_NAME);
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
 ** Sockets: options.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getsockopt]]])
{
  char const *		option_value_varname;
  mmux_sint_t		sock;
  mmux_sint_t		level;
  mmux_sint_t		optname;

  MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(option_value_varname,	argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(level,			argv[3]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(optname,			argv[4]);
  {
    switch (optname) {
    case SO_BROADCAST:
    case SO_DEBUG:
    case SO_DONTROUTE:
    case SO_ERROR:
    case SO_KEEPALIVE:
    case SO_OOBINLINE:
    case SO_REUSEADDR:
    case SO_TYPE: /* case SO_STYLE: it is an alias for SO_TYPE */
      /* The option value is an "int". */
      {
	mmux_sint_t	optval;
	mmux_socklen_t	optlen = sizeof(mmux_sint_t);
	int		rv = getsockopt(sock, level, optname, &optval, &optlen);

	if (0 == rv) {
	  return mmux_sint_bind_to_bash_variable(option_value_varname, optval, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  goto error_calling_getsockopt;
	}
      }
      break;

    case SO_RCVBUF: /* size of receiving buffer */
    case SO_SNDBUF: /* size of sending buffer */
      /* The option value is a "size_t". */
      {
	mmux_usize_t	optval = 0;
	mmux_socklen_t	optlen = sizeof(mmux_usize_t);
	int		rv = getsockopt(sock, level, optname, &optval, &optlen);

	if (0 == rv) {
	  return mmux_sint_bind_to_bash_variable(option_value_varname, optval, MMUX_BASH_BUILTIN_STRING_NAME);
	} else {
	  goto error_calling_getsockopt;
	}
      }
      break;

    case SO_LINGER:
      /* The option value is a "struct linger". */
      {
	struct linger	optval;
	mmux_socklen_t	optlen = sizeof(optval);
	int		rv = getsockopt(sock, level, optname, &optval, &optlen);

	if (-1 == rv) {
	  goto error_calling_getsockopt;
	} else {
	  if (0) { fprintf(stderr, "%s: called getsockopt l_onoff=%d, l_linger=%d\n", __func__, optval.l_onoff, optval.l_linger); }
	  mmux_bash_assoc_array_variable_t	assoc_array_variable;
	  mmux_bash_rv_t			brv;

	  brv = mmux_bash_assoc_array_find_or_make_mutable(&assoc_array_variable, option_value_varname, MMUX_BASH_BUILTIN_STRING_NAME);
	  if (MMUX_SUCCESS != brv) { return brv; }

	  brv = mmux_bash_assoc_array_bind(assoc_array_variable, "ONOFF", (optval.l_onoff)? "1" : "0", MMUX_BASH_BUILTIN_STRING_NAME);
	  if (MMUX_SUCCESS != brv) { return brv; }
	  {
	    mmux_sint_t	requested_size = mmux_sint_sprint_size(optval.l_linger);

	    if (-1 == requested_size) {
	      goto error_converting_l_linger;
	    } else {
	      char	timeout_period_in_seconds[requested_size];

	      rv = mmux_sint_sprint(timeout_period_in_seconds, requested_size, optval.l_linger);
	      if (0 != rv) { goto error_converting_l_linger; }

	      brv = mmux_bash_assoc_array_bind(assoc_array_variable, "LINGER", timeout_period_in_seconds, MMUX_BASH_BUILTIN_STRING_NAME);
	      if (MMUX_SUCCESS != brv) { return brv; }
	    }
	    return MMUX_SUCCESS;

	  error_converting_l_linger:
	    fprintf(stderr, "%s: error: failure while converting l_linger to string\n", MMUX_BASH_BUILTIN_STRING_NAME);
	    return MMUX_FAILURE;
	  }
	}
      }
      break;

    default:
      errno = EINVAL;
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }

  error_calling_getsockopt:
    mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    return MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER OPTION_VALUE_VAR SOCK LEVEL OPTNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setsockopt]]])
{
  mmux_sint_t		sock;
  mmux_sint_t		level;
  mmux_sint_t		optname;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(sock,			argv[1]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(level,			argv[2]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT(optname,			argv[3]);
  {
    switch (optname) {
    case SO_BROADCAST:
    case SO_DEBUG:
    case SO_DONTROUTE:
    case SO_KEEPALIVE:
    case SO_OOBINLINE:
    case SO_REUSEADDR:
      /* The  option  SO_TYPE  ==  SO_STYLE   and  SO_ERROR  are  not  available  for
	 setting. */
      {
	mmux_sint_t	optval;

	MMUX_BASH_PARSE_BUILTIN_ARG_SINT(optval,	argv[4]);
	{
	  mmux_socklen_t	optlen = sizeof(optval);
	  int			rv = setsockopt(sock, level, optname, &optval, optlen);

	  if (0 == rv) {
	    return MMUX_SUCCESS;
	  } else {
	    goto error_calling_setsockopt;
	  }
	}
      }
      break;

    case SO_RCVBUF: /* size of receiving buffer */
    case SO_SNDBUF: /* size of sending buffer */
      /* The option value is a "size_t". */
      {
	mmux_usize_t	optval;

	MMUX_BASH_PARSE_BUILTIN_ARG_USIZE(optval,	argv[4]);
	{
	  mmux_socklen_t	optlen = sizeof(optval);
	  int			rv = setsockopt(sock, level, optname, &optval, optlen);

	  if (0 == rv) {
	    return MMUX_SUCCESS;
	  } else {
	    goto error_calling_setsockopt;
	  }
	}
      }
      break;

    case SO_LINGER:
      /* The option value is a "struct linger". */
      {
	char const *	option_value_array_varname;

	MMUX_BASH_PARSE_BUILTIN_ARG_BASH_PARM(option_value_array_varname,	argv[4]);
	{
	    mmux_bash_assoc_array_variable_t	assoc_array_variable;
	    char const *			assoc_array_value;
	    struct linger			optval;
	    mmux_bash_rv_t			brv;

	    brv = mmux_bash_assoc_array_find_existent(&assoc_array_variable, option_value_array_varname, MMUX_BASH_BUILTIN_STRING_NAME);
	    if (MMUX_SUCCESS != brv) { return brv; }

	    /* Retrieve the value of the key "ONOFF". */
	    {
	      brv = mmux_bash_assoc_array_ref(assoc_array_variable, "ONOFF", &assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	      if (MMUX_SUCCESS != brv) { return brv; }
	      if (0 == strcmp("0",assoc_array_value)) {
		optval.l_onoff = 0;
	      } else {
		optval.l_onoff = 1;
	      }
	    }

	    /* Retrieve the value of the key "LINGER". */
	    {
	      mmux_sint_t	timeout_period_in_seconds;

	      brv = mmux_bash_assoc_array_ref(assoc_array_variable, "LINGER", &assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME);
	      if (false == mmux_sint_parse(&timeout_period_in_seconds, assoc_array_value, MMUX_BASH_BUILTIN_STRING_NAME)) {
		optval.l_linger = timeout_period_in_seconds;
	      } else {
		return MMUX_FAILURE;
	      }
	    }

	    {
	      if (0) { fprintf(stderr, "%s: calling setsockopt l_onoff=%d, l_linger=%d\n", __func__, optval.l_onoff, optval.l_linger); }
	      mmux_socklen_t	optlen = sizeof(optval);
	      int		rv = setsockopt(sock, level, optname, &optval, optlen);

	      if (0 == rv) {
		return MMUX_SUCCESS;
	      } else {
		goto error_calling_setsockopt;
	      }
	  }
	}
      }
      break;

    default:
      errno = EINVAL;
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }

  error_calling_setsockopt:
    mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
    return MMUX_FAILURE;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK LEVEL OPTNAME OPTION_VALUE"]]])


/** --------------------------------------------------------------------
 ** Module initialisation.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_bash_pointers_init_sockets_module (void)
{
  mmux_bash_rv_t	brv;

  {
    brv = mmux_bash_create_global_sint_variable("mmux_libc_in_addr_SIZEOF",  sizeof(struct in_addr), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_in6_addr_SIZEOF",  sizeof(struct in6_addr), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_in_SIZEOF",  sizeof(struct sockaddr_in), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_in6_SIZEOF",  sizeof(struct sockaddr_in6), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_un_SIZEOF",  sizeof(struct sockaddr_un), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_addrinfo_SIZEOF", sizeof(struct addrinfo), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_hostent_SIZEOF", sizeof(struct hostent), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }
  }

  {
    brv = mmux_pointer_bind_to_bash_variable("mmux_libc_in6addr_loopback_pointer", (mmux_pointer_t)&(in6addr_loopback), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_pointer_bind_to_bash_variable("mmux_libc_in6addr_any_pointer", (mmux_pointer_t)&(in6addr_any), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }
  }

  return MMUX_SUCCESS;
}

/* end of file */
