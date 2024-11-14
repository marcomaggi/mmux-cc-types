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


#### geteuid

function persona-geteuid-1.1 () {
    mbfl_location_enter
    {
	declare THE_UID

	mbfl_location_leave_when_failure( mmux_libc_geteuid THE_UID )
	dotest-predicate mmux_string_is_uid WW(THE_UID)
    }
    mbfl_location_leave
}


#### getegid

function persona-getegid-1.1 () {
    mbfl_location_enter
    {
	declare THE_GID

	mbfl_location_leave_when_failure( mmux_libc_getegid THE_GID )
	dotest-predicate mmux_string_is_gid WW(THE_GID)
    }
    mbfl_location_leave
}


#### getgroups

function persona-getgroups-1.1 () {
    mbfl_location_enter
    {
	declare -a THE_GIDS

	mbfl_location_leave_when_failure( mmux_libc_getgroups THE_GIDS )
    }
    mbfl_location_leave
}


#### getgrouplist

function persona-getgrouplist-1.1 () {
    mbfl_location_enter
    {
	declare -a THE_GIDS

	mbfl_location_leave_when_failure( mmux_libc_getgrouplist THE_GIDS 'marco' 1000)
	#mbfl_array_dump THE_GIDS
    }
    mbfl_location_leave
}


#### getlogin

function persona-getlogin-1.1 () {
    mbfl_location_enter
    {
	declare USERNAME

	mbfl_location_leave_when_failure( mmux_libc_getlogin USERNAME )
	dotest-equal WW(USER) WW(USERNAME)
    }
    mbfl_location_leave
}


#### cuserid

function persona-cuserid-1.1 () {
    mbfl_location_enter
    {
	declare USERNAME

	mbfl_location_leave_when_failure( mmux_libc_cuserid USERNAME )
	dotest-equal WW(USER) WW(USERNAME)
    }
    mbfl_location_leave
}


#### group_member

function persona-group_member-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_group_member
    then
	mbfl_location_enter
	{
	    declare THE_GID
	    declare -i BOOL

	    mbfl_location_leave_when_failure( mmux_libc_getgid THE_GID )
	    mbfl_location_leave_when_failure( mmux_libc_group_member BOOL RR(THE_GID) )
	    (( 1 == RR(BOOL) ))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### getpwuid

function persona-getpwuid-1.1 () {
    mbfl_location_enter
    {
	declare PASSWD PW_NAME PW_PASSWD PW_UID PW_GID PW_GECOS PW_DIR PW_SHELL
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_getpwuid PASSWD RR(UID) )
	mbfl_location_leave_when_failure( mmux_libc_pw_name PW_NAME RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_passwd PW_PASSWD RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_uid PW_UID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gid PW_GID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gecos PW_GECOS RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_dir PW_DIR RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_shell PW_SHELL RR(PASSWD) )

	# If we are here: it was a success.
	dotest-debug PASSWD=WW(PASSWD)
	dotest-debug PW_NAME=WW(PW_NAME)
	dotest-debug PW_PASSWD=WW(PW_PASSWD)
	dotest-debug PW_UID=WW(PW_UID)
	dotest-debug PW_GID=WW(PW_GID)
	dotest-debug PW_GECOS=WW(PW_GECOS)
	dotest-debug PW_DIR=WW(PW_DIR)
	dotest-debug PW_SHELL=WW(PW_SHELL)
	true
    }
    mbfl_location_leave
}


#### getpwnam

function persona-getpwnam-1.1 () {
    mbfl_location_enter
    {
	declare PASSWD PW_NAME PW_PASSWD PW_UID PW_GID PW_GECOS PW_DIR PW_SHELL
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_getpwnam PASSWD WW(USER) )
	mbfl_location_leave_when_failure( mmux_libc_pw_name PW_NAME RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_passwd PW_PASSWD RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_uid PW_UID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gid PW_GID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gecos PW_GECOS RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_dir PW_DIR RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_shell PW_SHELL RR(PASSWD) )

	# If we are here: it was a success.
	dotest-debug PASSWD=WW(PASSWD)
	dotest-debug PW_NAME=WW(PW_NAME)
	dotest-debug PW_PASSWD=WW(PW_PASSWD)
	dotest-debug PW_UID=WW(PW_UID)
	dotest-debug PW_GID=WW(PW_GID)
	dotest-debug PW_GECOS=WW(PW_GECOS)
	dotest-debug PW_DIR=WW(PW_DIR)
	dotest-debug PW_SHELL=WW(PW_SHELL)
	true
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
