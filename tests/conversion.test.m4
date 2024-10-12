#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for conversion functions
#!# Date: Sep 12, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/conversion.test ; less tests/conversion.log
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
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


#### conversion to/from index arrays

function conversion-array-1.1 () {
    declare -i SIZE=5
    declare POINTER
    mbfl_declare_index_array_varref(RESULT_ARRY)
    mbfl_declare_index_array_varref(ORIGIN_ARRY,(11 22 33 44 55))

    mbfl_location_enter
    {
	if mmux_libc_malloc POINTER $SIZE
	then mbfl_location_handler "mmux_libc_free $POINTER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-memory-from-array   $POINTER      _(ORIGIN_ARRY) $SIZE
	mmux-bash-pointers-array-from-memory _(RESULT_ARRY)    $POINTER     $SIZE

	dotest-equal     11 mbfl_slot_qref(RESULT_ARRY, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT_ARRY, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT_ARRY, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT_ARRY, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT_ARRY, 4)
    }
    mbfl_location_leave
}


#### conversion to/from string

function conversion-string-1.1 () {
    declare -i SIZE=5
    declare POINTER
    declare RESULT_STRING
    declare ORIGIN_STRING="ABCDE"

    mbfl_location_enter
    {
	if mmux_libc_malloc POINTER $SIZE
	then mbfl_location_handler "mmux_libc_free $POINTER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-memory-from-string $POINTER       $ORIGIN_STRING $SIZE
	mmux-bash-pointers-string-from-memory  RESULT_STRING $POINTER       $SIZE

	dotest-equal     A mbfl_string_idx(RESULT_STRING, 0) && \
	    dotest-equal B mbfl_string_idx(RESULT_STRING, 1) && \
	    dotest-equal C mbfl_string_idx(RESULT_STRING, 2) && \
	    dotest-equal D mbfl_string_idx(RESULT_STRING, 3) && \
	    dotest-equal E mbfl_string_idx(RESULT_STRING, 4)
    }
    mbfl_location_leave
}




#### let's go

dotest conversion-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
