#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for arithmetics builtins
#!# Date: Sep 19, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/arithmetics.bash ; less tests/arithmetics.log
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

function arithmetics-pointer-add-1.1 () {
    declare ROP OP=0x100 DELTA=7
    declare -r EXPECTED_ROP='0x107'

    pointer-add ROP QQ(OP) QQ(DELTA)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: schar

function arithmetics-schar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    schar-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    schar-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    schar-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    schar-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    schar-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    schar-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    schar-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    schar-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    schar-mul ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    schar-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    schar-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    schar-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    schar-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sshort

function arithmetics-sshort-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sshort-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sshort-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sshort-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sshort-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sshort-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sshort-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sshort-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sshort-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sshort-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sshort-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sshort-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sshort-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sshort-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint

function arithmetics-sint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sint-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sint-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sint-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sint-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sint-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sint-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sint-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sint-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sint-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: slong

function arithmetics-slong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    slong-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    slong-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    slong-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    slong-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    slong-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    slong-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    slong-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    slong-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    slong-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    slong-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    slong-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    slong-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    slong-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sllong

function arithmetics-sllong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sllong-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sllong-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sllong-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sllong-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sllong-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sllong-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sllong-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sllong-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sllong-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sllong-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sllong-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sllong-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sllong-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint8

function arithmetics-sint8-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint8-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sint8-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sint8-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint8-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sint8-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sint8-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint8-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sint8-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    sint8-mul ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint8-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sint8-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sint8-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sint8-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint16

function arithmetics-sint16-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint16-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sint16-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sint16-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint16-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sint16-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sint16-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint16-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sint16-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sint16-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint16-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sint16-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sint16-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sint16-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint32

function arithmetics-sint32-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint32-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sint32-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sint32-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint32-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sint32-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sint32-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint32-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sint32-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sint32-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint32-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sint32-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sint32-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sint32-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint64

function arithmetics-sint64-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint64-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sint64-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sint64-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint64-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sint64-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sint64-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint64-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sint64-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sint64-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sint64-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sint64-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sint64-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sint64-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintmax

function arithmetics-sintmax-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintmax-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sintmax-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sintmax-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintmax-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sintmax-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sintmax-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintmax-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sintmax-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sintmax-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintmax-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sintmax-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sintmax-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sintmax-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintptr

function arithmetics-sintptr-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintptr-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    sintptr-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    sintptr-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintptr-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    sintptr-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    sintptr-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintptr-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    sintptr-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    sintptr-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    sintptr-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    sintptr-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    sintptr-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    sintptr-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ptrdiff

function arithmetics-ptrdiff-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    ptrdiff-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    ptrdiff-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    ptrdiff-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    ptrdiff-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    ptrdiff-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    ptrdiff-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    ptrdiff-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    ptrdiff-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    ptrdiff-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ptrdiff

function arithmetics-ptrdiff-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    ptrdiff-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    ptrdiff-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    ptrdiff-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    ptrdiff-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    ptrdiff-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    ptrdiff-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    ptrdiff-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    ptrdiff-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    ptrdiff-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    ptrdiff-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: off

function arithmetics-off-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    off-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    off-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    off-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    off-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    off-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    off-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    off-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    off-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    off-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    off-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    off-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    off-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    off-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: mode

function arithmetics-mode-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mode-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mode-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mode-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mode-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mode-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mode-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mode-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mode-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mode-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mode-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mode-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mode-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: pid

function arithmetics-pid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    pid-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    pid-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    pid-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    pid-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    pid-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    pid-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    pid-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    pid-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    pid-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    pid-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    pid-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    pid-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    pid-neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: uid

function arithmetics-uid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    uid-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    uid-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    uid-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    uid-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    uid-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    uid-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    uid-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    uid-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    uid-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    uid-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    uid-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    uid-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: gid

function arithmetics-gid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    gid-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    gid-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    gid-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    gid-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    gid-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    gid-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    gid-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    gid-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    gid-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    gid-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    gid-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    gid-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: wchar

function arithmetics-wchar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wchar-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    wchar-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    wchar-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wchar-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    wchar-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    wchar-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wchar-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    wchar-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    wchar-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wchar-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    wchar-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    wchar-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: wint

function arithmetics-wint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wint-add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    wint-add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    wint-add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wint-sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    wint-sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    wint-sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wint-mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    wint-mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    wint-mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    wint-div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    wint-div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    wint-div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
