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
	mbfl_array_dump ARRY
	true
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


#### let's go

dotest sockets-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
