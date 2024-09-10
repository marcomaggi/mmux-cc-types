#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for memory management
#!# Date: Sep  9, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/memory.bash ; less tests/memory.log
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

source "$MMUX_LIBRARY"


#### standard memory allocation

function memory-1.1 () {
    declare PTR
    if malloc PTR 123
    then free $PTR
    else return $?
    fi
}
function memory-1.2 () {
    declare PTR
    if malloc PTR 123
    then
	if realloc PTR $PTR 456
	then free $PTR
	else return $?
	fi
    fi
}
function memory-1.3 () {
    declare PTR
    if calloc PTR 123 1
    then free $PTR
    else return $?
    fi
}


#### standard memory operations

function memory-2.1 () {
    declare PTR SIZE=123 RESULT=Z

    if malloc PTR $SIZE
    then
	memset $PTR 1 $SIZE
	pointer-ref-uint8 RESULT $PTR 1
	free $PTR
	dotest-equal 1 $RESULT
    else return $?
    fi
}

function memory-3.1 () {
    declare PTR_FROM PTR_TO SIZE=123 RESULT=Z

    malloc PTR_FROM $SIZE
    malloc PTR_TO   $SIZE

    memset $PTR_FROM 1 $SIZE
    memset $PTR_TO   0 $SIZE

    memcpy $PTR_TO $PTR_FROM $SIZE
    pointer-ref-uint8 RESULT $PTR_TO 10

    free $PTR_FROM
    free $PTR_TO

    dotest-equal 1 $RESULT
}

function memory-4.1 () {
    declare PTR_FROM PTR_TO SIZE=123 RESULT=Z

    malloc PTR_FROM $SIZE
    malloc PTR_TO   $SIZE

    memset $PTR_FROM 1 $SIZE
    memset $PTR_TO   0 $SIZE

    memmove $PTR_TO $PTR_FROM $SIZE
    pointer-ref-uint8 RESULT $PTR_TO 10

    free $PTR_FROM
    free $PTR_TO

    dotest-equal 1 $RESULT
}


#### let's go

dotest memory-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
