#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for bitwise builtins
#!# Date: Sep 19, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/bitwise.bash ; less tests/bitwise.log
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


#### type variables: pointer

function bitwise-pointer-and-1.1 () {
    declare ROP OP=0x101 MASK=0x100
    declare EXPECTED_ROP=$(( OP & MASK ))

    printf -v EXPECTED_ROP '0x%x' QQ(EXPECTED_ROP)

    bitwise-and-pointer ROP QQ(OP) QQ(MASK)

    dotest-unset-debug
    dotest-debug ROP=QQ(ROP) EXPECTED_ROP=QQ(EXPECTED_ROP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-or-1.1 () {
    declare ROP OP=0x100 MASK=0x111
    declare EXPECTED_ROP=$(( OP | MASK ))

    printf -v EXPECTED_ROP '0x%x' QQ(EXPECTED_ROP)

    bitwise-or-pointer ROP QQ(OP) QQ(MASK)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-xor-1.1 () {
    declare ROP OP=0x100 MASK=0x111
    declare EXPECTED_ROP=$(( OP ^ MASK ))

    printf -v EXPECTED_ROP '0x%x' QQ(EXPECTED_ROP)

    bitwise-xor-pointer ROP QQ(OP) QQ(MASK)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-not-1.1 () {
    declare ROP OP=0x100
    declare EXPECTED_ROP=$(( ~ OP ))

    printf -v EXPECTED_ROP '0x%x' QQ(EXPECTED_ROP)

    bitwise-not-pointer ROP QQ(OP)
    dotest-unset-debug
    dotest-debug ROP=QQ(ROP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: schar

function bitwise-schar-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    bitwise-and-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-and-schar-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    bitwise-and-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-and-schar-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    bitwise-and-schar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    bitwise-or-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-schar-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    bitwise-or-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-schar-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    bitwise-or-schar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    bitwise-xor-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-schar-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    bitwise-xor-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function bitwise-schar-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    bitwise-xor-schar ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-schar-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    bitwise-not-schar ROP QQ(OP)
    dotest-unset-debug
    dotest-debug ROP=QQ(ROP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### let's go

dotest bitwise-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
