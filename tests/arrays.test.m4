#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for raw memory accessor and mutator builtins
#!# Date: Sep 12, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/arrays.bash ; less tests/arrays.log
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


#### helpers and debugging

if false
then
    printf 'mmux_libc_SIZEOF_COMPLEXF=%s\n'  WW(mmux_libc_SIZEOF_COMPLEXF)  >&2
    printf 'mmux_libc_SIZEOF_COMPLEXD=%s\n'  WW(mmux_libc_SIZEOF_COMPLEXD)  >&2
    printf 'mmux_libc_SIZEOF_COMPLEXLD=%s\n' WW(mmux_libc_SIZEOF_COMPLEXLD) >&2
fi


#### array accessors and mutators: pointer

function arrays-pointer-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_pointer_array_set $PTR 0 '0x12'
	mmux_pointer_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal '0x12' QQ(VALUE)
}
function arrays-pointer-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_pointer_array_set $PTR  0 '0x12'
	mmux_pointer_array_set $PTR  8 '0x34'
	mmux_pointer_array_set $PTR 16 '0x56'

	mmux_pointer_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_pointer_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_pointer_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal '0x12' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0x34' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0x56' mbfl_slot_qref(VALUES,2)
}
function arrays-pointer-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_pointer_array_set $PTR  0 '0x12'
	mmux_pointer_array_set $PTR  8 '0x34'
	mmux_pointer_array_set $PTR 16 '0x56'
	mmux_libc_realloc PTR $PTR 2048
	mmux_pointer_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_pointer_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_pointer_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal '0x12' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0x34' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0x56' mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: schar

function arrays-schar-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_schar_array_set $PTR 0 12
	mmux_schar_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-schar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_schar_array_set $PTR  0 12
	mmux_schar_array_set $PTR  8 34
	mmux_schar_array_set $PTR 16 56

	mmux_schar_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_schar_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_schar_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}
function arrays-schar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_schar_array_set $PTR  0 12
	mmux_schar_array_set $PTR  8 34
	mmux_schar_array_set $PTR 16 56
	mmux_libc_realloc PTR $PTR 2048
	mmux_schar_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_schar_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_schar_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uchar

function arrays-uchar-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uchar_array_set $PTR 0 12
	mmux_uchar_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-uchar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uchar_array_set $PTR  0 12
	mmux_uchar_array_set $PTR  8 34
	mmux_uchar_array_set $PTR 16 56

	mmux_uchar_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uchar_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uchar_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}
function arrays-uchar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uchar_array_set $PTR  0 12
	mmux_uchar_array_set $PTR  8 34
	mmux_uchar_array_set $PTR 16 56
	mmux_libc_realloc PTR $PTR 2048
	mmux_uchar_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uchar_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uchar_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sshort

function arrays-sshort-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sshort_array_set $PTR 0 123
	mmux_sshort_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-sshort-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sshort_array_set $PTR  0 123
	mmux_sshort_array_set $PTR  8 456
	mmux_sshort_array_set $PTR 16 789

	mmux_sshort_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sshort_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sshort_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-sshort-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sshort_array_set $PTR  0 123
	mmux_sshort_array_set $PTR  8 456
	mmux_sshort_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_sshort_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sshort_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sshort_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ushort

function arrays-ushort-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ushort_array_set $PTR 0 123
	mmux_ushort_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-ushort-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ushort_array_set $PTR  0 123
	mmux_ushort_array_set $PTR  8 456
	mmux_ushort_array_set $PTR 16 789

	mmux_ushort_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ushort_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ushort_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-ushort-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ushort_array_set $PTR  0 123
	mmux_ushort_array_set $PTR  8 456
	mmux_ushort_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_ushort_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ushort_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ushort_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint

function arrays-sint-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint_array_set $PTR 0 123
	mmux_sint_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-sint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint_array_set $PTR  0 123
	mmux_sint_array_set $PTR  8 456
	mmux_sint_array_set $PTR 16 789

	mmux_sint_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-sint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint_array_set $PTR  0 123
	mmux_sint_array_set $PTR  8 456
	mmux_sint_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_sint_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint

function arrays-uint-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint_array_set $PTR 0 123
	mmux_uint_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-uint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint_array_set $PTR  0 123
	mmux_uint_array_set $PTR  8 456
	mmux_uint_array_set $PTR 16 789

	mmux_uint_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-uint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint_array_set $PTR  0 123
	mmux_uint_array_set $PTR  8 456
	mmux_uint_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_uint_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: slong

function arrays-slong-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_slong_array_set $PTR 0 123
	mmux_slong_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-slong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_slong_array_set $PTR  0 123
	mmux_slong_array_set $PTR  8 456
	mmux_slong_array_set $PTR 16 789

	mmux_slong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_slong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_slong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-slong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_slong_array_set $PTR  0 123
	mmux_slong_array_set $PTR  8 456
	mmux_slong_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_slong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_slong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_slong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ulong

function arrays-ulong-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ulong_array_set $PTR 0 123
	mmux_ulong_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-ulong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ulong_array_set $PTR  0 123
	mmux_ulong_array_set $PTR  8 456
	mmux_ulong_array_set $PTR 16 789

	mmux_ulong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ulong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ulong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-ulong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ulong_array_set $PTR  0 123
	mmux_ulong_array_set $PTR  8 456
	mmux_ulong_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_ulong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ulong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ulong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sllong

function arrays-sllong-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sllong_array_set $PTR 0 123
	mmux_sllong_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-sllong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sllong_array_set $PTR  0 123
	mmux_sllong_array_set $PTR  8 456
	mmux_sllong_array_set $PTR 16 789

	mmux_sllong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sllong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sllong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-sllong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sllong_array_set $PTR  0 123
	mmux_sllong_array_set $PTR  8 456
	mmux_sllong_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_sllong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sllong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sllong_array_ref VALUE $PTR 16	;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ullong

function arrays-ullong-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ullong_array_set $PTR 0 123
	mmux_ullong_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-ullong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ullong_array_set $PTR  0 123
	mmux_ullong_array_set $PTR  8 456
	mmux_ullong_array_set $PTR 16 789

	mmux_ullong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ullong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ullong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-ullong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ullong_array_set $PTR  0 123
	mmux_ullong_array_set $PTR  8 456
	mmux_ullong_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_ullong_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ullong_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ullong_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ssize

function arrays-ssize-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ssize_array_set $PTR 0 123
	mmux_ssize_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-ssize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ssize_array_set $PTR  0 123
	mmux_ssize_array_set $PTR  8 456
	mmux_ssize_array_set $PTR 16 789

	mmux_ssize_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ssize_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ssize_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-ssize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ssize_array_set $PTR  0 123
	mmux_ssize_array_set $PTR  8 456
	mmux_ssize_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_ssize_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ssize_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_ssize_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: usize

function arrays-usize-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_usize_array_set $PTR 0 123
	mmux_usize_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 123 QQ(VALUE)
}
function arrays-usize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_usize_array_set $PTR  0 123
	mmux_usize_array_set $PTR  8 456
	mmux_usize_array_set $PTR 16 789

	mmux_usize_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_usize_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_usize_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function arrays-usize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_usize_array_set $PTR  0 123
	mmux_usize_array_set $PTR  8 456
	mmux_usize_array_set $PTR 16 789
	mmux_libc_realloc PTR $PTR 2048
	mmux_usize_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_usize_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_usize_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: float

function arrays-float-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float_array_set $PTR 0 1.23
	mmux_float_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float_array_set $PTR  0 1.23
	mmux_float_array_set $PTR  8 4.56
	mmux_float_array_set $PTR 16 7.89

	mmux_float_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float_array_set $PTR  0 1.23
	mmux_float_array_set $PTR  8 4.56
	mmux_float_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: double

function arrays-double-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_double_array_set $PTR 0 1.23
	mmux_double_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal '0X1.3AE147AE147AEP+0' QQ(VALUE)
}
function arrays-double-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_double_array_set $PTR  0 1.23
	mmux_double_array_set $PTR  8 4.56
	mmux_double_array_set $PTR 16 7.89

	mmux_double_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_double_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_double_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '0X1.3AE147AE147AEP+0' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X1.23D70A3D70A3DP+2' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0X1.F8F5C28F5C28FP+2' mbfl_slot_qref(VALUES,2)
}
function arrays-double-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_double_array_set $PTR  0 1.23
	mmux_double_array_set $PTR  8 4.56
	mmux_double_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_double_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_double_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_double_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '0X1.3AE147AE147AEP+0' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X1.23D70A3D70A3DP+2' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0X1.F8F5C28F5C28FP+2' mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ldouble

if test -v mmux_libc_SIZEOF_LDOUBLE
then

function arrays-ldouble-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 2048 1
    {
	mmux_ldouble_array_set $PTR 0 1.23
	mmux_ldouble_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal '0X9.D70A3D70A3D70A4P-3' QQ(VALUE)
}
function arrays-ldouble-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 2048 1
    {
	mmux_ldouble_array_set $PTR  0 1.23
	mmux_ldouble_array_set $PTR 4 4.56
	mmux_ldouble_array_set $PTR 64 7.89

	mmux_ldouble_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ldouble_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_ldouble_array_ref VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '0X9.D70A3D70A3D70A4P-3' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X9.1EB851EB851EB85P-1' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0XF.C7AE147AE147AE1P-1' mbfl_slot_qref(VALUES,2)
}
function arrays-ldouble-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 2048 1
    {
	mmux_ldouble_array_set $PTR  0 1.23
	mmux_ldouble_array_set $PTR 4 4.56
	mmux_ldouble_array_set $PTR 64 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_ldouble_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_ldouble_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_ldouble_array_ref VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '0X9.D70A3D70A3D70A4P-3' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X9.1EB851EB851EB85P-1' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0XF.C7AE147AE147AE1P-1' mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float32

if test -v mmux_libc_SIZEOF_FLOAT32
then

function arrays-float32-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32_array_set $PTR 0 1.23
	mmux_float32_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float32_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32_array_set $PTR  0 1.23
	mmux_float32_array_set $PTR  8 4.56
	mmux_float32_array_set $PTR 16 7.89

	mmux_float32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32_array_set $PTR  0 1.23
	mmux_float32_array_set $PTR  8 4.56
	mmux_float32_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float64

if test -v mmux_libc_SIZEOF_FLOAT64
then

function arrays-float64-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64_array_set $PTR 0 1.23
	mmux_float64_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float64_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64_array_set $PTR  0 1.23
	mmux_float64_array_set $PTR  8 4.56
	mmux_float64_array_set $PTR 16 7.89

	mmux_float64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float64_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float64_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float64_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64_array_set $PTR  0 1.23
	mmux_float64_array_set $PTR  8 4.56
	mmux_float64_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float64_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float64_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float64_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float128

if test -v mmux_libc_SIZEOF_FLOAT128
then

function arrays-float128-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128_array_set $PTR 0 1.23
	mmux_float128_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float128_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float128-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128_array_set $PTR  0 1.23
	mmux_float128_array_set $PTR  8 4.56
	mmux_float128_array_set $PTR 16 7.89

	mmux_float128_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float128_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float128_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float128_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float128_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float128_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float128-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128_array_set $PTR  0 1.23
	mmux_float128_array_set $PTR  8 4.56
	mmux_float128_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float128_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float128_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float128_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float128_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float128_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float128_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float32x

if test -v mmux_libc_SIZEOF_FLOAT32X
then

function arrays-float32x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32x_array_set $PTR 0 1.23
	mmux_float32x_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float32x_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float32x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32x_array_set $PTR  0 1.23
	mmux_float32x_array_set $PTR  8 4.56
	mmux_float32x_array_set $PTR 16 7.89

	mmux_float32x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float32x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float32x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float32x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float32x_array_set $PTR  0 1.23
	mmux_float32x_array_set $PTR  8 4.56
	mmux_float32x_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float32x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float32x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float32x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float64x

if test -v mmux_libc_SIZEOF_FLOAT64X
then

function arrays-float64x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64x_array_set $PTR 0 1.23
	mmux_float64x_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float64x_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float64x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64x_array_set $PTR  0 1.23
	mmux_float64x_array_set $PTR  8 4.56
	mmux_float64x_array_set $PTR 16 7.89

	mmux_float64x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float64x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float64x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float64x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float64x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float64x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float64x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float64x_array_set $PTR  0 1.23
	mmux_float64x_array_set $PTR  8 4.56
	mmux_float64x_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float64x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float64x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float64x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float64x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float64x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float64x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: float128x

if test -v mmux_libc_SIZEOF_FLOAT128X
then

function arrays-float128x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128x_array_set $PTR 0 1.23
	mmux_float128x_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    mmux_float128x_equal_relepsilon 0X1.3AE148P+0 QQ(VALUE)
}
function arrays-float128x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128x_array_set $PTR  0 1.23
	mmux_float128x_array_set $PTR  8 4.56
	mmux_float128x_array_set $PTR 16 7.89

	mmux_float128x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float128x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float128x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float128x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float128x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float128x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function arrays-float128x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_float128x_array_set $PTR  0 1.23
	mmux_float128x_array_set $PTR  8 4.56
	mmux_float128x_array_set $PTR 16 7.89
	mmux_libc_realloc PTR $PTR 2048
	mmux_float128x_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_float128x_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_float128x_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float128x_equal_relepsilon 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	mmux_float128x_equal_relepsilon 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	mmux_float128x_equal_relepsilon 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf

function arrays-complexf-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF) 10
    {
	mmux_complexf_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    dotest-equal '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF) 10
    {
	mmux_complexf_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF) 10
    {
	mmux_complexf_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF))
	mmux_complexf_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: complexd

function arrays-complexd-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXD) 10
    {
	mmux_complexd_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexd_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    dotest-equal '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' QQ(VALUE)
}
function arrays-complexd-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXD) 10
    {
	mmux_complexd_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexd_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexd_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexd_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexd_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexd_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.6666666666666P+2)+i*(0X1.F333333333333P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.3333333333333P+0)'             mbfl_slot_qref(VALUES,2)
}
function arrays-complexd-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXD) 10
    {
	mmux_complexd_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexd_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexd_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * WW(mmux_libc_SIZEOF_COMPLEXD) ))
	mmux_complexd_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexd_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexd_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal     '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.6666666666666P+2)+i*(0X1.F333333333333P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.3333333333333P+0)'             mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: complexld

if test -v mmux_libc_SIZEOF_COMPLEXLD
then

function arrays-complexld-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXLD) 10
    {
	mmux_complexld_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexld_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_complexld_equal '(1.2)+i*(3.4)' QQ(VALUE)
}
function arrays-complexld-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXLD) 10
    {
	mmux_complexld_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexld_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexld_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexld_array_ref VALUE $PTR 3	;VALUES[0]=$VALUE
	mmux_complexld_array_ref VALUE $PTR 4	;VALUES[1]=$VALUE
	mmux_complexld_array_ref VALUE $PTR 5	;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_complexld_equal     '(1.2)+i*(3.4)' mbfl_slot_qref(VALUES,0) &&
	mmux_complexld_equal '(5.6)+i*(7.8)' mbfl_slot_qref(VALUES,1) &&
	mmux_complexld_equal '(9.0)+i*(1.2)' mbfl_slot_qref(VALUES,2)
}
function arrays-complexld-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXLD) 10
    {
	mmux_complexld_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexld_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexld_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * WW(mmux_libc_SIZEOF_COMPLEXLD) ))
	mmux_complexld_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexld_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexld_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_complexld_equal     '(1.2)+i*(3.4)' mbfl_slot_qref(VALUES,0) &&
	mmux_complexld_equal '(5.6)+i*(7.8)' mbfl_slot_qref(VALUES,1) &&
	mmux_complexld_equal '(9.0)+i*(1.2)' mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf32

if test -v mmux_libc_SIZEOF_COMPLEXF32
then

function arrays-complexf32-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32) 10
    {
	mmux_complexf32_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32) 10
    {
	mmux_complexf32_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf32_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf32_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf32_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf32_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32) 10
    {
	mmux_complexf32_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf32_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF32))
	mmux_complexf32_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf32_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf32_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf64

if test -v mmux_libc_SIZEOF_COMPLEXF64
then

function arrays-complexf64-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64) 10
    {
	mmux_complexf64_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64) 10
    {
	mmux_complexf64_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf64_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf64_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf64_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf64_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64) 10
    {
	mmux_complexf64_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf64_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF64))
	mmux_complexf64_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf64_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf64_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf128

if test -v mmux_libc_SIZEOF_COMPLEXF128
then

function arrays-complexf128-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128) 10
    {
	mmux_complexf128_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf128-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128) 10
    {
	mmux_complexf128_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf128_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf128_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf128_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf128_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf128-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128) 10
    {
	mmux_complexf128_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf128_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF128))
	mmux_complexf128_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf128_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf128_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf32x

if test -v mmux_libc_SIZEOF_COMPLEXF32X
then

function arrays-complexf32x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32X) 10
    {
	mmux_complexf32x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32x_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32x_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf32x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32X) 10
    {
	mmux_complexf32x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf32x_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf32x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf32x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf32x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf32x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF32X) 10
    {
	mmux_complexf32x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf32x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf32x_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF32X))
	mmux_complexf32x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf32x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf32x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf64x

if test -v mmux_libc_SIZEOF_COMPLEXF64X
then

function arrays-complexf64x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64X) 10
    {
	mmux_complexf64x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64x_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32x_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf64x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64X) 10
    {
	mmux_complexf64x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf64x_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf64x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf64x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf64x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf64x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF64X) 10
    {
	mmux_complexf64x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf64x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf64x_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF64X))
	mmux_complexf64x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf64x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf64x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi


#### array accessors and mutators: complexf128x

if test -v mmux_libc_SIZEOF_COMPLEXF128X
then

function arrays-complexf128x-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128X) 10
    {
	mmux_complexf128x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128x_array_ref VALUE $PTR 3
    }
    mmux_libc_free $PTR
    mmux_float32x_equal_relepsilon '(0X1.333334P+0)+i*(0X1.B33334P+1)' QQ(VALUE)
}
function arrays-complexf128x-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128X) 10
    {
	mmux_complexf128x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf128x_array_set $PTR 5 '(9.0)+i*(1.2)'

	mmux_complexf128x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf128x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf128x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}
function arrays-complexf128x-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR WW(mmux_libc_SIZEOF_COMPLEXF128X) 10
    {
	mmux_complexf128x_array_set $PTR 3 '(1.2)+i*(3.4)'
	mmux_complexf128x_array_set $PTR 4 '(5.6)+i*(7.8)'
	mmux_complexf128x_array_set $PTR 5 '(9.0)+i*(1.2)'
	mmux_libc_realloc PTR $PTR $(( 10 * mmux_libc_SIZEOF_COMPLEXF128X))
	mmux_complexf128x_array_ref VALUE $PTR 3		;VALUES[0]=$VALUE
	mmux_complexf128x_array_ref VALUE $PTR 4		;VALUES[1]=$VALUE
	mmux_complexf128x_array_ref VALUE $PTR 5		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    mmux_float32x_equal_relepsilon     '(0X1.333334P+0)+i*(0X1.B33334P+1)' mbfl_slot_qref(VALUES,0) &&
	mmux_float32x_equal_relepsilon '(0X1.666666P+2)+i*(0X1.F33334P+2)' mbfl_slot_qref(VALUES,1) &&
	mmux_float32x_equal_relepsilon '(0X1.2P+3)+i*(0X1.333334P+0)'      mbfl_slot_qref(VALUES,2)
}

fi



#### array accessors and mutators: sint8

function arrays-sint8-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint8_array_set $PTR 0 12
	mmux_sint8_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-sint8-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint8_array_set $PTR  0 12
	mmux_sint8_array_set $PTR  8 45
	mmux_sint8_array_set $PTR 16 78

	mmux_sint8_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint8_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint8_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-sint8-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint8_array_set $PTR  0 12
	mmux_sint8_array_set $PTR  8 45
	mmux_sint8_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_sint8_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint8_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint8_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint8

function arrays-uint8-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint8_array_set $PTR 0 12
	mmux_uint8_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-uint8-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint8_array_set $PTR  0 12
	mmux_uint8_array_set $PTR  8 45
	mmux_uint8_array_set $PTR 16 78

	mmux_uint8_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint8_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint8_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-uint8-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint8_array_set $PTR  0 12
	mmux_uint8_array_set $PTR  8 45
	mmux_uint8_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_uint8_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint8_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint8_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint16

function arrays-sint16-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint16_array_set $PTR 0 12
	mmux_sint16_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-sint16-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint16_array_set $PTR  0 12
	mmux_sint16_array_set $PTR  8 45
	mmux_sint16_array_set $PTR 16 78

	mmux_sint16_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint16_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint16_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-sint16-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint16_array_set $PTR  0 12
	mmux_sint16_array_set $PTR  8 45
	mmux_sint16_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_sint16_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint16_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint16_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint16

function arrays-uint16-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint16_array_set $PTR 0 12
	mmux_uint16_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-uint16-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint16_array_set $PTR  0 12
	mmux_uint16_array_set $PTR  8 45
	mmux_uint16_array_set $PTR 16 78

	mmux_uint16_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint16_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint16_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-uint16-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint16_array_set $PTR  0 12
	mmux_uint16_array_set $PTR  8 45
	mmux_uint16_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_uint16_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint16_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint16_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint32

function arrays-sint32-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint32_array_set $PTR 0 12
	mmux_sint32_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-sint32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint32_array_set $PTR  0 12
	mmux_sint32_array_set $PTR  8 45
	mmux_sint32_array_set $PTR 16 78

	mmux_sint32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-sint32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint32_array_set $PTR  0 12
	mmux_sint32_array_set $PTR  8 45
	mmux_sint32_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_sint32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint32

function arrays-uint32-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint32_array_set $PTR 0 12
	mmux_uint32_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-uint32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint32_array_set $PTR  0 12
	mmux_uint32_array_set $PTR  8 45
	mmux_uint32_array_set $PTR 16 78

	mmux_uint32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-uint32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint32_array_set $PTR  0 12
	mmux_uint32_array_set $PTR  8 45
	mmux_uint32_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_uint32_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint32_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint32_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint64

function arrays-sint64-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint64_array_set $PTR 0 12
	mmux_sint64_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-sint64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint64_array_set $PTR  0 12
	mmux_sint64_array_set $PTR  8 45
	mmux_sint64_array_set $PTR 16 78

	mmux_sint64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-sint64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sint64_array_set $PTR  0 12
	mmux_sint64_array_set $PTR  8 45
	mmux_sint64_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_sint64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_sint64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_sint64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint64

function arrays-uint64-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint64_array_set $PTR 0 12
	mmux_uint64_array_ref VALUE $PTR 0
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}
function arrays-uint64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint64_array_set $PTR  0 12
	mmux_uint64_array_set $PTR  8 45
	mmux_uint64_array_set $PTR 16 78

	mmux_uint64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function arrays-uint64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uint64_array_set $PTR  0 12
	mmux_uint64_array_set $PTR  8 45
	mmux_uint64_array_set $PTR 16 78
	mmux_libc_realloc PTR $PTR 2048
	mmux_uint64_array_ref VALUE $PTR 0		;VALUES[0]=$VALUE
	mmux_uint64_array_ref VALUE $PTR 8		;VALUES[1]=$VALUE
	mmux_uint64_array_ref VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    mmux_libc_free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sintmax

function arrays-sintmax-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sintmax_array_set $PTR 5 12
	mmux_sintmax_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: uintmax

function arrays-uintmax-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uintmax_array_set $PTR 5 12
	mmux_uintmax_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: sintptr

function arrays-sintptr-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_sintptr_array_set $PTR 5 12
	mmux_sintptr_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: uintptr

function arrays-uintptr-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uintptr_array_set $PTR 5 12
	mmux_uintptr_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: ptrdiff

function arrays-ptrdiff-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_ptrdiff_array_set $PTR 5 12
	mmux_ptrdiff_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: mode

function arrays-mode-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_mode_array_set $PTR 5 12
	mmux_mode_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: off

function arrays-off-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_off_array_set $PTR 5 12
	mmux_off_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: pid

function arrays-pid-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_pid_array_set $PTR 5 12
	mmux_pid_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: uid

function arrays-uid-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_uid_array_set $PTR 5 12
	mmux_uid_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: gid

function arrays-gid-1.1 () {
    declare PTR VALUE

    mmux_libc_calloc PTR 1024 1
    {
	mmux_gid_array_set $PTR 5 12
	mmux_gid_array_ref VALUE $PTR 5
    }
    mmux_libc_free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### let's go

dotest arrays-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
