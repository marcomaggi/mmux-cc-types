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

LC_COLLATE=C


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

	mbfl_location_leave_when_failure( mmux_libc_strcpy RR(PTR2) RR(PTR1))

	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )
	dotest-equal WW(EXPECTED_STRING) WW(STR)
    }
    mbfl_location_leave
}


#### strncpy

function strings-strncpy-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma' ORIGINAL_STRING='ciao mamma'
    declare STR PTR1 PTR2
    declare -i LEN LEN_PLUS

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 WW(ORIGINAL_STRING),
		    mmux_libc_free RR(PTR1) )

	mbfl_location_leave_when_failure( mmux_libc_strlen LEN WW(PTR1) )
	mmux_usize_add LEN_PLUS RR(LEN) 10

	COMPENSATE( mmux_libc_malloc PTR2 RR(LEN_PLUS),
		    mmux_libc_free WW(PTR2))

	mbfl_location_leave_when_failure( mmux_libc_strncpy RR(PTR2) RR(PTR1) RR(LEN_PLUS))

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


#### strndup

function strings-strndup-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strndup
    then
	declare -r EXPECTED_STRING='ciao'
	declare STR PTR1 PTR2
	declare -i LEN

	mbfl_location_enter
	{
	    COMPENSATE( mmux_pointer_from_bash_string PTR1 'ciao mamma',
			mmux_libc_free RR(PTR1) )
	    COMPENSATE( mmux_libc_strndup PTR2 RR(PTR1) 4,
			mmux_libc_free RR(PTR2) )
	    mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )
	    dotest-equal WW(EXPECTED_STRING) WW(STR)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
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


#### stpncpy

function strings-stpncpy-1.1 () {
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

	mbfl_location_leave_when_failure( mmux_libc_stpncpy AFTER_PTR RR(PTR2) RR(PTR1) RR(LEN_PLUS))

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


#### strncat

function strings-strncat-1.1 () {
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
	mbfl_location_leave_when_failure( mmux_schar_pointer_set RR(PTR3) 0 0 )

	mbfl_location_leave_when_failure( mmux_libc_strncat RR(PTR3) RR(PTR1) RR(LEN1))
	mbfl_location_leave_when_failure( mmux_libc_strncat RR(PTR3) RR(PTR2) RR(LEN2))
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STRING RR(PTR3) )
	dotest-equal WW(EXPECTED_STRING) WW(STRING)
    }
    mbfl_location_leave
}


#### strcmp

function strings-strcmp-1.1 () {
    declare PTR1 PTR2
    declare -i TERNARY

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'ciao mamma', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcmp TERNARY WW(PTR1) WW(PTR2) )
	(( 0 == TERNARY ))
    }
    mbfl_location_leave
}
function strings-strcmp-1.2 () {
    declare PTR1 PTR2
    declare -i TERNARY

    dotest-unset-debug

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcmp TERNARY WW(PTR1) WW(PTR2) )
	dotest-debug TERNARY=WW(TERNARY)
	(( 0 > TERNARY ))
    }
    mbfl_location_leave
}
function strings-strcmp-1.3 () {
    declare PTR1 PTR2
    declare -i TERNARY

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcmp TERNARY WW(PTR2) WW(PTR1) )
	(( 0 < TERNARY ))
    }
    mbfl_location_leave
}


#### strncmp

function strings-strncmp-1.1 () {
    declare PTR1 PTR2
    declare -i TERNARY LEN

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'ciao mamma', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strncmp TERNARY WW(PTR1) WW(PTR2) WW(LEN) )
	(( 0 == TERNARY ))
    }
    mbfl_location_leave
}
function strings-strncmp-1.2 () {
    declare PTR1 PTR2
    declare -i TERNARY LEN

    dotest-unset-debug

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strncmp TERNARY WW(PTR1) WW(PTR2) WW(LEN) )
	dotest-debug TERNARY=WW(TERNARY)
	(( 0 > TERNARY ))
    }
    mbfl_location_leave
}
function strings-strncmp-1.3 () {
    declare PTR1 PTR2
    declare -i TERNARY LEN

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strncmp TERNARY WW(PTR2) WW(PTR1) WW(LEN) )
	(( 0 < TERNARY ))
    }
    mbfl_location_leave
}


#### strcasecmp

function strings-strcasecmp-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strcasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'ciao mamma', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strcasecmp TERNARY WW(PTR1) WW(PTR2) )
	    (( 0 == TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strcasecmp-1.2 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strcasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY

	dotest-unset-debug

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strcasecmp TERNARY WW(PTR1) WW(PTR2) )
	    dotest-debug TERNARY=WW(TERNARY)
	    (( 0 > TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strcasecmp-1.3 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strcasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strcasecmp TERNARY WW(PTR2) WW(PTR1) )
	    (( 0 < TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### strncasecmp

function strings-strncasecmp-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strncasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY LEN

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'ciao mamma', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	    mbfl_location_leave_when_failure( mmux_libc_strncasecmp TERNARY WW(PTR1) WW(PTR2) WW(LEN) )
	    (( 0 == TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strncasecmp-1.2 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strncasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY LEN

	dotest-unset-debug

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	    mbfl_location_leave_when_failure( mmux_libc_strncasecmp TERNARY WW(PTR1) WW(PTR2) WW(LEN) )
	    dotest-debug TERNARY=WW(TERNARY)
	    (( 0 > TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strncasecmp-1.3 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strncasecmp
    then
	declare PTR1 PTR2
	declare -i TERNARY LEN

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 'CIAO MAMMA', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strlen LEN RR(PTR1) )
	    mbfl_location_leave_when_failure( mmux_libc_strncasecmp TERNARY WW(PTR2) WW(PTR1) WW(LEN) )
	    (( 0 < TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### strverscmp

function strings-strverscmp-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strverscmp
    then
	declare PTR1 PTR2
	declare -i TERNARY

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 '1.2.3', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 '1.2.3', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strverscmp TERNARY WW(PTR1) WW(PTR2) )
	    (( 0 == TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function strings-strverscmp-1.2 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strverscmp
    then
	declare PTR1 PTR2
	declare -i TERNARY

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR1 '1.2.3', mmux_libc_free RR(PTR1))
	    COMPENSATE(mmux_pointer_from_bash_string PTR2 '1.2.8', mmux_libc_free RR(PTR2))
	    mbfl_location_leave_when_failure( mmux_libc_strverscmp TERNARY WW(PTR1) WW(PTR2) )
	    (( 0 > TERNARY ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### strcoll

function strings-strcoll-1.1 () {
    declare PTR1 PTR2
    declare -i TERNARY

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'ciao mamma', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcoll TERNARY WW(PTR1) WW(PTR2) )
	(( 0 == TERNARY ))
    }
    mbfl_location_leave
}
function strings-strcoll-1.2 () {
    declare PTR1 PTR2
    declare -i TERNARY

    dotest-unset-debug

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcoll TERNARY WW(PTR1) WW(PTR2) )
	dotest-debug TERNARY=WW(TERNARY)
	(( 0 > TERNARY ))
    }
    mbfl_location_leave
}
function strings-strcoll-1.3 () {
    declare PTR1 PTR2
    declare -i TERNARY

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR1 'ciao mamma', mmux_libc_free RR(PTR1))
	COMPENSATE(mmux_pointer_from_bash_string PTR2 'hello world', mmux_libc_free RR(PTR2))
	mbfl_location_leave_when_failure( mmux_libc_strcoll TERNARY WW(PTR2) WW(PTR1) )
	(( 0 < TERNARY ))
    }
    mbfl_location_leave
}


#### strxfrm

function strings-strxfrm-1.1 () {
    declare -r EXPECTED_STRING='ciao mamma' ORIGINAL_STRING='ciao mamma'
    declare STR PTR1 PTR2
    declare -i LEN LEN_PLUS RESULT_USIZE

    mbfl_location_enter
    {
	COMPENSATE( mmux_pointer_from_bash_string PTR1 WW(ORIGINAL_STRING), mmux_libc_free RR(PTR1) )
	mbfl_location_leave_when_failure( mmux_libc_strlen LEN WW(PTR1) )
	mmux_usize_add LEN_PLUS RR(LEN) 1
	COMPENSATE( mmux_libc_malloc PTR2 RR(LEN_PLUS), mmux_libc_free WW(PTR2))

	mbfl_location_leave_when_failure( mmux_libc_strxfrm RESULT_USIZE RR(PTR2) RR(PTR1) RR(LEN_PLUS))

	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR WW(PTR2) )
	dotest-equal WW(EXPECTED_STRING) WW(STR)
    }
    mbfl_location_leave
}


#### strchr

function strings-strchr-1.1 () {
    declare RESULT_PTR RESULT_CHAR
    declare PTR
    declare -i LEN

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR 'CIAO MAMMA', mmux_libc_free RR(PTR))
	mbfl_location_leave_when_failure( mmux_libc_strchr RESULT_PTR RR(PTR) 65 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref RESULT_CHAR RR(RESULT_PTR) 0 )
	dotest-equal 65 WW(RESULT_CHAR)
    }
    mbfl_location_leave
}


#### strchrnul

function strings-strchrnul-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_strchrnul
    then
	declare RESULT_PTR RESULT_CHAR
	declare PTR
	declare -i LEN

	mbfl_location_enter
	{
	    COMPENSATE(mmux_pointer_from_bash_string PTR 'CIAO MAMMA', mmux_libc_free RR(PTR))
	    mbfl_location_leave_when_failure( mmux_libc_strchrnul RESULT_PTR RR(PTR) 65 )
	    mbfl_location_leave_when_failure( mmux_schar_pointer_ref RESULT_CHAR RR(RESULT_PTR) 0 )
	    dotest-equal 65 WW(RESULT_CHAR)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### strrchr

function strings-strrchr-1.1 () {
    declare RESULT_PTR RESULT_CHAR
    declare PTR
    declare -i LEN

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PTR 'CIAO MAMMA', mmux_libc_free RR(PTR))
	mbfl_location_leave_when_failure( mmux_libc_strrchr RESULT_PTR RR(PTR) 65 )
	mbfl_location_leave_when_failure( mmux_schar_pointer_ref RESULT_CHAR RR(RESULT_PTR) 0 )
	dotest-equal 65 WW(RESULT_CHAR)
    }
    mbfl_location_leave
}


#### strstr

function strings-strstr-1.1 () {
    declare HAYSTACK NEEDLE RESULT_PTR
    declare -i PTRDIFF

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string HAYSTACK 'CIAO MAMMA', mmux_libc_free RR(HAYSTACK))
	COMPENSATE(mmux_pointer_from_bash_string NEEDLE   'O MA',       mmux_libc_free RR(NEEDLE))

	mbfl_location_leave_when_failure( mmux_libc_strstr RESULT_PTR RR(HAYSTACK) RR(NEEDLE) )
	mbfl_location_leave_when_failure( mmux_pointer_diff PTRDIFF RR(RESULT_PTR) RR(HAYSTACK) )
	dotest-equal 3 WW(PTRDIFF)
    }
    mbfl_location_leave
}


#### strcasestr

function strings-strcasestr-1.1 () {
    declare HAYSTACK NEEDLE RESULT_PTR
    declare -i PTRDIFF

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string HAYSTACK 'CIAO MAMMA', mmux_libc_free RR(HAYSTACK))
	COMPENSATE(mmux_pointer_from_bash_string NEEDLE   'o ma',       mmux_libc_free RR(NEEDLE))

	mbfl_location_leave_when_failure( mmux_libc_strcasestr RESULT_PTR RR(HAYSTACK) RR(NEEDLE) )
	mbfl_location_leave_when_failure( mmux_pointer_diff PTRDIFF RR(RESULT_PTR) RR(HAYSTACK) )
	dotest-equal 3 WW(PTRDIFF)
    }
    mbfl_location_leave
}


#### strspn

function strings-strspn-1.1 () {
    declare STRING SKIPSET
    declare -i EXPECTED_RESULT=5 RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string STRING  'ciao mamma', mmux_libc_free RR(STRING))
	COMPENSATE(mmux_pointer_from_bash_string SKIPSET 'ciao ',      mmux_libc_free RR(SKIPSET))

	mbfl_location_leave_when_failure( mmux_libc_strspn RESULT RR(STRING) RR(SKIPSET) )
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### strcspn

function strings-strcspn-1.1 () {
    declare STRING STOPSET
    declare -i EXPECTED_RESULT=5 RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string STRING  'ciao mamma', mmux_libc_free RR(STRING))
	COMPENSATE(mmux_pointer_from_bash_string STOPSET 'm',          mmux_libc_free RR(STOPSET))

	mbfl_location_leave_when_failure( mmux_libc_strcspn RESULT RR(STRING) RR(STOPSET) )
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### strpbrk

function strings-strpbrk-1.1 () {
    declare STRING STOPSET
    declare EXPECTED_RESULT RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string STRING  'ciao mamma', mmux_libc_free RR(STRING))
	COMPENSATE(mmux_pointer_from_bash_string STOPSET 'm',          mmux_libc_free RR(STOPSET))

	mbfl_location_leave_when_failure( mmux_pointer_add EXPECTED_RESULT RR(STRING) 5 )

	mbfl_location_leave_when_failure( mmux_libc_strpbrk RESULT RR(STRING) RR(STOPSET) )
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### strtok

function strings-strtok-1.1 () {
    declare STRING
    declare -a TOKEN
    declare -r EXPECTED_TOKEN_0='uno' EXPECTED_TOKEN_1='due' EXPECTED_TOKEN_2='tre' EXPECTED_TOKEN_3='quattro'

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string STRING     'uno due tre quattro ', mmux_libc_free RR(STRING))
	COMPENSATE(mmux_pointer_from_bash_string DELIMITERS ' ', mmux_libc_free RR(DELIMITERS))

	mbfl_location_leave_when_failure( mmux_libc_strtok SS(TOKEN,0) RR(STRING) RR(DELIMITERS) )
	mbfl_location_leave_when_failure( mmux_libc_strtok SS(TOKEN,1) 0 RR(DELIMITERS) )
	mbfl_location_leave_when_failure( mmux_libc_strtok SS(TOKEN,2) 0 RR(DELIMITERS) )
	mbfl_location_leave_when_failure( mmux_libc_strtok SS(TOKEN,3) 0 RR(DELIMITERS) )

	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string SS(TOKEN,0) WW(TOKEN,0) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string SS(TOKEN,1) WW(TOKEN,1) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string SS(TOKEN,2) WW(TOKEN,2) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string SS(TOKEN,3) WW(TOKEN,3) )

	#mbfl_array_dump TOKEN

	dotest-equal WW(EXPECTED_TOKEN_0) WW(TOKEN,0) &&
	    dotest-equal WW(EXPECTED_TOKEN_1) WW(TOKEN,1) &&
	    dotest-equal WW(EXPECTED_TOKEN_2) WW(TOKEN,2) &&
	    dotest-equal WW(EXPECTED_TOKEN_3) WW(TOKEN,3)
    }
    mbfl_location_leave
}


#### basename

function strings-basename-1.1 () {
    declare PATHNAME
    declare EXPECTED_RESULT='filename.ext' RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PATHNAME '/path/to/filename.ext', mmux_libc_free RR(PATHNAME))
	mbfl_location_leave_when_failure( mmux_libc_basename RESULT RR(PATHNAME) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string RESULT WW(RESULT) )
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### dirname

function strings-dirname-1.1 () {
    declare PATHNAME
    declare EXPECTED_RESULT='/path/to' RESULT

    mbfl_location_enter
    {
	COMPENSATE(mmux_pointer_from_bash_string PATHNAME '/path/to/filename.ext', mmux_libc_free RR(PATHNAME))
	mbfl_location_leave_when_failure( mmux_libc_dirname RESULT RR(PATHNAME) )
	mbfl_location_leave_when_failure( mmux_pointer_to_bash_string RESULT WW(RESULT) )
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
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
