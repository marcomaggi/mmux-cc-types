#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for predicates builtins
#!# Date: Sep 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/predicates.bash ; less tests/predicates.log
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


#### type variables: schar

function predicates-is-zero-schar-1.1 () {
    mmux_schar_is_zero 0
}
function predicates-is-zero-schar-1.2 () {
    ! mmux_schar_is_zero WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-zero-schar-1.3 () {
    ! mmux_schar_is_zero WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-positive-schar-1.1 () {
    ! mmux_schar_is_positive 0
}
function predicates-is-positive-schar-1.2 () {
    mmux_schar_is_positive WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-positive-schar-1.3 () {
    ! mmux_schar_is_positive WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-negative-schar-1.1 () {
    ! mmux_schar_is_negative 0
}
function predicates-is-negative-schar-1.2 () {
    ! mmux_schar_is_negative WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-negative-schar-1.3 () {
    mmux_schar_is_negative WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-schar-1.1 () {
    mmux_schar_is_non_positive 0
}
function predicates-is-non-positive-schar-1.2 () {
    ! mmux_schar_is_non_positive WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-non-positive-schar-1.3 () {
    mmux_schar_is_non_positive WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-schar-1.1 () {
    mmux_schar_is_non_negative 0
}
function predicates-is-non-negative-schar-1.2 () {
    mmux_schar_is_non_negative WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-non-negative-schar-1.3 () {
    ! mmux_schar_is_non_negative WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-schar-1.1 () {
    ! mmux_schar_is_infinite WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-infinite-schar-1.2 () {
    ! mmux_schar_is_infinite WW(mmux_libc_MIN_SCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-nan-schar-1.1 () {
    ! mmux_schar_is_nan WW(mmux_libc_MAX_SCHAR)
}
function predicates-is-nan-schar-1.2 () {
    ! mmux_schar_is_nan WW(mmux_libc_MIN_SCHAR)
}


#### type variables: uchar

function predicates-is-zero-uchar-1.1 () {
    mmux_uchar_is_zero 0
}
function predicates-is-zero-uchar-1.2 () {
    ! mmux_uchar_is_zero WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-zero-uchar-1.3 () {
    mmux_uchar_is_zero WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uchar-1.1 () {
    ! mmux_uchar_is_positive 0
}
function predicates-is-positive-uchar-1.2 () {
    mmux_uchar_is_positive WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-positive-uchar-1.3 () {
    ! mmux_uchar_is_positive WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uchar-1.1 () {
    ! mmux_uchar_is_negative 0
}
function predicates-is-negative-uchar-1.2 () {
    ! mmux_uchar_is_negative WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-negative-uchar-1.3 () {
    ! mmux_uchar_is_negative WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uchar-1.1 () {
    mmux_uchar_is_non_positive 0
}
function predicates-is-non-positive-uchar-1.2 () {
    ! mmux_uchar_is_non_positive WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-non-positive-uchar-1.3 () {
    mmux_uchar_is_non_positive WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uchar-1.1 () {
    mmux_uchar_is_non_negative 0
}
function predicates-is-non-negative-uchar-1.2 () {
    mmux_uchar_is_non_negative WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-non-negative-uchar-1.3 () {
    mmux_uchar_is_non_negative WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uchar-1.1 () {
    ! mmux_uchar_is_infinite WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-infinite-uchar-1.2 () {
    ! mmux_uchar_is_infinite WW(mmux_libc_MIN_UCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uchar-1.1 () {
    ! mmux_uchar_is_nan WW(mmux_libc_MAX_UCHAR)
}
function predicates-is-nan-uchar-1.2 () {
    ! mmux_uchar_is_nan WW(mmux_libc_MIN_UCHAR)
}


#### type variables: sshort

function predicates-is-zero-sshort-1.1 () {
    mmux_sshort_is_zero 0
}
function predicates-is-zero-sshort-1.2 () {
    ! mmux_sshort_is_zero WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-zero-sshort-1.3 () {
    ! mmux_sshort_is_zero WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sshort-1.1 () {
    ! mmux_sshort_is_positive 0
}
function predicates-is-positive-sshort-1.2 () {
    mmux_sshort_is_positive WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-positive-sshort-1.3 () {
    ! mmux_sshort_is_positive WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sshort-1.1 () {
    ! mmux_sshort_is_negative 0
}
function predicates-is-negative-sshort-1.2 () {
    ! mmux_sshort_is_negative WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-negative-sshort-1.3 () {
    mmux_sshort_is_negative WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sshort-1.1 () {
    mmux_sshort_is_non_positive 0
}
function predicates-is-non-positive-sshort-1.2 () {
    ! mmux_sshort_is_non_positive WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-non-positive-sshort-1.3 () {
    mmux_sshort_is_non_positive WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sshort-1.1 () {
    mmux_sshort_is_non_negative 0
}
function predicates-is-non-negative-sshort-1.2 () {
    mmux_sshort_is_non_negative WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-non-negative-sshort-1.3 () {
    ! mmux_sshort_is_non_negative WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sshort-1.1 () {
    ! mmux_sshort_is_infinite WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-infinite-sshort-1.2 () {
    ! mmux_sshort_is_infinite WW(mmux_libc_MIN_SSHORT)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sshort-1.1 () {
    ! mmux_sshort_is_nan WW(mmux_libc_MAX_SSHORT)
}
function predicates-is-nan-sshort-1.2 () {
    ! mmux_sshort_is_nan WW(mmux_libc_MIN_SSHORT)
}


#### type variables: ushort

function predicates-is-zero-ushort-1.1 () {
    mmux_ushort_is_zero 0
}
function predicates-is-zero-ushort-1.2 () {
    ! mmux_ushort_is_zero WW(mmux_libc_MAX_USHORT)
}
function predicates-is-zero-ushort-1.3 () {
    mmux_ushort_is_zero WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ushort-1.1 () {
    ! mmux_ushort_is_positive 0
}
function predicates-is-positive-ushort-1.2 () {
    mmux_ushort_is_positive WW(mmux_libc_MAX_USHORT)
}
function predicates-is-positive-ushort-1.3 () {
    ! mmux_ushort_is_positive WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ushort-1.1 () {
    ! mmux_ushort_is_negative 0
}
function predicates-is-negative-ushort-1.2 () {
    ! mmux_ushort_is_negative WW(mmux_libc_MAX_USHORT)
}
function predicates-is-negative-ushort-1.3 () {
    ! mmux_ushort_is_negative WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ushort-1.1 () {
    mmux_ushort_is_non_positive 0
}
function predicates-is-non-positive-ushort-1.2 () {
    ! mmux_ushort_is_non_positive WW(mmux_libc_MAX_USHORT)
}
function predicates-is-non-positive-ushort-1.3 () {
    mmux_ushort_is_non_positive WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ushort-1.1 () {
    mmux_ushort_is_non_negative 0
}
function predicates-is-non-negative-ushort-1.2 () {
    mmux_ushort_is_non_negative WW(mmux_libc_MAX_USHORT)
}
function predicates-is-non-negative-ushort-1.3 () {
    mmux_ushort_is_non_negative WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ushort-1.1 () {
    ! mmux_ushort_is_infinite WW(mmux_libc_MAX_USHORT)
}
function predicates-is-infinite-ushort-1.2 () {
    ! mmux_ushort_is_infinite WW(mmux_libc_MIN_USHORT)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ushort-1.1 () {
    ! mmux_ushort_is_nan WW(mmux_libc_MAX_USHORT)
}
function predicates-is-nan-ushort-1.2 () {
    ! mmux_ushort_is_nan WW(mmux_libc_MIN_USHORT)
}


#### type variables: sint

function predicates-is-zero-sint-1.1 () {
    mmux_sint_is_zero 0
}
function predicates-is-zero-sint-1.2 () {
    ! mmux_sint_is_zero WW(mmux_libc_MAX_SINT)
}
function predicates-is-zero-sint-1.3 () {
    ! mmux_sint_is_zero WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint-1.1 () {
    ! mmux_sint_is_positive 0
}
function predicates-is-positive-sint-1.2 () {
    mmux_sint_is_positive WW(mmux_libc_MAX_SINT)
}
function predicates-is-positive-sint-1.3 () {
    ! mmux_sint_is_positive WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint-1.1 () {
    ! mmux_sint_is_negative 0
}
function predicates-is-negative-sint-1.2 () {
    ! mmux_sint_is_negative WW(mmux_libc_MAX_SINT)
}
function predicates-is-negative-sint-1.3 () {
    mmux_sint_is_negative WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint-1.1 () {
    mmux_sint_is_non_positive 0
}
function predicates-is-non-positive-sint-1.2 () {
    ! mmux_sint_is_non_positive WW(mmux_libc_MAX_SINT)
}
function predicates-is-non-positive-sint-1.3 () {
    mmux_sint_is_non_positive WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint-1.1 () {
    mmux_sint_is_non_negative 0
}
function predicates-is-non-negative-sint-1.2 () {
    mmux_sint_is_non_negative WW(mmux_libc_MAX_SINT)
}
function predicates-is-non-negative-sint-1.3 () {
    ! mmux_sint_is_non_negative WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint-1.1 () {
    ! mmux_sint_is_infinite WW(mmux_libc_MAX_SINT)
}
function predicates-is-infinite-sint-1.2 () {
    ! mmux_sint_is_infinite WW(mmux_libc_MIN_SINT)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint-1.1 () {
    ! mmux_sint_is_nan WW(mmux_libc_MAX_SINT)
}
function predicates-is-nan-sint-1.2 () {
    ! mmux_sint_is_nan WW(mmux_libc_MIN_SINT)
}


#### type variables: uint

function predicates-is-zero-uint-1.1 () {
    mmux_uint_is_zero 0
}
function predicates-is-zero-uint-1.2 () {
    ! mmux_uint_is_zero WW(mmux_libc_MAX_UINT)
}
function predicates-is-zero-uint-1.3 () {
    mmux_uint_is_zero WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint-1.1 () {
    ! mmux_uint_is_positive 0
}
function predicates-is-positive-uint-1.2 () {
    mmux_uint_is_positive WW(mmux_libc_MAX_UINT)
}
function predicates-is-positive-uint-1.3 () {
    ! mmux_uint_is_positive WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint-1.1 () {
    ! mmux_uint_is_negative 0
}
function predicates-is-negative-uint-1.2 () {
    ! mmux_uint_is_negative WW(mmux_libc_MAX_UINT)
}
function predicates-is-negative-uint-1.3 () {
    ! mmux_uint_is_negative WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint-1.1 () {
    mmux_uint_is_non_positive 0
}
function predicates-is-non-positive-uint-1.2 () {
    ! mmux_uint_is_non_positive WW(mmux_libc_MAX_UINT)
}
function predicates-is-non-positive-uint-1.3 () {
    mmux_uint_is_non_positive WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint-1.1 () {
    mmux_uint_is_non_negative 0
}
function predicates-is-non-negative-uint-1.2 () {
    mmux_uint_is_non_negative WW(mmux_libc_MAX_UINT)
}
function predicates-is-non-negative-uint-1.3 () {
    mmux_uint_is_non_negative WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint-1.1 () {
    ! mmux_uint_is_infinite WW(mmux_libc_MAX_UINT)
}
function predicates-is-infinite-uint-1.2 () {
    ! mmux_uint_is_infinite WW(mmux_libc_MIN_UINT)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint-1.1 () {
    ! mmux_uint_is_nan WW(mmux_libc_MAX_UINT)
}
function predicates-is-nan-uint-1.2 () {
    ! mmux_uint_is_nan WW(mmux_libc_MIN_UINT)
}


#### type variables: slong

function predicates-is-zero-slong-1.1 () {
    mmux_slong_is_zero 0
}
function predicates-is-zero-slong-1.2 () {
    ! mmux_slong_is_zero WW(mmux_libc_MAX_SLONG)
}
function predicates-is-zero-slong-1.3 () {
    ! mmux_slong_is_zero WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-positive-slong-1.1 () {
    ! mmux_slong_is_positive 0
}
function predicates-is-positive-slong-1.2 () {
    mmux_slong_is_positive WW(mmux_libc_MAX_SLONG)
}
function predicates-is-positive-slong-1.3 () {
    ! mmux_slong_is_positive WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-negative-slong-1.1 () {
    ! mmux_slong_is_negative 0
}
function predicates-is-negative-slong-1.2 () {
    ! mmux_slong_is_negative WW(mmux_libc_MAX_SLONG)
}
function predicates-is-negative-slong-1.3 () {
    mmux_slong_is_negative WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-slong-1.1 () {
    mmux_slong_is_non_positive 0
}
function predicates-is-non-positive-slong-1.2 () {
    ! mmux_slong_is_non_positive WW(mmux_libc_MAX_SLONG)
}
function predicates-is-non-positive-slong-1.3 () {
    mmux_slong_is_non_positive WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-slong-1.1 () {
    mmux_slong_is_non_negative 0
}
function predicates-is-non-negative-slong-1.2 () {
    mmux_slong_is_non_negative WW(mmux_libc_MAX_SLONG)
}
function predicates-is-non-negative-slong-1.3 () {
    ! mmux_slong_is_non_negative WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-slong-1.1 () {
    ! mmux_slong_is_infinite WW(mmux_libc_MAX_SLONG)
}
function predicates-is-infinite-slong-1.2 () {
    ! mmux_slong_is_infinite WW(mmux_libc_MIN_SLONG)
}

### ------------------------------------------------------------------------

function predicates-is-nan-slong-1.1 () {
    ! mmux_slong_is_nan WW(mmux_libc_MAX_SLONG)
}
function predicates-is-nan-slong-1.2 () {
    ! mmux_slong_is_nan WW(mmux_libc_MIN_SLONG)
}


#### type variables: ulong

function predicates-is-zero-ulong-1.1 () {
    mmux_ulong_is_zero 0
}
function predicates-is-zero-ulong-1.2 () {
    ! mmux_ulong_is_zero WW(mmux_libc_MAX_ULONG)
}
function predicates-is-zero-ulong-1.3 () {
    mmux_ulong_is_zero WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ulong-1.1 () {
    ! mmux_ulong_is_positive 0
}
function predicates-is-positive-ulong-1.2 () {
    mmux_ulong_is_positive WW(mmux_libc_MAX_ULONG)
}
function predicates-is-positive-ulong-1.3 () {
    ! mmux_ulong_is_positive WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ulong-1.1 () {
    ! mmux_ulong_is_negative 0
}
function predicates-is-negative-ulong-1.2 () {
    ! mmux_ulong_is_negative WW(mmux_libc_MAX_ULONG)
}
function predicates-is-negative-ulong-1.3 () {
    ! mmux_ulong_is_negative WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ulong-1.1 () {
    mmux_ulong_is_non_positive 0
}
function predicates-is-non-positive-ulong-1.2 () {
    ! mmux_ulong_is_non_positive WW(mmux_libc_MAX_ULONG)
}
function predicates-is-non-positive-ulong-1.3 () {
    mmux_ulong_is_non_positive WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ulong-1.1 () {
    mmux_ulong_is_non_negative 0
}
function predicates-is-non-negative-ulong-1.2 () {
    mmux_ulong_is_non_negative WW(mmux_libc_MAX_ULONG)
}
function predicates-is-non-negative-ulong-1.3 () {
    mmux_ulong_is_non_negative WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ulong-1.1 () {
    ! mmux_ulong_is_infinite WW(mmux_libc_MAX_ULONG)
}
function predicates-is-infinite-ulong-1.2 () {
    ! mmux_ulong_is_infinite WW(mmux_libc_MIN_ULONG)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ulong-1.1 () {
    ! mmux_ulong_is_nan WW(mmux_libc_MAX_ULONG)
}
function predicates-is-nan-ulong-1.2 () {
    ! mmux_ulong_is_nan WW(mmux_libc_MIN_ULONG)
}


#### type variables: sllong

function predicates-is-zero-sllong-1.1 () {
    mmux_sllong_is_zero 0
}
function predicates-is-zero-sllong-1.2 () {
    ! mmux_sllong_is_zero WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-zero-sllong-1.3 () {
    ! mmux_sllong_is_zero WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sllong-1.1 () {
    ! mmux_sllong_is_positive 0
}
function predicates-is-positive-sllong-1.2 () {
    mmux_sllong_is_positive WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-positive-sllong-1.3 () {
    ! mmux_sllong_is_positive WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sllong-1.1 () {
    ! mmux_sllong_is_negative 0
}
function predicates-is-negative-sllong-1.2 () {
    ! mmux_sllong_is_negative WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-negative-sllong-1.3 () {
    mmux_sllong_is_negative WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sllong-1.1 () {
    mmux_sllong_is_non_positive 0
}
function predicates-is-non-positive-sllong-1.2 () {
    ! mmux_sllong_is_non_positive WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-non-positive-sllong-1.3 () {
    mmux_sllong_is_non_positive WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sllong-1.1 () {
    mmux_sllong_is_non_negative 0
}
function predicates-is-non-negative-sllong-1.2 () {
    mmux_sllong_is_non_negative WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-non-negative-sllong-1.3 () {
    ! mmux_sllong_is_non_negative WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sllong-1.1 () {
    ! mmux_sllong_is_infinite WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-infinite-sllong-1.2 () {
    ! mmux_sllong_is_infinite WW(mmux_libc_MIN_SLLONG)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sllong-1.1 () {
    ! mmux_sllong_is_nan WW(mmux_libc_MAX_SLLONG)
}
function predicates-is-nan-sllong-1.2 () {
    ! mmux_sllong_is_nan WW(mmux_libc_MIN_SLLONG)
}


#### type variables: ullong

function predicates-is-zero-ullong-1.1 () {
    mmux_ullong_is_zero 0
}
function predicates-is-zero-ullong-1.2 () {
    ! mmux_ullong_is_zero WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-zero-ullong-1.3 () {
    mmux_ullong_is_zero WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ullong-1.1 () {
    ! mmux_ullong_is_positive 0
}
function predicates-is-positive-ullong-1.2 () {
    mmux_ullong_is_positive WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-positive-ullong-1.3 () {
    ! mmux_ullong_is_positive WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ullong-1.1 () {
    ! mmux_ullong_is_negative 0
}
function predicates-is-negative-ullong-1.2 () {
    ! mmux_ullong_is_negative WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-negative-ullong-1.3 () {
    ! mmux_ullong_is_negative WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ullong-1.1 () {
    mmux_ullong_is_non_positive 0
}
function predicates-is-non-positive-ullong-1.2 () {
    ! mmux_ullong_is_non_positive WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-non-positive-ullong-1.3 () {
    mmux_ullong_is_non_positive WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ullong-1.1 () {
    mmux_ullong_is_non_negative 0
}
function predicates-is-non-negative-ullong-1.2 () {
    mmux_ullong_is_non_negative WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-non-negative-ullong-1.3 () {
    mmux_ullong_is_non_negative WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ullong-1.1 () {
    ! mmux_ullong_is_infinite WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-infinite-ullong-1.2 () {
    ! mmux_ullong_is_infinite WW(mmux_libc_MIN_ULLONG)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ullong-1.1 () {
    ! mmux_ullong_is_nan WW(mmux_libc_MAX_ULLONG)
}
function predicates-is-nan-ullong-1.2 () {
    ! mmux_ullong_is_nan WW(mmux_libc_MIN_ULLONG)
}


#### type variables: sint8

function predicates-is-zero-sint8-1.1 () {
    mmux_sint8_is_zero 0
}
function predicates-is-zero-sint8-1.2 () {
    ! mmux_sint8_is_zero WW(mmux_libc_MAX_SINT8)
}
function predicates-is-zero-sint8-1.3 () {
    ! mmux_sint8_is_zero WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint8-1.1 () {
    ! mmux_sint8_is_positive 0
}
function predicates-is-positive-sint8-1.2 () {
    mmux_sint8_is_positive WW(mmux_libc_MAX_SINT8)
}
function predicates-is-positive-sint8-1.3 () {
    ! mmux_sint8_is_positive WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint8-1.1 () {
    ! mmux_sint8_is_negative 0
}
function predicates-is-negative-sint8-1.2 () {
    ! mmux_sint8_is_negative WW(mmux_libc_MAX_SINT8)
}
function predicates-is-negative-sint8-1.3 () {
    mmux_sint8_is_negative WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint8-1.1 () {
    mmux_sint8_is_non_positive 0
}
function predicates-is-non-positive-sint8-1.2 () {
    ! mmux_sint8_is_non_positive WW(mmux_libc_MAX_SINT8)
}
function predicates-is-non-positive-sint8-1.3 () {
    mmux_sint8_is_non_positive WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint8-1.1 () {
    mmux_sint8_is_non_negative 0
}
function predicates-is-non-negative-sint8-1.2 () {
    mmux_sint8_is_non_negative WW(mmux_libc_MAX_SINT8)
}
function predicates-is-non-negative-sint8-1.3 () {
    ! mmux_sint8_is_non_negative WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint8-1.1 () {
    ! mmux_sint8_is_infinite WW(mmux_libc_MAX_SINT8)
}
function predicates-is-infinite-sint8-1.2 () {
    ! mmux_sint8_is_infinite WW(mmux_libc_MIN_SINT8)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint8-1.1 () {
    ! mmux_sint8_is_nan WW(mmux_libc_MAX_SINT8)
}
function predicates-is-nan-sint8-1.2 () {
    ! mmux_sint8_is_nan WW(mmux_libc_MIN_SINT8)
}


#### type variables: uint8

function predicates-is-zero-uint8-1.1 () {
    mmux_uint8_is_zero 0
}
function predicates-is-zero-uint8-1.2 () {
    ! mmux_uint8_is_zero WW(mmux_libc_MAX_UINT8)
}
function predicates-is-zero-uint8-1.3 () {
    mmux_uint8_is_zero WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint8-1.1 () {
    ! mmux_uint8_is_positive 0
}
function predicates-is-positive-uint8-1.2 () {
    mmux_uint8_is_positive WW(mmux_libc_MAX_UINT8)
}
function predicates-is-positive-uint8-1.3 () {
    ! mmux_uint8_is_positive WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint8-1.1 () {
    ! mmux_uint8_is_negative 0
}
function predicates-is-negative-uint8-1.2 () {
    ! mmux_uint8_is_negative WW(mmux_libc_MAX_UINT8)
}
function predicates-is-negative-uint8-1.3 () {
    ! mmux_uint8_is_negative WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint8-1.1 () {
    mmux_uint8_is_non_positive 0
}
function predicates-is-non-positive-uint8-1.2 () {
    ! mmux_uint8_is_non_positive WW(mmux_libc_MAX_UINT8)
}
function predicates-is-non-positive-uint8-1.3 () {
    mmux_uint8_is_non_positive WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint8-1.1 () {
    mmux_uint8_is_non_negative 0
}
function predicates-is-non-negative-uint8-1.2 () {
    mmux_uint8_is_non_negative WW(mmux_libc_MAX_UINT8)
}
function predicates-is-non-negative-uint8-1.3 () {
    mmux_uint8_is_non_negative WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint8-1.1 () {
    ! mmux_uint8_is_infinite WW(mmux_libc_MAX_UINT8)
}
function predicates-is-infinite-uint8-1.2 () {
    ! mmux_uint8_is_infinite WW(mmux_libc_MIN_UINT8)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint8-1.1 () {
    ! mmux_uint8_is_nan WW(mmux_libc_MAX_UINT8)
}
function predicates-is-nan-uint8-1.2 () {
    ! mmux_uint8_is_nan WW(mmux_libc_MIN_UINT8)
}


#### type variables: sint16

function predicates-is-zero-sint16-1.1 () {
    mmux_sint16_is_zero 0
}
function predicates-is-zero-sint16-1.2 () {
    ! mmux_sint16_is_zero WW(mmux_libc_MAX_SINT16)
}
function predicates-is-zero-sint16-1.3 () {
    ! mmux_sint16_is_zero WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint16-1.1 () {
    ! mmux_sint16_is_positive 0
}
function predicates-is-positive-sint16-1.2 () {
    mmux_sint16_is_positive WW(mmux_libc_MAX_SINT16)
}
function predicates-is-positive-sint16-1.3 () {
    ! mmux_sint16_is_positive WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint16-1.1 () {
    ! mmux_sint16_is_negative 0
}
function predicates-is-negative-sint16-1.2 () {
    ! mmux_sint16_is_negative WW(mmux_libc_MAX_SINT16)
}
function predicates-is-negative-sint16-1.3 () {
    mmux_sint16_is_negative WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint16-1.1 () {
    mmux_sint16_is_non_positive 0
}
function predicates-is-non-positive-sint16-1.2 () {
    ! mmux_sint16_is_non_positive WW(mmux_libc_MAX_SINT16)
}
function predicates-is-non-positive-sint16-1.3 () {
    mmux_sint16_is_non_positive WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint16-1.1 () {
    mmux_sint16_is_non_negative 0
}
function predicates-is-non-negative-sint16-1.2 () {
    mmux_sint16_is_non_negative WW(mmux_libc_MAX_SINT16)
}
function predicates-is-non-negative-sint16-1.3 () {
    ! mmux_sint16_is_non_negative WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint16-1.1 () {
    ! mmux_sint16_is_infinite WW(mmux_libc_MAX_SINT16)
}
function predicates-is-infinite-sint16-1.2 () {
    ! mmux_sint16_is_infinite WW(mmux_libc_MIN_SINT16)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint16-1.1 () {
    ! mmux_sint16_is_nan WW(mmux_libc_MAX_SINT16)
}
function predicates-is-nan-sint16-1.2 () {
    ! mmux_sint16_is_nan WW(mmux_libc_MIN_SINT16)
}


#### type variables: uint16

function predicates-is-zero-uint16-1.1 () {
    mmux_uint16_is_zero 0
}
function predicates-is-zero-uint16-1.2 () {
    ! mmux_uint16_is_zero WW(mmux_libc_MAX_UINT16)
}
function predicates-is-zero-uint16-1.3 () {
    mmux_uint16_is_zero WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint16-1.1 () {
    ! mmux_uint16_is_positive 0
}
function predicates-is-positive-uint16-1.2 () {
    mmux_uint16_is_positive WW(mmux_libc_MAX_UINT16)
}
function predicates-is-positive-uint16-1.3 () {
    ! mmux_uint16_is_positive WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint16-1.1 () {
    ! mmux_uint16_is_negative 0
}
function predicates-is-negative-uint16-1.2 () {
    ! mmux_uint16_is_negative WW(mmux_libc_MAX_UINT16)
}
function predicates-is-negative-uint16-1.3 () {
    ! mmux_uint16_is_negative WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint16-1.1 () {
    mmux_uint16_is_non_positive 0
}
function predicates-is-non-positive-uint16-1.2 () {
    ! mmux_uint16_is_non_positive WW(mmux_libc_MAX_UINT16)
}
function predicates-is-non-positive-uint16-1.3 () {
    mmux_uint16_is_non_positive WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint16-1.1 () {
    mmux_uint16_is_non_negative 0
}
function predicates-is-non-negative-uint16-1.2 () {
    mmux_uint16_is_non_negative WW(mmux_libc_MAX_UINT16)
}
function predicates-is-non-negative-uint16-1.3 () {
    mmux_uint16_is_non_negative WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint16-1.1 () {
    ! mmux_uint16_is_infinite WW(mmux_libc_MAX_UINT16)
}
function predicates-is-infinite-uint16-1.2 () {
    ! mmux_uint16_is_infinite WW(mmux_libc_MIN_UINT16)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint16-1.1 () {
    ! mmux_uint16_is_nan WW(mmux_libc_MAX_UINT16)
}
function predicates-is-nan-uint16-1.2 () {
    ! mmux_uint16_is_nan WW(mmux_libc_MIN_UINT16)
}


#### type variables: sint32

function predicates-is-zero-sint32-1.1 () {
    mmux_sint32_is_zero 0
}
function predicates-is-zero-sint32-1.2 () {
    ! mmux_sint32_is_zero WW(mmux_libc_MAX_SINT32)
}
function predicates-is-zero-sint32-1.3 () {
    ! mmux_sint32_is_zero WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint32-1.1 () {
    ! mmux_sint32_is_positive 0
}
function predicates-is-positive-sint32-1.2 () {
    mmux_sint32_is_positive WW(mmux_libc_MAX_SINT32)
}
function predicates-is-positive-sint32-1.3 () {
    ! mmux_sint32_is_positive WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint32-1.1 () {
    ! mmux_sint32_is_negative 0
}
function predicates-is-negative-sint32-1.2 () {
    ! mmux_sint32_is_negative WW(mmux_libc_MAX_SINT32)
}
function predicates-is-negative-sint32-1.3 () {
    mmux_sint32_is_negative WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint32-1.1 () {
    mmux_sint32_is_non_positive 0
}
function predicates-is-non-positive-sint32-1.2 () {
    ! mmux_sint32_is_non_positive WW(mmux_libc_MAX_SINT32)
}
function predicates-is-non-positive-sint32-1.3 () {
    mmux_sint32_is_non_positive WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint32-1.1 () {
    mmux_sint32_is_non_negative 0
}
function predicates-is-non-negative-sint32-1.2 () {
    mmux_sint32_is_non_negative WW(mmux_libc_MAX_SINT32)
}
function predicates-is-non-negative-sint32-1.3 () {
    ! mmux_sint32_is_non_negative WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint32-1.1 () {
    ! mmux_sint32_is_infinite WW(mmux_libc_MAX_SINT32)
}
function predicates-is-infinite-sint32-1.2 () {
    ! mmux_sint32_is_infinite WW(mmux_libc_MIN_SINT32)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint32-1.1 () {
    ! mmux_sint32_is_nan WW(mmux_libc_MAX_SINT32)
}
function predicates-is-nan-sint32-1.2 () {
    ! mmux_sint32_is_nan WW(mmux_libc_MIN_SINT32)
}


#### type variables: uint32

function predicates-is-zero-uint32-1.1 () {
    mmux_uint32_is_zero 0
}
function predicates-is-zero-uint32-1.2 () {
    ! mmux_uint32_is_zero WW(mmux_libc_MAX_UINT32)
}
function predicates-is-zero-uint32-1.3 () {
    mmux_uint32_is_zero WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint32-1.1 () {
    ! mmux_uint32_is_positive 0
}
function predicates-is-positive-uint32-1.2 () {
    mmux_uint32_is_positive WW(mmux_libc_MAX_UINT32)
}
function predicates-is-positive-uint32-1.3 () {
    ! mmux_uint32_is_positive WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint32-1.1 () {
    ! mmux_uint32_is_negative 0
}
function predicates-is-negative-uint32-1.2 () {
    ! mmux_uint32_is_negative WW(mmux_libc_MAX_UINT32)
}
function predicates-is-negative-uint32-1.3 () {
    ! mmux_uint32_is_negative WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint32-1.1 () {
    mmux_uint32_is_non_positive 0
}
function predicates-is-non-positive-uint32-1.2 () {
    ! mmux_uint32_is_non_positive WW(mmux_libc_MAX_UINT32)
}
function predicates-is-non-positive-uint32-1.3 () {
    mmux_uint32_is_non_positive WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint32-1.1 () {
    mmux_uint32_is_non_negative 0
}
function predicates-is-non-negative-uint32-1.2 () {
    mmux_uint32_is_non_negative WW(mmux_libc_MAX_UINT32)
}
function predicates-is-non-negative-uint32-1.3 () {
    mmux_uint32_is_non_negative WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint32-1.1 () {
    ! mmux_uint32_is_infinite WW(mmux_libc_MAX_UINT32)
}
function predicates-is-infinite-uint32-1.2 () {
    ! mmux_uint32_is_infinite WW(mmux_libc_MIN_UINT32)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint32-1.1 () {
    ! mmux_uint32_is_nan WW(mmux_libc_MAX_UINT32)
}
function predicates-is-nan-uint32-1.2 () {
    ! mmux_uint32_is_nan WW(mmux_libc_MIN_UINT32)
}


#### type variables: sint64

function predicates-is-zero-sint64-1.1 () {
    mmux_sint64_is_zero 0
}
function predicates-is-zero-sint64-1.2 () {
    ! mmux_sint64_is_zero WW(mmux_libc_MAX_SINT64)
}
function predicates-is-zero-sint64-1.3 () {
    ! mmux_sint64_is_zero WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sint64-1.1 () {
    ! mmux_sint64_is_positive 0
}
function predicates-is-positive-sint64-1.2 () {
    mmux_sint64_is_positive WW(mmux_libc_MAX_SINT64)
}
function predicates-is-positive-sint64-1.3 () {
    ! mmux_sint64_is_positive WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sint64-1.1 () {
    ! mmux_sint64_is_negative 0
}
function predicates-is-negative-sint64-1.2 () {
    ! mmux_sint64_is_negative WW(mmux_libc_MAX_SINT64)
}
function predicates-is-negative-sint64-1.3 () {
    mmux_sint64_is_negative WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sint64-1.1 () {
    mmux_sint64_is_non_positive 0
}
function predicates-is-non-positive-sint64-1.2 () {
    ! mmux_sint64_is_non_positive WW(mmux_libc_MAX_SINT64)
}
function predicates-is-non-positive-sint64-1.3 () {
    mmux_sint64_is_non_positive WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sint64-1.1 () {
    mmux_sint64_is_non_negative 0
}
function predicates-is-non-negative-sint64-1.2 () {
    mmux_sint64_is_non_negative WW(mmux_libc_MAX_SINT64)
}
function predicates-is-non-negative-sint64-1.3 () {
    ! mmux_sint64_is_non_negative WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sint64-1.1 () {
    ! mmux_sint64_is_infinite WW(mmux_libc_MAX_SINT64)
}
function predicates-is-infinite-sint64-1.2 () {
    ! mmux_sint64_is_infinite WW(mmux_libc_MIN_SINT64)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sint64-1.1 () {
    ! mmux_sint64_is_nan WW(mmux_libc_MAX_SINT64)
}
function predicates-is-nan-sint64-1.2 () {
    ! mmux_sint64_is_nan WW(mmux_libc_MIN_SINT64)
}


#### type variables: uint64

function predicates-is-zero-uint64-1.1 () {
    mmux_uint64_is_zero 0
}
function predicates-is-zero-uint64-1.2 () {
    ! mmux_uint64_is_zero WW(mmux_libc_MAX_UINT64)
}
function predicates-is-zero-uint64-1.3 () {
    mmux_uint64_is_zero WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uint64-1.1 () {
    ! mmux_uint64_is_positive 0
}
function predicates-is-positive-uint64-1.2 () {
    mmux_uint64_is_positive WW(mmux_libc_MAX_UINT64)
}
function predicates-is-positive-uint64-1.3 () {
    ! mmux_uint64_is_positive WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uint64-1.1 () {
    ! mmux_uint64_is_negative 0
}
function predicates-is-negative-uint64-1.2 () {
    ! mmux_uint64_is_negative WW(mmux_libc_MAX_UINT64)
}
function predicates-is-negative-uint64-1.3 () {
    ! mmux_uint64_is_negative WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uint64-1.1 () {
    mmux_uint64_is_non_positive 0
}
function predicates-is-non-positive-uint64-1.2 () {
    ! mmux_uint64_is_non_positive WW(mmux_libc_MAX_UINT64)
}
function predicates-is-non-positive-uint64-1.3 () {
    mmux_uint64_is_non_positive WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uint64-1.1 () {
    mmux_uint64_is_non_negative 0
}
function predicates-is-non-negative-uint64-1.2 () {
    mmux_uint64_is_non_negative WW(mmux_libc_MAX_UINT64)
}
function predicates-is-non-negative-uint64-1.3 () {
    mmux_uint64_is_non_negative WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uint64-1.1 () {
    ! mmux_uint64_is_infinite WW(mmux_libc_MAX_UINT64)
}
function predicates-is-infinite-uint64-1.2 () {
    ! mmux_uint64_is_infinite WW(mmux_libc_MIN_UINT64)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uint64-1.1 () {
    ! mmux_uint64_is_nan WW(mmux_libc_MAX_UINT64)
}
function predicates-is-nan-uint64-1.2 () {
    ! mmux_uint64_is_nan WW(mmux_libc_MIN_UINT64)
}


#### type variables: sintmax

function predicates-is-zero-sintmax-1.1 () {
    mmux_sintmax_is_zero 0
}
function predicates-is-zero-sintmax-1.2 () {
    ! mmux_sintmax_is_zero WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-zero-sintmax-1.3 () {
    ! mmux_sintmax_is_zero WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sintmax-1.1 () {
    ! mmux_sintmax_is_positive 0
}
function predicates-is-positive-sintmax-1.2 () {
    mmux_sintmax_is_positive WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-positive-sintmax-1.3 () {
    ! mmux_sintmax_is_positive WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sintmax-1.1 () {
    ! mmux_sintmax_is_negative 0
}
function predicates-is-negative-sintmax-1.2 () {
    ! mmux_sintmax_is_negative WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-negative-sintmax-1.3 () {
    mmux_sintmax_is_negative WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sintmax-1.1 () {
    mmux_sintmax_is_non_positive 0
}
function predicates-is-non-positive-sintmax-1.2 () {
    ! mmux_sintmax_is_non_positive WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-non-positive-sintmax-1.3 () {
    mmux_sintmax_is_non_positive WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sintmax-1.1 () {
    mmux_sintmax_is_non_negative 0
}
function predicates-is-non-negative-sintmax-1.2 () {
    mmux_sintmax_is_non_negative WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-non-negative-sintmax-1.3 () {
    ! mmux_sintmax_is_non_negative WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sintmax-1.1 () {
    ! mmux_sintmax_is_infinite WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-infinite-sintmax-1.2 () {
    ! mmux_sintmax_is_infinite WW(mmux_libc_MIN_SINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sintmax-1.1 () {
    ! mmux_sintmax_is_nan WW(mmux_libc_MAX_SINTMAX)
}
function predicates-is-nan-sintmax-1.2 () {
    ! mmux_sintmax_is_nan WW(mmux_libc_MIN_SINTMAX)
}


#### type variables: uintmax

function predicates-is-zero-uintmax-1.1 () {
    mmux_uintmax_is_zero 0
}
function predicates-is-zero-uintmax-1.2 () {
    ! mmux_uintmax_is_zero WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-zero-uintmax-1.3 () {
    mmux_uintmax_is_zero WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uintmax-1.1 () {
    ! mmux_uintmax_is_positive 0
}
function predicates-is-positive-uintmax-1.2 () {
    mmux_uintmax_is_positive WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-positive-uintmax-1.3 () {
    ! mmux_uintmax_is_positive WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uintmax-1.1 () {
    ! mmux_uintmax_is_negative 0
}
function predicates-is-negative-uintmax-1.2 () {
    ! mmux_uintmax_is_negative WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-negative-uintmax-1.3 () {
    ! mmux_uintmax_is_negative WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uintmax-1.1 () {
    mmux_uintmax_is_non_positive 0
}
function predicates-is-non-positive-uintmax-1.2 () {
    ! mmux_uintmax_is_non_positive WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-non-positive-uintmax-1.3 () {
    mmux_uintmax_is_non_positive WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uintmax-1.1 () {
    mmux_uintmax_is_non_negative 0
}
function predicates-is-non-negative-uintmax-1.2 () {
    mmux_uintmax_is_non_negative WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-non-negative-uintmax-1.3 () {
    mmux_uintmax_is_non_negative WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uintmax-1.1 () {
    ! mmux_uintmax_is_infinite WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-infinite-uintmax-1.2 () {
    ! mmux_uintmax_is_infinite WW(mmux_libc_MIN_UINTMAX)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uintmax-1.1 () {
    ! mmux_uintmax_is_nan WW(mmux_libc_MAX_UINTMAX)
}
function predicates-is-nan-uintmax-1.2 () {
    ! mmux_uintmax_is_nan WW(mmux_libc_MIN_UINTMAX)
}


#### type variables: sintptr

function predicates-is-zero-sintptr-1.1 () {
    mmux_sintptr_is_zero 0
}
function predicates-is-zero-sintptr-1.2 () {
    ! mmux_sintptr_is_zero WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-zero-sintptr-1.3 () {
    ! mmux_sintptr_is_zero WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-positive-sintptr-1.1 () {
    ! mmux_sintptr_is_positive 0
}
function predicates-is-positive-sintptr-1.2 () {
    mmux_sintptr_is_positive WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-positive-sintptr-1.3 () {
    ! mmux_sintptr_is_positive WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-negative-sintptr-1.1 () {
    ! mmux_sintptr_is_negative 0
}
function predicates-is-negative-sintptr-1.2 () {
    ! mmux_sintptr_is_negative WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-negative-sintptr-1.3 () {
    mmux_sintptr_is_negative WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-sintptr-1.1 () {
    mmux_sintptr_is_non_positive 0
}
function predicates-is-non-positive-sintptr-1.2 () {
    ! mmux_sintptr_is_non_positive WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-non-positive-sintptr-1.3 () {
    mmux_sintptr_is_non_positive WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-sintptr-1.1 () {
    mmux_sintptr_is_non_negative 0
}
function predicates-is-non-negative-sintptr-1.2 () {
    mmux_sintptr_is_non_negative WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-non-negative-sintptr-1.3 () {
    ! mmux_sintptr_is_non_negative WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-sintptr-1.1 () {
    ! mmux_sintptr_is_infinite WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-infinite-sintptr-1.2 () {
    ! mmux_sintptr_is_infinite WW(mmux_libc_MIN_SINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-nan-sintptr-1.1 () {
    ! mmux_sintptr_is_nan WW(mmux_libc_MAX_SINTPTR)
}
function predicates-is-nan-sintptr-1.2 () {
    ! mmux_sintptr_is_nan WW(mmux_libc_MIN_SINTPTR)
}


#### type variables: uintptr

function predicates-is-zero-uintptr-1.1 () {
    mmux_uintptr_is_zero 0
}
function predicates-is-zero-uintptr-1.2 () {
    ! mmux_uintptr_is_zero WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-zero-uintptr-1.3 () {
    mmux_uintptr_is_zero WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uintptr-1.1 () {
    ! mmux_uintptr_is_positive 0
}
function predicates-is-positive-uintptr-1.2 () {
    mmux_uintptr_is_positive WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-positive-uintptr-1.3 () {
    ! mmux_uintptr_is_positive WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uintptr-1.1 () {
    ! mmux_uintptr_is_negative 0
}
function predicates-is-negative-uintptr-1.2 () {
    ! mmux_uintptr_is_negative WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-negative-uintptr-1.3 () {
    ! mmux_uintptr_is_negative WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uintptr-1.1 () {
    mmux_uintptr_is_non_positive 0
}
function predicates-is-non-positive-uintptr-1.2 () {
    ! mmux_uintptr_is_non_positive WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-non-positive-uintptr-1.3 () {
    mmux_uintptr_is_non_positive WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uintptr-1.1 () {
    mmux_uintptr_is_non_negative 0
}
function predicates-is-non-negative-uintptr-1.2 () {
    mmux_uintptr_is_non_negative WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-non-negative-uintptr-1.3 () {
    mmux_uintptr_is_non_negative WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uintptr-1.1 () {
    ! mmux_uintptr_is_infinite WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-infinite-uintptr-1.2 () {
    ! mmux_uintptr_is_infinite WW(mmux_libc_MIN_UINTPTR)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uintptr-1.1 () {
    ! mmux_uintptr_is_nan WW(mmux_libc_MAX_UINTPTR)
}
function predicates-is-nan-uintptr-1.2 () {
    ! mmux_uintptr_is_nan WW(mmux_libc_MIN_UINTPTR)
}


#### type variables: ptrdiff

function predicates-is-zero-ptrdiff-1.1 () {
    mmux_ptrdiff_is_zero 0
}
function predicates-is-zero-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_zero WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-zero-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_zero WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-positive-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_positive 0
}
function predicates-is-positive-ptrdiff-1.2 () {
    mmux_ptrdiff_is_positive WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-positive-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_positive WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-negative-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_negative 0
}
function predicates-is-negative-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_negative WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-negative-ptrdiff-1.3 () {
    mmux_ptrdiff_is_negative WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-ptrdiff-1.1 () {
    mmux_ptrdiff_is_non_positive 0
}
function predicates-is-non-positive-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_non_positive WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-non-positive-ptrdiff-1.3 () {
    mmux_ptrdiff_is_non_positive WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-ptrdiff-1.1 () {
    mmux_ptrdiff_is_non_negative 0
}
function predicates-is-non-negative-ptrdiff-1.2 () {
    mmux_ptrdiff_is_non_negative WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-non-negative-ptrdiff-1.3 () {
    ! mmux_ptrdiff_is_non_negative WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_infinite WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-infinite-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_infinite WW(mmux_libc_MIN_PTRDIFF)
}

### ------------------------------------------------------------------------

function predicates-is-nan-ptrdiff-1.1 () {
    ! mmux_ptrdiff_is_nan WW(mmux_libc_MAX_PTRDIFF)
}
function predicates-is-nan-ptrdiff-1.2 () {
    ! mmux_ptrdiff_is_nan WW(mmux_libc_MIN_PTRDIFF)
}


#### type variables: off

function predicates-is-zero-off-1.1 () {
    mmux_off_is_zero 0
}
function predicates-is-zero-off-1.2 () {
    ! mmux_off_is_zero WW(mmux_libc_MAX_OFF)
}
function predicates-is-zero-off-1.3 () {
    ! mmux_off_is_zero WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-positive-off-1.1 () {
    ! mmux_off_is_positive 0
}
function predicates-is-positive-off-1.2 () {
    mmux_off_is_positive WW(mmux_libc_MAX_OFF)
}
function predicates-is-positive-off-1.3 () {
    ! mmux_off_is_positive WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-negative-off-1.1 () {
    ! mmux_off_is_negative 0
}
function predicates-is-negative-off-1.2 () {
    ! mmux_off_is_negative WW(mmux_libc_MAX_OFF)
}
function predicates-is-negative-off-1.3 () {
    mmux_off_is_negative WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-off-1.1 () {
    mmux_off_is_non_positive 0
}
function predicates-is-non-positive-off-1.2 () {
    ! mmux_off_is_non_positive WW(mmux_libc_MAX_OFF)
}
function predicates-is-non-positive-off-1.3 () {
    mmux_off_is_non_positive WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-off-1.1 () {
    mmux_off_is_non_negative 0
}
function predicates-is-non-negative-off-1.2 () {
    mmux_off_is_non_negative WW(mmux_libc_MAX_OFF)
}
function predicates-is-non-negative-off-1.3 () {
    ! mmux_off_is_non_negative WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-off-1.1 () {
    ! mmux_off_is_infinite WW(mmux_libc_MAX_OFF)
}
function predicates-is-infinite-off-1.2 () {
    ! mmux_off_is_infinite WW(mmux_libc_MIN_OFF)
}

### ------------------------------------------------------------------------

function predicates-is-nan-off-1.1 () {
    ! mmux_off_is_nan WW(mmux_libc_MAX_OFF)
}
function predicates-is-nan-off-1.2 () {
    ! mmux_off_is_nan WW(mmux_libc_MIN_OFF)
}


#### type variables: pid

function predicates-is-zero-pid-1.1 () {
    mmux_pid_is_zero 0
}
function predicates-is-zero-pid-1.2 () {
    ! mmux_pid_is_zero WW(mmux_libc_MAX_PID)
}
function predicates-is-zero-pid-1.3 () {
    ! mmux_pid_is_zero WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-positive-pid-1.1 () {
    ! mmux_pid_is_positive 0
}
function predicates-is-positive-pid-1.2 () {
    mmux_pid_is_positive WW(mmux_libc_MAX_PID)
}
function predicates-is-positive-pid-1.3 () {
    ! mmux_pid_is_positive WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-negative-pid-1.1 () {
    ! mmux_pid_is_negative 0
}
function predicates-is-negative-pid-1.2 () {
    ! mmux_pid_is_negative WW(mmux_libc_MAX_PID)
}
function predicates-is-negative-pid-1.3 () {
    mmux_pid_is_negative WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-pid-1.1 () {
    mmux_pid_is_non_positive 0
}
function predicates-is-non-positive-pid-1.2 () {
    ! mmux_pid_is_non_positive WW(mmux_libc_MAX_PID)
}
function predicates-is-non-positive-pid-1.3 () {
    mmux_pid_is_non_positive WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-pid-1.1 () {
    mmux_pid_is_non_negative 0
}
function predicates-is-non-negative-pid-1.2 () {
    mmux_pid_is_non_negative WW(mmux_libc_MAX_PID)
}
function predicates-is-non-negative-pid-1.3 () {
    ! mmux_pid_is_non_negative WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-pid-1.1 () {
    ! mmux_pid_is_infinite WW(mmux_libc_MAX_PID)
}
function predicates-is-infinite-pid-1.2 () {
    ! mmux_pid_is_infinite WW(mmux_libc_MIN_PID)
}

### ------------------------------------------------------------------------

function predicates-is-nan-pid-1.1 () {
    ! mmux_pid_is_nan WW(mmux_libc_MAX_PID)
}
function predicates-is-nan-pid-1.2 () {
    ! mmux_pid_is_nan WW(mmux_libc_MIN_PID)
}


#### type variables: uid

function predicates-is-zero-uid-1.1 () {
    mmux_uid_is_zero 0
}
function predicates-is-zero-uid-1.2 () {
    ! mmux_uid_is_zero WW(mmux_libc_MAX_UID)
}
function predicates-is-zero-uid-1.3 () {
    mmux_uid_is_zero WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-positive-uid-1.1 () {
    ! mmux_uid_is_positive 0
}
function predicates-is-positive-uid-1.2 () {
    mmux_uid_is_positive WW(mmux_libc_MAX_UID)
}
function predicates-is-positive-uid-1.3 () {
    ! mmux_uid_is_positive WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-negative-uid-1.1 () {
    ! mmux_uid_is_negative 0
}
function predicates-is-negative-uid-1.2 () {
    ! mmux_uid_is_negative WW(mmux_libc_MAX_UID)
}
function predicates-is-negative-uid-1.3 () {
    ! mmux_uid_is_negative WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-uid-1.1 () {
    mmux_uid_is_non_positive 0
}
function predicates-is-non-positive-uid-1.2 () {
    ! mmux_uid_is_non_positive WW(mmux_libc_MAX_UID)
}
function predicates-is-non-positive-uid-1.3 () {
    mmux_uid_is_non_positive WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-uid-1.1 () {
    mmux_uid_is_non_negative 0
}
function predicates-is-non-negative-uid-1.2 () {
    mmux_uid_is_non_negative WW(mmux_libc_MAX_UID)
}
function predicates-is-non-negative-uid-1.3 () {
    mmux_uid_is_non_negative WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-uid-1.1 () {
    ! mmux_uid_is_infinite WW(mmux_libc_MAX_UID)
}
function predicates-is-infinite-uid-1.2 () {
    ! mmux_uid_is_infinite WW(mmux_libc_MIN_UID)
}

### ------------------------------------------------------------------------

function predicates-is-nan-uid-1.1 () {
    ! mmux_uid_is_nan WW(mmux_libc_MAX_UID)
}
function predicates-is-nan-uid-1.2 () {
    ! mmux_uid_is_nan WW(mmux_libc_MIN_UID)
}


#### type variables: gid

function predicates-is-zero-gid-1.1 () {
    mmux_gid_is_zero 0
}
function predicates-is-zero-gid-1.2 () {
    ! mmux_gid_is_zero WW(mmux_libc_MAX_GID)
}
function predicates-is-zero-gid-1.3 () {
    mmux_gid_is_zero WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-positive-gid-1.1 () {
    ! mmux_gid_is_positive 0
}
function predicates-is-positive-gid-1.2 () {
    mmux_gid_is_positive WW(mmux_libc_MAX_GID)
}
function predicates-is-positive-gid-1.3 () {
    ! mmux_gid_is_positive WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-negative-gid-1.1 () {
    ! mmux_gid_is_negative 0
}
function predicates-is-negative-gid-1.2 () {
    ! mmux_gid_is_negative WW(mmux_libc_MAX_GID)
}
function predicates-is-negative-gid-1.3 () {
    ! mmux_gid_is_negative WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-gid-1.1 () {
    mmux_gid_is_non_positive 0
}
function predicates-is-non-positive-gid-1.2 () {
    ! mmux_gid_is_non_positive WW(mmux_libc_MAX_GID)
}
function predicates-is-non-positive-gid-1.3 () {
    mmux_gid_is_non_positive WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-gid-1.1 () {
    mmux_gid_is_non_negative 0
}
function predicates-is-non-negative-gid-1.2 () {
    mmux_gid_is_non_negative WW(mmux_libc_MAX_GID)
}
function predicates-is-non-negative-gid-1.3 () {
    mmux_gid_is_non_negative WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-gid-1.1 () {
    ! mmux_gid_is_infinite WW(mmux_libc_MAX_GID)
}
function predicates-is-infinite-gid-1.2 () {
    ! mmux_gid_is_infinite WW(mmux_libc_MIN_GID)
}

### ------------------------------------------------------------------------

function predicates-is-nan-gid-1.1 () {
    ! mmux_gid_is_nan WW(mmux_libc_MAX_GID)
}
function predicates-is-nan-gid-1.2 () {
    ! mmux_gid_is_nan WW(mmux_libc_MIN_GID)
}


#### type variables: wchar

function predicates-is-zero-wchar-1.1 () {
    mmux_wchar_is_zero 0
}
function predicates-is-zero-wchar-1.2 () {
    ! mmux_wchar_is_zero WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-zero-wchar-1.3 () {
    ! mmux_wchar_is_zero WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-positive-wchar-1.1 () {
    ! mmux_wchar_is_positive 0
}
function predicates-is-positive-wchar-1.2 () {
    mmux_wchar_is_positive WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-positive-wchar-1.3 () {
    ! mmux_wchar_is_positive WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-negative-wchar-1.1 () {
    ! mmux_wchar_is_negative 0
}
function predicates-is-negative-wchar-1.2 () {
    ! mmux_wchar_is_negative WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-negative-wchar-1.3 () {
    mmux_wchar_is_negative WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-wchar-1.1 () {
    mmux_wchar_is_non_positive 0
}
function predicates-is-non-positive-wchar-1.2 () {
    ! mmux_wchar_is_non_positive WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-non-positive-wchar-1.3 () {
    mmux_wchar_is_non_positive WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-wchar-1.1 () {
    mmux_wchar_is_non_negative 0
}
function predicates-is-non-negative-wchar-1.2 () {
    mmux_wchar_is_non_negative WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-non-negative-wchar-1.3 () {
    ! mmux_wchar_is_non_negative WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-wchar-1.1 () {
    ! mmux_wchar_is_infinite WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-infinite-wchar-1.2 () {
    ! mmux_wchar_is_infinite WW(mmux_libc_MIN_WCHAR)
}

### ------------------------------------------------------------------------

function predicates-is-nan-wchar-1.1 () {
    ! mmux_wchar_is_nan WW(mmux_libc_MAX_WCHAR)
}
function predicates-is-nan-wchar-1.2 () {
    ! mmux_wchar_is_nan WW(mmux_libc_MIN_WCHAR)
}


#### type variables: wint

function predicates-is-zero-wint-1.1 () {
    mmux_wint_is_zero 0
}
function predicates-is-zero-wint-1.2 () {
    ! mmux_wint_is_zero WW(mmux_libc_MAX_WINT)
}
function predicates-is-zero-wint-1.3 () {
    mmux_wint_is_zero WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-positive-wint-1.1 () {
    ! mmux_wint_is_positive 0
}
function predicates-is-positive-wint-1.2 () {
    mmux_wint_is_positive WW(mmux_libc_MAX_WINT)
}
function predicates-is-positive-wint-1.3 () {
    ! mmux_wint_is_positive WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-negative-wint-1.1 () {
    ! mmux_wint_is_negative 0
}
function predicates-is-negative-wint-1.2 () {
    ! mmux_wint_is_negative WW(mmux_libc_MAX_WINT)
}
function predicates-is-negative-wint-1.3 () {
    ! mmux_wint_is_negative WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-positive-wint-1.1 () {
    mmux_wint_is_non_positive 0
}
function predicates-is-non-positive-wint-1.2 () {
    ! mmux_wint_is_non_positive WW(mmux_libc_MAX_WINT)
}
function predicates-is-non-positive-wint-1.3 () {
    mmux_wint_is_non_positive WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-non-negative-wint-1.1 () {
    mmux_wint_is_non_negative 0
}
function predicates-is-non-negative-wint-1.2 () {
    mmux_wint_is_non_negative WW(mmux_libc_MAX_WINT)
}
function predicates-is-non-negative-wint-1.3 () {
    mmux_wint_is_non_negative WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-wint-1.1 () {
    ! mmux_wint_is_infinite WW(mmux_libc_MAX_WINT)
}
function predicates-is-infinite-wint-1.2 () {
    ! mmux_wint_is_infinite WW(mmux_libc_MIN_WINT)
}

### ------------------------------------------------------------------------

function predicates-is-nan-wint-1.1 () {
    ! mmux_wint_is_nan WW(mmux_libc_MAX_WINT)
}
function predicates-is-nan-wint-1.2 () {
    ! mmux_wint_is_nan WW(mmux_libc_MIN_WINT)
}


#### type variables: float

function predicates-is-zero-float-1.1 () {
    mmux_float_is_zero 0
}
function predicates-is-zero-float-1.2 () {
    ! mmux_float_is_zero WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-zero-float-1.3 () {
    ! mmux_float_is_zero WW(mmux_libc_MIN_FLOAT)
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
    mmux_float_is_positive WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-positive-float-1.3 () {
    ! mmux_float_is_positive WW(mmux_libc_MIN_FLOAT)
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
    ! mmux_float_is_negative WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-negative-float-1.3 () {
    mmux_float_is_negative WW(mmux_libc_MIN_FLOAT)
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
    ! mmux_float_is_non_positive WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-non-positive-float-1.3 () {
    mmux_float_is_non_positive WW(mmux_libc_MIN_FLOAT)
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
    mmux_float_is_non_negative WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-non-negative-float-1.3 () {
    ! mmux_float_is_non_negative WW(mmux_libc_MIN_FLOAT)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float-1.1 () {
    ! mmux_float_is_infinite WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-infinite-float-1.2 () {
    ! mmux_float_is_infinite WW(mmux_libc_MIN_FLOAT)
}
function predicates-is-infinite-float-1.3 () {
    mmux_float_is_infinite '+inf'
}
function predicates-is-infinite-float-1.4 () {
    mmux_float_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float-1.1 () {
    ! mmux_float_is_nan WW(mmux_libc_MAX_FLOAT)
}
function predicates-is-nan-float-1.2 () {
    ! mmux_float_is_nan WW(mmux_libc_MIN_FLOAT)
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
    ! mmux_double_is_zero WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-zero-double-1.3 () {
    ! mmux_double_is_zero WW(mmux_libc_MIN_DOUBLE)
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
    mmux_double_is_positive WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-positive-double-1.3 () {
    ! mmux_double_is_positive WW(mmux_libc_MIN_DOUBLE)
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
    ! mmux_double_is_negative WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-negative-double-1.3 () {
    mmux_double_is_negative WW(mmux_libc_MIN_DOUBLE)
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
    ! mmux_double_is_non_positive WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-non-positive-double-1.3 () {
    mmux_double_is_non_positive WW(mmux_libc_MIN_DOUBLE)
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
    mmux_double_is_non_negative WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-non-negative-double-1.3 () {
    ! mmux_double_is_non_negative WW(mmux_libc_MIN_DOUBLE)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-double-1.1 () {
    ! mmux_double_is_infinite WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-infinite-double-1.2 () {
    ! mmux_double_is_infinite WW(mmux_libc_MIN_DOUBLE)
}
function predicates-is-infinite-double-1.3 () {
    mmux_double_is_infinite '+inf'
}
function predicates-is-infinite-double-1.4 () {
    mmux_double_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-double-1.1 () {
    ! mmux_double_is_nan WW(mmux_libc_MAX_DOUBLE)
}
function predicates-is-nan-double-1.2 () {
    ! mmux_double_is_nan WW(mmux_libc_MIN_DOUBLE)
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
    ! mmux_ldouble_is_zero WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-zero-ldouble-1.3 () {
    ! mmux_ldouble_is_zero WW(mmux_libc_MIN_LDOUBLE)
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
    mmux_ldouble_is_positive WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-positive-ldouble-1.3 () {
    ! mmux_ldouble_is_positive WW(mmux_libc_MIN_LDOUBLE)
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
    ! mmux_ldouble_is_negative WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-negative-ldouble-1.3 () {
    mmux_ldouble_is_negative WW(mmux_libc_MIN_LDOUBLE)
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
    ! mmux_ldouble_is_non_positive WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-non-positive-ldouble-1.3 () {
    mmux_ldouble_is_non_positive WW(mmux_libc_MIN_LDOUBLE)
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
    mmux_ldouble_is_non_negative WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-non-negative-ldouble-1.3 () {
    ! mmux_ldouble_is_non_negative WW(mmux_libc_MIN_LDOUBLE)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-ldouble-1.1 () {
    ! mmux_ldouble_is_infinite WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-infinite-ldouble-1.2 () {
    ! mmux_ldouble_is_infinite WW(mmux_libc_MIN_LDOUBLE)
}
function predicates-is-infinite-ldouble-1.3 () {
    mmux_ldouble_is_infinite '+inf'
}
function predicates-is-infinite-ldouble-1.4 () {
    mmux_ldouble_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-ldouble-1.1 () {
    ! mmux_ldouble_is_nan WW(mmux_libc_MAX_LDOUBLE)
}
function predicates-is-nan-ldouble-1.2 () {
    ! mmux_ldouble_is_nan WW(mmux_libc_MIN_LDOUBLE)
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

if test -v mmux_libc_SIZEOF_FLOAT32
then

function predicates-is-zero-float32-1.1 () {
    mmux_float32_is_zero 0
}
function predicates-is-zero-float32-1.2 () {
    ! mmux_float32_is_zero WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-zero-float32-1.3 () {
    ! mmux_float32_is_zero WW(mmux_libc_MIN_FLOAT32)
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
    mmux_float32_is_positive WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-positive-float32-1.3 () {
    ! mmux_float32_is_positive WW(mmux_libc_MIN_FLOAT32)
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
    ! mmux_float32_is_negative WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-negative-float32-1.3 () {
    mmux_float32_is_negative WW(mmux_libc_MIN_FLOAT32)
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
    ! mmux_float32_is_non_positive WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-non-positive-float32-1.3 () {
    mmux_float32_is_non_positive WW(mmux_libc_MIN_FLOAT32)
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
    mmux_float32_is_non_negative WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-non-negative-float32-1.3 () {
    ! mmux_float32_is_non_negative WW(mmux_libc_MIN_FLOAT32)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float32-1.1 () {
    ! mmux_float32_is_infinite WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-infinite-float32-1.2 () {
    ! mmux_float32_is_infinite WW(mmux_libc_MIN_FLOAT32)
}
function predicates-is-infinite-float32-1.3 () {
    mmux_float32_is_infinite '+inf'
}
function predicates-is-infinite-float32-1.4 () {
    mmux_float32_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float32-1.1 () {
    ! mmux_float32_is_nan WW(mmux_libc_MAX_FLOAT32)
}
function predicates-is-nan-float32-1.2 () {
    ! mmux_float32_is_nan WW(mmux_libc_MIN_FLOAT32)
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

if test -v mmux_libc_SIZEOF_FLOAT64
then

function predicates-is-zero-float64-1.1 () {
    mmux_float64_is_zero 0
}
function predicates-is-zero-float64-1.2 () {
    ! mmux_float64_is_zero WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-zero-float64-1.3 () {
    ! mmux_float64_is_zero WW(mmux_libc_MIN_FLOAT64)
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
    mmux_float64_is_positive WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-positive-float64-1.3 () {
    ! mmux_float64_is_positive WW(mmux_libc_MIN_FLOAT64)
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
    ! mmux_float64_is_negative WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-negative-float64-1.3 () {
    mmux_float64_is_negative WW(mmux_libc_MIN_FLOAT64)
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
    ! mmux_float64_is_non_positive WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-non-positive-float64-1.3 () {
    mmux_float64_is_non_positive WW(mmux_libc_MIN_FLOAT64)
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
    mmux_float64_is_non_negative WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-non-negative-float64-1.3 () {
    ! mmux_float64_is_non_negative WW(mmux_libc_MIN_FLOAT64)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float64-1.1 () {
    ! mmux_float64_is_infinite WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-infinite-float64-1.2 () {
    ! mmux_float64_is_infinite WW(mmux_libc_MIN_FLOAT64)
}
function predicates-is-infinite-float64-1.3 () {
    mmux_float64_is_infinite '+inf'
}
function predicates-is-infinite-float64-1.4 () {
    mmux_float64_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float64-1.1 () {
    ! mmux_float64_is_nan WW(mmux_libc_MAX_FLOAT64)
}
function predicates-is-nan-float64-1.2 () {
    ! mmux_float64_is_nan WW(mmux_libc_MIN_FLOAT64)
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

if test -v mmux_libc_SIZEOF_FLOAT128
then

function predicates-is-zero-float128-1.1 () {
    mmux_float128_is_zero 0
}
function predicates-is-zero-float128-1.2 () {
    ! mmux_float128_is_zero WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-zero-float128-1.3 () {
    ! mmux_float128_is_zero WW(mmux_libc_MIN_FLOAT128)
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
    mmux_float128_is_positive WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-positive-float128-1.3 () {
    ! mmux_float128_is_positive WW(mmux_libc_MIN_FLOAT128)
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
    ! mmux_float128_is_negative WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-negative-float128-1.3 () {
    mmux_float128_is_negative WW(mmux_libc_MIN_FLOAT128)
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
    ! mmux_float128_is_non_positive WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-non-positive-float128-1.3 () {
    mmux_float128_is_non_positive WW(mmux_libc_MIN_FLOAT128)
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
    mmux_float128_is_non_negative WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-non-negative-float128-1.3 () {
    ! mmux_float128_is_non_negative WW(mmux_libc_MIN_FLOAT128)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float128-1.1 () {
    ! mmux_float128_is_infinite WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-infinite-float128-1.2 () {
    ! mmux_float128_is_infinite WW(mmux_libc_MIN_FLOAT128)
}
function predicates-is-infinite-float128-1.3 () {
    mmux_float128_is_infinite '+inf'
}
function predicates-is-infinite-float128-1.4 () {
    mmux_float128_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float128-1.1 () {
    ! mmux_float128_is_nan WW(mmux_libc_MAX_FLOAT128)
}
function predicates-is-nan-float128-1.2 () {
    ! mmux_float128_is_nan WW(mmux_libc_MIN_FLOAT128)
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

if test -v mmux_libc_SIZEOF_FLOAT32X
then

function predicates-is-zero-float32x-1.1 () {
    mmux_float32x_is_zero 0
}
function predicates-is-zero-float32x-1.2 () {
    ! mmux_float32x_is_zero WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-zero-float32x-1.3 () {
    ! mmux_float32x_is_zero WW(mmux_libc_MIN_FLOAT32X)
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
    mmux_float32x_is_positive WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-positive-float32x-1.3 () {
    ! mmux_float32x_is_positive WW(mmux_libc_MIN_FLOAT32X)
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
    ! mmux_float32x_is_negative WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-negative-float32x-1.3 () {
    mmux_float32x_is_negative WW(mmux_libc_MIN_FLOAT32X)
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
    ! mmux_float32x_is_non_positive WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-non-positive-float32x-1.3 () {
    mmux_float32x_is_non_positive WW(mmux_libc_MIN_FLOAT32X)
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
    mmux_float32x_is_non_negative WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-non-negative-float32x-1.3 () {
    ! mmux_float32x_is_non_negative WW(mmux_libc_MIN_FLOAT32X)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float32x-1.1 () {
    ! mmux_float32x_is_infinite WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-infinite-float32x-1.2 () {
    ! mmux_float32x_is_infinite WW(mmux_libc_MIN_FLOAT32X)
}
function predicates-is-infinite-float32x-1.3 () {
    mmux_float32x_is_infinite '+inf'
}
function predicates-is-infinite-float32x-1.4 () {
    mmux_float32x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float32x-1.1 () {
    ! mmux_float32x_is_nan WW(mmux_libc_MAX_FLOAT32X)
}
function predicates-is-nan-float32x-1.2 () {
    ! mmux_float32x_is_nan WW(mmux_libc_MIN_FLOAT32X)
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

if test -v mmux_libc_SIZEOF_FLOAT64X
then

function predicates-is-zero-float64x-1.1 () {
    mmux_float64x_is_zero 0
}
function predicates-is-zero-float64x-1.2 () {
    ! mmux_float64x_is_zero WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-zero-float64x-1.3 () {
    ! mmux_float64x_is_zero WW(mmux_libc_MIN_FLOAT64X)
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
    mmux_float64x_is_positive WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-positive-float64x-1.3 () {
    ! mmux_float64x_is_positive WW(mmux_libc_MIN_FLOAT64X)
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
    ! mmux_float64x_is_negative WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-negative-float64x-1.3 () {
    mmux_float64x_is_negative WW(mmux_libc_MIN_FLOAT64X)
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
    ! mmux_float64x_is_non_positive WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-non-positive-float64x-1.3 () {
    mmux_float64x_is_non_positive WW(mmux_libc_MIN_FLOAT64X)
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
    mmux_float64x_is_non_negative WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-non-negative-float64x-1.3 () {
    ! mmux_float64x_is_non_negative WW(mmux_libc_MIN_FLOAT64X)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float64x-1.1 () {
    ! mmux_float64x_is_infinite WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-infinite-float64x-1.2 () {
    ! mmux_float64x_is_infinite WW(mmux_libc_MIN_FLOAT64X)
}
function predicates-is-infinite-float64x-1.3 () {
    mmux_float64x_is_infinite '+inf'
}
function predicates-is-infinite-float64x-1.4 () {
    mmux_float64x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float64x-1.1 () {
    ! mmux_float64x_is_nan WW(mmux_libc_MAX_FLOAT64X)
}
function predicates-is-nan-float64x-1.2 () {
    ! mmux_float64x_is_nan WW(mmux_libc_MIN_FLOAT64X)
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

if test -v mmux_libc_SIZEOF_FLOAT128X
then

function predicates-is-zero-float128x-1.1 () {
    mmux_float128x_is_zero 0
}
function predicates-is-zero-float128x-1.2 () {
    ! mmux_float128x_is_zero WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-zero-float128x-1.3 () {
    ! mmux_float128x_is_zero WW(mmux_libc_MIN_FLOAT128X)
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
    mmux_float128x_is_positive WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-positive-float128x-1.3 () {
    ! mmux_float128x_is_positive WW(mmux_libc_MIN_FLOAT128X)
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
    ! mmux_float128x_is_negative WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-negative-float128x-1.3 () {
    mmux_float128x_is_negative WW(mmux_libc_MIN_FLOAT128X)
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
    ! mmux_float128x_is_non_positive WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-non-positive-float128x-1.3 () {
    mmux_float128x_is_non_positive WW(mmux_libc_MIN_FLOAT128X)
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
    mmux_float128x_is_non_negative WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-non-negative-float128x-1.3 () {
    ! mmux_float128x_is_non_negative WW(mmux_libc_MIN_FLOAT128X)
}

### ------------------------------------------------------------------------

function predicates-is-infinite-float128x-1.1 () {
    ! mmux_float128x_is_infinite WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-infinite-float128x-1.2 () {
    ! mmux_float128x_is_infinite WW(mmux_libc_MIN_FLOAT128X)
}
function predicates-is-infinite-float128x-1.3 () {
    mmux_float128x_is_infinite '+inf'
}
function predicates-is-infinite-float128x-1.4 () {
    mmux_float128x_is_infinite '-inf'
}

### ------------------------------------------------------------------------

function predicates-is-nan-float128x-1.1 () {
    ! mmux_float128x_is_nan WW(mmux_libc_MAX_FLOAT128X)
}
function predicates-is-nan-float128x-1.2 () {
    ! mmux_float128x_is_nan WW(mmux_libc_MIN_FLOAT128X)
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

if test -v mmux_libc_SIZEOF_COMPLEXLD
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

if test -v mmux_libc_SIZEOF_COMPLEXF32
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

if test -v mmux_libc_SIZEOF_COMPLEXF64
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

if test -v mmux_libc_SIZEOF_COMPLEXF128
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

if test -v mmux_libc_SIZEOF_COMPLEXF32X
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

if test -v mmux_libc_SIZEOF_COMPLEXF64X
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

if test -v mmux_libc_SIZEOF_COMPLEXF128X
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


#### let's go

dotest predicates-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
