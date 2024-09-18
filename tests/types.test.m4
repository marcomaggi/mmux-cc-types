#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for C language types support
#!# Date: Sep 17, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/types-inspection.bash ; less tests/types-inspection.log
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

function mbfl_string_is_integer_number () {
    # We want to accept an empty parameter and return unsuccessfully when given.
    mbfl_optional_parameter(ADDRESS, 1)
    local -r REX='^[+-]?[0-9]+$'

    if [[ $ADDRESS =~ $REX ]]
    then return 0
    else return 1
    fi
}


#### type variables: pointer

function types-sizeof-pointer-1.1 () {
    dotest-set-debug
    dotest-debug libc_SIZEOF_POINTER=\"$libc_SIZEOF_POINTER\"
    test -v libc_SIZEOF_POINTER
}
function types-sizeof-pointer-1.2 () {
    libc_pointer_p $libc_SIZEOF_POINTER
}

function types-maximum-pointer-2.1 () {
    dotest-set-debug
    dotest-debug libc_MAX_POINTER=\"$libc_MAX_POINTER\"
    test -v libc_MAX_POINTER
}
function types-minimum-pointer-2.2 () {
    libc_pointer_p $libc_MAX_POINTER
}

function types-maximum-pointer-3.1 () {
    dotest-set-debug
    dotest-debug libc_MIN_POINTER=\"$libc_MIN_POINTER\"
    test -v libc_MIN_POINTER
}
function types-minimum-pointer-3.2 () {
    dotest-set-debug
    dotest-debug libc_MIN_POINTER=\"$libc_MIN_POINTER\"
    libc_pointer_p $libc_MIN_POINTER
}


#### type variables: schar

function types-sizeof-schar-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SCHAR=\"$libc_SIZEOF_SCHAR\"
    test -v libc_SIZEOF_SCHAR
}
function types-sizeof-schar-1.2 () {
    libc_schar_p $libc_SIZEOF_SCHAR
}

function types-maximum-schar-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SCHAR=\"$libc_MAX_SCHAR\"
    test -v libc_MAX_SCHAR
}
function types-minimum-schar-2.2 () {
    libc_schar_p $libc_MAX_SCHAR
}

function types-maximum-schar-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SCHAR=\"$libc_MIN_SCHAR\"
    test -v libc_MIN_SCHAR
}
function types-minimum-schar-3.2 () {
    libc_schar_p $libc_MIN_SCHAR
}


#### type variables: uchar

function types-sizeof-uchar-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UCHAR=\"$libc_SIZEOF_UCHAR\"
    test -v libc_SIZEOF_UCHAR
}
function types-sizeof-uchar-1.2 () {
    libc_uchar_p $libc_SIZEOF_UCHAR
}

function types-maximum-uchar-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UCHAR=\"$libc_MAX_UCHAR\"
    test -v libc_MAX_UCHAR
}
function types-minimum-uchar-2.2 () {
    libc_uchar_p $libc_MAX_UCHAR
}

function types-maximum-uchar-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UCHAR=\"$libc_MIN_UCHAR\"
    test -v libc_MIN_UCHAR
}
function types-minimum-uchar-3.2 () {
    libc_uchar_p $libc_MIN_UCHAR
}


#### type variables: sint

function types-sizeof-sint-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINT=\"$libc_SIZEOF_SINT\"
    test -v libc_SIZEOF_SINT
}
function types-sizeof-sint-1.2 () {
    libc_sint_p $libc_SIZEOF_SINT
}

function types-maximum-sint-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINT=\"$libc_MAX_SINT\"
    test -v libc_MAX_SINT
}
function types-minimum-sint-2.2 () {
    libc_sint_p $libc_MAX_SINT
}

function types-maximum-sint-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINT=\"$libc_MIN_SINT\"
    test -v libc_MIN_SINT
}
function types-minimum-sint-3.2 () {
    libc_sint_p $libc_MIN_SINT
}


#### type variables: uint

function types-sizeof-uint-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINT=\"$libc_SIZEOF_UINT\"
    test -v libc_SIZEOF_UINT
}
function types-sizeof-uint-1.2 () {
    libc_uint_p $libc_SIZEOF_UINT
}

function types-maximum-uint-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINT=\"$libc_MAX_UINT\"
    test -v libc_MAX_UINT
}
function types-minimum-uint-2.2 () {
    libc_uint_p $libc_MAX_UINT
}

function types-maximum-uint-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINT=\"$libc_MIN_UINT\"
    test -v libc_MIN_UINT
}
function types-minimum-uint-3.2 () {
    libc_uint_p $libc_MIN_UINT
}


#### let's go

dotest types-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
