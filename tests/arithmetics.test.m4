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

    mmux_pointer_add ROP QQ(OP) QQ(DELTA)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: schar

function arithmetics-schar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_schar_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_schar_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_schar_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_schar_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_schar_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    mmux_schar_mul ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_schar_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_schar_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_schar_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_schar_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sshort

function arithmetics-sshort-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sshort_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sshort_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sshort_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sshort_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sshort_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sshort_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sshort_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sshort_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sshort_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sshort_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint

function arithmetics-sint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sint_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sint_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sint_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sint_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sint_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sint_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sint_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sint_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sint_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sint_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: slong

function arithmetics-slong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_slong_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_slong_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_slong_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_slong_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_slong_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_slong_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_slong_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_slong_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_slong_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_slong_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sllong

function arithmetics-sllong-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sllong_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sllong_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sllong_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sllong_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sllong_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sllong_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sllong_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sllong_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sllong_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sllong_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint8

function arithmetics-sint8-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sint8_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sint8_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sint8_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sint8_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sint8_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    mmux_sint8_mul ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sint8_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sint8_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sint8_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sint8_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint16

function arithmetics-sint16-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sint16_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sint16_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sint16_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sint16_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sint16_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sint16_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sint16_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sint16_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sint16_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sint16_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint32

function arithmetics-sint32-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sint32_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sint32_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sint32_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sint32_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sint32_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sint32_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sint32_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sint32_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sint32_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sint32_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sint64

function arithmetics-sint64-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sint64_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sint64_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sint64_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sint64_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sint64_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sint64_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sint64_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sint64_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sint64_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sint64_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintmax

function arithmetics-sintmax-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sintmax_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sintmax_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sintmax_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sintmax_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sintmax_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sintmax_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sintmax_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sintmax_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sintmax_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sintmax_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sintptr

function arithmetics-sintptr-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_sintptr_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_sintptr_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_sintptr_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_sintptr_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_sintptr_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_sintptr_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_sintptr_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_sintptr_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_sintptr_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_sintptr_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ptrdiff

function arithmetics-ptrdiff-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_ptrdiff_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_ptrdiff_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_ptrdiff_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_ptrdiff_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_ptrdiff_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_ptrdiff_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_ptrdiff_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_ptrdiff_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_ptrdiff_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_ptrdiff_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: off

function arithmetics-off-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_off_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_off_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_off_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_off_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_off_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_off_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_off_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_off_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_off_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_off_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: mode

function arithmetics-mode-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_mode_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_mode_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_mode_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_mode_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_mode_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_mode_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_mode_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_mode_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_mode_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: pid

function arithmetics-pid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_pid_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_pid_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_pid_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-sub-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_pid_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_pid_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_pid_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_pid_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_pid_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='-1'

    mmux_pid_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_pid_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: uid

function arithmetics-uid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_uid_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_uid_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_uid_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_uid_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_uid_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_uid_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_uid_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_uid_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_uid_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: gid

function arithmetics-gid-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_gid_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_gid_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_gid_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_gid_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_gid_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_gid_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_gid_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_gid_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_gid_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: wchar

function arithmetics-wchar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_wchar_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_wchar_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_wchar_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_wchar_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_wchar_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_wchar_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_wchar_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_wchar_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_wchar_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: wint

function arithmetics-wint-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_wint_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_wint_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_wint_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_wint_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_wint_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_wint_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_wint_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_wint_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_wint_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
