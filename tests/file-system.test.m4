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
	declare FD

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_open FD WW(PATHNAME) 0 0, mmux_libc_close RR(FD) )
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


#### umask

function file-system-umask-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r NEW_UMASK=$(( mmux_libc_S_IRUSR | mmux_libc_S_IWUSR | mmux_libc_S_IRGRP ))
	declare OLD_UMASK

	# Remember that this function is run in a subshell by libmbfl-tests.
	mbfl_location_leave_when_failure( mmux_libc_umask OLD_UMASK RR(NEW_UMASK) )
    }
    mbfl_location_leave
}


#### getumask

function file-system-getumask-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare OLD_UMASK

	# Remember that this function is run in a subshell by libmbfl-tests.
	mbfl_location_leave_when_failure( mmux_libc_getumask OLD_UMASK )

	dotest-debug OLD_UMASK=WW(OLD_UMASK)
	true
    }
    mbfl_location_leave
}


#### chmod

function file-system-chmod-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r MODE=$(( mmux_libc_S_IRUSR | mmux_libc_S_IWUSR | mmux_libc_S_IRGRP ))

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_chmod WW(PATHNAME) RR(MODE) )
    }
    mbfl_location_leave
}


#### fchmod

function file-system-fchmod-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r MODE=$(( mmux_libc_S_IRUSR | mmux_libc_S_IWUSR | mmux_libc_S_IRGRP ))
	declare FD

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_open FD WW(PATHNAME) 0 0, mmux_libc_close RR(FD) )
	mbfl_location_leave_when_failure( mmux_libc_fchmod WW(FD) RR(MODE) )
    }
    mbfl_location_leave
}


#### fchmodat

function file-system-fchmodat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r MODE=$(( mmux_libc_S_IRUSR | mmux_libc_S_IWUSR | mmux_libc_S_IRGRP ))
	declare -r FLAGS=RR(mmux_libc_AT_SYMLINK_NOFOLLOW)

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_fchmodat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(MODE) RR(FLAGS) )
    }
    mbfl_location_leave
}


#### truncate

function file-system-truncate-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r LEN=0

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_leave_when_failure( mmux_libc_truncate WW(PATHNAME) RR(LEN) )
    }
    mbfl_location_leave
}


#### ftruncate

function file-system-ftruncate-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -i FLAGS=RR(mmux_libc_O_RDWR)
	declare -r LEN=0
	declare FD

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_open FD WW(PATHNAME) RR(FLAGS) 0, mmux_libc_close RR(FD) )
	mbfl_location_leave_when_failure( mmux_libc_ftruncate WW(FD) RR(LEN) )
    }
    mbfl_location_leave
}


#### stat

function file-system-stat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare STAT
	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare ST_MODE ST_INO ST_DEV ST_NLINK ST_UID ST_GID ST_SIZE ST_BLOCKS ST_BLKSIZE
	declare ST_ATIME ST_ATIME_NSEC ST_MTIME ST_MTIME_NSEC ST_CTIME ST_CTIME_NSEC

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_stat_malloc STAT, mmux_libc_free RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_stat WW(PATHNAME) RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_st_mode_ref		ST_MODE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ino_ref		ST_INO RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_dev_ref		ST_DEV RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_nlink_ref	ST_NLINK RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_uid_ref		ST_UID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_gid_ref		ST_GID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_size_ref		ST_SIZE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_ref	ST_ATIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_nsec_ref	ST_ATIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_ref	ST_MTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_nsec_ref	ST_MTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_ref	ST_CTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_nsec_ref	ST_CTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blocks_ref	ST_BLOCKS RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blksize_ref	ST_BLKSIZE RR(STAT) )

	dotest-debug ST_MODE=QQ(ST_MODE)
	dotest-debug ST_INO=QQ(ST_INO)
	dotest-debug ST_DEV=QQ(ST_DEV)
	dotest-debug ST_NLINK=QQ(ST_NLINK)
	dotest-debug ST_UID=QQ(ST_UID)
	dotest-debug ST_GID=QQ(ST_GID)
	dotest-debug ST_SIZE=QQ(ST_SIZE)
	dotest-debug ST_ATIME=QQ(ST_ATIME)
	dotest-debug ST_ATIME_NSEC=QQ(ST_ATIME_NSEC)
	dotest-debug ST_MTIME=QQ(ST_MTIME)
	dotest-debug ST_MTIME_NSEC=QQ(ST_MTIME_NSEC)
	dotest-debug ST_CTIME=QQ(ST_CTIME)
	dotest-debug ST_CTIME_NSEC=QQ(ST_CTIME_NSEC)
	dotest-debug ST_BLOCKS=QQ(ST_BLOCKS)
	dotest-debug ST_BLKSIZE=QQ(ST_BLKSIZE)

	dotest-predicate mmux_string_is_uintmax RR(ST_MODE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_INO) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_DEV) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_NLINK) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_UID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_GID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_SIZE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLOCKS) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLKSIZE)
    }
    mbfl_location_leave
}


#### fstat

function file-system-fstat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare STAT FD
	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -i FLAGS=RR(mmux_libc_O_RDWR)
	declare ST_MODE ST_INO ST_DEV ST_NLINK ST_UID ST_GID ST_SIZE ST_BLOCKS ST_BLKSIZE
	declare ST_ATIME ST_ATIME_NSEC ST_MTIME ST_MTIME_NSEC ST_CTIME ST_CTIME_NSEC

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_stat_malloc STAT, mmux_libc_free RR(STAT) )
	mbfl_location_compensate( mmux_libc_open FD WW(PATHNAME) RR(FLAGS) 0, mmux_libc_close RR(FD) )
	mbfl_location_leave_when_failure( mmux_libc_fstat RR(FD) RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_st_mode_ref		ST_MODE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ino_ref		ST_INO RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_dev_ref		ST_DEV RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_nlink_ref	ST_NLINK RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_uid_ref		ST_UID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_gid_ref		ST_GID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_size_ref		ST_SIZE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_ref	ST_ATIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_nsec_ref	ST_ATIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_ref	ST_MTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_nsec_ref	ST_MTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_ref	ST_CTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_nsec_ref	ST_CTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blocks_ref	ST_BLOCKS RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blksize_ref	ST_BLKSIZE RR(STAT) )

	dotest-debug ST_MODE=QQ(ST_MODE)
	dotest-debug ST_INO=QQ(ST_INO)
	dotest-debug ST_DEV=QQ(ST_DEV)
	dotest-debug ST_NLINK=QQ(ST_NLINK)
	dotest-debug ST_UID=QQ(ST_UID)
	dotest-debug ST_GID=QQ(ST_GID)
	dotest-debug ST_SIZE=QQ(ST_SIZE)
	dotest-debug ST_ATIME=QQ(ST_ATIME)
	dotest-debug ST_ATIME_NSEC=QQ(ST_ATIME_NSEC)
	dotest-debug ST_MTIME=QQ(ST_MTIME)
	dotest-debug ST_MTIME_NSEC=QQ(ST_MTIME_NSEC)
	dotest-debug ST_CTIME=QQ(ST_CTIME)
	dotest-debug ST_CTIME_NSEC=QQ(ST_CTIME_NSEC)
	dotest-debug ST_BLOCKS=QQ(ST_BLOCKS)
	dotest-debug ST_BLKSIZE=QQ(ST_BLKSIZE)

	dotest-predicate mmux_string_is_uintmax RR(ST_MODE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_INO) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_DEV) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_NLINK) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_UID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_GID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_SIZE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLOCKS) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLKSIZE)
    }
    mbfl_location_leave
}


#### lstat

function file-system-lstat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare STAT
	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare ST_MODE ST_INO ST_DEV ST_NLINK ST_UID ST_GID ST_SIZE ST_BLOCKS ST_BLKSIZE
	declare ST_ATIME ST_ATIME_NSEC ST_MTIME ST_MTIME_NSEC ST_CTIME ST_CTIME_NSEC

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_stat_malloc STAT, mmux_libc_free RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_lstat WW(PATHNAME) RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_st_mode_ref		ST_MODE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ino_ref		ST_INO RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_dev_ref		ST_DEV RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_nlink_ref	ST_NLINK RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_uid_ref		ST_UID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_gid_ref		ST_GID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_size_ref		ST_SIZE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_ref	ST_ATIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_nsec_ref	ST_ATIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_ref	ST_MTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_nsec_ref	ST_MTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_ref	ST_CTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_nsec_ref	ST_CTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blocks_ref	ST_BLOCKS RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blksize_ref	ST_BLKSIZE RR(STAT) )

	dotest-debug ST_MODE=QQ(ST_MODE)
	dotest-debug ST_INO=QQ(ST_INO)
	dotest-debug ST_DEV=QQ(ST_DEV)
	dotest-debug ST_NLINK=QQ(ST_NLINK)
	dotest-debug ST_UID=QQ(ST_UID)
	dotest-debug ST_GID=QQ(ST_GID)
	dotest-debug ST_SIZE=QQ(ST_SIZE)
	dotest-debug ST_ATIME=QQ(ST_ATIME)
	dotest-debug ST_ATIME_NSEC=QQ(ST_ATIME_NSEC)
	dotest-debug ST_MTIME=QQ(ST_MTIME)
	dotest-debug ST_MTIME_NSEC=QQ(ST_MTIME_NSEC)
	dotest-debug ST_CTIME=QQ(ST_CTIME)
	dotest-debug ST_CTIME_NSEC=QQ(ST_CTIME_NSEC)
	dotest-debug ST_BLOCKS=QQ(ST_BLOCKS)
	dotest-debug ST_BLKSIZE=QQ(ST_BLKSIZE)

	dotest-predicate mmux_string_is_uintmax RR(ST_MODE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_INO) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_DEV) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_NLINK) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_UID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_GID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_SIZE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLOCKS) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLKSIZE)
    }
    mbfl_location_leave
}


#### fstatat

function file-system-fstatat-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare STAT
	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -r FLAGS=RR(mmux_libc_AT_SYMLINK_NOFOLLOW)
	declare ST_MODE ST_INO ST_DEV ST_NLINK ST_UID ST_GID ST_SIZE ST_BLOCKS ST_BLKSIZE
	declare ST_ATIME ST_ATIME_NSEC ST_MTIME ST_MTIME_NSEC ST_CTIME ST_CTIME_NSEC

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_stat_malloc STAT, mmux_libc_free RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_fstatat RR(mmux_libc_AT_FDCWD) WW(PATHNAME) RR(STAT) RR(FLAGS) )

	mbfl_location_leave_when_failure( mmux_libc_st_mode_ref		ST_MODE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ino_ref		ST_INO RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_dev_ref		ST_DEV RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_nlink_ref	ST_NLINK RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_uid_ref		ST_UID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_gid_ref		ST_GID RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_size_ref		ST_SIZE RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_ref	ST_ATIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_atime_nsec_ref	ST_ATIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_ref	ST_MTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_mtime_nsec_ref	ST_MTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_ref	ST_CTIME RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_ctime_nsec_ref	ST_CTIME_NSEC RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blocks_ref	ST_BLOCKS RR(STAT) )
	mbfl_location_leave_when_failure( mmux_libc_st_blksize_ref	ST_BLKSIZE RR(STAT) )

	dotest-debug ST_MODE=QQ(ST_MODE)
	dotest-debug ST_INO=QQ(ST_INO)
	dotest-debug ST_DEV=QQ(ST_DEV)
	dotest-debug ST_NLINK=QQ(ST_NLINK)
	dotest-debug ST_UID=QQ(ST_UID)
	dotest-debug ST_GID=QQ(ST_GID)
	dotest-debug ST_SIZE=QQ(ST_SIZE)
	dotest-debug ST_ATIME=QQ(ST_ATIME)
	dotest-debug ST_ATIME_NSEC=QQ(ST_ATIME_NSEC)
	dotest-debug ST_MTIME=QQ(ST_MTIME)
	dotest-debug ST_MTIME_NSEC=QQ(ST_MTIME_NSEC)
	dotest-debug ST_CTIME=QQ(ST_CTIME)
	dotest-debug ST_CTIME_NSEC=QQ(ST_CTIME_NSEC)
	dotest-debug ST_BLOCKS=QQ(ST_BLOCKS)
	dotest-debug ST_BLKSIZE=QQ(ST_BLKSIZE)

	dotest-predicate mmux_string_is_uintmax RR(ST_MODE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_INO) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_DEV) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_NLINK) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_UID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_GID) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_SIZE) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_ATIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_MTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_CTIME_NSEC) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLOCKS) &&
	dotest-predicate mmux_string_is_uintmax RR(ST_BLKSIZE)
    }
    mbfl_location_leave
}


#### S_ISREG

function file-system-S_ISREG-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare STAT
	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare ST_MODE ST_INO ST_DEV ST_NLINK ST_UID ST_GID ST_SIZE ST_BLOCKS ST_BLKSIZE
	declare ST_ATIME ST_ATIME_NSEC ST_MTIME ST_MTIME_NSEC ST_CTIME ST_CTIME_NSEC

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_stat_malloc STAT, mmux_libc_free RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_stat WW(PATHNAME) RR(STAT) )

	mbfl_location_leave_when_failure( mmux_libc_st_mode_ref		ST_MODE RR(STAT) )
	dotest-predicate mmux_libc_S_ISREG WW(ST_MODE)
    }
    mbfl_location_leave
}

# S_ISDIR S_ISCHR S_ISBLK S_ISFIFO S_ISLNK S_ISSOCK S_TYPEISMQ S_TYPEISSEM S_TYPEISSHM


#### utime

function file-system-utime-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare UTIMBUF

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_utimbuf_malloc UTIMBUF, mmux_libc_free RR(UTIMBUF) )

	mbfl_location_leave_when_failure( mmux_libc_utimbuf_actime_set  RR(UTIMBUF) 123 )
	mbfl_location_leave_when_failure( mmux_libc_utimbuf_modtime_set RR(UTIMBUF) 456 )

	mbfl_location_leave_when_failure( mmux_libc_utime WW(PATHNAME) RR(UTIMBUF) )
    }
    mbfl_location_leave
}


#### utimes

function file-system-utimes-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')

	declare ACCESS_TIMEVAL MODIFICATION_TIMEVAL

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_timeval_malloc ACCESS_TIMEVAL, mmux_libc_free RR(ACCESS_TIMEVAL) )
	mbfl_location_compensate( mmux_libc_timeval_malloc MODIFICATION_TIMEVAL, mmux_libc_free RR(MODIFICATION_TIMEVAL) )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(ACCESS_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(ACCESS_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(MODIFICATION_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(MODIFICATION_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_utimes WW(PATHNAME) RR(ACCESS_TIMEVAL) RR(MODIFICATION_TIMEVAL) )
    }
    mbfl_location_leave
}


#### lutimes

function file-system-lutimes-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')

	declare ACCESS_TIMEVAL MODIFICATION_TIMEVAL

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_timeval_malloc ACCESS_TIMEVAL, mmux_libc_free RR(ACCESS_TIMEVAL) )
	mbfl_location_compensate( mmux_libc_timeval_malloc MODIFICATION_TIMEVAL, mmux_libc_free RR(MODIFICATION_TIMEVAL) )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(ACCESS_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(ACCESS_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(MODIFICATION_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(MODIFICATION_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_lutimes WW(PATHNAME) RR(ACCESS_TIMEVAL) RR(MODIFICATION_TIMEVAL) )
    }
    mbfl_location_leave
}


#### futimes

function file-system-futimes-1.1 () {
    mbfl_location_enter
    {
	mbfl_location_handler dotest-clean-files

	dotest-unset-debug

	declare -r PATHNAME=$(dotest-mkfile 'spiffy.ext')
	declare -i FLAGS=RR(mmux_libc_O_RDWR)
	declare FD
	declare ACCESS_TIMEVAL MODIFICATION_TIMEVAL

	dotest-debug PATHNAME=WW(PATHNAME)

	mbfl_location_compensate( mmux_libc_open FD WW(PATHNAME) RR(FLAGS) 0, mmux_libc_close RR(FD) )

	mbfl_location_compensate( mmux_libc_timeval_malloc ACCESS_TIMEVAL, mmux_libc_free RR(ACCESS_TIMEVAL) )
	mbfl_location_compensate( mmux_libc_timeval_malloc MODIFICATION_TIMEVAL, mmux_libc_free RR(MODIFICATION_TIMEVAL) )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(ACCESS_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(ACCESS_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_timeval_seconds_set      RR(MODIFICATION_TIMEVAL) 123 )
	mbfl_location_leave_when_failure( mmux_libc_timeval_microseconds_set RR(MODIFICATION_TIMEVAL) 456 )

	mbfl_location_leave_when_failure( mmux_libc_futimes WW(FD) RR(ACCESS_TIMEVAL) RR(MODIFICATION_TIMEVAL) )
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
