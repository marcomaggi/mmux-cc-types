#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for the characters builtins
#!# Date: Nov 16, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/characters.test ; less tests/characters.log
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


#### schar_from_string

function characters-schar_from_string-1.1 () {
    declare STRING='A'
    declare -i ASCII_CODE

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) )
    dotest-equal 65 RR(ASCII_CODE)
}
function characters-schar_from_string-2.1 () {
    declare STRING='BOCCA'
    declare -i ASCII_CODE

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) 4 )
    dotest-equal 65 RR(ASCII_CODE)
}


#### schar_to_string

function characters-schar_to_string-1.1 () {
    declare STRING
    declare -i ASCII_CODE=65

    mbfl_location_leave_when_failure( mmux_libc_schar_to_string STRING RR(ASCII_CODE) )
    dotest-equal 'A' QQ(STRING)
}


#### islower

function characters-islower-1.1 () {
    declare STRING='A'
    declare -i ASCII_CODE

    dotest-unset-debug
    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) )
    dotest-debug ASCII_CODE=RR(ASCII_CODE)
    ! mmux_libc_islower RR(ASCII_CODE)
}
function characters-islower-1.2 () {
    declare STRING='a'
    declare -i ASCII_CODE

    dotest-unset-debug
    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) )
    dotest-debug ASCII_CODE=RR(ASCII_CODE)
    mmux_libc_islower RR(ASCII_CODE)
}


#### isupper

function characters-isupper-1.1 () {
    declare STRING='A'
    declare -i ASCII_CODE

    dotest-unset-debug
    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) )
    dotest-debug ASCII_CODE=RR(ASCII_CODE)
    mmux_libc_isupper RR(ASCII_CODE)
}
function characters-isupper-1.2 () {
    declare STRING='a'
    declare -i ASCII_CODE

    dotest-unset-debug
    mbfl_location_leave_when_failure( mmux_libc_schar_from_string ASCII_CODE WW(STRING) )
    dotest-debug ASCII_CODE=RR(ASCII_CODE)
    ! mmux_libc_isupper RR(ASCII_CODE)
}


#### tolower

function characters-tolower-1.1 () {
    declare INPUT_STRING='A' OUTPUT_STRING
    declare -i INPUT_ASCII_CODE OUTPUT_ASCII_CODE

    dotest-unset-debug

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string INPUT_ASCII_CODE WW(INPUT_STRING) )
    mbfl_location_leave_when_failure( mmux_libc_tolower OUTPUT_ASCII_CODE RR(INPUT_ASCII_CODE) )
    mbfl_location_leave_when_failure( mmux_libc_schar_to_string OUTPUT_STRING RR(OUTPUT_ASCII_CODE) )

    dotest-debug INPUT_ASCII_CODE=RR(INPUT_ASCII_CODE) OUTPUT_ASCII_CODE=RR(OUTPUT_ASCII_CODE)
    dotest-equal 'a' QQ(OUTPUT_STRING)
}
function characters-tolower-1.2 () {
    declare INPUT_STRING='a' OUTPUT_STRING
    declare -i INPUT_ASCII_CODE OUTPUT_ASCII_CODE

    dotest-unset-debug

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string INPUT_ASCII_CODE WW(INPUT_STRING) )
    mbfl_location_leave_when_failure( mmux_libc_tolower OUTPUT_ASCII_CODE RR(INPUT_ASCII_CODE) )
    mbfl_location_leave_when_failure( mmux_libc_schar_to_string OUTPUT_STRING RR(OUTPUT_ASCII_CODE) )

    dotest-debug INPUT_ASCII_CODE=RR(INPUT_ASCII_CODE) OUTPUT_ASCII_CODE=RR(OUTPUT_ASCII_CODE)
    dotest-equal 'a' QQ(OUTPUT_STRING)
}


#### toupper

function characters-toupper-1.1 () {
    declare INPUT_STRING='A' OUTPUT_STRING
    declare -i INPUT_ASCII_CODE OUTPUT_ASCII_CODE

    dotest-unset-debug

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string INPUT_ASCII_CODE WW(INPUT_STRING) )
    mbfl_location_leave_when_failure( mmux_libc_toupper OUTPUT_ASCII_CODE RR(INPUT_ASCII_CODE) )
    mbfl_location_leave_when_failure( mmux_libc_schar_to_string OUTPUT_STRING RR(OUTPUT_ASCII_CODE) )

    dotest-debug INPUT_ASCII_CODE=RR(INPUT_ASCII_CODE) OUTPUT_ASCII_CODE=RR(OUTPUT_ASCII_CODE)
    dotest-equal 'A' QQ(OUTPUT_STRING)
}
function characters-toupper-1.2 () {
    declare INPUT_STRING='a' OUTPUT_STRING
    declare -i INPUT_ASCII_CODE OUTPUT_ASCII_CODE

    dotest-unset-debug

    mbfl_location_leave_when_failure( mmux_libc_schar_from_string INPUT_ASCII_CODE WW(INPUT_STRING) )
    mbfl_location_leave_when_failure( mmux_libc_toupper OUTPUT_ASCII_CODE RR(INPUT_ASCII_CODE) )
    mbfl_location_leave_when_failure( mmux_libc_schar_to_string OUTPUT_STRING RR(OUTPUT_ASCII_CODE) )

    dotest-debug INPUT_ASCII_CODE=RR(INPUT_ASCII_CODE) OUTPUT_ASCII_CODE=RR(OUTPUT_ASCII_CODE)
    dotest-equal 'A' QQ(OUTPUT_STRING)
}


#### let's go

dotest characters-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
