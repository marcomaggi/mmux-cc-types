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


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


#### constants

function file-system-constants-1.0 () { mmux_string_is_slong RR(mmux_libc_AT_EACCESS) ; }
function file-system-constants-1.1 () { mmux_string_is_slong RR(mmux_libc_AT_EMPTY_PATH) ; }
function file-system-constants-1.2 () { mmux_string_is_slong RR(mmux_libc_AT_FDCWD) ; }
function file-system-constants-1.3 () { mmux_string_is_slong RR(mmux_libc_AT_REMOVEDIR) ; }
function file-system-constants-1.4 () { mmux_string_is_slong RR(mmux_libc_AT_SYMLINK_FOLLOW) ; }
function file-system-constants-1.5 () { mmux_string_is_slong RR(mmux_libc_AT_SYMLINK_NOFOLLOW) ; }
#function file-system-constants-1.6 () { mmux_string_is_slong RR(mmux_libc_MAXSYMLINKS) ; }
function file-system-constants-1.7 () { mmux_string_is_slong RR(mmux_libc_RENAME_EXCHANGE) ; }
function file-system-constants-1.8 () { mmux_string_is_slong RR(mmux_libc_RENAME_NOREPLACE) ; }
#function file-system-constants-1.9 () { mmux_string_is_slong RR(mmux_libc_RENAME_WITHEOUT) ; }


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


#### chown

function file-system-chown-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_chown WW(PATHNAME) RR(UID) RR(UID))
    }
    mbfl_location_leave
}


#### fchown

function file-system-fchown-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	if mmux_libc_open FD WW(PATHNAME) 0 0
	then mbfl_location_handler "mmux_libc_close RR(FD)"
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_leave_when_failure( mmux_libc_fchown WW(FD) RR(UID) RR(UID))
    }
    mbfl_location_leave
}


#### lchown

function file-system-lchown-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_lchown WW(PATHNAME) RR(UID) RR(UID))
    }
    mbfl_location_leave
}


#### fchownat

function file-system-fchownat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_fchownat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(UID) RR(UID) 0)
    }
    mbfl_location_leave
}


#### access

function file-system-access-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_access WW(PATHNAME) RR(mmux_libc_R_OK) )
    }
    mbfl_location_leave
}
function file-system-access-1.2 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_access WW(PATHNAME) RR(mmux_libc_W_OK) )
    }
    mbfl_location_leave
}
function file-system-access-1.3 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	dotest-debug PATHNAME=WW(PATHNAME)

	! mmux_libc_access WW(PATHNAME) RR(mmux_libc_X_OK)
    }
    mbfl_location_leave
}
function file-system-access-1.4 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r HOW=$(( mmux_libc_R_OK & mmux_libc_W_OK ))

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_access WW(PATHNAME) RR(HOW) )
    }
    mbfl_location_leave
}


#### faccessat

function file-system-faccessat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r HOW=RR(mmux_libc_R_OK)
	declare -r FLAGS=RR(mmux_libc_AT_SYMLINK_NOFOLLOW)

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_faccessat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(HOW) RR(FLAGS) )
    }
    mbfl_location_leave
}
function file-system-faccessat-1.2 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r HOW=$(( mmux_libc_R_OK & mmux_libc_W_OK ))
	declare -r FLAGS=RR(mmux_libc_AT_SYMLINK_NOFOLLOW)

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_faccessat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(HOW) RR(FLAGS) )
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
