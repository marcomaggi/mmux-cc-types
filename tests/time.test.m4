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

# Constructor with init values.
#
function time-struct-timeval-1.1 () {
    mbfl_location_enter
    {
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug
	COMPENSATE(mmux_libc_timeval_malloc TIMEVAL, mmux_libc_free RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_ref SECONDS MICROSECONDS RR(TIMEVAL))
	dotest-equal 0 RR(SECONDS) &&
	    dotest-equal 0 RR(MICROSECONDS)
    }
    mbfl_location_leave
}

# Constructor with init values.
#
function time-struct-timeval-1.2 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_MICROSECONDS=456
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug

	COMPENSATE(mmux_libc_timeval_malloc TIMEVAL RR(INIT_SECONDS) RR(INIT_MICROSECONDS), mmux_libc_free RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_ref SECONDS MICROSECONDS RR(TIMEVAL))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_MICROSECONDS) RR(MICROSECONDS)
    }
    mbfl_location_leave
}

# Full getter and setter.
#
function time-struct-timeval-2.1 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_MICROSECONDS=456
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug
	COMPENSATE(mmux_libc_timeval_malloc TIMEVAL, mmux_libc_free RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_set RR(TIMEVAL) RR(INIT_SECONDS) RR(INIT_MICROSECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timeval_ref SECONDS MICROSECONDS RR(TIMEVAL))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_MICROSECONDS) RR(MICROSECONDS)
    }
    mbfl_location_leave
}

# Partial setters and getters.
#
function time-struct-timeval-3.1 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_MICROSECONDS=456
	declare TIMEVAL
	declare -i SECONDS MICROSECONDS

	dotest-unset-debug

	# No init values.
	COMPENSATE(mmux_libc_timeval_malloc TIMEVAL, mmux_libc_free RR(TIMEVAL))

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(TIMEVAL)  RR(INIT_SECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(TIMEVAL)  RR(INIT_MICROSECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_ref      SECONDS      RR(TIMEVAL))
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_ref MICROSECONDS RR(TIMEVAL))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_MICROSECONDS) RR(MICROSECONDS)
    }
    mbfl_location_leave
}


#### struct timespec

function time-struct-timespec-1.0 () {
    dotest-predicate mmux_string_is_slong WW(mmux_libc_timespec_SIZEOF)
}

# Constructor with init values.
#
function time-struct-timespec-1.1 () {
    mbfl_location_enter
    {
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug
	COMPENSATE(mmux_libc_timespec_malloc TIMESPEC, mmux_libc_free RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_ref SECONDS NANOSECONDS RR(TIMESPEC))
	dotest-equal 0 RR(SECONDS) &&
	    dotest-equal 0 RR(NANOSECONDS)
    }
    mbfl_location_leave
}

# Constructor with init values.
#
function time-struct-timespec-1.2 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_NANOSECONDS=456
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug

	COMPENSATE(mmux_libc_timespec_malloc TIMESPEC RR(INIT_SECONDS) RR(INIT_NANOSECONDS), mmux_libc_free RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_ref SECONDS NANOSECONDS RR(TIMESPEC))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_NANOSECONDS) RR(NANOSECONDS)
    }
    mbfl_location_leave
}

# Full getter and setter.
#
function time-struct-timespec-2.1 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_NANOSECONDS=456
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug
	COMPENSATE(mmux_libc_timespec_malloc TIMESPEC, mmux_libc_free RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_set RR(TIMESPEC) RR(INIT_SECONDS) RR(INIT_NANOSECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timespec_ref SECONDS NANOSECONDS RR(TIMESPEC))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_NANOSECONDS) RR(NANOSECONDS)
    }
    mbfl_location_leave
}

# Partial setters and getters.
#
function time-struct-timespec-3.1 () {
    mbfl_location_enter
    {
	declare -r INIT_SECONDS=123 INIT_NANOSECONDS=456
	declare TIMESPEC
	declare -i SECONDS NANOSECONDS

	dotest-unset-debug

	# No init values.
	COMPENSATE(mmux_libc_timespec_malloc TIMESPEC, mmux_libc_free RR(TIMESPEC))

	mbfl_location_leave_when_failure( mmux_libc_timespec_seconds_set      RR(TIMESPEC)  RR(INIT_SECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timespec_nanoseconds_set RR(TIMESPEC)  RR(INIT_NANOSECONDS))
	mbfl_location_leave_when_failure( mmux_libc_timespec_seconds_ref      SECONDS      RR(TIMESPEC))
	mbfl_location_leave_when_failure( mmux_libc_timespec_nanoseconds_ref NANOSECONDS RR(TIMESPEC))

	dotest-equal RR(INIT_SECONDS) RR(SECONDS) &&
	    dotest-equal RR(INIT_NANOSECONDS) RR(NANOSECONDS)
    }
    mbfl_location_leave
}


#### struct tm

function time-struct-tm-1.0 () {
    dotest-predicate mmux_string_is_slong WW(mmux_libc_tm_SIZEOF)
}

function time-struct-tm-1.1 () {
    mbfl_location_enter
    {
	declare TM SEC MIN HOUR MDAY MON YEAR WDAY YDAY ISDST GMTOFF

	dotest-unset-debug
	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))

	mbfl_location_leave_when_failure( mmux_libc_tm_sec_ref    SEC    RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_min_ref    MIN    RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_hour_ref   HOUR   RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_mday_ref   MDAY   RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_mon_ref    MON    RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_year_ref   YEAR   RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_wday_ref   WDAY   RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_yday_ref   YDAY   RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_isdst_ref  ISDST  RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_tm_gmtoff_ref GMTOFF RR(TM))

	dotest-debug TM=QQ(TM)
	dotest-debug SEC=QQ(SEC)
	dotest-debug MIN=QQ(MIN)
	dotest-debug HOUR=QQ(HOUR)
	dotest-debug MDAY=QQ(MDAY)
	dotest-debug MON=QQ(MON)
	dotest-debug YEAR=QQ(YEAR)
	dotest-debug WDAY=QQ(WDAY)
	dotest-debug YDAY=QQ(YDAY)
	dotest-debug ISDST=QQ(ISDST)
	dotest-debug GMTOFF=QQ(GMTOFF)
	true
    }
    mbfl_location_leave
}


#### time

function time-time-1.1 () {
    mbfl_location_enter
    {
	declare THE_TIME

	dotest-unset-debug
	mbfl_location_leave_when_failure( mmux_libc_time THE_TIME )
	dotest-predicate mmux_string_is_time WW(THE_TIME)
    }
    mbfl_location_leave
}


#### localtime

function time-localtime-1.1 () {
    mbfl_location_enter
    {
	declare TM
	declare -i THE_TIME

	dotest-unset-debug
	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_time THE_TIME )
	mbfl_location_leave_when_failure( mmux_libc_localtime RR(TM) RR(THE_TIME) )
	dotest-predicate mmux_string_is_time WW(THE_TIME)
    }
    mbfl_location_leave
}


#### gmtime

function time-gmtime-1.1 () {
    mbfl_location_enter
    {
	declare TM
	declare -i THE_TIME

	dotest-unset-debug
	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_time THE_TIME )
	mbfl_location_leave_when_failure( mmux_libc_gmtime RR(TM) RR(THE_TIME) )
	dotest-predicate mmux_string_is_time WW(THE_TIME)
    }
    mbfl_location_leave
}


#### mktime

function time-mktime-1.1 () {
    mbfl_location_enter
    {
	declare TM
	declare -i THE_TIME

	dotest-unset-debug
	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_mktime THE_TIME RR(TM) )
	dotest-predicate mmux_string_is_time WW(THE_TIME)
    }
    mbfl_location_leave
}


#### timegm

function time-timegm-1.1 () {
    mbfl_location_enter
    {
	declare TM
	declare -i THE_TIME

	dotest-unset-debug
	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_timegm THE_TIME RR(TM) )
	dotest-predicate mmux_string_is_time WW(THE_TIME)
    }
    mbfl_location_leave
}


#### asctime

function time-asctime-1.1 () {
    mbfl_location_enter
    {
	declare TM STRING

	dotest-unset-debug

	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_asctime STRING RR(TM) )
	dotest-debug QQ(STRING)
	true
    }
    mbfl_location_leave
}


#### ctime

function time-ctime-1.1 () {
    mbfl_location_enter
    {
	declare THE_TIME STRING

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_time THE_TIME )
	mbfl_location_leave_when_failure( mmux_libc_ctime STRING RR(THE_TIME) )
	dotest-debug QQ(STRING)
	true
    }
    mbfl_location_leave
}


#### strftime

function time-strftime-1.1 () {
    mbfl_location_enter
    {
	declare TM STRING TEMPLATE="%a, %d %b %Y %H:%M:%S %z"

	dotest-set-debug

	COMPENSATE(mmux_libc_tm_malloc TM, mmux_libc_free RR(TM))
	mbfl_location_leave_when_failure( mmux_libc_strftime STRING WW(TEMPLATE) RR(TM) )
	dotest-debug QQ(STRING)
	true
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
