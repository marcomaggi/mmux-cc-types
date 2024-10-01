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
#!# The author hereby  grants permission to use,  copy, modify, distribute, and  license this software
#!# and its documentation  for any purpose, provided  that existing copyright notices  are retained in
#!# all copies and that this notice is  included verbatim in any distributions.  No written agreement,
#!# license,  or royalty  fee is  required for  any  of the  authorized uses.   Modifications to  this
#!# software may  be copyrighted by their  authors and need  not follow the licensing  terms described
#!# here, provided that the new terms are clearly indicated  on the first page of each file where they
#!# apply.
#!#
#!# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
#!# INCIDENTAL, OR CONSEQUENTIAL DAMAGES  ARISING OUT OF THE USE OF  THIS SOFTWARE, ITS DOCUMENTATION,
#!# OR ANY  DERIVATIVES THEREOF,  EVEN IF  THE AUTHOR  HAVE BEEN  ADVISED OF  THE POSSIBILITY  OF SUCH
#!# DAMAGE.
#!#
#!# THE AUTHOR AND  DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,
#!# THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
#!# THIS  SOFTWARE IS  PROVIDED  ON AN  \"AS  IS\" BASIS,  AND  THE AUTHOR  AND  DISTRIBUTORS HAVE  NO
#!# OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#!#


#### macros

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source WW(MMUX_LIBRARY)


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

	if ! mmux_libc_open FD QQ(FILENAME) $FLAGS $MODE
	then
	    mbfl_declare_varref(MSG)
	    mmux_libc_strerror _(MSG) $ERRNO
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

	if mmux_libc_open FD QQ(FILENAME) $FLAGS $MODE
	then mbfl_location_handler "mmux_libc_close $FD"
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-memory-from-array WW(BUFFER) _(ORIGIN_DATA) WW(SIZE)

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

	mmux-bash-pointers-array-from-memory _(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump _(RESULT) RESULT

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

	if mmux_libc_open FD QQ(FILENAME) $FLAGS $MODE
	then mbfl_location_handler "mmux_libc_close $FD" _(ID)
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-memory-from-array WW(BUFFER) _(ORIGIN_DATA) WW(SIZE)

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

	mmux-bash-pointers-array-from-memory _(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump _(RESULT) RESULT

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

	if mmux_libc_open FD QQ(FILENAME) $FLAGS $MODE
	then mbfl_location_handler "mmux_libc_close $FD" _(ID)
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_malloc BUFFER $SIZE
	then mbfl_location_handler "mmux_libc_free $BUFFER"
	else mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-memory-from-array WW(BUFFER) _(ORIGIN_DATA) WW(SIZE)

	if ! mmux_libc_pwrite DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	# I'm so dirty...
	NEW_FD=$(( FD + 1 ))

	if mmux_libc_dup2 FD $FD $NEW_FD
	then mbfl_location_replace_handler_by_id WW(ID) "mmux_libc_close WW(NEW_FD)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mmux_libc_pread DONE $FD $BUFFER $SIZE 0
	then mbfl_location_leave_then_return_failure
	fi

	mmux-bash-pointers-array-from-memory _(RESULT) WW(BUFFER) WW(SIZE)
	#mbfl_array_dump _(RESULT) RESULT

	dotest-equal $SIZE $DONE && \
	    dotest-equal 11 mbfl_slot_qref(RESULT, 0) && \
	    dotest-equal 22 mbfl_slot_qref(RESULT, 1) && \
	    dotest-equal 33 mbfl_slot_qref(RESULT, 2) && \
	    dotest-equal 44 mbfl_slot_qref(RESULT, 3) && \
	    dotest-equal 55 mbfl_slot_qref(RESULT, 4)
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
