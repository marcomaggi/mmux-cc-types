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


#### pathconf

function system-configuration-pathconf-1.1 () {
    mbfl_location_enter
    {
	declare VALUE

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_pathconf VALUE '/bin/sh' RR(mmux_libc__PC_LINK_MAX) )
	dotest-debug VALUE=RR(VALUE)
	dotest-predicate mmux_string_is_slong RR(VALUE)
    }
    mbfl_location_leave
}


#### struct rlimit

function system-configuration-struct-rlimit-1.1 () {
    mbfl_location_enter
    {
	declare RLIMIT_PTR RLIM_CUR RLIM_MAX

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_rlimit_calloc RLIMIT_PTR 1 2,
				  mmux_libc_free RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_rlim_cur_ref RLIM_CUR RR(RLIMIT_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_rlim_max_ref RLIM_MAX RR(RLIMIT_PTR) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_rlimit_dump RR(RLIMIT_PTR) >&2 )

	dotest-debug RLIM_CUR=RR(RLIM_CUR)
	dotest-debug RLIM_MAX=RR(RLIM_MAX)

	dotest-equal     1 RR(RLIM_CUR) &&
	    dotest-equal 2 RR(RLIM_MAX)
    }
    mbfl_location_leave
}
function system-configuration-struct-rlimit-1.2 () {
    mbfl_location_enter
    {
	declare RLIMIT_PTR RLIM_CUR RLIM_MAX

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_rlimit_calloc RLIMIT_PTR,
				  mmux_libc_free RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_rlim_cur_set RR(RLIMIT_PTR) 1 )
	mbfl_location_leave_when_failure( mmux_libc_rlim_max_set RR(RLIMIT_PTR) 2 )

	mbfl_location_leave_when_failure( mmux_libc_rlim_cur_ref RLIM_CUR RR(RLIMIT_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_rlim_max_ref RLIM_MAX RR(RLIMIT_PTR) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_rlimit_dump RR(RLIMIT_PTR) >&2 )

	dotest-debug RLIM_CUR=RR(RLIM_CUR)
	dotest-debug RLIM_MAX=RR(RLIM_MAX)

	dotest-equal     1 RR(RLIM_CUR) &&
	    dotest-equal 2 RR(RLIM_MAX)
    }
    mbfl_location_leave
}


#### getrlimit

function system-configuration-getrlimit-1.1 () {
    mbfl_location_enter
    {
	declare RLIMIT_PTR RLIM_CUR RLIM_MAX

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_rlimit_calloc RLIMIT_PTR,
				  mmux_libc_free RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_getrlimit RR(mmux_libc_RLIMIT_STACK) RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_rlim_cur_ref RLIM_CUR RR(RLIMIT_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_rlim_max_ref RLIM_MAX RR(RLIMIT_PTR) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_rlimit_dump RR(RLIMIT_PTR) >&2 )

	dotest-debug RLIM_CUR=RR(RLIM_CUR)
	dotest-debug RLIM_MAX=RR(RLIM_MAX)

	dotest-equal RR(mmux_libc_RLIM_INFINITY) RR(RLIM_MAX)
    }
    mbfl_location_leave
}


#### setrlimit

function system-configuration-setrlimit-1.1 () {
    mbfl_location_enter
    {
	declare RLIMIT_PTR RLIM_CUR=10000000 RLIM_MAX=RR(mmux_libc_RLIM_INFINITY)

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_rlimit_calloc RLIMIT_PTR RR(RLIM_CUR) RR(RLIM_MAX),
				  mmux_libc_free RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_setrlimit RR(mmux_libc_RLIMIT_STACK) RR(RLIMIT_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_setrlimit RR(mmux_libc_RLIMIT_STACK) RR(RLIMIT_PTR) )

	mbfl_location_leave_when_failure( mmux_libc_rlim_cur_ref RLIM_CUR RR(RLIMIT_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_rlim_max_ref RLIM_MAX RR(RLIMIT_PTR) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_rlimit_dump RR(RLIMIT_PTR) >&2 )

	dotest-debug RLIM_CUR=RR(RLIM_CUR)
	dotest-debug RLIM_MAX=RR(RLIM_MAX)

	dotest-equal RR(mmux_libc_RLIM_INFINITY) RR(RLIM_MAX)
    }
    mbfl_location_leave
}


#### prlimit

function system-configuration-prlimit-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_prlimit
    then
	mbfl_location_enter
	{
	    declare PID=0 RLIM_CUR=12300000 RLIM_MAX=RR(mmux_libc_RLIM_INFINITY)
	    declare NEW_RLIMIT_PTR OLD_RLIMIT_PTR

	    dotest-unset-debug

	    mbfl_location_compensate( mmux_libc_rlimit_calloc NEW_RLIMIT_PTR RR(RLIM_CUR) RR(RLIM_MAX),
				      mmux_libc_free RR(NEW_RLIMIT_PTR) )

	    mbfl_location_compensate( mmux_libc_rlimit_calloc OLD_RLIMIT_PTR,
				      mmux_libc_free RR(OLD_RLIMIT_PTR) )

	    mbfl_location_leave_when_failure( mmux_libc_prlimit RR(PID) RR(mmux_libc_RLIMIT_STACK) RR(NEW_RLIMIT_PTR) RR(OLD_RLIMIT_PTR) )

	    mbfl_location_leave_when_failure( mmux_libc_rlim_cur_ref RLIM_CUR RR(OLD_RLIMIT_PTR) )
	    mbfl_location_leave_when_failure( mmux_libc_rlim_max_ref RLIM_MAX RR(OLD_RLIMIT_PTR) )

	    dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_rlimit_dump RR(NEW_RLIMIT_PTR) >&2 )

	    dotest-debug RLIM_CUR=RR(RLIM_CUR)
	    dotest-debug RLIM_MAX=RR(RLIM_MAX)

	    dotest-equal RR(mmux_libc_RLIM_INFINITY) RR(RLIM_MAX)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest system-configuration-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
