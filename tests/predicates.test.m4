#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for predicates builtins
#!# Date: Sep 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/predicates.test ; less tests/predicates.log
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


#### type variables: schar

function predicates-is-zero-schar-1.1 () {
    mmux_schar_is_zero 0
}
function predicates-is-zero-schar-1.2 () {
    ! mmux_schar_is_zero WW(mmux_schar_MAX)
}
function predicates-is-zero-schar-1.3 () {
    ! mmux_schar_is_zero WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-schar-1.1 () {
    ! mmux_schar_is_positive 0
}
function predicates-is-positive-schar-1.2 () {
    mmux_schar_is_positive WW(mmux_schar_MAX)
}
function predicates-is-positive-schar-1.3 () {
    ! mmux_schar_is_positive WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-schar-1.1 () {
    ! mmux_schar_is_negative 0
}
function predicates-is-negative-schar-1.2 () {
    ! mmux_schar_is_negative WW(mmux_schar_MAX)
}
function predicates-is-negative-schar-1.3 () {
    mmux_schar_is_negative WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-schar-1.1 () {
    mmux_schar_is_non_positive 0
}
function predicates-is-non-positive-schar-1.2 () {
    ! mmux_schar_is_non_positive WW(mmux_schar_MAX)
}
function predicates-is-non-positive-schar-1.3 () {
    mmux_schar_is_non_positive WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-schar-1.1 () {
    mmux_schar_is_non_negative 0
}
function predicates-is-non-negative-schar-1.2 () {
    mmux_schar_is_non_negative WW(mmux_schar_MAX)
}
function predicates-is-non-negative-schar-1.3 () {
    ! mmux_schar_is_non_negative WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-schar-1.1 () {
    ! mmux_schar_is_infinite WW(mmux_schar_MAX)
}
function predicates-is-infinite-schar-1.2 () {
    ! mmux_schar_is_infinite WW(mmux_schar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-schar-1.1 () {
    ! mmux_schar_is_nan WW(mmux_schar_MAX)
}
function predicates-is-nan-schar-1.2 () {
    ! mmux_schar_is_nan WW(mmux_schar_MIN)
}


#### type variables: uchar

function predicates-is-zero-uchar-1.1 () {
    mmux_uchar_is_zero 0
}
function predicates-is-zero-uchar-1.2 () {
    ! mmux_uchar_is_zero WW(mmux_uchar_MAX)
}
function predicates-is-zero-uchar-1.3 () {
    mmux_uchar_is_zero WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uchar-1.1 () {
    ! mmux_uchar_is_positive 0
}
function predicates-is-positive-uchar-1.2 () {
    mmux_uchar_is_positive WW(mmux_uchar_MAX)
}
function predicates-is-positive-uchar-1.3 () {
    ! mmux_uchar_is_positive WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uchar-1.1 () {
    ! mmux_uchar_is_negative 0
}
function predicates-is-negative-uchar-1.2 () {
    ! mmux_uchar_is_negative WW(mmux_uchar_MAX)
}
function predicates-is-negative-uchar-1.3 () {
    ! mmux_uchar_is_negative WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uchar-1.1 () {
    mmux_uchar_is_non_positive 0
}
function predicates-is-non-positive-uchar-1.2 () {
    ! mmux_uchar_is_non_positive WW(mmux_uchar_MAX)
}
function predicates-is-non-positive-uchar-1.3 () {
    mmux_uchar_is_non_positive WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uchar-1.1 () {
    mmux_uchar_is_non_negative 0
}
function predicates-is-non-negative-uchar-1.2 () {
    mmux_uchar_is_non_negative WW(mmux_uchar_MAX)
}
function predicates-is-non-negative-uchar-1.3 () {
    mmux_uchar_is_non_negative WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uchar-1.1 () {
    ! mmux_uchar_is_infinite WW(mmux_uchar_MAX)
}
function predicates-is-infinite-uchar-1.2 () {
    ! mmux_uchar_is_infinite WW(mmux_uchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uchar-1.1 () {
    ! mmux_uchar_is_nan WW(mmux_uchar_MAX)
}
function predicates-is-nan-uchar-1.2 () {
    ! mmux_uchar_is_nan WW(mmux_uchar_MIN)
}


#### type variables: sshort

function predicates-is-zero-sshort-1.1 () {
    mmux_sshort_is_zero 0
}
function predicates-is-zero-sshort-1.2 () {
    ! mmux_sshort_is_zero WW(mmux_sshort_MAX)
}
function predicates-is-zero-sshort-1.3 () {
    ! mmux_sshort_is_zero WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sshort-1.1 () {
    ! mmux_sshort_is_positive 0
}
function predicates-is-positive-sshort-1.2 () {
    mmux_sshort_is_positive WW(mmux_sshort_MAX)
}
function predicates-is-positive-sshort-1.3 () {
    ! mmux_sshort_is_positive WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sshort-1.1 () {
    ! mmux_sshort_is_negative 0
}
function predicates-is-negative-sshort-1.2 () {
    ! mmux_sshort_is_negative WW(mmux_sshort_MAX)
}
function predicates-is-negative-sshort-1.3 () {
    mmux_sshort_is_negative WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sshort-1.1 () {
    mmux_sshort_is_non_positive 0
}
function predicates-is-non-positive-sshort-1.2 () {
    ! mmux_sshort_is_non_positive WW(mmux_sshort_MAX)
}
function predicates-is-non-positive-sshort-1.3 () {
    mmux_sshort_is_non_positive WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sshort-1.1 () {
    mmux_sshort_is_non_negative 0
}
function predicates-is-non-negative-sshort-1.2 () {
    mmux_sshort_is_non_negative WW(mmux_sshort_MAX)
}
function predicates-is-non-negative-sshort-1.3 () {
    ! mmux_sshort_is_non_negative WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sshort-1.1 () {
    ! mmux_sshort_is_infinite WW(mmux_sshort_MAX)
}
function predicates-is-infinite-sshort-1.2 () {
    ! mmux_sshort_is_infinite WW(mmux_sshort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sshort-1.1 () {
    ! mmux_sshort_is_nan WW(mmux_sshort_MAX)
}
function predicates-is-nan-sshort-1.2 () {
    ! mmux_sshort_is_nan WW(mmux_sshort_MIN)
}


#### type variables: ushort

function predicates-is-zero-ushort-1.1 () {
    mmux_ushort_is_zero 0
}
function predicates-is-zero-ushort-1.2 () {
    ! mmux_ushort_is_zero WW(mmux_ushort_MAX)
}
function predicates-is-zero-ushort-1.3 () {
    mmux_ushort_is_zero WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ushort-1.1 () {
    ! mmux_ushort_is_positive 0
}
function predicates-is-positive-ushort-1.2 () {
    mmux_ushort_is_positive WW(mmux_ushort_MAX)
}
function predicates-is-positive-ushort-1.3 () {
    ! mmux_ushort_is_positive WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ushort-1.1 () {
    ! mmux_ushort_is_negative 0
}
function predicates-is-negative-ushort-1.2 () {
    ! mmux_ushort_is_negative WW(mmux_ushort_MAX)
}
function predicates-is-negative-ushort-1.3 () {
    ! mmux_ushort_is_negative WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ushort-1.1 () {
    mmux_ushort_is_non_positive 0
}
function predicates-is-non-positive-ushort-1.2 () {
    ! mmux_ushort_is_non_positive WW(mmux_ushort_MAX)
}
function predicates-is-non-positive-ushort-1.3 () {
    mmux_ushort_is_non_positive WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ushort-1.1 () {
    mmux_ushort_is_non_negative 0
}
function predicates-is-non-negative-ushort-1.2 () {
    mmux_ushort_is_non_negative WW(mmux_ushort_MAX)
}
function predicates-is-non-negative-ushort-1.3 () {
    mmux_ushort_is_non_negative WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ushort-1.1 () {
    ! mmux_ushort_is_infinite WW(mmux_ushort_MAX)
}
function predicates-is-infinite-ushort-1.2 () {
    ! mmux_ushort_is_infinite WW(mmux_ushort_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ushort-1.1 () {
    ! mmux_ushort_is_nan WW(mmux_ushort_MAX)
}
function predicates-is-nan-ushort-1.2 () {
    ! mmux_ushort_is_nan WW(mmux_ushort_MIN)
}


#### type variables: sint

function predicates-is-zero-sint-1.1 () {
    mmux_sint_is_zero 0
}
function predicates-is-zero-sint-1.2 () {
    ! mmux_sint_is_zero WW(mmux_sint_MAX)
}
function predicates-is-zero-sint-1.3 () {
    ! mmux_sint_is_zero WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint-1.1 () {
    ! mmux_sint_is_positive 0
}
function predicates-is-positive-sint-1.2 () {
    mmux_sint_is_positive WW(mmux_sint_MAX)
}
function predicates-is-positive-sint-1.3 () {
    ! mmux_sint_is_positive WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint-1.1 () {
    ! mmux_sint_is_negative 0
}
function predicates-is-negative-sint-1.2 () {
    ! mmux_sint_is_negative WW(mmux_sint_MAX)
}
function predicates-is-negative-sint-1.3 () {
    mmux_sint_is_negative WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint-1.1 () {
    mmux_sint_is_non_positive 0
}
function predicates-is-non-positive-sint-1.2 () {
    ! mmux_sint_is_non_positive WW(mmux_sint_MAX)
}
function predicates-is-non-positive-sint-1.3 () {
    mmux_sint_is_non_positive WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint-1.1 () {
    mmux_sint_is_non_negative 0
}
function predicates-is-non-negative-sint-1.2 () {
    mmux_sint_is_non_negative WW(mmux_sint_MAX)
}
function predicates-is-non-negative-sint-1.3 () {
    ! mmux_sint_is_non_negative WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint-1.1 () {
    ! mmux_sint_is_infinite WW(mmux_sint_MAX)
}
function predicates-is-infinite-sint-1.2 () {
    ! mmux_sint_is_infinite WW(mmux_sint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint-1.1 () {
    ! mmux_sint_is_nan WW(mmux_sint_MAX)
}
function predicates-is-nan-sint-1.2 () {
    ! mmux_sint_is_nan WW(mmux_sint_MIN)
}


#### type variables: uint

function predicates-is-zero-uint-1.1 () {
    mmux_uint_is_zero 0
}
function predicates-is-zero-uint-1.2 () {
    ! mmux_uint_is_zero WW(mmux_uint_MAX)
}
function predicates-is-zero-uint-1.3 () {
    mmux_uint_is_zero WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint-1.1 () {
    ! mmux_uint_is_positive 0
}
function predicates-is-positive-uint-1.2 () {
    mmux_uint_is_positive WW(mmux_uint_MAX)
}
function predicates-is-positive-uint-1.3 () {
    ! mmux_uint_is_positive WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint-1.1 () {
    ! mmux_uint_is_negative 0
}
function predicates-is-negative-uint-1.2 () {
    ! mmux_uint_is_negative WW(mmux_uint_MAX)
}
function predicates-is-negative-uint-1.3 () {
    ! mmux_uint_is_negative WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint-1.1 () {
    mmux_uint_is_non_positive 0
}
function predicates-is-non-positive-uint-1.2 () {
    ! mmux_uint_is_non_positive WW(mmux_uint_MAX)
}
function predicates-is-non-positive-uint-1.3 () {
    mmux_uint_is_non_positive WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint-1.1 () {
    mmux_uint_is_non_negative 0
}
function predicates-is-non-negative-uint-1.2 () {
    mmux_uint_is_non_negative WW(mmux_uint_MAX)
}
function predicates-is-non-negative-uint-1.3 () {
    mmux_uint_is_non_negative WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint-1.1 () {
    ! mmux_uint_is_infinite WW(mmux_uint_MAX)
}
function predicates-is-infinite-uint-1.2 () {
    ! mmux_uint_is_infinite WW(mmux_uint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint-1.1 () {
    ! mmux_uint_is_nan WW(mmux_uint_MAX)
}
function predicates-is-nan-uint-1.2 () {
    ! mmux_uint_is_nan WW(mmux_uint_MIN)
}


#### type variables: slong

function predicates-is-zero-slong-1.1 () {
    mmux_slong_is_zero 0
}
function predicates-is-zero-slong-1.2 () {
    ! mmux_slong_is_zero WW(mmux_slong_MAX)
}
function predicates-is-zero-slong-1.3 () {
    ! mmux_slong_is_zero WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-slong-1.1 () {
    ! mmux_slong_is_positive 0
}
function predicates-is-positive-slong-1.2 () {
    mmux_slong_is_positive WW(mmux_slong_MAX)
}
function predicates-is-positive-slong-1.3 () {
    ! mmux_slong_is_positive WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-slong-1.1 () {
    ! mmux_slong_is_negative 0
}
function predicates-is-negative-slong-1.2 () {
    ! mmux_slong_is_negative WW(mmux_slong_MAX)
}
function predicates-is-negative-slong-1.3 () {
    mmux_slong_is_negative WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-slong-1.1 () {
    mmux_slong_is_non_positive 0
}
function predicates-is-non-positive-slong-1.2 () {
    ! mmux_slong_is_non_positive WW(mmux_slong_MAX)
}
function predicates-is-non-positive-slong-1.3 () {
    mmux_slong_is_non_positive WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-slong-1.1 () {
    mmux_slong_is_non_negative 0
}
function predicates-is-non-negative-slong-1.2 () {
    mmux_slong_is_non_negative WW(mmux_slong_MAX)
}
function predicates-is-non-negative-slong-1.3 () {
    ! mmux_slong_is_non_negative WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-slong-1.1 () {
    ! mmux_slong_is_infinite WW(mmux_slong_MAX)
}
function predicates-is-infinite-slong-1.2 () {
    ! mmux_slong_is_infinite WW(mmux_slong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-slong-1.1 () {
    ! mmux_slong_is_nan WW(mmux_slong_MAX)
}
function predicates-is-nan-slong-1.2 () {
    ! mmux_slong_is_nan WW(mmux_slong_MIN)
}


#### type variables: ulong

function predicates-is-zero-ulong-1.1 () {
    mmux_ulong_is_zero 0
}
function predicates-is-zero-ulong-1.2 () {
    ! mmux_ulong_is_zero WW(mmux_ulong_MAX)
}
function predicates-is-zero-ulong-1.3 () {
    mmux_ulong_is_zero WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ulong-1.1 () {
    ! mmux_ulong_is_positive 0
}
function predicates-is-positive-ulong-1.2 () {
    mmux_ulong_is_positive WW(mmux_ulong_MAX)
}
function predicates-is-positive-ulong-1.3 () {
    ! mmux_ulong_is_positive WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ulong-1.1 () {
    ! mmux_ulong_is_negative 0
}
function predicates-is-negative-ulong-1.2 () {
    ! mmux_ulong_is_negative WW(mmux_ulong_MAX)
}
function predicates-is-negative-ulong-1.3 () {
    ! mmux_ulong_is_negative WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ulong-1.1 () {
    mmux_ulong_is_non_positive 0
}
function predicates-is-non-positive-ulong-1.2 () {
    ! mmux_ulong_is_non_positive WW(mmux_ulong_MAX)
}
function predicates-is-non-positive-ulong-1.3 () {
    mmux_ulong_is_non_positive WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ulong-1.1 () {
    mmux_ulong_is_non_negative 0
}
function predicates-is-non-negative-ulong-1.2 () {
    mmux_ulong_is_non_negative WW(mmux_ulong_MAX)
}
function predicates-is-non-negative-ulong-1.3 () {
    mmux_ulong_is_non_negative WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ulong-1.1 () {
    ! mmux_ulong_is_infinite WW(mmux_ulong_MAX)
}
function predicates-is-infinite-ulong-1.2 () {
    ! mmux_ulong_is_infinite WW(mmux_ulong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ulong-1.1 () {
    ! mmux_ulong_is_nan WW(mmux_ulong_MAX)
}
function predicates-is-nan-ulong-1.2 () {
    ! mmux_ulong_is_nan WW(mmux_ulong_MIN)
}


#### type variables: sllong

function predicates-is-zero-sllong-1.1 () {
    mmux_sllong_is_zero 0
}
function predicates-is-zero-sllong-1.2 () {
    ! mmux_sllong_is_zero WW(mmux_sllong_MAX)
}
function predicates-is-zero-sllong-1.3 () {
    ! mmux_sllong_is_zero WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sllong-1.1 () {
    ! mmux_sllong_is_positive 0
}
function predicates-is-positive-sllong-1.2 () {
    mmux_sllong_is_positive WW(mmux_sllong_MAX)
}
function predicates-is-positive-sllong-1.3 () {
    ! mmux_sllong_is_positive WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sllong-1.1 () {
    ! mmux_sllong_is_negative 0
}
function predicates-is-negative-sllong-1.2 () {
    ! mmux_sllong_is_negative WW(mmux_sllong_MAX)
}
function predicates-is-negative-sllong-1.3 () {
    mmux_sllong_is_negative WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sllong-1.1 () {
    mmux_sllong_is_non_positive 0
}
function predicates-is-non-positive-sllong-1.2 () {
    ! mmux_sllong_is_non_positive WW(mmux_sllong_MAX)
}
function predicates-is-non-positive-sllong-1.3 () {
    mmux_sllong_is_non_positive WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sllong-1.1 () {
    mmux_sllong_is_non_negative 0
}
function predicates-is-non-negative-sllong-1.2 () {
    mmux_sllong_is_non_negative WW(mmux_sllong_MAX)
}
function predicates-is-non-negative-sllong-1.3 () {
    ! mmux_sllong_is_non_negative WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sllong-1.1 () {
    ! mmux_sllong_is_infinite WW(mmux_sllong_MAX)
}
function predicates-is-infinite-sllong-1.2 () {
    ! mmux_sllong_is_infinite WW(mmux_sllong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sllong-1.1 () {
    ! mmux_sllong_is_nan WW(mmux_sllong_MAX)
}
function predicates-is-nan-sllong-1.2 () {
    ! mmux_sllong_is_nan WW(mmux_sllong_MIN)
}


#### type variables: ullong

function predicates-is-zero-ullong-1.1 () {
    mmux_ullong_is_zero 0
}
function predicates-is-zero-ullong-1.2 () {
    ! mmux_ullong_is_zero WW(mmux_ullong_MAX)
}
function predicates-is-zero-ullong-1.3 () {
    mmux_ullong_is_zero WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ullong-1.1 () {
    ! mmux_ullong_is_positive 0
}
function predicates-is-positive-ullong-1.2 () {
    mmux_ullong_is_positive WW(mmux_ullong_MAX)
}
function predicates-is-positive-ullong-1.3 () {
    ! mmux_ullong_is_positive WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ullong-1.1 () {
    ! mmux_ullong_is_negative 0
}
function predicates-is-negative-ullong-1.2 () {
    ! mmux_ullong_is_negative WW(mmux_ullong_MAX)
}
function predicates-is-negative-ullong-1.3 () {
    ! mmux_ullong_is_negative WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ullong-1.1 () {
    mmux_ullong_is_non_positive 0
}
function predicates-is-non-positive-ullong-1.2 () {
    ! mmux_ullong_is_non_positive WW(mmux_ullong_MAX)
}
function predicates-is-non-positive-ullong-1.3 () {
    mmux_ullong_is_non_positive WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ullong-1.1 () {
    mmux_ullong_is_non_negative 0
}
function predicates-is-non-negative-ullong-1.2 () {
    mmux_ullong_is_non_negative WW(mmux_ullong_MAX)
}
function predicates-is-non-negative-ullong-1.3 () {
    mmux_ullong_is_non_negative WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ullong-1.1 () {
    ! mmux_ullong_is_infinite WW(mmux_ullong_MAX)
}
function predicates-is-infinite-ullong-1.2 () {
    ! mmux_ullong_is_infinite WW(mmux_ullong_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ullong-1.1 () {
    ! mmux_ullong_is_nan WW(mmux_ullong_MAX)
}
function predicates-is-nan-ullong-1.2 () {
    ! mmux_ullong_is_nan WW(mmux_ullong_MIN)
}


#### type variables: sint8

function predicates-is-zero-sint8-1.1 () {
    mmux_sint8_is_zero 0
}
function predicates-is-zero-sint8-1.2 () {
    ! mmux_sint8_is_zero WW(mmux_sint8_MAX)
}
function predicates-is-zero-sint8-1.3 () {
    ! mmux_sint8_is_zero WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint8-1.1 () {
    ! mmux_sint8_is_positive 0
}
function predicates-is-positive-sint8-1.2 () {
    mmux_sint8_is_positive WW(mmux_sint8_MAX)
}
function predicates-is-positive-sint8-1.3 () {
    ! mmux_sint8_is_positive WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint8-1.1 () {
    ! mmux_sint8_is_negative 0
}
function predicates-is-negative-sint8-1.2 () {
    ! mmux_sint8_is_negative WW(mmux_sint8_MAX)
}
function predicates-is-negative-sint8-1.3 () {
    mmux_sint8_is_negative WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint8-1.1 () {
    mmux_sint8_is_non_positive 0
}
function predicates-is-non-positive-sint8-1.2 () {
    ! mmux_sint8_is_non_positive WW(mmux_sint8_MAX)
}
function predicates-is-non-positive-sint8-1.3 () {
    mmux_sint8_is_non_positive WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint8-1.1 () {
    mmux_sint8_is_non_negative 0
}
function predicates-is-non-negative-sint8-1.2 () {
    mmux_sint8_is_non_negative WW(mmux_sint8_MAX)
}
function predicates-is-non-negative-sint8-1.3 () {
    ! mmux_sint8_is_non_negative WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint8-1.1 () {
    ! mmux_sint8_is_infinite WW(mmux_sint8_MAX)
}
function predicates-is-infinite-sint8-1.2 () {
    ! mmux_sint8_is_infinite WW(mmux_sint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint8-1.1 () {
    ! mmux_sint8_is_nan WW(mmux_sint8_MAX)
}
function predicates-is-nan-sint8-1.2 () {
    ! mmux_sint8_is_nan WW(mmux_sint8_MIN)
}


#### type variables: uint8

function predicates-is-zero-uint8-1.1 () {
    mmux_uint8_is_zero 0
}
function predicates-is-zero-uint8-1.2 () {
    ! mmux_uint8_is_zero WW(mmux_uint8_MAX)
}
function predicates-is-zero-uint8-1.3 () {
    mmux_uint8_is_zero WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint8-1.1 () {
    ! mmux_uint8_is_positive 0
}
function predicates-is-positive-uint8-1.2 () {
    mmux_uint8_is_positive WW(mmux_uint8_MAX)
}
function predicates-is-positive-uint8-1.3 () {
    ! mmux_uint8_is_positive WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint8-1.1 () {
    ! mmux_uint8_is_negative 0
}
function predicates-is-negative-uint8-1.2 () {
    ! mmux_uint8_is_negative WW(mmux_uint8_MAX)
}
function predicates-is-negative-uint8-1.3 () {
    ! mmux_uint8_is_negative WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint8-1.1 () {
    mmux_uint8_is_non_positive 0
}
function predicates-is-non-positive-uint8-1.2 () {
    ! mmux_uint8_is_non_positive WW(mmux_uint8_MAX)
}
function predicates-is-non-positive-uint8-1.3 () {
    mmux_uint8_is_non_positive WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint8-1.1 () {
    mmux_uint8_is_non_negative 0
}
function predicates-is-non-negative-uint8-1.2 () {
    mmux_uint8_is_non_negative WW(mmux_uint8_MAX)
}
function predicates-is-non-negative-uint8-1.3 () {
    mmux_uint8_is_non_negative WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint8-1.1 () {
    ! mmux_uint8_is_infinite WW(mmux_uint8_MAX)
}
function predicates-is-infinite-uint8-1.2 () {
    ! mmux_uint8_is_infinite WW(mmux_uint8_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint8-1.1 () {
    ! mmux_uint8_is_nan WW(mmux_uint8_MAX)
}
function predicates-is-nan-uint8-1.2 () {
    ! mmux_uint8_is_nan WW(mmux_uint8_MIN)
}


#### type variables: sint16

function predicates-is-zero-sint16-1.1 () {
    mmux_sint16_is_zero 0
}
function predicates-is-zero-sint16-1.2 () {
    ! mmux_sint16_is_zero WW(mmux_sint16_MAX)
}
function predicates-is-zero-sint16-1.3 () {
    ! mmux_sint16_is_zero WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint16-1.1 () {
    ! mmux_sint16_is_positive 0
}
function predicates-is-positive-sint16-1.2 () {
    mmux_sint16_is_positive WW(mmux_sint16_MAX)
}
function predicates-is-positive-sint16-1.3 () {
    ! mmux_sint16_is_positive WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint16-1.1 () {
    ! mmux_sint16_is_negative 0
}
function predicates-is-negative-sint16-1.2 () {
    ! mmux_sint16_is_negative WW(mmux_sint16_MAX)
}
function predicates-is-negative-sint16-1.3 () {
    mmux_sint16_is_negative WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint16-1.1 () {
    mmux_sint16_is_non_positive 0
}
function predicates-is-non-positive-sint16-1.2 () {
    ! mmux_sint16_is_non_positive WW(mmux_sint16_MAX)
}
function predicates-is-non-positive-sint16-1.3 () {
    mmux_sint16_is_non_positive WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint16-1.1 () {
    mmux_sint16_is_non_negative 0
}
function predicates-is-non-negative-sint16-1.2 () {
    mmux_sint16_is_non_negative WW(mmux_sint16_MAX)
}
function predicates-is-non-negative-sint16-1.3 () {
    ! mmux_sint16_is_non_negative WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint16-1.1 () {
    ! mmux_sint16_is_infinite WW(mmux_sint16_MAX)
}
function predicates-is-infinite-sint16-1.2 () {
    ! mmux_sint16_is_infinite WW(mmux_sint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint16-1.1 () {
    ! mmux_sint16_is_nan WW(mmux_sint16_MAX)
}
function predicates-is-nan-sint16-1.2 () {
    ! mmux_sint16_is_nan WW(mmux_sint16_MIN)
}


#### type variables: uint16

function predicates-is-zero-uint16-1.1 () {
    mmux_uint16_is_zero 0
}
function predicates-is-zero-uint16-1.2 () {
    ! mmux_uint16_is_zero WW(mmux_uint16_MAX)
}
function predicates-is-zero-uint16-1.3 () {
    mmux_uint16_is_zero WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint16-1.1 () {
    ! mmux_uint16_is_positive 0
}
function predicates-is-positive-uint16-1.2 () {
    mmux_uint16_is_positive WW(mmux_uint16_MAX)
}
function predicates-is-positive-uint16-1.3 () {
    ! mmux_uint16_is_positive WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint16-1.1 () {
    ! mmux_uint16_is_negative 0
}
function predicates-is-negative-uint16-1.2 () {
    ! mmux_uint16_is_negative WW(mmux_uint16_MAX)
}
function predicates-is-negative-uint16-1.3 () {
    ! mmux_uint16_is_negative WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint16-1.1 () {
    mmux_uint16_is_non_positive 0
}
function predicates-is-non-positive-uint16-1.2 () {
    ! mmux_uint16_is_non_positive WW(mmux_uint16_MAX)
}
function predicates-is-non-positive-uint16-1.3 () {
    mmux_uint16_is_non_positive WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint16-1.1 () {
    mmux_uint16_is_non_negative 0
}
function predicates-is-non-negative-uint16-1.2 () {
    mmux_uint16_is_non_negative WW(mmux_uint16_MAX)
}
function predicates-is-non-negative-uint16-1.3 () {
    mmux_uint16_is_non_negative WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint16-1.1 () {
    ! mmux_uint16_is_infinite WW(mmux_uint16_MAX)
}
function predicates-is-infinite-uint16-1.2 () {
    ! mmux_uint16_is_infinite WW(mmux_uint16_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint16-1.1 () {
    ! mmux_uint16_is_nan WW(mmux_uint16_MAX)
}
function predicates-is-nan-uint16-1.2 () {
    ! mmux_uint16_is_nan WW(mmux_uint16_MIN)
}


#### type variables: sint32

function predicates-is-zero-sint32-1.1 () {
    mmux_sint32_is_zero 0
}
function predicates-is-zero-sint32-1.2 () {
    ! mmux_sint32_is_zero WW(mmux_sint32_MAX)
}
function predicates-is-zero-sint32-1.3 () {
    ! mmux_sint32_is_zero WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint32-1.1 () {
    ! mmux_sint32_is_positive 0
}
function predicates-is-positive-sint32-1.2 () {
    mmux_sint32_is_positive WW(mmux_sint32_MAX)
}
function predicates-is-positive-sint32-1.3 () {
    ! mmux_sint32_is_positive WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint32-1.1 () {
    ! mmux_sint32_is_negative 0
}
function predicates-is-negative-sint32-1.2 () {
    ! mmux_sint32_is_negative WW(mmux_sint32_MAX)
}
function predicates-is-negative-sint32-1.3 () {
    mmux_sint32_is_negative WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint32-1.1 () {
    mmux_sint32_is_non_positive 0
}
function predicates-is-non-positive-sint32-1.2 () {
    ! mmux_sint32_is_non_positive WW(mmux_sint32_MAX)
}
function predicates-is-non-positive-sint32-1.3 () {
    mmux_sint32_is_non_positive WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint32-1.1 () {
    mmux_sint32_is_non_negative 0
}
function predicates-is-non-negative-sint32-1.2 () {
    mmux_sint32_is_non_negative WW(mmux_sint32_MAX)
}
function predicates-is-non-negative-sint32-1.3 () {
    ! mmux_sint32_is_non_negative WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint32-1.1 () {
    ! mmux_sint32_is_infinite WW(mmux_sint32_MAX)
}
function predicates-is-infinite-sint32-1.2 () {
    ! mmux_sint32_is_infinite WW(mmux_sint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint32-1.1 () {
    ! mmux_sint32_is_nan WW(mmux_sint32_MAX)
}
function predicates-is-nan-sint32-1.2 () {
    ! mmux_sint32_is_nan WW(mmux_sint32_MIN)
}


#### type variables: uint32

function predicates-is-zero-uint32-1.1 () {
    mmux_uint32_is_zero 0
}
function predicates-is-zero-uint32-1.2 () {
    ! mmux_uint32_is_zero WW(mmux_uint32_MAX)
}
function predicates-is-zero-uint32-1.3 () {
    mmux_uint32_is_zero WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint32-1.1 () {
    ! mmux_uint32_is_positive 0
}
function predicates-is-positive-uint32-1.2 () {
    mmux_uint32_is_positive WW(mmux_uint32_MAX)
}
function predicates-is-positive-uint32-1.3 () {
    ! mmux_uint32_is_positive WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint32-1.1 () {
    ! mmux_uint32_is_negative 0
}
function predicates-is-negative-uint32-1.2 () {
    ! mmux_uint32_is_negative WW(mmux_uint32_MAX)
}
function predicates-is-negative-uint32-1.3 () {
    ! mmux_uint32_is_negative WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint32-1.1 () {
    mmux_uint32_is_non_positive 0
}
function predicates-is-non-positive-uint32-1.2 () {
    ! mmux_uint32_is_non_positive WW(mmux_uint32_MAX)
}
function predicates-is-non-positive-uint32-1.3 () {
    mmux_uint32_is_non_positive WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint32-1.1 () {
    mmux_uint32_is_non_negative 0
}
function predicates-is-non-negative-uint32-1.2 () {
    mmux_uint32_is_non_negative WW(mmux_uint32_MAX)
}
function predicates-is-non-negative-uint32-1.3 () {
    mmux_uint32_is_non_negative WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint32-1.1 () {
    ! mmux_uint32_is_infinite WW(mmux_uint32_MAX)
}
function predicates-is-infinite-uint32-1.2 () {
    ! mmux_uint32_is_infinite WW(mmux_uint32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint32-1.1 () {
    ! mmux_uint32_is_nan WW(mmux_uint32_MAX)
}
function predicates-is-nan-uint32-1.2 () {
    ! mmux_uint32_is_nan WW(mmux_uint32_MIN)
}


#### type variables: sint64

function predicates-is-zero-sint64-1.1 () {
    mmux_sint64_is_zero 0
}
function predicates-is-zero-sint64-1.2 () {
    ! mmux_sint64_is_zero WW(mmux_sint64_MAX)
}
function predicates-is-zero-sint64-1.3 () {
    ! mmux_sint64_is_zero WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint64-1.1 () {
    ! mmux_sint64_is_positive 0
}
function predicates-is-positive-sint64-1.2 () {
    mmux_sint64_is_positive WW(mmux_sint64_MAX)
}
function predicates-is-positive-sint64-1.3 () {
    ! mmux_sint64_is_positive WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint64-1.1 () {
    ! mmux_sint64_is_negative 0
}
function predicates-is-negative-sint64-1.2 () {
    ! mmux_sint64_is_negative WW(mmux_sint64_MAX)
}
function predicates-is-negative-sint64-1.3 () {
    mmux_sint64_is_negative WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint64-1.1 () {
    mmux_sint64_is_non_positive 0
}
function predicates-is-non-positive-sint64-1.2 () {
    ! mmux_sint64_is_non_positive WW(mmux_sint64_MAX)
}
function predicates-is-non-positive-sint64-1.3 () {
    mmux_sint64_is_non_positive WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint64-1.1 () {
    mmux_sint64_is_non_negative 0
}
function predicates-is-non-negative-sint64-1.2 () {
    mmux_sint64_is_non_negative WW(mmux_sint64_MAX)
}
function predicates-is-non-negative-sint64-1.3 () {
    ! mmux_sint64_is_non_negative WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint64-1.1 () {
    ! mmux_sint64_is_infinite WW(mmux_sint64_MAX)
}
function predicates-is-infinite-sint64-1.2 () {
    ! mmux_sint64_is_infinite WW(mmux_sint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint64-1.1 () {
    ! mmux_sint64_is_nan WW(mmux_sint64_MAX)
}
function predicates-is-nan-sint64-1.2 () {
    ! mmux_sint64_is_nan WW(mmux_sint64_MIN)
}


#### type variables: uint64

function predicates-is-zero-uint64-1.1 () {
    mmux_uint64_is_zero 0
}
function predicates-is-zero-uint64-1.2 () {
    ! mmux_uint64_is_zero WW(mmux_uint64_MAX)
}
function predicates-is-zero-uint64-1.3 () {
    mmux_uint64_is_zero WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint64-1.1 () {
    ! mmux_uint64_is_positive 0
}
function predicates-is-positive-uint64-1.2 () {
    mmux_uint64_is_positive WW(mmux_uint64_MAX)
}
function predicates-is-positive-uint64-1.3 () {
    ! mmux_uint64_is_positive WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint64-1.1 () {
    ! mmux_uint64_is_negative 0
}
function predicates-is-negative-uint64-1.2 () {
    ! mmux_uint64_is_negative WW(mmux_uint64_MAX)
}
function predicates-is-negative-uint64-1.3 () {
    ! mmux_uint64_is_negative WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint64-1.1 () {
    mmux_uint64_is_non_positive 0
}
function predicates-is-non-positive-uint64-1.2 () {
    ! mmux_uint64_is_non_positive WW(mmux_uint64_MAX)
}
function predicates-is-non-positive-uint64-1.3 () {
    mmux_uint64_is_non_positive WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint64-1.1 () {
    mmux_uint64_is_non_negative 0
}
function predicates-is-non-negative-uint64-1.2 () {
    mmux_uint64_is_non_negative WW(mmux_uint64_MAX)
}
function predicates-is-non-negative-uint64-1.3 () {
    mmux_uint64_is_non_negative WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint64-1.1 () {
    ! mmux_uint64_is_infinite WW(mmux_uint64_MAX)
}
function predicates-is-infinite-uint64-1.2 () {
    ! mmux_uint64_is_infinite WW(mmux_uint64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint64-1.1 () {
    ! mmux_uint64_is_nan WW(mmux_uint64_MAX)
}
function predicates-is-nan-uint64-1.2 () {
    ! mmux_uint64_is_nan WW(mmux_uint64_MIN)
}


#### type variables: sintmax

function predicates-is-zero-sintmax-1.1 () {
    mmux_sintmax_is_zero 0
}
function predicates-is-zero-sintmax-1.2 () {
    ! mmux_sintmax_is_zero WW(mmux_sintmax_MAX)
}
function predicates-is-zero-sintmax-1.3 () {
    ! mmux_sintmax_is_zero WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sintmax-1.1 () {
    ! mmux_sintmax_is_positive 0
}
function predicates-is-positive-sintmax-1.2 () {
    mmux_sintmax_is_positive WW(mmux_sintmax_MAX)
}
function predicates-is-positive-sintmax-1.3 () {
    ! mmux_sintmax_is_positive WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sintmax-1.1 () {
    ! mmux_sintmax_is_negative 0
}
function predicates-is-negative-sintmax-1.2 () {
    ! mmux_sintmax_is_negative WW(mmux_sintmax_MAX)
}
function predicates-is-negative-sintmax-1.3 () {
    mmux_sintmax_is_negative WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sintmax-1.1 () {
    mmux_sintmax_is_non_positive 0
}
function predicates-is-non-positive-sintmax-1.2 () {
    ! mmux_sintmax_is_non_positive WW(mmux_sintmax_MAX)
}
function predicates-is-non-positive-sintmax-1.3 () {
    mmux_sintmax_is_non_positive WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sintmax-1.1 () {
    mmux_sintmax_is_non_negative 0
}
function predicates-is-non-negative-sintmax-1.2 () {
    mmux_sintmax_is_non_negative WW(mmux_sintmax_MAX)
}
function predicates-is-non-negative-sintmax-1.3 () {
    ! mmux_sintmax_is_non_negative WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sintmax-1.1 () {
    ! mmux_sintmax_is_infinite WW(mmux_sintmax_MAX)
}
function predicates-is-infinite-sintmax-1.2 () {
    ! mmux_sintmax_is_infinite WW(mmux_sintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sintmax-1.1 () {
    ! mmux_sintmax_is_nan WW(mmux_sintmax_MAX)
}
function predicates-is-nan-sintmax-1.2 () {
    ! mmux_sintmax_is_nan WW(mmux_sintmax_MIN)
}


#### type variables: uintmax

function predicates-is-zero-uintmax-1.1 () {
    mmux_uintmax_is_zero 0
}
function predicates-is-zero-uintmax-1.2 () {
    ! mmux_uintmax_is_zero WW(mmux_uintmax_MAX)
}
function predicates-is-zero-uintmax-1.3 () {
    mmux_uintmax_is_zero WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uintmax-1.1 () {
    ! mmux_uintmax_is_positive 0
}
function predicates-is-positive-uintmax-1.2 () {
    mmux_uintmax_is_positive WW(mmux_uintmax_MAX)
}
function predicates-is-positive-uintmax-1.3 () {
    ! mmux_uintmax_is_positive WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uintmax-1.1 () {
    ! mmux_uintmax_is_negative 0
}
function predicates-is-negative-uintmax-1.2 () {
    ! mmux_uintmax_is_negative WW(mmux_uintmax_MAX)
}
function predicates-is-negative-uintmax-1.3 () {
    ! mmux_uintmax_is_negative WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uintmax-1.1 () {
    mmux_uintmax_is_non_positive 0
}
function predicates-is-non-positive-uintmax-1.2 () {
    ! mmux_uintmax_is_non_positive WW(mmux_uintmax_MAX)
}
function predicates-is-non-positive-uintmax-1.3 () {
    mmux_uintmax_is_non_positive WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uintmax-1.1 () {
    mmux_uintmax_is_non_negative 0
}
function predicates-is-non-negative-uintmax-1.2 () {
    mmux_uintmax_is_non_negative WW(mmux_uintmax_MAX)
}
function predicates-is-non-negative-uintmax-1.3 () {
    mmux_uintmax_is_non_negative WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uintmax-1.1 () {
    ! mmux_uintmax_is_infinite WW(mmux_uintmax_MAX)
}
function predicates-is-infinite-uintmax-1.2 () {
    ! mmux_uintmax_is_infinite WW(mmux_uintmax_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uintmax-1.1 () {
    ! mmux_uintmax_is_nan WW(mmux_uintmax_MAX)
}
function predicates-is-nan-uintmax-1.2 () {
    ! mmux_uintmax_is_nan WW(mmux_uintmax_MIN)
}


#### type variables: sintptr

function predicates-is-zero-sintptr-1.1 () {
    mmux_sintptr_is_zero 0
}
function predicates-is-zero-sintptr-1.2 () {
    ! mmux_sintptr_is_zero WW(mmux_sintptr_MAX)
}
function predicates-is-zero-sintptr-1.3 () {
    ! mmux_sintptr_is_zero WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sintptr-1.1 () {
    ! mmux_sintptr_is_positive 0
}
function predicates-is-positive-sintptr-1.2 () {
    mmux_sintptr_is_positive WW(mmux_sintptr_MAX)
}
function predicates-is-positive-sintptr-1.3 () {
    ! mmux_sintptr_is_positive WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sintptr-1.1 () {
    ! mmux_sintptr_is_negative 0
}
function predicates-is-negative-sintptr-1.2 () {
    ! mmux_sintptr_is_negative WW(mmux_sintptr_MAX)
}
function predicates-is-negative-sintptr-1.3 () {
    mmux_sintptr_is_negative WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sintptr-1.1 () {
    mmux_sintptr_is_non_positive 0
}
function predicates-is-non-positive-sintptr-1.2 () {
    ! mmux_sintptr_is_non_positive WW(mmux_sintptr_MAX)
}
function predicates-is-non-positive-sintptr-1.3 () {
    mmux_sintptr_is_non_positive WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sintptr-1.1 () {
    mmux_sintptr_is_non_negative 0
}
function predicates-is-non-negative-sintptr-1.2 () {
    mmux_sintptr_is_non_negative WW(mmux_sintptr_MAX)
}
function predicates-is-non-negative-sintptr-1.3 () {
    ! mmux_sintptr_is_non_negative WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sintptr-1.1 () {
    ! mmux_sintptr_is_infinite WW(mmux_sintptr_MAX)
}
function predicates-is-infinite-sintptr-1.2 () {
    ! mmux_sintptr_is_infinite WW(mmux_sintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sintptr-1.1 () {
    ! mmux_sintptr_is_nan WW(mmux_sintptr_MAX)
}
function predicates-is-nan-sintptr-1.2 () {
    ! mmux_sintptr_is_nan WW(mmux_sintptr_MIN)
}


#### type variables: uintptr

function predicates-is-zero-uintptr-1.1 () {
    mmux_uintptr_is_zero 0
}
function predicates-is-zero-uintptr-1.2 () {
    ! mmux_uintptr_is_zero WW(mmux_uintptr_MAX)
}
function predicates-is-zero-uintptr-1.3 () {
    mmux_uintptr_is_zero WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uintptr-1.1 () {
    ! mmux_uintptr_is_positive 0
}
function predicates-is-positive-uintptr-1.2 () {
    mmux_uintptr_is_positive WW(mmux_uintptr_MAX)
}
function predicates-is-positive-uintptr-1.3 () {
    ! mmux_uintptr_is_positive WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uintptr-1.1 () {
    ! mmux_uintptr_is_negative 0
}
function predicates-is-negative-uintptr-1.2 () {
    ! mmux_uintptr_is_negative WW(mmux_uintptr_MAX)
}
function predicates-is-negative-uintptr-1.3 () {
    ! mmux_uintptr_is_negative WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uintptr-1.1 () {
    mmux_uintptr_is_non_positive 0
}
function predicates-is-non-positive-uintptr-1.2 () {
    ! mmux_uintptr_is_non_positive WW(mmux_uintptr_MAX)
}
function predicates-is-non-positive-uintptr-1.3 () {
    mmux_uintptr_is_non_positive WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uintptr-1.1 () {
    mmux_uintptr_is_non_negative 0
}
function predicates-is-non-negative-uintptr-1.2 () {
    mmux_uintptr_is_non_negative WW(mmux_uintptr_MAX)
}
function predicates-is-non-negative-uintptr-1.3 () {
    mmux_uintptr_is_non_negative WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uintptr-1.1 () {
    ! mmux_uintptr_is_infinite WW(mmux_uintptr_MAX)
}
function predicates-is-infinite-uintptr-1.2 () {
    ! mmux_uintptr_is_infinite WW(mmux_uintptr_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uintptr-1.1 () {
    ! mmux_uintptr_is_nan WW(mmux_uintptr_MAX)
}
function predicates-is-nan-uintptr-1.2 () {
    ! mmux_uintptr_is_nan WW(mmux_uintptr_MIN)
}


#### type variables: ptrdiff

function predicates-is-zero-ptrdiff-1.1 () {
    mmux_ptrdiff_is_zero 0
}
function predicates-is-zero-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_zero WW(mmux_ptrdiff_MAX)
}
function predicates-is-zero-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_zero WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_positive 0
}
function predicates-is-positive-ptrdiff-1.2 () {
    mmux_ptrdiff_is_positive WW(mmux_ptrdiff_MAX)
}
function predicates-is-positive-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_positive WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_negative 0
}
function predicates-is-negative-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_negative WW(mmux_ptrdiff_MAX)
}
function predicates-is-negative-ptrdiff-1.3 () {
    mmux_ptrdiff_is_negative WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ptrdiff-1.1 () {
    mmux_ptrdiff_is_non_positive 0
}
function predicates-is-non-positive-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_non_positive WW(mmux_ptrdiff_MAX)
}
function predicates-is-non-positive-ptrdiff-1.3 () {
    mmux_ptrdiff_is_non_positive WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ptrdiff-1.1 () {
    mmux_ptrdiff_is_non_negative 0
}
function predicates-is-non-negative-ptrdiff-1.2 () {
    mmux_ptrdiff_is_non_negative WW(mmux_ptrdiff_MAX)
}
function predicates-is-non-negative-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_non_negative WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_infinite WW(mmux_ptrdiff_MAX)
}
function predicates-is-infinite-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_infinite WW(mmux_ptrdiff_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_nan WW(mmux_ptrdiff_MAX)
}
function predicates-is-nan-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_nan WW(mmux_ptrdiff_MIN)
}


#### type variables: off

function predicates-is-zero-off-1.1 () {
    mmux_off_is_zero 0
}
function predicates-is-zero-off-1.2 () {
    ! mmux_off_is_zero WW(mmux_off_MAX)
}
function predicates-is-zero-off-1.3 () {
    ! mmux_off_is_zero WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-off-1.1 () {
    ! mmux_off_is_positive 0
}
function predicates-is-positive-off-1.2 () {
    mmux_off_is_positive WW(mmux_off_MAX)
}
function predicates-is-positive-off-1.3 () {
    ! mmux_off_is_positive WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-off-1.1 () {
    ! mmux_off_is_negative 0
}
function predicates-is-negative-off-1.2 () {
    ! mmux_off_is_negative WW(mmux_off_MAX)
}
function predicates-is-negative-off-1.3 () {
    mmux_off_is_negative WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-off-1.1 () {
    mmux_off_is_non_positive 0
}
function predicates-is-non-positive-off-1.2 () {
    ! mmux_off_is_non_positive WW(mmux_off_MAX)
}
function predicates-is-non-positive-off-1.3 () {
    mmux_off_is_non_positive WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-off-1.1 () {
    mmux_off_is_non_negative 0
}
function predicates-is-non-negative-off-1.2 () {
    mmux_off_is_non_negative WW(mmux_off_MAX)
}
function predicates-is-non-negative-off-1.3 () {
    ! mmux_off_is_non_negative WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-off-1.1 () {
    ! mmux_off_is_infinite WW(mmux_off_MAX)
}
function predicates-is-infinite-off-1.2 () {
    ! mmux_off_is_infinite WW(mmux_off_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-off-1.1 () {
    ! mmux_off_is_nan WW(mmux_off_MAX)
}
function predicates-is-nan-off-1.2 () {
    ! mmux_off_is_nan WW(mmux_off_MIN)
}


#### type variables: pid

function predicates-is-zero-pid-1.1 () {
    mmux_pid_is_zero 0
}
function predicates-is-zero-pid-1.2 () {
    ! mmux_pid_is_zero WW(mmux_pid_MAX)
}
function predicates-is-zero-pid-1.3 () {
    ! mmux_pid_is_zero WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-pid-1.1 () {
    ! mmux_pid_is_positive 0
}
function predicates-is-positive-pid-1.2 () {
    mmux_pid_is_positive WW(mmux_pid_MAX)
}
function predicates-is-positive-pid-1.3 () {
    ! mmux_pid_is_positive WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-pid-1.1 () {
    ! mmux_pid_is_negative 0
}
function predicates-is-negative-pid-1.2 () {
    ! mmux_pid_is_negative WW(mmux_pid_MAX)
}
function predicates-is-negative-pid-1.3 () {
    mmux_pid_is_negative WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-pid-1.1 () {
    mmux_pid_is_non_positive 0
}
function predicates-is-non-positive-pid-1.2 () {
    ! mmux_pid_is_non_positive WW(mmux_pid_MAX)
}
function predicates-is-non-positive-pid-1.3 () {
    mmux_pid_is_non_positive WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-pid-1.1 () {
    mmux_pid_is_non_negative 0
}
function predicates-is-non-negative-pid-1.2 () {
    mmux_pid_is_non_negative WW(mmux_pid_MAX)
}
function predicates-is-non-negative-pid-1.3 () {
    ! mmux_pid_is_non_negative WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-pid-1.1 () {
    ! mmux_pid_is_infinite WW(mmux_pid_MAX)
}
function predicates-is-infinite-pid-1.2 () {
    ! mmux_pid_is_infinite WW(mmux_pid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-pid-1.1 () {
    ! mmux_pid_is_nan WW(mmux_pid_MAX)
}
function predicates-is-nan-pid-1.2 () {
    ! mmux_pid_is_nan WW(mmux_pid_MIN)
}


#### type variables: uid

function predicates-is-zero-uid-1.1 () {
    mmux_uid_is_zero 0
}
function predicates-is-zero-uid-1.2 () {
    ! mmux_uid_is_zero WW(mmux_uid_MAX)
}
function predicates-is-zero-uid-1.3 () {
    mmux_uid_is_zero WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uid-1.1 () {
    ! mmux_uid_is_positive 0
}
function predicates-is-positive-uid-1.2 () {
    mmux_uid_is_positive WW(mmux_uid_MAX)
}
function predicates-is-positive-uid-1.3 () {
    ! mmux_uid_is_positive WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uid-1.1 () {
    ! mmux_uid_is_negative 0
}
function predicates-is-negative-uid-1.2 () {
    ! mmux_uid_is_negative WW(mmux_uid_MAX)
}
function predicates-is-negative-uid-1.3 () {
    ! mmux_uid_is_negative WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uid-1.1 () {
    mmux_uid_is_non_positive 0
}
function predicates-is-non-positive-uid-1.2 () {
    ! mmux_uid_is_non_positive WW(mmux_uid_MAX)
}
function predicates-is-non-positive-uid-1.3 () {
    mmux_uid_is_non_positive WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uid-1.1 () {
    mmux_uid_is_non_negative 0
}
function predicates-is-non-negative-uid-1.2 () {
    mmux_uid_is_non_negative WW(mmux_uid_MAX)
}
function predicates-is-non-negative-uid-1.3 () {
    mmux_uid_is_non_negative WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uid-1.1 () {
    ! mmux_uid_is_infinite WW(mmux_uid_MAX)
}
function predicates-is-infinite-uid-1.2 () {
    ! mmux_uid_is_infinite WW(mmux_uid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uid-1.1 () {
    ! mmux_uid_is_nan WW(mmux_uid_MAX)
}
function predicates-is-nan-uid-1.2 () {
    ! mmux_uid_is_nan WW(mmux_uid_MIN)
}


#### type variables: gid

function predicates-is-zero-gid-1.1 () {
    mmux_gid_is_zero 0
}
function predicates-is-zero-gid-1.2 () {
    ! mmux_gid_is_zero WW(mmux_gid_MAX)
}
function predicates-is-zero-gid-1.3 () {
    mmux_gid_is_zero WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-gid-1.1 () {
    ! mmux_gid_is_positive 0
}
function predicates-is-positive-gid-1.2 () {
    mmux_gid_is_positive WW(mmux_gid_MAX)
}
function predicates-is-positive-gid-1.3 () {
    ! mmux_gid_is_positive WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-gid-1.1 () {
    ! mmux_gid_is_negative 0
}
function predicates-is-negative-gid-1.2 () {
    ! mmux_gid_is_negative WW(mmux_gid_MAX)
}
function predicates-is-negative-gid-1.3 () {
    ! mmux_gid_is_negative WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-gid-1.1 () {
    mmux_gid_is_non_positive 0
}
function predicates-is-non-positive-gid-1.2 () {
    ! mmux_gid_is_non_positive WW(mmux_gid_MAX)
}
function predicates-is-non-positive-gid-1.3 () {
    mmux_gid_is_non_positive WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-gid-1.1 () {
    mmux_gid_is_non_negative 0
}
function predicates-is-non-negative-gid-1.2 () {
    mmux_gid_is_non_negative WW(mmux_gid_MAX)
}
function predicates-is-non-negative-gid-1.3 () {
    mmux_gid_is_non_negative WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-gid-1.1 () {
    ! mmux_gid_is_infinite WW(mmux_gid_MAX)
}
function predicates-is-infinite-gid-1.2 () {
    ! mmux_gid_is_infinite WW(mmux_gid_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-gid-1.1 () {
    ! mmux_gid_is_nan WW(mmux_gid_MAX)
}
function predicates-is-nan-gid-1.2 () {
    ! mmux_gid_is_nan WW(mmux_gid_MIN)
}


#### type variables: wchar

function predicates-is-zero-wchar-1.1 () {
    mmux_wchar_is_zero 0
}
function predicates-is-zero-wchar-1.2 () {
    ! mmux_wchar_is_zero WW(mmux_wchar_MAX)
}
function predicates-is-zero-wchar-1.3 () {
    ! mmux_wchar_is_zero WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-wchar-1.1 () {
    ! mmux_wchar_is_positive 0
}
function predicates-is-positive-wchar-1.2 () {
    mmux_wchar_is_positive WW(mmux_wchar_MAX)
}
function predicates-is-positive-wchar-1.3 () {
    ! mmux_wchar_is_positive WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-wchar-1.1 () {
    ! mmux_wchar_is_negative 0
}
function predicates-is-negative-wchar-1.2 () {
    ! mmux_wchar_is_negative WW(mmux_wchar_MAX)
}
function predicates-is-negative-wchar-1.3 () {
    mmux_wchar_is_negative WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-wchar-1.1 () {
    mmux_wchar_is_non_positive 0
}
function predicates-is-non-positive-wchar-1.2 () {
    ! mmux_wchar_is_non_positive WW(mmux_wchar_MAX)
}
function predicates-is-non-positive-wchar-1.3 () {
    mmux_wchar_is_non_positive WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-wchar-1.1 () {
    mmux_wchar_is_non_negative 0
}
function predicates-is-non-negative-wchar-1.2 () {
    mmux_wchar_is_non_negative WW(mmux_wchar_MAX)
}
function predicates-is-non-negative-wchar-1.3 () {
    ! mmux_wchar_is_non_negative WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-wchar-1.1 () {
    ! mmux_wchar_is_infinite WW(mmux_wchar_MAX)
}
function predicates-is-infinite-wchar-1.2 () {
    ! mmux_wchar_is_infinite WW(mmux_wchar_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-wchar-1.1 () {
    ! mmux_wchar_is_nan WW(mmux_wchar_MAX)
}
function predicates-is-nan-wchar-1.2 () {
    ! mmux_wchar_is_nan WW(mmux_wchar_MIN)
}


#### type variables: wint

function predicates-is-zero-wint-1.1 () {
    mmux_wint_is_zero 0
}
function predicates-is-zero-wint-1.2 () {
    ! mmux_wint_is_zero WW(mmux_wint_MAX)
}
function predicates-is-zero-wint-1.3 () {
    mmux_wint_is_zero WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-positive-wint-1.1 () {
    ! mmux_wint_is_positive 0
}
function predicates-is-positive-wint-1.2 () {
    mmux_wint_is_positive WW(mmux_wint_MAX)
}
function predicates-is-positive-wint-1.3 () {
    ! mmux_wint_is_positive WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-negative-wint-1.1 () {
    ! mmux_wint_is_negative 0
}
function predicates-is-negative-wint-1.2 () {
    ! mmux_wint_is_negative WW(mmux_wint_MAX)
}
function predicates-is-negative-wint-1.3 () {
    ! mmux_wint_is_negative WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-wint-1.1 () {
    mmux_wint_is_non_positive 0
}
function predicates-is-non-positive-wint-1.2 () {
    ! mmux_wint_is_non_positive WW(mmux_wint_MAX)
}
function predicates-is-non-positive-wint-1.3 () {
    mmux_wint_is_non_positive WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-wint-1.1 () {
    mmux_wint_is_non_negative 0
}
function predicates-is-non-negative-wint-1.2 () {
    mmux_wint_is_non_negative WW(mmux_wint_MAX)
}
function predicates-is-non-negative-wint-1.3 () {
    mmux_wint_is_non_negative WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-wint-1.1 () {
    ! mmux_wint_is_infinite WW(mmux_wint_MAX)
}
function predicates-is-infinite-wint-1.2 () {
    ! mmux_wint_is_infinite WW(mmux_wint_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-nan-wint-1.1 () {
    ! mmux_wint_is_nan WW(mmux_wint_MAX)
}
function predicates-is-nan-wint-1.2 () {
    ! mmux_wint_is_nan WW(mmux_wint_MIN)
}


#### type variables: float

function predicates-is-zero-float-1.1 () {
    mmux_float_is_zero 0
}
function predicates-is-zero-float-1.2 () {
    ! mmux_float_is_zero WW(mmux_float_MAX)
}
function predicates-is-zero-float-1.3 () {
    ! mmux_float_is_zero WW(mmux_float_MIN)
}
function predicates-is-zero-float-1.4 () {
    mmux_float_is_zero +0.0
}
function predicates-is-zero-float-1.5 () {
    mmux_float_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float-1.1 () {
    mmux_float_is_positive 0
}
function predicates-is-positive-float-1.2 () {
    mmux_float_is_positive WW(mmux_float_MAX)
}
function predicates-is-positive-float-1.3 () {
    ! mmux_float_is_positive WW(mmux_float_MIN)
}
function predicates-is-positive-float-1.4 () {
    mmux_float_is_positive +0.0
}
function predicates-is-positive-float-1.4 () {
    ! mmux_float_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float-1.1 () {
    ! mmux_float_is_negative 0
}
function predicates-is-negative-float-1.2 () {
    ! mmux_float_is_negative WW(mmux_float_MAX)
}
function predicates-is-negative-float-1.3 () {
    mmux_float_is_negative WW(mmux_float_MIN)
}
function predicates-is-negative-float-1.4 () {
    ! mmux_float_is_negative +0.0
}
function predicates-is-negative-float-1.5 () {
    mmux_float_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float-1.1 () {
    mmux_float_is_non_positive 0
}
function predicates-is-non-positive-float-1.2 () {
    ! mmux_float_is_non_positive WW(mmux_float_MAX)
}
function predicates-is-non-positive-float-1.3 () {
    mmux_float_is_non_positive WW(mmux_float_MIN)
}
function predicates-is-non-positive-float-1.4 () {
    mmux_float_is_non_positive +0.0
}
function predicates-is-non-positive-float-1.5 () {
    mmux_float_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float-1.1 () {
    mmux_float_is_non_negative 0
}
function predicates-is-non-negative-float-1.2 () {
    mmux_float_is_non_negative WW(mmux_float_MAX)
}
function predicates-is-non-negative-float-1.3 () {
    ! mmux_float_is_non_negative WW(mmux_float_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float-1.1 () {
    ! mmux_float_is_infinite WW(mmux_float_MAX)
}
function predicates-is-infinite-float-1.2 () {
    ! mmux_float_is_infinite WW(mmux_float_MIN)
}
function predicates-is-infinite-float-1.3 () {
    mmux_float_is_infinite '+inf'
}
function predicates-is-infinite-float-1.4 () {
    mmux_float_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float-1.1 () {
    ! mmux_float_is_nan WW(mmux_float_MAX)
}
function predicates-is-nan-float-1.2 () {
    ! mmux_float_is_nan WW(mmux_float_MIN)
}
function predicates-is-nan-float-1.3 () {
    mmux_float_is_nan 'nan'
}
function predicates-is-nan-float-1.4 () {
    mmux_float_is_nan '+nan'
}
function predicates-is-nan-float-1.5 () {
    mmux_float_is_nan '-nan'
}
function predicates-is-nan-float-1.6 () {
    mmux_float_is_nan '+nan.0'
}
function predicates-is-nan-float-1.7 () {
    mmux_float_is_nan '-nan.0'
}


#### type variables: double

function predicates-is-zero-double-1.1 () {
    mmux_double_is_zero 0
}
function predicates-is-zero-double-1.2 () {
    ! mmux_double_is_zero WW(mmux_double_MAX)
}
function predicates-is-zero-double-1.3 () {
    ! mmux_double_is_zero WW(mmux_double_MIN)
}
function predicates-is-zero-double-1.4 () {
    mmux_double_is_zero +0.0
}
function predicates-is-zero-double-1.5 () {
    mmux_double_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-double-1.1 () {
    mmux_double_is_positive 0
}
function predicates-is-positive-double-1.2 () {
    mmux_double_is_positive WW(mmux_double_MAX)
}
function predicates-is-positive-double-1.3 () {
    ! mmux_double_is_positive WW(mmux_double_MIN)
}
function predicates-is-positive-double-1.4 () {
    mmux_double_is_positive +0.0
}
function predicates-is-positive-double-1.4 () {
    ! mmux_double_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-double-1.1 () {
    ! mmux_double_is_negative 0
}
function predicates-is-negative-double-1.2 () {
    ! mmux_double_is_negative WW(mmux_double_MAX)
}
function predicates-is-negative-double-1.3 () {
    mmux_double_is_negative WW(mmux_double_MIN)
}
function predicates-is-negative-double-1.4 () {
    ! mmux_double_is_negative +0.0
}
function predicates-is-negative-double-1.5 () {
    mmux_double_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-double-1.1 () {
    mmux_double_is_non_positive 0
}
function predicates-is-non-positive-double-1.2 () {
    ! mmux_double_is_non_positive WW(mmux_double_MAX)
}
function predicates-is-non-positive-double-1.3 () {
    mmux_double_is_non_positive WW(mmux_double_MIN)
}
function predicates-is-non-positive-double-1.4 () {
    mmux_double_is_non_positive +0.0
}
function predicates-is-non-positive-double-1.5 () {
    mmux_double_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-double-1.1 () {
    mmux_double_is_non_negative 0
}
function predicates-is-non-negative-double-1.2 () {
    mmux_double_is_non_negative WW(mmux_double_MAX)
}
function predicates-is-non-negative-double-1.3 () {
    ! mmux_double_is_non_negative WW(mmux_double_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-double-1.1 () {
    ! mmux_double_is_infinite WW(mmux_double_MAX)
}
function predicates-is-infinite-double-1.2 () {
    ! mmux_double_is_infinite WW(mmux_double_MIN)
}
function predicates-is-infinite-double-1.3 () {
    mmux_double_is_infinite '+inf'
}
function predicates-is-infinite-double-1.4 () {
    mmux_double_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-double-1.1 () {
    ! mmux_double_is_nan WW(mmux_double_MAX)
}
function predicates-is-nan-double-1.2 () {
    ! mmux_double_is_nan WW(mmux_double_MIN)
}
function predicates-is-nan-double-1.3 () {
    mmux_double_is_nan 'nan'
}
function predicates-is-nan-double-1.4 () {
    mmux_double_is_nan '+nan'
}
function predicates-is-nan-double-1.5 () {
    mmux_double_is_nan '-nan'
}
function predicates-is-nan-double-1.6 () {
    mmux_double_is_nan '+nan.0'
}
function predicates-is-nan-double-1.7 () {
    mmux_double_is_nan '-nan.0'
}


#### type variables: ldouble

function predicates-is-zero-ldouble-1.1 () {
    mmux_ldouble_is_zero 0
}
function predicates-is-zero-ldouble-1.2 () {
    ! mmux_ldouble_is_zero WW(mmux_ldouble_MAX)
}
function predicates-is-zero-ldouble-1.3 () {
    ! mmux_ldouble_is_zero WW(mmux_ldouble_MIN)
}
function predicates-is-zero-ldouble-1.4 () {
    mmux_ldouble_is_zero +0.0
}
function predicates-is-zero-ldouble-1.5 () {
    mmux_ldouble_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-ldouble-1.1 () {
    mmux_ldouble_is_positive 0
}
function predicates-is-positive-ldouble-1.2 () {
    mmux_ldouble_is_positive WW(mmux_ldouble_MAX)
}
function predicates-is-positive-ldouble-1.3 () {
    ! mmux_ldouble_is_positive WW(mmux_ldouble_MIN)
}
function predicates-is-positive-ldouble-1.4 () {
    mmux_ldouble_is_positive +0.0
}
function predicates-is-positive-ldouble-1.4 () {
    ! mmux_ldouble_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-ldouble-1.1 () {
    ! mmux_ldouble_is_negative 0
}
function predicates-is-negative-ldouble-1.2 () {
    ! mmux_ldouble_is_negative WW(mmux_ldouble_MAX)
}
function predicates-is-negative-ldouble-1.3 () {
    mmux_ldouble_is_negative WW(mmux_ldouble_MIN)
}
function predicates-is-negative-ldouble-1.4 () {
    ! mmux_ldouble_is_negative +0.0
}
function predicates-is-negative-ldouble-1.5 () {
    mmux_ldouble_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ldouble-1.1 () {
    mmux_ldouble_is_non_positive 0
}
function predicates-is-non-positive-ldouble-1.2 () {
    ! mmux_ldouble_is_non_positive WW(mmux_ldouble_MAX)
}
function predicates-is-non-positive-ldouble-1.3 () {
    mmux_ldouble_is_non_positive WW(mmux_ldouble_MIN)
}
function predicates-is-non-positive-ldouble-1.4 () {
    mmux_ldouble_is_non_positive +0.0
}
function predicates-is-non-positive-ldouble-1.5 () {
    mmux_ldouble_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ldouble-1.1 () {
    mmux_ldouble_is_non_negative 0
}
function predicates-is-non-negative-ldouble-1.2 () {
    mmux_ldouble_is_non_negative WW(mmux_ldouble_MAX)
}
function predicates-is-non-negative-ldouble-1.3 () {
    ! mmux_ldouble_is_non_negative WW(mmux_ldouble_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ldouble-1.1 () {
    ! mmux_ldouble_is_infinite WW(mmux_ldouble_MAX)
}
function predicates-is-infinite-ldouble-1.2 () {
    ! mmux_ldouble_is_infinite WW(mmux_ldouble_MIN)
}
function predicates-is-infinite-ldouble-1.3 () {
    mmux_ldouble_is_infinite '+inf'
}
function predicates-is-infinite-ldouble-1.4 () {
    mmux_ldouble_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-ldouble-1.1 () {
    ! mmux_ldouble_is_nan WW(mmux_ldouble_MAX)
}
function predicates-is-nan-ldouble-1.2 () {
    ! mmux_ldouble_is_nan WW(mmux_ldouble_MIN)
}
function predicates-is-nan-ldouble-1.3 () {
    mmux_ldouble_is_nan 'nan'
}
function predicates-is-nan-ldouble-1.4 () {
    mmux_ldouble_is_nan '+nan'
}
function predicates-is-nan-ldouble-1.5 () {
    mmux_ldouble_is_nan '-nan'
}
function predicates-is-nan-ldouble-1.6 () {
    mmux_ldouble_is_nan '+nan.0'
}
function predicates-is-nan-ldouble-1.7 () {
    mmux_ldouble_is_nan '-nan.0'
}


#### type variables: float32

if test -v mmux_float32_SIZEOF
then

function predicates-is-zero-float32-1.1 () {
    mmux_float32_is_zero 0
}
function predicates-is-zero-float32-1.2 () {
    ! mmux_float32_is_zero WW(mmux_float32_MAX)
}
function predicates-is-zero-float32-1.3 () {
    ! mmux_float32_is_zero WW(mmux_float32_MIN)
}
function predicates-is-zero-float32-1.4 () {
    mmux_float32_is_zero +0.0
}
function predicates-is-zero-float32-1.5 () {
    mmux_float32_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float32-1.1 () {
    mmux_float32_is_positive 0
}
function predicates-is-positive-float32-1.2 () {
    mmux_float32_is_positive WW(mmux_float32_MAX)
}
function predicates-is-positive-float32-1.3 () {
    ! mmux_float32_is_positive WW(mmux_float32_MIN)
}
function predicates-is-positive-float32-1.4 () {
    mmux_float32_is_positive +0.0
}
function predicates-is-positive-float32-1.4 () {
    ! mmux_float32_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float32-1.1 () {
    ! mmux_float32_is_negative 0
}
function predicates-is-negative-float32-1.2 () {
    ! mmux_float32_is_negative WW(mmux_float32_MAX)
}
function predicates-is-negative-float32-1.3 () {
    mmux_float32_is_negative WW(mmux_float32_MIN)
}
function predicates-is-negative-float32-1.4 () {
    ! mmux_float32_is_negative +0.0
}
function predicates-is-negative-float32-1.5 () {
    mmux_float32_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float32-1.1 () {
    mmux_float32_is_non_positive 0
}
function predicates-is-non-positive-float32-1.2 () {
    ! mmux_float32_is_non_positive WW(mmux_float32_MAX)
}
function predicates-is-non-positive-float32-1.3 () {
    mmux_float32_is_non_positive WW(mmux_float32_MIN)
}
function predicates-is-non-positive-float32-1.4 () {
    mmux_float32_is_non_positive +0.0
}
function predicates-is-non-positive-float32-1.5 () {
    mmux_float32_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float32-1.1 () {
    mmux_float32_is_non_negative 0
}
function predicates-is-non-negative-float32-1.2 () {
    mmux_float32_is_non_negative WW(mmux_float32_MAX)
}
function predicates-is-non-negative-float32-1.3 () {
    ! mmux_float32_is_non_negative WW(mmux_float32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float32-1.1 () {
    ! mmux_float32_is_infinite WW(mmux_float32_MAX)
}
function predicates-is-infinite-float32-1.2 () {
    ! mmux_float32_is_infinite WW(mmux_float32_MIN)
}
function predicates-is-infinite-float32-1.3 () {
    mmux_float32_is_infinite '+inf'
}
function predicates-is-infinite-float32-1.4 () {
    mmux_float32_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float32-1.1 () {
    ! mmux_float32_is_nan WW(mmux_float32_MAX)
}
function predicates-is-nan-float32-1.2 () {
    ! mmux_float32_is_nan WW(mmux_float32_MIN)
}
function predicates-is-nan-float32-1.3 () {
    mmux_float32_is_nan 'nan'
}
function predicates-is-nan-float32-1.4 () {
    mmux_float32_is_nan '+nan'
}
function predicates-is-nan-float32-1.5 () {
    mmux_float32_is_nan '-nan'
}
function predicates-is-nan-float32-1.6 () {
    mmux_float32_is_nan '+nan.0'
}
function predicates-is-nan-float32-1.7 () {
    mmux_float32_is_nan '-nan.0'
}

fi


#### type variables: float64

if test -v mmux_float64_SIZEOF
then

function predicates-is-zero-float64-1.1 () {
    mmux_float64_is_zero 0
}
function predicates-is-zero-float64-1.2 () {
    ! mmux_float64_is_zero WW(mmux_float64_MAX)
}
function predicates-is-zero-float64-1.3 () {
    ! mmux_float64_is_zero WW(mmux_float64_MIN)
}
function predicates-is-zero-float64-1.4 () {
    mmux_float64_is_zero +0.0
}
function predicates-is-zero-float64-1.5 () {
    mmux_float64_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float64-1.1 () {
    mmux_float64_is_positive 0
}
function predicates-is-positive-float64-1.2 () {
    mmux_float64_is_positive WW(mmux_float64_MAX)
}
function predicates-is-positive-float64-1.3 () {
    ! mmux_float64_is_positive WW(mmux_float64_MIN)
}
function predicates-is-positive-float64-1.4 () {
    mmux_float64_is_positive +0.0
}
function predicates-is-positive-float64-1.4 () {
    ! mmux_float64_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float64-1.1 () {
    ! mmux_float64_is_negative 0
}
function predicates-is-negative-float64-1.2 () {
    ! mmux_float64_is_negative WW(mmux_float64_MAX)
}
function predicates-is-negative-float64-1.3 () {
    mmux_float64_is_negative WW(mmux_float64_MIN)
}
function predicates-is-negative-float64-1.4 () {
    ! mmux_float64_is_negative +0.0
}
function predicates-is-negative-float64-1.5 () {
    mmux_float64_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float64-1.1 () {
    mmux_float64_is_non_positive 0
}
function predicates-is-non-positive-float64-1.2 () {
    ! mmux_float64_is_non_positive WW(mmux_float64_MAX)
}
function predicates-is-non-positive-float64-1.3 () {
    mmux_float64_is_non_positive WW(mmux_float64_MIN)
}
function predicates-is-non-positive-float64-1.4 () {
    mmux_float64_is_non_positive +0.0
}
function predicates-is-non-positive-float64-1.5 () {
    mmux_float64_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float64-1.1 () {
    mmux_float64_is_non_negative 0
}
function predicates-is-non-negative-float64-1.2 () {
    mmux_float64_is_non_negative WW(mmux_float64_MAX)
}
function predicates-is-non-negative-float64-1.3 () {
    ! mmux_float64_is_non_negative WW(mmux_float64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float64-1.1 () {
    ! mmux_float64_is_infinite WW(mmux_float64_MAX)
}
function predicates-is-infinite-float64-1.2 () {
    ! mmux_float64_is_infinite WW(mmux_float64_MIN)
}
function predicates-is-infinite-float64-1.3 () {
    mmux_float64_is_infinite '+inf'
}
function predicates-is-infinite-float64-1.4 () {
    mmux_float64_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float64-1.1 () {
    ! mmux_float64_is_nan WW(mmux_float64_MAX)
}
function predicates-is-nan-float64-1.2 () {
    ! mmux_float64_is_nan WW(mmux_float64_MIN)
}
function predicates-is-nan-float64-1.3 () {
    mmux_float64_is_nan 'nan'
}
function predicates-is-nan-float64-1.4 () {
    mmux_float64_is_nan '+nan'
}
function predicates-is-nan-float64-1.5 () {
    mmux_float64_is_nan '-nan'
}
function predicates-is-nan-float64-1.6 () {
    mmux_float64_is_nan '+nan.0'
}
function predicates-is-nan-float64-1.7 () {
    mmux_float64_is_nan '-nan.0'
}

fi


#### type variables: float128

if test -v mmux_float128_SIZEOF
then

function predicates-is-zero-float128-1.1 () {
    mmux_float128_is_zero 0
}
function predicates-is-zero-float128-1.2 () {
    ! mmux_float128_is_zero WW(mmux_float128_MAX)
}
function predicates-is-zero-float128-1.3 () {
    ! mmux_float128_is_zero WW(mmux_float128_MIN)
}
function predicates-is-zero-float128-1.4 () {
    mmux_float128_is_zero +0.0
}
function predicates-is-zero-float128-1.5 () {
    mmux_float128_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float128-1.1 () {
    mmux_float128_is_positive 0
}
function predicates-is-positive-float128-1.2 () {
    mmux_float128_is_positive WW(mmux_float128_MAX)
}
function predicates-is-positive-float128-1.3 () {
    ! mmux_float128_is_positive WW(mmux_float128_MIN)
}
function predicates-is-positive-float128-1.4 () {
    mmux_float128_is_positive +0.0
}
function predicates-is-positive-float128-1.4 () {
    ! mmux_float128_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float128-1.1 () {
    ! mmux_float128_is_negative 0
}
function predicates-is-negative-float128-1.2 () {
    ! mmux_float128_is_negative WW(mmux_float128_MAX)
}
function predicates-is-negative-float128-1.3 () {
    mmux_float128_is_negative WW(mmux_float128_MIN)
}
function predicates-is-negative-float128-1.4 () {
    ! mmux_float128_is_negative +0.0
}
function predicates-is-negative-float128-1.5 () {
    mmux_float128_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float128-1.1 () {
    mmux_float128_is_non_positive 0
}
function predicates-is-non-positive-float128-1.2 () {
    ! mmux_float128_is_non_positive WW(mmux_float128_MAX)
}
function predicates-is-non-positive-float128-1.3 () {
    mmux_float128_is_non_positive WW(mmux_float128_MIN)
}
function predicates-is-non-positive-float128-1.4 () {
    mmux_float128_is_non_positive +0.0
}
function predicates-is-non-positive-float128-1.5 () {
    mmux_float128_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float128-1.1 () {
    mmux_float128_is_non_negative 0
}
function predicates-is-non-negative-float128-1.2 () {
    mmux_float128_is_non_negative WW(mmux_float128_MAX)
}
function predicates-is-non-negative-float128-1.3 () {
    ! mmux_float128_is_non_negative WW(mmux_float128_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float128-1.1 () {
    ! mmux_float128_is_infinite WW(mmux_float128_MAX)
}
function predicates-is-infinite-float128-1.2 () {
    ! mmux_float128_is_infinite WW(mmux_float128_MIN)
}
function predicates-is-infinite-float128-1.3 () {
    mmux_float128_is_infinite '+inf'
}
function predicates-is-infinite-float128-1.4 () {
    mmux_float128_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float128-1.1 () {
    ! mmux_float128_is_nan WW(mmux_float128_MAX)
}
function predicates-is-nan-float128-1.2 () {
    ! mmux_float128_is_nan WW(mmux_float128_MIN)
}
function predicates-is-nan-float128-1.3 () {
    mmux_float128_is_nan 'nan'
}
function predicates-is-nan-float128-1.4 () {
    mmux_float128_is_nan '+nan'
}
function predicates-is-nan-float128-1.5 () {
    mmux_float128_is_nan '-nan'
}
function predicates-is-nan-float128-1.6 () {
    mmux_float128_is_nan '+nan.0'
}
function predicates-is-nan-float128-1.7 () {
    mmux_float128_is_nan '-nan.0'
}

fi


#### type variables: float32x

if test -v mmux_float32x_SIZEOF
then

function predicates-is-zero-float32x-1.1 () {
    mmux_float32x_is_zero 0
}
function predicates-is-zero-float32x-1.2 () {
    ! mmux_float32x_is_zero WW(mmux_float32x_MAX)
}
function predicates-is-zero-float32x-1.3 () {
    ! mmux_float32x_is_zero WW(mmux_float32x_MIN)
}
function predicates-is-zero-float32x-1.4 () {
    mmux_float32x_is_zero +0.0
}
function predicates-is-zero-float32x-1.5 () {
    mmux_float32x_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float32x-1.1 () {
    mmux_float32x_is_positive 0
}
function predicates-is-positive-float32x-1.2 () {
    mmux_float32x_is_positive WW(mmux_float32x_MAX)
}
function predicates-is-positive-float32x-1.3 () {
    ! mmux_float32x_is_positive WW(mmux_float32x_MIN)
}
function predicates-is-positive-float32x-1.4 () {
    mmux_float32x_is_positive +0.0
}
function predicates-is-positive-float32x-1.4 () {
    ! mmux_float32x_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float32x-1.1 () {
    ! mmux_float32x_is_negative 0
}
function predicates-is-negative-float32x-1.2 () {
    ! mmux_float32x_is_negative WW(mmux_float32x_MAX)
}
function predicates-is-negative-float32x-1.3 () {
    mmux_float32x_is_negative WW(mmux_float32x_MIN)
}
function predicates-is-negative-float32x-1.4 () {
    ! mmux_float32x_is_negative +0.0
}
function predicates-is-negative-float32x-1.5 () {
    mmux_float32x_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float32x-1.1 () {
    mmux_float32x_is_non_positive 0
}
function predicates-is-non-positive-float32x-1.2 () {
    ! mmux_float32x_is_non_positive WW(mmux_float32x_MAX)
}
function predicates-is-non-positive-float32x-1.3 () {
    mmux_float32x_is_non_positive WW(mmux_float32x_MIN)
}
function predicates-is-non-positive-float32x-1.4 () {
    mmux_float32x_is_non_positive +0.0
}
function predicates-is-non-positive-float32x-1.5 () {
    mmux_float32x_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float32x-1.1 () {
    mmux_float32x_is_non_negative 0
}
function predicates-is-non-negative-float32x-1.2 () {
    mmux_float32x_is_non_negative WW(mmux_float32x_MAX)
}
function predicates-is-non-negative-float32x-1.3 () {
    ! mmux_float32x_is_non_negative WW(mmux_float32x_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float32x-1.1 () {
    ! mmux_float32x_is_infinite WW(mmux_float32x_MAX)
}
function predicates-is-infinite-float32x-1.2 () {
    ! mmux_float32x_is_infinite WW(mmux_float32x_MIN)
}
function predicates-is-infinite-float32x-1.3 () {
    mmux_float32x_is_infinite '+inf'
}
function predicates-is-infinite-float32x-1.4 () {
    mmux_float32x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float32x-1.1 () {
    ! mmux_float32x_is_nan WW(mmux_float32x_MAX)
}
function predicates-is-nan-float32x-1.2 () {
    ! mmux_float32x_is_nan WW(mmux_float32x_MIN)
}
function predicates-is-nan-float32x-1.3 () {
    mmux_float32x_is_nan 'nan'
}
function predicates-is-nan-float32x-1.4 () {
    mmux_float32x_is_nan '+nan'
}
function predicates-is-nan-float32x-1.5 () {
    mmux_float32x_is_nan '-nan'
}
function predicates-is-nan-float32x-1.6 () {
    mmux_float32x_is_nan '+nan.0'
}
function predicates-is-nan-float32x-1.7 () {
    mmux_float32x_is_nan '-nan.0'
}

fi


#### type variables: float64x

if test -v mmux_float64x_SIZEOF
then

function predicates-is-zero-float64x-1.1 () {
    mmux_float64x_is_zero 0
}
function predicates-is-zero-float64x-1.2 () {
    ! mmux_float64x_is_zero WW(mmux_float64x_MAX)
}
function predicates-is-zero-float64x-1.3 () {
    ! mmux_float64x_is_zero WW(mmux_float64x_MIN)
}
function predicates-is-zero-float64x-1.4 () {
    mmux_float64x_is_zero +0.0
}
function predicates-is-zero-float64x-1.5 () {
    mmux_float64x_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float64x-1.1 () {
    mmux_float64x_is_positive 0
}
function predicates-is-positive-float64x-1.2 () {
    mmux_float64x_is_positive WW(mmux_float64x_MAX)
}
function predicates-is-positive-float64x-1.3 () {
    ! mmux_float64x_is_positive WW(mmux_float64x_MIN)
}
function predicates-is-positive-float64x-1.4 () {
    mmux_float64x_is_positive +0.0
}
function predicates-is-positive-float64x-1.4 () {
    ! mmux_float64x_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float64x-1.1 () {
    ! mmux_float64x_is_negative 0
}
function predicates-is-negative-float64x-1.2 () {
    ! mmux_float64x_is_negative WW(mmux_float64x_MAX)
}
function predicates-is-negative-float64x-1.3 () {
    mmux_float64x_is_negative WW(mmux_float64x_MIN)
}
function predicates-is-negative-float64x-1.4 () {
    ! mmux_float64x_is_negative +0.0
}
function predicates-is-negative-float64x-1.5 () {
    mmux_float64x_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float64x-1.1 () {
    mmux_float64x_is_non_positive 0
}
function predicates-is-non-positive-float64x-1.2 () {
    ! mmux_float64x_is_non_positive WW(mmux_float64x_MAX)
}
function predicates-is-non-positive-float64x-1.3 () {
    mmux_float64x_is_non_positive WW(mmux_float64x_MIN)
}
function predicates-is-non-positive-float64x-1.4 () {
    mmux_float64x_is_non_positive +0.0
}
function predicates-is-non-positive-float64x-1.5 () {
    mmux_float64x_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float64x-1.1 () {
    mmux_float64x_is_non_negative 0
}
function predicates-is-non-negative-float64x-1.2 () {
    mmux_float64x_is_non_negative WW(mmux_float64x_MAX)
}
function predicates-is-non-negative-float64x-1.3 () {
    ! mmux_float64x_is_non_negative WW(mmux_float64x_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float64x-1.1 () {
    ! mmux_float64x_is_infinite WW(mmux_float64x_MAX)
}
function predicates-is-infinite-float64x-1.2 () {
    ! mmux_float64x_is_infinite WW(mmux_float64x_MIN)
}
function predicates-is-infinite-float64x-1.3 () {
    mmux_float64x_is_infinite '+inf'
}
function predicates-is-infinite-float64x-1.4 () {
    mmux_float64x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float64x-1.1 () {
    ! mmux_float64x_is_nan WW(mmux_float64x_MAX)
}
function predicates-is-nan-float64x-1.2 () {
    ! mmux_float64x_is_nan WW(mmux_float64x_MIN)
}
function predicates-is-nan-float64x-1.3 () {
    mmux_float64x_is_nan 'nan'
}
function predicates-is-nan-float64x-1.4 () {
    mmux_float64x_is_nan '+nan'
}
function predicates-is-nan-float64x-1.5 () {
    mmux_float64x_is_nan '-nan'
}
function predicates-is-nan-float64x-1.6 () {
    mmux_float64x_is_nan '+nan.0'
}
function predicates-is-nan-float64x-1.7 () {
    mmux_float64x_is_nan '-nan.0'
}

fi


#### type variables: float128x

if test -v mmux_float128x_SIZEOF
then

function predicates-is-zero-float128x-1.1 () {
    mmux_float128x_is_zero 0
}
function predicates-is-zero-float128x-1.2 () {
    ! mmux_float128x_is_zero WW(mmux_float128x_MAX)
}
function predicates-is-zero-float128x-1.3 () {
    ! mmux_float128x_is_zero WW(mmux_float128x_MIN)
}
function predicates-is-zero-float128x-1.4 () {
    mmux_float128x_is_zero +0.0
}
function predicates-is-zero-float128x-1.5 () {
    mmux_float128x_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-float128x-1.1 () {
    mmux_float128x_is_positive 0
}
function predicates-is-positive-float128x-1.2 () {
    mmux_float128x_is_positive WW(mmux_float128x_MAX)
}
function predicates-is-positive-float128x-1.3 () {
    ! mmux_float128x_is_positive WW(mmux_float128x_MIN)
}
function predicates-is-positive-float128x-1.4 () {
    mmux_float128x_is_positive +0.0
}
function predicates-is-positive-float128x-1.4 () {
    ! mmux_float128x_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-float128x-1.1 () {
    ! mmux_float128x_is_negative 0
}
function predicates-is-negative-float128x-1.2 () {
    ! mmux_float128x_is_negative WW(mmux_float128x_MAX)
}
function predicates-is-negative-float128x-1.3 () {
    mmux_float128x_is_negative WW(mmux_float128x_MIN)
}
function predicates-is-negative-float128x-1.4 () {
    ! mmux_float128x_is_negative +0.0
}
function predicates-is-negative-float128x-1.5 () {
    mmux_float128x_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-float128x-1.1 () {
    mmux_float128x_is_non_positive 0
}
function predicates-is-non-positive-float128x-1.2 () {
    ! mmux_float128x_is_non_positive WW(mmux_float128x_MAX)
}
function predicates-is-non-positive-float128x-1.3 () {
    mmux_float128x_is_non_positive WW(mmux_float128x_MIN)
}
function predicates-is-non-positive-float128x-1.4 () {
    mmux_float128x_is_non_positive +0.0
}
function predicates-is-non-positive-float128x-1.5 () {
    mmux_float128x_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-float128x-1.1 () {
    mmux_float128x_is_non_negative 0
}
function predicates-is-non-negative-float128x-1.2 () {
    mmux_float128x_is_non_negative WW(mmux_float128x_MAX)
}
function predicates-is-non-negative-float128x-1.3 () {
    ! mmux_float128x_is_non_negative WW(mmux_float128x_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float128x-1.1 () {
    ! mmux_float128x_is_infinite WW(mmux_float128x_MAX)
}
function predicates-is-infinite-float128x-1.2 () {
    ! mmux_float128x_is_infinite WW(mmux_float128x_MIN)
}
function predicates-is-infinite-float128x-1.3 () {
    mmux_float128x_is_infinite '+inf'
}
function predicates-is-infinite-float128x-1.4 () {
    mmux_float128x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float128x-1.1 () {
    ! mmux_float128x_is_nan WW(mmux_float128x_MAX)
}
function predicates-is-nan-float128x-1.2 () {
    ! mmux_float128x_is_nan WW(mmux_float128x_MIN)
}
function predicates-is-nan-float128x-1.3 () {
    mmux_float128x_is_nan 'nan'
}
function predicates-is-nan-float128x-1.4 () {
    mmux_float128x_is_nan '+nan'
}
function predicates-is-nan-float128x-1.5 () {
    mmux_float128x_is_nan '-nan'
}
function predicates-is-nan-float128x-1.6 () {
    mmux_float128x_is_nan '+nan.0'
}
function predicates-is-nan-float128x-1.7 () {
    mmux_float128x_is_nan '-nan.0'
}

fi


#### type variables: decimal32

if test -v mmux_decimal32_SIZEOF
then

function predicates-is-zero-decimal32-1.1 () {
    mmux_decimal32_is_zero 0
}
function predicates-is-zero-decimal32-1.2 () {
    ! mmux_decimal32_is_zero WW(mmux_decimal32_MAX)
}
function predicates-is-zero-decimal32-1.3 () {
    ! mmux_decimal32_is_zero WW(mmux_decimal32_MIN)
}
function predicates-is-zero-decimal32-1.4 () {
    mmux_decimal32_is_zero +0.0
}
function predicates-is-zero-decimal32-1.5 () {
    mmux_decimal32_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-decimal32-1.1 () {
    mmux_decimal32_is_positive 0
}
function predicates-is-positive-decimal32-1.2 () {
    mmux_decimal32_is_positive WW(mmux_decimal32_MAX)
}
function predicates-is-positive-decimal32-1.3 () {
    ! mmux_decimal32_is_positive WW(mmux_decimal32_MIN)
}
function predicates-is-positive-decimal32-1.4 () {
    mmux_decimal32_is_positive +0.0
}
function predicates-is-positive-decimal32-1.4 () {
    ! mmux_decimal32_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-decimal32-1.1 () {
    ! mmux_decimal32_is_negative 0
}
function predicates-is-negative-decimal32-1.2 () {
    ! mmux_decimal32_is_negative WW(mmux_decimal32_MAX)
}
function predicates-is-negative-decimal32-1.3 () {
    dotest-unset-debug
    dotest-debug WW(mmux_decimal32_MIN)
    mmux_decimal32_is_negative WW(mmux_decimal32_MIN)
}
function predicates-is-negative-decimal32-1.4 () {
    ! mmux_decimal32_is_negative +0.0
}
function predicates-is-negative-decimal32-1.5 () {
    mmux_decimal32_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-decimal32-1.1 () {
    mmux_decimal32_is_non_positive 0
}
function predicates-is-non-positive-decimal32-1.2 () {
    ! mmux_decimal32_is_non_positive WW(mmux_decimal32_MAX)
}
function predicates-is-non-positive-decimal32-1.3 () {
    mmux_decimal32_is_non_positive WW(mmux_decimal32_MIN)
}
function predicates-is-non-positive-decimal32-1.4 () {
    mmux_decimal32_is_non_positive +0.0
}
function predicates-is-non-positive-decimal32-1.5 () {
    mmux_decimal32_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-decimal32-1.1 () {
    mmux_decimal32_is_non_negative 0
}
function predicates-is-non-negative-decimal32-1.2 () {
    mmux_decimal32_is_non_negative WW(mmux_decimal32_MAX)
}
function predicates-is-non-negative-decimal32-1.3 () {
    ! mmux_decimal32_is_non_negative WW(mmux_decimal32_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-decimal32-1.1 () {
    ! mmux_decimal32_is_infinite WW(mmux_decimal32_MAX)
}
function predicates-is-infinite-decimal32-1.2 () {
    ! mmux_decimal32_is_infinite WW(mmux_decimal32_MIN)
}
function predicates-is-infinite-decimal32-1.3 () {
    mmux_decimal32_is_infinite '+inf'
}
function predicates-is-infinite-decimal32-1.4 () {
    mmux_decimal32_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-decimal32-1.1 () {
    ! mmux_decimal32_is_nan WW(mmux_decimal32_MAX)
}
function predicates-is-nan-decimal32-1.2 () {
    ! mmux_decimal32_is_nan WW(mmux_decimal32_MIN)
}
function predicates-is-nan-decimal32-1.3 () {
    mmux_decimal32_is_nan 'nan'
}
function predicates-is-nan-decimal32-1.4 () {
    mmux_decimal32_is_nan '+nan'
}
function predicates-is-nan-decimal32-1.5 () {
    mmux_decimal32_is_nan '-nan'
}
function predicates-is-nan-decimal32-1.6 () {
    mmux_decimal32_is_nan '+nan.0'
}
function predicates-is-nan-decimal32-1.7 () {
    mmux_decimal32_is_nan '-nan.0'
}

fi


#### type variables: decimal64

if test -v mmux_decimal64_SIZEOF
then

function predicates-is-zero-decimal64-1.1 () {
    mmux_decimal64_is_zero 0
}
function predicates-is-zero-decimal64-1.2 () {
    ! mmux_decimal64_is_zero WW(mmux_decimal64_MAX)
}
function predicates-is-zero-decimal64-1.3 () {
    ! mmux_decimal64_is_zero WW(mmux_decimal64_MIN)
}
function predicates-is-zero-decimal64-1.4 () {
    mmux_decimal64_is_zero +0.0
}
function predicates-is-zero-decimal64-1.5 () {
    mmux_decimal64_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-decimal64-1.1 () {
    mmux_decimal64_is_positive 0
}
function predicates-is-positive-decimal64-1.2 () {
    mmux_decimal64_is_positive WW(mmux_decimal64_MAX)
}
function predicates-is-positive-decimal64-1.3 () {
    ! mmux_decimal64_is_positive WW(mmux_decimal64_MIN)
}
function predicates-is-positive-decimal64-1.4 () {
    mmux_decimal64_is_positive +0.0
}
function predicates-is-positive-decimal64-1.4 () {
    ! mmux_decimal64_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-decimal64-1.1 () {
    ! mmux_decimal64_is_negative 0
}
function predicates-is-negative-decimal64-1.2 () {
    ! mmux_decimal64_is_negative WW(mmux_decimal64_MAX)
}
function predicates-is-negative-decimal64-1.3 () {
    mmux_decimal64_is_negative WW(mmux_decimal64_MIN)
}
function predicates-is-negative-decimal64-1.4 () {
    ! mmux_decimal64_is_negative +0.0
}
function predicates-is-negative-decimal64-1.5 () {
    mmux_decimal64_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-decimal64-1.1 () {
    mmux_decimal64_is_non_positive 0
}
function predicates-is-non-positive-decimal64-1.2 () {
    ! mmux_decimal64_is_non_positive WW(mmux_decimal64_MAX)
}
function predicates-is-non-positive-decimal64-1.3 () {
    mmux_decimal64_is_non_positive WW(mmux_decimal64_MIN)
}
function predicates-is-non-positive-decimal64-1.4 () {
    mmux_decimal64_is_non_positive +0.0
}
function predicates-is-non-positive-decimal64-1.5 () {
    mmux_decimal64_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-decimal64-1.1 () {
    mmux_decimal64_is_non_negative 0
}
function predicates-is-non-negative-decimal64-1.2 () {
    mmux_decimal64_is_non_negative WW(mmux_decimal64_MAX)
}
function predicates-is-non-negative-decimal64-1.3 () {
    ! mmux_decimal64_is_non_negative WW(mmux_decimal64_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-decimal64-1.1 () {
    ! mmux_decimal64_is_infinite WW(mmux_decimal64_MAX)
}
function predicates-is-infinite-decimal64-1.2 () {
    ! mmux_decimal64_is_infinite WW(mmux_decimal64_MIN)
}
function predicates-is-infinite-decimal64-1.3 () {
    mmux_decimal64_is_infinite '+inf'
}
function predicates-is-infinite-decimal64-1.4 () {
    mmux_decimal64_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-decimal64-1.1 () {
    ! mmux_decimal64_is_nan WW(mmux_decimal64_MAX)
}
function predicates-is-nan-decimal64-1.2 () {
    ! mmux_decimal64_is_nan WW(mmux_decimal64_MIN)
}
function predicates-is-nan-decimal64-1.3 () {
    mmux_decimal64_is_nan 'nan'
}
function predicates-is-nan-decimal64-1.4 () {
    mmux_decimal64_is_nan '+nan'
}
function predicates-is-nan-decimal64-1.5 () {
    mmux_decimal64_is_nan '-nan'
}
function predicates-is-nan-decimal64-1.6 () {
    mmux_decimal64_is_nan '+nan.0'
}
function predicates-is-nan-decimal64-1.7 () {
    mmux_decimal64_is_nan '-nan.0'
}

fi


#### type variables: decimal128

if test -v mmux_decimal128_SIZEOF
then

function predicates-is-zero-decimal128-1.1 () {
    mmux_decimal128_is_zero 0
}
function predicates-is-zero-decimal128-1.2 () {
    ! mmux_decimal128_is_zero WW(mmux_decimal128_MAX)
}
function predicates-is-zero-decimal128-1.3 () {
    ! mmux_decimal128_is_zero WW(mmux_decimal128_MIN)
}
function predicates-is-zero-decimal128-1.4 () {
    mmux_decimal128_is_zero +0.0
}
function predicates-is-zero-decimal128-1.5 () {
    mmux_decimal128_is_zero -0.0
}

### ------------------------------------------------------------------------

function predicates-is-positive-decimal128-1.1 () {
    mmux_decimal128_is_positive 0
}
function predicates-is-positive-decimal128-1.2 () {
    mmux_decimal128_is_positive WW(mmux_decimal128_MAX)
}
function predicates-is-positive-decimal128-1.3 () {
    ! mmux_decimal128_is_positive WW(mmux_decimal128_MIN)
}
function predicates-is-positive-decimal128-1.4 () {
    mmux_decimal128_is_positive +0.0
}
function predicates-is-positive-decimal128-1.4 () {
    ! mmux_decimal128_is_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-negative-decimal128-1.1 () {
    ! mmux_decimal128_is_negative 0
}
function predicates-is-negative-decimal128-1.2 () {
    ! mmux_decimal128_is_negative WW(mmux_decimal128_MAX)
}
function predicates-is-negative-decimal128-1.3 () {
    mmux_decimal128_is_negative WW(mmux_decimal128_MIN)
}
function predicates-is-negative-decimal128-1.4 () {
    ! mmux_decimal128_is_negative +0.0
}
function predicates-is-negative-decimal128-1.5 () {
    mmux_decimal128_is_negative -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-decimal128-1.1 () {
    mmux_decimal128_is_non_positive 0
}
function predicates-is-non-positive-decimal128-1.2 () {
    ! mmux_decimal128_is_non_positive WW(mmux_decimal128_MAX)
}
function predicates-is-non-positive-decimal128-1.3 () {
    mmux_decimal128_is_non_positive WW(mmux_decimal128_MIN)
}
function predicates-is-non-positive-decimal128-1.4 () {
    mmux_decimal128_is_non_positive +0.0
}
function predicates-is-non-positive-decimal128-1.5 () {
    mmux_decimal128_is_non_positive -0.0
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-decimal128-1.1 () {
    mmux_decimal128_is_non_negative 0
}
function predicates-is-non-negative-decimal128-1.2 () {
    mmux_decimal128_is_non_negative WW(mmux_decimal128_MAX)
}
function predicates-is-non-negative-decimal128-1.3 () {
    ! mmux_decimal128_is_non_negative WW(mmux_decimal128_MIN)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-decimal128-1.1 () {
    ! mmux_decimal128_is_infinite WW(mmux_decimal128_MAX)
}
function predicates-is-infinite-decimal128-1.2 () {
    ! mmux_decimal128_is_infinite WW(mmux_decimal128_MIN)
}
function predicates-is-infinite-decimal128-1.3 () {
    mmux_decimal128_is_infinite '+inf'
}
function predicates-is-infinite-decimal128-1.4 () {
    mmux_decimal128_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-decimal128-1.1 () {
    ! mmux_decimal128_is_nan WW(mmux_decimal128_MAX)
}
function predicates-is-nan-decimal128-1.2 () {
    ! mmux_decimal128_is_nan WW(mmux_decimal128_MIN)
}
function predicates-is-nan-decimal128-1.3 () {
    mmux_decimal128_is_nan 'nan'
}
function predicates-is-nan-decimal128-1.4 () {
    mmux_decimal128_is_nan '+nan'
}
function predicates-is-nan-decimal128-1.5 () {
    mmux_decimal128_is_nan '-nan'
}
function predicates-is-nan-decimal128-1.6 () {
    mmux_decimal128_is_nan '+nan.0'
}
function predicates-is-nan-decimal128-1.7 () {
    mmux_decimal128_is_nan '-nan.0'
}

fi


#### type variables: complexf

function predicates-is-zero-complexf-1.1 () {
    mmux_complexf_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf-1.2 () {
    ! mmux_complexf_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf-1.3 () {
    ! mmux_complexf_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf-1.4 () {
    ! mmux_complexf_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf-1.5 () {
    mmux_complexf_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf-1.6 () {
    mmux_complexf_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf-1.7 () {
    mmux_complexf_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf-1.8 () {
    mmux_complexf_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf-1.1 () {
    ! mmux_complexf_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf-1.2 () {
    mmux_complexf_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf-1.3 () {
    mmux_complexf_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf-1.4 () {
    mmux_complexf_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf-1.1 () {
    ! mmux_complexf_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf-1.2 () {
    mmux_complexf_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf-1.3 () {
    mmux_complexf_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf-1.4 () {
    mmux_complexf_is_nan '(1.2)+i*(nan)'
}


#### type variables: complexd

function predicates-is-zero-complexd-1.1 () {
    mmux_complexd_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexd-1.2 () {
    ! mmux_complexd_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexd-1.3 () {
    ! mmux_complexd_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexd-1.4 () {
    ! mmux_complexd_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexd-1.5 () {
    mmux_complexd_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexd-1.6 () {
    mmux_complexd_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexd-1.7 () {
    mmux_complexd_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexd-1.8 () {
    mmux_complexd_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexd-1.1 () {
    ! mmux_complexd_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexd-1.2 () {
    mmux_complexd_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexd-1.3 () {
    mmux_complexd_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexd-1.4 () {
    mmux_complexd_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexd-1.1 () {
    ! mmux_complexd_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexd-1.2 () {
    mmux_complexd_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexd-1.3 () {
    mmux_complexd_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexd-1.4 () {
    mmux_complexd_is_nan '(1.2)+i*(nan)'
}


#### type variables: complexld

if test -v mmux_complexld_SIZEOF
then

function predicates-is-zero-complexld-1.1 () {
    mmux_complexld_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexld-1.2 () {
    ! mmux_complexld_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexld-1.3 () {
    ! mmux_complexld_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexld-1.4 () {
    ! mmux_complexld_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexld-1.5 () {
    mmux_complexld_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexld-1.6 () {
    mmux_complexld_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexld-1.7 () {
    mmux_complexld_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexld-1.8 () {
    mmux_complexld_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexld-1.1 () {
    ! mmux_complexld_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexld-1.2 () {
    mmux_complexld_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexld-1.3 () {
    mmux_complexld_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexld-1.4 () {
    mmux_complexld_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexld-1.1 () {
    ! mmux_complexld_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexld-1.2 () {
    mmux_complexld_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexld-1.3 () {
    mmux_complexld_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexld-1.4 () {
    mmux_complexld_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf32

if test -v mmux_complexf32_SIZEOF
then

function predicates-is-zero-complexf32-1.1 () {
    mmux_complexf32_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf32-1.2 () {
    ! mmux_complexf32_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf32-1.3 () {
    ! mmux_complexf32_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf32-1.4 () {
    ! mmux_complexf32_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf32-1.5 () {
    mmux_complexf32_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf32-1.6 () {
    mmux_complexf32_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf32-1.7 () {
    mmux_complexf32_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf32-1.8 () {
    mmux_complexf32_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf32-1.1 () {
    ! mmux_complexf32_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf32-1.2 () {
    mmux_complexf32_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf32-1.3 () {
    mmux_complexf32_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf32-1.4 () {
    mmux_complexf32_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf32-1.1 () {
    ! mmux_complexf32_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf32-1.2 () {
    mmux_complexf32_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf32-1.3 () {
    mmux_complexf32_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf32-1.4 () {
    mmux_complexf32_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf64

if test -v mmux_complexf64_SIZEOF
then

function predicates-is-zero-complexf64-1.1 () {
    mmux_complexf64_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf64-1.2 () {
    ! mmux_complexf64_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf64-1.3 () {
    ! mmux_complexf64_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf64-1.4 () {
    ! mmux_complexf64_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf64-1.5 () {
    mmux_complexf64_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf64-1.6 () {
    mmux_complexf64_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf64-1.7 () {
    mmux_complexf64_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf64-1.8 () {
    mmux_complexf64_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf64-1.1 () {
    ! mmux_complexf64_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf64-1.2 () {
    mmux_complexf64_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf64-1.3 () {
    mmux_complexf64_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf64-1.4 () {
    mmux_complexf64_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf64-1.1 () {
    ! mmux_complexf64_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf64-1.2 () {
    mmux_complexf64_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf64-1.3 () {
    mmux_complexf64_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf64-1.4 () {
    mmux_complexf64_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf128

if test -v mmux_complexf128_SIZEOF
then

function predicates-is-zero-complexf128-1.1 () {
    mmux_complexf128_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf128-1.2 () {
    ! mmux_complexf128_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf128-1.3 () {
    ! mmux_complexf128_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf128-1.4 () {
    ! mmux_complexf128_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf128-1.5 () {
    mmux_complexf128_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf128-1.6 () {
    mmux_complexf128_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf128-1.7 () {
    mmux_complexf128_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf128-1.8 () {
    mmux_complexf128_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf128-1.1 () {
    ! mmux_complexf128_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf128-1.2 () {
    mmux_complexf128_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf128-1.3 () {
    mmux_complexf128_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf128-1.4 () {
    mmux_complexf128_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf128-1.1 () {
    ! mmux_complexf128_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf128-1.2 () {
    mmux_complexf128_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf128-1.3 () {
    mmux_complexf128_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf128-1.4 () {
    mmux_complexf128_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf32x

if test -v mmux_complexf32x_SIZEOF
then

function predicates-is-zero-complexf32x-1.1 () {
    mmux_complexf32x_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf32x-1.2 () {
    ! mmux_complexf32x_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf32x-1.3 () {
    ! mmux_complexf32x_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf32x-1.4 () {
    ! mmux_complexf32x_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf32x-1.5 () {
    mmux_complexf32x_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf32x-1.6 () {
    mmux_complexf32x_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf32x-1.7 () {
    mmux_complexf32x_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf32x-1.8 () {
    mmux_complexf32x_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf32x-1.1 () {
    ! mmux_complexf32x_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf32x-1.2 () {
    mmux_complexf32x_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf32x-1.3 () {
    mmux_complexf32x_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf32x-1.4 () {
    mmux_complexf32x_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf32x-1.1 () {
    ! mmux_complexf32x_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf32x-1.2 () {
    mmux_complexf32x_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf32x-1.3 () {
    mmux_complexf32x_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf32x-1.4 () {
    mmux_complexf32x_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf64x

if test -v mmux_complexf64x_SIZEOF
then

function predicates-is-zero-complexf64x-1.1 () {
    mmux_complexf64x_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf64x-1.2 () {
    ! mmux_complexf64x_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf64x-1.3 () {
    ! mmux_complexf64x_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf64x-1.4 () {
    ! mmux_complexf64x_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf64x-1.5 () {
    mmux_complexf64x_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf64x-1.6 () {
    mmux_complexf64x_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf64x-1.7 () {
    mmux_complexf64x_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf64x-1.8 () {
    mmux_complexf64x_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf64x-1.1 () {
    ! mmux_complexf64x_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf64x-1.2 () {
    mmux_complexf64x_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf64x-1.3 () {
    mmux_complexf64x_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf64x-1.4 () {
    mmux_complexf64x_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf64x-1.1 () {
    ! mmux_complexf64x_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf64x-1.2 () {
    mmux_complexf64x_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf64x-1.3 () {
    mmux_complexf64x_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf64x-1.4 () {
    mmux_complexf64x_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexf128x

if test -v mmux_complexf128x_SIZEOF
then

function predicates-is-zero-complexf128x-1.1 () {
    mmux_complexf128x_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexf128x-1.2 () {
    ! mmux_complexf128x_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexf128x-1.3 () {
    ! mmux_complexf128x_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexf128x-1.4 () {
    ! mmux_complexf128x_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexf128x-1.5 () {
    mmux_complexf128x_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexf128x-1.6 () {
    mmux_complexf128x_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexf128x-1.7 () {
    mmux_complexf128x_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexf128x-1.8 () {
    mmux_complexf128x_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexf128x-1.1 () {
    ! mmux_complexf128x_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexf128x-1.2 () {
    mmux_complexf128x_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexf128x-1.3 () {
    mmux_complexf128x_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexf128x-1.4 () {
    mmux_complexf128x_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexf128x-1.1 () {
    ! mmux_complexf128x_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexf128x-1.2 () {
    mmux_complexf128x_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexf128x-1.3 () {
    mmux_complexf128x_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexf128x-1.4 () {
    mmux_complexf128x_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexd32

if test -v mmux_complexd32_SIZEOF
then

function predicates-is-zero-complexd32-1.1 () {
    mmux_complexd32_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexd32-1.2 () {
    ! mmux_complexd32_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexd32-1.3 () {
    ! mmux_complexd32_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexd32-1.4 () {
    ! mmux_complexd32_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexd32-1.5 () {
    mmux_complexd32_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexd32-1.6 () {
    mmux_complexd32_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexd32-1.7 () {
    mmux_complexd32_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexd32-1.8 () {
    mmux_complexd32_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexd32-1.1 () {
    ! mmux_complexd32_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexd32-1.2 () {
    mmux_complexd32_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexd32-1.3 () {
    mmux_complexd32_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexd32-1.4 () {
    mmux_complexd32_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexd32-1.1 () {
    ! mmux_complexd32_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexd32-1.2 () {
    mmux_complexd32_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexd32-1.3 () {
    mmux_complexd32_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexd32-1.4 () {
    mmux_complexd32_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexd64

if test -v mmux_complexd64_SIZEOF
then

function predicates-is-zero-complexd64-1.1 () {
    mmux_complexd64_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexd64-1.2 () {
    ! mmux_complexd64_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexd64-1.3 () {
    ! mmux_complexd64_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexd64-1.4 () {
    ! mmux_complexd64_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexd64-1.5 () {
    mmux_complexd64_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexd64-1.6 () {
    mmux_complexd64_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexd64-1.7 () {
    mmux_complexd64_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexd64-1.8 () {
    mmux_complexd64_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexd64-1.1 () {
    ! mmux_complexd64_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexd64-1.2 () {
    mmux_complexd64_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexd64-1.3 () {
    mmux_complexd64_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexd64-1.4 () {
    mmux_complexd64_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexd64-1.1 () {
    ! mmux_complexd64_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexd64-1.2 () {
    mmux_complexd64_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexd64-1.3 () {
    mmux_complexd64_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexd64-1.4 () {
    mmux_complexd64_is_nan '(1.2)+i*(nan)'
}

fi


#### type variables: complexd128

if test -v mmux_complexd128_SIZEOF
then

function predicates-is-zero-complexd128-1.1 () {
    mmux_complexd128_is_zero '(0)+i*(0)'
}
function predicates-is-zero-complexd128-1.2 () {
    ! mmux_complexd128_is_zero '(1.2)+i*(3.4)'
}
function predicates-is-zero-complexd128-1.3 () {
    ! mmux_complexd128_is_zero '(0.0)+i*(3.4)'
}
function predicates-is-zero-complexd128-1.4 () {
    ! mmux_complexd128_is_zero '(1.2)+i*(0.0)'
}
function predicates-is-zero-complexd128-1.5 () {
    mmux_complexd128_is_zero '(0.0)+i*(0.0)'
}
function predicates-is-zero-complexd128-1.6 () {
    mmux_complexd128_is_zero '(-0.0)+i*(+0.0)'
}
function predicates-is-zero-complexd128-1.7 () {
    mmux_complexd128_is_zero '(-0.0)+i*(-0.0)'
}
function predicates-is-zero-complexd128-1.8 () {
    mmux_complexd128_is_zero '(+0.0)+i*(-0.0)'
}

### ------------------------------------------------------------------------

function predicates-is-infinite-complexd128-1.1 () {
    ! mmux_complexd128_is_infinite '(1.2)+i*(3.4)'
}
function predicates-is-infinite-complexd128-1.2 () {
    mmux_complexd128_is_infinite '(+inf)+i*(3.4)'
}
function predicates-is-infinite-complexd128-1.3 () {
    mmux_complexd128_is_infinite '(+inf)+i*(+inf)'
}
function predicates-is-infinite-complexd128-1.4 () {
    mmux_complexd128_is_infinite '(1.2)+i*(+inf)'
}

### ------------------------------------------------------------------------

function predicates-is-nan-complexd128-1.1 () {
    ! mmux_complexd128_is_nan '(1.2)+i*(3.4)'
}
function predicates-is-nan-complexd128-1.2 () {
    mmux_complexd128_is_nan '(nan)+i*(3.4)'
}
function predicates-is-nan-complexd128-1.3 () {
    mmux_complexd128_is_nan '(nan)+i*(nan)'
}
function predicates-is-nan-complexd128-1.4 () {
    mmux_complexd128_is_nan '(1.2)+i*(nan)'
}

fi


#### let's go

dotest predicates-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
