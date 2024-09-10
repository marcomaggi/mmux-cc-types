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


#### array accessors and mutators: schar

function raw-memory-schar-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-schar $PTR 0 12
	pointer-ref-schar VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-memory-schar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-schar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-uchar-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-uchar $PTR 0 12
	pointer-ref-uchar VALUE $PTR 0
    }
    free $PTR
    dotest-equal 12 QQ(VALUE)
}
function raw-memory-uchar-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-uchar-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-sint-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-sint $PTR 0 123
	pointer-ref-sint VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-sint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-sint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-uint-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-uint $PTR 0 123
	pointer-ref-uint VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-uint-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-uint-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-slong-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-slong $PTR 0 123
	pointer-ref-slong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-slong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-slong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-ulong-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-ulong $PTR 0 123
	pointer-ref-ulong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-ulong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-ulong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-sllong-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-sllong $PTR 0 123
	pointer-ref-sllong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-sllong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-sllong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-ullong-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-ullong $PTR 0 123
	pointer-ref-ullong VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-ullong-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-ullong-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-ssize-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-ssize $PTR 0 123
	pointer-ref-ssize VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-ssize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-ssize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-usize-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-usize $PTR 0 123
	pointer-ref-usize VALUE $PTR 0
    }
    free $PTR
    dotest-equal 123 QQ(VALUE)
}
function raw-memory-usize-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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
function raw-memory-usize-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

function raw-memory-float-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-float $PTR 0 1.23
	pointer-ref-float VALUE $PTR 0
    }
    free $PTR
    dotest-equal 1.230000 QQ(VALUE)
}
function raw-memory-float-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
    {
	pointer-set-float $PTR  0 1.23
	pointer-set-float $PTR  8 4.56
	pointer-set-float $PTR 16 7.89

	pointer-ref-float VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-float VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-float VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}
function raw-memory-float-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: double

function raw-memory-double-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-double $PTR 0 1.23
	pointer-ref-double VALUE $PTR 0
    }
    free $PTR
    dotest-equal 1.230000 QQ(VALUE)
}
function raw-memory-double-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
    {
	pointer-set-double $PTR  0 1.23
	pointer-set-double $PTR  8 4.56
	pointer-set-double $PTR 16 7.89

	pointer-ref-double VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-double VALUE $PTR 8		;VALUES[1]=$VALUE
	pointer-ref-double VALUE $PTR 16		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}
function raw-memory-double-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: ldouble

function raw-memory-ldouble-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-ldouble $PTR 0 1.23
	pointer-ref-ldouble VALUE $PTR 0
    }
    free $PTR
    dotest-equal 1.230000 QQ(VALUE)
}
function raw-memory-ldouble-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
    {
	pointer-set-ldouble $PTR  0 1.23
	pointer-set-ldouble $PTR 16 4.56
	pointer-set-ldouble $PTR 32 7.89

	pointer-ref-ldouble VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ldouble VALUE $PTR 16		;VALUES[1]=$VALUE
	pointer-ref-ldouble VALUE $PTR 32		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}
function raw-memory-ldouble-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
    {
	pointer-set-ldouble $PTR  0 1.23
	pointer-set-ldouble $PTR  16 4.56
	pointer-set-ldouble $PTR 32 7.89
	realloc PTR $PTR 2048
	pointer-ref-ldouble VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-ldouble VALUE $PTR 16		;VALUES[1]=$VALUE
	pointer-ref-ldouble VALUE $PTR 32		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal 1.230000 mbfl_slot_qref(VALUES,0) &&
	dotest-equal 4.560000 mbfl_slot_qref(VALUES,1) &&
	dotest-equal 7.890000 mbfl_slot_qref(VALUES,2)
}


#### array accessors and mutators: complex

function raw-memory-complex-1.1 () {
    declare PTR VALUE

    malloc PTR 1024
    {
	pointer-set-complex $PTR 0 '(1.2)+i*(3.4)'
	pointer-ref-complex VALUE $PTR 0
    }
    free $PTR
    dotest-equal '(1.200000)+i*(3.400000)' QQ(VALUE)
}
function raw-memory-complex-1.2 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
    {
	pointer-set-complex $PTR  0 '(1.2)+i*(3.4)'
	pointer-set-complex $PTR  32 '(5.6)+i*(7.8)'
	pointer-set-complex $PTR 64 '(9.0)+i*(1.2)'

	pointer-ref-complex VALUE $PTR 0		;VALUES[0]=$VALUE
	pointer-ref-complex VALUE $PTR 32		;VALUES[1]=$VALUE
	pointer-ref-complex VALUE $PTR 64		;VALUES[2]=$VALUE
    }
    free $PTR

    dotest-equal '(1.200000)+i*(3.400000)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(5.600000)+i*(7.800000)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(9.000000)+i*(1.200000)' mbfl_slot_qref(VALUES,2)
}
function raw-memory-complex-1.3 () {
    declare PTR VALUE
    declare -a VALUES

    malloc PTR 1024
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

    dotest-equal '(1.200000)+i*(3.400000)' mbfl_slot_qref(VALUES,0) &&
	dotest-equal '(5.600000)+i*(7.800000)' mbfl_slot_qref(VALUES,1) &&
	dotest-equal '(9.000000)+i*(1.200000)' mbfl_slot_qref(VALUES,2)
}


#### let's go

dotest raw-memory-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
