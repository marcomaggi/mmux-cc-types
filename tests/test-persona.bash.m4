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
	declare THE_GID
	declare -a THE_GIDS

	mbfl_location_leave_when_failure( mmux_libc_getgid THE_GID )
	mbfl_location_leave_when_failure( mmux_libc_getgrouplist THE_GIDS 'marco' RR(THE_GID))
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


#### group_member

function persona-group_member-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_group_member
    then
	mbfl_location_enter
	{
	    declare THE_GID
	    declare -i BOOL

	    dotest-unset-debug

	    mbfl_location_leave_when_failure( mmux_libc_getgid THE_GID )
	    mbfl_location_leave_when_failure( mmux_libc_group_member BOOL RR(THE_GID) )
	    dotest-debug BOOL=RR(BOOL)
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

	mbfl_location_leave_when_failure( mmux_libc_pw_name_ref PW_NAME RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_passwd_ref PW_PASSWD RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_uid_ref PW_UID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gid_ref PW_GID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gecos_ref PW_GECOS RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_dir_ref PW_DIR RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_shell_ref PW_SHELL RR(PASSWD) )

	mmux_libc_passwd_dump RR(PASSWD)

	# If we are here: it was a success.
	dotest-debug PASSWD=WW(PASSWD)
	dotest-debug PW_NAME=WW(PW_NAME)
	dotest-debug PW_PASSWD=WW(PW_PASSWD)
	dotest-debug PW_UID=WW(PW_UID)
	dotest-debug PW_GID=WW(PW_GID)
	dotest-debug PW_GECOS=QQ(PW_GECOS)
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

	mbfl_location_leave_when_failure( mmux_libc_pw_name_ref PW_NAME RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_passwd_ref PW_PASSWD RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_uid_ref PW_UID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gid_ref PW_GID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gecos_ref PW_GECOS RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_dir_ref PW_DIR RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_shell_ref PW_SHELL RR(PASSWD) )

	mmux_libc_passwd_dump RR(PASSWD)

	# If we are here: it was a success.
	dotest-debug PASSWD=WW(PASSWD)
	dotest-debug PW_NAME=WW(PW_NAME)
	dotest-debug PW_PASSWD=WW(PW_PASSWD)
	dotest-debug PW_UID=WW(PW_UID)
	dotest-debug PW_GID=WW(PW_GID)
	dotest-debug PW_GECOS=QQ(PW_GECOS)
	dotest-debug PW_DIR=WW(PW_DIR)
	dotest-debug PW_SHELL=WW(PW_SHELL)
	true
    }
    mbfl_location_leave
}


#### getpwent

function persona-getpwent-1.1 () {
    mbfl_location_enter
    {
	declare PASSWD PW_NAME PW_PASSWD PW_UID PW_GID PW_GECOS PW_DIR PW_SHELL
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_setpwent )
	mbfl_location_leave_when_failure( mmux_libc_getpwent PASSWD )

	mbfl_location_leave_when_failure( mmux_libc_pw_name_ref PW_NAME RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_passwd_ref PW_PASSWD RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_uid_ref PW_UID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gid_ref PW_GID RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_gecos_ref PW_GECOS RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_dir_ref PW_DIR RR(PASSWD) )
	mbfl_location_leave_when_failure( mmux_libc_pw_shell_ref PW_SHELL RR(PASSWD) )

	mbfl_location_leave_when_failure( mmux_libc_endpwent )

	# If we are here: it was a success.
	dotest-debug PASSWD=WW(PASSWD)
	dotest-debug PW_NAME=WW(PW_NAME)
	dotest-debug PW_PASSWD=WW(PW_PASSWD)
	dotest-debug PW_UID=WW(PW_UID)
	dotest-debug PW_GID=WW(PW_GID)
	dotest-debug PW_GECOS=QQ(PW_GECOS)
	dotest-debug PW_DIR=WW(PW_DIR)
	dotest-debug PW_SHELL=WW(PW_SHELL)
	true
    }
    mbfl_location_leave
}
function persona-getpwent-1.2 () {
    mbfl_location_enter
    {
	declare PASSWD PW_NAME PW_PASSWD PW_UID PW_GID PW_GECOS PW_DIR PW_SHELL
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_setpwent )

	mbfl_location_leave_when_failure( mmux_libc_getpwent PASSWD )
	until mmux_pointer_is_zero RR(PASSWD)
	do
	    mbfl_location_leave_when_failure( mmux_libc_pw_name_ref PW_NAME RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_passwd_ref PW_PASSWD RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_uid_ref PW_UID RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_gid_ref PW_GID RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_gecos_ref PW_GECOS RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_dir_ref PW_DIR RR(PASSWD) )
	    mbfl_location_leave_when_failure( mmux_libc_pw_shell_ref PW_SHELL RR(PASSWD) )

	    dotest-debug PASSWD=WW(PASSWD)
	    dotest-debug PW_NAME=WW(PW_NAME)
	    dotest-debug PW_PASSWD=WW(PW_PASSWD)
	    dotest-debug PW_UID=WW(PW_UID)
	    dotest-debug PW_GID=WW(PW_GID)
	    dotest-debug PW_GECOS=QQ(PW_GECOS)
	    dotest-debug PW_DIR=WW(PW_DIR)
	    dotest-debug PW_SHELL=WW(PW_SHELL)

	    mbfl_location_leave_when_failure( mmux_libc_getpwent PASSWD )
	done
	mbfl_location_leave_when_failure( mmux_libc_endpwent )
    }
    mbfl_location_leave
}


#### getgrgid

function persona-getgrgid-1.1 () {
    mbfl_location_enter
    {
	declare GID GROUP GR_NAME PW_GID
	declare -a GR_MEM
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_getgid GID )
	mbfl_location_leave_when_failure( mmux_libc_getgrgid GROUP RR(UID) )
	mbfl_location_leave_when_failure( mmux_libc_gr_name_ref  GR_NAME RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_gid_ref   GR_GID  RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_mem_ref   GR_MEM RR(GROUP) )

	mmux_libc_group_dump RR(GROUP)

	# If we are here: it was a success.
	dotest-debug GID=WW(GID)
	dotest-debug GROUP=WW(GROUP)
	dotest-debug GR_NAME=WW(GR_NAME)
	dotest-debug GR_GID=WW(GR_GID)
	{
	    declare -i IDX
	    for ((IDX=0; IDX < ${#GR_MEM[@]}; ++IDX))
	    do dotest-debug GR_MEM=WW(GR_MEM,$IDX)
	    done
	}
	true
    }
    mbfl_location_leave
}


#### getgrnam

function persona-getgrnam-1.1 () {
    mbfl_location_enter
    {
	declare GID GROUP GR_NAME PW_GID
	declare -a GR_MEM
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_getgid GID )
	mbfl_location_leave_when_failure( mmux_libc_getgrnam GROUP RR(USER) )
	mbfl_location_leave_when_failure( mmux_libc_gr_name_ref  GR_NAME RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_gid_ref   GR_GID  RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_mem_ref   GR_MEM RR(GROUP) )

	mmux_libc_group_dump RR(GROUP)

	# If we are here: it was a success.
	dotest-debug GID=WW(GID)
	dotest-debug GROUP=WW(GROUP)
	dotest-debug GR_NAME=WW(GR_NAME)
	dotest-debug GR_GID=WW(GR_GID)
	{
	    declare -i IDX
	    for ((IDX=0; IDX < ${#GR_MEM[@]}; ++IDX))
	    do dotest-debug GR_MEM=WW(GR_MEM,$IDX)
	    done
	}
	true
    }
    mbfl_location_leave
}


#### getgrent

function persona-getgrent-1.1 () {
    mbfl_location_enter
    {
	declare GROUP GR_NAME GR_GID
	declare -a GR_MEM
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_setgrent )
	mbfl_location_leave_when_failure( mmux_libc_getgrent GROUP )

	mbfl_location_leave_when_failure( mmux_libc_gr_name_ref  GR_NAME RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_gid_ref   GR_GID  RR(GROUP) )
	mbfl_location_leave_when_failure( mmux_libc_gr_mem_ref   GR_MEM RR(GROUP) )

	mbfl_location_leave_when_failure( mmux_libc_endgrent )

	# If we are here: it was a success.
	dotest-debug GROUP=WW(GROUP)
	dotest-debug GR_NAME=WW(GR_NAME)
	dotest-debug GR_GID=WW(GR_GID)
	{
	    declare -i IDX
	    for ((IDX=0; IDX < ${#GR_MEM[@]}; ++IDX))
	    do dotest-debug GR_MEM=WW(GR_MEM,$IDX)
	    done
	}
	true
    }
    mbfl_location_leave
}
function persona-getgrent-1.2 () {
    mbfl_location_enter
    {
	declare GROUP GR_NAME GR_GID
	declare -a GR_MEM
	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_setgrent )
	mbfl_location_leave_when_failure( mmux_libc_getgrent GROUP )

	until mmux_pointer_is_zero RR(GROUP)
	do
	    mbfl_location_leave_when_failure( mmux_libc_gr_name_ref  GR_NAME RR(GROUP) )
	    mbfl_location_leave_when_failure( mmux_libc_gr_gid_ref   GR_GID  RR(GROUP) )
	    mbfl_location_leave_when_failure( mmux_libc_gr_mem_ref   GR_MEM RR(GROUP) )

	    dotest-debug GROUP=WW(GROUP)
	    dotest-debug GR_NAME=WW(GR_NAME)
	    dotest-debug GR_GID=WW(GR_GID)
	    {
		declare -i IDX
		for ((IDX=0; IDX < ${#GR_MEM[@]}; ++IDX))
		do dotest-debug GR_MEM=WW(GR_MEM,$IDX)
		done
	    }

	    mbfl_location_leave_when_failure( mmux_libc_getgrent GROUP )
	done
	mbfl_location_leave_when_failure( mmux_libc_endgrent )
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
