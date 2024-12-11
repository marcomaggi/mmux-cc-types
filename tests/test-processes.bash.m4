#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for file processes builtins
#!# Date: Dec  6, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/processes.test ; less tests/processes.log
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


#### getpid

function processes-getpid-1.1 () {
    declare THE_PID

    mmux_libc_getpid THE_PID
    dotest-predicate mmux_string_is_pid WW(THE_PID)
}


#### getppid

function processes-getppid-1.1 () {
    declare THE_PID

    mmux_libc_getppid THE_PID
    dotest-predicate mmux_string_is_pid WW(THE_PID)
}


#### getttid

function processes-gettid-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_gettid
    then
	declare THE_PID THE_TPID

	mmux_libc_getpid THE_PID
	mmux_libc_gettid THE_TPID
	dotest-equal WW(THE_PID) WW(THE_TPID)
    else dotest-skipped
    fi
}


#### let's go

dotest processes-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
