#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for C language types support
#!# Date: Sep 17, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/types.bash ; less tests/types.log
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
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_POINTER=\"$mmux_libc_SIZEOF_POINTER\"
    test -v mmux_libc_SIZEOF_POINTER
}
function types-sizeof-pointer-1.2 () {
    mmux_pointer_is_string $mmux_libc_SIZEOF_POINTER
}

function types-maximum-pointer-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_POINTER=\"$mmux_libc_MAX_POINTER\"
    test -v mmux_libc_MAX_POINTER
}
function types-minimum-pointer-2.2 () {
    mmux_pointer_is_string $mmux_libc_MAX_POINTER
}

function types-maximum-pointer-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_POINTER=\"$mmux_libc_MIN_POINTER\"
    test -v mmux_libc_MIN_POINTER
}
function types-minimum-pointer-3.2 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_POINTER=\"$mmux_libc_MIN_POINTER\"
    mmux_pointer_is_string $mmux_libc_MIN_POINTER
}


#### type variables: schar

function types-sizeof-schar-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SCHAR=\"$mmux_libc_SIZEOF_SCHAR\"
    test -v mmux_libc_SIZEOF_SCHAR
}
function types-sizeof-schar-1.2 () {
    mmux_schar_is_string $mmux_libc_SIZEOF_SCHAR
}

function types-maximum-schar-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SCHAR=\"$mmux_libc_MAX_SCHAR\"
    test -v mmux_libc_MAX_SCHAR
}
function types-minimum-schar-2.2 () {
    mmux_schar_is_string $mmux_libc_MAX_SCHAR
}

function types-maximum-schar-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SCHAR=\"$mmux_libc_MIN_SCHAR\"
    test -v mmux_libc_MIN_SCHAR
}
function types-minimum-schar-3.2 () {
    mmux_schar_is_string $mmux_libc_MIN_SCHAR
}


#### type variables: uchar

function types-sizeof-uchar-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UCHAR=\"$mmux_libc_SIZEOF_UCHAR\"
    test -v mmux_libc_SIZEOF_UCHAR
}
function types-sizeof-uchar-1.2 () {
    mmux_uchar_is_string $mmux_libc_SIZEOF_UCHAR
}

function types-maximum-uchar-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UCHAR=\"$mmux_libc_MAX_UCHAR\"
    test -v mmux_libc_MAX_UCHAR
}
function types-minimum-uchar-2.2 () {
    mmux_uchar_is_string $mmux_libc_MAX_UCHAR
}

function types-maximum-uchar-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UCHAR=\"$mmux_libc_MIN_UCHAR\"
    test -v mmux_libc_MIN_UCHAR
}
function types-minimum-uchar-3.2 () {
    mmux_uchar_is_string $mmux_libc_MIN_UCHAR
}


#### type variables: sint

function types-sizeof-sint-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINT=\"$mmux_libc_SIZEOF_SINT\"
    test -v mmux_libc_SIZEOF_SINT
}
function types-sizeof-sint-1.2 () {
    mmux_sint_is_string $mmux_libc_SIZEOF_SINT
}

function types-maximum-sint-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINT=\"$mmux_libc_MAX_SINT\"
    test -v mmux_libc_MAX_SINT
}
function types-minimum-sint-2.2 () {
    mmux_sint_is_string $mmux_libc_MAX_SINT
}

function types-maximum-sint-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINT=\"$mmux_libc_MIN_SINT\"
    test -v mmux_libc_MIN_SINT
}
function types-minimum-sint-3.2 () {
    mmux_sint_is_string $mmux_libc_MIN_SINT
}


#### type variables: uint

function types-sizeof-uint-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINT=\"$mmux_libc_SIZEOF_UINT\"
    test -v mmux_libc_SIZEOF_UINT
}
function types-sizeof-uint-1.2 () {
    mmux_uint_is_string $mmux_libc_SIZEOF_UINT
}

function types-maximum-uint-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINT=\"$mmux_libc_MAX_UINT\"
    test -v mmux_libc_MAX_UINT
}
function types-minimum-uint-2.2 () {
    mmux_uint_is_string $mmux_libc_MAX_UINT
}

function types-maximum-uint-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINT=\"$mmux_libc_MIN_UINT\"
    test -v mmux_libc_MIN_UINT
}
function types-minimum-uint-3.2 () {
    mmux_uint_is_string $mmux_libc_MIN_UINT
}


#### type variables: slong

function types-sizeof-slong-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SLONG=\"$mmux_libc_SIZEOF_SLONG\"
    test -v mmux_libc_SIZEOF_SLONG
}
function types-sizeof-slong-1.2 () {
    mmux_slong_is_string $mmux_libc_SIZEOF_SLONG
}

function types-maximum-slong-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SLONG=\"$mmux_libc_MAX_SLONG\"
    test -v mmux_libc_MAX_SLONG
}
function types-minimum-slong-2.2 () {
    mmux_slong_is_string $mmux_libc_MAX_SLONG
}

function types-maximum-slong-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SLONG=\"$mmux_libc_MIN_SLONG\"
    test -v mmux_libc_MIN_SLONG
}
function types-minimum-slong-3.2 () {
    mmux_slong_is_string $mmux_libc_MIN_SLONG
}


#### type variables: ulong

function types-sizeof-ulong-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_ULONG=\"$mmux_libc_SIZEOF_ULONG\"
    test -v mmux_libc_SIZEOF_ULONG
}
function types-sizeof-ulong-1.2 () {
    mmux_ulong_is_string $mmux_libc_SIZEOF_ULONG
}

function types-maximum-ulong-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_ULONG=\"$mmux_libc_MAX_ULONG\"
    test -v mmux_libc_MAX_ULONG
}
function types-minimum-ulong-2.2 () {
    mmux_ulong_is_string $mmux_libc_MAX_ULONG
}

function types-maximum-ulong-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_ULONG=\"$mmux_libc_MIN_ULONG\"
    test -v mmux_libc_MIN_ULONG
}
function types-minimum-ulong-3.2 () {
    mmux_ulong_is_string $mmux_libc_MIN_ULONG
}


#### type variables: sllong

function types-sizeof-sllong-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SLLONG=\"$mmux_libc_SIZEOF_SLLONG\"
    test -v mmux_libc_SIZEOF_SLLONG
}
function types-sizeof-sllong-1.2 () {
    mmux_sllong_is_string $mmux_libc_SIZEOF_SLLONG
}

function types-maximum-sllong-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SLLONG=\"$mmux_libc_MAX_SLLONG\"
    test -v mmux_libc_MAX_SLLONG
}
function types-minimum-sllong-2.2 () {
    mmux_sllong_is_string $mmux_libc_MAX_SLLONG
}

function types-maximum-sllong-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SLLONG=\"$mmux_libc_MIN_SLLONG\"
    test -v mmux_libc_MIN_SLLONG
}
function types-minimum-sllong-3.2 () {
    mmux_sllong_is_string $mmux_libc_MIN_SLLONG
}


#### type variables: ullong

function types-sizeof-ullong-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_ULLONG=\"$mmux_libc_SIZEOF_ULLONG\"
    test -v mmux_libc_SIZEOF_ULLONG
}
function types-sizeof-ullong-1.2 () {
    mmux_ullong_is_string $mmux_libc_SIZEOF_ULLONG
}

function types-maximum-ullong-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_ULLONG=\"$mmux_libc_MAX_ULLONG\"
    test -v mmux_libc_MAX_ULLONG
}
function types-minimum-ullong-2.2 () {
    mmux_ullong_is_string $mmux_libc_MAX_ULLONG
}

function types-maximum-ullong-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_ULLONG=\"$mmux_libc_MIN_ULLONG\"
    test -v mmux_libc_MIN_ULLONG
}
function types-minimum-ullong-3.2 () {
    mmux_ullong_is_string $mmux_libc_MIN_ULLONG
}


#### type variables: sint8

function types-sizeof-sint8-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINT8=\"$mmux_libc_SIZEOF_SINT8\"
    test -v mmux_libc_SIZEOF_SINT8
}
function types-sizeof-sint8-1.2 () {
    mmux_sint8_is_string $mmux_libc_SIZEOF_SINT8
}

function types-maximum-sint8-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINT8=\"$mmux_libc_MAX_SINT8\"
    test -v mmux_libc_MAX_SINT8
}
function types-minimum-sint8-2.2 () {
    mmux_sint8_is_string $mmux_libc_MAX_SINT8
}

function types-maximum-sint8-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINT8=\"$mmux_libc_MIN_SINT8\"
    test -v mmux_libc_MIN_SINT8
}
function types-minimum-sint8-3.2 () {
    mmux_sint8_is_string $mmux_libc_MIN_SINT8
}


#### type variables: uint8

function types-sizeof-uint8-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINT8=\"$mmux_libc_SIZEOF_UINT8\"
    test -v mmux_libc_SIZEOF_UINT8
}
function types-sizeof-uint8-1.2 () {
    mmux_uint8_is_string $mmux_libc_SIZEOF_UINT8
}

function types-maximum-uint8-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINT8=\"$mmux_libc_MAX_UINT8\"
    test -v mmux_libc_MAX_UINT8
}
function types-minimum-uint8-2.2 () {
    mmux_uint8_is_string $mmux_libc_MAX_UINT8
}

function types-maximum-uint8-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINT8=\"$mmux_libc_MIN_UINT8\"
    test -v mmux_libc_MIN_UINT8
}
function types-minimum-uint8-3.2 () {
    mmux_uint8_is_string $mmux_libc_MIN_UINT8
}


#### type variables: sint16

function types-sizeof-sint16-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINT16=\"$mmux_libc_SIZEOF_SINT16\"
    test -v mmux_libc_SIZEOF_SINT16
}
function types-sizeof-sint16-1.2 () {
    mmux_sint16_is_string $mmux_libc_SIZEOF_SINT16
}

function types-maximum-sint16-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINT16=\"$mmux_libc_MAX_SINT16\"
    test -v mmux_libc_MAX_SINT16
}
function types-minimum-sint16-2.2 () {
    mmux_sint16_is_string $mmux_libc_MAX_SINT16
}

function types-maximum-sint16-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINT16=\"$mmux_libc_MIN_SINT16\"
    test -v mmux_libc_MIN_SINT16
}
function types-minimum-sint16-3.2 () {
    mmux_sint16_is_string $mmux_libc_MIN_SINT16
}


#### type variables: uint16

function types-sizeof-uint16-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINT16=\"$mmux_libc_SIZEOF_UINT16\"
    test -v mmux_libc_SIZEOF_UINT16
}
function types-sizeof-uint16-1.2 () {
    mmux_uint16_is_string $mmux_libc_SIZEOF_UINT16
}

function types-maximum-uint16-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINT16=\"$mmux_libc_MAX_UINT16\"
    test -v mmux_libc_MAX_UINT16
}
function types-minimum-uint16-2.2 () {
    mmux_uint16_is_string $mmux_libc_MAX_UINT16
}

function types-maximum-uint16-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINT16=\"$mmux_libc_MIN_UINT16\"
    test -v mmux_libc_MIN_UINT16
}
function types-minimum-uint16-3.2 () {
    mmux_uint16_is_string $mmux_libc_MIN_UINT16
}


#### type variables: sint32

function types-sizeof-sint32-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINT32=\"$mmux_libc_SIZEOF_SINT32\"
    test -v mmux_libc_SIZEOF_SINT32
}
function types-sizeof-sint32-1.2 () {
    mmux_sint32_is_string $mmux_libc_SIZEOF_SINT32
}

function types-maximum-sint32-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINT32=\"$mmux_libc_MAX_SINT32\"
    test -v mmux_libc_MAX_SINT32
}
function types-minimum-sint32-2.2 () {
    mmux_sint32_is_string $mmux_libc_MAX_SINT32
}

function types-maximum-sint32-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINT32=\"$mmux_libc_MIN_SINT32\"
    test -v mmux_libc_MIN_SINT32
}
function types-minimum-sint32-3.2 () {
    mmux_sint32_is_string $mmux_libc_MIN_SINT32
}


#### type variables: uint32

function types-sizeof-uint32-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINT32=\"$mmux_libc_SIZEOF_UINT32\"
    test -v mmux_libc_SIZEOF_UINT32
}
function types-sizeof-uint32-1.2 () {
    mmux_uint32_is_string $mmux_libc_SIZEOF_UINT32
}

function types-maximum-uint32-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINT32=\"$mmux_libc_MAX_UINT32\"
    test -v mmux_libc_MAX_UINT32
}
function types-minimum-uint32-2.2 () {
    mmux_uint32_is_string $mmux_libc_MAX_UINT32
}

function types-maximum-uint32-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINT32=\"$mmux_libc_MIN_UINT32\"
    test -v mmux_libc_MIN_UINT32
}
function types-minimum-uint32-3.2 () {
    mmux_uint32_is_string $mmux_libc_MIN_UINT32
}


#### type variables: sint64

function types-sizeof-sint64-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINT64=\"$mmux_libc_SIZEOF_SINT64\"
    test -v mmux_libc_SIZEOF_SINT64
}
function types-sizeof-sint64-1.2 () {
    mmux_sint64_is_string $mmux_libc_SIZEOF_SINT64
}

function types-maximum-sint64-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINT64=\"$mmux_libc_MAX_SINT64\"
    test -v mmux_libc_MAX_SINT64
}
function types-minimum-sint64-2.2 () {
    mmux_sint64_is_string $mmux_libc_MAX_SINT64
}

function types-maximum-sint64-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINT64=\"$mmux_libc_MIN_SINT64\"
    test -v mmux_libc_MIN_SINT64
}
function types-minimum-sint64-3.2 () {
    mmux_sint64_is_string $mmux_libc_MIN_SINT64
}


#### type variables: uint64

function types-sizeof-uint64-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINT64=\"$mmux_libc_SIZEOF_UINT64\"
    test -v mmux_libc_SIZEOF_UINT64
}
function types-sizeof-uint64-1.2 () {
    mmux_uint64_is_string $mmux_libc_SIZEOF_UINT64
}

function types-maximum-uint64-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINT64=\"$mmux_libc_MAX_UINT64\"
    test -v mmux_libc_MAX_UINT64
}
function types-minimum-uint64-2.2 () {
    mmux_uint64_is_string $mmux_libc_MAX_UINT64
}

function types-maximum-uint64-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINT64=\"$mmux_libc_MIN_UINT64\"
    test -v mmux_libc_MIN_UINT64
}
function types-minimum-uint64-3.2 () {
    mmux_uint64_is_string $mmux_libc_MIN_UINT64
}


#### type variables: float

function types-sizeof-float-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_FLOAT=\"$mmux_libc_SIZEOF_FLOAT\"
    test -v mmux_libc_SIZEOF_FLOAT
}
function types-sizeof-float-1.2 () {
    mmux_float_is_string $mmux_libc_SIZEOF_FLOAT
}

function types-maximum-float-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_FLOAT=\"$mmux_libc_MAX_FLOAT\"
    test -v mmux_libc_MAX_FLOAT
}
function types-minimum-float-2.2 () {
    mmux_float_is_string $mmux_libc_MAX_FLOAT
}

function types-maximum-float-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_FLOAT=\"$mmux_libc_MIN_FLOAT\"
    test -v mmux_libc_MIN_FLOAT
}
function types-minimum-float-3.2 () {
    mmux_float_is_string $mmux_libc_MIN_FLOAT
}


#### type variables: double

function types-sizeof-double-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_DOUBLE=\"$mmux_libc_SIZEOF_DOUBLE\"
    test -v mmux_libc_SIZEOF_DOUBLE
}
function types-sizeof-double-1.2 () {
    mmux_double_is_string $mmux_libc_SIZEOF_DOUBLE
}

function types-maximum-double-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_DOUBLE=\"$mmux_libc_MAX_DOUBLE\"
    test -v mmux_libc_MAX_DOUBLE
}
function types-minimum-double-2.2 () {
    mmux_double_is_string $mmux_libc_MAX_DOUBLE
}

function types-maximum-double-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_DOUBLE=\"$mmux_libc_MIN_DOUBLE\"
    test -v mmux_libc_MIN_DOUBLE
}
function types-minimum-double-3.2 () {
    mmux_double_is_string $mmux_libc_MIN_DOUBLE
}


#### type variables: ldouble

function types-sizeof-ldouble-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_LDOUBLE=\"$mmux_libc_SIZEOF_LDOUBLE\"
    test -v mmux_libc_SIZEOF_LDOUBLE
}
function types-sizeof-ldouble-1.2 () {
    mmux_ldouble_is_string $mmux_libc_SIZEOF_LDOUBLE
}

function types-maximum-ldouble-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_LDOUBLE=\"$mmux_libc_MAX_LDOUBLE\"
    test -v mmux_libc_MAX_LDOUBLE
}
function types-minimum-ldouble-2.2 () {
    mmux_ldouble_is_string $mmux_libc_MAX_LDOUBLE
}

function types-maximum-ldouble-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_LDOUBLE=\"$mmux_libc_MIN_LDOUBLE\"
    test -v mmux_libc_MIN_LDOUBLE
}
function types-minimum-ldouble-3.2 () {
    mmux_ldouble_is_string $mmux_libc_MIN_LDOUBLE
}


#### type variables: ssize

function types-sizeof-ssize-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SSIZE=\"$mmux_libc_SIZEOF_SSIZE\"
    test -v mmux_libc_SIZEOF_SSIZE
}
function types-sizeof-ssize-1.2 () {
    mmux_ssize_is_string $mmux_libc_SIZEOF_SSIZE
}

function types-maximum-ssize-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SSIZE=\"$mmux_libc_MAX_SSIZE\"
    test -v mmux_libc_MAX_SSIZE
}
function types-minimum-ssize-2.2 () {
    mmux_ssize_is_string $mmux_libc_MAX_SSIZE
}

function types-maximum-ssize-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SSIZE=\"$mmux_libc_MIN_SSIZE\"
    test -v mmux_libc_MIN_SSIZE
}
function types-minimum-ssize-3.2 () {
    mmux_ssize_is_string $mmux_libc_MIN_SSIZE
}


#### type variables: usize

function types-sizeof-usize-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_USIZE=\"$mmux_libc_SIZEOF_USIZE\"
    test -v mmux_libc_SIZEOF_USIZE
}
function types-sizeof-usize-1.2 () {
    mmux_usize_is_string $mmux_libc_SIZEOF_USIZE
}

function types-maximum-usize-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_USIZE=\"$mmux_libc_MAX_USIZE\"
    test -v mmux_libc_MAX_USIZE
}
function types-minimum-usize-2.2 () {
    mmux_usize_is_string $mmux_libc_MAX_USIZE
}

function types-maximum-usize-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_USIZE=\"$mmux_libc_MIN_USIZE\"
    test -v mmux_libc_MIN_USIZE
}
function types-minimum-usize-3.2 () {
    mmux_usize_is_string $mmux_libc_MIN_USIZE
}


#### type variables: sintmax

function types-sizeof-sintmax-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINTMAX=\"$mmux_libc_SIZEOF_SINTMAX\"
    test -v mmux_libc_SIZEOF_SINTMAX
}
function types-sizeof-sintmax-1.2 () {
    mmux_sintmax_is_string $mmux_libc_SIZEOF_SINTMAX
}

function types-maximum-sintmax-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINTMAX=\"$mmux_libc_MAX_SINTMAX\"
    test -v mmux_libc_MAX_SINTMAX
}
function types-minimum-sintmax-2.2 () {
    mmux_sintmax_is_string $mmux_libc_MAX_SINTMAX
}

function types-maximum-sintmax-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINTMAX=\"$mmux_libc_MIN_SINTMAX\"
    test -v mmux_libc_MIN_SINTMAX
}
function types-minimum-sintmax-3.2 () {
    mmux_sintmax_is_string $mmux_libc_MIN_SINTMAX
}


#### type variables: uintmax

function types-sizeof-uintmax-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINTMAX=\"$mmux_libc_SIZEOF_UINTMAX\"
    test -v mmux_libc_SIZEOF_UINTMAX
}
function types-sizeof-uintmax-1.2 () {
    mmux_uintmax_is_string $mmux_libc_SIZEOF_UINTMAX
}

function types-maximum-uintmax-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINTMAX=\"$mmux_libc_MAX_UINTMAX\"
    test -v mmux_libc_MAX_UINTMAX
}
function types-minimum-uintmax-2.2 () {
    mmux_uintmax_is_string $mmux_libc_MAX_UINTMAX
}

function types-maximum-uintmax-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINTMAX=\"$mmux_libc_MIN_UINTMAX\"
    test -v mmux_libc_MIN_UINTMAX
}
function types-minimum-uintmax-3.2 () {
    mmux_uintmax_is_string $mmux_libc_MIN_UINTMAX
}


#### type variables: sintptr

function types-sizeof-sintptr-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_SINTPTR=\"$mmux_libc_SIZEOF_SINTPTR\"
    test -v mmux_libc_SIZEOF_SINTPTR
}
function types-sizeof-sintptr-1.2 () {
    mmux_sintptr_is_string $mmux_libc_SIZEOF_SINTPTR
}

function types-maximum-sintptr-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_SINTPTR=\"$mmux_libc_MAX_SINTPTR\"
    test -v mmux_libc_MAX_SINTPTR
}
function types-minimum-sintptr-2.2 () {
    mmux_sintptr_is_string $mmux_libc_MAX_SINTPTR
}

function types-maximum-sintptr-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_SINTPTR=\"$mmux_libc_MIN_SINTPTR\"
    test -v mmux_libc_MIN_SINTPTR
}
function types-minimum-sintptr-3.2 () {
    mmux_sintptr_is_string $mmux_libc_MIN_SINTPTR
}


#### type variables: uintptr

function types-sizeof-uintptr-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UINTPTR=\"$mmux_libc_SIZEOF_UINTPTR\"
    test -v mmux_libc_SIZEOF_UINTPTR
}
function types-sizeof-uintptr-1.2 () {
    mmux_uintptr_is_string $mmux_libc_SIZEOF_UINTPTR
}

function types-maximum-uintptr-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UINTPTR=\"$mmux_libc_MAX_UINTPTR\"
    test -v mmux_libc_MAX_UINTPTR
}
function types-minimum-uintptr-2.2 () {
    mmux_uintptr_is_string $mmux_libc_MAX_UINTPTR
}

function types-maximum-uintptr-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UINTPTR=\"$mmux_libc_MIN_UINTPTR\"
    test -v mmux_libc_MIN_UINTPTR
}
function types-minimum-uintptr-3.2 () {
    mmux_uintptr_is_string $mmux_libc_MIN_UINTPTR
}


#### type variables: ptrdiff

function types-sizeof-ptrdiff-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_PTRDIFF=\"$mmux_libc_SIZEOF_PTRDIFF\"
    test -v mmux_libc_SIZEOF_PTRDIFF
}
function types-sizeof-ptrdiff-1.2 () {
    mmux_ptrdiff_is_string $mmux_libc_SIZEOF_PTRDIFF
}

function types-maximum-ptrdiff-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_PTRDIFF=\"$mmux_libc_MAX_PTRDIFF\"
    test -v mmux_libc_MAX_PTRDIFF
}
function types-minimum-ptrdiff-2.2 () {
    mmux_ptrdiff_is_string $mmux_libc_MAX_PTRDIFF
}

function types-maximum-ptrdiff-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_PTRDIFF=\"$mmux_libc_MIN_PTRDIFF\"
    test -v mmux_libc_MIN_PTRDIFF
}
function types-minimum-ptrdiff-3.2 () {
    mmux_ptrdiff_is_string $mmux_libc_MIN_PTRDIFF
}


#### type variables: mode

function types-sizeof-mode-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_MODE=\"$mmux_libc_SIZEOF_MODE\"
    test -v mmux_libc_SIZEOF_MODE
}
function types-sizeof-mode-1.2 () {
    mmux_mode_is_string $mmux_libc_SIZEOF_MODE
}

function types-maximum-mode-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_MODE=\"$mmux_libc_MAX_MODE\"
    test -v mmux_libc_MAX_MODE
}
function types-minimum-mode-2.2 () {
    mmux_mode_is_string $mmux_libc_MAX_MODE
}

function types-maximum-mode-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_MODE=\"$mmux_libc_MIN_MODE\"
    test -v mmux_libc_MIN_MODE
}
function types-minimum-mode-3.2 () {
    mmux_mode_is_string $mmux_libc_MIN_MODE
}


#### type variables: off

function types-sizeof-off-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_OFF=\"$mmux_libc_SIZEOF_OFF\"
    test -v mmux_libc_SIZEOF_OFF
}
function types-sizeof-off-1.2 () {
    mmux_off_is_string $mmux_libc_SIZEOF_OFF
}

function types-maximum-off-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_OFF=\"$mmux_libc_MAX_OFF\"
    test -v mmux_libc_MAX_OFF
}
function types-minimum-off-2.2 () {
    mmux_off_is_string $mmux_libc_MAX_OFF
}

function types-maximum-off-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_OFF=\"$mmux_libc_MIN_OFF\"
    test -v mmux_libc_MIN_OFF
}
function types-minimum-off-3.2 () {
    mmux_off_is_string $mmux_libc_MIN_OFF
}


#### type variables: pid

function types-sizeof-pid-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_PID=\"$mmux_libc_SIZEOF_PID\"
    test -v mmux_libc_SIZEOF_PID
}
function types-sizeof-pid-1.2 () {
    mmux_pid_is_string $mmux_libc_SIZEOF_PID
}

function types-maximum-pid-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_PID=\"$mmux_libc_MAX_PID\"
    test -v mmux_libc_MAX_PID
}
function types-minimum-pid-2.2 () {
    mmux_pid_is_string $mmux_libc_MAX_PID
}

function types-maximum-pid-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_PID=\"$mmux_libc_MIN_PID\"
    test -v mmux_libc_MIN_PID
}
function types-minimum-pid-3.2 () {
    mmux_pid_is_string $mmux_libc_MIN_PID
}


#### type variables: uid

function types-sizeof-uid-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_UID=\"$mmux_libc_SIZEOF_UID\"
    test -v mmux_libc_SIZEOF_UID
}
function types-sizeof-uid-1.2 () {
    mmux_uid_is_string $mmux_libc_SIZEOF_UID
}

function types-maximum-uid-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_UID=\"$mmux_libc_MAX_UID\"
    test -v mmux_libc_MAX_UID
}
function types-minimum-uid-2.2 () {
    mmux_uid_is_string $mmux_libc_MAX_UID
}

function types-maximum-uid-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_UID=\"$mmux_libc_MIN_UID\"
    test -v mmux_libc_MIN_UID
}
function types-minimum-uid-3.2 () {
    mmux_uid_is_string $mmux_libc_MIN_UID
}


#### type variables: gid

function types-sizeof-gid-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_GID=\"$mmux_libc_SIZEOF_GID\"
    test -v mmux_libc_SIZEOF_GID
}
function types-sizeof-gid-1.2 () {
    mmux_gid_is_string $mmux_libc_SIZEOF_GID
}

function types-maximum-gid-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_GID=\"$mmux_libc_MAX_GID\"
    test -v mmux_libc_MAX_GID
}
function types-minimum-gid-2.2 () {
    mmux_gid_is_string $mmux_libc_MAX_GID
}

function types-maximum-gid-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_GID=\"$mmux_libc_MIN_GID\"
    test -v mmux_libc_MIN_GID
}
function types-minimum-gid-3.2 () {
    mmux_gid_is_string $mmux_libc_MIN_GID
}


#### type variables: wchar

function types-sizeof-wchar-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_WCHAR=\"$mmux_libc_SIZEOF_WCHAR\"
    test -v mmux_libc_SIZEOF_WCHAR
}
function types-sizeof-wchar-1.2 () {
    mmux_wchar_is_string $mmux_libc_SIZEOF_WCHAR
}

function types-maximum-wchar-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_WCHAR=\"$mmux_libc_MAX_WCHAR\"
    test -v mmux_libc_MAX_WCHAR
}
function types-minimum-wchar-2.2 () {
    mmux_wchar_is_string $mmux_libc_MAX_WCHAR
}

function types-maximum-wchar-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_WCHAR=\"$mmux_libc_MIN_WCHAR\"
    test -v mmux_libc_MIN_WCHAR
}
function types-minimum-wchar-3.2 () {
    mmux_wchar_is_string $mmux_libc_MIN_WCHAR
}


#### type variables: wint

function types-sizeof-wint-1.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_SIZEOF_WINT=\"$mmux_libc_SIZEOF_WINT\"
    test -v mmux_libc_SIZEOF_WINT
}
function types-sizeof-wint-1.2 () {
    mmux_wint_is_string $mmux_libc_SIZEOF_WINT
}

function types-maximum-wint-2.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MAX_WINT=\"$mmux_libc_MAX_WINT\"
    test -v mmux_libc_MAX_WINT
}
function types-minimum-wint-2.2 () {
    mmux_wint_is_string $mmux_libc_MAX_WINT
}

function types-maximum-wint-3.1 () {
    dotest-unset-debug
    dotest-debug mmux_libc_MIN_WINT=\"$mmux_libc_MIN_WINT\"
    test -v mmux_libc_MIN_WINT
}
function types-minimum-wint-3.2 () {
    mmux_wint_is_string $mmux_libc_MIN_WINT
}


#### let's go

dotest types-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
