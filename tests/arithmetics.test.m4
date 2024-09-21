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

    arithmetics-add-pointer ROP QQ(OP) QQ(DELTA)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: schar

function arithmetics-schar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-schar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-schar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    arithmetics-mul-schar ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-schar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-schar ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-schar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sshort

function arithmetics-sshort-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sshort ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sshort ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sshort ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sshort ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sshort ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sshort ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sshort ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sshort ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sshort ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sshort ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sshort ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sshort ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sshort ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint

function arithmetics-sint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sint ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: slong

function arithmetics-slong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-slong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-slong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-slong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-slong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-slong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-slong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-slong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-slong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-slong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-slong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-slong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-slong ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-slong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sllong

function arithmetics-sllong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sllong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sllong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sllong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sllong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sllong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sllong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sllong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sllong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sllong ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sllong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sllong ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sllong ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sllong ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint8

function arithmetics-sint8-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sint8 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sint8 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sint8 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sint8 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sint8 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sint8 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sint8 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sint8 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    arithmetics-mul-sint8 ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sint8 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sint8 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sint8 ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sint8 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint16

function arithmetics-sint16-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sint16 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sint16 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sint16 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sint16 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sint16 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sint16 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sint16 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sint16 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sint16 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sint16 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sint16 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sint16 ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sint16 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint32

function arithmetics-sint32-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sint32 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sint32 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sint32 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sint32 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sint32 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sint32 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sint32 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sint32 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sint32 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sint32 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sint32 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sint32 ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sint32 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint64

function arithmetics-sint64-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sint64 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sint64 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sint64 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sint64 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sint64 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sint64 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sint64 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sint64 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sint64 ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sint64 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sint64 ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sint64 ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sint64 ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintmax

function arithmetics-sintmax-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sintmax ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sintmax ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sintmax ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sintmax ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sintmax ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sintmax ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sintmax ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sintmax ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sintmax ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sintmax ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sintmax ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sintmax ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sintmax ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintptr

function arithmetics-sintptr-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-sintptr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-sintptr ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-sintptr ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-sintptr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-sintptr ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-sintptr ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-sintptr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-sintptr ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-sintptr ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-sintptr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-sintptr ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-sintptr ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-sintptr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ptrdiff

function arithmetics-ptrdiff-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ptrdiff

function arithmetics-ptrdiff-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-ptrdiff ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-ptrdiff ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-ptrdiff ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: off

function arithmetics-off-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-off ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-off ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-off ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-off ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-off ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-off ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-off ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-off ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-off ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-off ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-off ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-off ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-off ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: mode

function arithmetics-mode-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-mode ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-mode ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-mode ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-mode ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    arithmetics-sub-mode ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-mode ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-mode ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-mode ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-mode ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-mode ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-mode ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-mode ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: pid

function arithmetics-pid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-pid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-pid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-pid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-pid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    arithmetics-sub-pid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-pid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-pid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-pid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-pid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-pid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-pid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-pid ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    arithmetics-neg-pid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: uid

function arithmetics-uid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-uid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-uid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-uid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-uid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    arithmetics-sub-uid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-uid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-uid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-uid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-uid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-uid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-uid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-uid ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: gid

function arithmetics-gid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-gid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-gid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-gid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-gid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    arithmetics-sub-gid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-gid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-gid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-gid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-gid ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-gid ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-gid ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-gid ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: wchar

function arithmetics-wchar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-wchar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-wchar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-wchar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-wchar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    arithmetics-sub-wchar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-wchar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-wchar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-wchar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-wchar ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-wchar ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-wchar ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-wchar ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: wint

function arithmetics-wint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-add-wint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    arithmetics-add-wint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    arithmetics-add-wint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-sub-wint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    arithmetics-sub-wint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    arithmetics-sub-wint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-mul-wint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    arithmetics-mul-wint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    arithmetics-mul-wint ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    arithmetics-div-wint ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    arithmetics-div-wint ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    arithmetics-div-wint ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
