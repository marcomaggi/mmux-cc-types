#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for arithmetics builtins
#!# Date: Sep 19, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/arithmetics.test ; less tests/arithmetics.log
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
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)


#### helpers

declare -r A='(1.200000000000000)+i*(3.400000000000000)'
declare -r B='(5.600000000000000)+i*(7.800000000000000)'
declare -r C='(9.000000000000000)+i*(1.200000000000000)'
declare -r D='(3.400000000000000)+i*(5.600000000000000)'
declare -r E='(7.800000000000000)+i*(9.000000000000000)'

declare -r A_add_B='(6.800000000000000e+00)+i*(1.120000000000000e+01)'
declare -r A_sub_B='(-4.399999999999999)+i*(-4.400000000000000)'
declare -r A_mul_B='(-19.80000000000000)+i*(28.40000000000000)'
declare -r A_div_B='(0.360520607375271)+i*(0.104989154013015)'
declare -r A_add_B_add_C_add_D_add_E='(27)+i*(27)'
declare -r A_sub_B_sub_C_sub_D_sub_E='(-24.60000000000000)+i*(-20.20000000000000)'
declare -r A_mul_B_mul_C_mul_D_mul_E='(-12151.82880000000)+i*(-21304.49760000000)'
declare -r A_div_B_div_C_div_D_div_E='(-8.456207236339466e-05)+i*(-5.232502561493486e-04)'

declare -r neg_A='(-1.200000000000000)+i*(-3.400000000000000)'
declare -r inv_A='(9.230769230769233e-02)+i*(-2.615384615384616e-01i)'


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

### ------------------------------------------------------------------------

function arithmetics-schar-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-schar-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_schar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_schar_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-schar-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_schar_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: uchar

function arithmetics-uchar-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_add ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_uchar_add ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_uchar_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_sub ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-sub-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 - 2))

    mmux_uchar_sub ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_uchar_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_mul ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_uchar_mul ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((1 * 2 * 3))

    mmux_uchar_mul ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_div ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_uchar_div ROP QQ(OP0) QQ(OP1)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-div-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3
    declare -r EXPECTED_ROP=$((100 / 2 / 3))

    mmux_uchar_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-mod-1.1 () {
    declare ROP OP1=11 OP2=3
    declare -r EXPECTED_ROP=$(( WW(OP1) % WW(OP2) ))

    mmux_uchar_mod ROP WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-neg-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=$mmux_uchar_MAX

    mmux_uchar_neg ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uchar-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_uchar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_uchar_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uchar-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_uchar_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sshort-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sshort-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sshort_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sshort_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sshort-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sshort_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-ushort-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ushort_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ushort-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_ushort_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sint_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sint_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sint_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-slong-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-slong-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_slong_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_slong_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-slong-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_slong_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: sllong

if test -v mmux_sllong_SIZEOF
then

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

### ------------------------------------------------------------------------

function arithmetics-sllong-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sllong-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sllong_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sllong_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sllong-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sllong_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

fi


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

### ------------------------------------------------------------------------

function arithmetics-sint8-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint8-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sint8_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sint8_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint8-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sint8_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sint16-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint16-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sint16_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sint16_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint16-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sint16_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sint32-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint32-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sint32_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sint32_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint32-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sint32_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sint64-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sint64-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sint64_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sint64_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sint64-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sint64_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sintmax-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintmax-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sintmax_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sintmax_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintmax-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sintmax_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-sintptr-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-sintptr-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_sintptr_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_sintptr_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-sintptr-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_sintptr_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ptrdiff-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_ptrdiff_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_ptrdiff_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ptrdiff-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_ptrdiff_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-off-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-off-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_off_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_off_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-off-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_off_decr ROP QQ(OP)
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

### ------------------------------------------------------------------------

function arithmetics-mode-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-mode-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_mode_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_mode_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-mode-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_mode_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
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

### ------------------------------------------------------------------------

function arithmetics-pid-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-pid-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_pid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_pid_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-pid-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_pid_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
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

### ------------------------------------------------------------------------

function arithmetics-uid-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-uid-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_uid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_uid_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-uid-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_uid_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
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

### ------------------------------------------------------------------------

function arithmetics-gid-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-gid-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_gid_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_gid_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-gid-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_gid_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
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

### ------------------------------------------------------------------------

function arithmetics-wchar-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wchar-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_wchar_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_wchar_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wchar-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_wchar_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
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

### ------------------------------------------------------------------------

function arithmetics-wint-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-wint-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0'

    mmux_wint_inv ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-incr-1.1 () {
    declare ROP OP=99
    declare -r EXPECTED_ROP='100'

    mmux_wint_incr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-wint-decr-1.1 () {
    declare ROP OP=100
    declare -r EXPECTED_ROP='99'

    mmux_wint_decr ROP QQ(OP)
    dotest-equal QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: float

function arithmetics-float-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float_add ROP QQ(OP)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float_add ROP QQ(OP0) QQ(OP1)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float_sub ROP QQ(OP)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float_sub ROP QQ(OP0) QQ(OP1)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float_mul ROP QQ(OP)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float_mul ROP QQ(OP0) QQ(OP1)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float_div ROP QQ(OP)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float_div ROP QQ(OP0) QQ(OP1)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float_inv ROP QQ(OP)
    mmux_float_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float_inv ROP QQ(OP)
    mmux_float_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: double

function arithmetics-double-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_double_add ROP QQ(OP)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_double_add ROP QQ(OP0) QQ(OP1)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_double_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-double-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_double_sub ROP QQ(OP)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_double_sub ROP QQ(OP0) QQ(OP1)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_double_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-double-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_double_mul ROP QQ(OP)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_double_mul ROP QQ(OP0) QQ(OP1)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_double_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-double-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_double_div ROP QQ(OP)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_double_div ROP QQ(OP0) QQ(OP1)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_double_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_double_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-double-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_double_inv ROP QQ(OP)
    mmux_double_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-double-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_double_inv ROP QQ(OP)
    mmux_double_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}


#### type variables: ldouble

if test -v mmux_ldouble_SIZEOF
then

function arithmetics-ldouble-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ldouble_add ROP QQ(OP)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_ldouble_add ROP QQ(OP0) QQ(OP1)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_ldouble_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ldouble-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ldouble_sub ROP QQ(OP)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_ldouble_sub ROP QQ(OP0) QQ(OP1)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_ldouble_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ldouble-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ldouble_mul ROP QQ(OP)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_ldouble_mul ROP QQ(OP0) QQ(OP1)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_ldouble_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ldouble-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ldouble_div ROP QQ(OP)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_ldouble_div ROP QQ(OP0) QQ(OP1)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_ldouble_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    dotest-unset-debug
    dotest-debug QQ(EXPECTED_ROP) QQ(ROP)
    mmux_ldouble_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-ldouble-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ldouble_inv ROP QQ(OP)
    mmux_ldouble_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-ldouble-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_ldouble_inv ROP QQ(OP)
    mmux_ldouble_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float32

if test -v mmux_float32_SIZEOF
then

function arithmetics-float32-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32_add ROP QQ(OP)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float32_add ROP QQ(OP0) QQ(OP1)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float32_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32_sub ROP QQ(OP)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float32_sub ROP QQ(OP0) QQ(OP1)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float32_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32_mul ROP QQ(OP)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float32_mul ROP QQ(OP0) QQ(OP1)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float32_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32_div ROP QQ(OP)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float32_div ROP QQ(OP0) QQ(OP1)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float32_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32_inv ROP QQ(OP)
    mmux_float32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float32_inv ROP QQ(OP)
    mmux_float32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float64

if test -v mmux_float64_SIZEOF
then

function arithmetics-float64-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64_add ROP QQ(OP)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float64_add ROP QQ(OP0) QQ(OP1)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float64_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64_sub ROP QQ(OP)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float64_sub ROP QQ(OP0) QQ(OP1)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float64_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64_mul ROP QQ(OP)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float64_mul ROP QQ(OP0) QQ(OP1)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float64_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64_div ROP QQ(OP)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float64_div ROP QQ(OP0) QQ(OP1)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float64_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64_inv ROP QQ(OP)
    mmux_float64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float64_inv ROP QQ(OP)
    mmux_float64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float128

if test -v mmux_float128_SIZEOF
then

function arithmetics-float128-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128_add ROP QQ(OP)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float128_add ROP QQ(OP0) QQ(OP1)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float128_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128_sub ROP QQ(OP)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float128_sub ROP QQ(OP0) QQ(OP1)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float128_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128_mul ROP QQ(OP)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float128_mul ROP QQ(OP0) QQ(OP1)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float128_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128_div ROP QQ(OP)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float128_div ROP QQ(OP0) QQ(OP1)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float128_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128_inv ROP QQ(OP)
    mmux_float128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float128_inv ROP QQ(OP)
    mmux_float128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float32x

if test -v mmux_float32x_SIZEOF
then

function arithmetics-float32x-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32x_add ROP QQ(OP)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float32x_add ROP QQ(OP0) QQ(OP1)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float32x_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32x-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32x_sub ROP QQ(OP)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float32x_sub ROP QQ(OP0) QQ(OP1)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float32x_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32x-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32x_mul ROP QQ(OP)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float32x_mul ROP QQ(OP0) QQ(OP1)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float32x_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32x-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32x_div ROP QQ(OP)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float32x_div ROP QQ(OP0) QQ(OP1)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float32x_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float32x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float32x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float32x_inv ROP QQ(OP)
    mmux_float32x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float32x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float32x_inv ROP QQ(OP)
    mmux_float32x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float64x

if test -v mmux_float64x_SIZEOF
then

function arithmetics-float64x-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64x_add ROP QQ(OP)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float64x_add ROP QQ(OP0) QQ(OP1)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float64x_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64x-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64x_sub ROP QQ(OP)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float64x_sub ROP QQ(OP0) QQ(OP1)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float64x_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64x-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64x_mul ROP QQ(OP)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float64x_mul ROP QQ(OP0) QQ(OP1)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float64x_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64x-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64x_div ROP QQ(OP)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float64x_div ROP QQ(OP0) QQ(OP1)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float64x_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float64x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float64x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float64x_inv ROP QQ(OP)
    mmux_float64x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float64x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float64x_inv ROP QQ(OP)
    mmux_float64x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: float128x

if test -v mmux_float128x_SIZEOF
then

function arithmetics-float128x-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128x_add ROP QQ(OP)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_float128x_add ROP QQ(OP0) QQ(OP1)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_float128x_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128x-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128x_sub ROP QQ(OP)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_float128x_sub ROP QQ(OP0) QQ(OP1)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_float128x_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128x-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128x_mul ROP QQ(OP)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_float128x_mul ROP QQ(OP0) QQ(OP1)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_float128x_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128x-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128x_div ROP QQ(OP)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_float128x_div ROP QQ(OP0) QQ(OP1)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_float128x_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_float128x_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-float128x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_float128x_inv ROP QQ(OP)
    mmux_float128x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-float128x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_float128x_inv ROP QQ(OP)
    mmux_float128x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: decimal32

if test -v mmux_decimal32_SIZEOF
then

function arithmetics-decimal32-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal32_add ROP QQ(OP)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_decimal32_add ROP QQ(OP0) QQ(OP1)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_decimal32_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal32-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal32_sub ROP QQ(OP)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_decimal32_sub ROP QQ(OP0) QQ(OP1)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_decimal32_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal32-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal32_mul ROP QQ(OP)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_decimal32_mul ROP QQ(OP0) QQ(OP1)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_decimal32_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal32-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal32_div ROP QQ(OP)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_decimal32_div ROP QQ(OP0) QQ(OP1)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_decimal32_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_decimal32_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal32-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal32_inv ROP QQ(OP)
    mmux_decimal32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal32-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_decimal32_inv ROP QQ(OP)
    mmux_decimal32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: decimal64

if test -v mmux_decimal64_SIZEOF
then

function arithmetics-decimal64-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal64_add ROP QQ(OP)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_decimal64_add ROP QQ(OP0) QQ(OP1)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_decimal64_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal64-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal64_sub ROP QQ(OP)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_decimal64_sub ROP QQ(OP0) QQ(OP1)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_decimal64_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal64-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal64_mul ROP QQ(OP)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_decimal64_mul ROP QQ(OP0) QQ(OP1)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_decimal64_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal64-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal64_div ROP QQ(OP)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_decimal64_div ROP QQ(OP0) QQ(OP1)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_decimal64_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_decimal64_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal64-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal64_inv ROP QQ(OP)
    mmux_decimal64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal64-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_decimal64_inv ROP QQ(OP)
    mmux_decimal64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: decimal128

if test -v mmux_decimal128_SIZEOF
then

function arithmetics-decimal128-add-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal128_add ROP QQ(OP)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-add-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_decimal128_add ROP QQ(OP0) QQ(OP1)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-add-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7 + 11 + 13))

    mmux_decimal128_add ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal128-sub-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal128_sub ROP QQ(OP)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-sub-1.2 () {
    declare ROP OP0=100 OP1=2
    declare -r EXPECTED_ROP=$((100 - 2))

    mmux_decimal128_sub ROP QQ(OP0) QQ(OP1)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-sub-1.3 () {
    declare ROP OP0=100 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((100 - 2 - 3 - 5 - 7 - 11 - 13))

    mmux_decimal128_sub ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal128-mul-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal128_mul ROP QQ(OP)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-mul-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_decimal128_mul ROP QQ(OP0) QQ(OP1)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-mul-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7 * 11 * 13))

    mmux_decimal128_mul ROP QQ(OP0) QQ(OP1) QQ(OP2) QQ(OP3) QQ(OP4) QQ(OP5) QQ(OP6)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal128-div-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal128_div ROP QQ(OP)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-div-1.2 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_decimal128_div ROP QQ(OP0) QQ(OP1)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-div-1.3 () {
    declare ROP OP0=500 OP1=2 OP2=5
    declare -r EXPECTED_ROP=$(( 500 / 2 / 5))

    mmux_decimal128_div ROP QQ(OP0) QQ(OP1) QQ(OP2)
    mmux_decimal128_equal QQ(EXPECTED_ROP) QQ(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-decimal128-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_decimal128_inv ROP QQ(OP)
    mmux_decimal128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-decimal128-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_decimal128_inv ROP QQ(OP)
    mmux_decimal128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf

if test -v mmux_complexf_SIZEOF
then

function arithmetics-complexf-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf_add ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf_add ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf_add ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf_add ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf_sub ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf_sub ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf_sub ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf_sub ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf_mul ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf_mul ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf_mul ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare EXPECTED_ROP=$A_mul_B
    declare ABSOLUTE_MARGIN_COMPLEXF='(1e-4)+i*(1e-4)'

    mmux_complexf_mul ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    mmux_complexf_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E
    declare ABSOLUTE_MARGIN_COMPLEXF='(1e-4)+i*(1e-4)'

    mmux_complexf_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    mmux_complexf_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf_div ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf_div ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf_div ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf_div ROP WW(OP0) WW(OP1)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf_neg ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf_neg ROP WW(OP)
    mmux_complexf_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf_inv ROP QQ(OP)
    mmux_complexf_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf_inv ROP QQ(OP)
    mmux_complexf_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf_inv ROP QQ(OP)
    mmux_complexf_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexd

if test -v mmux_complexd_SIZEOF
then

function arithmetics-complexd-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd_add ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd_add ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexd_add ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexd_add ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexd_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexd_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd_sub ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd_sub ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexd_sub ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexd_sub ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexd_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexd_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd_mul ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd_mul ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexd_mul ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexd_mul ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexd_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexd_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd_div ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd_div ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexd_div ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexd_div ROP WW(OP0) WW(OP1)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexd_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexd_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexd_neg ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexd_neg ROP WW(OP)
    mmux_complexd_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexd_inv ROP QQ(OP)
    mmux_complexd_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexd_inv ROP QQ(OP)
    mmux_complexd_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexd_inv ROP QQ(OP)
    mmux_complexd_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexld

if test -v mmux_complexld_SIZEOF
then

function arithmetics-complexld-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexld_add ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexld_add ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexld_add ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexld_add ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexld_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexld_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexld-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexld_sub ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexld_sub ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexld_sub ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexld_sub ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexld_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexld_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexld-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexld_mul ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexld_mul ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexld_mul ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexld_mul ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexld_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexld_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexld-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexld_div ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexld_div ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-div-1.2.1 () {
    declare ROP OP0=10 OP1=2
    declare -r EXPECTED_ROP=$((10 / 2))

    mmux_complexld_div ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexld_div ROP WW(OP0) WW(OP1)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexld_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexld_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexld-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexld_neg ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexld-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexld_neg ROP WW(OP)
    mmux_complexld_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexld-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexld_inv ROP QQ(OP)
    mmux_complexld_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexld-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexld_inv ROP QQ(OP)
    mmux_complexld_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexld-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexld_inv ROP QQ(OP)
    mmux_complexld_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf32

if test -v mmux_complexf32_SIZEOF
then

#### type variables: complexf32

function arithmetics-complexf32-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32_add ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32_add ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf32_add ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf32_add ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf32_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf32_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32_sub ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32_sub ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf32_sub ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf32_sub ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf32_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf32_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32_mul ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32_mul ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf32_mul ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf32_mul ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf32_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf32_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32_div ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32_div ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf32_div ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf32_div ROP WW(OP0) WW(OP1)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf32_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf32_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf32_neg ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf32_neg ROP WW(OP)
    mmux_complexf32_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf32_inv ROP QQ(OP)
    mmux_complexf32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf32-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf32_inv ROP QQ(OP)
    mmux_complexf32_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf32-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf32_inv ROP QQ(OP)
    mmux_complexf32_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf64

if test -v mmux_complexf64_SIZEOF
then

#### type variables: complexf64

function arithmetics-complexf64-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64_add ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64_add ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf64_add ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf64_add ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf64_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf64_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64_sub ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64_sub ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf64_sub ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf64_sub ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf64_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf64_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64_mul ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64_mul ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf64_mul ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf64_mul ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf64_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf64_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64_div ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64_div ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf64_div ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf64_div ROP WW(OP0) WW(OP1)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf64_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf64_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf64_neg ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf64_neg ROP WW(OP)
    mmux_complexf64_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf64_inv ROP QQ(OP)
    mmux_complexf64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf64-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf64_inv ROP QQ(OP)
    mmux_complexf64_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf64-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf64_inv ROP QQ(OP)
    mmux_complexf64_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf128

if test -v mmux_complexf128_SIZEOF
then

#### type variables: complexf128

function arithmetics-complexf128-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128_add ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128_add ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf128_add ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf128_add ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf128_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf128_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128_sub ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128_sub ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf128_sub ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf128_sub ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf128_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf128_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128_mul ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128_mul ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf128_mul ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf128_mul ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf128_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf128_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128_div ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128_div ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf128_div ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf128_div ROP WW(OP0) WW(OP1)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf128_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf128_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf128_neg ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf128_neg ROP WW(OP)
    mmux_complexf128_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf128_inv ROP QQ(OP)
    mmux_complexf128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf128-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf128_inv ROP QQ(OP)
    mmux_complexf128_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf128-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf128_inv ROP QQ(OP)
    mmux_complexf128_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf32x

if test -v mmux_complexf32x_SIZEOF
then

#### type variables: complexf32x

function arithmetics-complexf32x-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32x_add ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32x_add ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf32x_add ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf32x_add ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf32x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf32x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32x-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32x_sub ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32x_sub ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf32x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf32x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf32x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf32x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32x-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32x_mul ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32x_mul ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf32x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf32x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf32x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf32x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32x-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf32x_div ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf32x_div ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf32x_div ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf32x_div ROP WW(OP0) WW(OP1)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf32x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf32x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32x-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf32x_neg ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf32x-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf32x_neg ROP WW(OP)
    mmux_complexf32x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf32x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf32x_inv ROP QQ(OP)
    mmux_complexf32x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf32x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf32x_inv ROP QQ(OP)
    mmux_complexf32x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf32x-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf32x_inv ROP QQ(OP)
    mmux_complexf32x_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf64x

if test -v mmux_complexf64x_SIZEOF
then

#### type variables: complexf64x

function arithmetics-complexf64x-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64x_add ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64x_add ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf64x_add ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf64x_add ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf64x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf64x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64x-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64x_sub ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64x_sub ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf64x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf64x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf64x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf64x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64x-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64x_mul ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64x_mul ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf64x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf64x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf64x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf64x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64x-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf64x_div ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf64x_div ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf64x_div ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf64x_div ROP WW(OP0) WW(OP1)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf64x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf64x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64x-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf64x_neg ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf64x-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf64x_neg ROP WW(OP)
    mmux_complexf64x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf64x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf64x_inv ROP QQ(OP)
    mmux_complexf64x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf64x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf64x_inv ROP QQ(OP)
    mmux_complexf64x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf64x-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf64x_inv ROP QQ(OP)
    mmux_complexf64x_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexf128x

if test -v mmux_complexf128x_SIZEOF
then

#### type variables: complexf128x

function arithmetics-complexf128x-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128x_add ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128x_add ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexf128x_add ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexf128x_add ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexf128x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexf128x_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128x-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128x_sub ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128x_sub ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexf128x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexf128x_sub ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexf128x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexf128x_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128x-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128x_mul ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128x_mul ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexf128x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_mul_B

    mmux_complexf128x_mul ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexf128x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E

    mmux_complexf128x_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128x-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexf128x_div ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexf128x_div ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexf128x_div ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexf128x_div ROP WW(OP0) WW(OP1)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexf128x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexf128x_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128x-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexf128x_neg ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexf128x-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexf128x_neg ROP WW(OP)
    mmux_complexf128x_equal_relepsilon WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexf128x-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexf128x_inv ROP QQ(OP)
    mmux_complexf128x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf128x-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexf128x_inv ROP QQ(OP)
    mmux_complexf128x_equal_relepsilon QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexf128x-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexf128x_inv ROP QQ(OP)
    mmux_complexf128x_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexd32

if test -v mmux_complexd32_SIZEOF
then

function arithmetics-complexd32-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd32_add ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd32_add ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexd32_add ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexd32_add ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexd32_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexd32_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd32-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd32_sub ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd32_sub ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexd32_sub ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexd32_sub ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexd32_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexd32_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd32-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd32_mul ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd32_mul ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexd32_mul ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare EXPECTED_ROP=$A_mul_B
    declare ABSOLUTE_MARGIN_COMPLEXD32='(1e-4)+i*(1e-4)'

    mmux_complexd32_mul ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    mmux_complexd32_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexd32_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E
    declare ABSOLUTE_MARGIN_COMPLEXD32='(1)+i*(1)'

    mmux_complexd32_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    mmux_complexd32_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd32-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd32_div ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd32_div ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexd32_div ROP WW(OP0) WW(OP1)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexd32_div ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexd32_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexd32_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd32-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexd32_neg ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd32-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexd32_neg ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd32-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexd32_inv ROP QQ(OP)
    mmux_complexd32_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd32-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexd32_inv ROP QQ(OP)
    mmux_complexd32_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd32-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexd32_inv ROP QQ(OP)
    mmux_complexd32_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexd64

if test -v mmux_complexd64_SIZEOF
then

function arithmetics-complexd64-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd64_add ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd64_add ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexd64_add ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexd64_add ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexd64_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexd64_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd64-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd64_sub ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd64_sub ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexd64_sub ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexd64_sub ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexd64_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexd64_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd64-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd64_mul ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd64_mul ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexd64_mul ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare EXPECTED_ROP=$A_mul_B
    declare ABSOLUTE_MARGIN_COMPLEXD64='(1e-4)+i*(1e-4)'

    mmux_complexd64_mul ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    mmux_complexd64_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexd64_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E
    declare ABSOLUTE_MARGIN_COMPLEXD64='(1e-4)+i*(1e-4)'

    mmux_complexd64_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    mmux_complexd64_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd64-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd64_div ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd64_div ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexd64_div ROP WW(OP0) WW(OP1)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexd64_div ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexd64_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexd64_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd64-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexd64_neg ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd64-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexd64_neg ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd64-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexd64_inv ROP QQ(OP)
    mmux_complexd64_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd64-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexd64_inv ROP QQ(OP)
    mmux_complexd64_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd64-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexd64_inv ROP QQ(OP)
    mmux_complexd64_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### type variables: complexd128

if test -v mmux_complexd128_SIZEOF
then

function arithmetics-complexd128-add-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd128_add ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-add-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd128_add ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-add-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 + 2))

    mmux_complexd128_add ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-add-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_add_B
    declare DEBUG_EXPECTED_ROP

    mmux_complexd128_add ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-add-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 + 2 + 3 + 5 + 7))

    mmux_complexd128_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-add-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_add_B_add_C_add_D_add_E

    mmux_complexd128_add ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd128-sub-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd128_sub ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-sub-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd128_sub ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-sub-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 - 2))

    mmux_complexd128_sub ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-sub-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_sub_B

    mmux_complexd128_sub ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-sub-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 - 2 - 3 - 5 - 7))

    mmux_complexd128_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-sub-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_sub_B_sub_C_sub_D_sub_E

    mmux_complexd128_sub ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd128-mul-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd128_mul ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-mul-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd128_mul ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-mul-1.2.1 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 * 2))

    mmux_complexd128_mul ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-mul-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare EXPECTED_ROP=$A_mul_B
    declare ABSOLUTE_MARGIN_COMPLEXD128='(1e-4)+i*(1e-4)'

    mmux_complexd128_mul ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    mmux_complexd128_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-mul-1.3.1 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7
    declare -r EXPECTED_ROP=$((1 * 2 * 3 * 5 * 7))

    mmux_complexd128_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-mul-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare EXPECTED_ROP=$A_mul_B_mul_C_mul_D_mul_E
    declare ABSOLUTE_MARGIN_COMPLEXD128='(1e-4)+i*(1e-4)'

    mmux_complexd128_mul ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    mmux_complexd128_add EXPECTED_ROP WW(EXPECTED_ROP)
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd128-div-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='1'

    mmux_complexd128_div ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-div-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$A

    mmux_complexd128_div ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-div-1.2.1 () {
    declare ROP OP0=10 OP1=5
    declare -r EXPECTED_ROP=$((10 / 5))

    mmux_complexd128_div ROP WW(OP0) WW(OP1)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-div-1.2.2 () {
    declare ROP OP0=$A OP1=$B
    declare -r EXPECTED_ROP=$A_div_B

    mmux_complexd128_div ROP WW(OP0) WW(OP1)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-div-1.3.1 () {
    declare ROP OP1=2 OP2=3 OP3=5 OP4=7
    declare OP0=$((10 * WW(OP1) * WW(OP2) * WW(OP3) * WW(OP4)))
    declare -r EXPECTED_ROP='10'

    mmux_complexd128_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-div-1.3.2 () {
    declare ROP OP0=$A OP1=$B OP2=$C OP3=$D OP4=$E
    declare -r EXPECTED_ROP=$A_div_B_div_C_div_D_div_E

    mmux_complexd128_div ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd128-neg-1.1.1 () {
    declare ROP OP='1'
    declare -r EXPECTED_ROP='-1'

    mmux_complexd128_neg ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function arithmetics-complexd128-neg-1.1.2 () {
    declare ROP OP=$A
    declare -r EXPECTED_ROP=$neg_A

    mmux_complexd128_neg ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function arithmetics-complexd128-inv-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_complexd128_inv ROP QQ(OP)
    mmux_complexd128_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd128-inv-1.2 () {
    declare ROP OP=10
    declare -r EXPECTED_ROP='0.1'

    mmux_complexd128_inv ROP QQ(OP)
    mmux_complexd128_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}
function arithmetics-complexd128-inv-1.3 () {
    declare ROP OP=$A
    declare EXPECTED_ROP=$inv_A

    mmux_complexd128_inv ROP QQ(OP)
    mmux_complexd128_equal_absmargin QQ(EXPECTED_ROP) QQ(ROP)
}

fi


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
