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


#### simple struct building

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
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	mmux_sint_pointer_ref RESULT WW(PTR) WW(OFFSET_A)
    }
    function ref_B () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	mmux_double_pointer_ref RESULT WW(PTR) WW(OFFSET_B)
    }
    function ref_C () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	mmux_pointer_pointer_ref RESULT WW(PTR) WW(OFFSET_C)
    }

    function set_A () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	mmux_sint_pointer_set WW(PTR) WW(OFFSET_A) WW(VALUE)
    }
    function set_B () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	mmux_double_pointer_set WW(PTR) WW(OFFSET_B) WW(VALUE)
    }
    function set_C () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	mmux_pointer_pointer_set WW(PTR) WW(OFFSET_C) WW(VALUE)
    }

    function constructor () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(A,   2, value of field A)
	mbfl_mandatory_parameter(B,   3, value of field B)
	mbfl_mandatory_parameter(C,   4, value of field C)
	set_A WW(PTR) WW(A)
	set_B WW(PTR) WW(B)
	set_C WW(PTR) WW(C)
    }

    mbfl_location_enter
    {
	mbfl_location_handler 'unset -f set_A set_B set_C ref_A ref_B ref_C constructor'

	if mmux_libc_malloc _(PTR) WW(STRUCT_SIZE)
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi

	declare EXPECTED_RESULT_A='123' EXPECTED_RESULT_B='1.230000' EXPECTED_RESULT_C='0x789'
	declare RESULT_A RESULT_B RESULT_C

	constructor WW(PTR) WW(EXPECTED_RESULT_A) WW(EXPECTED_RESULT_B) WW(EXPECTED_RESULT_C)

	ref_A RESULT_A WW(PTR)
	ref_B RESULT_B WW(PTR)
	ref_C RESULT_C WW(PTR)

	mmux_double_reformat RESULT_B '%f' WW(RESULT_B)

	dotest-equal	 WW(EXPECTED_RESULT_A) WW(RESULT_A) &&
	    dotest-equal WW(EXPECTED_RESULT_B) WW(RESULT_B) &&
	    dotest-equal WW(EXPECTED_RESULT_C) WW(RESULT_C)
    }
    mbfl_location_leave
}


#### field specs

function structs-2.1 () {
    m4_define([[[DEFINE_TYPED_FIELDS_SPEC]]],
	      [[[declare -rA mmux_$1_STRUCT_FIELD=([SIZEOF]=$mmux_$1_SIZEOF
						   [WIDTH]=$mmux_$2_SIZEOF
						   [SET]=mmux_$1_pointer_set
						   [REF]=mmux_$1_pointer_ref)]]])

    DEFINE_TYPED_FIELDS_SPEC(pointer,pointer)
    DEFINE_TYPED_FIELDS_SPEC(schar,sintmax)
    DEFINE_TYPED_FIELDS_SPEC(sint,sintmax)
    DEFINE_TYPED_FIELDS_SPEC(double,double)

    # Fields: sint A, double B, schar C, pointer D.

    m4_define([[[DEFINE_STRUCT_FIELD_DESCRIPTOR]]],
	      [[[declare -A '$1_field_$2'; mbfl_array_copy '$1_field_$2' '$3_STRUCT_FIELD']]])

    DEFINE_STRUCT_FIELD_DESCRIPTOR(spiffy_struct,A,mmux_sint)
    DEFINE_STRUCT_FIELD_DESCRIPTOR(spiffy_struct,B,mmux_double)
    DEFINE_STRUCT_FIELD_DESCRIPTOR(spiffy_struct,C,mmux_schar)
    DEFINE_STRUCT_FIELD_DESCRIPTOR(spiffy_struct,D,mmux_pointer)

    #mbfl_array_dump spiffy_struct_field_A

    declare -A spiffy_struct
    SS(spiffy_struct_field_A,OFFSET)=0
    SS(spiffy_struct_field_B,OFFSET)=$(( WW(spiffy_struct_field_A,OFFSET) + WW(spiffy_struct_field_A,WIDTH) ))
    SS(spiffy_struct_field_C,OFFSET)=$(( WW(spiffy_struct_field_B,OFFSET) + WW(spiffy_struct_field_B,WIDTH) ))
    SS(spiffy_struct_field_D,OFFSET)=$(( WW(spiffy_struct_field_C,OFFSET) + WW(spiffy_struct_field_C,WIDTH) ))
    SS(spiffy_struct,SIZEOF)=$((         WW(spiffy_struct_field_D,OFFSET) + WW(spiffy_struct_field_D,WIDTH) ))
    # Make it readonly after it has been created.
    declare -r spiffy_struct spiffy_struct_field_A spiffy_struct_field_B spiffy_struct_field_C spiffy_struct_field_D

    dotest-set-debug
    dotest-debug RR(spiffy_struct,SIZEOF)

    function ref_A () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	RR(spiffy_struct_field_A,REF) RESULT WW(PTR) WW(spiffy_struct_field_A,OFFSET)
    }
    function ref_B () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	RR(spiffy_struct_field_B,REF) RESULT WW(PTR) WW(spiffy_struct_field_B,OFFSET)
    }
    function ref_C () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	RR(spiffy_struct_field_C,REF) RESULT WW(PTR) WW(spiffy_struct_field_C,OFFSET)
    }
    function ref_D () {
	mbfl_mandatory_nameref_parameter(RESULT, 1, result variable)
	mbfl_mandatory_parameter(PTR, 2, pointer to struct)
	RR(spiffy_struct_field_D,REF) RESULT WW(PTR) WW(spiffy_struct_field_D,OFFSET)
    }

    function set_A () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	RR(spiffy_struct_field_A,SET) WW(PTR) WW(spiffy_struct_field_A,OFFSET) WW(VALUE)
    }
    function set_B () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	RR(spiffy_struct_field_B,SET) WW(PTR) WW(spiffy_struct_field_B,OFFSET) WW(VALUE)
    }
    function set_C () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	RR(spiffy_struct_field_C,SET) WW(PTR) WW(spiffy_struct_field_C,OFFSET) WW(VALUE)
    }
    function set_D () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(VALUE, 2, field value)
	RR(spiffy_struct_field_D,SET) WW(PTR) WW(spiffy_struct_field_D,OFFSET) WW(VALUE)
    }

    function constructor () {
	mbfl_mandatory_parameter(PTR, 1, pointer to struct)
	mbfl_mandatory_parameter(A,   2, value of field A)
	mbfl_mandatory_parameter(B,   3, value of field B)
	mbfl_mandatory_parameter(C,   4, value of field C)
	mbfl_mandatory_parameter(D,   5, value of field D)
	set_A WW(PTR) WW(A)
	set_B WW(PTR) WW(B)
	set_C WW(PTR) WW(C)
	set_D WW(PTR) WW(D)
    }

    mbfl_location_enter
    {
	mbfl_location_handler 'unset -f set_A set_B set_C set_D ref_A ref_B ref_C ref_D constructor'

	mbfl_declare_varref(PTR)

	if mmux_libc_malloc _(PTR) WW(spiffy_struct,SIZEOF)
	then mbfl_location_handler "mmux_libc_free RR(PTR)"
	else mbfl_location_leave_then_return_failure
	fi

	declare EXPECTED_RESULT_A='123' EXPECTED_RESULT_B='1.230000' EXPECTED_RESULT_C='65' EXPECTED_RESULT_D='0x789'
	declare RESULT_A RESULT_B RESULT_C

	constructor WW(PTR) WW(EXPECTED_RESULT_A) WW(EXPECTED_RESULT_B) WW(EXPECTED_RESULT_C) WW(EXPECTED_RESULT_D)

	ref_A RESULT_A WW(PTR)
	ref_B RESULT_B WW(PTR)
	ref_C RESULT_C WW(PTR)
	ref_D RESULT_D WW(PTR)

	mmux_double_reformat RESULT_B '%f' WW(RESULT_B)

	dotest-debug A=WW(RESULT_A) B=WW(RESULT_B) C=WW(RESULT_C) D=WW(RESULT_D)
	dotest-equal	 WW(EXPECTED_RESULT_A) WW(RESULT_A) &&
	    dotest-equal WW(EXPECTED_RESULT_B) WW(RESULT_B) &&
	    dotest-equal WW(EXPECTED_RESULT_C) WW(RESULT_C) &&
	    dotest-equal WW(EXPECTED_RESULT_D) WW(RESULT_D)
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
