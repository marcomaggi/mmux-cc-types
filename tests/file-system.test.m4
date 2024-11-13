#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for file system interface
#!# Date: Nov 13, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/file-system.test ; less tests/file-system.log
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


#### link

function file-system-link-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare NEWNAME

	printf -v NEWNAME '%s/%s' WW(TMP) 'spiffy.ext'
	dotest-debug NEWNAME=WW(NEWNAME)

	dotest-mktmpdir
	mbfl_location_leave_when_failure( mmux_libc_link WW(OLDNAME) WW(NEWNAME) )

	dotest-assert-file-exists WW(NEWNAME) 'new hard link is missing'
    }
    mbfl_location_leave
}
function file-system-link-2.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare NEWNAME
	declare ERRNO

	printf -v NEWNAME '%s/%s' WW(TMP) 'spiffy.ext'
	dotest-debug OLDNAME=WW(OLDNAME) NEWNAME=WW(NEWNAME)

	# If we do not create the tmpdir first with "dotest-mktmpdir": creating the link will fail.
	if mmux_libc_link WW(OLDNAME) WW(NEWNAME)
	then mbfl_location_leave_then_return_failure
	else
	    declare ERRMSG

	    mmux_libc_strerror ERRMSG RR(ERRNO)
	    dotest-debug strerror message WW(ERRMSG)
	    true
	fi
    }
    mbfl_location_leave
}


#### linkat

function file-system-linkat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare NEWNAME

	printf -v NEWNAME '%s/%s' WW(TMP) 'spiffy.ext'
	dotest-debug NEWNAME=WW(NEWNAME)

	dotest-mktmpdir
	mbfl_location_leave_when_failure( mmux_libc_linkat RR(mmux_libc_AT_FDCWD) WW(OLDNAME) \
							   RR(mmux_libc_AT_FDCWD) WW(NEWNAME) \
							   RR(mmux_libc_AT_SYMLINK_FOLLOW) )

	dotest-assert-file-exists WW(NEWNAME) 'new hard link is missing'
    }
    mbfl_location_leave
}


#### symlink

function file-system-symlink-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare NEWNAME

	printf -v NEWNAME '%s/%s' WW(TMP) 'spiffy.ext'
	dotest-debug NEWNAME=WW(NEWNAME)

	dotest-mktmpdir
	mbfl_location_leave_when_failure( mmux_libc_symlink WW(OLDNAME) WW(NEWNAME) )

	dotest-predicate mbfl_file_is_symlink WW(NEWNAME)
    }
    mbfl_location_leave
}


#### readlink

function file-system-readlink-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare NEWNAME REALNAME

	printf -v NEWNAME '%s/%s' WW(TMP) 'spiffy.ext'
	dotest-debug NEWNAME=WW(NEWNAME)

	dotest-mktmpdir
	mbfl_location_leave_when_failure( mmux_libc_symlink WW(OLDNAME) WW(NEWNAME) )
	mbfl_location_leave_when_failure( mmux_libc_readlink REALNAME WW(NEWNAME) )

	dotest-equal WW(OLDNAME) WW(REALNAME)
    }
    mbfl_location_leave
}


#### canonicalize_file_name

function file-system-canonicalize_file_name-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_canonicalize_file_name
    then
	mbfl_location_enter
	{
	    mbfl_location_handler dotest-clean-files

	    dotest-unset-debug
	    declare -r TMP=$(dotest-echo-tmpdir)
	    declare OLDNAME='Makefile'
	    declare EXPECTED_RESULT="$(pwd -P)/Makefile"

	    mbfl_location_leave_when_failure( mmux_libc_canonicalize_file_name REALNAME WW(OLDNAME) )

	    dotest-equal WW(EXPECTED_RESULT) WW(REALNAME)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### realpath

function file-system-realpath-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug
	declare -r TMP=$(dotest-echo-tmpdir)
	declare OLDNAME='Makefile'
	declare EXPECTED_RESULT="$(pwd -P)/Makefile"

	mbfl_location_leave_when_failure( mmux_libc_realpath REALNAME WW(OLDNAME) )

	dotest-equal WW(EXPECTED_RESULT) WW(REALNAME)
    }
    mbfl_location_leave
}


#### unlink

function file-system-unlink-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_unlink WW(PATHNAME) )
    }
    mbfl_location_leave
}


#### unlinkat

function file-system-unlinkat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_unlinkat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) 0)
    }
    mbfl_location_leave
}


#### remove

function file-system-remove-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_remove WW(PATHNAME) )
    }
    mbfl_location_leave
}


#### rmdir

function file-system-rmdir-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkdir 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_rmdir WW(PATHNAME) )
    }
    mbfl_location_leave
}


#### rename

function file-system-rename-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r OLDNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r NEWNAME=$(dotest-mkpathname 'peppa.ext')

	mbfl_location_leave_when_failure( mmux_libc_rename WW(OLDNAME) WW(NEWNAME) )
	dotest-assert-file-exists WW(NEWNAME) 'new hard link is missing'
    }
    mbfl_location_leave
}


#### renameat

function file-system-renameat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r OLDNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r NEWNAME=$(dotest-mkpathname 'peppa.ext')

	mbfl_location_leave_when_failure( mmux_libc_renameat RR(mmux_libc_AT_FDCWD) WW(OLDNAME) \
							     RR(mmux_libc_AT_FDCWD) WW(NEWNAME) )
	dotest-assert-file-exists WW(NEWNAME) 'new hard link is missing'
    }
    mbfl_location_leave
}


#### renameat2

function file-system-renameat2-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_renameat2
    then
	mbfl_location_enter
	{
	    mbfl_location_handler dotest-clean-files

	    dotest-set-debug

	    # We use the flag "RENAME_EXCHANGE", so both the pathnames must exist.
	    declare -r OLDNAME=$(dotest-mkfile 'spiffy.ext')
	    declare -r NEWNAME=$(dotest-mkfile 'peppa.ext')

	    mbfl_location_leave_when_failure( mmux_libc_renameat2 RR(mmux_libc_AT_FDCWD) WW(OLDNAME) \
								  RR(mmux_libc_AT_FDCWD) WW(NEWNAME) \
								  RR(mmux_libc_RENAME_EXCHANGE) )
	    dotest-assert-file-exists WW(NEWNAME) 'new hard link is missing'
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mkdir

function file-system-mkdir-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkpathname 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_mkdir WW(PATHNAME) RR(mmux_libc_S_IRUSR) )
	dotest-predicate mbfl_file_is_directory WW(PATHNAME)
    }
    mbfl_location_leave
}


#### mkdirat

function file-system-mkdirat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkpathname 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_mkdirat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(mmux_libc_S_IRUSR) )
	dotest-predicate mbfl_file_is_directory WW(PATHNAME)
    }
    mbfl_location_leave
}


#### let's go

dotest file-system-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
