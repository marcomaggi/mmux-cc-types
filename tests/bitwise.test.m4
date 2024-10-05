#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for bitwise builtins
#!# Date: Sep 19, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/bitwise.test ; less tests/bitwise.log
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


#### bitwise operations for type: pointer

function bitwise-pointer-and-1.1 () {
    declare ROP OP='0b11110000' MASK=0b11001100
    declare EXPECTED_ROP=0b11000000

    mmux_pointer_add EXPECTED_ROP WW(EXPECTED_ROP) 0

    mmux_pointer_bitwise_and ROP WW(OP) WW(MASK)

    dotest-unset-debug
    dotest-debug ROP=WW(ROP) EXPECTED_ROP=WW(EXPECTED_ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-or-1.1 () {
    declare ROP OP='0b11110000' MASK=0b11001100
    declare EXPECTED_ROP=0b11111100

    mmux_pointer_add EXPECTED_ROP WW(EXPECTED_ROP) 0

    mmux_pointer_bitwise_or ROP WW(OP) WW(MASK)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-xor-1.1 () {
    declare ROP OP='0b11110000' MASK=0b11001100
    declare EXPECTED_ROP=0b00111100

    mmux_pointer_add EXPECTED_ROP WW(EXPECTED_ROP) 0

    mmux_pointer_bitwise_xor ROP WW(OP) WW(MASK)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-not-1.1 () {
    declare ROP OP=$mmux_pointer_MAX
    declare EXPECTED_ROP=0x0

    mmux_pointer_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-pointer-not-1.2 () {
    declare ROP OP=$mmux_pointer_MIN
    declare EXPECTED_ROP=$mmux_pointer_MAX

    mmux_pointer_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=0x$(( 1 << 3 ))

    mmux_pointer_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pointer-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=0x$(( 8 >> 3 ))

    mmux_pointer_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: schar

function bitwise-schar-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-schar-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_schar_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-schar-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_schar_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-schar-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_schar_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-schar-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_schar_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_schar_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-schar-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_schar_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-schar-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_schar_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-schar-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_schar_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_schar_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-schar-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_schar_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uchar

function bitwise-uchar-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uchar-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uchar_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uchar-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uchar_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uchar-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uchar-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uchar_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uchar-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uchar_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uchar-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uchar_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uchar-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uchar_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uchar-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uchar_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uchar-1.1 () {
    declare ROP OP=$mmux_uchar_MAX
    declare EXPECTED_ROP=0

    mmux_uchar_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uchar-1.2 () {
    declare ROP OP=$mmux_uchar_MIN
    declare EXPECTED_ROP=$mmux_uchar_MAX

    mmux_uchar_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uchar-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uchar_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uchar-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uchar_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sshort

function bitwise-sshort-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sshort-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sshort_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sshort-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sshort_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sshort-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sshort-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sshort_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sshort-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sshort_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sshort-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sshort_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sshort-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sshort_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sshort-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sshort_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sshort-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sshort_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sshort-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sshort_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sshort-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sshort_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: ushort

function bitwise-ushort-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ushort_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ushort-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_ushort_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ushort-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_ushort_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ushort-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ushort_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ushort-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_ushort_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ushort-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_ushort_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ushort-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ushort_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ushort-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_ushort_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ushort-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_ushort_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-ushort-1.1 () {
    declare ROP OP=$mmux_ushort_MAX
    declare EXPECTED_ROP=0

    mmux_ushort_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-ushort-1.2 () {
    declare ROP OP=$mmux_ushort_MIN
    declare EXPECTED_ROP=$mmux_ushort_MAX

    mmux_ushort_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ushort-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_ushort_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ushort-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_ushort_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sint

function bitwise-sint-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sint_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sint_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sint_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sint_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sint_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sint_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sint-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sint_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sint_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sint_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uint

function bitwise-uint-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uint_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uint_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uint_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uint_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uint_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uint_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uint-1.1 () {
    declare ROP OP=$mmux_uint_MAX
    declare EXPECTED_ROP=0

    mmux_uint_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uint-1.2 () {
    declare ROP OP=$mmux_uint_MIN
    declare EXPECTED_ROP=$mmux_uint_MAX

    mmux_uint_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uint_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uint_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: slong

function bitwise-slong-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-slong-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_slong_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-slong-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_slong_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-slong-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-slong-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_slong_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-slong-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_slong_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-slong-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_slong_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-slong-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_slong_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-slong-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_slong_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-slong-1.1 () {
    declare ROP OP=$mmux_slong_MAX
    declare EXPECTED_ROP=$mmux_slong_MIN

    mmux_slong_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-slong-1.2 () {
    declare ROP OP=$mmux_slong_MIN
    declare EXPECTED_ROP=$mmux_slong_MAX

    mmux_slong_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-slong-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_slong_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-slong-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_slong_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: ulong

function bitwise-ulong-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ulong_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ulong-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_ulong_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ulong-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_ulong_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ulong-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ulong_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ulong-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_ulong_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ulong-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_ulong_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ulong-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ulong_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ulong-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_ulong_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ulong-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_ulong_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-ulong-1.1 () {
    declare ROP OP=$mmux_ulong_MAX
    declare EXPECTED_ROP=0

    mmux_ulong_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-ulong-1.2 () {
    declare ROP OP=$mmux_ulong_MIN
    declare EXPECTED_ROP=$mmux_ulong_MAX

    mmux_ulong_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ulong-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_ulong_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ulong-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_ulong_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sllong

function bitwise-sllong-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sllong-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sllong_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sllong-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sllong_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sllong-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sllong-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sllong_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sllong-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sllong_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sllong-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sllong_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sllong-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sllong_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sllong-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sllong_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sllong-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sllong_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sllong-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sllong_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sllong-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sllong_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: ullong

function bitwise-ullong-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ullong_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ullong-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_ullong_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ullong-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_ullong_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ullong-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ullong_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ullong-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_ullong_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ullong-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_ullong_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ullong-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ullong_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ullong-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_ullong_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ullong-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_ullong_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-ullong-1.1 () {
    declare ROP OP=$mmux_ullong_MAX
    declare EXPECTED_ROP=0

    mmux_ullong_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-ullong-1.2 () {
    declare ROP OP=$mmux_ullong_MIN
    declare EXPECTED_ROP=$mmux_ullong_MAX

    mmux_ullong_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ullong-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_ullong_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ullong-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_ullong_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sint8

function bitwise-sint8-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint8-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sint8_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint8-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sint8_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint8-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint8-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sint8_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint8-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sint8_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint8-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint8_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint8-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sint8_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint8-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sint8_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sint8-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sint8_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint8-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sint8_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint8-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sint8_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uint8

function bitwise-uint8-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint8_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint8-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uint8_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint8-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uint8_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint8-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint8_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint8-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uint8_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint8-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uint8_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint8-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint8_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint8-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uint8_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint8-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uint8_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uint8-1.1 () {
    declare ROP OP=$mmux_uint8_MAX
    declare EXPECTED_ROP=0

    mmux_uint8_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uint8-1.2 () {
    declare ROP OP=$mmux_uint8_MIN
    declare EXPECTED_ROP=$mmux_uint8_MAX

    mmux_uint8_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


### ------------------------------------------------------------------------

function bitwise-uint8-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uint8_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint8-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uint8_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sint16

function bitwise-sint16-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint16-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sint16_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint16-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sint16_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint16-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint16-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sint16_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint16-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sint16_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint16-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint16_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint16-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sint16_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint16-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sint16_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sint16-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sint16_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint16-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sint16_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint16-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sint16_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uint16

function bitwise-uint16-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint16_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint16-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uint16_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint16-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uint16_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint16-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint16_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint16-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uint16_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint16-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uint16_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint16-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint16_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint16-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uint16_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint16-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uint16_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uint16-1.1 () {
    declare ROP OP=$mmux_uint16_MAX
    declare EXPECTED_ROP=0

    mmux_uint16_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uint16-1.2 () {
    declare ROP OP=$mmux_uint16_MIN
    declare EXPECTED_ROP=$mmux_uint16_MAX

    mmux_uint16_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


### ------------------------------------------------------------------------

function bitwise-uint16-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uint16_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint16-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uint16_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sint32

function bitwise-sint32-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint32-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sint32_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint32-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sint32_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint32-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint32-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sint32_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint32-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sint32_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint32-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint32_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint32-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sint32_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint32-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sint32_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sint32-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sint32_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint32-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sint32_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint32-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sint32_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uint32

function bitwise-uint32-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint32_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint32-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uint32_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint32-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uint32_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint32-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint32_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint32-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uint32_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint32-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uint32_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint32-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint32_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint32-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uint32_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint32-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uint32_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uint32-1.1 () {
    declare ROP OP=$mmux_uint32_MAX
    declare EXPECTED_ROP=0

    mmux_uint32_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uint32-1.2 () {
    declare ROP OP=$mmux_uint32_MIN
    declare EXPECTED_ROP=$mmux_uint32_MAX

    mmux_uint32_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint32-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uint32_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint32-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uint32_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sint64

function bitwise-sint64-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint64-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sint64_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sint64-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sint64_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint64-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint64-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sint64_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint64-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sint64_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint64-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sint64_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint64-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sint64_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sint64-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sint64_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sint64-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sint64_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint64-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sint64_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sint64-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sint64_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uint64

function bitwise-uint64-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint64_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint64-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uint64_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uint64-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uint64_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint64-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint64_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint64-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uint64_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint64-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uint64_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint64-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uint64_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint64-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uint64_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uint64-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uint64_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uint64-1.1 () {
    declare ROP OP=$mmux_uint64_MAX
    declare EXPECTED_ROP=0

    mmux_uint64_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uint64-1.2 () {
    declare ROP OP=$mmux_uint64_MIN
    declare EXPECTED_ROP=$mmux_uint64_MAX

    mmux_uint64_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint64-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uint64_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uint64-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uint64_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sintmax

function bitwise-sintmax-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sintmax-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sintmax_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sintmax-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sintmax_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintmax-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintmax-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sintmax_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintmax-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sintmax_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintmax-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintmax_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintmax-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sintmax_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintmax-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sintmax_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sintmax-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sintmax_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintmax-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sintmax_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintmax-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sintmax_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uintmax

function bitwise-uintmax-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintmax_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uintmax-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uintmax_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uintmax-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uintmax_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintmax-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintmax_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintmax-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uintmax_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintmax-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uintmax_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintmax-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintmax_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintmax-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uintmax_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintmax-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uintmax_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uintmax-1.1 () {
    declare ROP OP=$mmux_uintmax_MAX
    declare EXPECTED_ROP=0

    mmux_uintmax_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uintmax-1.2 () {
    declare ROP OP=$mmux_uintmax_MIN
    declare EXPECTED_ROP=$mmux_uintmax_MAX

    mmux_uintmax_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


### ------------------------------------------------------------------------

function bitwise-uintmax-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uintmax_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintmax-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uintmax_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: sintptr

function bitwise-sintptr-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sintptr-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_sintptr_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-sintptr-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_sintptr_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintptr-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintptr-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_sintptr_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintptr-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_sintptr_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintptr-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_sintptr_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintptr-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_sintptr_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-sintptr-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_sintptr_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-sintptr-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_sintptr_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintptr-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_sintptr_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-sintptr-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_sintptr_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uintptr

function bitwise-uintptr-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintptr_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uintptr-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uintptr_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uintptr-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uintptr_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintptr-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintptr_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintptr-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uintptr_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintptr-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uintptr_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintptr-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uintptr_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintptr-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uintptr_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uintptr-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uintptr_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uintptr-1.1 () {
    declare ROP OP=$mmux_uintptr_MAX
    declare EXPECTED_ROP=0

    mmux_uintptr_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uintptr-1.2 () {
    declare ROP OP=$mmux_uintptr_MIN
    declare EXPECTED_ROP=$mmux_uintptr_MAX

    mmux_uintptr_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintptr-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uintptr_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uintptr-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uintptr_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: ssize

function bitwise-ssize-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ssize_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ssize-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_ssize_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ssize-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_ssize_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ssize-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ssize_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ssize-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_ssize_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ssize-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_ssize_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ssize-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ssize_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ssize-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_ssize_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ssize-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_ssize_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-ssize-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_ssize_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ssize-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_ssize_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ssize-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_ssize_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: usize

function bitwise-usize-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_usize_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-usize-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_usize_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-usize-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_usize_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-usize-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_usize_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-usize-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_usize_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-usize-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_usize_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-usize-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_usize_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-usize-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_usize_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-usize-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_usize_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-usize-1.1 () {
    declare ROP OP=$mmux_usize_MAX
    declare EXPECTED_ROP=0

    mmux_usize_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-usize-1.2 () {
    declare ROP OP=$mmux_usize_MIN
    declare EXPECTED_ROP=$mmux_usize_MAX

    mmux_usize_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


### ------------------------------------------------------------------------

function bitwise-usize-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_usize_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-usize-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_usize_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: ptrdiff

function bitwise-ptrdiff-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ptrdiff-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_ptrdiff_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-ptrdiff-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_ptrdiff_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ptrdiff-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ptrdiff-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_ptrdiff_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ptrdiff-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_ptrdiff_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ptrdiff-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_ptrdiff_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ptrdiff-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_ptrdiff_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-ptrdiff-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_ptrdiff_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-ptrdiff-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_ptrdiff_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ptrdiff-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_ptrdiff_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-ptrdiff-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_ptrdiff_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: off

function bitwise-off-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-off-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_off_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-off-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_off_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-off-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-off-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_off_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-off-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_off_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-off-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_off_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-off-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_off_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-off-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_off_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-off-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_off_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-off-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_off_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-off-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_off_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: mode

function bitwise-mode-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-mode-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_mode_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-mode-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_mode_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-mode-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-mode-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_mode_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-mode-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_mode_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-mode-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_mode_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-mode-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_mode_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-mode-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_mode_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-mode-1.1 () {
    declare ROP OP=$mmux_mode_MAX
    declare EXPECTED_ROP=0

    mmux_mode_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-mode-1.2 () {
    declare ROP OP=$mmux_mode_MIN
    declare EXPECTED_ROP=$mmux_mode_MAX

    mmux_mode_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-mode-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_mode_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-mode-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_mode_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: pid

function bitwise-pid-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-pid-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_pid_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-pid-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_pid_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pid-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-pid-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_pid_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-pid-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_pid_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-pid-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_pid_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-pid-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_pid_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-pid-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_pid_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-pid-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_pid_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-gid-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_gid_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-gid-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_gid_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: uid

function bitwise-uid-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uid-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_uid_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-uid-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_uid_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uid-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uid-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_uid_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uid-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_uid_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uid-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_uid_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uid-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_uid_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-uid-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_uid_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-uid-1.1 () {
    declare ROP OP=$mmux_uid_MAX
    declare EXPECTED_ROP=0

    mmux_uid_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-uid-1.2 () {
    declare ROP OP=$mmux_uid_MIN
    declare EXPECTED_ROP=$mmux_uid_MAX

    mmux_uid_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uid-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_uid_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-uid-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_uid_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: gid

function bitwise-gid-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-gid-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_gid_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-gid-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_gid_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-gid-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-gid-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_gid_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-gid-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_gid_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-gid-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_gid_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-gid-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_gid_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-gid-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_gid_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-gid-1.1 () {
    declare ROP OP=$mmux_gid_MAX
    declare EXPECTED_ROP=0

    mmux_gid_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-gid-1.2 () {
    declare ROP OP=$mmux_gid_MIN
    declare EXPECTED_ROP=$mmux_gid_MAX

    mmux_gid_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


### ------------------------------------------------------------------------

function bitwise-gid-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_gid_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-gid-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_gid_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: wchar

function bitwise-wchar-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-wchar-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_wchar_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-wchar-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_wchar_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wchar-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wchar-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_wchar_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wchar-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_wchar_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wchar-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wchar_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wchar-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_wchar_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wchar-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_wchar_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-wchar-1.1 () {
    declare ROP OP=123
    declare -r EXPECTED_ROP=$(( ~ OP ))

    mmux_wchar_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wchar-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_wchar_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wchar-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_wchar_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### bitwise operations for type: wint

function bitwise-wint-and-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_bitwise_and ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-wint-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 & 2))

    mmux_wint_bitwise_and ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-and-wint-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 & 2 & 3 & 5 & 7 & 11 & 13))

    mmux_wint_bitwise_and ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wint-or-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_bitwise_or ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wint-or-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 | 2))

    mmux_wint_bitwise_or ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wint-or-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=3 OP3=5 OP4=7 OP5=11 OP6=13
    declare -r EXPECTED_ROP=$((1 | 2 | 3 | 5 | 7 | 11 | 13))

    mmux_wint_bitwise_or ROP WW(OP0) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(OP5) WW(OP6)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wint-xor-1.1 () {
    declare ROP OP=1
    declare -r EXPECTED_ROP='1'

    mmux_wint_bitwise_xor ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wint-xor-1.2 () {
    declare ROP OP0=1 OP1=2
    declare -r EXPECTED_ROP=$((1 ^ 2))

    mmux_wint_bitwise_xor ROP WW(OP0) WW(OP1)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-wint-xor-1.3 () {
    declare ROP OP0=1 OP1=2 OP2=4
    declare -r EXPECTED_ROP=$((1 ^ 2 ^ 4))

    mmux_wint_bitwise_xor ROP WW(OP0) WW(OP1) WW(OP2)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-not-wint-1.1 () {
    declare ROP OP=$mmux_wint_MAX
    declare EXPECTED_ROP=0

    mmux_wint_bitwise_not ROP WW(OP)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function bitwise-not-wint-1.2 () {
    declare ROP OP=$mmux_wint_MIN
    declare EXPECTED_ROP=$mmux_wint_MAX

    mmux_wint_bitwise_not ROP WW(OP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wint-shl-1.1 () {
    declare ROP OP=0b1 NBITS=3
    declare EXPECTED_ROP=$(( 1 << 3 ))

    mmux_wint_bitwise_shl ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function bitwise-wint-shr-1.1 () {
    declare ROP OP=8 NBITS=3
    declare EXPECTED_ROP=$(( 8 >> 3 ))

    mmux_wint_bitwise_shr ROP WW(OP) WW(NBITS)
    dotest-unset-debug
    dotest-debug ROP=WW(ROP)
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### let's go

dotest bitwise-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
