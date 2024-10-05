#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for memory management
#!# Date: Sep  9, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/memory.test ; less tests/memory.log
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

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source "$MMUX_LIBRARY"


#### standard memory allocation

function memory-1.1 () {
    declare PTR
    if mmux_libc_malloc PTR 123
    then mmux_libc_free $PTR
    else return $?
    fi
}
function memory-1.2 () {
    declare PTR
    if mmux_libc_malloc PTR 123
    then
	if mmux_libc_realloc PTR $PTR 456
	then mmux_libc_free $PTR
	else return $?
	fi
    fi
}
function memory-1.3 () {
    declare PTR
    if mmux_libc_calloc PTR 123 1
    then mmux_libc_free $PTR
    else return $?
    fi
}
function memory-1.4 () {
    declare PTR ERRNO SYM MSG
    declare EXPECTED_SYM='EINVAL' EXPECTED_MSG='mmux_libc_malloc: error: invalid argument, expected "ulong": "ciao"'

    dotest-unset-debug

    mbfl_location_enter
    {
	mbfl_location_handler_restore_lastpipe
        shopt -s lastpipe

	{
	    mmux_libc_malloc PTR 'ciao' 2>&1
	    printf '%s\n' QQ(ERRNO)
	} | {
	    read MSG
	    read ERRNO
	    dotest-debug MSG=QQ(MSG)
	    dotest-debug ERRNO=QQ(ERRNO)
	    mmux_libc_errno_to_string SYM QQ(ERRNO)
	    dotest-equal QQ(EXPECTED_SYM) QQ(SYM) &&
		dotest-equal QQ(EXPECTED_MSG) QQ(MSG)
	}
    }
    mbfl_location_leave
}


#### standard memory operations

function memory-2.1 () {
    declare PTR SIZE=123 RESULT=Z

    if mmux_libc_malloc PTR $SIZE
    then
	mmux_libc_memset $PTR 1 $SIZE
	mmux_uint8_pointer_ref RESULT $PTR 1
	mmux_libc_free $PTR
	dotest-equal 1 $RESULT
    else return $?
    fi
}

function memory-3.1 () {
    declare PTR_FROM PTR_TO SIZE=123 RESULT=Z

    mmux_libc_malloc PTR_FROM $SIZE
    mmux_libc_malloc PTR_TO   $SIZE

    mmux_libc_memset $PTR_FROM 1 $SIZE
    mmux_libc_memset $PTR_TO   0 $SIZE

    mmux_libc_memcpy $PTR_TO $PTR_FROM $SIZE
    mmux_uint8_pointer_ref RESULT $PTR_TO 10

    mmux_libc_free $PTR_FROM
    mmux_libc_free $PTR_TO

    dotest-equal 1 $RESULT
}

function memory-4.1 () {
    declare PTR_FROM PTR_TO SIZE=123 RESULT=Z

    mmux_libc_malloc PTR_FROM $SIZE
    mmux_libc_malloc PTR_TO   $SIZE

    mmux_libc_memset $PTR_FROM 1 $SIZE
    mmux_libc_memset $PTR_TO   0 $SIZE

    mmux_libc_memmove $PTR_TO $PTR_FROM $SIZE
    mmux_uint8_pointer_ref RESULT $PTR_TO 10

    mmux_libc_free $PTR_FROM
    mmux_libc_free $PTR_TO

    dotest-equal 1 $RESULT
}


#### let's go

dotest memory-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
