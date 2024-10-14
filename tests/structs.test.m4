#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for data structures
#!# Date: Oct 14, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/structs.test ; less tests/structs.log
#!#
#!#	that will select these tests.
#!#
#!# Copyright (c) 2024 Marco Maggi
#!# <mrc.mgg@gmail.com>
#!#
#!# This program is free  software: you can redistribute it and/or modify it  under the terms of the
#!# GNU General Public License as published by the Free Software Foundation, either structs 3 of the
#!# License, or (at your option) any later structs.
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


#### version numbers

function structs-1.1 () {
    # Offsets of fields: sint A, double B, pointer C.
    declare -i OFFSET_A=0
    declare -i OFFSET_B=$((    OFFSET_A + mmux_sint_SIZEOF    ))
    declare -i OFFSET_C=$((    OFFSET_B + mmux_double_SIZEOF  ))
    declare -i STRUCT_SIZE=$(( OFFSET_C + mmux_pointer_SIZEOF ))

    dotest-unset-debug
    dotest-debug RR(STRUCT_SIZE)

    mbfl_declare_varref(PTR)

    function ref_A () {
	declare -n RESULT=RR(1)
	declare    PTR=RR(2)
	mmux_sint_pointer_ref RESULT WW(PTR) WW(OFFSET_A)
    }
    function ref_B () {
	declare -n RESULT=RR(1)
	declare    PTR=RR(2)
	declare OLD_FORMAT
	mmux_double_set_format "%f" OLD_FORMAT
	mmux_double_pointer_ref RESULT WW(PTR) WW(OFFSET_B)
	mmux_double_set_format WW(OLD_FORMAT)
    }
    function ref_C () {
	declare -n RESULT=RR(1)
	declare    PTR=RR(2)
	mmux_pointer_pointer_ref RESULT WW(PTR) WW(OFFSET_C)
    }

    function set_A () {
	declare PTR=RR(1)
	declare VALUE=RR(2)
	mmux_sint_pointer_set WW(PTR) WW(OFFSET_A) WW(VALUE)
    }
    function set_B () {
	declare PTR=RR(1)
	declare VALUE=RR(2)
	mmux_double_pointer_set WW(PTR) WW(OFFSET_B) WW(VALUE)
    }
    function set_C () {
	declare PTR=RR(1)
	declare VALUE=RR(2)
	mmux_pointer_pointer_set WW(PTR) WW(OFFSET_C) WW(VALUE)
    }

    mbfl_location_enter
    {
	mbfl_location_handler 'unset -f set_A set_B set_C ref_A ref_B ref_C'

	if mmux_libc_malloc _(PTR) WW(STRUCT_SIZE)
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi

	declare EXPECTED_RESULT_A='123' EXPECTED_RESULT_B='1.230000' EXPECTED_RESULT_C='0x789'
	declare RESULT_A RESULT_B RESULT_C

	set_A WW(PTR) WW(EXPECTED_RESULT_A)
	set_B WW(PTR) WW(EXPECTED_RESULT_B)
	set_C WW(PTR) WW(EXPECTED_RESULT_C)

	ref_A RESULT_A WW(PTR)
	ref_B RESULT_B WW(PTR)
	ref_C RESULT_C WW(PTR)

	dotest-equal	 WW(EXPECTED_RESULT_A) WW(RESULT_A) &&
	    dotest-equal WW(EXPECTED_RESULT_B) WW(RESULT_B) &&
	    dotest-equal WW(EXPECTED_RESULT_C) WW(RESULT_C)
    }
    mbfl_location_leave
}



#### let's go

dotest structs-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
