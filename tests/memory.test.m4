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

MBFL_DEFINE_SPECIAL_MACROS

m4_define([[[COMPENSATE]]],[[[if $1
then mbfl_location_handler "$2"
else mbfl_location_leave_then_return_failure
fi]]])


#### helpers

function fill_raw_memory () {
    mbfl_mandatory_parameter(POINTER,			1, pointer value)
    mbfl_mandatory_integer_parameter(START_OFFSET,	2, inclusive start offset for filling)
    mbfl_mandatory_integer_parameter(END_OFFSET,	3, exclusive end offset for filling)
    mbfl_optional_integer_parameter(START_VALUE,	4, 0)
    declare -i OFFSET VALUE

    for ((OFFSET=START_OFFSET, VALUE=$START_VALUE; OFFSET < END_OFFSET; ++OFFSET, ++VALUE))
    do mmux_uint8_pointer_set WW(POINTER) WW(OFFSET) WW(VALUE)
    done
}


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


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


#### standard memory operations: memset

function memory-memset-1.1 () {
    declare -r EXPECTED_RESULT=1
    declare -r SIZE=123
    declare PTR RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_libc_malloc PTR WW(SIZE),
		   mmux_libc_free WW(PTR))

	mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR) 1 WW(SIZE) )
	mbfl_location_leave_when_failure( mmux_uint8_pointer_ref RESULT WW(PTR) 1 )

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### standard memory operations: memcpy

function memory-memcpy-1.1 () {
    declare -r EXPECTED_RESULT=1
    declare -ri SIZE=123
    declare PTR_FROM PTR_TO RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_libc_malloc PTR_FROM WW(SIZE),
		   mmux_libc_free WW(PTR_FROM))

	COMPENSATE(mmux_libc_malloc PTR_TO WW(SIZE),
		   mmux_libc_free WW(PTR_TO))

	mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_FROM) 1 WW(SIZE) )
	mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_TO)   0 WW(SIZE) )

	mbfl_location_leave_when_failure( mmux_libc_memcpy WW(PTR_TO) WW(PTR_FROM) WW(SIZE) )
	mbfl_location_leave_when_failure( mmux_uint8_pointer_ref RESULT WW(PTR_TO) 10 )

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### standard memory operations: mempcpy

function memory-mempcpy-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_mempcpy
    then
	mbfl_location_enter
	{
	    declare -r EXPECTED_RESULT=1
	    declare -ri SIZE=123
	    declare PTR_FROM PTR_TO RESULT
	    declare PTR_AFTER_TO COMPUTED_PTR_AFTER_TO

	    COMPENSATE(mmux_libc_malloc PTR_FROM WW(SIZE),
		       mmux_libc_free WW(PTR_FROM))

	    COMPENSATE(mmux_libc_malloc PTR_TO WW(SIZE),
		       mmux_libc_free WW(PTR_TO))

	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_FROM) 1 WW(SIZE) )
	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_TO)   0 WW(SIZE) )

	    mbfl_location_leave_when_failure( mmux_libc_mempcpy PTR_AFTER_TO WW(PTR_TO) WW(PTR_FROM) WW(SIZE) )
	    mbfl_location_leave_when_failure( mmux_uint8_pointer_ref RESULT WW(PTR_TO) 10 )

	    mbfl_location_leave_when_failure( mmux_pointer_add COMPUTED_PTR_AFTER_TO WW(PTR_TO) WW(SIZE) )

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT) &&
		dotest-predicate mmux_pointer_equal WW(PTR_AFTER_TO) WW(COMPUTED_PTR_AFTER_TO)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### standard memory operations: memccpy

function memory-memccpy-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_memccpy
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r EXPECTED_RESULT=56
	    declare -ri SIZE=24
	    declare PTR_FROM PTR_TO
	    declare AFTER_SEPARATOR_PTR COMPUTED_AFTER_SEPARATOR_PTR

	    declare -r SEPARATOR_OCTET='5'
	    declare OCTET_AFTER_SEPARATOR

	    COMPENSATE(mmux_libc_malloc PTR_FROM WW(SIZE), mmux_libc_free WW(PTR_FROM))
	    COMPENSATE(mmux_libc_malloc PTR_TO   WW(SIZE), mmux_libc_free WW(PTR_TO))

	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_FROM) 0 WW(SIZE) )
	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_TO)   0 WW(SIZE) )

	    fill_raw_memory WW(PTR_FROM) 0 WW(SIZE)
	    fill_raw_memory WW(PTR_TO)   0 WW(SIZE) 50

	    mbfl_location_leave_when_failure( mmux_libc_memccpy AFTER_SEPARATOR_PTR WW(PTR_TO) WW(PTR_FROM) WW(SEPARATOR_OCTET) WW(SIZE) )
	    mbfl_location_leave_when_failure( mmux_pointer_add COMPUTED_AFTER_SEPARATOR_PTR WW(PTR_TO) '6' )

	    # Retrieve the byte
	    mbfl_location_leave_when_failure( mmux_schar_pointer_ref RESULT WW(AFTER_SEPARATOR_PTR) '0')

	    if false
	    then
		declare -a ARRY_FROM ARRY_TO

		mmux-bash-pointers-array-from-memory ARRY_FROM WW(PTR_FROM) WW(SIZE)
		mmux-bash-pointers-array-from-memory ARRY_TO   WW(PTR_TO)   WW(SIZE)
		mbfl_array_dump ARRY_FROM
		mbfl_array_dump ARRY_TO
	    fi

	    dotest-debug WW(COMPUTED_AFTER_SEPARATOR_PTR) WW(AFTER_SEPARATOR_PTR)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT) &&
		dotest-predicate mmux_pointer_equal WW(COMPUTED_AFTER_SEPARATOR_PTR) WW(AFTER_SEPARATOR_PTR)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}

# The separator is not present in the source memory block.
#
function memory-memccpy-1.2 () {
    if mmux_bash_pointers_builtin_p mmux_libc_memccpy
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -ri SIZE=24
	    declare PTR_FROM PTR_TO
	    declare AFTER_SEPARATOR_PTR

	    declare -r SEPARATOR_OCTET='99'

	    COMPENSATE(mmux_libc_malloc PTR_FROM WW(SIZE), mmux_libc_free WW(PTR_FROM))
	    COMPENSATE(mmux_libc_malloc PTR_TO   WW(SIZE), mmux_libc_free WW(PTR_TO))

	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_FROM) 0 WW(SIZE) )
	    mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_TO)   0 WW(SIZE) )

	    fill_raw_memory WW(PTR_FROM) 0 WW(SIZE)
	    fill_raw_memory WW(PTR_TO)   0 WW(SIZE) 50

	    mbfl_location_leave_when_failure( mmux_libc_memccpy AFTER_SEPARATOR_PTR WW(PTR_TO) WW(PTR_FROM) WW(SEPARATOR_OCTET) WW(SIZE) )

	    dotest-equal "" QQ(AFTER_SEPARATOR_PTR)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### standard memory operations: memmove

function memory-memmove-1.1 () {
    declare -r EXPECTED_RESULT=1
    declare -ri SIZE=123
    declare PTR_FROM PTR_TO RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_libc_malloc PTR_FROM WW(SIZE),
		   mmux_libc_free WW(PTR_FROM))

	COMPENSATE(mmux_libc_malloc PTR_TO WW(SIZE),
		   mmux_libc_free WW(PTR_TO))

	mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_FROM) 1 WW(SIZE) )
	mbfl_location_leave_when_failure( mmux_libc_memset WW(PTR_TO)   0 WW(SIZE) )

	mbfl_location_leave_when_failure( mmux_libc_memmove WW(PTR_TO) WW(PTR_FROM) WW(SIZE) )
	mbfl_location_leave_when_failure( mmux_uint8_pointer_ref RESULT WW(PTR_TO) 10 )

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### let's go

dotest memory-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
