#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for file descriptors builtins
#!# Date: Oct  1, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/file-descriptors.test ; less tests/file-descriptors.log
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


#### opening and closing

function file-descriptors-open-close-1.1 () {
    dotest-unset-debug
    mbfl_location_enter
    {
	declare -i FD RV ERRNO=0
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT | mmux_libc_O_EXCL))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	declare -r FILENAME=$(dotest-mkpathname 'name.ext')
	mbfl_location_handler dotest-clean-files

	dotest-debug mmux_libc_O_RDWR=WW(mmux_libc_O_RDWR)
	dotest-debug mmux_libc_O_CREAT=WW(mmux_libc_O_CREAT)
	dotest-debug mmux_libc_O_EXCL=WW(mmux_libc_O_EXCL)
	dotest-debug FLAGS=WW(FLAGS)

	if ! mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then
	    mbfl_declare_varref(MSG)
	    mmux_libc_strerror UU(MSG) $ERRNO
	    mbfl_message_error_printf 'opening file: %s\n' QQ(MSG)
	    mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_close $FD
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
}


#### openat

function file-descriptors-openat-1.1 () {
    dotest-unset-debug
    mbfl_location_enter
    {
	declare -i FD RV ERRNO=0
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT | mmux_libc_O_EXCL))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	declare -r FILENAME=$(dotest-mkpathname 'name.ext')
	mbfl_location_handler dotest-clean-files

	dotest-debug mmux_libc_O_RDWR=WW(mmux_libc_O_RDWR)
	dotest-debug mmux_libc_O_CREAT=WW(mmux_libc_O_CREAT)
	dotest-debug mmux_libc_O_EXCL=WW(mmux_libc_O_EXCL)
	dotest-debug FLAGS=WW(FLAGS)

	if ! mmux_libc_openat FD RR(mmux_libc_AT_FDCWD) QQ(FILENAME) WW(FLAGS) WW(MODE)
	then
	    mbfl_declare_varref(MSG)
	    mmux_libc_strerror UU(MSG) $ERRNO
	    mbfl_message_error_printf 'opening file: %s\n' QQ(MSG)
	    mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_close $FD
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
}


#### opening, closing, reading with "read", writing with "write"

function file-descriptors-read-write-1.1 () {
    mbfl_location_enter
    {
	declare -i FD DONE OFFSET SIZE=5
	declare BUFFER
	mbfl_declare_index_array_varref(RESULT)
	mbfl_declare_index_array_varref(ORIGIN_DATA,(11 22 33 44 55))
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD"
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_to_memory WW(BUFFER) UU(ORIGIN_DATA) WW(SIZE)

	if ! mmux_libc_lseek OFFSET $FD 0 $mmux_libc_SEEK_SET
	then mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_write DONE $FD $BUFFER $SIZE
	then mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_lseek OFFSET $FD 0 $mmux_libc_SEEK_SET
	then mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_read DONE $FD $BUFFER $SIZE
	then mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_from_memory UU(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump UU(RESULT) RESULT

	dotest-equal $SIZE $DONE && \
	    dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT, 4)
    }
    mbfl_location_leave
}


#### dup

function file-descriptors-dup-1.1 () {
    mbfl_location_enter
    {
	declare -i FD DONE OFFSET SIZE=5
	declare BUFFER
	mbfl_declare_index_array_varref(RESULT)
	mbfl_declare_index_array_varref(ORIGIN_DATA,(11 22 33 44 55))
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	mbfl_declare_varref(ID)

	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD" UU(ID)
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_to_memory WW(BUFFER) UU(ORIGIN_DATA) WW(SIZE)

	if ! mmux_libc_pwrite DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_dup FD $FD
	then mbfl_location_replace_handler_by_id WW(ID) "mmux_libc_close WW(FD)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_pread DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_from_memory UU(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump UU(RESULT) RESULT

	dotest-equal $SIZE $DONE && \
	    dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT, 4)
    }
    mbfl_location_leave
}


#### dup2

function file-descriptors-dup2-1.1 () {
    mbfl_location_enter
    {
	declare -i FD NEW_FD DONE OFFSET SIZE=5
	declare BUFFER
	mbfl_declare_index_array_varref(RESULT)
	mbfl_declare_index_array_varref(ORIGIN_DATA,(11 22 33 44 55))
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	mbfl_declare_varref(ID)

	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD" UU(ID)
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_compensate( mmux_libc_malloc BUFFER $SIZE, mmux_libc_free RR(BUFFER) )
	mmux_index_array_to_memory WW(BUFFER) UU(ORIGIN_DATA) WW(SIZE)
	mbfl_location_leave_when_failure( mmux_libc_pwrite DONE $FD $BUFFER $SIZE 0 )

	# I'm so dirty...
	NEW_FD=$(( FD + 1 ))

	if mmux_libc_dup2 $FD $NEW_FD
	then mbfl_location_replace_handler_by_id WW(ID) "mmux_libc_close WW(NEW_FD)"
	else mbfl_location_leave_then_return_failure
	fi

	mbfl_location_leave_when_failure( mmux_libc_pread DONE RR(NEW_FD) $BUFFER $SIZE 0 )

	mmux_index_array_from_memory UU(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump UU(RESULT) RESULT

	dotest-equal $SIZE $DONE && \
	    dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT, 4)
    }
    mbfl_location_leave
}


#### dup3

function file-descriptors-dup3-1.1 () {
    if mmux_bash_pointers_builtin_p mmux_libc_dup3
    then
	mbfl_location_enter
	{
	    declare -i FD NEW_FD DONE OFFSET SIZE=5
	    declare BUFFER
	    mbfl_declare_index_array_varref(RESULT)
	    mbfl_declare_index_array_varref(ORIGIN_DATA,(11 22 33 44 55))
	    declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT))
	    declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	    declare -i DUP3_FLAGS=RR(mmux_libc_O_CLOEXEC)

	    mbfl_declare_varref(ID)

	    declare -r FILENAME=$(dotest-mkfile 'name.ext')
	    mbfl_location_handler dotest-clean-files

	    if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	    then mbfl_location_handler "mmux_libc_close $FD" UU(ID)
	    else mbfl_location_leave_then_return_failure
	    fi

	    mbfl_location_compensate( mmux_libc_malloc BUFFER $SIZE, mmux_libc_free RR(BUFFER) )
	    mmux_index_array_to_memory WW(BUFFER) UU(ORIGIN_DATA) WW(SIZE)
	    mbfl_location_leave_when_failure( mmux_libc_pwrite DONE $FD $BUFFER $SIZE 0 )

	    # I'm so dirty...
	    NEW_FD=$(( FD + 1 ))

	    if mmux_libc_dup3 $FD $NEW_FD RR(DUP3_FLAGS)
	    then mbfl_location_replace_handler_by_id WW(ID) "mmux_libc_close WW(NEW_FD)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    mbfl_location_leave_when_failure( mmux_libc_pread DONE RR(NEW_FD) $BUFFER $SIZE 0 )

	    mmux_index_array_from_memory UU(RESULT) WW(BUFFER) WW(SIZE)
	    #mbfl_array_dump UU(RESULT) RESULT

	    dotest-equal $SIZE $DONE && \
		dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
		dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
		dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
		dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
		dotest-equal 55 mbfl_slot_qref(RESULT, 4)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### fcntl

function file-descriptors-fcntl-F_DUPFD-1.1 () {
    mbfl_location_enter
    {
	declare -i rv FD DONE OFFSET SIZE=5
	declare BUFFER
	mbfl_declare_index_array_varref(RESULT)
	mbfl_declare_index_array_varref(ORIGIN_DATA,(11 22 33 44 55))
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	mbfl_declare_varref(ID)

	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD" UU(ID)
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_to_memory WW(BUFFER) UU(ORIGIN_DATA) WW(SIZE)

	if ! mmux_libc_pwrite DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	# I'm so dirty...
	NEW_FD=$(( FD + 1 ))

	if mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_DUPFD) WW(NEW_FD)
	then mbfl_location_replace_handler_by_id WW(ID) "mmux_libc_close WW(FD)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_pread DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	mmux_index_array_from_memory UU(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump UU(RESULT) RESULT

	dotest-equal $SIZE $DONE && \
	    dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT, 4)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

if test -v mmux_libc_F_GETFD -a -v mmux_libc_F_SETFD -a -v mmux_libc_FD_CLOEXEC
then

function file-descriptors-fcntl-F_GETFD-1.1 () {
    dotest-unset-debug
    mbfl_location_enter
    {
	declare -i FD RV ERRNO=0
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT | mmux_libc_O_EXCL))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	declare -r FILENAME=$(dotest-mkpathname 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug opened

	if ! mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_SETFD) WW(mmux_libc_FD_CLOEXEC)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug setted

	if ! mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_GETFD)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug getted

	dotest-equal WW(mmux_libc_FD_CLOEXEC) WW(RV)
    }
    mbfl_location_leave
}

fi

### ------------------------------------------------------------------------

if test -v mmux_libc_F_GETFL -a -v mmux_libc_F_SETFL -a -v mmux_libc_FD_CLOEXEC
then

function file-descriptors-fcntl-F_GETFL-1.1 () {
    dotest-unset-debug
    mbfl_location_enter
    {
	declare -i FD RV ERRNO=0
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT | mmux_libc_O_EXCL))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	declare -r FILENAME=$(dotest-mkpathname 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug opened

	if ! mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_GETFL)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug getted
	dotest-equal WW(mmux_libc_O_RDWR) $(( WW(RV) & WW(mmux_libc_O_RDWR) ))
    }
    mbfl_location_leave
}

function file-descriptors-fcntl-F_GETFL-1.2 () {
    dotest-unset-debug
    mbfl_location_enter
    {
	declare -i FD RV ERRNO=0
	declare -i FLAGS=$((mmux_libc_O_RDWR | mmux_libc_O_CREAT | mmux_libc_O_EXCL))
	declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))
	declare -r FILENAME=$(dotest-mkpathname 'name.ext')
	mbfl_location_handler dotest-clean-files

	if mmux_libc_open FD QQ(FILENAME) WW(FLAGS) WW(MODE)
	then mbfl_location_handler "mmux_libc_close $FD"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug opened

	if ! mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_SETFL) WW(mmux_libc_O_APPEND)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug setted

	if ! mmux_libc_fcntl RV WW(FD) WW(mmux_libc_F_GETFL)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug getted
	dotest-equal WW(mmux_libc_O_RDWR) $(( WW(RV) & WW(mmux_libc_O_RDWR) ))
    }
    mbfl_location_leave
}

fi


#### pipe

function file-descriptors-pipe-1.1 () {
    mbfl_location_enter
    {
	declare -i READING_FD WRITING_FD
	declare REPLY

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_pipe READING_FD WRITING_FD )
	mbfl_location_handler "mmux_libc_close RR(READING_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITING_FD)"

	dotest-debug RR(READING_FD) RR(WRITING_FD)

	printf 'ciao\n' >&RR(WRITING_FD)
	read -u RR(READING_FD)

	dotest-equal QQ(REPLY) 'ciao'
    }
    mbfl_location_leave
}


#### select

function file-descriptors-select-1.1 () {
    mbfl_location_enter
    {
	declare READ_FD_SET WRIT_FD_SET EXEC_FD_SET
	declare TIMEOUT
	declare -i READY_FDS_NUM NFDS=RR(mmux_libc_FD_SETSIZE)
	declare -i READING_FD WRITING_FD
	declare REPLY

	dotest-unset-debug

	mbfl_location_compensate(mmux_libc_fd_set_malloc READ_FD_SET,  mmux_libc_free RR(READ_FD_SET))
	mbfl_location_compensate(mmux_libc_fd_set_malloc WRIT_FD_SET,  mmux_libc_free RR(WRIT_FD_SET))
	mbfl_location_compensate(mmux_libc_fd_set_malloc EXEC_FD_SET,  mmux_libc_free RR(EXEC_FD_SET))
	mbfl_location_compensate(mmux_libc_timeval_malloc TIMEOUT 1 0, mmux_libc_free RR(TIMEOUT))

	mbfl_location_leave_when_failure( mmux_libc_pipe READING_FD WRITING_FD )
	mbfl_location_handler "mmux_libc_close RR(READING_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITING_FD)"

	mbfl_location_leave_when_failure( mmux_libc_FD_SET RR(READING_FD) RR(READ_FD_SET) )

	printf 'ciao\n' >&RR(WRITING_FD)

	mbfl_location_leave_when_failure( mmux_libc_select READY_FDS_NUM RR(NFDS) \
							   RR(READ_FD_SET) RR(WRIT_FD_SET) RR(EXEC_FD_SET) \
							   RR(TIMEOUT) )

	dotest-predicate mmux_libc_FD_ISSET RR(READING_FD) RR(READ_FD_SET) && {
	    read -u RR(READING_FD)
	    dotest-equal QQ(REPLY) 'ciao'
	}
    }
    mbfl_location_leave
}

function file-descriptors-select-1.2 () {
    mbfl_location_enter
    {
	declare READ_FD_SET WRIT_FD_SET EXEC_FD_SET
	declare TIMEOUT
	declare -i READY_FDS_NUM NFDS=RR(mmux_libc_FD_SETSIZE)
	declare -i READING_FD WRITING_FD
	declare REPLY

	dotest-unset-debug

	mbfl_location_compensate(mmux_libc_fd_set_malloc_triplet READ_FD_SET WRIT_FD_SET EXEC_FD_SET,  mmux_libc_free RR(READ_FD_SET))
	mbfl_location_compensate(mmux_libc_timeval_malloc TIMEOUT 1 0, mmux_libc_free RR(TIMEOUT))

	mbfl_location_leave_when_failure( mmux_libc_pipe READING_FD WRITING_FD )
	mbfl_location_handler "mmux_libc_close RR(READING_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITING_FD)"

	mbfl_location_leave_when_failure( mmux_libc_FD_SET RR(READING_FD) RR(READ_FD_SET) )

	printf 'ciao\n' >&RR(WRITING_FD)

	mbfl_location_leave_when_failure( mmux_libc_select READY_FDS_NUM RR(NFDS) \
							   RR(READ_FD_SET) RR(WRIT_FD_SET) RR(EXEC_FD_SET) \
							   RR(TIMEOUT) )

	dotest-predicate mmux_libc_FD_ISSET RR(READING_FD) RR(READ_FD_SET) && {
	    read -u RR(READING_FD)
	    dotest-equal QQ(REPLY) 'ciao'
	}
    }
    mbfl_location_leave
}


#### struct iovec

function file-descriptors-iovec-calloc-1.1 () {
    mbfl_location_enter
    {
	declare IOVEC_PTR BUFPTR BUFLEN='4096'
	declare GOT_BUFPTR GOT_BUFLEN

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_iovec_calloc IOVEC_PTR,
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR RR(BUFLEN),
				  mmux_libc_free RR(BUFPTR) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR) )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(IOVEC_PTR) RR(BUFLEN) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_iovec_dump RR(IOVEC_PTR) >&2 )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_ref GOT_BUFPTR RR(IOVEC_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_ref  GOT_BUFLEN RR(IOVEC_PTR) )

	dotest-equal RR(GOT_BUFPTR) RR(BUFPTR) &&
	    dotest-equal RR(GOT_BUFLEN) RR(BUFLEN)
    }
    mbfl_location_leave
}
function file-descriptors-iovec-calloc-2.1 () {
    mbfl_location_enter
    {
	declare IOVEC_PTR BUFPTR BUFLEN='4096'

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_malloc BUFPTR RR(BUFLEN),
				  mmux_libc_free RR(BUFPTR) )

	mbfl_location_compensate( mmux_libc_iovec_calloc IOVEC_PTR RR(BUFPTR) RR(BUFLEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_iovec_dump RR(IOVEC_PTR) >&2 )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_ref GOT_BUFPTR RR(IOVEC_PTR) )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_ref  GOT_BUFLEN RR(IOVEC_PTR) )

	dotest-equal RR(GOT_BUFPTR) RR(BUFPTR) &&
	    dotest-equal RR(GOT_BUFLEN) RR(BUFLEN)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function file-descriptors-iovec-array-calloc-1.1 () {
    mbfl_location_enter
    {
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFLEN='4096'
	declare GOT_BUFPTR0 GOT_BUFLEN0
	declare GOT_BUFPTR1 GOT_BUFLEN1

	dotest-unset-debug

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR 2,
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(IOVEC_PTR) RR(BUFLEN)  0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(IOVEC_PTR) RR(BUFLEN)  1)

	dotest-option-debug && mbfl_location_leave_when_failure( mmux_libc_iovec_dump RR(IOVEC_PTR) >&2 )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_ref GOT_BUFPTR0 RR(IOVEC_PTR) 0 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_ref  GOT_BUFLEN0 RR(IOVEC_PTR) 0 )
	mbfl_location_leave_when_failure( mmux_libc_iov_base_ref GOT_BUFPTR1 RR(IOVEC_PTR) 1 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_ref  GOT_BUFLEN1 RR(IOVEC_PTR) 1 )

	dotest-equal     RR(BUFPTR0) RR(GOT_BUFPTR0) &&
	    dotest-equal RR(BUFLEN)  RR(GOT_BUFLEN0) &&
	    dotest-equal RR(BUFPTR1) RR(GOT_BUFPTR1) &&
	    dotest-equal RR(BUFLEN)  RR(GOT_BUFLEN1)
    }
    mbfl_location_leave
}


#### scatter-gather input/output

function file-descriptors-scatter-gather-1.1 () {
    mbfl_location_enter
    {
	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i READING_FD WRITING_FD
	declare -i WRITEV_DONE READV_DONE
	declare STR0 STR1 STR2

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_pipe READING_FD WRITING_FD )
	mbfl_location_handler "mmux_libc_close RR(READING_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITING_FD)"


	# Write to buffers
	{
	    declare WRITE_IOVEC_PTR WRITE_BUFPTR0 WRITE_BUFPTR1 WRITE_BUFPTR2

	    dotest-debug writing

	    mbfl_location_compensate( mmux_libc_iovec_array_calloc WRITE_IOVEC_PTR RR(IOVEC_LEN),
				      mmux_libc_free RR(WRITE_IOVEC_PTR) )

	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR0 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR0) )
	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR1 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR1) )
	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR2 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR2) )

	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR0) 0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(WRITE_IOVEC_PTR) RR(BUFLEN)        0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR1) 1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(WRITE_IOVEC_PTR) RR(BUFLEN)        1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR2) 2)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(WRITE_IOVEC_PTR) 5                 2)

	    mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(WRITE_BUFPTR0) '0123456789' 10)
	    mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(WRITE_BUFPTR1) 'ABCDEFGHIL' 10)
	    mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(WRITE_BUFPTR2) 'abcde'       5)

	    mbfl_location_leave_when_failure( mmux_libc_writev WRITEV_DONE RR(WRITING_FD) RR(WRITE_IOVEC_PTR) RR(IOVEC_LEN) )
	}

	# Read frombuffers
	{
	    declare READ_IOVEC_PTR READ_BUFPTR0 READ_BUFPTR1 READ_BUFPTR2

	    dotest-debug reading

	    mbfl_location_compensate( mmux_libc_iovec_array_calloc READ_IOVEC_PTR RR(IOVEC_LEN),
				      mmux_libc_free RR(READ_IOVEC_PTR) )

	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR0 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR0) )
	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR1 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR1) )
	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR2 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR2) )

	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR0) 0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR1) 1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR2) 2)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        2)

	    mbfl_location_leave_when_failure( mmux_libc_readv READV_DONE RR(READING_FD) RR(READ_IOVEC_PTR) RR(IOVEC_LEN) )

	    mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR0 RR(READ_BUFPTR0) 10)
	    mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR1 RR(READ_BUFPTR1) 10)
	    mbfl_location_leave_when_failure( mmux_pointer_to_bash_string STR2 RR(READ_BUFPTR2)  5)
	}

	dotest-debug WRITEV_DONE=RR(WRITEV_DONE)
	dotest-debug READV_DONE=RR(READV_DONE)
	dotest-debug STR0=WW(STR0)
	dotest-debug STR1=WW(STR1)
	dotest-debug STR2=WW(STR2)

	dotest-equal     25 RR(WRITEV_DONE)    &&
	    dotest-equal 25 RR(READV_DONE)     &&
	    dotest-equal '0123456789' WW(STR0) &&
	    dotest-equal 'ABCDEFGHIL' WW(STR1) &&
	    dotest-equal 'abcde'      WW(STR2)
    }
    mbfl_location_leave
}


#### scatter-gather input/output

function file-descriptors-scatter-gather-1.2 () {
    mbfl_location_enter
    {
	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i READING_FD WRITING_FD
	declare -i WRITEV_DONE READV_DONE
	declare READ_STR

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_pipe READING_FD WRITING_FD )
	mbfl_location_handler "mmux_libc_close RR(READING_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITING_FD)"


	# Write to buffers
	{
	    declare WRITE_IOVEC_PTR WRITE_BUFPTR0 WRITE_BUFPTR1 WRITE_BUFPTR2

	    dotest-debug writing

	    mbfl_location_compensate( mmux_libc_iovec_array_calloc WRITE_IOVEC_PTR RR(IOVEC_LEN),
				      mmux_libc_free RR(WRITE_IOVEC_PTR) )

	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR0 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR0) )
	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR1 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR1) )
	    mbfl_location_compensate( mmux_libc_malloc WRITE_BUFPTR2 RR(BUFLEN), mmux_libc_free RR(WRITE_BUFPTR2) )

	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR0) 0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(WRITE_IOVEC_PTR) RR(BUFLEN)        0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR1) 1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(WRITE_IOVEC_PTR) RR(BUFLEN)        1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(WRITE_IOVEC_PTR) RR(WRITE_BUFPTR2) 2)

	    # Scatter.
	    {
		declare -r  WRITE_STR='0123456789ABCDEFGHILabcde'
		declare -ir WRITE_STRLEN=mbfl_string_len(WRITE_STR)
		declare -i IOVEC_IDX WRITE_STROFF=0 TMPLEN
		declare TMPSTR BUFPTR

		dotest-debug scattering WRITE_STRLEN=RR(WRITE_STRLEN) WRITE_STR=WW(WRITE_STR)

		for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
		do
		    mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(WRITE_IOVEC_PTR) RR(IOVEC_IDX) )

		    if (( (WRITE_STRLEN - WRITE_STROFF) >= BUFLEN ))
		    then
			TMPLEN=RR(BUFLEN)
			TMPSTR=${WRITE_STR:$WRITE_STROFF:$TMPLEN}
			dotest-debug scattering IOVEC_IDX=RR(IOVEC_IDX) TMPSTR=WW(TMPSTR) WRITE_STROFF=RR(WRITE_STROFF) TMPLEN=RR(TMPLEN)
			mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(BUFPTR) WW(TMPSTR) RR(TMPLEN) )
			mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(WRITE_IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
			let WRITE_STROFF+=BUFLEN
		    else
			TMPLEN=$(( WRITE_STRLEN - WRITE_STROFF ))
			TMPSTR=${WRITE_STR:$WRITE_STROFF:$TMPLEN}
			dotest-debug scattering IOVEC_IDX=RR(IOVEC_IDX) TMPSTR=WW(TMPSTR) WRITE_STROFF=RR(WRITE_STROFF) TMPLEN=RR(TMPLEN)
			mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(BUFPTR) WW(TMPSTR) RR(TMPLEN) )
			mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(WRITE_IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
			break
		    fi
		done
	    }

	    mbfl_location_leave_when_failure( mmux_libc_writev WRITEV_DONE RR(WRITING_FD) RR(WRITE_IOVEC_PTR) RR(IOVEC_LEN) )
	}

	# Read frombuffers
	{
	    declare READ_IOVEC_PTR READ_BUFPTR0 READ_BUFPTR1 READ_BUFPTR2

	    dotest-debug reading

	    mbfl_location_compensate( mmux_libc_iovec_array_calloc READ_IOVEC_PTR RR(IOVEC_LEN),
				      mmux_libc_free RR(READ_IOVEC_PTR) )

	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR0 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR0) )
	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR1 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR1) )
	    mbfl_location_compensate( mmux_libc_malloc READ_BUFPTR2 RR(BUFLEN), mmux_libc_free RR(READ_BUFPTR2) )

	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR0) 0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        0)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR1) 1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        1)
	    mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(READ_IOVEC_PTR) RR(READ_BUFPTR2) 2)
	    mbfl_location_leave_when_failure( mmux_libc_iov_len_set  RR(READ_IOVEC_PTR) RR(BUFLEN)        2)

	    mbfl_location_leave_when_failure( mmux_libc_readv READV_DONE RR(READING_FD) RR(READ_IOVEC_PTR) RR(IOVEC_LEN) )

	    # Gather.
	    {
		declare -i IOVEC_IDX AMOUNT=RR(READV_DONE)
		declare TMPSTR BUFPTR

		for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
		do
		    dotest-debug gathering IOVEC_IDX=RR(IOVEC_IDX)
		    mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(READ_IOVEC_PTR) RR(IOVEC_IDX) )
		    dotest-debug gathering AMOUNT=RR(AMOUNT)

		    if (( BUFLEN <= AMOUNT ))
		    then
			mbfl_location_leave_when_failure( mmux_pointer_to_bash_string TMPSTR RR(BUFPTR) RR(BUFLEN) )
			READ_STR+=QQ(TMPSTR)
			let AMOUNT-=BUFLEN
		    else
			mbfl_location_leave_when_failure( mmux_pointer_to_bash_string TMPSTR RR(BUFPTR) RR(AMOUNT) )
			READ_STR+=QQ(TMPSTR)
			break
		    fi
		done
	    }
	}

	dotest-debug WRITEV_DONE=RR(WRITEV_DONE)
	dotest-debug READV_DONE=RR(READV_DONE)
	dotest-debug READ_STR=WW(READ_STR)

	dotest-equal     25 RR(WRITEV_DONE)    &&
	    dotest-equal 25 RR(READV_DONE)     &&
	    dotest-equal WW(WRITE_STR) WW(READ_STR)
    }
    mbfl_location_leave
}


#### scatter-gather input/output

function file-descriptors-scatter-gather-1.3 () {
    mbfl_location_enter
    {
	declare -r WRITE_STR='0123456789ABCDEFGHILabcde'
	declare READ_STR
	declare -i READ_FD WRITE_FD

	dotest-unset-debug

	mbfl_location_leave_when_failure( mmux_libc_pipe READ_FD WRITE_FD )
	mbfl_location_handler "mmux_libc_close RR(READ_FD)"
	mbfl_location_handler "mmux_libc_close RR(WRITE_FD)"

	mbfl_location_leave_when_failure( scatter-file-descriptors-scatter-gather-1.3 )
	mbfl_location_leave_when_failure(  gather-file-descriptors-scatter-gather-1.3 )

	dotest-debug READ_STR=WW(READ_STR)
	dotest-equal WW(WRITE_STR) WW(READ_STR)
    }
    mbfl_location_leave
}
function scatter-file-descriptors-scatter-gather-1.3 () {
    mbfl_location_enter
    {
	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i WRITEV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug writing

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	# Scatter.
	{
	    declare -ir WRITE_STRLEN=mbfl_string_len(WRITE_STR)
	    declare -i IOVEC_IDX WRITE_STROFF=0 TMPLEN
	    declare TMPSTR BUFPTR

	    dotest-debug scattering WRITE_STRLEN=RR(WRITE_STRLEN) WRITE_STR=WW(WRITE_STR)

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( ((WRITE_STRLEN - WRITE_STROFF) >= BUFLEN)? BUFLEN : (WRITE_STRLEN - WRITE_STROFF) ))
		TMPSTR=${WRITE_STR:$WRITE_STROFF:$TMPLEN}
		dotest-debug scattering IOVEC_IDX=RR(IOVEC_IDX) TMPSTR=WW(TMPSTR) WRITE_STROFF=RR(WRITE_STROFF) TMPLEN=RR(TMPLEN)
		mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(BUFPTR) WW(TMPSTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		let WRITE_STROFF+=TMPLEN
	    done
	}

	mbfl_location_leave_when_failure( mmux_libc_writev WRITEV_DONE RR(WRITE_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) )

	dotest-debug WRITEV_DONE=RR(WRITEV_DONE)
	dotest-equal mbfl_string_len(WRITE_STR) RR(WRITEV_DONE)
    }
    mbfl_location_leave
}
function gather-file-descriptors-scatter-gather-1.3 () {
    mbfl_location_enter
    {
	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i READV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug reading

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 0 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 1 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 2 )

	mbfl_location_leave_when_failure( mmux_libc_readv READV_DONE RR(READ_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) )

	# Gather.
	{
	    declare -i IOVEC_IDX AMOUNT=RR(READV_DONE)
	    declare TMPSTR TMPLEN BUFPTR

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( (BUFLEN <= AMOUNT)? BUFLEN : AMOUNT ))
		mbfl_location_leave_when_failure( mmux_pointer_to_bash_string TMPSTR RR(BUFPTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		dotest-debug gathering IOVEC_IDX=RR(IOVEC_IDX) AMOUNT=RR(AMOUNT) TMPLEN=RR(TMPLEN) TMPSTR=WW(TMPSTR)
		READ_STR+=QQ(TMPSTR)
		let AMOUNT-=TMPLEN
	    done
	}

	dotest-equal mbfl_string_len(WRITE_STR) RR(READV_DONE)
    }
    mbfl_location_leave
}


#### scatter-gather input/output: preadv, pwritev

function file-descriptors-scatter-gather-2.1 () {
    mbfl_location_enter
    {
	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	declare -r WRITE_STR='0123456789ABCDEFGHILabcde'
	declare READ_STR

	dotest-unset-debug

	mbfl_location_leave_when_failure( scatter-file-descriptors-scatter-gather-2.1 )
	mbfl_location_leave_when_failure(  gather-file-descriptors-scatter-gather-2.1 )

	dotest-debug READ_STR=WW(READ_STR)
	dotest-equal WW(WRITE_STR) WW(READ_STR)
    }
    mbfl_location_leave
}
function scatter-file-descriptors-scatter-gather-2.1 () {
    mbfl_location_enter
    {
	declare WRITE_FD
	{
	    declare -i FLAGS=$((mmux_libc_O_WRONLY | mmux_libc_O_CREAT))
	    declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	    mbfl_location_compensate( mmux_libc_open WRITE_FD WW(FILENAME) RR(FLAGS) RR(MODE),
				      mmux_libc_close RR(WRITE_FD) )
	}

	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i WRITEV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug writing

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	# Scatter.
	{
	    declare -ir WRITE_STRLEN=mbfl_string_len(WRITE_STR)
	    declare -i IOVEC_IDX WRITE_STROFF=0 TMPLEN
	    declare TMPSTR BUFPTR

	    dotest-debug scattering WRITE_STRLEN=RR(WRITE_STRLEN) WRITE_STR=WW(WRITE_STR)

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( ((WRITE_STRLEN - WRITE_STROFF) >= BUFLEN)? BUFLEN : (WRITE_STRLEN - WRITE_STROFF) ))
		TMPSTR=${WRITE_STR:$WRITE_STROFF:$TMPLEN}
		dotest-debug scattering IOVEC_IDX=RR(IOVEC_IDX) TMPSTR=WW(TMPSTR) WRITE_STROFF=RR(WRITE_STROFF) TMPLEN=RR(TMPLEN)
		mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(BUFPTR) WW(TMPSTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		let WRITE_STROFF+=TMPLEN
	    done
	}

	mbfl_location_leave_when_failure( mmux_libc_pwritev WRITEV_DONE RR(WRITE_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) 0 )

	dotest-debug WRITEV_DONE=RR(WRITEV_DONE)
	dotest-equal mbfl_string_len(WRITE_STR) RR(WRITEV_DONE)
    }
    mbfl_location_leave
}
function gather-file-descriptors-scatter-gather-2.1 () {
    mbfl_location_enter
    {
	declare READ_FD
	{
	    declare -i FLAGS=$((mmux_libc_O_RDONLY ))
	    declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	    mbfl_location_compensate( mmux_libc_open READ_FD WW(FILENAME) RR(FLAGS) RR(MODE),
				      mmux_libc_close RR(READ_FD) )
	}

	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i READV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug reading

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 0 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 1 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 2 )

	mbfl_location_leave_when_failure( mmux_libc_preadv READV_DONE RR(READ_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) 0 )

	# Gather.
	{
	    declare -i IOVEC_IDX AMOUNT=RR(READV_DONE)
	    declare TMPSTR TMPLEN BUFPTR

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( (BUFLEN <= AMOUNT)? BUFLEN : AMOUNT ))
		mbfl_location_leave_when_failure( mmux_pointer_to_bash_string TMPSTR RR(BUFPTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		dotest-debug gathering IOVEC_IDX=RR(IOVEC_IDX) AMOUNT=RR(AMOUNT) TMPLEN=RR(TMPLEN) TMPSTR=WW(TMPSTR)
		READ_STR+=QQ(TMPSTR)
		let AMOUNT-=TMPLEN
	    done
	}

	dotest-equal mbfl_string_len(WRITE_STR) RR(READV_DONE)
    }
    mbfl_location_leave
}


#### scatter-gather input/output: preadv2, pwritev2

function file-descriptors-scatter-gather-3.1 () {
    mbfl_location_enter
    {
	declare -r FILENAME=$(dotest-mkfile 'name.ext')
	mbfl_location_handler dotest-clean-files

	declare -r WRITE_STR='0123456789ABCDEFGHILabcde'
	declare READ_STR

	dotest-unset-debug

	mbfl_location_leave_when_failure( scatter-file-descriptors-scatter-gather-3.1 )
	mbfl_location_leave_when_failure(  gather-file-descriptors-scatter-gather-3.1 )

	dotest-debug READ_STR=WW(READ_STR)
	dotest-equal WW(WRITE_STR) WW(READ_STR)
    }
    mbfl_location_leave
}
function scatter-file-descriptors-scatter-gather-3.1 () {
    mbfl_location_enter
    {
	declare WRITE_FD
	{
	    declare -i FLAGS=$((mmux_libc_O_WRONLY | mmux_libc_O_CREAT))
	    declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	    mbfl_location_compensate( mmux_libc_open WRITE_FD WW(FILENAME) RR(FLAGS) RR(MODE),
				      mmux_libc_close RR(WRITE_FD) )
	}

	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i WRITEV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug writing

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	# Scatter.
	{
	    declare -ir WRITE_STRLEN=mbfl_string_len(WRITE_STR)
	    declare -i IOVEC_IDX WRITE_STROFF=0 TMPLEN
	    declare TMPSTR BUFPTR

	    dotest-debug scattering WRITE_STRLEN=RR(WRITE_STRLEN) WRITE_STR=WW(WRITE_STR)

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( ((WRITE_STRLEN - WRITE_STROFF) >= BUFLEN)? BUFLEN : (WRITE_STRLEN - WRITE_STROFF) ))
		TMPSTR=${WRITE_STR:$WRITE_STROFF:$TMPLEN}
		dotest-debug scattering IOVEC_IDX=RR(IOVEC_IDX) TMPSTR=WW(TMPSTR) WRITE_STROFF=RR(WRITE_STROFF) TMPLEN=RR(TMPLEN)
		mbfl_location_leave_when_failure( mmux_libc_memcpy_from_bash_string RR(BUFPTR) WW(TMPSTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		let WRITE_STROFF+=TMPLEN
	    done
	}

	mbfl_location_leave_when_failure( mmux_libc_pwritev2 WRITEV_DONE RR(WRITE_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) \
							     0 RR(mmux_libc_RWF_SYNC) )

	dotest-debug WRITEV_DONE=RR(WRITEV_DONE)
	dotest-equal mbfl_string_len(WRITE_STR) RR(WRITEV_DONE)
    }
    mbfl_location_leave
}
function gather-file-descriptors-scatter-gather-3.1 () {
    mbfl_location_enter
    {
	declare READ_FD
	{
	    declare -i FLAGS=$((mmux_libc_O_RDONLY ))
	    declare -i MODE=$((mmux_libc_S_IRUSR | mmux_libc_S_IWUSR))

	    mbfl_location_compensate( mmux_libc_open READ_FD WW(FILENAME) RR(FLAGS) RR(MODE),
				      mmux_libc_close RR(READ_FD) )
	}

	declare -r BUFLEN='10' IOVEC_LEN='3'
	declare -i READV_DONE
	declare IOVEC_PTR BUFPTR0 BUFPTR1 BUFPTR2

	dotest-debug reading

	mbfl_location_compensate( mmux_libc_iovec_array_calloc IOVEC_PTR RR(IOVEC_LEN),
				  mmux_libc_free RR(IOVEC_PTR) )

	mbfl_location_compensate( mmux_libc_malloc BUFPTR0 RR(BUFLEN), mmux_libc_free RR(BUFPTR0) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR1 RR(BUFLEN), mmux_libc_free RR(BUFPTR1) )
	mbfl_location_compensate( mmux_libc_malloc BUFPTR2 RR(BUFLEN), mmux_libc_free RR(BUFPTR2) )

	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR0) 0)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR1) 1)
	mbfl_location_leave_when_failure( mmux_libc_iov_base_set RR(IOVEC_PTR) RR(BUFPTR2) 2)

	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 0 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 1 )
	mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(BUFLEN) 2 )

	mbfl_location_leave_when_failure( mmux_libc_preadv2 READV_DONE RR(READ_FD) RR(IOVEC_PTR) RR(IOVEC_LEN) \
							    0 RR(mmux_libc_RWF_SYNC) )

	# Gather.
	{
	    declare -i IOVEC_IDX AMOUNT=RR(READV_DONE)
	    declare TMPSTR TMPLEN BUFPTR

	    for ((IOVEC_IDX=0; IOVEC_IDX < IOVEC_LEN; ++IOVEC_IDX))
	    do
		mbfl_location_leave_when_failure( mmux_libc_iov_base_ref BUFPTR RR(IOVEC_PTR) RR(IOVEC_IDX) )

		TMPLEN=$(( (BUFLEN <= AMOUNT)? BUFLEN : AMOUNT ))
		mbfl_location_leave_when_failure( mmux_pointer_to_bash_string TMPSTR RR(BUFPTR) RR(TMPLEN) )
		mbfl_location_leave_when_failure( mmux_libc_iov_len_set RR(IOVEC_PTR) RR(TMPLEN) RR(IOVEC_IDX) )
		dotest-debug gathering IOVEC_IDX=RR(IOVEC_IDX) AMOUNT=RR(AMOUNT) TMPLEN=RR(TMPLEN) TMPSTR=WW(TMPSTR)
		READ_STR+=QQ(TMPSTR)
		let AMOUNT-=TMPLEN
	    done
	}

	dotest-equal mbfl_string_len(WRITE_STR) RR(READV_DONE)
    }
    mbfl_location_leave
}


#### let's go

dotest file-descriptors-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
