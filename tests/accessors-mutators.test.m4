#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for raw memory accessor and mutator builtins
#!# Date: Sep  9, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/accessors-mutators.bash ; less tests/accessors-mutators.log
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


#### array accessors and mutators: pointer

function raw-pointer-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-pointer $PTR 0 '0x12'
	pointer-ref-pointer VALUE $PTR 0
    }
    free $PTR
    dotest-equal '0x12' QQ(VALUE)
}
function raw-pointer-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-pointer $PTR  0 '0x12'
	pointer-set-pointer $PTR  8 '0x34'
	pointer-set-pointer $PTR 16 '0x56'

	pointer-ref-pointer VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-pointer VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-pointer VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal '0x12' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0x34' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0x56' mbfl_slot_qref(VALUES,2)
}
function raw-pointer-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-pointer $PTR  0 '0x12'
	pointer-set-pointer $PTR  8 '0x34'
	pointer-set-pointer $PTR 16 '0x56'
	realloc PTR $PTR 2048
	pointer-ref-pointer VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-pointer VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-pointer VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal '0x12' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0x34' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0x56' mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: schar

function raw-schar-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-schar $PTR 0 12
	pointer-ref-schar VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-schar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-schar $PTR  0 12
	pointer-set-schar $PTR  8 34
	pointer-set-schar $PTR 16 56

	pointer-ref-schar VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-schar VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-schar VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}
function raw-schar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-schar $PTR  0 12
	pointer-set-schar $PTR  8 34
	pointer-set-schar $PTR 16 56
	realloc PTR $PTR 2048
	pointer-ref-schar VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-schar VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-schar VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uchar

function raw-uchar-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uchar $PTR 0 12
	pointer-ref-uchar VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-uchar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uchar $PTR  0 12
	pointer-set-uchar $PTR  8 34
	pointer-set-uchar $PTR 16 56

	pointer-ref-uchar VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uchar VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uchar VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}
function raw-uchar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uchar $PTR  0 12
	pointer-set-uchar $PTR  8 34
	pointer-set-uchar $PTR 16 56
	realloc PTR $PTR 2048
	pointer-ref-uchar VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uchar VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uchar VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 34 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 56 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint

function raw-sint-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sint $PTR 0 123
	pointer-ref-sint VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-sint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint $PTR  0 123
	pointer-set-sint $PTR  8 456
	pointer-set-sint $PTR 16 789

	pointer-ref-sint VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-sint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint $PTR  0 123
	pointer-set-sint $PTR  8 456
	pointer-set-sint $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-sint VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint

function raw-uint-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uint $PTR 0 123
	pointer-ref-uint VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-uint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint $PTR  0 123
	pointer-set-uint $PTR  8 456
	pointer-set-uint $PTR 16 789

	pointer-ref-uint VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-uint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint $PTR  0 123
	pointer-set-uint $PTR  8 456
	pointer-set-uint $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-uint VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: slong

function raw-slong-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-slong $PTR 0 123
	pointer-ref-slong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-slong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-slong $PTR  0 123
	pointer-set-slong $PTR  8 456
	pointer-set-slong $PTR 16 789

	pointer-ref-slong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-slong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-slong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-slong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-slong $PTR  0 123
	pointer-set-slong $PTR  8 456
	pointer-set-slong $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-slong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-slong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-slong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ulong

function raw-ulong-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-ulong $PTR 0 123
	pointer-ref-ulong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-ulong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ulong $PTR  0 123
	pointer-set-ulong $PTR  8 456
	pointer-set-ulong $PTR 16 789

	pointer-ref-ulong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ulong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ulong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-ulong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ulong $PTR  0 123
	pointer-set-ulong $PTR  8 456
	pointer-set-ulong $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-ulong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ulong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ulong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sllong

function raw-sllong-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sllong $PTR 0 123
	pointer-ref-sllong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-sllong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sllong $PTR  0 123
	pointer-set-sllong $PTR  8 456
	pointer-set-sllong $PTR 16 789

	pointer-ref-sllong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sllong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sllong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-sllong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sllong $PTR  0 123
	pointer-set-sllong $PTR  8 456
	pointer-set-sllong $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-sllong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sllong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sllong VALUE $PTR 16	;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ullong

function raw-ullong-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-ullong $PTR 0 123
	pointer-ref-ullong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-ullong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ullong $PTR  0 123
	pointer-set-ullong $PTR  8 456
	pointer-set-ullong $PTR 16 789

	pointer-ref-ullong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ullong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ullong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-ullong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ullong $PTR  0 123
	pointer-set-ullong $PTR  8 456
	pointer-set-ullong $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-ullong VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ullong VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ullong VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ssize

function raw-ssize-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-ssize $PTR 0 123
	pointer-ref-ssize VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-ssize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ssize $PTR  0 123
	pointer-set-ssize $PTR  8 456
	pointer-set-ssize $PTR 16 789

	pointer-ref-ssize VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ssize VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ssize VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-ssize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ssize $PTR  0 123
	pointer-set-ssize $PTR  8 456
	pointer-set-ssize $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-ssize VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ssize VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-ssize VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: usize

function raw-usize-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-usize $PTR 0 123
	pointer-ref-usize VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-usize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-usize $PTR  0 123
	pointer-set-usize $PTR  8 456
	pointer-set-usize $PTR 16 789

	pointer-ref-usize VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-usize VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-usize VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}
function raw-usize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-usize $PTR  0 123
	pointer-set-usize $PTR  8 456
	pointer-set-usize $PTR 16 789
	realloc PTR $PTR 2048
	pointer-ref-usize VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-usize VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-usize VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 123 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 456 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 789 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: float

function raw-float-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-float $PTR 0 1.23
	pointer-ref-float VALUE $PTR 0
    }
    free $PTR
    dotest-equal 0X1.3AE148P+0 QQ(VALUE)
}
function raw-float-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-float $PTR  0 1.23
	pointer-set-float $PTR  8 4.56
	pointer-set-float $PTR 16 7.89

	pointer-ref-float VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-float VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-float VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}
function raw-float-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-float $PTR  0 1.23
	pointer-set-float $PTR  8 4.56
	pointer-set-float $PTR 16 7.89
	realloc PTR $PTR 2048
	pointer-ref-float VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-float VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-float VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 0X1.3AE148P+0 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 0X1.23D70AP+2 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 0X1.F8F5C2P+2 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: double

function raw-double-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-double $PTR 0 1.23
	pointer-ref-double VALUE $PTR 0
    }
    free $PTR
    dotest-equal '0X1.3AE147AE147AEP+0' QQ(VALUE)
}
function raw-double-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-double $PTR  0 1.23
	pointer-set-double $PTR  8 4.56
	pointer-set-double $PTR 16 7.89

	pointer-ref-double VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-double VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-double VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '0X1.3AE147AE147AEP+0' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X1.23D70A3D70A3DP+2' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0X1.F8F5C28F5C28FP+2' mbfl_slot_qref(VALUES,2)
}
function raw-double-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-double $PTR  0 1.23
	pointer-set-double $PTR  8 4.56
	pointer-set-double $PTR 16 7.89
	realloc PTR $PTR 2048
	pointer-ref-double VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-double VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-double VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '0X1.3AE147AE147AEP+0' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X1.23D70A3D70A3DP+2' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0X1.F8F5C28F5C28FP+2' mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ldouble

function raw-ldouble-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-ldouble $PTR 0 1.23
	pointer-ref-ldouble VALUE $PTR 0
    }
    free $PTR
    dotest-equal '0X9.D70A3D70A3D70A4P-3' QQ(VALUE)
}
function raw-ldouble-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ldouble $PTR  0 1.23
	pointer-set-ldouble $PTR 32 4.56
	pointer-set-ldouble $PTR 64 7.89

	pointer-ref-ldouble VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ldouble VALUE $PTR 32		;VALUES[1]=$VALUE
	pointer-ref-ldouble VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '0X9.D70A3D70A3D70A4P-3' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X9.1EB851EB851EB85P-1' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0XF.C7AE147AE147AE1P-1' mbfl_slot_qref(VALUES,2)
}
function raw-ldouble-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-ldouble $PTR  0 1.23
	pointer-set-ldouble $PTR 32 4.56
	pointer-set-ldouble $PTR 64 7.89
	realloc PTR $PTR 2048
	pointer-ref-ldouble VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ldouble VALUE $PTR 32		;VALUES[1]=$VALUE
	pointer-ref-ldouble VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '0X9.D70A3D70A3D70A4P-3' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '0X9.1EB851EB851EB85P-1' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '0XF.C7AE147AE147AE1P-1' mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: complex

function raw-complex-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-complex $PTR 0 '(1.2)+i*(3.4)'
	pointer-ref-complex VALUE $PTR 0
    }
    free $PTR
    dotest-equal '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' QQ(VALUE)
}
function raw-complex-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-complex $PTR  0 '(1.2)+i*(3.4)'
	pointer-set-complex $PTR 32 '(5.6)+i*(7.8)'
	pointer-set-complex $PTR 64 '(9.0)+i*(1.2)'

	pointer-ref-complex VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-complex VALUE $PTR 32		;VALUES[1]=$VALUE
	pointer-ref-complex VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.6666666666666P+2)+i*(0X1.F333333333333P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.3333333333333P+0)'             mbfl_slot_qref(VALUES,2)
}
function raw-complex-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-complex $PTR  0 '(1.2)+i*(3.4)'
	pointer-set-complex $PTR  32 '(5.6)+i*(7.8)'
	pointer-set-complex $PTR 64 '(9.0)+i*(1.2)'
	realloc PTR $PTR 2048
	pointer-ref-complex VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-complex VALUE $PTR 32		;VALUES[1]=$VALUE
	pointer-ref-complex VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal     '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(0X1.6666666666666P+2)+i*(0X1.F333333333333P+2)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(0X1.2P+3)+i*(0X1.3333333333333P+0)'             mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint8

function raw-sint8-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sint8 $PTR 0 12
	pointer-ref-sint8 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-sint8-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint8 $PTR  0 12
	pointer-set-sint8 $PTR  8 45
	pointer-set-sint8 $PTR 16 78

	pointer-ref-sint8 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint8 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint8 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-sint8-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint8 $PTR  0 12
	pointer-set-sint8 $PTR  8 45
	pointer-set-sint8 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-sint8 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint8 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint8 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint8

function raw-uint8-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uint8 $PTR 0 12
	pointer-ref-uint8 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-uint8-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint8 $PTR  0 12
	pointer-set-uint8 $PTR  8 45
	pointer-set-uint8 $PTR 16 78

	pointer-ref-uint8 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint8 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint8 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-uint8-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint8 $PTR  0 12
	pointer-set-uint8 $PTR  8 45
	pointer-set-uint8 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-uint8 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint8 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint8 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint16

function raw-sint16-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sint16 $PTR 0 12
	pointer-ref-sint16 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-sint16-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint16 $PTR  0 12
	pointer-set-sint16 $PTR  8 45
	pointer-set-sint16 $PTR 16 78

	pointer-ref-sint16 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint16 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint16 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-sint16-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint16 $PTR  0 12
	pointer-set-sint16 $PTR  8 45
	pointer-set-sint16 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-sint16 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint16 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint16 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint16

function raw-uint16-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uint16 $PTR 0 12
	pointer-ref-uint16 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-uint16-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint16 $PTR  0 12
	pointer-set-uint16 $PTR  8 45
	pointer-set-uint16 $PTR 16 78

	pointer-ref-uint16 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint16 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint16 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-uint16-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint16 $PTR  0 12
	pointer-set-uint16 $PTR  8 45
	pointer-set-uint16 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-uint16 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint16 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint16 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint32

function raw-sint32-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sint32 $PTR 0 12
	pointer-ref-sint32 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-sint32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint32 $PTR  0 12
	pointer-set-sint32 $PTR  8 45
	pointer-set-sint32 $PTR 16 78

	pointer-ref-sint32 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint32 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint32 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-sint32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint32 $PTR  0 12
	pointer-set-sint32 $PTR  8 45
	pointer-set-sint32 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-sint32 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint32 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint32 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint32

function raw-uint32-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uint32 $PTR 0 12
	pointer-ref-uint32 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-uint32-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint32 $PTR  0 12
	pointer-set-uint32 $PTR  8 45
	pointer-set-uint32 $PTR 16 78

	pointer-ref-uint32 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint32 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint32 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-uint32-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint32 $PTR  0 12
	pointer-set-uint32 $PTR  8 45
	pointer-set-uint32 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-uint32 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint32 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint32 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: sint64

function raw-sint64-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-sint64 $PTR 0 12
	pointer-ref-sint64 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-sint64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint64 $PTR  0 12
	pointer-set-sint64 $PTR  8 45
	pointer-set-sint64 $PTR 16 78

	pointer-ref-sint64 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint64 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint64 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-sint64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-sint64 $PTR  0 12
	pointer-set-sint64 $PTR  8 45
	pointer-set-sint64 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-sint64 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-sint64 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-sint64 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: uint64

function raw-uint64-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uint64 $PTR 0 12
	pointer-ref-uint64 VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-uint64-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint64 $PTR  0 12
	pointer-set-uint64 $PTR  8 45
	pointer-set-uint64 $PTR 16 78

	pointer-ref-uint64 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint64 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint64 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}
function raw-uint64-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    calloc PTR 1024 1
    {
	pointer-set-uint64 $PTR  0 12
	pointer-set-uint64 $PTR  8 45
	pointer-set-uint64 $PTR 16 78
	realloc PTR $PTR 2048
	pointer-ref-uint64 VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-uint64 VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-uint64 VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 12 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 45 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 78 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: intmax

function raw-intmax-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-intmax $PTR 5 12
	pointer-ref-intmax VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: intptr

function raw-intptr-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-intptr $PTR 5 12
	pointer-ref-intptr VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: uintptr

function raw-uintptr-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uintptr $PTR 5 12
	pointer-ref-uintptr VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: ptrdiff

function raw-ptrdiff-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-ptrdiff $PTR 5 12
	pointer-ref-ptrdiff VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: mode

function raw-mode-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-mode $PTR 5 12
	pointer-ref-mode VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: off

function raw-off-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-off $PTR 5 12
	pointer-ref-off VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: pid

function raw-pid-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-pid $PTR 5 12
	pointer-ref-pid VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: uid

function raw-uid-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-uid $PTR 5 12
	pointer-ref-uid VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### array accessors and mutators: gid

function raw-gid-1.1 () {
    declare PTR VALUE

    calloc PTR 1024 1
    {
	pointer-set-gid $PTR 5 12
	pointer-ref-gid VALUE $PTR 5
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}


#### let's go

dotest raw-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
