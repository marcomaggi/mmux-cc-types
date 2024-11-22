#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for socketa builtins
#!# Date: Nov 18, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/sockets.test ; less tests/sockets.log
#!#
#!#	that will select these tests.
#!#
#!# Copyright (c) 2024 Marco Maggi
#!# <mrc.mgg@gmail.com>
#!#
#!# This program is free  software: you can redistribute it and/or modify it  under the terms of the
#!# GNU General Public License as published by the Free Software Foundation, either version 3 of the
#!# License, or (at your option) any later version.
#!#
#!# This program  is distributed  in the  hope that  it will  be useful,  but WITHOUT  ANY WARRANTY;
#!# without even the implied  warranty of MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See
#!# the GNU General Public License for more details.
#!#
#!# You should have received  a copy of the GNU General Public License  along with this program.  If
#!# not, see <http://www.gnu.org/licenses/>.
#!#


#### macros

MBFL_DEFINE_SPECIAL_MACROS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


#### if_nameindex

function sockets-if_nameindex-1.1 () {
    mbfl_location_enter
    {
	declare -a ARRY

	dotest-unset-debug
	mbfl_location_leave_when_failure( mmux_libc_if_nameindex_to_array ARRY )
	#mbfl_array_dump ARRY
    }
    mbfl_location_leave
}


#### if_nametoindex

function sockets-if_nametoindex-1.1 () {
    mbfl_location_enter
    {
	declare INDEX

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_if_nametoindex INDEX 'lo' )
	dotest-equal 1 RR(INDEX)
    }
    mbfl_location_leave
}


#### if_indextoname

function sockets-if_indextoname-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare NAME

	mbfl_location_leave_when_failure( mmux_libc_if_indextoname NAME '1' )
	dotest-debug NAME=WW(NAME)
	dotest-equal 'lo' WW(NAME)
    }
    mbfl_location_leave
}


#### struct sockaddr_un

function sockets-struct-sockaddr_un-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r FAMILY=RR(mmux_libc_AF_LOCAL) PATHNAME='/tmp/sock.ext'
	declare SOCKADDR_UN SOCKADDR_UN_LENGTH SUN_FAMILY SUN_PATH

	mbfl_location_compensate( mmux_libc_sockaddr_un_malloc SOCKADDR_UN SOCKADDR_UN_LENGTH RR(FAMILY) WW(PATHNAME),
				  mmux_libc_free RR(SOCKADDR_UN) )
	mbfl_location_leave_when_failure( mmux_libc_sockaddr_un_sun_family_ref SUN_FAMILY RR(SOCKADDR_UN) )
	mbfl_location_leave_when_failure( mmux_libc_sockaddr_un_sun_path_ref   SUN_PATH   RR(SOCKADDR_UN) )

	dotest-debug SOCKADDR_UN_LENGTH=RR(SOCKADDR_UN_LENGTH)
	dotest-debug ,WW(SUN_FAMILY),WW(SUN_PATH), ${#SUN_PATH} ${#PATHNAME}

	dotest-equal RR(FAMILY) WW(SUN_FAMILY) &&
	    dotest-equal WW(PATHNAME) WW(SUN_PATH)
    }
    mbfl_location_leave
}
function sockets-struct-sockaddr_un-1.2 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r FAMILY=RR(mmux_libc_AF_LOCAL) PATHNAME='/tmp/sock.ext'
	declare SOCKADDR_UN SOCKADDR_UN_LENGTH SUN_FAMILY SUN_PATH
	declare SA_FAMILY

	mbfl_location_compensate( mmux_libc_sockaddr_un_malloc SOCKADDR_UN SOCKADDR_UN_LENGTH RR(FAMILY) WW(PATHNAME),
				  mmux_libc_free RR(SOCKADDR_UN) )
	mbfl_location_leave_when_failure( mmux_libc_sockaddr_un_sun_family_ref SUN_FAMILY RR(SOCKADDR_UN) )
	mbfl_location_leave_when_failure( mmux_libc_sockaddr_un_sun_path_ref   SUN_PATH   RR(SOCKADDR_UN) )
	mbfl_location_leave_when_failure( mmux_libc_sockaddr_sa_family_ref     SA_FAMILY  RR(SOCKADDR_UN) )

	dotest-debug ,WW(SUN_FAMILY),WW(SUN_PATH), ${#SUN_PATH} ${#PATHNAME}

	dotest-equal RR(FAMILY) WW(SA_FAMILY) &&
	dotest-equal RR(FAMILY) WW(SUN_FAMILY) &&
	    dotest-equal WW(PATHNAME) WW(SUN_PATH)
    }
    mbfl_location_leave
}


#### struct sockaddr_in

function sockets-struct-sockaddr_in-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_SIN_ADDR='1.2.3.4'

	declare SOCKADDR_IN_POINTER
	declare -r INPUT_SIN_FAMILY=RR(mmux_libc_AF_INET)
	declare SIN_ADDR_POINTER
	declare -r INPUT_HOST_BYTEORDER_SIN_PORT=8080

	declare OUTPUT_SIN_FAMILY
	declare OUTPUT_HOST_BYTEORDER_SIN_ADDR
	declare OUTPUT_HOST_BYTEORDER_SIN_PORT
	declare OUTPUT_ASCII_SIN_ADDR

	dotest-debug INPUT_SIN_FAMILY=WW(INPUT_SIN_FAMILY)
	dotest-debug INPUT_HOST_BYTEORDER_SIN_PORT=WW(INPUT_HOST_BYTEORDER_SIN_PORT)

	mbfl_location_compensate( mmux_libc_sockaddr_in_malloc SOCKADDR_IN_POINTER \
							       RR(INPUT_SIN_FAMILY) \
							       IN_ADDR_POINTER \
							       RR(INPUT_HOST_BYTEORDER_SIN_PORT),
				  mmux_libc_free RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_inet_pton RR(mmux_libc_AF_INET) WW(INPUT_ASCII_SIN_ADDR) RR(IN_ADDR_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_sin_family_ref OUTPUT_SIN_FAMILY              RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_addr_ref   OUTPUT_HOST_BYTEORDER_SIN_ADDR RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_port_ref   OUTPUT_HOST_BYTEORDER_SIN_PORT RR(SOCKADDR_IN_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_inet_ntop RR(mmux_libc_AF_INET) WW(IN_ADDR_POINTER) OUTPUT_ASCII_SIN_ADDR )

	dotest-debug OUTPUT_SIN_FAMILY=WW(OUTPUT_SIN_FAMILY)
	dotest-debug OUTPUT_ASCII_SIN_ADDR=WW(OUTPUT_ASCII_SIN_ADDR)
	dotest-debug OUTPUT_HOST_BYTEORDER_SIN_PORT=WW(OUTPUT_HOST_BYTEORDER_SIN_PORT)

	dotest-equal RR(INPUT_SIN_FAMILY) WW(OUTPUT_SIN_FAMILY) &&
	    dotest-equal RR(INPUT_ASCII_SIN_ADDR) RR(OUTPUT_ASCII_SIN_ADDR) &&
	    dotest-equal RR(INPUT_HOST_BYTEORDER_SIN_PORT) RR(OUTPUT_HOST_BYTEORDER_SIN_PORT)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in-sin_family-1.1 () {
    declare SOCKADDR_IN_POINTER
    declare -r INPUT_SIN_FAMILY=RR(mmux_libc_AF_INET)
    declare    OUPUT_SIN_FAMILY

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN_POINTER 1 RR(mmux_libc_sockaddr_in_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_family_set RR(SOCKADDR_IN_POINTER) RR(INPUT_SIN_FAMILY) )
	mbfl_location_leave_when_failure( mmux_libc_sin_family_ref OUPUT_SIN_FAMILY        RR(SOCKADDR_IN_POINTER) )
	dotest-equal RR(INPUT_SIN_FAMILY) RR(OUPUT_SIN_FAMILY)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in-sin_addr-1.1 () {
    declare SOCKADDR_IN_POINTER
    declare -r INPUT_SIN_ADDR=RR(mmux_libc_INADDR_LOOPBACK)
    declare    OUPUT_SIN_ADDR

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN_POINTER 1 RR(mmux_libc_sockaddr_in_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_addr_set RR(SOCKADDR_IN_POINTER) RR(INPUT_SIN_ADDR) )
	mbfl_location_leave_when_failure( mmux_libc_sin_addr_ref OUPUT_SIN_ADDR RR(SOCKADDR_IN_POINTER) )
	dotest-equal RR(INPUT_SIN_ADDR) RR(OUPUT_SIN_ADDR)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in-sin_addr-pointer-1.1 () {
    declare SOCKADDR_IN_POINTER SIN_ADDR_POINTER
    declare -r INPUT_SIN_ADDR=RR(mmux_libc_INADDR_LOOPBACK)
    declare    OUPUT_SIN_ADDR

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN_POINTER 1 RR(mmux_libc_sockaddr_in_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_addr_pointer_ref SIN_ADDR_POINTER RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_uint32_pointer_set RR(SIN_ADDR_POINTER) 0 RR(INPUT_SIN_ADDR) )
	mbfl_location_leave_when_failure( mmux_uint32_pointer_ref OUPUT_SIN_ADDR RR(SIN_ADDR_POINTER) 0 )
	dotest-equal RR(INPUT_SIN_ADDR) RR(OUPUT_SIN_ADDR)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in-sin_port-1.1 () {
    declare SOCKADDR_IN_POINTER
    declare -r INPUT_SIN_PORT=8080
    declare    OUPUT_SIN_PORT

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN_POINTER 1 RR(mmux_libc_sockaddr_in_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin_port_set RR(SOCKADDR_IN_POINTER) RR(INPUT_SIN_PORT) )
	mbfl_location_leave_when_failure( mmux_libc_sin_port_ref OUPUT_SIN_PORT        RR(SOCKADDR_IN_POINTER) )
	dotest-equal RR(INPUT_SIN_PORT) RR(OUPUT_SIN_PORT)
    }
    mbfl_location_leave
}


#### struct sockaddr_in6

function sockets-struct-sockaddr_in6-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_SIN6_ADDR='1:2:3:4:5:6:7:8'

	declare SOCKADDR_IN6

	declare -r INPUT_SIN6_FAMILY=RR(mmux_libc_AF_INET6)
	declare SIN6_ADDR_POINTER
	declare -r INPUT_HOST_BYTEORDER_SIN6_FLOWINFO=0
	declare -r INPUT_HOST_BYTEORDER_SIN6_SCOPE_ID=0
	declare -r INPUT_HOST_BYTEORDER_SIN6_PORT=8080

	declare OUTPUT_SIN6_FAMILY
	declare OUTPUT_HOST_BYTEORDER_SIN6_FLOWINFO
	declare OUTPUT_HOST_BYTEORDER_SIN6_SCOPE_ID
	declare OUTPUT_HOST_BYTEORDER_SIN6_PORT

	dotest-debug INPUT_SIN6_FAMILY=WW(INPUT_SIN6_FAMILY)
	dotest-debug INPUT_HOST_BYTEORDER_SIN6_FLOWINFO=WW(INPUT_HOST_BYTEORDER_SIN6_FLOWINFO)
	dotest-debug INPUT_HOST_BYTEORDER_SIN6_SCOPE_ID=WW(INPUT_HOST_BYTEORDER_SIN6_SCOPE_ID)
	dotest-debug INPUT_HOST_BYTEORDER_SIN6_PORT=WW(INPUT_HOST_BYTEORDER_SIN6_PORT)

	mbfl_location_compensate( mmux_libc_sockaddr_in6_malloc SOCKADDR_IN6 \
								RR(INPUT_SIN6_FAMILY) \
								SIN6_ADDR_POINTER \
								RR(INPUT_HOST_BYTEORDER_SIN6_FLOWINFO) \
								RR(INPUT_HOST_BYTEORDER_SIN6_SCOPE_ID) \
								RR(INPUT_HOST_BYTEORDER_SIN6_PORT),
				  mmux_libc_free RR(SOCKADDR_IN6) )
	mbfl_location_leave_when_failure( mmux_libc_inet_pton RR(INPUT_SIN6_FAMILY) WW(INPUT_ASCII_SIN6_ADDR) RR(SIN6_ADDR_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_sin6_family_ref   OUTPUT_SIN6_FAMILY                  RR(SOCKADDR_IN6) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntop         RR(INPUT_SIN6_FAMILY) RR(SOCKADDR_IN6) OUTPUT_ASCII_ADDR )
	mbfl_location_leave_when_failure( mmux_libc_sin6_flowinfo_ref OUTPUT_HOST_BYTEORDER_SIN6_FLOWINFO RR(SOCKADDR_IN6) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_scope_id_ref OUTPUT_HOST_BYTEORDER_SIN6_SCOPE_ID RR(SOCKADDR_IN6) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_port_ref     OUTPUT_HOST_BYTEORDER_SIN6_PORT     RR(SOCKADDR_IN6) )

	dotest-debug OUTPUT_SIN6_FAMILY=WW(OUTPUT_SIN6_FAMILY)
	dotest-debug OUTPUT_ASCII_ADDR=WW(OUTPUT_ASCII_ADDR)
	dotest-debug OUTPUT_HOST_BYTEORDER_SIN6_FLOWINFO=WW(OUTPUT_HOST_BYTEORDER_SIN6_FLOWINFO)
	dotest-debug OUTPUT_HOST_BYTEORDER_SIN6_SCOPE_ID=WW(OUTPUT_HOST_BYTEORDER_SIN6_SCOPE_ID)
	dotest-debug OUTPUT_HOST_BYTEORDER_SIN6_PORT=WW(OUTPUT_HOST_BYTEORDER_SIN6_PORT)

	dotest-equal RR(INPUT_SIN6_FAMILY) WW(OUTPUT_SIN6_FAMILY) &&
	    dotest-equal RR(INPUT_HOST_BYTEORDER_SIN6_FLOWINFO) RR(OUTPUT_HOST_BYTEORDER_SIN6_FLOWINFO) &&
	    dotest-equal RR(INPUT_HOST_BYTEORDER_SIN6_SCOPE_ID) RR(OUTPUT_HOST_BYTEORDER_SIN6_SCOPE_ID) &&
	    dotest-equal RR(INPUT_HOST_BYTEORDER_SIN6_PORT) RR(OUTPUT_HOST_BYTEORDER_SIN6_PORT)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in6-sin6_family-1.1 () {
    declare SOCKADDR_IN6_POINTER
    declare -r INPUT_SIN6_FAMILY=RR(mmux_libc_AF_INET)
    declare    OUPUT_SIN6_FAMILY

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN6_POINTER 1 RR(mmux_libc_sockaddr_in6_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_family_set RR(SOCKADDR_IN6_POINTER) RR(INPUT_SIN6_FAMILY) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_family_ref OUPUT_SIN6_FAMILY        RR(SOCKADDR_IN6_POINTER) )
	dotest-equal RR(INPUT_SIN6_FAMILY) RR(OUPUT_SIN6_FAMILY)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in6-sin6_addr-pointer-1.1 () {
    declare SOCKADDR_IN6_POINTER SIN6_ADDR_POINTER

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN6_POINTER 1 RR(mmux_libc_sockaddr_in6_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_addr_pointer_ref SIN6_ADDR_POINTER RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_memcpy RR(SIN6_ADDR_POINTER) RR(mmux_libc_in6addr_loopback_pointer) \
					  RR(mmux_libc_in6_addr_SIZEOF) )
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in6-sin6_flowinfo-1.1 () {
    declare SOCKADDR_IN6_POINTER
    declare -r INPUT_SIN6_FLOWINFO=0
    declare    OUPUT_SIN6_FLOWINFO

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN6_POINTER 1 RR(mmux_libc_sockaddr_in6_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_flowinfo_set RR(SOCKADDR_IN6_POINTER) RR(INPUT_SIN6_FLOWINFO) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_flowinfo_ref OUPUT_SIN6_FLOWINFO RR(SOCKADDR_IN6_POINTER) )
	dotest-equal RR(INPUT_SIN6_FLOWINFO) RR(OUPUT_SIN6_FLOWINFO)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in6-sin6_scope_id-1.1 () {
    declare SOCKADDR_IN6_POINTER
    declare -r INPUT_SIN6_SCOPE_ID=0
    declare    OUPUT_SIN6_SCOPE_ID

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN6_POINTER 1 RR(mmux_libc_sockaddr_in6_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_scope_id_set RR(SOCKADDR_IN6_POINTER) RR(INPUT_SIN6_SCOPE_ID) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_scope_id_ref OUPUT_SIN6_SCOPE_ID RR(SOCKADDR_IN6_POINTER) )
	dotest-equal RR(INPUT_SIN6_SCOPE_ID) RR(OUPUT_SIN6_SCOPE_ID)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-struct-sockaddr_in6-sin6_port-1.1 () {
    declare SOCKADDR_IN6_POINTER
    declare -r INPUT_SIN6_PORT=8080
    declare    OUPUT_SIN6_PORT

    mbfl_location_enter
    {
	mbfl_location_compensate( mmux_libc_calloc SOCKADDR_IN6_POINTER 1 RR(mmux_libc_sockaddr_in6_SIZEOF),
				  mmux_libc_free RR(SOCKADDR_IN6_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_port_set RR(SOCKADDR_IN6_POINTER) RR(INPUT_SIN6_PORT) )
	mbfl_location_leave_when_failure( mmux_libc_sin6_port_ref OUPUT_SIN6_PORT        RR(SOCKADDR_IN6_POINTER) )
	dotest-equal RR(INPUT_SIN6_PORT) RR(OUPUT_SIN6_PORT)
    }
    mbfl_location_leave
}


#### inet_aton, inet_ntoa

function sockets-inet_aton-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r ASCII_ADDR='127.0.0.1'
	declare UINT32_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_aton UINT32_ADDR WW(ASCII_ADDR) )

	dotest-debug WW(UINT32_ADDR)
	dotest-predicate mmux_string_is_uint32 WW(UINT32_ADDR)
    }
    mbfl_location_leave
}
function sockets-inet_ntoa-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_ADDR='127.0.0.1'
	declare UINT32_ADDR OUTPUT_ASCII_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_aton UINT32_ADDR WW(INPUT_ASCII_ADDR) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntoa OUTPUT_ASCII_ADDR RR(UINT32_ADDR) )

	dotest-debug WW(UINT32_ADDR) WW(OUTPUT_ASCII_ADDR)
	if dotest-option-debug
	then printf '%x\n' WW(UINT32_ADDR) >&2
	fi
	dotest-equal WW(INPUT_ASCII_ADDR) WW(OUTPUT_ASCII_ADDR)
    }
    mbfl_location_leave
}


#### inet_addr

function sockets-inet_addr-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_ADDR='127.0.0.1'
	declare UINT32_ADDR OUTPUT_ASCII_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_addr UINT32_ADDR WW(INPUT_ASCII_ADDR) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntoa OUTPUT_ASCII_ADDR RR(UINT32_ADDR) )

	dotest-debug UINT32_ADDR=WW(UINT32_ADDR) OUTPUT_ASCII_ADDR=WW(OUTPUT_ASCII_ADDR) UINT32_ADDR_HEX=$(printf '%x\n' WW(UINT32_ADDR))
	dotest-equal WW(INPUT_ASCII_ADDR) WW(OUTPUT_ASCII_ADDR)
    }
    mbfl_location_leave
}
function sockets-inet_addr-1.2 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_ADDR='ciao'
	declare UINT32_ADDR OUTPUT_ASCII_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_addr UINT32_ADDR WW(INPUT_ASCII_ADDR) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntoa OUTPUT_ASCII_ADDR RR(UINT32_ADDR) )

	dotest-debug UINT32_ADDR=WW(UINT32_ADDR) OUTPUT_ASCII_ADDR=WW(OUTPUT_ASCII_ADDR) UINT32_ADDR_HEX=$(printf '%x\n' WW(UINT32_ADDR))
	dotest-equal WW(mmux_libc_INADDR_NONE) WW(UINT32_ADDR)
    }
    mbfl_location_leave
}


#### inet_network

function sockets-inet_network-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r INPUT_ASCII_ADDR='1.2.3.4'
	declare UINT32_ADDR OUTPUT_ASCII_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_network UINT32_ADDR WW(INPUT_ASCII_ADDR) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntoa OUTPUT_ASCII_ADDR RR(UINT32_ADDR) )

	dotest-debug UINT32_ADDR=WW(UINT32_ADDR) OUTPUT_ASCII_ADDR=WW(OUTPUT_ASCII_ADDR) UINT32_ADDR_HEX=$(printf '%x\n' WW(UINT32_ADDR))
	dotest-equal '4.3.2.1' WW(OUTPUT_ASCII_ADDR)
    }
    mbfl_location_leave
}


#### inet_makeaddr

function sockets-inet_makeaddr-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -ri UINT32_NET_ADDR='16#FFFFFF00'
	declare -ri UINT32_LOCAL_ADDR='16#00000012'
	declare -ri EXPECTED_UINT32_ADDR='16#12FFFFFF'
	declare UINT32_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_makeaddr UINT32_ADDR RR(UINT32_NET_ADDR) RR(UINT32_LOCAL_ADDR) )

	dotest-debug UINT32_ADDR=WW(UINT32_ADDR) UINT32_ADDR_HEX=$(printf '%x\n' WW(UINT32_ADDR))
	dotest-equal WW(EXPECTED_UINT32_ADDR) WW(UINT32_ADDR)
    }
    mbfl_location_leave
}


#### inet_lnaof

function sockets-inet_lnaof-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -ri UINT32_ADDR='16#12FFFFFF'
	declare -ri EXPECTED_UINT32_LOCAL_ADDR='16#12'
	declare -i UINT32_LOCAL_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_lnaof UINT32_LOCAL_ADDR WW(UINT32_ADDR) )

	dotest-debug UINT32_LOCAL_ADDR=WW(UINT32_LOCAL_ADDR) UINT32_LOCAL_ADDR_HEX=$(printf '%x\n' WW(UINT32_LOCAL_ADDR))
	dotest-equal WW(EXPECTED_UINT32_LOCAL_ADDR) WW(UINT32_LOCAL_ADDR)
    }
    mbfl_location_leave
}


#### inet_pton

function sockets-inet_pton-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r AF_TYPE=RR(mmux_libc_AF_INET)
	declare -r INPUT_ASCII_IN_ADDR='127.0.0.1'
	declare IN_ADDR_POINTER
	declare -i UINT32_ADDR
	declare OUTPUT_ASCII_IN_ADDR

	mbfl_location_compensate( mmux_libc_calloc IN_ADDR_POINTER 1 RR(mmux_libc_in_addr_SIZEOF),
				  mmux_libc_free RR(IN_ADDR_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_inet_pton RR(AF_TYPE) WW(INPUT_ASCII_IN_ADDR) RR(IN_ADDR_POINTER) )
	mbfl_location_leave_when_failure( mmux_uint32_pointer_ref UINT32_ADDR RR(IN_ADDR_POINTER) 0 )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntoa OUTPUT_ASCII_IN_ADDR RR(UINT32_ADDR) )

	dotest-debug UINT32_ADDR=WW(UINT32_ADDR) OUTPUT_ASCII_IN_ADDR=WW(OUTPUT_ASCII_IN_ADDR)
	dotest-equal WW(INPUT_ASCII_IN_ADDR) WW(OUTPUT_ASCII_IN_ADDR)
    }
    mbfl_location_leave
}
function sockets-inet_pton-1.2 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r AF_TYPE=RR(mmux_libc_AF_INET)
	declare -r INPUT_ASCII_IN_ADDR='127.0.0.1'
	declare IN_ADDR_POINTER
	declare OUTPUT_ASCII_IN_ADDR

	mbfl_location_compensate( mmux_libc_calloc IN_ADDR_POINTER 1 RR(mmux_libc_in_addr_SIZEOF),
				  mmux_libc_free RR(IN_ADDR_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_inet_pton RR(AF_TYPE) WW(INPUT_ASCII_IN_ADDR) RR(IN_ADDR_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntop RR(AF_TYPE) RR(IN_ADDR_POINTER) OUTPUT_ASCII_IN_ADDR )

	dotest-debug OUTPUT_ASCII_IN_ADDR=WW(OUTPUT_ASCII_IN_ADDR)
	dotest-equal WW(INPUT_ASCII_IN_ADDR) WW(OUTPUT_ASCII_IN_ADDR)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-inet_pton-2.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -r AF_TYPE=RR(mmux_libc_AF_INET6)
	declare -r INPUT_ASCII_IN6_ADDR='1:2:3:4:5:6:7:8'
	declare IN6_ADDR_POINTER
	declare OUTPUT_ASCII_IN6_ADDR

	mbfl_location_compensate( mmux_libc_calloc IN6_ADDR_POINTER 1 RR(mmux_libc_in6_addr_SIZEOF),
				  mmux_libc_free RR(IN6_ADDR_POINTER) )

	mbfl_location_leave_when_failure( mmux_libc_inet_pton RR(AF_TYPE) WW(INPUT_ASCII_IN6_ADDR) RR(IN6_ADDR_POINTER) )
	mbfl_location_leave_when_failure( mmux_libc_inet_ntop RR(AF_TYPE) RR(IN6_ADDR_POINTER) OUTPUT_ASCII_IN6_ADDR )

	dotest-debug OUTPUT_ASCII_IN6_ADDR=WW(OUTPUT_ASCII_IN6_ADDR)
	dotest-equal WW(INPUT_ASCII_IN6_ADDR) WW(OUTPUT_ASCII_IN6_ADDR)
    }
    mbfl_location_leave
}


#### inet_netof

function sockets-inet_netof-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare -ri UINT32_ADDR='16#12FFFFFF'
	declare -ri EXPECTED_UINT32_NET_ADDR='16#FFFFFF'
	declare -i UINT32_NET_ADDR

	mbfl_location_leave_when_failure( mmux_libc_inet_netof UINT32_NET_ADDR WW(UINT32_ADDR) )

	dotest-debug UINT32_NET_ADDR=WW(UINT32_NET_ADDR) UINT32_NET_ADDR_HEX=$(printf '%x\n' WW(UINT32_NET_ADDR))
	dotest-equal WW(EXPECTED_UINT32_NET_ADDR) WW(UINT32_NET_ADDR)
    }
    mbfl_location_leave
}


#### getsockopt

function sockets-getsockopt-sint-SO_BROADCAST-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_BROADCAST) )

	dotest-debug 'OPTVAL[SO_BROADCAST]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_DEBUG-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DEBUG) )

	dotest-debug 'OPTVAL[SO_DEBUG]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_DONTROUTE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DONTROUTE) )

	dotest-debug 'OPTVAL[SO_DONTROUTE]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_ERROR-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_ERROR) )

	dotest-debug 'OPTVAL[SO_ERROR]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_KEEPALIVE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_KEEPALIVE) )

	dotest-debug 'OPTVAL[SO_KEEPALIVE]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_OOBINLINE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_OOBINLINE) )

	dotest-debug 'OPTVAL[SO_OOBINLINE]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_REUSEADDR-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_REUSEADDR) )

	dotest-debug 'OPTVAL[SO_REUSEADDR]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_TYPE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_TYPE) )

	dotest-debug 'OPTVAL[SO_TYPE]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-sint-SO_STYLE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_STYLE) )

	dotest-debug 'OPTVAL[SO_STYLE]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_sint WW(OPTVAL)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-getsockopt-usize-SO_SNDBUF-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_SNDBUF) )

	dotest-debug 'OPTVAL[SO_SNDBUF]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_usize WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-getsockopt-usize-SO_RCVBUF-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_RCVBUF) )

	dotest-debug 'OPTVAL[SO_RCVBUF]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_usize WW(OPTVAL)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function sockets-getsockopt-SO_LINGER-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD
	declare -A OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_LINGER) )

	#mbfl_array_dump OPTVAL
	dotest-debug 'OPTVAL[ONOFF]'=WW(OPTVAL, ONOFF)
	dotest-debug 'OPTVAL[LINGER]'=WW(OPTVAL, LINGER)
	dotest-predicate mmux_string_is_sint WW(OPTVAL, ONOFF) &&
	    dotest-predicate mmux_string_is_sint WW(OPTVAL, LINGER)
    }
    mbfl_location_leave
}


#### setsockopt

function sockets-setsockopt-sint-SO_BROADCAST-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_BROADCAST) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_BROADCAST) )

	dotest-debug 'OPTVAL[SO_BROADCAST]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}
# NOTE It appears setting SO_DEBUG requires special privileges, so it will not work here.  I admit I
# have never tried it.  (Marco Maggi; Nov 20, 2024)
function disabled-sockets-setsockopt-sint-SO_DEBUG-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	dotest-debug setting
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DEBUG) 1 )
	dotest-debug setted, getting
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DEBUG) )
	dotest-debug getted

	dotest-debug 'OPTVAL[SO_DEBUG]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-setsockopt-sint-SO_DONTROUTE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DONTROUTE) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_DONTROUTE) )

	dotest-debug 'OPTVAL[SO_DONTROUTE]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-setsockopt-sint-SO_KEEPALIVE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_KEEPALIVE) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_KEEPALIVE) )

	dotest-debug 'OPTVAL[SO_KEEPALIVE]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-setsockopt-sint-SO_OOBINLINE-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_OOBINLINE) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_OOBINLINE) )

	dotest-debug 'OPTVAL[SO_OOBINLINE]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}
function sockets-setsockopt-sint-SO_REUSEADDR-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_REUSEADDR) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_REUSEADDR) )

	dotest-debug 'OPTVAL[SO_REUSEADDR]'=WW(OPTVAL)
	dotest-equal 1 WW(OPTVAL)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

# NOTE Apparently: setting the option SO_SNDBUF is just a suggestion, not an order.  The system does
# what it wants.  (Marco Maggi; Nov 20, 2024)
function sockets-setsockopt-usize-SO_SNDBUF-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_SNDBUF) 4096 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_SNDBUF) )

	dotest-debug 'OPTVAL[SO_SNDBUF]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_usize WW(OPTVAL)
    }
    mbfl_location_leave
}
# NOTE Apparently: setting the option SO_RCVBUF is just a suggestion, not an order.  The system does
# what it wants.  (Marco Maggi; Nov 20, 2024)
function sockets-setsockopt-usize-SO_RCVBUF-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_RCVBUF) 1 )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_RCVBUF) )

	dotest-debug 'OPTVAL[SO_RCVBUF]'=WW(OPTVAL)
	dotest-predicate mmux_string_is_usize WW(OPTVAL)
    }
    mbfl_location_leave
}
### ------------------------------------------------------------------------

function sockets-setsockopt-SO_LINGER-1.1 () {
    mbfl_location_enter
    {
	dotest-unset-debug

	declare SOCKFD
	declare -Ar SETTER_OPTVAL=([ONOFF]=1 [LINGER]=123)
	declare -A  GETTER_OPTVAL

	mbfl_location_compensate( mmux_libc_socket SOCKFD RR(mmux_libc_PF_LOCAL) RR(mmux_libc_SOCK_STREAM) 0,
				  mmux_libc_close RR(SOCKFD) )
	#mbfl_array_dump SETTER_OPTVAL

	mbfl_location_leave_when_failure( mmux_libc_setsockopt RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_LINGER) SETTER_OPTVAL )
	mbfl_location_leave_when_failure( mmux_libc_getsockopt GETTER_OPTVAL RR(SOCKFD) RR(mmux_libc_SOL_SOCKET) RR(mmux_libc_SO_LINGER) )

	#mbfl_array_dump GETTER_OPTVAL
	dotest-debug 'GETTER_OPTVAL[ONOFF]'=WW(GETTER_OPTVAL, ONOFF)
	dotest-debug 'GETTER_OPTVAL[LINGER]'=WW(GETTER_OPTVAL, LINGER)

	dotest-equal     WW(SETTER_OPTVAL, ONOFF)  WW(GETTER_OPTVAL, ONOFF) &&
	    dotest-equal WW(SETTER_OPTVAL, LINGER) WW(GETTER_OPTVAL, LINGER)
    }
    mbfl_location_leave
}


#### let's go

dotest sockets-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
