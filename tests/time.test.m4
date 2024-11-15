#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for time and date builtins
#!# Date: Nov 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/time.test ; less tests/time.log
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


#### struct timeval

function time-struct-timeval-1.0 () {
    dotest-predicate mmux_string_is_slong WW(mmux_libc_timeval_SIZEOF)
}
function time-struct-timeval-1.1 () {
    mbfl_location_enter
    {
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug

	# No init values.
	COMPENSATE(mmux_libc_timeval_make TIMEVAL, mmux_libc_free RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_ref SECONDS MICROSECONDS RR(TIMEVAL))

	dotest-equal 0 RR(SECONDS) &&
	    dotest-equal 0 RR(MICROSECONDS)
    }
    mbfl_location_leave
}
function time-struct-timeval-1.2 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_MICROSECONDS=456
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug

	COMPENSATE(mmux_libc_timeval_make TIMEVAL RR(INIT_SECONDS) RR(INIT_MICROSECONDS), mmux_libc_free RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_ref SECONDS MICROSECONDS RR(TIMEVAL))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_MICROSECONDS) RR(MICROSECONDS)
    }
    mbfl_location_leave
}



#### struct timespec

function time-struct-timespec-1.0 () {
    dotest-predicate mmux_string_is_slong WW(mmux_libc_timespec_SIZEOF)
}
function time-struct-timespec-1.1 () {
    mbfl_location_enter
    {
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug

	# No init values.
	COMPENSATE(mmux_libc_timespec_make TIMESPEC, mmux_libc_free RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_ref SECONDS NANOSECONDS RR(TIMESPEC) )

	dotest-equal 0 RR(SECONDS) &&
	    dotest-equal 0 RR(NANOSECONDS)
    }
    mbfl_location_leave
}
function time-struct-timespec-1.2 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_NANOSECONDS=456
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug

	COMPENSATE(mmux_libc_timespec_make TIMESPEC RR(INIT_SECONDS) RR(INIT_NANOSECONDS), mmux_libc_free RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_ref SECONDS NANOSECONDS RR(TIMESPEC))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_NANOSECONDS) RR(NANOSECONDS)
    }
    mbfl_location_leave
}


#### let's go

dotest time-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
