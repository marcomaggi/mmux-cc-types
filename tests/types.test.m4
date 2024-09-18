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
    dotest-unset-debug
    dotest-debug libc_SIZEOF_POINTER=\"$libc_SIZEOF_POINTER\"
    test -v libc_SIZEOF_POINTER
}
function types-sizeof-pointer-1.2 () {
    libc_pointer_p $libc_SIZEOF_POINTER
}

function types-maximum-pointer-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_POINTER=\"$libc_MAX_POINTER\"
    test -v libc_MAX_POINTER
}
function types-minimum-pointer-2.2 () {
    libc_pointer_p $libc_MAX_POINTER
}

function types-maximum-pointer-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_POINTER=\"$libc_MIN_POINTER\"
    test -v libc_MIN_POINTER
}
function types-minimum-pointer-3.2 () {
    dotest-unset-debug
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


#### type variables: slong

function types-sizeof-slong-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SLONG=\"$libc_SIZEOF_SLONG\"
    test -v libc_SIZEOF_SLONG
}
function types-sizeof-slong-1.2 () {
    libc_slong_p $libc_SIZEOF_SLONG
}

function types-maximum-slong-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SLONG=\"$libc_MAX_SLONG\"
    test -v libc_MAX_SLONG
}
function types-minimum-slong-2.2 () {
    libc_slong_p $libc_MAX_SLONG
}

function types-maximum-slong-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SLONG=\"$libc_MIN_SLONG\"
    test -v libc_MIN_SLONG
}
function types-minimum-slong-3.2 () {
    libc_slong_p $libc_MIN_SLONG
}


#### type variables: ulong

function types-sizeof-ulong-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_ULONG=\"$libc_SIZEOF_ULONG\"
    test -v libc_SIZEOF_ULONG
}
function types-sizeof-ulong-1.2 () {
    libc_ulong_p $libc_SIZEOF_ULONG
}

function types-maximum-ulong-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_ULONG=\"$libc_MAX_ULONG\"
    test -v libc_MAX_ULONG
}
function types-minimum-ulong-2.2 () {
    libc_ulong_p $libc_MAX_ULONG
}

function types-maximum-ulong-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_ULONG=\"$libc_MIN_ULONG\"
    test -v libc_MIN_ULONG
}
function types-minimum-ulong-3.2 () {
    libc_ulong_p $libc_MIN_ULONG
}


#### type variables: sllong

function types-sizeof-sllong-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SLLONG=\"$libc_SIZEOF_SLLONG\"
    test -v libc_SIZEOF_SLLONG
}
function types-sizeof-sllong-1.2 () {
    libc_sllong_p $libc_SIZEOF_SLLONG
}

function types-maximum-sllong-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SLLONG=\"$libc_MAX_SLLONG\"
    test -v libc_MAX_SLLONG
}
function types-minimum-sllong-2.2 () {
    libc_sllong_p $libc_MAX_SLLONG
}

function types-maximum-sllong-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SLLONG=\"$libc_MIN_SLLONG\"
    test -v libc_MIN_SLLONG
}
function types-minimum-sllong-3.2 () {
    libc_sllong_p $libc_MIN_SLLONG
}


#### type variables: ullong

function types-sizeof-ullong-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_ULLONG=\"$libc_SIZEOF_ULLONG\"
    test -v libc_SIZEOF_ULLONG
}
function types-sizeof-ullong-1.2 () {
    libc_ullong_p $libc_SIZEOF_ULLONG
}

function types-maximum-ullong-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_ULLONG=\"$libc_MAX_ULLONG\"
    test -v libc_MAX_ULLONG
}
function types-minimum-ullong-2.2 () {
    libc_ullong_p $libc_MAX_ULLONG
}

function types-maximum-ullong-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_ULLONG=\"$libc_MIN_ULLONG\"
    test -v libc_MIN_ULLONG
}
function types-minimum-ullong-3.2 () {
    libc_ullong_p $libc_MIN_ULLONG
}


#### type variables: sint8

function types-sizeof-sint8-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINT8=\"$libc_SIZEOF_SINT8\"
    test -v libc_SIZEOF_SINT8
}
function types-sizeof-sint8-1.2 () {
    libc_sint8_p $libc_SIZEOF_SINT8
}

function types-maximum-sint8-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINT8=\"$libc_MAX_SINT8\"
    test -v libc_MAX_SINT8
}
function types-minimum-sint8-2.2 () {
    libc_sint8_p $libc_MAX_SINT8
}

function types-maximum-sint8-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINT8=\"$libc_MIN_SINT8\"
    test -v libc_MIN_SINT8
}
function types-minimum-sint8-3.2 () {
    libc_sint8_p $libc_MIN_SINT8
}


#### type variables: uint8

function types-sizeof-uint8-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINT8=\"$libc_SIZEOF_UINT8\"
    test -v libc_SIZEOF_UINT8
}
function types-sizeof-uint8-1.2 () {
    libc_uint8_p $libc_SIZEOF_UINT8
}

function types-maximum-uint8-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINT8=\"$libc_MAX_UINT8\"
    test -v libc_MAX_UINT8
}
function types-minimum-uint8-2.2 () {
    libc_uint8_p $libc_MAX_UINT8
}

function types-maximum-uint8-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINT8=\"$libc_MIN_UINT8\"
    test -v libc_MIN_UINT8
}
function types-minimum-uint8-3.2 () {
    libc_uint8_p $libc_MIN_UINT8
}


#### type variables: sint16

function types-sizeof-sint16-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINT16=\"$libc_SIZEOF_SINT16\"
    test -v libc_SIZEOF_SINT16
}
function types-sizeof-sint16-1.2 () {
    libc_sint16_p $libc_SIZEOF_SINT16
}

function types-maximum-sint16-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINT16=\"$libc_MAX_SINT16\"
    test -v libc_MAX_SINT16
}
function types-minimum-sint16-2.2 () {
    libc_sint16_p $libc_MAX_SINT16
}

function types-maximum-sint16-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINT16=\"$libc_MIN_SINT16\"
    test -v libc_MIN_SINT16
}
function types-minimum-sint16-3.2 () {
    libc_sint16_p $libc_MIN_SINT16
}


#### type variables: uint16

function types-sizeof-uint16-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINT16=\"$libc_SIZEOF_UINT16\"
    test -v libc_SIZEOF_UINT16
}
function types-sizeof-uint16-1.2 () {
    libc_uint16_p $libc_SIZEOF_UINT16
}

function types-maximum-uint16-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINT16=\"$libc_MAX_UINT16\"
    test -v libc_MAX_UINT16
}
function types-minimum-uint16-2.2 () {
    libc_uint16_p $libc_MAX_UINT16
}

function types-maximum-uint16-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINT16=\"$libc_MIN_UINT16\"
    test -v libc_MIN_UINT16
}
function types-minimum-uint16-3.2 () {
    libc_uint16_p $libc_MIN_UINT16
}


#### type variables: sint32

function types-sizeof-sint32-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINT32=\"$libc_SIZEOF_SINT32\"
    test -v libc_SIZEOF_SINT32
}
function types-sizeof-sint32-1.2 () {
    libc_sint32_p $libc_SIZEOF_SINT32
}

function types-maximum-sint32-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINT32=\"$libc_MAX_SINT32\"
    test -v libc_MAX_SINT32
}
function types-minimum-sint32-2.2 () {
    libc_sint32_p $libc_MAX_SINT32
}

function types-maximum-sint32-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINT32=\"$libc_MIN_SINT32\"
    test -v libc_MIN_SINT32
}
function types-minimum-sint32-3.2 () {
    libc_sint32_p $libc_MIN_SINT32
}


#### type variables: uint32

function types-sizeof-uint32-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINT32=\"$libc_SIZEOF_UINT32\"
    test -v libc_SIZEOF_UINT32
}
function types-sizeof-uint32-1.2 () {
    libc_uint32_p $libc_SIZEOF_UINT32
}

function types-maximum-uint32-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINT32=\"$libc_MAX_UINT32\"
    test -v libc_MAX_UINT32
}
function types-minimum-uint32-2.2 () {
    libc_uint32_p $libc_MAX_UINT32
}

function types-maximum-uint32-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINT32=\"$libc_MIN_UINT32\"
    test -v libc_MIN_UINT32
}
function types-minimum-uint32-3.2 () {
    libc_uint32_p $libc_MIN_UINT32
}


#### type variables: sint64

function types-sizeof-sint64-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINT64=\"$libc_SIZEOF_SINT64\"
    test -v libc_SIZEOF_SINT64
}
function types-sizeof-sint64-1.2 () {
    libc_sint64_p $libc_SIZEOF_SINT64
}

function types-maximum-sint64-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINT64=\"$libc_MAX_SINT64\"
    test -v libc_MAX_SINT64
}
function types-minimum-sint64-2.2 () {
    libc_sint64_p $libc_MAX_SINT64
}

function types-maximum-sint64-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINT64=\"$libc_MIN_SINT64\"
    test -v libc_MIN_SINT64
}
function types-minimum-sint64-3.2 () {
    libc_sint64_p $libc_MIN_SINT64
}


#### type variables: uint64

function types-sizeof-uint64-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINT64=\"$libc_SIZEOF_UINT64\"
    test -v libc_SIZEOF_UINT64
}
function types-sizeof-uint64-1.2 () {
    libc_uint64_p $libc_SIZEOF_UINT64
}

function types-maximum-uint64-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINT64=\"$libc_MAX_UINT64\"
    test -v libc_MAX_UINT64
}
function types-minimum-uint64-2.2 () {
    libc_uint64_p $libc_MAX_UINT64
}

function types-maximum-uint64-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINT64=\"$libc_MIN_UINT64\"
    test -v libc_MIN_UINT64
}
function types-minimum-uint64-3.2 () {
    libc_uint64_p $libc_MIN_UINT64
}


#### type variables: float

function types-sizeof-float-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_FLOAT=\"$libc_SIZEOF_FLOAT\"
    test -v libc_SIZEOF_FLOAT
}
function types-sizeof-float-1.2 () {
    libc_float_p $libc_SIZEOF_FLOAT
}

function types-maximum-float-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_FLOAT=\"$libc_MAX_FLOAT\"
    test -v libc_MAX_FLOAT
}
function types-minimum-float-2.2 () {
    libc_float_p $libc_MAX_FLOAT
}

function types-maximum-float-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_FLOAT=\"$libc_MIN_FLOAT\"
    test -v libc_MIN_FLOAT
}
function types-minimum-float-3.2 () {
    libc_float_p $libc_MIN_FLOAT
}


#### type variables: double

function types-sizeof-double-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_DOUBLE=\"$libc_SIZEOF_DOUBLE\"
    test -v libc_SIZEOF_DOUBLE
}
function types-sizeof-double-1.2 () {
    libc_double_p $libc_SIZEOF_DOUBLE
}

function types-maximum-double-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_DOUBLE=\"$libc_MAX_DOUBLE\"
    test -v libc_MAX_DOUBLE
}
function types-minimum-double-2.2 () {
    libc_double_p $libc_MAX_DOUBLE
}

function types-maximum-double-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_DOUBLE=\"$libc_MIN_DOUBLE\"
    test -v libc_MIN_DOUBLE
}
function types-minimum-double-3.2 () {
    libc_double_p $libc_MIN_DOUBLE
}


#### type variables: ldouble

function types-sizeof-ldouble-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_LDOUBLE=\"$libc_SIZEOF_LDOUBLE\"
    test -v libc_SIZEOF_LDOUBLE
}
function types-sizeof-ldouble-1.2 () {
    libc_ldouble_p $libc_SIZEOF_LDOUBLE
}

function types-maximum-ldouble-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_LDOUBLE=\"$libc_MAX_LDOUBLE\"
    test -v libc_MAX_LDOUBLE
}
function types-minimum-ldouble-2.2 () {
    libc_ldouble_p $libc_MAX_LDOUBLE
}

function types-maximum-ldouble-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_LDOUBLE=\"$libc_MIN_LDOUBLE\"
    test -v libc_MIN_LDOUBLE
}
function types-minimum-ldouble-3.2 () {
    libc_ldouble_p $libc_MIN_LDOUBLE
}


#### type variables: ssize

function types-sizeof-ssize-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SSIZE=\"$libc_SIZEOF_SSIZE\"
    test -v libc_SIZEOF_SSIZE
}
function types-sizeof-ssize-1.2 () {
    libc_ssize_p $libc_SIZEOF_SSIZE
}

function types-maximum-ssize-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SSIZE=\"$libc_MAX_SSIZE\"
    test -v libc_MAX_SSIZE
}
function types-minimum-ssize-2.2 () {
    libc_ssize_p $libc_MAX_SSIZE
}

function types-maximum-ssize-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SSIZE=\"$libc_MIN_SSIZE\"
    test -v libc_MIN_SSIZE
}
function types-minimum-ssize-3.2 () {
    libc_ssize_p $libc_MIN_SSIZE
}


#### type variables: usize

function types-sizeof-usize-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_USIZE=\"$libc_SIZEOF_USIZE\"
    test -v libc_SIZEOF_USIZE
}
function types-sizeof-usize-1.2 () {
    libc_usize_p $libc_SIZEOF_USIZE
}

function types-maximum-usize-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_USIZE=\"$libc_MAX_USIZE\"
    test -v libc_MAX_USIZE
}
function types-minimum-usize-2.2 () {
    libc_usize_p $libc_MAX_USIZE
}

function types-maximum-usize-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_USIZE=\"$libc_MIN_USIZE\"
    test -v libc_MIN_USIZE
}
function types-minimum-usize-3.2 () {
    libc_usize_p $libc_MIN_USIZE
}


#### type variables: sintmax

function types-sizeof-sintmax-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINTMAX=\"$libc_SIZEOF_SINTMAX\"
    test -v libc_SIZEOF_SINTMAX
}
function types-sizeof-sintmax-1.2 () {
    libc_sintmax_p $libc_SIZEOF_SINTMAX
}

function types-maximum-sintmax-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINTMAX=\"$libc_MAX_SINTMAX\"
    test -v libc_MAX_SINTMAX
}
function types-minimum-sintmax-2.2 () {
    libc_sintmax_p $libc_MAX_SINTMAX
}

function types-maximum-sintmax-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINTMAX=\"$libc_MIN_SINTMAX\"
    test -v libc_MIN_SINTMAX
}
function types-minimum-sintmax-3.2 () {
    libc_sintmax_p $libc_MIN_SINTMAX
}


#### type variables: uintmax

function types-sizeof-uintmax-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINTMAX=\"$libc_SIZEOF_UINTMAX\"
    test -v libc_SIZEOF_UINTMAX
}
function types-sizeof-uintmax-1.2 () {
    libc_uintmax_p $libc_SIZEOF_UINTMAX
}

function types-maximum-uintmax-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINTMAX=\"$libc_MAX_UINTMAX\"
    test -v libc_MAX_UINTMAX
}
function types-minimum-uintmax-2.2 () {
    libc_uintmax_p $libc_MAX_UINTMAX
}

function types-maximum-uintmax-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINTMAX=\"$libc_MIN_UINTMAX\"
    test -v libc_MIN_UINTMAX
}
function types-minimum-uintmax-3.2 () {
    libc_uintmax_p $libc_MIN_UINTMAX
}


#### type variables: sintptr

function types-sizeof-sintptr-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_SINTPTR=\"$libc_SIZEOF_SINTPTR\"
    test -v libc_SIZEOF_SINTPTR
}
function types-sizeof-sintptr-1.2 () {
    libc_sintptr_p $libc_SIZEOF_SINTPTR
}

function types-maximum-sintptr-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_SINTPTR=\"$libc_MAX_SINTPTR\"
    test -v libc_MAX_SINTPTR
}
function types-minimum-sintptr-2.2 () {
    libc_sintptr_p $libc_MAX_SINTPTR
}

function types-maximum-sintptr-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_SINTPTR=\"$libc_MIN_SINTPTR\"
    test -v libc_MIN_SINTPTR
}
function types-minimum-sintptr-3.2 () {
    libc_sintptr_p $libc_MIN_SINTPTR
}


#### type variables: uintptr

function types-sizeof-uintptr-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UINTPTR=\"$libc_SIZEOF_UINTPTR\"
    test -v libc_SIZEOF_UINTPTR
}
function types-sizeof-uintptr-1.2 () {
    libc_uintptr_p $libc_SIZEOF_UINTPTR
}

function types-maximum-uintptr-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UINTPTR=\"$libc_MAX_UINTPTR\"
    test -v libc_MAX_UINTPTR
}
function types-minimum-uintptr-2.2 () {
    libc_uintptr_p $libc_MAX_UINTPTR
}

function types-maximum-uintptr-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UINTPTR=\"$libc_MIN_UINTPTR\"
    test -v libc_MIN_UINTPTR
}
function types-minimum-uintptr-3.2 () {
    libc_uintptr_p $libc_MIN_UINTPTR
}


#### type variables: ptrdiff

function types-sizeof-ptrdiff-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_PTRDIFF=\"$libc_SIZEOF_PTRDIFF\"
    test -v libc_SIZEOF_PTRDIFF
}
function types-sizeof-ptrdiff-1.2 () {
    libc_ptrdiff_p $libc_SIZEOF_PTRDIFF
}

function types-maximum-ptrdiff-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_PTRDIFF=\"$libc_MAX_PTRDIFF\"
    test -v libc_MAX_PTRDIFF
}
function types-minimum-ptrdiff-2.2 () {
    libc_ptrdiff_p $libc_MAX_PTRDIFF
}

function types-maximum-ptrdiff-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_PTRDIFF=\"$libc_MIN_PTRDIFF\"
    test -v libc_MIN_PTRDIFF
}
function types-minimum-ptrdiff-3.2 () {
    libc_ptrdiff_p $libc_MIN_PTRDIFF
}


#### type variables: mode

function types-sizeof-mode-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_MODE=\"$libc_SIZEOF_MODE\"
    test -v libc_SIZEOF_MODE
}
function types-sizeof-mode-1.2 () {
    libc_mode_p $libc_SIZEOF_MODE
}

function types-maximum-mode-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_MODE=\"$libc_MAX_MODE\"
    test -v libc_MAX_MODE
}
function types-minimum-mode-2.2 () {
    libc_mode_p $libc_MAX_MODE
}

function types-maximum-mode-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_MODE=\"$libc_MIN_MODE\"
    test -v libc_MIN_MODE
}
function types-minimum-mode-3.2 () {
    libc_mode_p $libc_MIN_MODE
}


#### type variables: off

function types-sizeof-off-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_OFF=\"$libc_SIZEOF_OFF\"
    test -v libc_SIZEOF_OFF
}
function types-sizeof-off-1.2 () {
    libc_off_p $libc_SIZEOF_OFF
}

function types-maximum-off-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_OFF=\"$libc_MAX_OFF\"
    test -v libc_MAX_OFF
}
function types-minimum-off-2.2 () {
    libc_off_p $libc_MAX_OFF
}

function types-maximum-off-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_OFF=\"$libc_MIN_OFF\"
    test -v libc_MIN_OFF
}
function types-minimum-off-3.2 () {
    libc_off_p $libc_MIN_OFF
}


#### type variables: pid

function types-sizeof-pid-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_PID=\"$libc_SIZEOF_PID\"
    test -v libc_SIZEOF_PID
}
function types-sizeof-pid-1.2 () {
    libc_pid_p $libc_SIZEOF_PID
}

function types-maximum-pid-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_PID=\"$libc_MAX_PID\"
    test -v libc_MAX_PID
}
function types-minimum-pid-2.2 () {
    libc_pid_p $libc_MAX_PID
}

function types-maximum-pid-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_PID=\"$libc_MIN_PID\"
    test -v libc_MIN_PID
}
function types-minimum-pid-3.2 () {
    libc_pid_p $libc_MIN_PID
}


#### type variables: uid

function types-sizeof-uid-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_UID=\"$libc_SIZEOF_UID\"
    test -v libc_SIZEOF_UID
}
function types-sizeof-uid-1.2 () {
    libc_uid_p $libc_SIZEOF_UID
}

function types-maximum-uid-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_UID=\"$libc_MAX_UID\"
    test -v libc_MAX_UID
}
function types-minimum-uid-2.2 () {
    libc_uid_p $libc_MAX_UID
}

function types-maximum-uid-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_UID=\"$libc_MIN_UID\"
    test -v libc_MIN_UID
}
function types-minimum-uid-3.2 () {
    libc_uid_p $libc_MIN_UID
}


#### type variables: gid

function types-sizeof-gid-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_GID=\"$libc_SIZEOF_GID\"
    test -v libc_SIZEOF_GID
}
function types-sizeof-gid-1.2 () {
    libc_gid_p $libc_SIZEOF_GID
}

function types-maximum-gid-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_GID=\"$libc_MAX_GID\"
    test -v libc_MAX_GID
}
function types-minimum-gid-2.2 () {
    libc_gid_p $libc_MAX_GID
}

function types-maximum-gid-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_GID=\"$libc_MIN_GID\"
    test -v libc_MIN_GID
}
function types-minimum-gid-3.2 () {
    libc_gid_p $libc_MIN_GID
}


#### type variables: wchar

function types-sizeof-wchar-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_WCHAR=\"$libc_SIZEOF_WCHAR\"
    test -v libc_SIZEOF_WCHAR
}
function types-sizeof-wchar-1.2 () {
    libc_wchar_p $libc_SIZEOF_WCHAR
}

function types-maximum-wchar-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_WCHAR=\"$libc_MAX_WCHAR\"
    test -v libc_MAX_WCHAR
}
function types-minimum-wchar-2.2 () {
    libc_wchar_p $libc_MAX_WCHAR
}

function types-maximum-wchar-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_WCHAR=\"$libc_MIN_WCHAR\"
    test -v libc_MIN_WCHAR
}
function types-minimum-wchar-3.2 () {
    libc_wchar_p $libc_MIN_WCHAR
}


#### type variables: wint

function types-sizeof-wint-1.1 () {
    dotest-unset-debug
    dotest-debug libc_SIZEOF_WINT=\"$libc_SIZEOF_WINT\"
    test -v libc_SIZEOF_WINT
}
function types-sizeof-wint-1.2 () {
    libc_wint_p $libc_SIZEOF_WINT
}

function types-maximum-wint-2.1 () {
    dotest-unset-debug
    dotest-debug libc_MAX_WINT=\"$libc_MAX_WINT\"
    test -v libc_MAX_WINT
}
function types-minimum-wint-2.2 () {
    libc_wint_p $libc_MAX_WINT
}

function types-maximum-wint-3.1 () {
    dotest-unset-debug
    dotest-debug libc_MIN_WINT=\"$libc_MIN_WINT\"
    test -v libc_MIN_WINT
}
function types-minimum-wint-3.2 () {
    libc_wint_p $libc_MIN_WINT
}


#### let's go

dotest types-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
