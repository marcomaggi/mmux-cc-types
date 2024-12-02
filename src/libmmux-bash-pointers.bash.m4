#
# Part of: MMUX Bash Pointers
# Contents: core library
# Date: Sep  9, 2024
#
# Abstract
#
#	This library  must be  sourced from an  interactive shell  or from a  script.  It  loads the
#	shared library and enables the implemented builtins.
#
#	The Bash builtin "enable" will search the shared library file in the usual places, including
#	the directories from "LD_LIBRARY_PATH".
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU
# General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# General Public License for more details.
#
# You should  have received a copy  of the GNU General  Public License along with  this program.  If
# not, see <http://www.gnu.org/licenses/>.
#

#page
#### package descriptor

mmux_package_require_by_descriptor MMUX_BASH_PACKAGES_PACKAGE 0

declare -gA MMUX_BASH_POINTERS_PACKAGE=([PACKAGING_VERSION]='0'
					[PACKAGE_NAME]='MMUX Bash Pointers'
					[SEMANTIC_VERSION]='mmux_bash_pointers_SEMANTIC_VERSION'
					[INTERFACE_VERSION_CURRENT]='mmux_bash_pointers_VERSION_INTERFACE_CURRENT'
					[INTERFACE_VERSION_REVISION]='mmux_bash_pointers_VERSION_INTERFACE_REVISION'
					[INTERFACE_VERSION_AGE]='mmux_bash_pointers_VERSION_INTERFACE_AGE'
					[SHARED_LIBRARY]='libmmux-bash-pointers.so'
					[SHELL_LIBRARY]='libmmux-bash-pointers.bash'
					[PACKAGE_AFTER_LOADING_HOOK]='mmux_bash_pointers_library_after_loading_hook'
					[PACKAGE_BEFORE_UNLOADING_HOOK]='mmux_bash_pointers_library_before_unloading_hook')

m4_include([[[mmux-bash-pointers-builtin-definitions.bash]]])

#page
#### after loading hook: begin

function mmux_bash_pointers_library_after_loading_hook () {
    declare -ga MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS=(schar sshort sint slong sllong sint8 sint16 sint32 sint64 ssize \
							       sintmax sintptr ptrdiff off uid gid wchar)
    declare -ga MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS=(uchar ushort uint ulong ullong uint8 uint16 uint32 uint64 usize \
								 uintmax uintptr mode pid wint socklen)
    declare -ga MMUX_BASH_POINTERS_INTEGER_STEMS=("${MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS[@]}" \
						      "${MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS[@]}")

    declare -ga MMUX_BASH_POINTERS_REAL_FLOAT_STEMS=(float double ldouble float32 float64 float128 float32x float64x float128x \
							   decimal32 decimal64 decimal128)
    declare -ga MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS=(complexf complexd complexld complexf32 complexf64 complexf128 \
								 complexf32x complexf64x complexf128x \
								 complexd32 complexd64 complexd128)
    declare -ga MMUX_BASH_POINTERS_FLOAT_STEMS=("${MMUX_BASH_POINTERS_REAL_FLOAT_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_REAL_STEMS=('pointer' "${MMUX_BASH_POINTERS_INTEGER_STEMS[@]}" "${MMUX_BASH_POINTERS_REAL_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_COMPLEX_STEMS=("${MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_STEMS=("${MMUX_BASH_POINTERS_REAL_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}")


    mmux_bash_pointers_library_init

#page
#### global variables

declare -gi mmux_libc_MSG_ZERO='0'

#page
#### after loading hook: socket helpers

function mmux_libc_sockaddr_dump () {
    declare -r SOCKADDR_PTR=PP(1, pointer to a struct sockaddr)
    declare -r SOCKADDR_NAME=${2:-'struct sockaddr'}
    declare SA_FAMILY SA_FAMILY_NAME

    if ! mmux_libc_sa_family_ref SA_FAMILY RR(SOCKADDR_PTR)
    then return 1
    fi

    case RR(SA_FAMILY) in
	RR(mmux_libc_AF_LOCAL))		SA_FAMILY_NAME='AF_LOCAL'  ;;
	RR(mmux_libc_AF_INET))		SA_FAMILY_NAME='AF_INET'   ;;
	RR(mmux_libc_AF_INET6))		SA_FAMILY_NAME='AF_INET6'  ;;
	RR(mmux_libc_AF_UNSPEC))	SA_FAMILY_NAME='AF_UNSPEC' ;;
        *)				SA_FAMILY_NAME='unknown'   ;;
    esac

    printf '%s.sa_family = "%d" (%s)\n' WW(SOCKADDR_NAME) RR(SA_FAMILY) RR(SA_FAMILY_NAME)

    case RR(SA_FAMILY) in
	RR(mmux_libc_AF_LOCAL))		mmux_libc_sockaddr_un_dump  RR(SOCKADDR_PTR) WW(SOCKADDR_NAME) ;;
	RR(mmux_libc_AF_INET))		mmux_libc_sockaddr_in_dump  RR(SOCKADDR_PTR) WW(SOCKADDR_NAME) ;;
	RR(mmux_libc_AF_INET6))		mmux_libc_sockaddr_in6_dump RR(SOCKADDR_PTR) WW(SOCKADDR_NAME) ;;
    esac
}

m4_define([[[DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER]]],[[[
function mmux_libc_ai_$1_print () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare FIELD_VALUE

    if mmux_string_is_pointer WW(ADDRINFO_PTR)
    then
	mmux_libc_ai_$1_ref FIELD_VALUE RR(ADDRINFO_PTR)
	printf '%s' WW(FIELD_VALUE)
    else return 1
    fi
}
]]])

DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[flags]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[family]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[socktype]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[protocol]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[addrlen]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[addr]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[canonname]]])
DEFINE_STRUCT_ADDRINFO_FIELD_PRINTER([[[next]]])

function mmux_libc_addrinfo_dump () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_string_is_pointer WW(ADDRINFO_PTR)
    then
	declare FIELD_NAME FIELD_VALUE ITEM

	for FIELD_NAME in 'flags' 'family' 'socktype' 'protocol' 'addrlen' 'addr' 'canonname' 'next'
	do
	    if ! mmux_libc_addrinfo_dump_ai_${FIELD_NAME:?} RR(ADDRINFO_PTR) WW(ADDRINFO_NAME)
	    then
		mmux_libc_addrinfo_dump_error_inspecting_field WW(FUNCNAME) RR(FIELD_NAME) RR(ADDRINFO_PTR)
		return 1
	    fi
	done
    else
	mmux_libc_addrinfo_dump_error_expected_pointer WW(FUNCNAME) WW(ADDRINFO_PTR)
	return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_flags () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_flags_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	declare FLAG_NAME
	declare -i FOUND_FLAGS_IDX=0 IDX
	declare -a FOUND_FLAGS
	declare FLAGS_EXPRESSION_STRING

	for FLAG_NAME in AI_ADDRCONFIG AI_ALL AI_CANONIDN AI_CANONNAME AI_IDN AI_NUMERICSERV AI_PASSIVE AI_V4MAPPED
	do
	    declare VAR_NAME=mmux_libc_${FLAG_NAME:?}
	    if test -v WW(VAR_NAME)
	    then
		declare -n FLAG_VALUE=RR(VAR_NAME)

		if (( RR(FIELD_VALUE) & RR(FLAG_VALUE) ))
		then
		    FOUND_FLAGS[RR(FOUND_FLAGS_IDX)]=RR(FLAG_NAME)
		    let ++FOUND_FLAGS_IDX
		fi
	    fi
	done

	if (( 0 < FOUND_FLAGS_IDX ))
	then
	    printf -v FLAGS_EXPRESSION_STRING '%s' WW(FOUND_FLAGS,0)
	    for ((IDX=1; IDX < FOUND_FLAGS_IDX; ++IDX))
	    do printf -v FLAGS_EXPRESSION_STRING '%s | %s' WW(FLAGS_EXPRESSION_STRING) WW(FOUND_FLAGS,$IDX)
	    done
	    printf '%s.ai_flags="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(FLAGS_EXPRESSION_STRING) >&2
	fi
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_family () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_family_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	declare FLAG_NAME

	for FLAG_NAME in AF_ALG AF_APPLETALK AF_AX25 AF_BLUETOOTH AF_CAN AF_DECnet AF_FILE AF_IB AF_INET \
				AF_INET6 AF_IPX AF_KCM AF_KEY AF_LLC AF_LOCAL AF_MPLS AF_NETLINK AF_PACKET AF_PPPOX \
				AF_RDS AF_TIPC AF_UNIX AF_UNSPEC AF_VSOCK AF_X25 AF_XDP
	do
	    declare VAR_NAME=mmux_libc_${FLAG_NAME:?}
	    if test -v WW(VAR_NAME)
	    then
		declare -n FLAG_VALUE=RR(VAR_NAME)

		if test RR(FIELD_VALUE) = RR(FLAG_VALUE)
		then
		    printf '%s.ai_family="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(FLAG_NAME)
		    break
		fi
	    fi
	done
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_socktype () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_socktype_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	declare FLAG_NAME

	for FLAG_NAME in SOCK_DCCP SOCK_DGRAM SOCK_PACKET SOCK_RAW SOCK_RDM SOCK_SEQPACKET SOCK_STREAM
	do
	    declare VAR_NAME=mmux_libc_${FLAG_NAME:?}
	    if test -v WW(VAR_NAME)
	    then
		declare -n FLAG_VALUE=RR(VAR_NAME)

		if test RR(FIELD_VALUE) = RR(FLAG_VALUE)
		then
		    printf '%s.ai_socktype="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(FLAG_NAME)
		    break
		fi
	    fi
	done
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_protocol () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_protocol_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	declare FLAG_NAME

	for FLAG_NAME in \
	    IPPROTO_AH \
		IPPROTO_BEETPH IPPROTO_COMP IPPROTO_DCCP IPPROTO_EGP IPPROTO_ENCAP IPPROTO_ESP IPPROTO_ETHERNET \
		IPPROTO_GRE IPPROTO_ICMP IPPROTO_IDP IPPROTO_IGMP IPPROTO_IP IPPROTO_IPIP IPPROTO_IPV6 IPPROTO_MPLS \
		IPPROTO_MPTCP IPPROTO_MTP IPPROTO_PIM IPPROTO_PUP IPPROTO_RAW IPPROTO_RSVP IPPROTO_SCTP IPPROTO_TCP \
		IPPROTO_TP IPPROTO_UDP IPPROTO_UDPLITE
	do
	    declare VAR_NAME=mmux_libc_${FLAG_NAME:?}
	    if test -v WW(VAR_NAME)
	    then
		declare -n FLAG_VALUE=RR(VAR_NAME)

		if test RR(FIELD_VALUE) = RR(FLAG_VALUE)
		then
		    printf '%s.ai_protocol="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(FLAG_NAME)
		    break
		fi
	    fi
	done
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_addrlen () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_addrlen_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	declare FLAG_NAME

	for FLAG_NAME in sockaddr_in_SIZEOF sockaddr_in6_SIZEOF sockaddr_un_SIZEOF
	do
	    declare VAR_NAME=mmux_libc_${FLAG_NAME:?}
	    if test -v WW(VAR_NAME)
	    then
		declare -n FLAG_VALUE=RR(VAR_NAME)

		if (( RR(FIELD_VALUE) == RR(FLAG_VALUE) ))
		then
		    printf '%s.ai_addrlen="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(FLAG_NAME)
		    return 0
		fi
	    fi
	done
	# If we are here none of the sizes were right.
	printf '%s.ai_addrlen="%s"\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE)
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_addr () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_addr_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then printf '%s.ai_addr="%s"\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE)
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_canonname () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_canonname_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then
	if mmux_pointer_is_zero RR(FIELD_VALUE)
	then printf '%s.ai_canonname="%s"\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE)
	else
	    declare ASCII_CANONNAME

	    mmux_pointer_to_bash_string ASCII_CANONNAME RR(FIELD_VALUE)
	    printf '%s.ai_canonname="%s" (%s)\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE) WW(ASCII_CANONNAME)
	fi
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_ai_next () {
    declare -r ADDRINFO_PTR=PP(1, pointer to a struct addrinfo)
    declare -r ADDRINFO_NAME=${2:-'struct addrinfo'}

    if mmux_libc_ai_next_ref FIELD_VALUE RR(ADDRINFO_PTR)
    then printf '%s.ai_next="%s"\n' WW(ADDRINFO_NAME) RR(FIELD_VALUE)
    else return 1
    fi
}
function mmux_libc_addrinfo_dump_error_expected_pointer () {
    declare THE_FUNCNAME=PP(1, function name)
    declare THE_POINTER=PP(2, addrinfo pointer name)

    printf '%s: error: expected addrinfo pointer: "%s"\n' WW(FUNCNAME) WW(ADDRINFO_PTR) >&2
}
function mmux_libc_addrinfo_dump_error_inspecting_field () {
    declare THE_FUNCNAME=PP(1, function name)
    declare THE_FIELD=PP(2, field name)
    declare THE_POINTER=PP(3, addrinfo pointer name)

    printf '%s: error: inspecting field "%s" of: %s\n' WW(THE_FUNCNAME) WW(THE_FIELD) RR(THE_POINTER) >&2
}

#page
#### after loading hook: utilities
#
# NOTE  For reasons  of honest  ignorance on  my part:  I do  not know  why I  have to  define these
# functions after I have loaded  the shared library.  If I do not do it:  an error is raised because
# the "mmux_*_pointer_" builtins are seen as undefined.  (Marco Maggi; Sep 12, 2024)
#

function mmux_index_array_from_memory () {
    declare -rn mmux_p_ARRY=PP(1, target index array name)
    declare -r  mmux_p_POINTER=PP(2, source memory pointer)
    declare -ri mmux_p_NUMBER_OF_OCTETS=PP(3, how many octets to copy)
    declare -i  mmux_p_IDX mmux_p_OCTET

    for ((mmux_p_IDX=0; mmux_p_IDX < mmux_p_NUMBER_OF_OCTETS; ++mmux_p_IDX))
    do
	mmux_uint8_pointer_ref mmux_p_OCTET WW(mmux_p_POINTER) RR(mmux_p_IDX)
	mmux_p_ARRY[RR(mmux_p_IDX)]=WW(mmux_p_OCTET)
    done
}
function mmux_index_array_to_memory () {
    declare -r  mmux_p_POINTER=PP(1, target memory pointer)
    declare -rn mmux_p_ARRY=PP(2, source index array name)
    declare -ri mmux_p_NUMBER_OF_OCTETS=PP(3, how many octets to copy)
    declare -i  mmux_p_IDX

    for ((mmux_p_IDX=0; mmux_p_IDX < mmux_p_NUMBER_OF_OCTETS; ++mmux_p_IDX))
    do mmux_uint8_pointer_set WW(mmux_p_POINTER) RR(mmux_p_IDX) "${mmux_p_ARRY[RR(mmux_p_IDX)]}"
    done
}

#page
#### after loading hook: misc functions

function mmux_bash_pointers_builtin_p () {
    declare NAME=${1:?"missing mandatory parameter NAME in call to '$FUNCNAME'"}

    test 'builtin' = "$(type -t $NAME)"
}

#page
#### after loading hook: end

}

#page
#### before unloading hook

function mmux_bash_pointers_library_before_unloading_hook () {
    unset -v \
	  MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS	\
	  MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS	\
	  MMUX_BASH_POINTERS_INTEGER_STEMS		\
	  MMUX_BASH_POINTERS_REAL_FLOAT_STEMS		\
	  MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS	\
	  MMUX_BASH_POINTERS_FLOAT_STEMS		\
	  MMUX_BASH_POINTERS_REAL_STEMS			\
	  MMUX_BASH_POINTERS_COMPLEX_STEMS		\
	  MMUX_BASH_POINTERS_STEMS

    unset -v $(compgen -v -A variable mmux_libc_)

    unset -f \
	  mmux_index_array_from_memory				\
	  mmux_index_array_to_memory				\
	  mmux_bash_pointers_builtin_p				\
	  mmux_bash_pointers_library_after_loading_hook		\
	  mmux_bash_pointers_library_before_unloading_hook	\
	  mmux_libc_addrinfo_array_init_defaults		\
	  mmux_libc_addrinfo_calloc_with_array			\
	  mmux_libc_addrinfo_array_init_from_pointer		\
	  mmux_libc_ai_flags_print				\
	  mmux_libc_ai_family_print				\
	  mmux_libc_ai_socktype_print				\
	  mmux_libc_ai_protocol_print				\
	  mmux_libc_ai_addrlen_print				\
	  mmux_libc_ai_addr_print				\
	  mmux_libc_ai_canonname_print				\
	  mmux_libc_ai_next_print				\
	  mmux_libc_addrinfo_dump				\
	  mmux_libc_addrinfo_dump_ai_flags			\
	  mmux_libc_addrinfo_dump_ai_family			\
	  mmux_libc_addrinfo_dump_ai_socktype			\
	  mmux_libc_addrinfo_dump_ai_protocol			\
	  mmux_libc_addrinfo_dump_ai_addrlen			\
	  mmux_libc_addrinfo_dump_ai_addr			\
	  mmux_libc_addrinfo_dump_ai_canonname			\
	  mmux_libc_addrinfo_dump_ai_next			\
	  mmux_libc_addrinfo_dump_error_inspecting_field	\
	  mmux_libc_addrinfo_dump_error_expected_pointer
}

#page
#### let's go

mmux_package_provide_by_descriptor MMUX_BASH_POINTERS_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End:
