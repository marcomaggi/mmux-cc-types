#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for error management
#!# Date: Sep 12, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/errors.test ; less tests/errors.log
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

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source "$MMUX_LIBRARY"


#### standard errors

function errors-strerror-1.1 () {
    declare MSG

    if test -v mmux_libc_EINVAL
    then mmux_libc_strerror MSG $mmux_libc_EINVAL
    else MSG='EINVAL undefined'
    fi
    dotest-equal 'Invalid argument' "$MSG"
}
function errors-strerror-1.2 () {
    declare MSG

    if test -v mmux_libc_ENOMEM
    then mmux_libc_strerror MSG $mmux_libc_ENOMEM
    else MSG='ENOMEM undefined'
    fi
    dotest-equal 'Cannot allocate memory' "$MSG"
}


#### errno to symbol

function errors-errno-to-symbol-1.1 () {
    declare SYM

    mmux_libc_errno_to_string SYM $mmux_libc_ENOMEM
    dotest-equal 'ENOMEM' "$SYM"
}


#### let's go

dotest errors-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
