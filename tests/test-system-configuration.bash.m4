#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for system interfaces
#!# Date: Dec  7, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/systems.test ; less tests/systems.log
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


#### sysconf

function system-configuration-sysconf-1.1 () {
    mbfl_location_enter
    {
	declare VALUE

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_sysconf VALUE RR(mmux_libc__SC_PAGESIZE) )
	dotest-debug VALUE=RR(VALUE)
	dotest-predicate mmux_string_is_slong RR(VALUE)
    }
    mbfl_location_leave
}


#### confstr

function system-configuration-confstr-1.1 () {
    mbfl_location_enter
    {
	declare VALUE

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_confstr VALUE RR(mmux_libc__CS_PATH) )
	dotest-debug VALUE=RR(VALUE)
	true
    }
    mbfl_location_leave
}


#### let's go

dotest system-configuration-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
