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

/* ------------------------------------------------------------------ */

m4_dnl $1 - stem of the Bash builtin
m4_dnl $2 - optional stem of the MMUX Libc data structure, it defaults to $1
m4_define([[[DEFINE_MMUX_LIBC_STRUCT_DUMPER]]],[[[m4_define([[[THE_STEM]]],m4_ifelse([[[$2]]],,[[[$1]]],[[[$2]]]))
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_$1_dump]]])
{
  mmux_libc_[[[]]]THE_STEM[[[]]]_t *	$1_pointer;
  mmux_asciizcp_t	struct_name = "struct THE_STEM";

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER($1_pointer,	1);
  if (3 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(struct_name,	2);
  }
  {
    mmux_libc_file_descriptor_t		fd;

    MMUX_LIBC_FUNCALL(mmux_libc_stdou(&fd));
    MMUX_LIBC_FUNCALL(mmux_libc_[[[]]]THE_STEM[[[]]]_dump(fd, $1_pointer, struct_name));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (3 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MMUX_M4_TOUPPER([[[$1]]])_POINTER [STRUCT_NAME]"]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - name of the target variable, a value of type "mmux_libc_in_addr_t".
m4_dnl $2 - index in the array "argv" of the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR]]],[[[{
mmux_uint32_t	the_argument_value;

MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32([[[the_argument_value]]],[[[$2]]])
MMUX_LIBC_FUNCALL(mmux_libc_make_in_addr(&$1, the_argument_value));
}]]])

/* ------------------------------------------------------------------ */

static mmux_bash_rv_t
mmux_libc_in_addr_bind_to_bash_variable (mmux_asciizcp_t varname, mmux_libc_in_addr_t value, char const * caller_name)
{
  mmux_uint32_t		field_value;

  mmux_libc_s_addr_ref(&field_value, &value);
  return mmux_uint32_bind_to_bash_variable(varname, field_value, caller_name);
}
static mmux_bash_rv_t
mmux_libc_sockaddr_ptr_bind_to_bash_variable (mmux_asciizcp_t varname, mmux_libc_sockaddr_ptr_t ptr, char const * caller_name)
{
  return mmux_pointer_bind_to_bash_variable(varname, (mmux_pointer_t)ptr, caller_name);
}
static mmux_bash_rv_t
mmux_libc_addrinfo_ptr_bind_to_bash_variable (mmux_asciizcp_t varname, mmux_libc_addrinfo_ptr_t ptr, char const * caller_name)
{
  return mmux_pointer_bind_to_bash_variable(varname, (mmux_pointer_t)ptr, caller_name);
}


/** --------------------------------------------------------------------
 ** Sockets: struct sockaddr.
 ** ----------------------------------------------------------------- */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_sockaddr_t, sa_family, sshort, [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[sockaddr]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_sockaddr_un_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_un_calloc]]])
{
  mmux_asciizcp_t			sockaddr_un_pointer_varname;
  mmux_asciizcp_t			sockaddr_un_length_varname;
  mmux_sint_t				family;
  mmux_libc_file_system_pathname_t	pathname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sockaddr_un_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sockaddr_un_length_varname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(family,				3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_PTN(pathname,			4);
  {
    mmux_libc_sockaddr_un_t	name;

    MMUX_LIBC_FUNCALL(mmux_libc_sun_family_set(&name, family));
    MMUX_LIBC_FUNCALL(mmux_libc_sun_path_set  (&name, pathname));
    {
      /* NOTE: "SUN_LEN()" does not include the  terminating nul of "sun_path" in its
	 computation; at least this  is what I observe.  So we add  one to the memory
	 block allocated  size to be  able to extract the  path as an  ASCIIZ string.
	 The  length  reported in  "sockaddr_un_length_varname"  is  still the  value
	 computed by "SUN_LEN()", because that is what is needed to pass when calling
	 "bind()".  (Marco Maggi; Nov 18, 2024) */
      mmux_usize_t		addr_len = mmux_libc_SUN_LEN(&name);
      mmux_libc_sockaddr_un_t *	addr_ptr;

      MMUX_LIBC_FUNCALL(mmux_libc_calloc(&addr_ptr, 1, 1+addr_len));
      MMUX_LIBC_FUNCALL(mmux_libc_memcpy(addr_ptr, &name, 1+addr_len));
      {
	mmux_bash_rv_t	brv;

	brv = mmux_pointer_bind_to_bash_variable(sockaddr_un_pointer_varname, addr_ptr, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

	brv = mmux_usize_bind_to_bash_variable(sockaddr_un_length_varname, addr_len, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

	return brv;

      error_binding_variables:
	mmux_libc_free(addr_ptr);
	return brv;
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_UN_POINTER_VAR SOCKADDR_UN_LENGTH_VAR SUN_FAMILY SUN_PATH"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_un_t]]],[[[sun_family]]],
					  [[[sshort]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_un_t]]],[[[sun_path]]],
					  [[[libc_ptn]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_LIBC_PTN]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[sockaddr_un]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_sockaddr_in_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_in_calloc]]])
{
  mmux_asciizcp_t		sockaddr_in_pointer_varname;
  mmux_sshort_t			sin_family;
  mmux_asciizcp_t		sin_addr_pointer_varname;
  mmux_host_byteorder_ushort_t	host_byteorder_sin_port;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sockaddr_in_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT(sin_family,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sin_addr_pointer_varname,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USHORT(host_byteorder_sin_port,	4);
  {
    mmux_libc_in_addr_t			sin_addr;
    mmux_libc_in_addr_t *		sin_addr_p;
    mmux_libc_sockaddr_in_t *		sockaddr_p;
    mmux_bash_rv_t			brv;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&sockaddr_p, 1, sizeof(mmux_libc_sockaddr_in_t)));
    mmux_libc_make_in_addr_none(&sin_addr);

    mmux_libc_sin_family_set(sockaddr_p, sin_family);
    mmux_libc_sin_addr_set  (sockaddr_p, sin_addr);
    mmux_libc_sin_port_set  (sockaddr_p, host_byteorder_sin_port);

    mmux_libc_sin_addr_p_ref(&sin_addr_p, sockaddr_p);

    brv = mmux_pointer_bind_to_bash_variable(sockaddr_in_pointer_varname, sockaddr_p, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    brv = mmux_pointer_bind_to_bash_variable(sin_addr_pointer_varname, sin_addr_p, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    mmux_libc_free(sockaddr_p);
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_IN_POINTER_VAR SIN_FAMILY IN_ADDR_POINTER SIN_PORT"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_in_t]]],[[[sin_family]]],
					  [[[sshort]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_in_t]]],[[[sin_addr]]],
					  [[[libc_in_addr]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_in_t]]],[[[sin_port]]],
					  [[[ushort]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_USHORT]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[sockaddr_in]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sin_addr_pointer_ref]]])
{
  mmux_asciizcp_t		sin_addr_pointer_varname;
  mmux_libc_sockaddr_in_t *	sockaddr_in_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sin_addr_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(sockaddr_in_pointer,	2);
  {
    mmux_libc_in_addr_t *	sin_addr_p;

    MMUX_LIBC_FUNCALL(mmux_libc_sin_addr_p_ref(&sin_addr_p, sockaddr_in_pointer));
    return mmux_pointer_bind_to_bash_variable(sin_addr_pointer_varname, sin_addr_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SIN_ADDR_POINTER_VAR SOCKADDR_IN_POINTER"]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_sockaddr_insix_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sockaddr_insix_calloc]]])
{
  mmux_asciizcp_t	sockaddr_insix_pointer_varname;
  mmux_sshort_t		sinsix_family;
  mmux_asciizcp_t	sinsix_addr_pointer_varname;
  mmux_uint32_t		network_byteorder_sinsix_flowinfo;
  mmux_uint32_t		network_byteorder_sinsix_scope_id;
  mmux_uint16_t		host_byteorder_sinsix_port;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sockaddr_insix_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT(sinsix_family,				2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sinsix_addr_pointer_varname,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32(network_byteorder_sinsix_flowinfo,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32(network_byteorder_sinsix_scope_id,	5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT16(host_byteorder_sinsix_port,		6);
  {
    mmux_libc_sockaddr_insix_t *	sockaddr_p;
    mmux_libc_insix_addr_t *		sinsix_addr_p;
    mmux_bash_rv_t			brv;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&sockaddr_p, 1, sizeof(mmux_libc_sockaddr_insix_t)));

    mmux_libc_sinsix_family_set  (sockaddr_p, sinsix_family);
    mmux_libc_sinsix_flowinfo_set(sockaddr_p, network_byteorder_sinsix_flowinfo);
    mmux_libc_sinsix_scope_id_set(sockaddr_p, network_byteorder_sinsix_scope_id);
    mmux_libc_sinsix_port_set    (sockaddr_p, host_byteorder_sinsix_port);

    mmux_libc_sinsix_addr_p_ref(&sinsix_addr_p, sockaddr_p);

    brv = mmux_pointer_bind_to_bash_variable(sockaddr_insix_pointer_varname, sockaddr_p, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    brv = mmux_pointer_bind_to_bash_variable(sinsix_addr_pointer_varname, sinsix_addr_p, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    mmux_libc_free(sockaddr_p);
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_INSIX_POINTER_VAR SINSIX_FAMILY SINSIX_ADDR_POINTER_VAR SINSIX_FLOWINFO SINSIX_SCOPE_ID SINSIX_PORT"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_insix_t]]],[[[sinsix_family]]],
					  [[[sshort]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SSHORT]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_insix_t]]],[[[sinsix_flowinfo]]],
					  [[[uint32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_insix_t]]],[[[sinsix_scope_id]]],
					  [[[uint32]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32]]])

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER([[[mmux_libc_sockaddr_insix_t]]],[[[sinsix_port]]],
					  [[[uint16]]],[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT16]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[sockaddr_insix]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sinsix_addr_pointer_ref]]])
{
  mmux_asciizcp_t		sinsix_addr_pointer_varname;
  mmux_libc_sockaddr_insix_t *	sockaddr_p;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sinsix_addr_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(sockaddr_p,		2);
  {
    mmux_libc_insix_addr_t *	sinsix_addr_p;

    MMUX_LIBC_FUNCALL(mmux_libc_sinsix_addr_p_ref(&sinsix_addr_p, sockaddr_p));
    return mmux_pointer_bind_to_bash_variable(sinsix_addr_pointer_varname, sinsix_addr_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_SINSIX_ADDR_VAR SOCKADDR_INSIX_POINTER"]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_addrinfo_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_addrinfo_calloc]]])
{
  mmux_asciizcp_t		addrinfo_pointer_varname;
  mmux_sint_t			ai_flags		= 0;
  mmux_sint_t			ai_family		= AF_UNSPEC;
  mmux_sint_t			ai_socktype		= 0;
  mmux_sint_t			ai_protocol		= 0;
  mmux_socklen_t		ai_addrlen		= 0;
  mmux_libc_sockaddr_t *	ai_addr			= NULL;
  mmux_asciizcp_t		ai_canonname		= NULL;
  mmux_libc_addrinfo_t *	ai_next			= NULL;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addrinfo_pointer_varname,	1);
  if (10 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(ai_flags,		2);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(ai_family,		3);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(ai_socktype,		4);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(ai_protocol,		5);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(ai_addrlen,		6);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(ai_addr,	7);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(ai_canonname,	8);
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(ai_next,	9);
  }
  {
    mmux_libc_addrinfo_t *	addrinfo_pointer;
    mmux_bash_rv_t		brv;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&addrinfo_pointer, 1, sizeof(mmux_libc_addrinfo_t)));

    mmux_libc_ai_flags_set	(addrinfo_pointer, ai_flags);
    mmux_libc_ai_family_set	(addrinfo_pointer, ai_family);
    mmux_libc_ai_socktype_set	(addrinfo_pointer, ai_socktype);
    mmux_libc_ai_protocol_set	(addrinfo_pointer, ai_protocol);
    mmux_libc_ai_addrlen_set	(addrinfo_pointer, ai_addrlen);
    mmux_libc_ai_addr_set	(addrinfo_pointer, ai_addr);
    mmux_libc_ai_canonname_set	(addrinfo_pointer, ai_canonname);
    mmux_libc_ai_next_set	(addrinfo_pointer, ai_next);

    brv = mmux_pointer_bind_to_bash_variable(addrinfo_pointer_varname, addrinfo_pointer, MMUX_BASH_BUILTIN_STRING_NAME);
    if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

    return brv;

  error_binding_variables:
    mmux_libc_free(addrinfo_pointer);
    return brv;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((2 == argc) || (10 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ADDRINFO_POINTER_VAR [AI_FLAGS AI_FAMILY AI_SOCKTYPE AI_PROTOCOL AI_ADDRLEN AI_ADDR AI_CANONNAME AI_NEXT]"]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_flags,    sint,    [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_family,   sint,    [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_socktype, sint,    [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_protocol, sint,    [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_addrlen,  socklen, [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_addr, libc_sockaddr_ptr,
					  [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_canonname, asciizcp,
					  [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_addrinfo_t, ai_next, libc_addrinfo_ptr,
					  [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[addrinfo]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_hostent_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_hostent_calloc]]])
{
  mmux_asciizcp_t		hostent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(hostent_pointer_varname,	1);
  {
    mmux_libc_hostent_ptr_t	ptr;

    MMUX_LIBC_FUNCALL(mmux_libc_calloc(&ptr, 1, sizeof(mmux_libc_hostent_t)));
    return mmux_pointer_bind_to_bash_variable(hostent_pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOSTENT_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_HOSTENT_SETTER_GETTER]]],
  [[[DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_hostent_t,[[[$1]]],[[[$2]]],[[[$3]]])]]])

DEFINE_HOSTENT_SETTER_GETTER([[[h_name]]],	[[[asciizp]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_HOSTENT_SETTER_GETTER([[[h_aliases]]],	[[[asciizpp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_HOSTENT_SETTER_GETTER([[[h_addrtype]]],	[[[sint]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_HOSTENT_SETTER_GETTER([[[h_length]]],	[[[sint]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_HOSTENT_SETTER_GETTER([[[h_addr_list]]],	[[[asciizpp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_HOSTENT_SETTER_GETTER([[[h_addr]]],	[[[asciizp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[hostent]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_servent_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_servent_calloc]]])
{
  mmux_asciizcp_t		servent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(servent_pointer_varname,	1);
  {
    mmux_libc_servent_t *	ptr = calloc(1, sizeof(mmux_libc_servent_t));

    return mmux_pointer_bind_to_bash_variable(servent_pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SERVENT_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_SERVENT_SETTER_GETTER]]],
  [[[DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_servent_t,[[[$1]]],[[[$2]]],[[[$3]]])]]])

DEFINE_SERVENT_SETTER_GETTER([[[s_name]]],	[[[asciizp]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_SERVENT_SETTER_GETTER([[[s_aliases]]],	[[[asciizpp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_SERVENT_SETTER_GETTER([[[s_port]]],	[[[sint]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_SERVENT_SETTER_GETTER([[[s_proto]]],	[[[asciizp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[servent]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_protoent_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_protoent_calloc]]])
{
  mmux_asciizcp_t		protoent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protoent_pointer_varname,	1);
  {
    mmux_libc_protoent_t *	ptr = calloc(1, sizeof(mmux_libc_protoent_t));

    return mmux_pointer_bind_to_bash_variable(protoent_pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PROTOENT_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_PROTOENT_SETTER_GETTER]]],
  [[[DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_protoent_t,[[[$1]]],[[[$2]]],[[[$3]]])]]])

DEFINE_PROTOENT_SETTER_GETTER([[[p_name]]],	[[[asciizp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_PROTOENT_SETTER_GETTER([[[p_aliases]]],	[[[asciizpp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_PROTOENT_SETTER_GETTER([[[p_proto]]],	[[[sint]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])

/* ------------------------------------------------------------------ */

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[protoent]]])


/** --------------------------------------------------------------------
 ** Sockets: mmux_libc_netent_t.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_netent_calloc]]])
{
  mmux_asciizcp_t		netent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(netent_pointer_varname,	1);
  {
    mmux_libc_netent_t *	ptr = calloc(1, sizeof(mmux_libc_netent_t));

    return mmux_pointer_bind_to_bash_variable(netent_pointer_varname, ptr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETENT_POINTER_VAR"]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_NETENT_SETTER_GETTER]]],
  [[[DEFINE_MMUX_LIBC_STRUCT_SETTER_AND_GETTER(mmux_libc_netent_t,[[[$1]]],[[[$2]]],[[[$3]]])]]])

DEFINE_NETENT_SETTER_GETTER([[[n_name]]],	[[[asciizp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_NETENT_SETTER_GETTER([[[n_aliases]]],	[[[asciizpp]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER]]])
DEFINE_NETENT_SETTER_GETTER([[[n_addrtype]]],	[[[sint]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT]]])
DEFINE_NETENT_SETTER_GETTER([[[n_net]]],	[[[ulong]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARGNUM_ULONG]]])

DEFINE_MMUX_LIBC_STRUCT_DUMPER([[[netent]]])


/** --------------------------------------------------------------------
 ** Sockets: byte order.
 ** ----------------------------------------------------------------- */

/* Host-to-network short int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_htons]]])
{
  mmux_asciizcp_t	network_byteorder_number_varname;
  mmux_uint16_t		host_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(network_byteorder_number_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT16(host_byteorder_number,			2);
  {
    mmux_uint16_t	network_byteorder_number;

    MMUX_LIBC_FUNCALL(mmux_libc_htons(&network_byteorder_number, host_byteorder_number));
    return mmux_uint16_bind_to_bash_variable(network_byteorder_number_varname, network_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_NUMBER_VAR HOST_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-host short int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ntohs]]])
{
  mmux_asciizcp_t	host_byteorder_number_varname;
  mmux_uint16_t		network_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(host_byteorder_number_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT16(network_byteorder_number,		2);
  {
    mmux_uint16_t	host_byteorder_number;

    MMUX_LIBC_FUNCALL(mmux_libc_ntohs(&host_byteorder_number, network_byteorder_number));
    return mmux_uint16_bind_to_bash_variable(host_byteorder_number_varname, host_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_NUMBER_VAR NETWORK_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Host-to-network long int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_htonl]]])
{
  mmux_asciizcp_t	network_byteorder_number_varname;
  mmux_uint32_t		host_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(network_byteorder_number_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32(host_byteorder_number,			2);
  {
    mmux_uint32_t	network_byteorder_number;

    MMUX_LIBC_FUNCALL(mmux_libc_htonl(&network_byteorder_number, host_byteorder_number));
    return mmux_uint32_bind_to_bash_variable(network_byteorder_number_varname, network_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETWORK_BYTEORDER_NUMBER_VAR HOST_BYTEORDER_NUMBER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-host long int. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_ntohl]]])
{
  mmux_asciizcp_t	host_byteorder_number_varname;
  mmux_uint32_t		network_byteorder_number;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(host_byteorder_number_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32(network_byteorder_number,		2);
  {
    mmux_uint32_t	host_byteorder_number;

    MMUX_LIBC_FUNCALL(mmux_libc_ntohl(&host_byteorder_number, network_byteorder_number));
    return mmux_uint32_bind_to_bash_variable(host_byteorder_number_varname, host_byteorder_number, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOST_BYTEORDER_NUMBER_VAR NETWORK_BYTEORDER_NUMBER"]]])


/** --------------------------------------------------------------------
 ** Sockets: host address conversion.
 ** ----------------------------------------------------------------- */

/* ASCII presentation-to-network */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_aton]]])
{
  mmux_asciizcp_t		ouput_addr_varname;
  mmux_asciizcp_t		input_presentation_addr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ouput_addr_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(input_presentation_addr,	2);
  {
    mmux_libc_in_addr_t		ouput_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_aton(&ouput_addr, input_presentation_addr));
    return mmux_libc_in_addr_bind_to_bash_variable(ouput_addr_varname, ouput_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Network to ASCII. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_ntoa]]])
{
  mmux_asciizcp_t	presentation_addr_varname;
  mmux_libc_in_addr_t	addr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(presentation_addr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR(addr,				2);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK		64
    char	presentation_addr[IS_THIS_ENOUGH_QUESTION_MARK];

    MMUX_LIBC_FUNCALL(mmux_libc_inet_ntoa(presentation_addr, IS_THIS_ENOUGH_QUESTION_MARK, &addr));
    return mmux_string_bind_to_bash_variable(presentation_addr_varname, presentation_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCII_IN_ADDR_VAR IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_addr]]])
{
  mmux_asciizcp_t		in_addr_varname;
  mmux_asciizcp_t		presentation_in_addr_p;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(in_addr_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(presentation_in_addr_p,	2);
  {
    mmux_libc_in_addr_t		in_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_addr(&in_addr, presentation_in_addr_p));
    return mmux_libc_in_addr_bind_to_bash_variable(in_addr_varname, in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_network]]])
{
  mmux_asciizcp_t		in_addr_varname;
  mmux_asciizcp_t		presentation_in_addr_p;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(in_addr_varname,		1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(presentation_in_addr_p,	2);
  {
    mmux_libc_in_addr_t		in_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_network(&in_addr, presentation_in_addr_p));
    return mmux_libc_in_addr_bind_to_bash_variable(in_addr_varname, in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IN_ADDR_VAR ASCII_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_makeaddr]]])
{
  mmux_asciizcp_t	in_addr_varname;
  mmux_libc_in_addr_t	net_in_addr;
  mmux_libc_in_addr_t	local_in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(in_addr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR(net_in_addr,		2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR(local_in_addr,		3);
  {
    mmux_libc_in_addr_t		in_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_makeaddr(&in_addr, &net_in_addr, &local_in_addr));
    return mmux_libc_in_addr_bind_to_bash_variable(in_addr_varname, in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ASCII_IN_ADDR_VAR UINT32_NET_IN_ADDR UINT32_LOCAL_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Local network address of. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_lnaof]]])
{
  mmux_asciizcp_t	local_in_addr_varname;
  mmux_libc_in_addr_t	in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(local_in_addr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR(in_addr,			2);
  {
    mmux_libc_in_addr_t		local_in_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_lnaof(&local_in_addr, &in_addr));
    return mmux_libc_in_addr_bind_to_bash_variable(local_in_addr_varname, local_in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UINT32_LOCAL_IN_ADDR_VAR UINT32_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* network part address of. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_netof]]])
{
  mmux_asciizcp_t	net_in_addr_varname;
  mmux_libc_in_addr_t	in_addr;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(net_in_addr_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_IN_ADDR(in_addr,		2);
  {
    mmux_libc_in_addr_t		net_in_addr;

    MMUX_LIBC_FUNCALL(mmux_libc_inet_netof(&net_in_addr, &in_addr));
    return mmux_libc_in_addr_bind_to_bash_variable(net_in_addr_varname, net_in_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER UINT32_NET_IN_ADDR_VAR UINT32_IN_ADDR"]]])

/* ------------------------------------------------------------------ */

/* Presentation-to-network. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_pton]]])
{
  mmux_sint_t		af_type;
  mmux_asciizcp_t	input_presentation_addr;
  mmux_pointer_t	ouput_addr_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(af_type,				1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(input_presentation_addr,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(ouput_addr_pointer,		3);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_inet_pton(ouput_addr_pointer, af_type, input_presentation_addr));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AF_TYPE ASCII_ADDR ADDR_POINTER"]]])

/* ------------------------------------------------------------------ */

/* Network-to-presentation. */
MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_inet_ntop]]])
{
  mmux_sint_t		af_type;
  mmux_pointer_t	input_addr_pointer;
  mmux_asciizcp_t	ouput_presentation_addr_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(af_type,					1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(input_addr_pointer,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ouput_presentation_addr_varname,	3);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK	512
    char	ouput_presentation_addr[IS_THIS_ENOUGH_QUESTION_MARK];

    MMUX_LIBC_FUNCALL(mmux_libc_inet_ntop(ouput_presentation_addr, IS_THIS_ENOUGH_QUESTION_MARK,
					  af_type, input_addr_pointer));

    return mmux_string_bind_to_bash_variable(ouput_presentation_addr_varname, ouput_presentation_addr, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER AF_TYPE ASCII_ADDR ADDR_POINTER"]]])


/** --------------------------------------------------------------------
 ** Sockets: getaddrinfo, freeaddrinfo, getnameinfo.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getaddrinfo]]])
{
  mmux_asciizcp_t		node;
  mmux_asciizcp_t		service;
  mmux_libc_addrinfo_ptr_t	hints_pointer;
  mmux_asciizcp_t		addrinfo_linked_list_varname;

  if (IS_POINTER_REPRESENTATION(argv[1])) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(node,		1);
  } else {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(node,		1);
  }
  if (IS_POINTER_REPRESENTATION(argv[2])) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(service,	2);
  } else {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(service,		2);
  }
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(hints_pointer,			3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addrinfo_linked_list_varname,	4);
  {
    if (0 == strlen(node))    { node    = NULL; }
    if (0 == strlen(service)) { service = NULL; }
    {
      mmux_libc_addrinfo_ptr_t	addrinfo_linked_list;
      mmux_sint_t		error_code;

      if (false == mmux_libc_getaddrinfo(&addrinfo_linked_list, &error_code,
					 node, service, hints_pointer)) {
	return mmux_pointer_bind_to_bash_variable(addrinfo_linked_list_varname, addrinfo_linked_list, MMUX_BASH_BUILTIN_STRING_NAME);
      } else {
	mmux_asciizcp_t		error_message;
	mmux_bash_rv_t		brv;

	MMUX_LIBC_FUNCALL(mmux_libc_gai_strerror(&error_message, error_code));

	brv = mmux_sint_bind_to_bash_variable("GAI_ERRNUM", error_code, MMUX_BASH_BUILTIN_STRING_NAME);
	if (MMUX_SUCCESS != brv) { return brv; }

	return mmux_string_bind_to_bash_variable("GAI_ERRMSG", error_message, MMUX_BASH_BUILTIN_STRING_NAME);
      }
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NODE SERVICE HINTS_ADDRINFO_POINTER ADDRINFO_LINKED_LIST_VARNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_freeaddrinfo]]])
{
  mmux_pointer_t	addrinfo_pointer;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addrinfo_pointer,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_freeaddrinfo(addrinfo_pointer));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER ADDRINFO_POINTER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getnameinfo]]])
{
  mmux_libc_sockaddr_ptr_t	sockaddr_pointer;
  mmux_socklen_t		socklen;
  mmux_asciizcp_t		host_varname;
  mmux_asciizcp_t		serv_varname;
  mmux_sint_t			flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_TYPED_POINTER(sockaddr_pointer,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(socklen,			2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(host_varname,		3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(serv_varname,		4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,				5);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK	512
    char		host[IS_THIS_ENOUGH_QUESTION_MARK];
    char		serv[IS_THIS_ENOUGH_QUESTION_MARK];
    mmux_sint_t		error_code;

    if (false == mmux_libc_getnameinfo(host, IS_THIS_ENOUGH_QUESTION_MARK,
				       serv, IS_THIS_ENOUGH_QUESTION_MARK,
				       &error_code,
				       sockaddr_pointer, socklen, flags)) {
      mmux_bash_rv_t	brv;

      brv = mmux_string_bind_to_bash_variable(host_varname, host, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { return brv; }

      return mmux_string_bind_to_bash_variable(serv_varname, serv, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_asciizcp_t		error_message;
      mmux_bash_rv_t		brv;

      MMUX_LIBC_FUNCALL(mmux_libc_gai_strerror(&error_message, error_code));

      brv = mmux_sint_bind_to_bash_variable("GAI_ERRNUM", error_code, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { return brv; }

      return mmux_string_bind_to_bash_variable("GAI_ERRMSG", error_message, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKADDR_PTR SOCKADDR_LEN HOST_VAR SERV_VAR FLAGS"]]])


/** --------------------------------------------------------------------
 ** Sockets: hosts database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sethostent]]])
{
  mmux_sint_t		stayopen;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(stayopen,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_sethostent(stayopen));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAYOPEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endhostent]]])
{
  MMUX_LIBC_FUNCALL(mmux_libc_endhostent());
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_gethostent]]])
{
  mmux_asciizcp_t		hostent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(hostent_pointer_varname,	1);
  {
    mmux_libc_hostent_t const *	hostent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_gethostent(&hostent_p));
    return mmux_pointer_bind_to_bash_variable(hostent_pointer_varname, (mmux_pointer_t)hostent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER HOSTENT_PTR_VAR"]]])


/** --------------------------------------------------------------------
 ** Sockets: services database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setservent]]])
{
  mmux_sint_t		stayopen;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(stayopen,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setservent(stayopen));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAYOPEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endservent]]])
{
  MMUX_LIBC_FUNCALL(mmux_libc_endservent());
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getservent]]])
{
  mmux_asciizcp_t		servent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(servent_pointer_varname,	1);
  {
    mmux_libc_servent_t const *	servent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getservent(&servent_p));
    return mmux_pointer_bind_to_bash_variable(servent_pointer_varname, (mmux_pointer_t)servent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SERVENT_PTR_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getservbyname]]])
{
  mmux_asciizcp_t	servent_pointer_varname;
  mmux_asciizcp_t	service_name_p;
  mmux_asciizcp_t	protocol_name_p = NULL;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(servent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(service_name_p,		2);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protocol_name_p,		3);
  }
  {
    mmux_libc_servent_t const *	servent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getservbyname(&servent_p, service_name_p, protocol_name_p));
    return mmux_pointer_bind_to_bash_variable(servent_pointer_varname, (mmux_pointer_t)servent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SERVENT_PTR_VAR NAME [PROTO]"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getservbyport]]])
{
  mmux_asciizcp_t	servent_pointer_varname;
  mmux_sint_t		port;
  mmux_asciizcp_t	protocol_name_p = NULL;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(servent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(port,				2);
  if (4 == argc) {
    MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protocol_name_p,		3);
  }
  {
    mmux_libc_servent_t const *	servent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getservbyport(&servent_p, port, protocol_name_p));
    return mmux_pointer_bind_to_bash_variable(servent_pointer_varname, (mmux_pointer_t)servent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[((3 == argc) || (4 == argc))]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SERVENT_PTR_VAR PORT [PROTO]"]]])


/** --------------------------------------------------------------------
 ** Sockets: protocols database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setprotoent]]])
{
  mmux_sint_t		stayopen;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(stayopen,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setprotoent(stayopen));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAYOPEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endprotoent]]])
{
  MMUX_LIBC_FUNCALL(mmux_libc_endprotoent());
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getprotoent]]])
{
  mmux_asciizcp_t		protoent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protoent_pointer_varname,	1);
  {
    mmux_libc_protoent_t const *	protoent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getprotoent(&protoent_p));
    return mmux_pointer_bind_to_bash_variable(protoent_pointer_varname, (mmux_pointer_t)protoent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PROTOENT_PTR_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getprotobyname]]])
{
  mmux_asciizcp_t	protoent_pointer_varname;
  mmux_asciizcp_t	protocol_name_p;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protoent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protocol_name_p,		2);
  {
    mmux_libc_protoent_t const *	protoent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getprotobyname(&protoent_p, protocol_name_p));
    return mmux_pointer_bind_to_bash_variable(protoent_pointer_varname, (mmux_pointer_t)protoent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PROTOENT_PTR_VAR NAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getprotobynumber]]])
{
  mmux_asciizcp_t	protoent_pointer_varname;
  mmux_sint_t		proto;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(protoent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(proto,				2);
  {
    mmux_libc_protoent_t const *	protoent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getprotobynumber(&protoent_p, proto));
    return mmux_pointer_bind_to_bash_variable(protoent_pointer_varname, (mmux_pointer_t)protoent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER PROTOENT_PTR_VAR NUMBER"]]])


/** --------------------------------------------------------------------
 ** Sockets: networks database.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_setnetent]]])
{
  mmux_sint_t		stayopen;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(stayopen,	1);
  {
    MMUX_LIBC_FUNCALL(mmux_libc_setnetent(stayopen));
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STAYOPEN"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_endnetent]]])
{
  MMUX_LIBC_FUNCALL(mmux_libc_endnetent());
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getnetent]]])
{
  mmux_asciizcp_t		netent_pointer_varname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(netent_pointer_varname,	1);
  {
    mmux_libc_netent_t const *	netent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getnetent(&netent_p));
    return mmux_pointer_bind_to_bash_variable(netent_pointer_varname, (mmux_pointer_t)netent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETENT_PTR_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getnetbyname]]])
{
  mmux_asciizcp_t	netent_pointer_varname;
  mmux_asciizcp_t	network_name_p;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(netent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(network_name_p,		2);
  {
    mmux_libc_netent_t const *	netent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getnetbyname(&netent_p, network_name_p));
    return mmux_pointer_bind_to_bash_variable(netent_pointer_varname, (mmux_pointer_t)netent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETENT_PTR_VAR NAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getnetbyaddr]]])
{
  mmux_asciizcp_t	netent_pointer_varname;
  /* This value is homogeneous to the values of the field "n_net" of "struct netent":
     the network address in host byteorder.  */
  mmux_uint32_t		host_byteorder_network_number;
  mmux_sint_t		af_type;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(netent_pointer_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT32(host_byteorder_network_number,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(af_type,				3);
  {
    mmux_libc_netent_t const *	netent_p;

    MMUX_LIBC_FUNCALL(mmux_libc_getnetbyaddr(&netent_p, host_byteorder_network_number, af_type));
    return mmux_pointer_bind_to_bash_variable(netent_pointer_varname, (mmux_pointer_t)netent_p, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NETENT_PTR_VAR UINT32_NET SINT_TYPE"]]])


/** --------------------------------------------------------------------
 ** Sockets: interface naming.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_if_nametoindex]]])
{
  mmux_asciizcp_t		ifindex_varname;
  mmux_asciizcp_t		ifname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ifindex_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ifname,	2);
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
  mmux_asciizcp_t		ifname_varname;
  mmux_uint_t		ifindex;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(ifname_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_UINT(ifindex,	2);
  {
    char	buffer[IFNAMSIZ];
    char *	rv = if_indextoname(ifindex, buffer);

    if (NULL == rv) {
      return MMUX_FAILURE;
    } else {
      return mmux_string_bind_to_bash_variable(ifname_varname, buffer, MMUX_BASH_BUILTIN_STRING_NAME);
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER IFINDEX_VAR IFNAME"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_if_nameindex_to_array]]])
{
  mmux_asciizcp_t		index_array_name;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(index_array_name,	1);
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
  mmux_asciizcp_t	sock_varname;
  mmux_sint_t	namespace, style, protocol;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sock_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(namespace,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(style,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(protocol,	4);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK_VAR NAMESPACE STYLE PROTOCOL"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_shutdown]]])
{
  mmux_sint_t		sock, how;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(how,	2);
  {
    int		rv = shutdown(sock, how);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK HOW"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_socketpair]]])
{
  mmux_asciizcp_t	sock_varname1;
  mmux_asciizcp_t	sock_varname2;
  mmux_sint_t	namespace, style, protocol;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sock_varname1,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(sock_varname2,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(namespace,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(style,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(protocol,	5);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD1_VAR SOCKFD2_VAR PF_NAMESPACE SOCK_STYLE IPPROTO_PROTOCOL"]]])


/** --------------------------------------------------------------------
 ** Sockets: stream client.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_connect]]])
{
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_usize_t		sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addr_pointer,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(sockaddr_length,	3);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    int			rv = connect(sock, sockaddr_pointer, sockaddr_length);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      if (0) { fprintf(stderr, "%s: error %s\n", __func__, strerror(errno)); }
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCK SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getpeername]]])
{
  mmux_sint_t		sock;
  mmux_asciizcp_t		addr_pointer_var;
  mmux_asciizcp_t		addr_length_var;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addr_pointer_var,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addr_length_var,	3);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK		1024
    mmux_socklen_t	addr_length = IS_THIS_ENOUGH_QUESTION_MARK;
    mmux_uint8_t	buffer[addr_length];
    struct sockaddr *	addr = (struct sockaddr *)buffer;
    int			rv   = getpeername(sock, addr, &addr_length);

    if (0 == rv) {
      struct sockaddr *	sockaddr_pointer = calloc(1, addr_length);

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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD SOCKADDR_POINTER_VAR SOCKADDR_LENGTH_VAR"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getsockname]]])
{
  mmux_sint_t		sock;
  mmux_asciizcp_t		addr_pointer_var;
  mmux_asciizcp_t		addr_length_var;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addr_pointer_var,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(addr_length_var,	3);
  {
#undef  IS_THIS_ENOUGH_QUESTION_MARK
#define IS_THIS_ENOUGH_QUESTION_MARK		1024
    mmux_socklen_t	addr_length = IS_THIS_ENOUGH_QUESTION_MARK;
    mmux_uint8_t	buffer[addr_length];
    struct sockaddr *	addr = (struct sockaddr *)buffer;
    int			rv   = getsockname(sock, addr, &addr_length);

    if (0 == rv) {
      struct sockaddr *	sockaddr_pointer = calloc(1, addr_length);

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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD SOCKADDR_POINTER_VAR SOCKADDR_LENGTH_VAR"]]])


/** --------------------------------------------------------------------
 ** Sockets: stream server.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_bind]]])
{
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_socklen_t	addr_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addr_pointer,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(addr_length,	3);
  {
    struct sockaddr *	sockaddr_pointer = addr_pointer;
    int			rv               = bind(sock, sockaddr_pointer, addr_length);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      if (0) { fprintf(stderr, "%s: error binding %s\n", __func__, strerror(errno)); }
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_listen]]])
{
  mmux_sint_t		sock, N;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(N,	2);
  {
    int		rv = listen(sock, N);

    if (0 == rv) {
      return MMUX_SUCCESS;
    } else {
      if (0) { fprintf(stderr, "%s: error %s\n", __func__, strerror(errno)); }
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER SOCKFD N"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_accept]]])
{
  mmux_asciizcp_t		connected_sock_varname;
  mmux_asciizcp_t		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_socklen_t	allocated_sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(connected_sock_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(connected_sockaddr_length_varname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addr_pointer,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(allocated_sockaddr_length,	5);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CONNECTED_SOCK_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_accept4]]])
{
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_ACCEPT4]]],[[[
  mmux_asciizcp_t		connected_sock_varname;
  mmux_asciizcp_t		connected_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	addr_pointer;
  mmux_socklen_t	allocated_sockaddr_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(connected_sock_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(connected_sockaddr_length_varname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addr_pointer,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(allocated_sockaddr_length,	5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	6);
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
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language function not available.\n",
	  MMUX_BASH_BUILTIN_STRING_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(7 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER CONNECTED_SOCK_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH FLAGS"]]])


/** --------------------------------------------------------------------
 ** Sockets: sending and receiving.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_send]]])
{
  mmux_asciizcp_t		number_of_bytes_sent_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(number_of_bytes_sent_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(buffer_length,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	5);
  {
    mmux_ssize_t	number_of_bytes_sent = send(sock, buffer_pointer, buffer_length, flags);

    if (-1 != number_of_bytes_sent) {
      return mmux_ssize_bind_to_bash_variable(number_of_bytes_sent_varname, number_of_bytes_sent, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_SENT_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_recv]]])
{
  mmux_asciizcp_t		number_of_bytes_received_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(number_of_bytes_received_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(buffer_length,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	5);
  {
    mmux_ssize_t	number_of_bytes_received = recv(sock, buffer_pointer, buffer_length, flags);

    if (-1 != number_of_bytes_received) {
      return mmux_ssize_bind_to_bash_variable(number_of_bytes_received_varname, number_of_bytes_received, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_RECEIVED_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_sendto]]])
{
  mmux_asciizcp_t		number_of_bytes_sent_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;
  mmux_pointer_t	addr_pointer;
  mmux_socklen_t	sockaddr_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(number_of_bytes_sent_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer_pointer,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(buffer_length,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(addr_pointer,	6);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(sockaddr_length,	7);
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
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(8 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_SENT_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS SOCKADDR_POINTER SOCKADDR_LENGTH"]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_recvfrom]]])
{
  mmux_asciizcp_t		number_of_bytes_received_varname;
  mmux_asciizcp_t		peer_sockaddr_length_varname;
  mmux_sint_t		sock;
  mmux_pointer_t	buffer_pointer;
  mmux_usize_t		buffer_length;
  mmux_sint_t		flags;
  mmux_pointer_t	_peer_sockaddr_pointer;
  mmux_socklen_t	peer_sockaddr_allocated_length;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(number_of_bytes_received_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(peer_sockaddr_length_varname,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(buffer_pointer,	4);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(buffer_length,	5);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(flags,	6);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_POINTER(_peer_sockaddr_pointer,	7);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SOCKLEN(peer_sockaddr_allocated_length,	8);
  {
    struct sockaddr *	peer_sockaddr_pointer     = _peer_sockaddr_pointer;
    mmux_socklen_t	peer_sockaddr_length      = peer_sockaddr_allocated_length;
    mmux_ssize_t	number_of_bytes_received  = recvfrom(sock, buffer_pointer, buffer_length, flags,
							     peer_sockaddr_pointer, &peer_sockaddr_length);

    if (-1 != number_of_bytes_received) {
      mmux_bash_rv_t	brv;

      brv =  mmux_ssize_bind_to_bash_variable(number_of_bytes_received_varname, number_of_bytes_received, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      brv = mmux_socklen_bind_to_bash_variable(peer_sockaddr_length_varname, peer_sockaddr_length, MMUX_BASH_BUILTIN_STRING_NAME);
      if (MMUX_SUCCESS != brv) { goto error_binding_variables; }

      return brv;

    error_binding_variables:
      return brv;
    } else {
      mmux_bash_pointers_consume_errno(MMUX_BASH_BUILTIN_STRING_NAME);
      return MMUX_FAILURE;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(9 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER NUMBER_OF_BYTES_RECEIVED_VAR CONNECTED_SOCKADDR_LENGTH_VAR SOCK BUFFER_POINTER BUFFER_LENGTH FLAGS SOCKADDR_POINTER ALLOCATED_SOCKADDR_LENGTH"]]])


/** --------------------------------------------------------------------
 ** Sockets: options.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mmux_libc_getsockopt]]])
{
  mmux_asciizcp_t		option_value_varname;
  mmux_sint_t		sock;
  mmux_sint_t		level;
  mmux_sint_t		optname;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(option_value_varname,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(level,	3);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(optname,	4);
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

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(sock,	1);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(level,	2);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(optname,	3);
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

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_SINT(optval,	4);
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

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_USIZE(optval,	4);
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
	mmux_asciizcp_t	option_value_array_varname;

	MMUX_BASH_PARSE_BUILTIN_ARGNUM_BASH_PARM(option_value_array_varname,	4);
	{
	    mmux_bash_assoc_array_variable_t	assoc_array_variable;
	    mmux_asciizcp_t			assoc_array_value;
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
    brv = mmux_bash_create_global_sint_variable("mmux_libc_in_addr_SIZEOF",  sizeof(mmux_libc_in_addr_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_insix_addr_SIZEOF",  sizeof(mmux_libc_insix_addr_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_in_SIZEOF",  sizeof(mmux_libc_sockaddr_in_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_insix_SIZEOF",  sizeof(mmux_libc_sockaddr_insix_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_sockaddr_un_SIZEOF",  sizeof(mmux_libc_sockaddr_un_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_addrinfo_SIZEOF", sizeof(mmux_libc_addrinfo_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_hostent_SIZEOF", sizeof(mmux_libc_hostent_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_servent_SIZEOF", sizeof(mmux_libc_servent_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_protoent_SIZEOF", sizeof(mmux_libc_protoent_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    brv = mmux_bash_create_global_sint_variable("mmux_libc_netent_SIZEOF", sizeof(mmux_libc_netent_t), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }
  }

  {
    static mmux_libc_insix_addr_t	insix_addr_loopback;
    static mmux_libc_insix_addr_t	insix_addr_any;

    MMUX_LIBC_FUNCALL(mmux_libc_make_insix_addr_loopback(&insix_addr_loopback));
    brv = mmux_pointer_bind_to_bash_variable("mmux_libc_insixaddr_loopback_pointer", (mmux_pointer_t)&(insix_addr_loopback), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }

    MMUX_LIBC_FUNCALL(mmux_libc_make_insix_addr_any(&insix_addr_any));
    brv = mmux_pointer_bind_to_bash_variable("mmux_libc_insixaddr_any_pointer", (mmux_pointer_t)&(insix_addr_loopback), NULL);
    if (MMUX_SUCCESS != brv) { return brv; }
  }

  return MMUX_SUCCESS;
}

/* end of file */
