#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for strings management
#!# Date: Nov  6, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/strings.test ; less tests/strings.log
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


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


#### conversion to/from bash strings

function strings-from-bash-1.1 () {
    declare -r EXPECTED_RESULT='ciao'
    declare PTR C I A O Z

    mbfl_location_enter
    {
	if mmux_pointer_from_bash_string PTR 'ciao'
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_leave_when_failure( mmux_schar_pointer_ref C RR(PTR) 0 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref I RR(PTR) 1 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref A RR(PTR) 2 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref O RR(PTR) 3 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref Z RR(PTR) 4 )

	dotest-predicate mmux_string_is_pointer WW(PTR) &&
	    dotest-equal 'c' WW(MMUX_BASH_POINTERS_ASCII_TABLE, WW(C)) &&
	    dotest-equal 'i' WW(MMUX_BASH_POINTERS_ASCII_TABLE, WW(I)) &&
	    dotest-equal 'a' WW(MMUX_BASH_POINTERS_ASCII_TABLE, WW(A)) &&
	    dotest-equal 'o' WW(MMUX_BASH_POINTERS_ASCII_TABLE, WW(O)) &&
	    dotest-equal 0 WW(Z)
    }
    mbfl_location_leave
}
function strings-to-bash-1.1 () {
    declare -r EXPECTED_RESULT='ciao'
    declare PTR STR

    mbfl_location_enter
    {
	if mmux_pointer_from_bash_string PTR 'ciao'
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string   STR WW(PTR) 4 )

	dotest-predicate mmux_string_is_pointer WW(PTR) &&
	    dotest-equal WW(EXPECTED_RESULT) WW(STR)
    }
    mbfl_location_leave
}
function strings-to-bash-1.2 () {
    declare -r EXPECTED_RESULT='ciao'
    declare PTR STR LEN

    mbfl_location_enter
    {
	if mmux_pointer_from_bash_string PTR 'ciao'
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR) WW(LEN) )

	dotest-predicate mmux_string_is_pointer WW(PTR) &&
	    dotest-equal WW(EXPECTED_RESULT) WW(STR)
    }
    mbfl_location_leave
}
function strings-to-bash-2.1 () {
    declare -r EXPECTED_RESULT='ciao'
    declare PTR STR LEN

    mbfl_location_enter
    {
	if mmux_pointer_from_bash_string PTR 'ciao'
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR) )

	dotest-predicate mmux_string_is_pointer WW(PTR) &&
	    dotest-equal WW(EXPECTED_RESULT) WW(STR)
    }
    mbfl_location_leave
}


#### strlen

function strings-strlen-1.1 () {
    declare -r EXPECTED_RESULT=4
    declare STR RESULT

    mbfl_location_enter
    {
	if mmux_libc_malloc STR 5
	then mbfl_location_handler "mmux_libc_free RR(STR)"
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(STR) 0 65 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(STR) 1 66 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(STR) 2 67 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(STR) 3 68 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(STR) 4 0 )

	mbfl_location_leave_when_failure(mmux_libc_strlen RESULT RR(STR))

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function strings-strlen-1.2 () {
    declare -r EXPECTED_RESULT=0
    declare STR RESULT

    mbfl_location_enter
    {
	if mmux_libc_malloc STR 5
	then mbfl_location_handler "mmux_libc_free RR(STR)"
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_leave_when_failure(mmux_schar_pointer_set RR(STR) 0 0)
	mbfl_location_leave_when_failure(mmux_libc_strlen RESULT RR(STR))

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### strnlen

function strings-strnlen-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strnlen
    then
	mbfl_location_enter
	{
	    declare -r EXPECTED_RESULT=10
	    declare STR
	    declare -i LEN

	    if mmux_pointer_from_bash_string PTR 'ciao mamma'
	    then mbfl_location_handler "mmux_libc_free RR(PTR)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    mbfl_location_leave_when_failure(mmux_libc_strnlen LEN RR(PTR) 123)
	    dotest-equal WW(EXPECTED_RESULT) WW(LEN)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strnlen-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strnlen
    then
	mbfl_location_enter
	{
	    declare -r EXPECTED_RESULT=4
	    declare STR
	    declare -i LEN

	    if mmux_pointer_from_bash_string PTR 'ciao mamma'
	    then mbfl_location_handler "mmux_libc_free RR(PTR)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    mbfl_location_leave_when_failure(mmux_libc_strnlen LEN RR(PTR) 4)
	    dotest-equal WW(EXPECTED_RESULT) WW(LEN)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### strcpy

function strings-strcpy-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma' ORIGINAL_STRING='ciao mamma'
    declare STR PTR1 PTR2
    declare -i LEN LEN_PLUS

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 WW(ORIGINAL_STRING),
		    mmux_libc_free RR(PTR1) )

	mbfl_location_leave_when_failure( mmux_libc_strlen LEN WW(PTR1) )
	mmux_usize_incr LEN_PLUS RR(LEN)

	COMPENSATE( mmux_libc_malloc PTR2 RR(LEN_PLUS),
		    mmux_libc_free WW(PTR2))

	mbfl_location_leave_when_failure( mmux_libc_strcpy RR(PTR2) RR(PTR1) )

	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )
	dotest-equal WW(EXPECTED_STRING) WW(STR)
    }
    mbfl_location_leave
}


#### strdup

function strings-strdup-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma'
    declare STR PTR1 PTR2
    declare -i LEN

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 'ciao mamma',
		    mmux_libc_free RR(PTR1) )
	COMPENSATE( mmux_libc_strdup PTR2 RR(PTR1),
		    mmux_libc_free RR(PTR2) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )
	dotest-equal WW(EXPECTED_STRING) WW(STR)
    }
    mbfl_location_leave
}


#### stpcpy

function strings-stpcpy-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma' ORIGINAL_STRING='ciao mamma'
    declare EXPECTED_AFTER_PTR AFTER_PTR
    declare STR PTR1 PTR2
    declare -i LEN LEN_PLUS

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 WW(ORIGINAL_STRING),
		    mmux_libc_free RR(PTR1) )

	mbfl_location_leave_when_failure( mmux_libc_strlen LEN WW(PTR1) )
	mmux_usize_incr LEN_PLUS RR(LEN)

	COMPENSATE( mmux_libc_malloc PTR2 RR(LEN_PLUS),
		    mmux_libc_free WW(PTR2))

	mbfl_location_leave_when_failure( mmux_libc_stpcpy AFTER_PTR RR(PTR2) RR(PTR1) )

	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )

	mmux_pointer_add EXPECTED_AFTER_PTR RR(PTR2) RR(LEN)

	dotest-equal WW(EXPECTED_STRING) WW(STR) &&
	    dotest-equal WW(EXPECTED_AFTER_PTR) WW(AFTER_PTR)
    }
    mbfl_location_leave
}


#### strcat

function strings-strcat-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma' ORIGINAL_STRING1='ciao ' ORIGINAL_STRING2='mamma'
    declare STRING PTR1 PTR2 PTR3
    declare -i LEN1 LEN2 LEN3 LEN3_PLUS

    dotest-unset-debug

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 WW(ORIGINAL_STRING1), mmux_libc_free RR(PTR1) )
	COMPENSATE( mmux_pointer_from_bash_string PTR2 WW(ORIGINAL_STRING2), mmux_libc_free RR(PTR2) )

	mbfl_location_leave_when_failure( mmux_libc_strlen LEN1 RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN2 RR(PTR2) )
	mbfl_location_leave_when_failure( mmux_usize_add LEN3 RR(LEN2) RR(LEN1) )
	mbfl_location_leave_when_failure( mmux_usize_incr LEN3_PLUS RR(LEN3) )

	dotest-debug LEN3_PLUS=RR(LEN3_PLUS)

	COMPENSATE( mmux_libc_malloc PTR3 RR(LEN3_PLUS), mmux_libc_free RR(PTR3) )
	mmux_schar_pointer_set RR(PTR3) 0 0

	mbfl_location_leave_when_failure( mmux_libc_strcat RR(PTR3) RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strcat RR(PTR3) RR(PTR2) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STRING RR(PTR3) )
	dotest-equal WW(EXPECTED_STRING) WW(STRING)
    }
    mbfl_location_leave
}


#### let's go

dotest strings-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
