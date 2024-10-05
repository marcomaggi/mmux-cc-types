#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for complex builtins
#!# Date: Sep 29, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/complex.test ; less tests/complex.log
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

declare -r A_rep='1.200000000000000'
declare -r A_imp='3.400000000000000'

declare -r A_abs='3.605551275463989'
declare -r A_arg='1.231503712340852'
declare -r A_conj='(1.200000000000000)+i*(-3.400000000000000)'


#### type variables: complexf

function complex-complexf-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf_real_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf_real_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf_real_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf_imag_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf_imag_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf_imag_part ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf_abs ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf_abs ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf_arg ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf_arg ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf_conj ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf_conj ROP WW(OP)
    mmux_complexf_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: complexd

function complex-complexd-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexd_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexd_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexd_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexd_real_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd_real_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexd_real_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexd_imag_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd_imag_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexd_imag_part ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexd_abs ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd_abs ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexd_arg ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd_arg ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexd_conj ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd_conj ROP WW(OP)
    mmux_complexd_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: complexld

if test -v mmux_complexld_SIZEOF
then

function complex-complexld-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexld_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexld_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexld_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexld_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexld-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexld_real_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexld_real_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexld_real_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexld-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexld_imag_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexld_imag_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexld_imag_part ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexld-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexld_abs ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexld_abs ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexld-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexld_arg ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexld_arg ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexld-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexld_conj ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexld-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexld_conj ROP WW(OP)
    mmux_complexld_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf32

if test -v mmux_complexf32_SIZEOF
then

function complex-complexf32-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf32_real_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32_real_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf32_real_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf32_imag_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf32_imag_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf32_imag_part ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf32_abs ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32_abs ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf32_arg ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf32_arg ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf32_conj ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32_conj ROP WW(OP)
    mmux_complexf32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf64

if test -v mmux_complexf64_SIZEOF
then

function complex-complexf64-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf64_real_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64_real_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf64_real_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf64_imag_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf64_imag_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf64_imag_part ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf64_abs ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64_abs ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf64_arg ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf64_arg ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf64_conj ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64_conj ROP WW(OP)
    mmux_complexf64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf128

if test -v mmux_complexf128_SIZEOF
then

function complex-complexf128-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf128_real_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128_real_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf128_real_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf128_imag_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf128_imag_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf128_imag_part ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf128_abs ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128_abs ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf128_arg ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf128_arg ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf128_conj ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128_conj ROP WW(OP)
    mmux_complexf128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf32x

if test -v mmux_complexf32x_SIZEOF
then

function complex-complexf32x-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf32x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32x_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf32x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf32x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32x-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf32x_real_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32x_real_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf32x_real_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32x-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf32x_imag_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf32x_imag_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf32x_imag_part ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32x-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf32x_abs ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32x_abs ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32x-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf32x_arg ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf32x_arg ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf32x-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf32x_conj ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf32x-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf32x_conj ROP WW(OP)
    mmux_complexf32x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf64x

if test -v mmux_complexf64x_SIZEOF
then

function complex-complexf64x-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf64x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64x_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf64x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf64x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64x-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf64x_real_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64x_real_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf64x_real_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64x-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf64x_imag_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf64x_imag_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf64x_imag_part ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64x-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf64x_abs ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64x_abs ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64x-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf64x_arg ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf64x_arg ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf64x-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf64x_conj ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf64x-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf64x_conj ROP WW(OP)
    mmux_complexf64x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexf128x

if test -v mmux_complexf128x_SIZEOF
then

function complex-complexf128x-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexf128x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128x_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexf128x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexf128x_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128x-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexf128x_real_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128x_real_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexf128x_real_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128x-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexf128x_imag_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf128x_imag_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexf128x_imag_part ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128x-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexf128x_abs ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128x_abs ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128x-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexf128x_arg ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexf128x_arg ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexf128x-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexf128x_conj ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexf128x-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexf128x_conj ROP WW(OP)
    mmux_complexf128x_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexd32

if test -v mmux_complexd32_SIZEOF
then

function complex-complexd32-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexd32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd32_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexd32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexd32_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd32-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexd32_real_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd32_real_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexd32_real_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd32-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexd32_imag_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd32_imag_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexd32_imag_part ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd32-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexd32_abs ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd32_abs ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd32-arg-1.1 () {
    declare ABSOLUTE_MARGIN_COMPLEXD32='1e-4'
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexd32_arg ROP WW(OP)
    dotest-unset-debug
    dotest-debug WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd32_arg ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd32-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexd32_conj ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd32-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd32_conj ROP WW(OP)
    mmux_complexd32_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexd64

if test -v mmux_complexd64_SIZEOF
then

function complex-complexd64-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexd64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd64_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexd64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexd64_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd64-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexd64_real_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd64_real_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexd64_real_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd64-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexd64_imag_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd64_imag_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexd64_imag_part ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd64-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexd64_abs ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd64_abs ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd64-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexd64_arg ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd64_arg ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd64-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexd64_conj ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd64-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd64_conj ROP WW(OP)
    mmux_complexd64_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexd128

if test -v mmux_complexd128_SIZEOF
then

function complex-complexd128-make-rectangular-1.1 () {
    declare ROP REP=WW(A_rep) IMP=WW(A_imp)
    declare -r EXPECTED_ROP=WW(A)

    mmux_complexd128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd128_sub DIFF WW(EXPECTED_ROP) WW(ROP)
    dotest-unset-debug
    dotest-debug WW(DIFF) WW(EXPECTED_ROP) WW(ROP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-make-rectangular-1.2 () {
    declare ROP REP=99 IMP=0
    declare -r EXPECTED_ROP='(99)+i*(0)'

    mmux_complexd128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-make-rectangular-1.3 () {
    declare ROP REP=0 IMP=99
    declare -r EXPECTED_ROP='(0)+i*(99)'

    mmux_complexd128_make_rectangular ROP WW(REP) WW(IMP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd128-real-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_rep)

    mmux_complexd128_real_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-real-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd128_real_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-real-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=0

    mmux_complexd128_real_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd128-imag-part-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_imp)

    mmux_complexd128_imag_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-imag-part-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd128_imag_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-imag-part-1.3 () {
    declare ROP OP='(0)+i*(1)'
    declare -r EXPECTED_ROP=1

    mmux_complexd128_imag_part ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd128-abs-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_abs)

    mmux_complexd128_abs ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-abs-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd128_abs ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd128-arg-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_arg)

    mmux_complexd128_arg ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-arg-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=0

    mmux_complexd128_arg ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function complex-complexd128-conj-1.1 () {
    declare ROP OP=WW(A)
    declare -r EXPECTED_ROP=WW(A_conj)

    mmux_complexd128_conj ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}
function complex-complexd128-conj-1.2 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP=1

    mmux_complexd128_conj ROP WW(OP)
    mmux_complexd128_equal_absmargin WW(EXPECTED_ROP) WW(ROP)
}

fi


#### let's go

dotest complex-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
