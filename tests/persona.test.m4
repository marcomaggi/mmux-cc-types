#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for persona builtins
#!# Date: Nov 14, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/persona.test ; less tests/persona.log
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


#### getuid

function persona-getuid-1.1 () {
    mbfl_location_enter
    {
	declare THE_UID

	mbfl_location_leave_when_failure( mmux_libc_getuid THE_UID )
	dotest-predicate mmux_string_is_uid WW(THE_UID)
    }
    mbfl_location_leave
}


#### getgid

function persona-getgid-1.1 () {
    mbfl_location_enter
    {
	declare THE_GID

	mbfl_location_leave_when_failure( mmux_libc_getgid THE_GID )
	dotest-predicate mmux_string_is_gid WW(THE_GID)
    }
    mbfl_location_leave
}


#### let's go

dotest persona-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
