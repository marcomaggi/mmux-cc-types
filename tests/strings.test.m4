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


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


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


#### let's go

dotest strings-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
