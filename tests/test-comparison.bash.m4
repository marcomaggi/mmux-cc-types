#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for comparison builtins
#!# Date: Sep 22, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/comparison.test ; less tests/comparison.log
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


#### type variables: pointer

function comparison-pointer-equal-1.1         () {   mmux_pointer_equal '0x100'			      ;}
function comparison-pointer-equal-1.2         () {   mmux_pointer_equal '0x100' '0x100'		      ;}
function comparison-pointer-equal-1.3         () {   mmux_pointer_equal '0x100' '0x100' '0x100'	      ;}
function comparison-pointer-equal-1.4         () { ! mmux_pointer_equal '0x999' '0x111' '0x102'       ;}

### ------------------------------------------------------------------------

function comparison-pointer-greater-1.1       () {   mmux_pointer_greater '0x900'		      ;}
function comparison-pointer-greater-1.2       () {   mmux_pointer_greater '0x900' '0x800'	      ;}
function comparison-pointer-greater-1.3       () {   mmux_pointer_greater '0x900' '0x800' '0x700'     ;}
function comparison-pointer-greater-1.4       () { ! mmux_pointer_greater '0x111' '0x333' 	      ;}
function comparison-pointer-greater-1.5       () { ! mmux_pointer_greater '0x999' '0x333' '0x555'     ;}
function comparison-pointer-greater-1.6       () { ! mmux_pointer_greater '0x111' '0x111' 	      ;}

### ------------------------------------------------------------------------

function comparison-pointer-less-1.1        ()  {   mmux_pointer_less '0x900'		      ;}
function comparison-pointer-less-1.2        ()  {   mmux_pointer_less '0x800' '0x900'	      ;}
function comparison-pointer-less-1.3        ()  {   mmux_pointer_less '0x700' '0x800' '0x900'     ;}
function comparison-pointer-less-1.4        ()  { ! mmux_pointer_less '0x333' '0x111' 	      ;}
function comparison-pointer-less-1.5        ()  { ! mmux_pointer_less '0x333' '0x999' '0x555'     ;}
function comparison-pointer-less-1.6        ()  { ! mmux_pointer_less '0x111' '0x111' 	      ;}

### ------------------------------------------------------------------------

function comparison-pointer-greater-equal-1.1 () {   mmux_pointer_greater_equal '0x900'			      ;}
function comparison-pointer-greater-equal-1.2 () {   mmux_pointer_greater_equal '0x900' '0x800'		      ;}
function comparison-pointer-greater-equal-1.3 () {   mmux_pointer_greater_equal '0x900' '0x800' '0x700'	      ;}
function comparison-pointer-greater-equal-1.4 () { ! mmux_pointer_greater_equal '0x111' '0x333' 	      ;}
function comparison-pointer-greater-equal-1.5 () { ! mmux_pointer_greater_equal '0x999' '0x333' '0x555'	      ;}
function comparison-pointer-greater-equal-1.6 () {   mmux_pointer_greater_equal '0x111' '0x111' 	      ;}

### ------------------------------------------------------------------------

function comparison-pointer-less-equal-1.1  () {   mmux_pointer_less_equal '0x900'			      ;}
function comparison-pointer-less-equal-1.2  () {   mmux_pointer_less_equal '0x800' '0x900'		      ;}
function comparison-pointer-less-equal-1.3  () {   mmux_pointer_less_equal '0x700' '0x800' '0x900'	      ;}
function comparison-pointer-less-equal-1.4  () { ! mmux_pointer_less_equal '0x333' '0x111'		      ;}
function comparison-pointer-less-equal-1.5  () { ! mmux_pointer_less_equal '0x333' '0x999' '0x555'	      ;}
function comparison-pointer-less-equal-1.6  () {   mmux_pointer_less_equal '0x111' '0x111'		      ;}

### ------------------------------------------------------------------------

function comparison-pointer-max-1.1 () {
    declare -r EXPECTED_ROP='0x900'

    mmux_pointer_max ROP '0x900'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-max-1.2 () {
    declare -r EXPECTED_ROP='0x900'

    mmux_pointer_max ROP '0x900' '0x100'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-max-1.3 () {
    declare -r EXPECTED_ROP='0x900'

    mmux_pointer_max ROP '0x100' '0x900'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-max-1.4 () {
    declare -r EXPECTED_ROP='0x900'

    mmux_pointer_max ROP '0x100' '0x200' '0x300' '0x400' '0x900' '0x500' '0x600' '0x800' '0x800'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

### ------------------------------------------------------------------------

function comparison-pointer-min-1.1 () {
    declare -r EXPECTED_ROP='0x100'

    mmux_pointer_min ROP '0x100'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-min-1.2 () {
    declare -r EXPECTED_ROP='0x100'

    mmux_pointer_min ROP '0x900' '0x100'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-min-1.3 () {
    declare -r EXPECTED_ROP='0x100'

    mmux_pointer_min ROP '0x100' '0x900'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function comparison-pointer-min-1.4 () {
    declare -r EXPECTED_ROP='0x100'

    mmux_pointer_min ROP '0x100' '0x200' '0x300' '0x400' '0x900' '0x500' '0x600' '0x800' '0x800'
    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: schar

function comparison-schar-equal-1.1         () {   mmux_schar_equal '10' ;}
function comparison-schar-equal-1.2         () {   mmux_schar_equal '10' '10' ;}
function comparison-schar-equal-1.3         () {   mmux_schar_equal '10' '10' '10' ;}
function comparison-schar-equal-1.4         () { ! mmux_schar_equal '9' '11' '10' ;}
function comparison-schar-equal-1.5         () {   mmux_schar_equal '-9' '-9' ;}
function comparison-schar-equal-1.6         () { ! mmux_schar_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-schar-greater-1.1       () {   mmux_schar_greater '90' ;}
function comparison-schar-greater-1.2       () {   mmux_schar_greater '90' '80' ;}
function comparison-schar-greater-1.3       () {   mmux_schar_greater '90' '80' '70' ;}
function comparison-schar-greater-1.4       () { ! mmux_schar_greater '11' '33' ;}
function comparison-schar-greater-1.5       () { ! mmux_schar_greater '99' '33' '55' ;}
function comparison-schar-greater-1.6       () { ! mmux_schar_greater '11' '11' ;}
function comparison-schar-greater-1.7       () {   mmux_schar_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-schar-less-1.1        ()  {   mmux_schar_less '90' ;}
function comparison-schar-less-1.2        ()  {   mmux_schar_less '80' '90' ;}
function comparison-schar-less-1.3        ()  {   mmux_schar_less '70' '80' '90' ;}
function comparison-schar-less-1.4        ()  { ! mmux_schar_less '33' '11' ;}
function comparison-schar-less-1.5        ()  { ! mmux_schar_less '33' '99' '55' ;}
function comparison-schar-less-1.6        ()  { ! mmux_schar_less '11' '11' ;}
function comparison-schar-less-1.7        ()  { ! mmux_schar_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-schar-greater-equal-1.1 () {   mmux_schar_greater_equal '90' ;}
function comparison-schar-greater-equal-1.2 () {   mmux_schar_greater_equal '90' '80' ;}
function comparison-schar-greater-equal-1.3 () {   mmux_schar_greater_equal '90' '80' '70' ;}
function comparison-schar-greater-equal-1.4 () { ! mmux_schar_greater_equal '11' '33' ;}
function comparison-schar-greater-equal-1.5 () { ! mmux_schar_greater_equal '99' '33' '55' ;}
function comparison-schar-greater-equal-1.6 () {   mmux_schar_greater_equal '11' '11' ;}
function comparison-schar-greater-equal-1.7 () {   mmux_schar_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-schar-less-equal-1.1  () {   mmux_schar_less_equal '90' ;}
function comparison-schar-less-equal-1.2  () {   mmux_schar_less_equal '80' '90' ;}
function comparison-schar-less-equal-1.3  () {   mmux_schar_less_equal '70' '80' '90' ;}
function comparison-schar-less-equal-1.4  () { ! mmux_schar_less_equal '33' '11' ;}
function comparison-schar-less-equal-1.5  () { ! mmux_schar_less_equal '33' '99' '55' ;}
function comparison-schar-less-equal-1.6  () {   mmux_schar_less_equal '11' '11' ;}
function comparison-schar-less-equal-1.7  () {   mmux_schar_less_equal '-33' '-22' '-22' ;}


#### type variables: uchar

function comparison-uchar-equal-1.1         () {   mmux_uchar_equal '10' ;}
function comparison-uchar-equal-1.2         () {   mmux_uchar_equal '10' '10' ;}
function comparison-uchar-equal-1.3         () {   mmux_uchar_equal '10' '10' '10' ;}
function comparison-uchar-equal-1.4         () { ! mmux_uchar_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uchar-greater-1.1       () {   mmux_uchar_greater '90' ;}
function comparison-uchar-greater-1.2       () {   mmux_uchar_greater '90' '80' ;}
function comparison-uchar-greater-1.3       () {   mmux_uchar_greater '90' '80' '70' ;}
function comparison-uchar-greater-1.4       () { ! mmux_uchar_greater '11' '33' ;}
function comparison-uchar-greater-1.5       () { ! mmux_uchar_greater '99' '33' '55' ;}
function comparison-uchar-greater-1.6       () { ! mmux_uchar_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uchar-less-1.1        ()  {   mmux_uchar_less '90' ;}
function comparison-uchar-less-1.2        ()  {   mmux_uchar_less '80' '90' ;}
function comparison-uchar-less-1.3        ()  {   mmux_uchar_less '70' '80' '90' ;}
function comparison-uchar-less-1.4        ()  { ! mmux_uchar_less '33' '11' ;}
function comparison-uchar-less-1.5        ()  { ! mmux_uchar_less '33' '99' '55' ;}
function comparison-uchar-less-1.6        ()  { ! mmux_uchar_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uchar-greater-equal-1.1 () {   mmux_uchar_greater_equal '90' ;}
function comparison-uchar-greater-equal-1.2 () {   mmux_uchar_greater_equal '90' '80' ;}
function comparison-uchar-greater-equal-1.3 () {   mmux_uchar_greater_equal '90' '80' '70' ;}
function comparison-uchar-greater-equal-1.4 () { ! mmux_uchar_greater_equal '11' '33' ;}
function comparison-uchar-greater-equal-1.5 () { ! mmux_uchar_greater_equal '99' '33' '55' ;}
function comparison-uchar-greater-equal-1.6 () {   mmux_uchar_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uchar-less-equal-1.1  () {   mmux_uchar_less_equal '90' ;}
function comparison-uchar-less-equal-1.2  () {   mmux_uchar_less_equal '80' '90' ;}
function comparison-uchar-less-equal-1.3  () {   mmux_uchar_less_equal '70' '80' '90' ;}
function comparison-uchar-less-equal-1.4  () { ! mmux_uchar_less_equal '33' '11' ;}
function comparison-uchar-less-equal-1.5  () { ! mmux_uchar_less_equal '33' '99' '55' ;}
function comparison-uchar-less-equal-1.6  () {   mmux_uchar_less_equal '11' '11' ;}


#### type variables: sshort

function comparison-sshort-equal-1.1         () {   mmux_sshort_equal '10' ;}
function comparison-sshort-equal-1.2         () {   mmux_sshort_equal '10' '10' ;}
function comparison-sshort-equal-1.3         () {   mmux_sshort_equal '10' '10' '10' ;}
function comparison-sshort-equal-1.4         () { ! mmux_sshort_equal '9' '11' '10' ;}
function comparison-sshort-equal-1.5         () {   mmux_sshort_equal '-9' '-9' ;}
function comparison-sshort-equal-1.6         () { ! mmux_sshort_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sshort-greater-1.1       () {   mmux_sshort_greater '90' ;}
function comparison-sshort-greater-1.2       () {   mmux_sshort_greater '90' '80' ;}
function comparison-sshort-greater-1.3       () {   mmux_sshort_greater '90' '80' '70' ;}
function comparison-sshort-greater-1.4       () { ! mmux_sshort_greater '11' '33' ;}
function comparison-sshort-greater-1.5       () { ! mmux_sshort_greater '99' '33' '55' ;}
function comparison-sshort-greater-1.6       () { ! mmux_sshort_greater '11' '11' ;}
function comparison-sshort-greater-1.7       () {   mmux_sshort_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sshort-less-1.1        ()  {   mmux_sshort_less '90' ;}
function comparison-sshort-less-1.2        ()  {   mmux_sshort_less '80' '90' ;}
function comparison-sshort-less-1.3        ()  {   mmux_sshort_less '70' '80' '90' ;}
function comparison-sshort-less-1.4        ()  { ! mmux_sshort_less '33' '11' ;}
function comparison-sshort-less-1.5        ()  { ! mmux_sshort_less '33' '99' '55' ;}
function comparison-sshort-less-1.6        ()  { ! mmux_sshort_less '11' '11' ;}
function comparison-sshort-less-1.7        ()  { ! mmux_sshort_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sshort-greater-equal-1.1 () {   mmux_sshort_greater_equal '90' ;}
function comparison-sshort-greater-equal-1.2 () {   mmux_sshort_greater_equal '90' '80' ;}
function comparison-sshort-greater-equal-1.3 () {   mmux_sshort_greater_equal '90' '80' '70' ;}
function comparison-sshort-greater-equal-1.4 () { ! mmux_sshort_greater_equal '11' '33' ;}
function comparison-sshort-greater-equal-1.5 () { ! mmux_sshort_greater_equal '99' '33' '55' ;}
function comparison-sshort-greater-equal-1.6 () {   mmux_sshort_greater_equal '11' '11' ;}
function comparison-sshort-greater-equal-1.7 () {   mmux_sshort_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sshort-less-equal-1.1  () {   mmux_sshort_less_equal '90' ;}
function comparison-sshort-less-equal-1.2  () {   mmux_sshort_less_equal '80' '90' ;}
function comparison-sshort-less-equal-1.3  () {   mmux_sshort_less_equal '70' '80' '90' ;}
function comparison-sshort-less-equal-1.4  () { ! mmux_sshort_less_equal '33' '11' ;}
function comparison-sshort-less-equal-1.5  () { ! mmux_sshort_less_equal '33' '99' '55' ;}
function comparison-sshort-less-equal-1.6  () {   mmux_sshort_less_equal '11' '11' ;}
function comparison-sshort-less-equal-1.7  () {   mmux_sshort_less_equal '-33' '-22' '-22' ;}


#### type variables: ushort

function comparison-ushort-equal-1.1         () {   mmux_ushort_equal '10' ;}
function comparison-ushort-equal-1.2         () {   mmux_ushort_equal '10' '10' ;}
function comparison-ushort-equal-1.3         () {   mmux_ushort_equal '10' '10' '10' ;}
function comparison-ushort-equal-1.4         () { ! mmux_ushort_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-ushort-greater-1.1       () {   mmux_ushort_greater '90' ;}
function comparison-ushort-greater-1.2       () {   mmux_ushort_greater '90' '80' ;}
function comparison-ushort-greater-1.3       () {   mmux_ushort_greater '90' '80' '70' ;}
function comparison-ushort-greater-1.4       () { ! mmux_ushort_greater '11' '33' ;}
function comparison-ushort-greater-1.5       () { ! mmux_ushort_greater '99' '33' '55' ;}
function comparison-ushort-greater-1.6       () { ! mmux_ushort_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ushort-less-1.1        ()  {   mmux_ushort_less '90' ;}
function comparison-ushort-less-1.2        ()  {   mmux_ushort_less '80' '90' ;}
function comparison-ushort-less-1.3        ()  {   mmux_ushort_less '70' '80' '90' ;}
function comparison-ushort-less-1.4        ()  { ! mmux_ushort_less '33' '11' ;}
function comparison-ushort-less-1.5        ()  { ! mmux_ushort_less '33' '99' '55' ;}
function comparison-ushort-less-1.6        ()  { ! mmux_ushort_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ushort-greater-equal-1.1 () {   mmux_ushort_greater_equal '90' ;}
function comparison-ushort-greater-equal-1.2 () {   mmux_ushort_greater_equal '90' '80' ;}
function comparison-ushort-greater-equal-1.3 () {   mmux_ushort_greater_equal '90' '80' '70' ;}
function comparison-ushort-greater-equal-1.4 () { ! mmux_ushort_greater_equal '11' '33' ;}
function comparison-ushort-greater-equal-1.5 () { ! mmux_ushort_greater_equal '99' '33' '55' ;}
function comparison-ushort-greater-equal-1.6 () {   mmux_ushort_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ushort-less-equal-1.1  () {   mmux_ushort_less_equal '90' ;}
function comparison-ushort-less-equal-1.2  () {   mmux_ushort_less_equal '80' '90' ;}
function comparison-ushort-less-equal-1.3  () {   mmux_ushort_less_equal '70' '80' '90' ;}
function comparison-ushort-less-equal-1.4  () { ! mmux_ushort_less_equal '33' '11' ;}
function comparison-ushort-less-equal-1.5  () { ! mmux_ushort_less_equal '33' '99' '55' ;}
function comparison-ushort-less-equal-1.6  () {   mmux_ushort_less_equal '11' '11' ;}


#### type variables: sint

function comparison-sint-equal-1.1         () {   mmux_sint_equal '10' ;}
function comparison-sint-equal-1.2         () {   mmux_sint_equal '10' '10' ;}
function comparison-sint-equal-1.3         () {   mmux_sint_equal '10' '10' '10' ;}
function comparison-sint-equal-1.4         () { ! mmux_sint_equal '9' '11' '10' ;}
function comparison-sint-equal-1.5         () {   mmux_sint_equal '-9' '-9' ;}
function comparison-sint-equal-1.6         () { ! mmux_sint_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sint-greater-1.1       () {   mmux_sint_greater '90' ;}
function comparison-sint-greater-1.2       () {   mmux_sint_greater '90' '80' ;}
function comparison-sint-greater-1.3       () {   mmux_sint_greater '90' '80' '70' ;}
function comparison-sint-greater-1.4       () { ! mmux_sint_greater '11' '33' ;}
function comparison-sint-greater-1.5       () { ! mmux_sint_greater '99' '33' '55' ;}
function comparison-sint-greater-1.6       () { ! mmux_sint_greater '11' '11' ;}
function comparison-sint-greater-1.7       () {   mmux_sint_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint-less-1.1        ()  {   mmux_sint_less '90' ;}
function comparison-sint-less-1.2        ()  {   mmux_sint_less '80' '90' ;}
function comparison-sint-less-1.3        ()  {   mmux_sint_less '70' '80' '90' ;}
function comparison-sint-less-1.4        ()  { ! mmux_sint_less '33' '11' ;}
function comparison-sint-less-1.5        ()  { ! mmux_sint_less '33' '99' '55' ;}
function comparison-sint-less-1.6        ()  { ! mmux_sint_less '11' '11' ;}
function comparison-sint-less-1.7        ()  { ! mmux_sint_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint-greater-equal-1.1 () {   mmux_sint_greater_equal '90' ;}
function comparison-sint-greater-equal-1.2 () {   mmux_sint_greater_equal '90' '80' ;}
function comparison-sint-greater-equal-1.3 () {   mmux_sint_greater_equal '90' '80' '70' ;}
function comparison-sint-greater-equal-1.4 () { ! mmux_sint_greater_equal '11' '33' ;}
function comparison-sint-greater-equal-1.5 () { ! mmux_sint_greater_equal '99' '33' '55' ;}
function comparison-sint-greater-equal-1.6 () {   mmux_sint_greater_equal '11' '11' ;}
function comparison-sint-greater-equal-1.7 () {   mmux_sint_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint-less-equal-1.1  () {   mmux_sint_less_equal '90' ;}
function comparison-sint-less-equal-1.2  () {   mmux_sint_less_equal '80' '90' ;}
function comparison-sint-less-equal-1.3  () {   mmux_sint_less_equal '70' '80' '90' ;}
function comparison-sint-less-equal-1.4  () { ! mmux_sint_less_equal '33' '11' ;}
function comparison-sint-less-equal-1.5  () { ! mmux_sint_less_equal '33' '99' '55' ;}
function comparison-sint-less-equal-1.6  () {   mmux_sint_less_equal '11' '11' ;}
function comparison-sint-less-equal-1.7  () {   mmux_sint_less_equal '-33' '-22' '-22' ;}


#### type variables: uint

function comparison-uint-equal-1.1         () {   mmux_uint_equal '10' ;}
function comparison-uint-equal-1.2         () {   mmux_uint_equal '10' '10' ;}
function comparison-uint-equal-1.3         () {   mmux_uint_equal '10' '10' '10' ;}
function comparison-uint-equal-1.4         () { ! mmux_uint_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uint-greater-1.1       () {   mmux_uint_greater '90' ;}
function comparison-uint-greater-1.2       () {   mmux_uint_greater '90' '80' ;}
function comparison-uint-greater-1.3       () {   mmux_uint_greater '90' '80' '70' ;}
function comparison-uint-greater-1.4       () { ! mmux_uint_greater '11' '33' ;}
function comparison-uint-greater-1.5       () { ! mmux_uint_greater '99' '33' '55' ;}
function comparison-uint-greater-1.6       () { ! mmux_uint_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint-less-1.1        ()  {   mmux_uint_less '90' ;}
function comparison-uint-less-1.2        ()  {   mmux_uint_less '80' '90' ;}
function comparison-uint-less-1.3        ()  {   mmux_uint_less '70' '80' '90' ;}
function comparison-uint-less-1.4        ()  { ! mmux_uint_less '33' '11' ;}
function comparison-uint-less-1.5        ()  { ! mmux_uint_less '33' '99' '55' ;}
function comparison-uint-less-1.6        ()  { ! mmux_uint_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint-greater-equal-1.1 () {   mmux_uint_greater_equal '90' ;}
function comparison-uint-greater-equal-1.2 () {   mmux_uint_greater_equal '90' '80' ;}
function comparison-uint-greater-equal-1.3 () {   mmux_uint_greater_equal '90' '80' '70' ;}
function comparison-uint-greater-equal-1.4 () { ! mmux_uint_greater_equal '11' '33' ;}
function comparison-uint-greater-equal-1.5 () { ! mmux_uint_greater_equal '99' '33' '55' ;}
function comparison-uint-greater-equal-1.6 () {   mmux_uint_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint-less-equal-1.1  () {   mmux_uint_less_equal '90' ;}
function comparison-uint-less-equal-1.2  () {   mmux_uint_less_equal '80' '90' ;}
function comparison-uint-less-equal-1.3  () {   mmux_uint_less_equal '70' '80' '90' ;}
function comparison-uint-less-equal-1.4  () { ! mmux_uint_less_equal '33' '11' ;}
function comparison-uint-less-equal-1.5  () { ! mmux_uint_less_equal '33' '99' '55' ;}
function comparison-uint-less-equal-1.6  () {   mmux_uint_less_equal '11' '11' ;}


#### type variables: slong

function comparison-slong-equal-1.1         () {   mmux_slong_equal '10' ;}
function comparison-slong-equal-1.2         () {   mmux_slong_equal '10' '10' ;}
function comparison-slong-equal-1.3         () {   mmux_slong_equal '10' '10' '10' ;}
function comparison-slong-equal-1.4         () { ! mmux_slong_equal '9' '11' '10' ;}
function comparison-slong-equal-1.5         () {   mmux_slong_equal '-9' '-9' ;}
function comparison-slong-equal-1.6         () { ! mmux_slong_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-slong-greater-1.1       () {   mmux_slong_greater '90' ;}
function comparison-slong-greater-1.2       () {   mmux_slong_greater '90' '80' ;}
function comparison-slong-greater-1.3       () {   mmux_slong_greater '90' '80' '70' ;}
function comparison-slong-greater-1.4       () { ! mmux_slong_greater '11' '33' ;}
function comparison-slong-greater-1.5       () { ! mmux_slong_greater '99' '33' '55' ;}
function comparison-slong-greater-1.6       () { ! mmux_slong_greater '11' '11' ;}
function comparison-slong-greater-1.7       () {   mmux_slong_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-slong-less-1.1        ()  {   mmux_slong_less '90' ;}
function comparison-slong-less-1.2        ()  {   mmux_slong_less '80' '90' ;}
function comparison-slong-less-1.3        ()  {   mmux_slong_less '70' '80' '90' ;}
function comparison-slong-less-1.4        ()  { ! mmux_slong_less '33' '11' ;}
function comparison-slong-less-1.5        ()  { ! mmux_slong_less '33' '99' '55' ;}
function comparison-slong-less-1.6        ()  { ! mmux_slong_less '11' '11' ;}
function comparison-slong-less-1.7        ()  { ! mmux_slong_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-slong-greater-equal-1.1 () {   mmux_slong_greater_equal '90' ;}
function comparison-slong-greater-equal-1.2 () {   mmux_slong_greater_equal '90' '80' ;}
function comparison-slong-greater-equal-1.3 () {   mmux_slong_greater_equal '90' '80' '70' ;}
function comparison-slong-greater-equal-1.4 () { ! mmux_slong_greater_equal '11' '33' ;}
function comparison-slong-greater-equal-1.5 () { ! mmux_slong_greater_equal '99' '33' '55' ;}
function comparison-slong-greater-equal-1.6 () {   mmux_slong_greater_equal '11' '11' ;}
function comparison-slong-greater-equal-1.7 () {   mmux_slong_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-slong-less-equal-1.1  () {   mmux_slong_less_equal '90' ;}
function comparison-slong-less-equal-1.2  () {   mmux_slong_less_equal '80' '90' ;}
function comparison-slong-less-equal-1.3  () {   mmux_slong_less_equal '70' '80' '90' ;}
function comparison-slong-less-equal-1.4  () { ! mmux_slong_less_equal '33' '11' ;}
function comparison-slong-less-equal-1.5  () { ! mmux_slong_less_equal '33' '99' '55' ;}
function comparison-slong-less-equal-1.6  () {   mmux_slong_less_equal '11' '11' ;}
function comparison-slong-less-equal-1.7  () {   mmux_slong_less_equal '-33' '-22' '-22' ;}


#### type variables: ulong

function comparison-ulong-equal-1.1         () {   mmux_ulong_equal '10' ;}
function comparison-ulong-equal-1.2         () {   mmux_ulong_equal '10' '10' ;}
function comparison-ulong-equal-1.3         () {   mmux_ulong_equal '10' '10' '10' ;}
function comparison-ulong-equal-1.4         () { ! mmux_ulong_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-ulong-greater-1.1       () {   mmux_ulong_greater '90' ;}
function comparison-ulong-greater-1.2       () {   mmux_ulong_greater '90' '80' ;}
function comparison-ulong-greater-1.3       () {   mmux_ulong_greater '90' '80' '70' ;}
function comparison-ulong-greater-1.4       () { ! mmux_ulong_greater '11' '33' ;}
function comparison-ulong-greater-1.5       () { ! mmux_ulong_greater '99' '33' '55' ;}
function comparison-ulong-greater-1.6       () { ! mmux_ulong_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ulong-less-1.1        ()  {   mmux_ulong_less '90' ;}
function comparison-ulong-less-1.2        ()  {   mmux_ulong_less '80' '90' ;}
function comparison-ulong-less-1.3        ()  {   mmux_ulong_less '70' '80' '90' ;}
function comparison-ulong-less-1.4        ()  { ! mmux_ulong_less '33' '11' ;}
function comparison-ulong-less-1.5        ()  { ! mmux_ulong_less '33' '99' '55' ;}
function comparison-ulong-less-1.6        ()  { ! mmux_ulong_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ulong-greater-equal-1.1 () {   mmux_ulong_greater_equal '90' ;}
function comparison-ulong-greater-equal-1.2 () {   mmux_ulong_greater_equal '90' '80' ;}
function comparison-ulong-greater-equal-1.3 () {   mmux_ulong_greater_equal '90' '80' '70' ;}
function comparison-ulong-greater-equal-1.4 () { ! mmux_ulong_greater_equal '11' '33' ;}
function comparison-ulong-greater-equal-1.5 () { ! mmux_ulong_greater_equal '99' '33' '55' ;}
function comparison-ulong-greater-equal-1.6 () {   mmux_ulong_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ulong-less-equal-1.1  () {   mmux_ulong_less_equal '90' ;}
function comparison-ulong-less-equal-1.2  () {   mmux_ulong_less_equal '80' '90' ;}
function comparison-ulong-less-equal-1.3  () {   mmux_ulong_less_equal '70' '80' '90' ;}
function comparison-ulong-less-equal-1.4  () { ! mmux_ulong_less_equal '33' '11' ;}
function comparison-ulong-less-equal-1.5  () { ! mmux_ulong_less_equal '33' '99' '55' ;}
function comparison-ulong-less-equal-1.6  () {   mmux_ulong_less_equal '11' '11' ;}


#### type variables: sllong

if test -v mmux_sllong_SIZEOF
then

function comparison-sllong-equal-1.1         () {   mmux_sllong_equal '10' ;}
function comparison-sllong-equal-1.2         () {   mmux_sllong_equal '10' '10' ;}
function comparison-sllong-equal-1.3         () {   mmux_sllong_equal '10' '10' '10' ;}
function comparison-sllong-equal-1.4         () { ! mmux_sllong_equal '9' '11' '10' ;}
function comparison-sllong-equal-1.5         () {   mmux_sllong_equal '-9' '-9' ;}
function comparison-sllong-equal-1.6         () { ! mmux_sllong_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sllong-greater-1.1       () {   mmux_sllong_greater '90' ;}
function comparison-sllong-greater-1.2       () {   mmux_sllong_greater '90' '80' ;}
function comparison-sllong-greater-1.3       () {   mmux_sllong_greater '90' '80' '70' ;}
function comparison-sllong-greater-1.4       () { ! mmux_sllong_greater '11' '33' ;}
function comparison-sllong-greater-1.5       () { ! mmux_sllong_greater '99' '33' '55' ;}
function comparison-sllong-greater-1.6       () { ! mmux_sllong_greater '11' '11' ;}
function comparison-sllong-greater-1.7       () {   mmux_sllong_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sllong-less-1.1        ()  {   mmux_sllong_less '90' ;}
function comparison-sllong-less-1.2        ()  {   mmux_sllong_less '80' '90' ;}
function comparison-sllong-less-1.3        ()  {   mmux_sllong_less '70' '80' '90' ;}
function comparison-sllong-less-1.4        ()  { ! mmux_sllong_less '33' '11' ;}
function comparison-sllong-less-1.5        ()  { ! mmux_sllong_less '33' '99' '55' ;}
function comparison-sllong-less-1.6        ()  { ! mmux_sllong_less '11' '11' ;}
function comparison-sllong-less-1.7        ()  { ! mmux_sllong_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sllong-greater-equal-1.1 () {   mmux_sllong_greater_equal '90' ;}
function comparison-sllong-greater-equal-1.2 () {   mmux_sllong_greater_equal '90' '80' ;}
function comparison-sllong-greater-equal-1.3 () {   mmux_sllong_greater_equal '90' '80' '70' ;}
function comparison-sllong-greater-equal-1.4 () { ! mmux_sllong_greater_equal '11' '33' ;}
function comparison-sllong-greater-equal-1.5 () { ! mmux_sllong_greater_equal '99' '33' '55' ;}
function comparison-sllong-greater-equal-1.6 () {   mmux_sllong_greater_equal '11' '11' ;}
function comparison-sllong-greater-equal-1.7 () {   mmux_sllong_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sllong-less-equal-1.1  () {   mmux_sllong_less_equal '90' ;}
function comparison-sllong-less-equal-1.2  () {   mmux_sllong_less_equal '80' '90' ;}
function comparison-sllong-less-equal-1.3  () {   mmux_sllong_less_equal '70' '80' '90' ;}
function comparison-sllong-less-equal-1.4  () { ! mmux_sllong_less_equal '33' '11' ;}
function comparison-sllong-less-equal-1.5  () { ! mmux_sllong_less_equal '33' '99' '55' ;}
function comparison-sllong-less-equal-1.6  () {   mmux_sllong_less_equal '11' '11' ;}
function comparison-sllong-less-equal-1.7  () {   mmux_sllong_less_equal '-33' '-22' '-22' ;}

fi


#### type variables: ullong

if test -v mmux_ullong_SIZEOF
then

function comparison-ullong-equal-1.1         () {   mmux_ullong_equal '10' ;}
function comparison-ullong-equal-1.2         () {   mmux_ullong_equal '10' '10' ;}
function comparison-ullong-equal-1.3         () {   mmux_ullong_equal '10' '10' '10' ;}
function comparison-ullong-equal-1.4         () { ! mmux_ullong_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-ullong-greater-1.1       () {   mmux_ullong_greater '90' ;}
function comparison-ullong-greater-1.2       () {   mmux_ullong_greater '90' '80' ;}
function comparison-ullong-greater-1.3       () {   mmux_ullong_greater '90' '80' '70' ;}
function comparison-ullong-greater-1.4       () { ! mmux_ullong_greater '11' '33' ;}
function comparison-ullong-greater-1.5       () { ! mmux_ullong_greater '99' '33' '55' ;}
function comparison-ullong-greater-1.6       () { ! mmux_ullong_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ullong-less-1.1        ()  {   mmux_ullong_less '90' ;}
function comparison-ullong-less-1.2        ()  {   mmux_ullong_less '80' '90' ;}
function comparison-ullong-less-1.3        ()  {   mmux_ullong_less '70' '80' '90' ;}
function comparison-ullong-less-1.4        ()  { ! mmux_ullong_less '33' '11' ;}
function comparison-ullong-less-1.5        ()  { ! mmux_ullong_less '33' '99' '55' ;}
function comparison-ullong-less-1.6        ()  { ! mmux_ullong_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ullong-greater-equal-1.1 () {   mmux_ullong_greater_equal '90' ;}
function comparison-ullong-greater-equal-1.2 () {   mmux_ullong_greater_equal '90' '80' ;}
function comparison-ullong-greater-equal-1.3 () {   mmux_ullong_greater_equal '90' '80' '70' ;}
function comparison-ullong-greater-equal-1.4 () { ! mmux_ullong_greater_equal '11' '33' ;}
function comparison-ullong-greater-equal-1.5 () { ! mmux_ullong_greater_equal '99' '33' '55' ;}
function comparison-ullong-greater-equal-1.6 () {   mmux_ullong_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ullong-less-equal-1.1  () {   mmux_ullong_less_equal '90' ;}
function comparison-ullong-less-equal-1.2  () {   mmux_ullong_less_equal '80' '90' ;}
function comparison-ullong-less-equal-1.3  () {   mmux_ullong_less_equal '70' '80' '90' ;}
function comparison-ullong-less-equal-1.4  () { ! mmux_ullong_less_equal '33' '11' ;}
function comparison-ullong-less-equal-1.5  () { ! mmux_ullong_less_equal '33' '99' '55' ;}
function comparison-ullong-less-equal-1.6  () {   mmux_ullong_less_equal '11' '11' ;}

fi


#### type variables: sint8

function comparison-sint8-equal-1.1         () {   mmux_sint8_equal '10' ;}
function comparison-sint8-equal-1.2         () {   mmux_sint8_equal '10' '10' ;}
function comparison-sint8-equal-1.3         () {   mmux_sint8_equal '10' '10' '10' ;}
function comparison-sint8-equal-1.4         () { ! mmux_sint8_equal '9' '11' '10' ;}
function comparison-sint8-equal-1.5         () {   mmux_sint8_equal '-9' '-9' ;}
function comparison-sint8-equal-1.6         () { ! mmux_sint8_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sint8-greater-1.1       () {   mmux_sint8_greater '90' ;}
function comparison-sint8-greater-1.2       () {   mmux_sint8_greater '90' '80' ;}
function comparison-sint8-greater-1.3       () {   mmux_sint8_greater '90' '80' '70' ;}
function comparison-sint8-greater-1.4       () { ! mmux_sint8_greater '11' '33' ;}
function comparison-sint8-greater-1.5       () { ! mmux_sint8_greater '99' '33' '55' ;}
function comparison-sint8-greater-1.6       () { ! mmux_sint8_greater '11' '11' ;}
function comparison-sint8-greater-1.7       () {   mmux_sint8_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint8-less-1.1        ()  {   mmux_sint8_less '90' ;}
function comparison-sint8-less-1.2        ()  {   mmux_sint8_less '80' '90' ;}
function comparison-sint8-less-1.3        ()  {   mmux_sint8_less '70' '80' '90' ;}
function comparison-sint8-less-1.4        ()  { ! mmux_sint8_less '33' '11' ;}
function comparison-sint8-less-1.5        ()  { ! mmux_sint8_less '33' '99' '55' ;}
function comparison-sint8-less-1.6        ()  { ! mmux_sint8_less '11' '11' ;}
function comparison-sint8-less-1.7        ()  { ! mmux_sint8_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint8-greater-equal-1.1 () {   mmux_sint8_greater_equal '90' ;}
function comparison-sint8-greater-equal-1.2 () {   mmux_sint8_greater_equal '90' '80' ;}
function comparison-sint8-greater-equal-1.3 () {   mmux_sint8_greater_equal '90' '80' '70' ;}
function comparison-sint8-greater-equal-1.4 () { ! mmux_sint8_greater_equal '11' '33' ;}
function comparison-sint8-greater-equal-1.5 () { ! mmux_sint8_greater_equal '99' '33' '55' ;}
function comparison-sint8-greater-equal-1.6 () {   mmux_sint8_greater_equal '11' '11' ;}
function comparison-sint8-greater-equal-1.7 () {   mmux_sint8_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint8-less-equal-1.1  () {   mmux_sint8_less_equal '90' ;}
function comparison-sint8-less-equal-1.2  () {   mmux_sint8_less_equal '80' '90' ;}
function comparison-sint8-less-equal-1.3  () {   mmux_sint8_less_equal '70' '80' '90' ;}
function comparison-sint8-less-equal-1.4  () { ! mmux_sint8_less_equal '33' '11' ;}
function comparison-sint8-less-equal-1.5  () { ! mmux_sint8_less_equal '33' '99' '55' ;}
function comparison-sint8-less-equal-1.6  () {   mmux_sint8_less_equal '11' '11' ;}
function comparison-sint8-less-equal-1.7  () {   mmux_sint8_less_equal '-33' '-22' '-22' ;}


#### type variables: uint8

function comparison-uint8-equal-1.1         () {   mmux_uint8_equal '10' ;}
function comparison-uint8-equal-1.2         () {   mmux_uint8_equal '10' '10' ;}
function comparison-uint8-equal-1.3         () {   mmux_uint8_equal '10' '10' '10' ;}
function comparison-uint8-equal-1.4         () { ! mmux_uint8_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uint8-greater-1.1       () {   mmux_uint8_greater '90' ;}
function comparison-uint8-greater-1.2       () {   mmux_uint8_greater '90' '80' ;}
function comparison-uint8-greater-1.3       () {   mmux_uint8_greater '90' '80' '70' ;}
function comparison-uint8-greater-1.4       () { ! mmux_uint8_greater '11' '33' ;}
function comparison-uint8-greater-1.5       () { ! mmux_uint8_greater '99' '33' '55' ;}
function comparison-uint8-greater-1.6       () { ! mmux_uint8_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint8-less-1.1        ()  {   mmux_uint8_less '90' ;}
function comparison-uint8-less-1.2        ()  {   mmux_uint8_less '80' '90' ;}
function comparison-uint8-less-1.3        ()  {   mmux_uint8_less '70' '80' '90' ;}
function comparison-uint8-less-1.4        ()  { ! mmux_uint8_less '33' '11' ;}
function comparison-uint8-less-1.5        ()  { ! mmux_uint8_less '33' '99' '55' ;}
function comparison-uint8-less-1.6        ()  { ! mmux_uint8_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint8-greater-equal-1.1 () {   mmux_uint8_greater_equal '90' ;}
function comparison-uint8-greater-equal-1.2 () {   mmux_uint8_greater_equal '90' '80' ;}
function comparison-uint8-greater-equal-1.3 () {   mmux_uint8_greater_equal '90' '80' '70' ;}
function comparison-uint8-greater-equal-1.4 () { ! mmux_uint8_greater_equal '11' '33' ;}
function comparison-uint8-greater-equal-1.5 () { ! mmux_uint8_greater_equal '99' '33' '55' ;}
function comparison-uint8-greater-equal-1.6 () {   mmux_uint8_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint8-less-equal-1.1  () {   mmux_uint8_less_equal '90' ;}
function comparison-uint8-less-equal-1.2  () {   mmux_uint8_less_equal '80' '90' ;}
function comparison-uint8-less-equal-1.3  () {   mmux_uint8_less_equal '70' '80' '90' ;}
function comparison-uint8-less-equal-1.4  () { ! mmux_uint8_less_equal '33' '11' ;}
function comparison-uint8-less-equal-1.5  () { ! mmux_uint8_less_equal '33' '99' '55' ;}
function comparison-uint8-less-equal-1.6  () {   mmux_uint8_less_equal '11' '11' ;}


#### type variables: sint16

function comparison-sint16-equal-1.1         () {   mmux_sint16_equal '10' ;}
function comparison-sint16-equal-1.2         () {   mmux_sint16_equal '10' '10' ;}
function comparison-sint16-equal-1.3         () {   mmux_sint16_equal '10' '10' '10' ;}
function comparison-sint16-equal-1.4         () { ! mmux_sint16_equal '9' '11' '10' ;}
function comparison-sint16-equal-1.5         () {   mmux_sint16_equal '-9' '-9' ;}
function comparison-sint16-equal-1.6         () { ! mmux_sint16_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sint16-greater-1.1       () {   mmux_sint16_greater '90' ;}
function comparison-sint16-greater-1.2       () {   mmux_sint16_greater '90' '80' ;}
function comparison-sint16-greater-1.3       () {   mmux_sint16_greater '90' '80' '70' ;}
function comparison-sint16-greater-1.4       () { ! mmux_sint16_greater '11' '33' ;}
function comparison-sint16-greater-1.5       () { ! mmux_sint16_greater '99' '33' '55' ;}
function comparison-sint16-greater-1.6       () { ! mmux_sint16_greater '11' '11' ;}
function comparison-sint16-greater-1.7       () {   mmux_sint16_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint16-less-1.1        ()  {   mmux_sint16_less '90' ;}
function comparison-sint16-less-1.2        ()  {   mmux_sint16_less '80' '90' ;}
function comparison-sint16-less-1.3        ()  {   mmux_sint16_less '70' '80' '90' ;}
function comparison-sint16-less-1.4        ()  { ! mmux_sint16_less '33' '11' ;}
function comparison-sint16-less-1.5        ()  { ! mmux_sint16_less '33' '99' '55' ;}
function comparison-sint16-less-1.6        ()  { ! mmux_sint16_less '11' '11' ;}
function comparison-sint16-less-1.7        ()  { ! mmux_sint16_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint16-greater-equal-1.1 () {   mmux_sint16_greater_equal '90' ;}
function comparison-sint16-greater-equal-1.2 () {   mmux_sint16_greater_equal '90' '80' ;}
function comparison-sint16-greater-equal-1.3 () {   mmux_sint16_greater_equal '90' '80' '70' ;}
function comparison-sint16-greater-equal-1.4 () { ! mmux_sint16_greater_equal '11' '33' ;}
function comparison-sint16-greater-equal-1.5 () { ! mmux_sint16_greater_equal '99' '33' '55' ;}
function comparison-sint16-greater-equal-1.6 () {   mmux_sint16_greater_equal '11' '11' ;}
function comparison-sint16-greater-equal-1.7 () {   mmux_sint16_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint16-less-equal-1.1  () {   mmux_sint16_less_equal '90' ;}
function comparison-sint16-less-equal-1.2  () {   mmux_sint16_less_equal '80' '90' ;}
function comparison-sint16-less-equal-1.3  () {   mmux_sint16_less_equal '70' '80' '90' ;}
function comparison-sint16-less-equal-1.4  () { ! mmux_sint16_less_equal '33' '11' ;}
function comparison-sint16-less-equal-1.5  () { ! mmux_sint16_less_equal '33' '99' '55' ;}
function comparison-sint16-less-equal-1.6  () {   mmux_sint16_less_equal '11' '11' ;}
function comparison-sint16-less-equal-1.7  () {   mmux_sint16_less_equal '-33' '-22' '-22' ;}


#### type variables: uint16

function comparison-uint16-equal-1.1         () {   mmux_uint16_equal '10' ;}
function comparison-uint16-equal-1.2         () {   mmux_uint16_equal '10' '10' ;}
function comparison-uint16-equal-1.3         () {   mmux_uint16_equal '10' '10' '10' ;}
function comparison-uint16-equal-1.4         () { ! mmux_uint16_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uint16-greater-1.1       () {   mmux_uint16_greater '90' ;}
function comparison-uint16-greater-1.2       () {   mmux_uint16_greater '90' '80' ;}
function comparison-uint16-greater-1.3       () {   mmux_uint16_greater '90' '80' '70' ;}
function comparison-uint16-greater-1.4       () { ! mmux_uint16_greater '11' '33' ;}
function comparison-uint16-greater-1.5       () { ! mmux_uint16_greater '99' '33' '55' ;}
function comparison-uint16-greater-1.6       () { ! mmux_uint16_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint16-less-1.1        ()  {   mmux_uint16_less '90' ;}
function comparison-uint16-less-1.2        ()  {   mmux_uint16_less '80' '90' ;}
function comparison-uint16-less-1.3        ()  {   mmux_uint16_less '70' '80' '90' ;}
function comparison-uint16-less-1.4        ()  { ! mmux_uint16_less '33' '11' ;}
function comparison-uint16-less-1.5        ()  { ! mmux_uint16_less '33' '99' '55' ;}
function comparison-uint16-less-1.6        ()  { ! mmux_uint16_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint16-greater-equal-1.1 () {   mmux_uint16_greater_equal '90' ;}
function comparison-uint16-greater-equal-1.2 () {   mmux_uint16_greater_equal '90' '80' ;}
function comparison-uint16-greater-equal-1.3 () {   mmux_uint16_greater_equal '90' '80' '70' ;}
function comparison-uint16-greater-equal-1.4 () { ! mmux_uint16_greater_equal '11' '33' ;}
function comparison-uint16-greater-equal-1.5 () { ! mmux_uint16_greater_equal '99' '33' '55' ;}
function comparison-uint16-greater-equal-1.6 () {   mmux_uint16_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint16-less-equal-1.1  () {   mmux_uint16_less_equal '90' ;}
function comparison-uint16-less-equal-1.2  () {   mmux_uint16_less_equal '80' '90' ;}
function comparison-uint16-less-equal-1.3  () {   mmux_uint16_less_equal '70' '80' '90' ;}
function comparison-uint16-less-equal-1.4  () { ! mmux_uint16_less_equal '33' '11' ;}
function comparison-uint16-less-equal-1.5  () { ! mmux_uint16_less_equal '33' '99' '55' ;}
function comparison-uint16-less-equal-1.6  () {   mmux_uint16_less_equal '11' '11' ;}


#### type variables: sint32

function comparison-sint32-equal-1.1         () {   mmux_sint32_equal '10' ;}
function comparison-sint32-equal-1.2         () {   mmux_sint32_equal '10' '10' ;}
function comparison-sint32-equal-1.3         () {   mmux_sint32_equal '10' '10' '10' ;}
function comparison-sint32-equal-1.4         () { ! mmux_sint32_equal '9' '11' '10' ;}
function comparison-sint32-equal-1.5         () {   mmux_sint32_equal '-9' '-9' ;}
function comparison-sint32-equal-1.6         () { ! mmux_sint32_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sint32-greater-1.1       () {   mmux_sint32_greater '90' ;}
function comparison-sint32-greater-1.2       () {   mmux_sint32_greater '90' '80' ;}
function comparison-sint32-greater-1.3       () {   mmux_sint32_greater '90' '80' '70' ;}
function comparison-sint32-greater-1.4       () { ! mmux_sint32_greater '11' '33' ;}
function comparison-sint32-greater-1.5       () { ! mmux_sint32_greater '99' '33' '55' ;}
function comparison-sint32-greater-1.6       () { ! mmux_sint32_greater '11' '11' ;}
function comparison-sint32-greater-1.7       () {   mmux_sint32_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint32-less-1.1        ()  {   mmux_sint32_less '90' ;}
function comparison-sint32-less-1.2        ()  {   mmux_sint32_less '80' '90' ;}
function comparison-sint32-less-1.3        ()  {   mmux_sint32_less '70' '80' '90' ;}
function comparison-sint32-less-1.4        ()  { ! mmux_sint32_less '33' '11' ;}
function comparison-sint32-less-1.5        ()  { ! mmux_sint32_less '33' '99' '55' ;}
function comparison-sint32-less-1.6        ()  { ! mmux_sint32_less '11' '11' ;}
function comparison-sint32-less-1.7        ()  { ! mmux_sint32_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint32-greater-equal-1.1 () {   mmux_sint32_greater_equal '90' ;}
function comparison-sint32-greater-equal-1.2 () {   mmux_sint32_greater_equal '90' '80' ;}
function comparison-sint32-greater-equal-1.3 () {   mmux_sint32_greater_equal '90' '80' '70' ;}
function comparison-sint32-greater-equal-1.4 () { ! mmux_sint32_greater_equal '11' '33' ;}
function comparison-sint32-greater-equal-1.5 () { ! mmux_sint32_greater_equal '99' '33' '55' ;}
function comparison-sint32-greater-equal-1.6 () {   mmux_sint32_greater_equal '11' '11' ;}
function comparison-sint32-greater-equal-1.7 () {   mmux_sint32_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint32-less-equal-1.1  () {   mmux_sint32_less_equal '90' ;}
function comparison-sint32-less-equal-1.2  () {   mmux_sint32_less_equal '80' '90' ;}
function comparison-sint32-less-equal-1.3  () {   mmux_sint32_less_equal '70' '80' '90' ;}
function comparison-sint32-less-equal-1.4  () { ! mmux_sint32_less_equal '33' '11' ;}
function comparison-sint32-less-equal-1.5  () { ! mmux_sint32_less_equal '33' '99' '55' ;}
function comparison-sint32-less-equal-1.6  () {   mmux_sint32_less_equal '11' '11' ;}
function comparison-sint32-less-equal-1.7  () {   mmux_sint32_less_equal '-33' '-22' '-22' ;}


#### type variables: uint32

function comparison-uint32-equal-1.1         () {   mmux_uint32_equal '10' ;}
function comparison-uint32-equal-1.2         () {   mmux_uint32_equal '10' '10' ;}
function comparison-uint32-equal-1.3         () {   mmux_uint32_equal '10' '10' '10' ;}
function comparison-uint32-equal-1.4         () { ! mmux_uint32_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uint32-greater-1.1       () {   mmux_uint32_greater '90' ;}
function comparison-uint32-greater-1.2       () {   mmux_uint32_greater '90' '80' ;}
function comparison-uint32-greater-1.3       () {   mmux_uint32_greater '90' '80' '70' ;}
function comparison-uint32-greater-1.4       () { ! mmux_uint32_greater '11' '33' ;}
function comparison-uint32-greater-1.5       () { ! mmux_uint32_greater '99' '33' '55' ;}
function comparison-uint32-greater-1.6       () { ! mmux_uint32_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint32-less-1.1        ()  {   mmux_uint32_less '90' ;}
function comparison-uint32-less-1.2        ()  {   mmux_uint32_less '80' '90' ;}
function comparison-uint32-less-1.3        ()  {   mmux_uint32_less '70' '80' '90' ;}
function comparison-uint32-less-1.4        ()  { ! mmux_uint32_less '33' '11' ;}
function comparison-uint32-less-1.5        ()  { ! mmux_uint32_less '33' '99' '55' ;}
function comparison-uint32-less-1.6        ()  { ! mmux_uint32_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint32-greater-equal-1.1 () {   mmux_uint32_greater_equal '90' ;}
function comparison-uint32-greater-equal-1.2 () {   mmux_uint32_greater_equal '90' '80' ;}
function comparison-uint32-greater-equal-1.3 () {   mmux_uint32_greater_equal '90' '80' '70' ;}
function comparison-uint32-greater-equal-1.4 () { ! mmux_uint32_greater_equal '11' '33' ;}
function comparison-uint32-greater-equal-1.5 () { ! mmux_uint32_greater_equal '99' '33' '55' ;}
function comparison-uint32-greater-equal-1.6 () {   mmux_uint32_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint32-less-equal-1.1  () {   mmux_uint32_less_equal '90' ;}
function comparison-uint32-less-equal-1.2  () {   mmux_uint32_less_equal '80' '90' ;}
function comparison-uint32-less-equal-1.3  () {   mmux_uint32_less_equal '70' '80' '90' ;}
function comparison-uint32-less-equal-1.4  () { ! mmux_uint32_less_equal '33' '11' ;}
function comparison-uint32-less-equal-1.5  () { ! mmux_uint32_less_equal '33' '99' '55' ;}
function comparison-uint32-less-equal-1.6  () {   mmux_uint32_less_equal '11' '11' ;}


#### type variables: sint64

function comparison-sint64-equal-1.1         () {   mmux_sint64_equal '10' ;}
function comparison-sint64-equal-1.2         () {   mmux_sint64_equal '10' '10' ;}
function comparison-sint64-equal-1.3         () {   mmux_sint64_equal '10' '10' '10' ;}
function comparison-sint64-equal-1.4         () { ! mmux_sint64_equal '9' '11' '10' ;}
function comparison-sint64-equal-1.5         () {   mmux_sint64_equal '-9' '-9' ;}
function comparison-sint64-equal-1.6         () { ! mmux_sint64_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sint64-greater-1.1       () {   mmux_sint64_greater '90' ;}
function comparison-sint64-greater-1.2       () {   mmux_sint64_greater '90' '80' ;}
function comparison-sint64-greater-1.3       () {   mmux_sint64_greater '90' '80' '70' ;}
function comparison-sint64-greater-1.4       () { ! mmux_sint64_greater '11' '33' ;}
function comparison-sint64-greater-1.5       () { ! mmux_sint64_greater '99' '33' '55' ;}
function comparison-sint64-greater-1.6       () { ! mmux_sint64_greater '11' '11' ;}
function comparison-sint64-greater-1.7       () {   mmux_sint64_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint64-less-1.1        ()  {   mmux_sint64_less '90' ;}
function comparison-sint64-less-1.2        ()  {   mmux_sint64_less '80' '90' ;}
function comparison-sint64-less-1.3        ()  {   mmux_sint64_less '70' '80' '90' ;}
function comparison-sint64-less-1.4        ()  { ! mmux_sint64_less '33' '11' ;}
function comparison-sint64-less-1.5        ()  { ! mmux_sint64_less '33' '99' '55' ;}
function comparison-sint64-less-1.6        ()  { ! mmux_sint64_less '11' '11' ;}
function comparison-sint64-less-1.7        ()  { ! mmux_sint64_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint64-greater-equal-1.1 () {   mmux_sint64_greater_equal '90' ;}
function comparison-sint64-greater-equal-1.2 () {   mmux_sint64_greater_equal '90' '80' ;}
function comparison-sint64-greater-equal-1.3 () {   mmux_sint64_greater_equal '90' '80' '70' ;}
function comparison-sint64-greater-equal-1.4 () { ! mmux_sint64_greater_equal '11' '33' ;}
function comparison-sint64-greater-equal-1.5 () { ! mmux_sint64_greater_equal '99' '33' '55' ;}
function comparison-sint64-greater-equal-1.6 () {   mmux_sint64_greater_equal '11' '11' ;}
function comparison-sint64-greater-equal-1.7 () {   mmux_sint64_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint64-less-equal-1.1  () {   mmux_sint64_less_equal '90' ;}
function comparison-sint64-less-equal-1.2  () {   mmux_sint64_less_equal '80' '90' ;}
function comparison-sint64-less-equal-1.3  () {   mmux_sint64_less_equal '70' '80' '90' ;}
function comparison-sint64-less-equal-1.4  () { ! mmux_sint64_less_equal '33' '11' ;}
function comparison-sint64-less-equal-1.5  () { ! mmux_sint64_less_equal '33' '99' '55' ;}
function comparison-sint64-less-equal-1.6  () {   mmux_sint64_less_equal '11' '11' ;}
function comparison-sint64-less-equal-1.7  () {   mmux_sint64_less_equal '-33' '-22' '-22' ;}


#### type variables: uint64

function comparison-uint64-equal-1.1         () {   mmux_uint64_equal '10' ;}
function comparison-uint64-equal-1.2         () {   mmux_uint64_equal '10' '10' ;}
function comparison-uint64-equal-1.3         () {   mmux_uint64_equal '10' '10' '10' ;}
function comparison-uint64-equal-1.4         () { ! mmux_uint64_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uint64-greater-1.1       () {   mmux_uint64_greater '90' ;}
function comparison-uint64-greater-1.2       () {   mmux_uint64_greater '90' '80' ;}
function comparison-uint64-greater-1.3       () {   mmux_uint64_greater '90' '80' '70' ;}
function comparison-uint64-greater-1.4       () { ! mmux_uint64_greater '11' '33' ;}
function comparison-uint64-greater-1.5       () { ! mmux_uint64_greater '99' '33' '55' ;}
function comparison-uint64-greater-1.6       () { ! mmux_uint64_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint64-less-1.1        ()  {   mmux_uint64_less '90' ;}
function comparison-uint64-less-1.2        ()  {   mmux_uint64_less '80' '90' ;}
function comparison-uint64-less-1.3        ()  {   mmux_uint64_less '70' '80' '90' ;}
function comparison-uint64-less-1.4        ()  { ! mmux_uint64_less '33' '11' ;}
function comparison-uint64-less-1.5        ()  { ! mmux_uint64_less '33' '99' '55' ;}
function comparison-uint64-less-1.6        ()  { ! mmux_uint64_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint64-greater-equal-1.1 () {   mmux_uint64_greater_equal '90' ;}
function comparison-uint64-greater-equal-1.2 () {   mmux_uint64_greater_equal '90' '80' ;}
function comparison-uint64-greater-equal-1.3 () {   mmux_uint64_greater_equal '90' '80' '70' ;}
function comparison-uint64-greater-equal-1.4 () { ! mmux_uint64_greater_equal '11' '33' ;}
function comparison-uint64-greater-equal-1.5 () { ! mmux_uint64_greater_equal '99' '33' '55' ;}
function comparison-uint64-greater-equal-1.6 () {   mmux_uint64_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint64-less-equal-1.1  () {   mmux_uint64_less_equal '90' ;}
function comparison-uint64-less-equal-1.2  () {   mmux_uint64_less_equal '80' '90' ;}
function comparison-uint64-less-equal-1.3  () {   mmux_uint64_less_equal '70' '80' '90' ;}
function comparison-uint64-less-equal-1.4  () { ! mmux_uint64_less_equal '33' '11' ;}
function comparison-uint64-less-equal-1.5  () { ! mmux_uint64_less_equal '33' '99' '55' ;}
function comparison-uint64-less-equal-1.6  () {   mmux_uint64_less_equal '11' '11' ;}


#### type variables: sintmax

function comparison-sintmax-equal-1.1         () {   mmux_sintmax_equal '10' ;}
function comparison-sintmax-equal-1.2         () {   mmux_sintmax_equal '10' '10' ;}
function comparison-sintmax-equal-1.3         () {   mmux_sintmax_equal '10' '10' '10' ;}
function comparison-sintmax-equal-1.4         () { ! mmux_sintmax_equal '9' '11' '10' ;}
function comparison-sintmax-equal-1.5         () {   mmux_sintmax_equal '-9' '-9' ;}
function comparison-sintmax-equal-1.6         () { ! mmux_sintmax_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-greater-1.1       () {   mmux_sintmax_greater '90' ;}
function comparison-sintmax-greater-1.2       () {   mmux_sintmax_greater '90' '80' ;}
function comparison-sintmax-greater-1.3       () {   mmux_sintmax_greater '90' '80' '70' ;}
function comparison-sintmax-greater-1.4       () { ! mmux_sintmax_greater '11' '33' ;}
function comparison-sintmax-greater-1.5       () { ! mmux_sintmax_greater '99' '33' '55' ;}
function comparison-sintmax-greater-1.6       () { ! mmux_sintmax_greater '11' '11' ;}
function comparison-sintmax-greater-1.7       () {   mmux_sintmax_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-less-1.1        ()  {   mmux_sintmax_less '90' ;}
function comparison-sintmax-less-1.2        ()  {   mmux_sintmax_less '80' '90' ;}
function comparison-sintmax-less-1.3        ()  {   mmux_sintmax_less '70' '80' '90' ;}
function comparison-sintmax-less-1.4        ()  { ! mmux_sintmax_less '33' '11' ;}
function comparison-sintmax-less-1.5        ()  { ! mmux_sintmax_less '33' '99' '55' ;}
function comparison-sintmax-less-1.6        ()  { ! mmux_sintmax_less '11' '11' ;}
function comparison-sintmax-less-1.7        ()  { ! mmux_sintmax_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-greater-equal-1.1 () {   mmux_sintmax_greater_equal '90' ;}
function comparison-sintmax-greater-equal-1.2 () {   mmux_sintmax_greater_equal '90' '80' ;}
function comparison-sintmax-greater-equal-1.3 () {   mmux_sintmax_greater_equal '90' '80' '70' ;}
function comparison-sintmax-greater-equal-1.4 () { ! mmux_sintmax_greater_equal '11' '33' ;}
function comparison-sintmax-greater-equal-1.5 () { ! mmux_sintmax_greater_equal '99' '33' '55' ;}
function comparison-sintmax-greater-equal-1.6 () {   mmux_sintmax_greater_equal '11' '11' ;}
function comparison-sintmax-greater-equal-1.7 () {   mmux_sintmax_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-less-equal-1.1  () {   mmux_sintmax_less_equal '90' ;}
function comparison-sintmax-less-equal-1.2  () {   mmux_sintmax_less_equal '80' '90' ;}
function comparison-sintmax-less-equal-1.3  () {   mmux_sintmax_less_equal '70' '80' '90' ;}
function comparison-sintmax-less-equal-1.4  () { ! mmux_sintmax_less_equal '33' '11' ;}
function comparison-sintmax-less-equal-1.5  () { ! mmux_sintmax_less_equal '33' '99' '55' ;}
function comparison-sintmax-less-equal-1.6  () {   mmux_sintmax_less_equal '11' '11' ;}
function comparison-sintmax-less-equal-1.7  () {   mmux_sintmax_less_equal '-33' '-22' '-22' ;}


#### type variables: uintmax

function comparison-uintmax-equal-1.1         () {   mmux_uintmax_equal '10' ;}
function comparison-uintmax-equal-1.2         () {   mmux_uintmax_equal '10' '10' ;}
function comparison-uintmax-equal-1.3         () {   mmux_uintmax_equal '10' '10' '10' ;}
function comparison-uintmax-equal-1.4         () { ! mmux_uintmax_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-greater-1.1       () {   mmux_uintmax_greater '90' ;}
function comparison-uintmax-greater-1.2       () {   mmux_uintmax_greater '90' '80' ;}
function comparison-uintmax-greater-1.3       () {   mmux_uintmax_greater '90' '80' '70' ;}
function comparison-uintmax-greater-1.4       () { ! mmux_uintmax_greater '11' '33' ;}
function comparison-uintmax-greater-1.5       () { ! mmux_uintmax_greater '99' '33' '55' ;}
function comparison-uintmax-greater-1.6       () { ! mmux_uintmax_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-less-1.1        ()  {   mmux_uintmax_less '90' ;}
function comparison-uintmax-less-1.2        ()  {   mmux_uintmax_less '80' '90' ;}
function comparison-uintmax-less-1.3        ()  {   mmux_uintmax_less '70' '80' '90' ;}
function comparison-uintmax-less-1.4        ()  { ! mmux_uintmax_less '33' '11' ;}
function comparison-uintmax-less-1.5        ()  { ! mmux_uintmax_less '33' '99' '55' ;}
function comparison-uintmax-less-1.6        ()  { ! mmux_uintmax_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-greater-equal-1.1 () {   mmux_uintmax_greater_equal '90' ;}
function comparison-uintmax-greater-equal-1.2 () {   mmux_uintmax_greater_equal '90' '80' ;}
function comparison-uintmax-greater-equal-1.3 () {   mmux_uintmax_greater_equal '90' '80' '70' ;}
function comparison-uintmax-greater-equal-1.4 () { ! mmux_uintmax_greater_equal '11' '33' ;}
function comparison-uintmax-greater-equal-1.5 () { ! mmux_uintmax_greater_equal '99' '33' '55' ;}
function comparison-uintmax-greater-equal-1.6 () {   mmux_uintmax_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-less-equal-1.1  () {   mmux_uintmax_less_equal '90' ;}
function comparison-uintmax-less-equal-1.2  () {   mmux_uintmax_less_equal '80' '90' ;}
function comparison-uintmax-less-equal-1.3  () {   mmux_uintmax_less_equal '70' '80' '90' ;}
function comparison-uintmax-less-equal-1.4  () { ! mmux_uintmax_less_equal '33' '11' ;}
function comparison-uintmax-less-equal-1.5  () { ! mmux_uintmax_less_equal '33' '99' '55' ;}
function comparison-uintmax-less-equal-1.6  () {   mmux_uintmax_less_equal '11' '11' ;}


#### type variables: sintptr

function comparison-sintptr-equal-1.1         () {   mmux_sintptr_equal '10' ;}
function comparison-sintptr-equal-1.2         () {   mmux_sintptr_equal '10' '10' ;}
function comparison-sintptr-equal-1.3         () {   mmux_sintptr_equal '10' '10' '10' ;}
function comparison-sintptr-equal-1.4         () { ! mmux_sintptr_equal '9' '11' '10' ;}
function comparison-sintptr-equal-1.5         () {   mmux_sintptr_equal '-9' '-9' ;}
function comparison-sintptr-equal-1.6         () { ! mmux_sintptr_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-greater-1.1       () {   mmux_sintptr_greater '90' ;}
function comparison-sintptr-greater-1.2       () {   mmux_sintptr_greater '90' '80' ;}
function comparison-sintptr-greater-1.3       () {   mmux_sintptr_greater '90' '80' '70' ;}
function comparison-sintptr-greater-1.4       () { ! mmux_sintptr_greater '11' '33' ;}
function comparison-sintptr-greater-1.5       () { ! mmux_sintptr_greater '99' '33' '55' ;}
function comparison-sintptr-greater-1.6       () { ! mmux_sintptr_greater '11' '11' ;}
function comparison-sintptr-greater-1.7       () {   mmux_sintptr_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-less-1.1        ()  {   mmux_sintptr_less '90' ;}
function comparison-sintptr-less-1.2        ()  {   mmux_sintptr_less '80' '90' ;}
function comparison-sintptr-less-1.3        ()  {   mmux_sintptr_less '70' '80' '90' ;}
function comparison-sintptr-less-1.4        ()  { ! mmux_sintptr_less '33' '11' ;}
function comparison-sintptr-less-1.5        ()  { ! mmux_sintptr_less '33' '99' '55' ;}
function comparison-sintptr-less-1.6        ()  { ! mmux_sintptr_less '11' '11' ;}
function comparison-sintptr-less-1.7        ()  { ! mmux_sintptr_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-greater-equal-1.1 () {   mmux_sintptr_greater_equal '90' ;}
function comparison-sintptr-greater-equal-1.2 () {   mmux_sintptr_greater_equal '90' '80' ;}
function comparison-sintptr-greater-equal-1.3 () {   mmux_sintptr_greater_equal '90' '80' '70' ;}
function comparison-sintptr-greater-equal-1.4 () { ! mmux_sintptr_greater_equal '11' '33' ;}
function comparison-sintptr-greater-equal-1.5 () { ! mmux_sintptr_greater_equal '99' '33' '55' ;}
function comparison-sintptr-greater-equal-1.6 () {   mmux_sintptr_greater_equal '11' '11' ;}
function comparison-sintptr-greater-equal-1.7 () {   mmux_sintptr_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-less-equal-1.1  () {   mmux_sintptr_less_equal '90' ;}
function comparison-sintptr-less-equal-1.2  () {   mmux_sintptr_less_equal '80' '90' ;}
function comparison-sintptr-less-equal-1.3  () {   mmux_sintptr_less_equal '70' '80' '90' ;}
function comparison-sintptr-less-equal-1.4  () { ! mmux_sintptr_less_equal '33' '11' ;}
function comparison-sintptr-less-equal-1.5  () { ! mmux_sintptr_less_equal '33' '99' '55' ;}
function comparison-sintptr-less-equal-1.6  () {   mmux_sintptr_less_equal '11' '11' ;}
function comparison-sintptr-less-equal-1.7  () {   mmux_sintptr_less_equal '-33' '-22' '-22' ;}


#### type variables: uintptr

function comparison-uintptr-equal-1.1         () {   mmux_uintptr_equal '10' ;}
function comparison-uintptr-equal-1.2         () {   mmux_uintptr_equal '10' '10' ;}
function comparison-uintptr-equal-1.3         () {   mmux_uintptr_equal '10' '10' '10' ;}
function comparison-uintptr-equal-1.4         () { ! mmux_uintptr_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-greater-1.1       () {   mmux_uintptr_greater '90' ;}
function comparison-uintptr-greater-1.2       () {   mmux_uintptr_greater '90' '80' ;}
function comparison-uintptr-greater-1.3       () {   mmux_uintptr_greater '90' '80' '70' ;}
function comparison-uintptr-greater-1.4       () { ! mmux_uintptr_greater '11' '33' ;}
function comparison-uintptr-greater-1.5       () { ! mmux_uintptr_greater '99' '33' '55' ;}
function comparison-uintptr-greater-1.6       () { ! mmux_uintptr_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-less-1.1        ()  {   mmux_uintptr_less '90' ;}
function comparison-uintptr-less-1.2        ()  {   mmux_uintptr_less '80' '90' ;}
function comparison-uintptr-less-1.3        ()  {   mmux_uintptr_less '70' '80' '90' ;}
function comparison-uintptr-less-1.4        ()  { ! mmux_uintptr_less '33' '11' ;}
function comparison-uintptr-less-1.5        ()  { ! mmux_uintptr_less '33' '99' '55' ;}
function comparison-uintptr-less-1.6        ()  { ! mmux_uintptr_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-greater-equal-1.1 () {   mmux_uintptr_greater_equal '90' ;}
function comparison-uintptr-greater-equal-1.2 () {   mmux_uintptr_greater_equal '90' '80' ;}
function comparison-uintptr-greater-equal-1.3 () {   mmux_uintptr_greater_equal '90' '80' '70' ;}
function comparison-uintptr-greater-equal-1.4 () { ! mmux_uintptr_greater_equal '11' '33' ;}
function comparison-uintptr-greater-equal-1.5 () { ! mmux_uintptr_greater_equal '99' '33' '55' ;}
function comparison-uintptr-greater-equal-1.6 () {   mmux_uintptr_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-less-equal-1.1  () {   mmux_uintptr_less_equal '90' ;}
function comparison-uintptr-less-equal-1.2  () {   mmux_uintptr_less_equal '80' '90' ;}
function comparison-uintptr-less-equal-1.3  () {   mmux_uintptr_less_equal '70' '80' '90' ;}
function comparison-uintptr-less-equal-1.4  () { ! mmux_uintptr_less_equal '33' '11' ;}
function comparison-uintptr-less-equal-1.5  () { ! mmux_uintptr_less_equal '33' '99' '55' ;}
function comparison-uintptr-less-equal-1.6  () {   mmux_uintptr_less_equal '11' '11' ;}


#### type variables: ssize

function comparison-ssize-equal-1.1         () {   mmux_ssize_equal '10' ;}
function comparison-ssize-equal-1.2         () {   mmux_ssize_equal '10' '10' ;}
function comparison-ssize-equal-1.3         () {   mmux_ssize_equal '10' '10' '10' ;}
function comparison-ssize-equal-1.4         () { ! mmux_ssize_equal '9' '11' '10' ;}
function comparison-ssize-equal-1.5         () {   mmux_ssize_equal '-9' '-9' ;}
function comparison-ssize-equal-1.6         () { ! mmux_ssize_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-ssize-greater-1.1       () {   mmux_ssize_greater '90' ;}
function comparison-ssize-greater-1.2       () {   mmux_ssize_greater '90' '80' ;}
function comparison-ssize-greater-1.3       () {   mmux_ssize_greater '90' '80' '70' ;}
function comparison-ssize-greater-1.4       () { ! mmux_ssize_greater '11' '33' ;}
function comparison-ssize-greater-1.5       () { ! mmux_ssize_greater '99' '33' '55' ;}
function comparison-ssize-greater-1.6       () { ! mmux_ssize_greater '11' '11' ;}
function comparison-ssize-greater-1.7       () {   mmux_ssize_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ssize-less-1.1        ()  {   mmux_ssize_less '90' ;}
function comparison-ssize-less-1.2        ()  {   mmux_ssize_less '80' '90' ;}
function comparison-ssize-less-1.3        ()  {   mmux_ssize_less '70' '80' '90' ;}
function comparison-ssize-less-1.4        ()  { ! mmux_ssize_less '33' '11' ;}
function comparison-ssize-less-1.5        ()  { ! mmux_ssize_less '33' '99' '55' ;}
function comparison-ssize-less-1.6        ()  { ! mmux_ssize_less '11' '11' ;}
function comparison-ssize-less-1.7        ()  { ! mmux_ssize_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ssize-greater-equal-1.1 () {   mmux_ssize_greater_equal '90' ;}
function comparison-ssize-greater-equal-1.2 () {   mmux_ssize_greater_equal '90' '80' ;}
function comparison-ssize-greater-equal-1.3 () {   mmux_ssize_greater_equal '90' '80' '70' ;}
function comparison-ssize-greater-equal-1.4 () { ! mmux_ssize_greater_equal '11' '33' ;}
function comparison-ssize-greater-equal-1.5 () { ! mmux_ssize_greater_equal '99' '33' '55' ;}
function comparison-ssize-greater-equal-1.6 () {   mmux_ssize_greater_equal '11' '11' ;}
function comparison-ssize-greater-equal-1.7 () {   mmux_ssize_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-ssize-less-equal-1.1  () {   mmux_ssize_less_equal '90' ;}
function comparison-ssize-less-equal-1.2  () {   mmux_ssize_less_equal '80' '90' ;}
function comparison-ssize-less-equal-1.3  () {   mmux_ssize_less_equal '70' '80' '90' ;}
function comparison-ssize-less-equal-1.4  () { ! mmux_ssize_less_equal '33' '11' ;}
function comparison-ssize-less-equal-1.5  () { ! mmux_ssize_less_equal '33' '99' '55' ;}
function comparison-ssize-less-equal-1.6  () {   mmux_ssize_less_equal '11' '11' ;}
function comparison-ssize-less-equal-1.7  () {   mmux_ssize_less_equal '-33' '-22' '-22' ;}


#### type variables: usize

function comparison-usize-equal-1.1         () {   mmux_usize_equal '10' ;}
function comparison-usize-equal-1.2         () {   mmux_usize_equal '10' '10' ;}
function comparison-usize-equal-1.3         () {   mmux_usize_equal '10' '10' '10' ;}
function comparison-usize-equal-1.4         () { ! mmux_usize_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-usize-greater-1.1       () {   mmux_usize_greater '90' ;}
function comparison-usize-greater-1.2       () {   mmux_usize_greater '90' '80' ;}
function comparison-usize-greater-1.3       () {   mmux_usize_greater '90' '80' '70' ;}
function comparison-usize-greater-1.4       () { ! mmux_usize_greater '11' '33' ;}
function comparison-usize-greater-1.5       () { ! mmux_usize_greater '99' '33' '55' ;}
function comparison-usize-greater-1.6       () { ! mmux_usize_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-usize-less-1.1        ()  {   mmux_usize_less '90' ;}
function comparison-usize-less-1.2        ()  {   mmux_usize_less '80' '90' ;}
function comparison-usize-less-1.3        ()  {   mmux_usize_less '70' '80' '90' ;}
function comparison-usize-less-1.4        ()  { ! mmux_usize_less '33' '11' ;}
function comparison-usize-less-1.5        ()  { ! mmux_usize_less '33' '99' '55' ;}
function comparison-usize-less-1.6        ()  { ! mmux_usize_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-usize-greater-equal-1.1 () {   mmux_usize_greater_equal '90' ;}
function comparison-usize-greater-equal-1.2 () {   mmux_usize_greater_equal '90' '80' ;}
function comparison-usize-greater-equal-1.3 () {   mmux_usize_greater_equal '90' '80' '70' ;}
function comparison-usize-greater-equal-1.4 () { ! mmux_usize_greater_equal '11' '33' ;}
function comparison-usize-greater-equal-1.5 () { ! mmux_usize_greater_equal '99' '33' '55' ;}
function comparison-usize-greater-equal-1.6 () {   mmux_usize_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-usize-less-equal-1.1  () {   mmux_usize_less_equal '90' ;}
function comparison-usize-less-equal-1.2  () {   mmux_usize_less_equal '80' '90' ;}
function comparison-usize-less-equal-1.3  () {   mmux_usize_less_equal '70' '80' '90' ;}
function comparison-usize-less-equal-1.4  () { ! mmux_usize_less_equal '33' '11' ;}
function comparison-usize-less-equal-1.5  () { ! mmux_usize_less_equal '33' '99' '55' ;}
function comparison-usize-less-equal-1.6  () {   mmux_usize_less_equal '11' '11' ;}


#### type variables: ptrdiff

function comparison-ptrdiff-equal-1.1         () {   mmux_ptrdiff_equal '10' ;}
function comparison-ptrdiff-equal-1.2         () {   mmux_ptrdiff_equal '10' '10' ;}
function comparison-ptrdiff-equal-1.3         () {   mmux_ptrdiff_equal '10' '10' '10' ;}
function comparison-ptrdiff-equal-1.4         () { ! mmux_ptrdiff_equal '9' '11' '10' ;}
function comparison-ptrdiff-equal-1.5         () {   mmux_ptrdiff_equal '-9' '-9' ;}
function comparison-ptrdiff-equal-1.6         () { ! mmux_ptrdiff_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-greater-1.1       () {   mmux_ptrdiff_greater '90' ;}
function comparison-ptrdiff-greater-1.2       () {   mmux_ptrdiff_greater '90' '80' ;}
function comparison-ptrdiff-greater-1.3       () {   mmux_ptrdiff_greater '90' '80' '70' ;}
function comparison-ptrdiff-greater-1.4       () { ! mmux_ptrdiff_greater '11' '33' ;}
function comparison-ptrdiff-greater-1.5       () { ! mmux_ptrdiff_greater '99' '33' '55' ;}
function comparison-ptrdiff-greater-1.6       () { ! mmux_ptrdiff_greater '11' '11' ;}
function comparison-ptrdiff-greater-1.7       () {   mmux_ptrdiff_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-less-1.1        ()  {   mmux_ptrdiff_less '90' ;}
function comparison-ptrdiff-less-1.2        ()  {   mmux_ptrdiff_less '80' '90' ;}
function comparison-ptrdiff-less-1.3        ()  {   mmux_ptrdiff_less '70' '80' '90' ;}
function comparison-ptrdiff-less-1.4        ()  { ! mmux_ptrdiff_less '33' '11' ;}
function comparison-ptrdiff-less-1.5        ()  { ! mmux_ptrdiff_less '33' '99' '55' ;}
function comparison-ptrdiff-less-1.6        ()  { ! mmux_ptrdiff_less '11' '11' ;}
function comparison-ptrdiff-less-1.7        ()  { ! mmux_ptrdiff_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-greater-equal-1.1 () {   mmux_ptrdiff_greater_equal '90' ;}
function comparison-ptrdiff-greater-equal-1.2 () {   mmux_ptrdiff_greater_equal '90' '80' ;}
function comparison-ptrdiff-greater-equal-1.3 () {   mmux_ptrdiff_greater_equal '90' '80' '70' ;}
function comparison-ptrdiff-greater-equal-1.4 () { ! mmux_ptrdiff_greater_equal '11' '33' ;}
function comparison-ptrdiff-greater-equal-1.5 () { ! mmux_ptrdiff_greater_equal '99' '33' '55' ;}
function comparison-ptrdiff-greater-equal-1.6 () {   mmux_ptrdiff_greater_equal '11' '11' ;}
function comparison-ptrdiff-greater-equal-1.7 () {   mmux_ptrdiff_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-less-equal-1.1  () {   mmux_ptrdiff_less_equal '90' ;}
function comparison-ptrdiff-less-equal-1.2  () {   mmux_ptrdiff_less_equal '80' '90' ;}
function comparison-ptrdiff-less-equal-1.3  () {   mmux_ptrdiff_less_equal '70' '80' '90' ;}
function comparison-ptrdiff-less-equal-1.4  () { ! mmux_ptrdiff_less_equal '33' '11' ;}
function comparison-ptrdiff-less-equal-1.5  () { ! mmux_ptrdiff_less_equal '33' '99' '55' ;}
function comparison-ptrdiff-less-equal-1.6  () {   mmux_ptrdiff_less_equal '11' '11' ;}
function comparison-ptrdiff-less-equal-1.7  () {   mmux_ptrdiff_less_equal '-33' '-22' '-22' ;}


#### type variables: off

function comparison-off-equal-1.1         () {   mmux_off_equal '10' ;}
function comparison-off-equal-1.2         () {   mmux_off_equal '10' '10' ;}
function comparison-off-equal-1.3         () {   mmux_off_equal '10' '10' '10' ;}
function comparison-off-equal-1.4         () { ! mmux_off_equal '9' '11' '10' ;}
function comparison-off-equal-1.5         () {   mmux_off_equal '-9' '-9' ;}
function comparison-off-equal-1.6         () { ! mmux_off_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-off-greater-1.1       () {   mmux_off_greater '90' ;}
function comparison-off-greater-1.2       () {   mmux_off_greater '90' '80' ;}
function comparison-off-greater-1.3       () {   mmux_off_greater '90' '80' '70' ;}
function comparison-off-greater-1.4       () { ! mmux_off_greater '11' '33' ;}
function comparison-off-greater-1.5       () { ! mmux_off_greater '99' '33' '55' ;}
function comparison-off-greater-1.6       () { ! mmux_off_greater '11' '11' ;}
function comparison-off-greater-1.7       () {   mmux_off_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-off-less-1.1        ()  {   mmux_off_less '90' ;}
function comparison-off-less-1.2        ()  {   mmux_off_less '80' '90' ;}
function comparison-off-less-1.3        ()  {   mmux_off_less '70' '80' '90' ;}
function comparison-off-less-1.4        ()  { ! mmux_off_less '33' '11' ;}
function comparison-off-less-1.5        ()  { ! mmux_off_less '33' '99' '55' ;}
function comparison-off-less-1.6        ()  { ! mmux_off_less '11' '11' ;}
function comparison-off-less-1.7        ()  { ! mmux_off_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-off-greater-equal-1.1 () {   mmux_off_greater_equal '90' ;}
function comparison-off-greater-equal-1.2 () {   mmux_off_greater_equal '90' '80' ;}
function comparison-off-greater-equal-1.3 () {   mmux_off_greater_equal '90' '80' '70' ;}
function comparison-off-greater-equal-1.4 () { ! mmux_off_greater_equal '11' '33' ;}
function comparison-off-greater-equal-1.5 () { ! mmux_off_greater_equal '99' '33' '55' ;}
function comparison-off-greater-equal-1.6 () {   mmux_off_greater_equal '11' '11' ;}
function comparison-off-greater-equal-1.7 () {   mmux_off_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-off-less-equal-1.1  () {   mmux_off_less_equal '90' ;}
function comparison-off-less-equal-1.2  () {   mmux_off_less_equal '80' '90' ;}
function comparison-off-less-equal-1.3  () {   mmux_off_less_equal '70' '80' '90' ;}
function comparison-off-less-equal-1.4  () { ! mmux_off_less_equal '33' '11' ;}
function comparison-off-less-equal-1.5  () { ! mmux_off_less_equal '33' '99' '55' ;}
function comparison-off-less-equal-1.6  () {   mmux_off_less_equal '11' '11' ;}
function comparison-off-less-equal-1.7  () {   mmux_off_less_equal '-33' '-22' '-22' ;}


#### type variables: mode

function comparison-mode-equal-1.1         () {   mmux_mode_equal '10' ;}
function comparison-mode-equal-1.2         () {   mmux_mode_equal '10' '10' ;}
function comparison-mode-equal-1.3         () {   mmux_mode_equal '10' '10' '10' ;}
function comparison-mode-equal-1.4         () { ! mmux_mode_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-mode-greater-1.1       () {   mmux_mode_greater '90' ;}
function comparison-mode-greater-1.2       () {   mmux_mode_greater '90' '80' ;}
function comparison-mode-greater-1.3       () {   mmux_mode_greater '90' '80' '70' ;}
function comparison-mode-greater-1.4       () { ! mmux_mode_greater '11' '33' ;}
function comparison-mode-greater-1.5       () { ! mmux_mode_greater '99' '33' '55' ;}
function comparison-mode-greater-1.6       () { ! mmux_mode_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-mode-less-1.1        ()  {   mmux_mode_less '90' ;}
function comparison-mode-less-1.2        ()  {   mmux_mode_less '80' '90' ;}
function comparison-mode-less-1.3        ()  {   mmux_mode_less '70' '80' '90' ;}
function comparison-mode-less-1.4        ()  { ! mmux_mode_less '33' '11' ;}
function comparison-mode-less-1.5        ()  { ! mmux_mode_less '33' '99' '55' ;}
function comparison-mode-less-1.6        ()  { ! mmux_mode_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-mode-greater-equal-1.1 () {   mmux_mode_greater_equal '90' ;}
function comparison-mode-greater-equal-1.2 () {   mmux_mode_greater_equal '90' '80' ;}
function comparison-mode-greater-equal-1.3 () {   mmux_mode_greater_equal '90' '80' '70' ;}
function comparison-mode-greater-equal-1.4 () { ! mmux_mode_greater_equal '11' '33' ;}
function comparison-mode-greater-equal-1.5 () { ! mmux_mode_greater_equal '99' '33' '55' ;}
function comparison-mode-greater-equal-1.6 () {   mmux_mode_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-mode-less-equal-1.1  () {   mmux_mode_less_equal '90' ;}
function comparison-mode-less-equal-1.2  () {   mmux_mode_less_equal '80' '90' ;}
function comparison-mode-less-equal-1.3  () {   mmux_mode_less_equal '70' '80' '90' ;}
function comparison-mode-less-equal-1.4  () { ! mmux_mode_less_equal '33' '11' ;}
function comparison-mode-less-equal-1.5  () { ! mmux_mode_less_equal '33' '99' '55' ;}
function comparison-mode-less-equal-1.6  () {   mmux_mode_less_equal '11' '11' ;}


#### type variables: pid

function comparison-pid-equal-1.1         () {   mmux_pid_equal '10' ;}
function comparison-pid-equal-1.2         () {   mmux_pid_equal '10' '10' ;}
function comparison-pid-equal-1.3         () {   mmux_pid_equal '10' '10' '10' ;}
function comparison-pid-equal-1.4         () { ! mmux_pid_equal '9' '11' '10' ;}
function comparison-pid-equal-1.5         () {   mmux_pid_equal '-9' '-9' ;}
function comparison-pid-equal-1.6         () { ! mmux_pid_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-pid-greater-1.1       () {   mmux_pid_greater '90' ;}
function comparison-pid-greater-1.2       () {   mmux_pid_greater '90' '80' ;}
function comparison-pid-greater-1.3       () {   mmux_pid_greater '90' '80' '70' ;}
function comparison-pid-greater-1.4       () { ! mmux_pid_greater '11' '33' ;}
function comparison-pid-greater-1.5       () { ! mmux_pid_greater '99' '33' '55' ;}
function comparison-pid-greater-1.6       () { ! mmux_pid_greater '11' '11' ;}
function comparison-pid-greater-1.7       () {   mmux_pid_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-pid-less-1.1        ()  {   mmux_pid_less '90' ;}
function comparison-pid-less-1.2        ()  {   mmux_pid_less '80' '90' ;}
function comparison-pid-less-1.3        ()  {   mmux_pid_less '70' '80' '90' ;}
function comparison-pid-less-1.4        ()  { ! mmux_pid_less '33' '11' ;}
function comparison-pid-less-1.5        ()  { ! mmux_pid_less '33' '99' '55' ;}
function comparison-pid-less-1.6        ()  { ! mmux_pid_less '11' '11' ;}
function comparison-pid-less-1.7        ()  { ! mmux_pid_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-pid-greater-equal-1.1 () {   mmux_pid_greater_equal '90' ;}
function comparison-pid-greater-equal-1.2 () {   mmux_pid_greater_equal '90' '80' ;}
function comparison-pid-greater-equal-1.3 () {   mmux_pid_greater_equal '90' '80' '70' ;}
function comparison-pid-greater-equal-1.4 () { ! mmux_pid_greater_equal '11' '33' ;}
function comparison-pid-greater-equal-1.5 () { ! mmux_pid_greater_equal '99' '33' '55' ;}
function comparison-pid-greater-equal-1.6 () {   mmux_pid_greater_equal '11' '11' ;}
function comparison-pid-greater-equal-1.7 () {   mmux_pid_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-pid-less-equal-1.1  () {   mmux_pid_less_equal '90' ;}
function comparison-pid-less-equal-1.2  () {   mmux_pid_less_equal '80' '90' ;}
function comparison-pid-less-equal-1.3  () {   mmux_pid_less_equal '70' '80' '90' ;}
function comparison-pid-less-equal-1.4  () { ! mmux_pid_less_equal '33' '11' ;}
function comparison-pid-less-equal-1.5  () { ! mmux_pid_less_equal '33' '99' '55' ;}
function comparison-pid-less-equal-1.6  () {   mmux_pid_less_equal '11' '11' ;}
function comparison-pid-less-equal-1.7  () {   mmux_pid_less_equal '-33' '-22' '-22' ;}


#### type variables: uid

function comparison-uid-equal-1.1         () {   mmux_uid_equal '10' ;}
function comparison-uid-equal-1.2         () {   mmux_uid_equal '10' '10' ;}
function comparison-uid-equal-1.3         () {   mmux_uid_equal '10' '10' '10' ;}
function comparison-uid-equal-1.4         () { ! mmux_uid_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-uid-greater-1.1       () {   mmux_uid_greater '90' ;}
function comparison-uid-greater-1.2       () {   mmux_uid_greater '90' '80' ;}
function comparison-uid-greater-1.3       () {   mmux_uid_greater '90' '80' '70' ;}
function comparison-uid-greater-1.4       () { ! mmux_uid_greater '11' '33' ;}
function comparison-uid-greater-1.5       () { ! mmux_uid_greater '99' '33' '55' ;}
function comparison-uid-greater-1.6       () { ! mmux_uid_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uid-less-1.1        ()  {   mmux_uid_less '90' ;}
function comparison-uid-less-1.2        ()  {   mmux_uid_less '80' '90' ;}
function comparison-uid-less-1.3        ()  {   mmux_uid_less '70' '80' '90' ;}
function comparison-uid-less-1.4        ()  { ! mmux_uid_less '33' '11' ;}
function comparison-uid-less-1.5        ()  { ! mmux_uid_less '33' '99' '55' ;}
function comparison-uid-less-1.6        ()  { ! mmux_uid_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uid-greater-equal-1.1 () {   mmux_uid_greater_equal '90' ;}
function comparison-uid-greater-equal-1.2 () {   mmux_uid_greater_equal '90' '80' ;}
function comparison-uid-greater-equal-1.3 () {   mmux_uid_greater_equal '90' '80' '70' ;}
function comparison-uid-greater-equal-1.4 () { ! mmux_uid_greater_equal '11' '33' ;}
function comparison-uid-greater-equal-1.5 () { ! mmux_uid_greater_equal '99' '33' '55' ;}
function comparison-uid-greater-equal-1.6 () {   mmux_uid_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uid-less-equal-1.1  () {   mmux_uid_less_equal '90' ;}
function comparison-uid-less-equal-1.2  () {   mmux_uid_less_equal '80' '90' ;}
function comparison-uid-less-equal-1.3  () {   mmux_uid_less_equal '70' '80' '90' ;}
function comparison-uid-less-equal-1.4  () { ! mmux_uid_less_equal '33' '11' ;}
function comparison-uid-less-equal-1.5  () { ! mmux_uid_less_equal '33' '99' '55' ;}
function comparison-uid-less-equal-1.6  () {   mmux_uid_less_equal '11' '11' ;}


#### type variables: gid

function comparison-gid-equal-1.1         () {   mmux_gid_equal '10' ;}
function comparison-gid-equal-1.2         () {   mmux_gid_equal '10' '10' ;}
function comparison-gid-equal-1.3         () {   mmux_gid_equal '10' '10' '10' ;}
function comparison-gid-equal-1.4         () { ! mmux_gid_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-gid-greater-1.1       () {   mmux_gid_greater '90' ;}
function comparison-gid-greater-1.2       () {   mmux_gid_greater '90' '80' ;}
function comparison-gid-greater-1.3       () {   mmux_gid_greater '90' '80' '70' ;}
function comparison-gid-greater-1.4       () { ! mmux_gid_greater '11' '33' ;}
function comparison-gid-greater-1.5       () { ! mmux_gid_greater '99' '33' '55' ;}
function comparison-gid-greater-1.6       () { ! mmux_gid_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-gid-less-1.1        ()  {   mmux_gid_less '90' ;}
function comparison-gid-less-1.2        ()  {   mmux_gid_less '80' '90' ;}
function comparison-gid-less-1.3        ()  {   mmux_gid_less '70' '80' '90' ;}
function comparison-gid-less-1.4        ()  { ! mmux_gid_less '33' '11' ;}
function comparison-gid-less-1.5        ()  { ! mmux_gid_less '33' '99' '55' ;}
function comparison-gid-less-1.6        ()  { ! mmux_gid_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-gid-greater-equal-1.1 () {   mmux_gid_greater_equal '90' ;}
function comparison-gid-greater-equal-1.2 () {   mmux_gid_greater_equal '90' '80' ;}
function comparison-gid-greater-equal-1.3 () {   mmux_gid_greater_equal '90' '80' '70' ;}
function comparison-gid-greater-equal-1.4 () { ! mmux_gid_greater_equal '11' '33' ;}
function comparison-gid-greater-equal-1.5 () { ! mmux_gid_greater_equal '99' '33' '55' ;}
function comparison-gid-greater-equal-1.6 () {   mmux_gid_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-gid-less-equal-1.1  () {   mmux_gid_less_equal '90' ;}
function comparison-gid-less-equal-1.2  () {   mmux_gid_less_equal '80' '90' ;}
function comparison-gid-less-equal-1.3  () {   mmux_gid_less_equal '70' '80' '90' ;}
function comparison-gid-less-equal-1.4  () { ! mmux_gid_less_equal '33' '11' ;}
function comparison-gid-less-equal-1.5  () { ! mmux_gid_less_equal '33' '99' '55' ;}
function comparison-gid-less-equal-1.6  () {   mmux_gid_less_equal '11' '11' ;}


#### type variables: wchar

function comparison-wchar-equal-1.1         () {   mmux_wchar_equal '10' ;}
function comparison-wchar-equal-1.2         () {   mmux_wchar_equal '10' '10' ;}
function comparison-wchar-equal-1.3         () {   mmux_wchar_equal '10' '10' '10' ;}
function comparison-wchar-equal-1.4         () { ! mmux_wchar_equal '9' '11' '10' ;}
function comparison-wchar-equal-1.5         () {   mmux_wchar_equal '-9' '-9' ;}
function comparison-wchar-equal-1.6         () { ! mmux_wchar_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-wchar-greater-1.1       () {   mmux_wchar_greater '90' ;}
function comparison-wchar-greater-1.2       () {   mmux_wchar_greater '90' '80' ;}
function comparison-wchar-greater-1.3       () {   mmux_wchar_greater '90' '80' '70' ;}
function comparison-wchar-greater-1.4       () { ! mmux_wchar_greater '11' '33' ;}
function comparison-wchar-greater-1.5       () { ! mmux_wchar_greater '99' '33' '55' ;}
function comparison-wchar-greater-1.6       () { ! mmux_wchar_greater '11' '11' ;}
function comparison-wchar-greater-1.7       () {   mmux_wchar_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-wchar-less-1.1        ()  {   mmux_wchar_less '90' ;}
function comparison-wchar-less-1.2        ()  {   mmux_wchar_less '80' '90' ;}
function comparison-wchar-less-1.3        ()  {   mmux_wchar_less '70' '80' '90' ;}
function comparison-wchar-less-1.4        ()  { ! mmux_wchar_less '33' '11' ;}
function comparison-wchar-less-1.5        ()  { ! mmux_wchar_less '33' '99' '55' ;}
function comparison-wchar-less-1.6        ()  { ! mmux_wchar_less '11' '11' ;}
function comparison-wchar-less-1.7        ()  { ! mmux_wchar_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-wchar-greater-equal-1.1 () {   mmux_wchar_greater_equal '90' ;}
function comparison-wchar-greater-equal-1.2 () {   mmux_wchar_greater_equal '90' '80' ;}
function comparison-wchar-greater-equal-1.3 () {   mmux_wchar_greater_equal '90' '80' '70' ;}
function comparison-wchar-greater-equal-1.4 () { ! mmux_wchar_greater_equal '11' '33' ;}
function comparison-wchar-greater-equal-1.5 () { ! mmux_wchar_greater_equal '99' '33' '55' ;}
function comparison-wchar-greater-equal-1.6 () {   mmux_wchar_greater_equal '11' '11' ;}
function comparison-wchar-greater-equal-1.7 () {   mmux_wchar_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-wchar-less-equal-1.1  () {   mmux_wchar_less_equal '90' ;}
function comparison-wchar-less-equal-1.2  () {   mmux_wchar_less_equal '80' '90' ;}
function comparison-wchar-less-equal-1.3  () {   mmux_wchar_less_equal '70' '80' '90' ;}
function comparison-wchar-less-equal-1.4  () { ! mmux_wchar_less_equal '33' '11' ;}
function comparison-wchar-less-equal-1.5  () { ! mmux_wchar_less_equal '33' '99' '55' ;}
function comparison-wchar-less-equal-1.6  () {   mmux_wchar_less_equal '11' '11' ;}
function comparison-wchar-less-equal-1.7  () {   mmux_wchar_less_equal '-33' '-22' '-22' ;}


#### type variables: wint

function comparison-wint-equal-1.1         () {   mmux_wint_equal '10' ;}
function comparison-wint-equal-1.2         () {   mmux_wint_equal '10' '10' ;}
function comparison-wint-equal-1.3         () {   mmux_wint_equal '10' '10' '10' ;}
function comparison-wint-equal-1.4         () { ! mmux_wint_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-wint-greater-1.1       () {   mmux_wint_greater '90' ;}
function comparison-wint-greater-1.2       () {   mmux_wint_greater '90' '80' ;}
function comparison-wint-greater-1.3       () {   mmux_wint_greater '90' '80' '70' ;}
function comparison-wint-greater-1.4       () { ! mmux_wint_greater '11' '33' ;}
function comparison-wint-greater-1.5       () { ! mmux_wint_greater '99' '33' '55' ;}
function comparison-wint-greater-1.6       () { ! mmux_wint_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-wint-less-1.1        ()  {   mmux_wint_less '90' ;}
function comparison-wint-less-1.2        ()  {   mmux_wint_less '80' '90' ;}
function comparison-wint-less-1.3        ()  {   mmux_wint_less '70' '80' '90' ;}
function comparison-wint-less-1.4        ()  { ! mmux_wint_less '33' '11' ;}
function comparison-wint-less-1.5        ()  { ! mmux_wint_less '33' '99' '55' ;}
function comparison-wint-less-1.6        ()  { ! mmux_wint_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-wint-greater-equal-1.1 () {   mmux_wint_greater_equal '90' ;}
function comparison-wint-greater-equal-1.2 () {   mmux_wint_greater_equal '90' '80' ;}
function comparison-wint-greater-equal-1.3 () {   mmux_wint_greater_equal '90' '80' '70' ;}
function comparison-wint-greater-equal-1.4 () { ! mmux_wint_greater_equal '11' '33' ;}
function comparison-wint-greater-equal-1.5 () { ! mmux_wint_greater_equal '99' '33' '55' ;}
function comparison-wint-greater-equal-1.6 () {   mmux_wint_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-wint-less-equal-1.1  () {   mmux_wint_less_equal '90' ;}
function comparison-wint-less-equal-1.2  () {   mmux_wint_less_equal '80' '90' ;}
function comparison-wint-less-equal-1.3  () {   mmux_wint_less_equal '70' '80' '90' ;}
function comparison-wint-less-equal-1.4  () { ! mmux_wint_less_equal '33' '11' ;}
function comparison-wint-less-equal-1.5  () { ! mmux_wint_less_equal '33' '99' '55' ;}
function comparison-wint-less-equal-1.6  () {   mmux_wint_less_equal '11' '11' ;}


#### type variables: time

function comparison-time-equal-1.1         () {   mmux_time_equal '10' ;}
function comparison-time-equal-1.2         () {   mmux_time_equal '10' '10' ;}
function comparison-time-equal-1.3         () {   mmux_time_equal '10' '10' '10' ;}
function comparison-time-equal-1.4         () { ! mmux_time_equal '9' '11' '10' ;}
function comparison-time-equal-1.5         () {   mmux_time_equal '-9' '-9' ;}
function comparison-time-equal-1.6         () { ! mmux_time_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-time-greater-1.1       () {   mmux_time_greater '90' ;}
function comparison-time-greater-1.2       () {   mmux_time_greater '90' '80' ;}
function comparison-time-greater-1.3       () {   mmux_time_greater '90' '80' '70' ;}
function comparison-time-greater-1.4       () { ! mmux_time_greater '11' '33' ;}
function comparison-time-greater-1.5       () { ! mmux_time_greater '99' '33' '55' ;}
function comparison-time-greater-1.6       () { ! mmux_time_greater '11' '11' ;}
function comparison-time-greater-1.7       () {   mmux_time_greater '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-time-less-1.1        ()  {   mmux_time_less '90' ;}
function comparison-time-less-1.2        ()  {   mmux_time_less '80' '90' ;}
function comparison-time-less-1.3        ()  {   mmux_time_less '70' '80' '90' ;}
function comparison-time-less-1.4        ()  { ! mmux_time_less '33' '11' ;}
function comparison-time-less-1.5        ()  { ! mmux_time_less '33' '99' '55' ;}
function comparison-time-less-1.6        ()  { ! mmux_time_less '11' '11' ;}
function comparison-time-less-1.7        ()  { ! mmux_time_less '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-time-greater-equal-1.1 () {   mmux_time_greater_equal '90' ;}
function comparison-time-greater-equal-1.2 () {   mmux_time_greater_equal '90' '80' ;}
function comparison-time-greater-equal-1.3 () {   mmux_time_greater_equal '90' '80' '70' ;}
function comparison-time-greater-equal-1.4 () { ! mmux_time_greater_equal '11' '33' ;}
function comparison-time-greater-equal-1.5 () { ! mmux_time_greater_equal '99' '33' '55' ;}
function comparison-time-greater-equal-1.6 () {   mmux_time_greater_equal '11' '11' ;}
function comparison-time-greater-equal-1.7 () {   mmux_time_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-time-less-equal-1.1  () {   mmux_time_less_equal '90' ;}
function comparison-time-less-equal-1.2  () {   mmux_time_less_equal '80' '90' ;}
function comparison-time-less-equal-1.3  () {   mmux_time_less_equal '70' '80' '90' ;}
function comparison-time-less-equal-1.4  () { ! mmux_time_less_equal '33' '11' ;}
function comparison-time-less-equal-1.5  () { ! mmux_time_less_equal '33' '99' '55' ;}
function comparison-time-less-equal-1.6  () {   mmux_time_less_equal '11' '11' ;}
function comparison-time-less-equal-1.7  () {   mmux_time_less_equal '-33' '-22' '-22' ;}


#### type variables: socklen

function comparison-socklen-equal-1.1         () {   mmux_socklen_equal '10' ;}
function comparison-socklen-equal-1.2         () {   mmux_socklen_equal '10' '10' ;}
function comparison-socklen-equal-1.3         () {   mmux_socklen_equal '10' '10' '10' ;}
function comparison-socklen-equal-1.4         () { ! mmux_socklen_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-socklen-greater-1.1       () {   mmux_socklen_greater '90' ;}
function comparison-socklen-greater-1.2       () {   mmux_socklen_greater '90' '80' ;}
function comparison-socklen-greater-1.3       () {   mmux_socklen_greater '90' '80' '70' ;}
function comparison-socklen-greater-1.4       () { ! mmux_socklen_greater '11' '33' ;}
function comparison-socklen-greater-1.5       () { ! mmux_socklen_greater '99' '33' '55' ;}
function comparison-socklen-greater-1.6       () { ! mmux_socklen_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-socklen-less-1.1        ()  {   mmux_socklen_less '90' ;}
function comparison-socklen-less-1.2        ()  {   mmux_socklen_less '80' '90' ;}
function comparison-socklen-less-1.3        ()  {   mmux_socklen_less '70' '80' '90' ;}
function comparison-socklen-less-1.4        ()  { ! mmux_socklen_less '33' '11' ;}
function comparison-socklen-less-1.5        ()  { ! mmux_socklen_less '33' '99' '55' ;}
function comparison-socklen-less-1.6        ()  { ! mmux_socklen_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-socklen-greater-equal-1.1 () {   mmux_socklen_greater_equal '90' ;}
function comparison-socklen-greater-equal-1.2 () {   mmux_socklen_greater_equal '90' '80' ;}
function comparison-socklen-greater-equal-1.3 () {   mmux_socklen_greater_equal '90' '80' '70' ;}
function comparison-socklen-greater-equal-1.4 () { ! mmux_socklen_greater_equal '11' '33' ;}
function comparison-socklen-greater-equal-1.5 () { ! mmux_socklen_greater_equal '99' '33' '55' ;}
function comparison-socklen-greater-equal-1.6 () {   mmux_socklen_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-socklen-less-equal-1.1  () {   mmux_socklen_less_equal '90' ;}
function comparison-socklen-less-equal-1.2  () {   mmux_socklen_less_equal '80' '90' ;}
function comparison-socklen-less-equal-1.3  () {   mmux_socklen_less_equal '70' '80' '90' ;}
function comparison-socklen-less-equal-1.4  () { ! mmux_socklen_less_equal '33' '11' ;}
function comparison-socklen-less-equal-1.5  () { ! mmux_socklen_less_equal '33' '99' '55' ;}
function comparison-socklen-less-equal-1.6  () {   mmux_socklen_less_equal '11' '11' ;}


#### type variables: rlim

function comparison-rlim-equal-1.1         () {   mmux_rlim_equal '10' ;}
function comparison-rlim-equal-1.2         () {   mmux_rlim_equal '10' '10' ;}
function comparison-rlim-equal-1.3         () {   mmux_rlim_equal '10' '10' '10' ;}
function comparison-rlim-equal-1.4         () { ! mmux_rlim_equal '9' '11' '10' ;}

### ------------------------------------------------------------------------

function comparison-rlim-greater-1.1       () {   mmux_rlim_greater '90' ;}
function comparison-rlim-greater-1.2       () {   mmux_rlim_greater '90' '80' ;}
function comparison-rlim-greater-1.3       () {   mmux_rlim_greater '90' '80' '70' ;}
function comparison-rlim-greater-1.4       () { ! mmux_rlim_greater '11' '33' ;}
function comparison-rlim-greater-1.5       () { ! mmux_rlim_greater '99' '33' '55' ;}
function comparison-rlim-greater-1.6       () { ! mmux_rlim_greater '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-rlim-less-1.1        ()  {   mmux_rlim_less '90' ;}
function comparison-rlim-less-1.2        ()  {   mmux_rlim_less '80' '90' ;}
function comparison-rlim-less-1.3        ()  {   mmux_rlim_less '70' '80' '90' ;}
function comparison-rlim-less-1.4        ()  { ! mmux_rlim_less '33' '11' ;}
function comparison-rlim-less-1.5        ()  { ! mmux_rlim_less '33' '99' '55' ;}
function comparison-rlim-less-1.6        ()  { ! mmux_rlim_less '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-rlim-greater-equal-1.1 () {   mmux_rlim_greater_equal '90' ;}
function comparison-rlim-greater-equal-1.2 () {   mmux_rlim_greater_equal '90' '80' ;}
function comparison-rlim-greater-equal-1.3 () {   mmux_rlim_greater_equal '90' '80' '70' ;}
function comparison-rlim-greater-equal-1.4 () { ! mmux_rlim_greater_equal '11' '33' ;}
function comparison-rlim-greater-equal-1.5 () { ! mmux_rlim_greater_equal '99' '33' '55' ;}
function comparison-rlim-greater-equal-1.6 () {   mmux_rlim_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-rlim-less-equal-1.1  () {   mmux_rlim_less_equal '90' ;}
function comparison-rlim-less-equal-1.2  () {   mmux_rlim_less_equal '80' '90' ;}
function comparison-rlim-less-equal-1.3  () {   mmux_rlim_less_equal '70' '80' '90' ;}
function comparison-rlim-less-equal-1.4  () { ! mmux_rlim_less_equal '33' '11' ;}
function comparison-rlim-less-equal-1.5  () { ! mmux_rlim_less_equal '33' '99' '55' ;}
function comparison-rlim-less-equal-1.6  () {   mmux_rlim_less_equal '11' '11' ;}


#### type variables: float

function comparison-float-equal-1.1         () {   mmux_float_equal '1.0' ;}
function comparison-float-equal-1.2         () {   mmux_float_equal '1.0' '1.0' ;}
function comparison-float-equal-1.3         () {   mmux_float_equal '1.0' '1.0' '1.0' ;}
function comparison-float-equal-1.4         () { ! mmux_float_equal '9' '1.1' '1.0' ;}
function comparison-float-equal-1.5         () {   mmux_float_equal '-9' '-9' ;}
function comparison-float-equal-1.6         () { ! mmux_float_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float-greater-1.1       () {   mmux_float_greater '9.0' ;}
function comparison-float-greater-1.2       () {   mmux_float_greater '9.0' '8.0' ;}
function comparison-float-greater-1.3       () {   mmux_float_greater '9.0' '8.0' '7.0' ;}
function comparison-float-greater-1.4       () { ! mmux_float_greater '1.1' '3.3' ;}
function comparison-float-greater-1.5       () { ! mmux_float_greater '9.9' '3.3' '5.5' ;}
function comparison-float-greater-1.6       () { ! mmux_float_greater '1.1' '1.1' ;}
function comparison-float-greater-1.7       () {   mmux_float_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float-less-1.1        ()  {   mmux_float_less '9.0' ;}
function comparison-float-less-1.2        ()  {   mmux_float_less '8.0' '9.0' ;}
function comparison-float-less-1.3        ()  {   mmux_float_less '7.0' '8.0' '9.0' ;}
function comparison-float-less-1.4        ()  { ! mmux_float_less '3.3' '1.1' ;}
function comparison-float-less-1.5        ()  { ! mmux_float_less '3.3' '9.9' '5.5' ;}
function comparison-float-less-1.6        ()  { ! mmux_float_less '1.1' '1.1' ;}
function comparison-float-less-1.7        ()  { ! mmux_float_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float-greater-equal-1.1 () {   mmux_float_greater_equal '9.0' ;}
function comparison-float-greater-equal-1.2 () {   mmux_float_greater_equal '9.0' '8.0' ;}
function comparison-float-greater-equal-1.3 () {   mmux_float_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float-greater-equal-1.4 () { ! mmux_float_greater_equal '1.1' '3.3' ;}
function comparison-float-greater-equal-1.5 () { ! mmux_float_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float-greater-equal-1.6 () {   mmux_float_greater_equal '1.1' '1.1' ;}
function comparison-float-greater-equal-1.7 () {   mmux_float_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float-less-equal-1.1  () {   mmux_float_less_equal '9.0' ;}
function comparison-float-less-equal-1.2  () {   mmux_float_less_equal '8.0' '9.0' ;}
function comparison-float-less-equal-1.3  () {   mmux_float_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float-less-equal-1.4  () { ! mmux_float_less_equal '3.3' '1.1' ;}
function comparison-float-less-equal-1.5  () { ! mmux_float_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float-less-equal-1.6  () {   mmux_float_less_equal '1.1' '1.1' ;}
function comparison-float-less-equal-1.7  () {   mmux_float_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float-equal-absmargin-1.1   () {   mmux_float_equal_absmargin '1.0' ;}
function comparison-float-equal-absmargin-1.2   () {   mmux_float_equal_absmargin '1.0' '1.0' ;}
function comparison-float-equal-absmargin-1.3   () {   mmux_float_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float-equal-absmargin-1.4   () { ! mmux_float_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float-equal-absmargin-1.5   () {   mmux_float_equal_absmargin '-9' '-9' ;}
function comparison-float-equal-absmargin-1.6   () { ! mmux_float_equal_absmargin '-9' '-4' ;}

function comparison-float-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT='0.1'
    mmux_float_equal_absmargin '1.0' '1.02'
}
function comparison-float-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT='0.1'
    ! mmux_float_equal_absmargin '1.0' '1.3'
}
function comparison-float-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT='1.0'
    ! mmux_float_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float-equal-relepsilon-1.1   () {   mmux_float_equal_relepsilon '1.0' ;}
function comparison-float-equal-relepsilon-1.2   () {   mmux_float_equal_relepsilon '1.0' '1.0' ;}
function comparison-float-equal-relepsilon-1.3   () {   mmux_float_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float-equal-relepsilon-1.4   () { ! mmux_float_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float-equal-relepsilon-1.5   () {   mmux_float_equal_relepsilon '-9' '-9' ;}
function comparison-float-equal-relepsilon-1.6   () { ! mmux_float_equal_relepsilon '-9' '-4' ;}

function comparison-float-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT='0.1'
    mmux_float_equal_relepsilon '1.0' '1.02'
}
function comparison-float-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT='0.1'
    ! mmux_float_equal_relepsilon '1.0' '1.3'
}
function comparison-float-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT='0.1'
    ! mmux_float_equal_relepsilon '1.0' '3.0'
}


#### type variables: double

function comparison-double-equal-1.1         () {   mmux_double_equal '1.0' ;}
function comparison-double-equal-1.2         () {   mmux_double_equal '1.0' '1.0' ;}
function comparison-double-equal-1.3         () {   mmux_double_equal '1.0' '1.0' '1.0' ;}
function comparison-double-equal-1.4         () { ! mmux_double_equal '9' '1.1' '1.0' ;}
function comparison-double-equal-1.5         () {   mmux_double_equal '-9' '-9' ;}
function comparison-double-equal-1.6         () { ! mmux_double_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-double-greater-1.1       () {   mmux_double_greater '9.0' ;}
function comparison-double-greater-1.2       () {   mmux_double_greater '9.0' '8.0' ;}
function comparison-double-greater-1.3       () {   mmux_double_greater '9.0' '8.0' '7.0' ;}
function comparison-double-greater-1.4       () { ! mmux_double_greater '1.1' '3.3' ;}
function comparison-double-greater-1.5       () { ! mmux_double_greater '9.9' '3.3' '5.5' ;}
function comparison-double-greater-1.6       () { ! mmux_double_greater '1.1' '1.1' ;}
function comparison-double-greater-1.7       () {   mmux_double_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-double-less-1.1        ()  {   mmux_double_less '9.0' ;}
function comparison-double-less-1.2        ()  {   mmux_double_less '8.0' '9.0' ;}
function comparison-double-less-1.3        ()  {   mmux_double_less '7.0' '8.0' '9.0' ;}
function comparison-double-less-1.4        ()  { ! mmux_double_less '3.3' '1.1' ;}
function comparison-double-less-1.5        ()  { ! mmux_double_less '3.3' '9.9' '5.5' ;}
function comparison-double-less-1.6        ()  { ! mmux_double_less '1.1' '1.1' ;}
function comparison-double-less-1.7        ()  { ! mmux_double_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-double-greater-equal-1.1 () {   mmux_double_greater_equal '9.0' ;}
function comparison-double-greater-equal-1.2 () {   mmux_double_greater_equal '9.0' '8.0' ;}
function comparison-double-greater-equal-1.3 () {   mmux_double_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-double-greater-equal-1.4 () { ! mmux_double_greater_equal '1.1' '3.3' ;}
function comparison-double-greater-equal-1.5 () { ! mmux_double_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-double-greater-equal-1.6 () {   mmux_double_greater_equal '1.1' '1.1' ;}
function comparison-double-greater-equal-1.7 () {   mmux_double_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-double-less-equal-1.1  () {   mmux_double_less_equal '9.0' ;}
function comparison-double-less-equal-1.2  () {   mmux_double_less_equal '8.0' '9.0' ;}
function comparison-double-less-equal-1.3  () {   mmux_double_less_equal '7.0' '8.0' '9.0' ;}
function comparison-double-less-equal-1.4  () { ! mmux_double_less_equal '3.3' '1.1' ;}
function comparison-double-less-equal-1.5  () { ! mmux_double_less_equal '3.3' '9.9' '5.5' ;}
function comparison-double-less-equal-1.6  () {   mmux_double_less_equal '1.1' '1.1' ;}
function comparison-double-less-equal-1.7  () {   mmux_double_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-double-equal-absmargin-1.1   () {   mmux_double_equal_absmargin '1.0' ;}
function comparison-double-equal-absmargin-1.2   () {   mmux_double_equal_absmargin '1.0' '1.0' ;}
function comparison-double-equal-absmargin-1.3   () {   mmux_double_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-double-equal-absmargin-1.4   () { ! mmux_double_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-double-equal-absmargin-1.5   () {   mmux_double_equal_absmargin '-9' '-9' ;}
function comparison-double-equal-absmargin-1.6   () { ! mmux_double_equal_absmargin '-9' '-4' ;}

function comparison-double-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_DOUBLE='0.1'
    mmux_double_equal_absmargin '1.0' '1.02'
}
function comparison-double-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_DOUBLE='0.1'
    ! mmux_double_equal_absmargin '1.0' '1.3'
}
function comparison-double-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_DOUBLE='1.0'
    ! mmux_double_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-double-equal-relepsilon-1.1   () {   mmux_double_equal_relepsilon '1.0' ;}
function comparison-double-equal-relepsilon-1.2   () {   mmux_double_equal_relepsilon '1.0' '1.0' ;}
function comparison-double-equal-relepsilon-1.3   () {   mmux_double_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-double-equal-relepsilon-1.4   () { ! mmux_double_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-double-equal-relepsilon-1.5   () {   mmux_double_equal_relepsilon '-9' '-9' ;}
function comparison-double-equal-relepsilon-1.6   () { ! mmux_double_equal_relepsilon '-9' '-4' ;}

function comparison-double-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_DOUBLE='0.1'
    mmux_double_equal_relepsilon '1.0' '1.02'
}
function comparison-double-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_DOUBLE='0.1'
    ! mmux_double_equal_relepsilon '1.0' '1.3'
}
function comparison-double-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_DOUBLE='0.1'
    ! mmux_double_equal_relepsilon '1.0' '3.0'
}


#### type variables: ldouble

if test -v mmux_ldouble_SIZEOF
then

function comparison-ldouble-equal-1.1         () {   mmux_ldouble_equal '1.0' ;}
function comparison-ldouble-equal-1.2         () {   mmux_ldouble_equal '1.0' '1.0' ;}
function comparison-ldouble-equal-1.3         () {   mmux_ldouble_equal '1.0' '1.0' '1.0' ;}
function comparison-ldouble-equal-1.4         () { ! mmux_ldouble_equal '9' '1.1' '1.0' ;}
function comparison-ldouble-equal-1.5         () {   mmux_ldouble_equal '-9' '-9' ;}
function comparison-ldouble-equal-1.6         () { ! mmux_ldouble_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-greater-1.1       () {   mmux_ldouble_greater '9.0' ;}
function comparison-ldouble-greater-1.2       () {   mmux_ldouble_greater '9.0' '8.0' ;}
function comparison-ldouble-greater-1.3       () {   mmux_ldouble_greater '9.0' '8.0' '7.0' ;}
function comparison-ldouble-greater-1.4       () { ! mmux_ldouble_greater '1.1' '3.3' ;}
function comparison-ldouble-greater-1.5       () { ! mmux_ldouble_greater '9.9' '3.3' '5.5' ;}
function comparison-ldouble-greater-1.6       () { ! mmux_ldouble_greater '1.1' '1.1' ;}
function comparison-ldouble-greater-1.7       () {   mmux_ldouble_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-less-1.1        ()  {   mmux_ldouble_less '9.0' ;}
function comparison-ldouble-less-1.2        ()  {   mmux_ldouble_less '8.0' '9.0' ;}
function comparison-ldouble-less-1.3        ()  {   mmux_ldouble_less '7.0' '8.0' '9.0' ;}
function comparison-ldouble-less-1.4        ()  { ! mmux_ldouble_less '3.3' '1.1' ;}
function comparison-ldouble-less-1.5        ()  { ! mmux_ldouble_less '3.3' '9.9' '5.5' ;}
function comparison-ldouble-less-1.6        ()  { ! mmux_ldouble_less '1.1' '1.1' ;}
function comparison-ldouble-less-1.7        ()  { ! mmux_ldouble_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-greater-equal-1.1 () {   mmux_ldouble_greater_equal '9.0' ;}
function comparison-ldouble-greater-equal-1.2 () {   mmux_ldouble_greater_equal '9.0' '8.0' ;}
function comparison-ldouble-greater-equal-1.3 () {   mmux_ldouble_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-ldouble-greater-equal-1.4 () { ! mmux_ldouble_greater_equal '1.1' '3.3' ;}
function comparison-ldouble-greater-equal-1.5 () { ! mmux_ldouble_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-ldouble-greater-equal-1.6 () {   mmux_ldouble_greater_equal '1.1' '1.1' ;}
function comparison-ldouble-greater-equal-1.7 () {   mmux_ldouble_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-less-equal-1.1  () {   mmux_ldouble_less_equal '9.0' ;}
function comparison-ldouble-less-equal-1.2  () {   mmux_ldouble_less_equal '8.0' '9.0' ;}
function comparison-ldouble-less-equal-1.3  () {   mmux_ldouble_less_equal '7.0' '8.0' '9.0' ;}
function comparison-ldouble-less-equal-1.4  () { ! mmux_ldouble_less_equal '3.3' '1.1' ;}
function comparison-ldouble-less-equal-1.5  () { ! mmux_ldouble_less_equal '3.3' '9.9' '5.5' ;}
function comparison-ldouble-less-equal-1.6  () {   mmux_ldouble_less_equal '1.1' '1.1' ;}
function comparison-ldouble-less-equal-1.7  () {   mmux_ldouble_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-equal-absmargin-1.1   () {   mmux_ldouble_equal_absmargin '1.0' ;}
function comparison-ldouble-equal-absmargin-1.2   () {   mmux_ldouble_equal_absmargin '1.0' '1.0' ;}
function comparison-ldouble-equal-absmargin-1.3   () {   mmux_ldouble_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-ldouble-equal-absmargin-1.4   () { ! mmux_ldouble_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-ldouble-equal-absmargin-1.5   () {   mmux_ldouble_equal_absmargin '-9' '-9' ;}
function comparison-ldouble-equal-absmargin-1.6   () { ! mmux_ldouble_equal_absmargin '-9' '-4' ;}

function comparison-ldouble-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_LDOUBLE='0.1'
    mmux_ldouble_equal_absmargin '1.0' '1.02'
}
function comparison-ldouble-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_LDOUBLE='0.1'
    ! mmux_ldouble_equal_absmargin '1.0' '1.3'
}
function comparison-ldouble-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_LDOUBLE='1.0'
    ! mmux_ldouble_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-ldouble-equal-relepsilon-1.1   () {   mmux_ldouble_equal_relepsilon '1.0' ;}
function comparison-ldouble-equal-relepsilon-1.2   () {   mmux_ldouble_equal_relepsilon '1.0' '1.0' ;}
function comparison-ldouble-equal-relepsilon-1.3   () {   mmux_ldouble_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-ldouble-equal-relepsilon-1.4   () { ! mmux_ldouble_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-ldouble-equal-relepsilon-1.5   () {   mmux_ldouble_equal_relepsilon '-9' '-9' ;}
function comparison-ldouble-equal-relepsilon-1.6   () { ! mmux_ldouble_equal_relepsilon '-9' '-4' ;}

function comparison-ldouble-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_LDOUBLE='0.1'
    mmux_ldouble_equal_relepsilon '1.0' '1.02'
}
function comparison-ldouble-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_LDOUBLE='0.1'
    ! mmux_ldouble_equal_relepsilon '1.0' '1.3'
}
function comparison-ldouble-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_LDOUBLE='0.1'
    ! mmux_ldouble_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float32

if test -v mmux_float32_SIZEOF
then

function comparison-float32-equal-1.1         () {   mmux_float32_equal '1.0' ;}
function comparison-float32-equal-1.2         () {   mmux_float32_equal '1.0' '1.0' ;}
function comparison-float32-equal-1.3         () {   mmux_float32_equal '1.0' '1.0' '1.0' ;}
function comparison-float32-equal-1.4         () { ! mmux_float32_equal '9' '1.1' '1.0' ;}
function comparison-float32-equal-1.5         () {   mmux_float32_equal '-9' '-9' ;}
function comparison-float32-equal-1.6         () { ! mmux_float32_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float32-greater-1.1       () {   mmux_float32_greater '9.0' ;}
function comparison-float32-greater-1.2       () {   mmux_float32_greater '9.0' '8.0' ;}
function comparison-float32-greater-1.3       () {   mmux_float32_greater '9.0' '8.0' '7.0' ;}
function comparison-float32-greater-1.4       () { ! mmux_float32_greater '1.1' '3.3' ;}
function comparison-float32-greater-1.5       () { ! mmux_float32_greater '9.9' '3.3' '5.5' ;}
function comparison-float32-greater-1.6       () { ! mmux_float32_greater '1.1' '1.1' ;}
function comparison-float32-greater-1.7       () {   mmux_float32_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32-less-1.1        ()  {   mmux_float32_less '9.0' ;}
function comparison-float32-less-1.2        ()  {   mmux_float32_less '8.0' '9.0' ;}
function comparison-float32-less-1.3        ()  {   mmux_float32_less '7.0' '8.0' '9.0' ;}
function comparison-float32-less-1.4        ()  { ! mmux_float32_less '3.3' '1.1' ;}
function comparison-float32-less-1.5        ()  { ! mmux_float32_less '3.3' '9.9' '5.5' ;}
function comparison-float32-less-1.6        ()  { ! mmux_float32_less '1.1' '1.1' ;}
function comparison-float32-less-1.7        ()  { ! mmux_float32_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32-greater-equal-1.1 () {   mmux_float32_greater_equal '9.0' ;}
function comparison-float32-greater-equal-1.2 () {   mmux_float32_greater_equal '9.0' '8.0' ;}
function comparison-float32-greater-equal-1.3 () {   mmux_float32_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float32-greater-equal-1.4 () { ! mmux_float32_greater_equal '1.1' '3.3' ;}
function comparison-float32-greater-equal-1.5 () { ! mmux_float32_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float32-greater-equal-1.6 () {   mmux_float32_greater_equal '1.1' '1.1' ;}
function comparison-float32-greater-equal-1.7 () {   mmux_float32_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float32-less-equal-1.1  () {   mmux_float32_less_equal '9.0' ;}
function comparison-float32-less-equal-1.2  () {   mmux_float32_less_equal '8.0' '9.0' ;}
function comparison-float32-less-equal-1.3  () {   mmux_float32_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float32-less-equal-1.4  () { ! mmux_float32_less_equal '3.3' '1.1' ;}
function comparison-float32-less-equal-1.5  () { ! mmux_float32_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float32-less-equal-1.6  () {   mmux_float32_less_equal '1.1' '1.1' ;}
function comparison-float32-less-equal-1.7  () {   mmux_float32_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32-equal-absmargin-1.1   () {   mmux_float32_equal_absmargin '1.0' ;}
function comparison-float32-equal-absmargin-1.2   () {   mmux_float32_equal_absmargin '1.0' '1.0' ;}
function comparison-float32-equal-absmargin-1.3   () {   mmux_float32_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float32-equal-absmargin-1.4   () { ! mmux_float32_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float32-equal-absmargin-1.5   () {   mmux_float32_equal_absmargin '-9' '-9' ;}
function comparison-float32-equal-absmargin-1.6   () { ! mmux_float32_equal_absmargin '-9' '-4' ;}

function comparison-float32-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32='0.1'
    mmux_float32_equal_absmargin '1.0' '1.02'
}
function comparison-float32-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32='0.1'
    ! mmux_float32_equal_absmargin '1.0' '1.3'
}
function comparison-float32-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32='1.0'
    ! mmux_float32_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float32-equal-relepsilon-1.1   () {   mmux_float32_equal_relepsilon '1.0' ;}
function comparison-float32-equal-relepsilon-1.2   () {   mmux_float32_equal_relepsilon '1.0' '1.0' ;}
function comparison-float32-equal-relepsilon-1.3   () {   mmux_float32_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float32-equal-relepsilon-1.4   () { ! mmux_float32_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float32-equal-relepsilon-1.5   () {   mmux_float32_equal_relepsilon '-9' '-9' ;}
function comparison-float32-equal-relepsilon-1.6   () { ! mmux_float32_equal_relepsilon '-9' '-4' ;}

function comparison-float32-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT32='0.1'
    mmux_float32_equal_relepsilon '1.0' '1.02'
}
function comparison-float32-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT32='0.1'
    ! mmux_float32_equal_relepsilon '1.0' '1.3'
}
function comparison-float32-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT32='0.1'
    ! mmux_float32_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float64

if test -v mmux_float64_SIZEOF
then

function comparison-float64-equal-1.1         () {   mmux_float64_equal '1.0' ;}
function comparison-float64-equal-1.2         () {   mmux_float64_equal '1.0' '1.0' ;}
function comparison-float64-equal-1.3         () {   mmux_float64_equal '1.0' '1.0' '1.0' ;}
function comparison-float64-equal-1.4         () { ! mmux_float64_equal '9' '1.1' '1.0' ;}
function comparison-float64-equal-1.5         () {   mmux_float64_equal '-9' '-9' ;}
function comparison-float64-equal-1.6         () { ! mmux_float64_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float64-greater-1.1       () {   mmux_float64_greater '9.0' ;}
function comparison-float64-greater-1.2       () {   mmux_float64_greater '9.0' '8.0' ;}
function comparison-float64-greater-1.3       () {   mmux_float64_greater '9.0' '8.0' '7.0' ;}
function comparison-float64-greater-1.4       () { ! mmux_float64_greater '1.1' '3.3' ;}
function comparison-float64-greater-1.5       () { ! mmux_float64_greater '9.9' '3.3' '5.5' ;}
function comparison-float64-greater-1.6       () { ! mmux_float64_greater '1.1' '1.1' ;}
function comparison-float64-greater-1.7       () {   mmux_float64_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64-less-1.1        ()  {   mmux_float64_less '9.0' ;}
function comparison-float64-less-1.2        ()  {   mmux_float64_less '8.0' '9.0' ;}
function comparison-float64-less-1.3        ()  {   mmux_float64_less '7.0' '8.0' '9.0' ;}
function comparison-float64-less-1.4        ()  { ! mmux_float64_less '3.3' '1.1' ;}
function comparison-float64-less-1.5        ()  { ! mmux_float64_less '3.3' '9.9' '5.5' ;}
function comparison-float64-less-1.6        ()  { ! mmux_float64_less '1.1' '1.1' ;}
function comparison-float64-less-1.7        ()  { ! mmux_float64_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64-greater-equal-1.1 () {   mmux_float64_greater_equal '9.0' ;}
function comparison-float64-greater-equal-1.2 () {   mmux_float64_greater_equal '9.0' '8.0' ;}
function comparison-float64-greater-equal-1.3 () {   mmux_float64_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float64-greater-equal-1.4 () { ! mmux_float64_greater_equal '1.1' '3.3' ;}
function comparison-float64-greater-equal-1.5 () { ! mmux_float64_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float64-greater-equal-1.6 () {   mmux_float64_greater_equal '1.1' '1.1' ;}
function comparison-float64-greater-equal-1.7 () {   mmux_float64_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float64-less-equal-1.1  () {   mmux_float64_less_equal '9.0' ;}
function comparison-float64-less-equal-1.2  () {   mmux_float64_less_equal '8.0' '9.0' ;}
function comparison-float64-less-equal-1.3  () {   mmux_float64_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float64-less-equal-1.4  () { ! mmux_float64_less_equal '3.3' '1.1' ;}
function comparison-float64-less-equal-1.5  () { ! mmux_float64_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float64-less-equal-1.6  () {   mmux_float64_less_equal '1.1' '1.1' ;}
function comparison-float64-less-equal-1.7  () {   mmux_float64_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64-equal-absmargin-1.1   () {   mmux_float64_equal_absmargin '1.0' ;}
function comparison-float64-equal-absmargin-1.2   () {   mmux_float64_equal_absmargin '1.0' '1.0' ;}
function comparison-float64-equal-absmargin-1.3   () {   mmux_float64_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float64-equal-absmargin-1.4   () { ! mmux_float64_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float64-equal-absmargin-1.5   () {   mmux_float64_equal_absmargin '-9' '-9' ;}
function comparison-float64-equal-absmargin-1.6   () { ! mmux_float64_equal_absmargin '-9' '-4' ;}

function comparison-float64-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64='0.1'
    mmux_float64_equal_absmargin '1.0' '1.02'
}
function comparison-float64-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64='0.1'
    ! mmux_float64_equal_absmargin '1.0' '1.3'
}
function comparison-float64-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64='1.0'
    ! mmux_float64_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float64-equal-relepsilon-1.1   () {   mmux_float64_equal_relepsilon '1.0' ;}
function comparison-float64-equal-relepsilon-1.2   () {   mmux_float64_equal_relepsilon '1.0' '1.0' ;}
function comparison-float64-equal-relepsilon-1.3   () {   mmux_float64_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float64-equal-relepsilon-1.4   () { ! mmux_float64_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float64-equal-relepsilon-1.5   () {   mmux_float64_equal_relepsilon '-9' '-9' ;}
function comparison-float64-equal-relepsilon-1.6   () { ! mmux_float64_equal_relepsilon '-9' '-4' ;}

function comparison-float64-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT64='0.1'
    mmux_float64_equal_relepsilon '1.0' '1.02'
}
function comparison-float64-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT64='0.1'
    ! mmux_float64_equal_relepsilon '1.0' '1.3'
}
function comparison-float64-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT64='0.1'
    ! mmux_float64_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float128

if test -v mmux_float128_SIZEOF
then

function comparison-float128-equal-1.1         () {   mmux_float128_equal '1.0' ;}
function comparison-float128-equal-1.2         () {   mmux_float128_equal '1.0' '1.0' ;}
function comparison-float128-equal-1.3         () {   mmux_float128_equal '1.0' '1.0' '1.0' ;}
function comparison-float128-equal-1.4         () { ! mmux_float128_equal '9' '1.1' '1.0' ;}
function comparison-float128-equal-1.5         () {   mmux_float128_equal '-9' '-9' ;}
function comparison-float128-equal-1.6         () { ! mmux_float128_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float128-greater-1.1       () {   mmux_float128_greater '9.0' ;}
function comparison-float128-greater-1.2       () {   mmux_float128_greater '9.0' '8.0' ;}
function comparison-float128-greater-1.3       () {   mmux_float128_greater '9.0' '8.0' '7.0' ;}
function comparison-float128-greater-1.4       () { ! mmux_float128_greater '1.1' '3.3' ;}
function comparison-float128-greater-1.5       () { ! mmux_float128_greater '9.9' '3.3' '5.5' ;}
function comparison-float128-greater-1.6       () { ! mmux_float128_greater '1.1' '1.1' ;}
function comparison-float128-greater-1.7       () {   mmux_float128_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128-less-1.1        ()  {   mmux_float128_less '9.0' ;}
function comparison-float128-less-1.2        ()  {   mmux_float128_less '8.0' '9.0' ;}
function comparison-float128-less-1.3        ()  {   mmux_float128_less '7.0' '8.0' '9.0' ;}
function comparison-float128-less-1.4        ()  { ! mmux_float128_less '3.3' '1.1' ;}
function comparison-float128-less-1.5        ()  { ! mmux_float128_less '3.3' '9.9' '5.5' ;}
function comparison-float128-less-1.6        ()  { ! mmux_float128_less '1.1' '1.1' ;}
function comparison-float128-less-1.7        ()  { ! mmux_float128_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128-greater-equal-1.1 () {   mmux_float128_greater_equal '9.0' ;}
function comparison-float128-greater-equal-1.2 () {   mmux_float128_greater_equal '9.0' '8.0' ;}
function comparison-float128-greater-equal-1.3 () {   mmux_float128_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float128-greater-equal-1.4 () { ! mmux_float128_greater_equal '1.1' '3.3' ;}
function comparison-float128-greater-equal-1.5 () { ! mmux_float128_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float128-greater-equal-1.6 () {   mmux_float128_greater_equal '1.1' '1.1' ;}
function comparison-float128-greater-equal-1.7 () {   mmux_float128_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float128-less-equal-1.1  () {   mmux_float128_less_equal '9.0' ;}
function comparison-float128-less-equal-1.2  () {   mmux_float128_less_equal '8.0' '9.0' ;}
function comparison-float128-less-equal-1.3  () {   mmux_float128_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float128-less-equal-1.4  () { ! mmux_float128_less_equal '3.3' '1.1' ;}
function comparison-float128-less-equal-1.5  () { ! mmux_float128_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float128-less-equal-1.6  () {   mmux_float128_less_equal '1.1' '1.1' ;}
function comparison-float128-less-equal-1.7  () {   mmux_float128_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128-equal-absmargin-1.1   () {   mmux_float128_equal_absmargin '1.0' ;}
function comparison-float128-equal-absmargin-1.2   () {   mmux_float128_equal_absmargin '1.0' '1.0' ;}
function comparison-float128-equal-absmargin-1.3   () {   mmux_float128_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float128-equal-absmargin-1.4   () { ! mmux_float128_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float128-equal-absmargin-1.5   () {   mmux_float128_equal_absmargin '-9' '-9' ;}
function comparison-float128-equal-absmargin-1.6   () { ! mmux_float128_equal_absmargin '-9' '-4' ;}

function comparison-float128-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128='0.1'
    mmux_float128_equal_absmargin '1.0' '1.02'
}
function comparison-float128-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128='0.1'
    ! mmux_float128_equal_absmargin '1.0' '1.3'
}
function comparison-float128-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128='1.0'
    ! mmux_float128_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float128-equal-relepsilon-1.1   () {   mmux_float128_equal_relepsilon '1.0' ;}
function comparison-float128-equal-relepsilon-1.2   () {   mmux_float128_equal_relepsilon '1.0' '1.0' ;}
function comparison-float128-equal-relepsilon-1.3   () {   mmux_float128_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float128-equal-relepsilon-1.4   () { ! mmux_float128_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float128-equal-relepsilon-1.5   () {   mmux_float128_equal_relepsilon '-9' '-9' ;}
function comparison-float128-equal-relepsilon-1.6   () { ! mmux_float128_equal_relepsilon '-9' '-4' ;}

function comparison-float128-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT128='0.1'
    mmux_float128_equal_relepsilon '1.0' '1.02'
}
function comparison-float128-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT128='0.1'
    ! mmux_float128_equal_relepsilon '1.0' '1.3'
}
function comparison-float128-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT128='0.1'
    ! mmux_float128_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float32x

if test -v mmux_float32x_SIZEOF
then

function comparison-float32x-equal-1.1         () {   mmux_float32x_equal '1.0' ;}
function comparison-float32x-equal-1.2         () {   mmux_float32x_equal '1.0' '1.0' ;}
function comparison-float32x-equal-1.3         () {   mmux_float32x_equal '1.0' '1.0' '1.0' ;}
function comparison-float32x-equal-1.4         () { ! mmux_float32x_equal '9' '1.1' '1.0' ;}
function comparison-float32x-equal-1.5         () {   mmux_float32x_equal '-9' '-9' ;}
function comparison-float32x-equal-1.6         () { ! mmux_float32x_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float32x-greater-1.1       () {   mmux_float32x_greater '9.0' ;}
function comparison-float32x-greater-1.2       () {   mmux_float32x_greater '9.0' '8.0' ;}
function comparison-float32x-greater-1.3       () {   mmux_float32x_greater '9.0' '8.0' '7.0' ;}
function comparison-float32x-greater-1.4       () { ! mmux_float32x_greater '1.1' '3.3' ;}
function comparison-float32x-greater-1.5       () { ! mmux_float32x_greater '9.9' '3.3' '5.5' ;}
function comparison-float32x-greater-1.6       () { ! mmux_float32x_greater '1.1' '1.1' ;}
function comparison-float32x-greater-1.7       () {   mmux_float32x_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32x-less-1.1        ()  {   mmux_float32x_less '9.0' ;}
function comparison-float32x-less-1.2        ()  {   mmux_float32x_less '8.0' '9.0' ;}
function comparison-float32x-less-1.3        ()  {   mmux_float32x_less '7.0' '8.0' '9.0' ;}
function comparison-float32x-less-1.4        ()  { ! mmux_float32x_less '3.3' '1.1' ;}
function comparison-float32x-less-1.5        ()  { ! mmux_float32x_less '3.3' '9.9' '5.5' ;}
function comparison-float32x-less-1.6        ()  { ! mmux_float32x_less '1.1' '1.1' ;}
function comparison-float32x-less-1.7        ()  { ! mmux_float32x_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32x-greater-equal-1.1 () {   mmux_float32x_greater_equal '9.0' ;}
function comparison-float32x-greater-equal-1.2 () {   mmux_float32x_greater_equal '9.0' '8.0' ;}
function comparison-float32x-greater-equal-1.3 () {   mmux_float32x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float32x-greater-equal-1.4 () { ! mmux_float32x_greater_equal '1.1' '3.3' ;}
function comparison-float32x-greater-equal-1.5 () { ! mmux_float32x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float32x-greater-equal-1.6 () {   mmux_float32x_greater_equal '1.1' '1.1' ;}
function comparison-float32x-greater-equal-1.7 () {   mmux_float32x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float32x-less-equal-1.1  () {   mmux_float32x_less_equal '9.0' ;}
function comparison-float32x-less-equal-1.2  () {   mmux_float32x_less_equal '8.0' '9.0' ;}
function comparison-float32x-less-equal-1.3  () {   mmux_float32x_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float32x-less-equal-1.4  () { ! mmux_float32x_less_equal '3.3' '1.1' ;}
function comparison-float32x-less-equal-1.5  () { ! mmux_float32x_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float32x-less-equal-1.6  () {   mmux_float32x_less_equal '1.1' '1.1' ;}
function comparison-float32x-less-equal-1.7  () {   mmux_float32x_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32x-equal-absmargin-1.1   () {   mmux_float32x_equal_absmargin '1.0' ;}
function comparison-float32x-equal-absmargin-1.2   () {   mmux_float32x_equal_absmargin '1.0' '1.0' ;}
function comparison-float32x-equal-absmargin-1.3   () {   mmux_float32x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float32x-equal-absmargin-1.4   () { ! mmux_float32x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float32x-equal-absmargin-1.5   () {   mmux_float32x_equal_absmargin '-9' '-9' ;}
function comparison-float32x-equal-absmargin-1.6   () { ! mmux_float32x_equal_absmargin '-9' '-4' ;}

function comparison-float32x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32X='0.1'
    mmux_float32x_equal_absmargin '1.0' '1.02'
}
function comparison-float32x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32X='0.1'
    ! mmux_float32x_equal_absmargin '1.0' '1.3'
}
function comparison-float32x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT32X='1.0'
    ! mmux_float32x_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float32x-equal-relepsilon-1.1   () {   mmux_float32x_equal_relepsilon '1.0' ;}
function comparison-float32x-equal-relepsilon-1.2   () {   mmux_float32x_equal_relepsilon '1.0' '1.0' ;}
function comparison-float32x-equal-relepsilon-1.3   () {   mmux_float32x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float32x-equal-relepsilon-1.4   () { ! mmux_float32x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float32x-equal-relepsilon-1.5   () {   mmux_float32x_equal_relepsilon '-9' '-9' ;}
function comparison-float32x-equal-relepsilon-1.6   () { ! mmux_float32x_equal_relepsilon '-9' '-4' ;}

function comparison-float32x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT32X='0.1'
    mmux_float32x_equal_relepsilon '1.0' '1.02'
}
function comparison-float32x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT32X='0.1'
    ! mmux_float32x_equal_relepsilon '1.0' '1.3'
}
function comparison-float32x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT32X='0.1'
    ! mmux_float32x_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float64x

if test -v mmux_float64x_SIZEOF
then

function comparison-float64x-equal-1.1         () {   mmux_float64x_equal '1.0' ;}
function comparison-float64x-equal-1.2         () {   mmux_float64x_equal '1.0' '1.0' ;}
function comparison-float64x-equal-1.3         () {   mmux_float64x_equal '1.0' '1.0' '1.0' ;}
function comparison-float64x-equal-1.4         () { ! mmux_float64x_equal '9' '1.1' '1.0' ;}
function comparison-float64x-equal-1.5         () {   mmux_float64x_equal '-9' '-9' ;}
function comparison-float64x-equal-1.6         () { ! mmux_float64x_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float64x-greater-1.1       () {   mmux_float64x_greater '9.0' ;}
function comparison-float64x-greater-1.2       () {   mmux_float64x_greater '9.0' '8.0' ;}
function comparison-float64x-greater-1.3       () {   mmux_float64x_greater '9.0' '8.0' '7.0' ;}
function comparison-float64x-greater-1.4       () { ! mmux_float64x_greater '1.1' '3.3' ;}
function comparison-float64x-greater-1.5       () { ! mmux_float64x_greater '9.9' '3.3' '5.5' ;}
function comparison-float64x-greater-1.6       () { ! mmux_float64x_greater '1.1' '1.1' ;}
function comparison-float64x-greater-1.7       () {   mmux_float64x_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64x-less-1.1        ()  {   mmux_float64x_less '9.0' ;}
function comparison-float64x-less-1.2        ()  {   mmux_float64x_less '8.0' '9.0' ;}
function comparison-float64x-less-1.3        ()  {   mmux_float64x_less '7.0' '8.0' '9.0' ;}
function comparison-float64x-less-1.4        ()  { ! mmux_float64x_less '3.3' '1.1' ;}
function comparison-float64x-less-1.5        ()  { ! mmux_float64x_less '3.3' '9.9' '5.5' ;}
function comparison-float64x-less-1.6        ()  { ! mmux_float64x_less '1.1' '1.1' ;}
function comparison-float64x-less-1.7        ()  { ! mmux_float64x_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64x-greater-equal-1.1 () {   mmux_float64x_greater_equal '9.0' ;}
function comparison-float64x-greater-equal-1.2 () {   mmux_float64x_greater_equal '9.0' '8.0' ;}
function comparison-float64x-greater-equal-1.3 () {   mmux_float64x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float64x-greater-equal-1.4 () { ! mmux_float64x_greater_equal '1.1' '3.3' ;}
function comparison-float64x-greater-equal-1.5 () { ! mmux_float64x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float64x-greater-equal-1.6 () {   mmux_float64x_greater_equal '1.1' '1.1' ;}
function comparison-float64x-greater-equal-1.7 () {   mmux_float64x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float64x-less-equal-1.1  () {   mmux_float64x_less_equal '9.0' ;}
function comparison-float64x-less-equal-1.2  () {   mmux_float64x_less_equal '8.0' '9.0' ;}
function comparison-float64x-less-equal-1.3  () {   mmux_float64x_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float64x-less-equal-1.4  () { ! mmux_float64x_less_equal '3.3' '1.1' ;}
function comparison-float64x-less-equal-1.5  () { ! mmux_float64x_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float64x-less-equal-1.6  () {   mmux_float64x_less_equal '1.1' '1.1' ;}
function comparison-float64x-less-equal-1.7  () {   mmux_float64x_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64x-equal-absmargin-1.1   () {   mmux_float64x_equal_absmargin '1.0' ;}
function comparison-float64x-equal-absmargin-1.2   () {   mmux_float64x_equal_absmargin '1.0' '1.0' ;}
function comparison-float64x-equal-absmargin-1.3   () {   mmux_float64x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float64x-equal-absmargin-1.4   () { ! mmux_float64x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float64x-equal-absmargin-1.5   () {   mmux_float64x_equal_absmargin '-9' '-9' ;}
function comparison-float64x-equal-absmargin-1.6   () { ! mmux_float64x_equal_absmargin '-9' '-4' ;}

function comparison-float64x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64X='0.1'
    mmux_float64x_equal_absmargin '1.0' '1.02'
}
function comparison-float64x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64X='0.1'
    ! mmux_float64x_equal_absmargin '1.0' '1.3'
}
function comparison-float64x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT64X='1.0'
    ! mmux_float64x_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float64x-equal-relepsilon-1.1   () {   mmux_float64x_equal_relepsilon '1.0' ;}
function comparison-float64x-equal-relepsilon-1.2   () {   mmux_float64x_equal_relepsilon '1.0' '1.0' ;}
function comparison-float64x-equal-relepsilon-1.3   () {   mmux_float64x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float64x-equal-relepsilon-1.4   () { ! mmux_float64x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float64x-equal-relepsilon-1.5   () {   mmux_float64x_equal_relepsilon '-9' '-9' ;}
function comparison-float64x-equal-relepsilon-1.6   () { ! mmux_float64x_equal_relepsilon '-9' '-4' ;}

function comparison-float64x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT64X='0.1'
    mmux_float64x_equal_relepsilon '1.0' '1.02'
}
function comparison-float64x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT64X='0.1'
    ! mmux_float64x_equal_relepsilon '1.0' '1.3'
}
function comparison-float64x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT64X='0.1'
    ! mmux_float64x_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: float128x

if test -v mmux_float128x_SIZEOF
then

function comparison-float128x-equal-1.1         () {   mmux_float128x_equal '1.0' ;}
function comparison-float128x-equal-1.2         () {   mmux_float128x_equal '1.0' '1.0' ;}
function comparison-float128x-equal-1.3         () {   mmux_float128x_equal '1.0' '1.0' '1.0' ;}
function comparison-float128x-equal-1.4         () { ! mmux_float128x_equal '9' '1.1' '1.0' ;}
function comparison-float128x-equal-1.5         () {   mmux_float128x_equal '-9' '-9' ;}
function comparison-float128x-equal-1.6         () { ! mmux_float128x_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-float128x-greater-1.1       () {   mmux_float128x_greater '9.0' ;}
function comparison-float128x-greater-1.2       () {   mmux_float128x_greater '9.0' '8.0' ;}
function comparison-float128x-greater-1.3       () {   mmux_float128x_greater '9.0' '8.0' '7.0' ;}
function comparison-float128x-greater-1.4       () { ! mmux_float128x_greater '1.1' '3.3' ;}
function comparison-float128x-greater-1.5       () { ! mmux_float128x_greater '9.9' '3.3' '5.5' ;}
function comparison-float128x-greater-1.6       () { ! mmux_float128x_greater '1.1' '1.1' ;}
function comparison-float128x-greater-1.7       () {   mmux_float128x_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128x-less-1.1        ()  {   mmux_float128x_less '9.0' ;}
function comparison-float128x-less-1.2        ()  {   mmux_float128x_less '8.0' '9.0' ;}
function comparison-float128x-less-1.3        ()  {   mmux_float128x_less '7.0' '8.0' '9.0' ;}
function comparison-float128x-less-1.4        ()  { ! mmux_float128x_less '3.3' '1.1' ;}
function comparison-float128x-less-1.5        ()  { ! mmux_float128x_less '3.3' '9.9' '5.5' ;}
function comparison-float128x-less-1.6        ()  { ! mmux_float128x_less '1.1' '1.1' ;}
function comparison-float128x-less-1.7        ()  { ! mmux_float128x_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128x-greater-equal-1.1 () {   mmux_float128x_greater_equal '9.0' ;}
function comparison-float128x-greater-equal-1.2 () {   mmux_float128x_greater_equal '9.0' '8.0' ;}
function comparison-float128x-greater-equal-1.3 () {   mmux_float128x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float128x-greater-equal-1.4 () { ! mmux_float128x_greater_equal '1.1' '3.3' ;}
function comparison-float128x-greater-equal-1.5 () { ! mmux_float128x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float128x-greater-equal-1.6 () {   mmux_float128x_greater_equal '1.1' '1.1' ;}
function comparison-float128x-greater-equal-1.7 () {   mmux_float128x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float128x-less-equal-1.1  () {   mmux_float128x_less_equal '9.0' ;}
function comparison-float128x-less-equal-1.2  () {   mmux_float128x_less_equal '8.0' '9.0' ;}
function comparison-float128x-less-equal-1.3  () {   mmux_float128x_less_equal '7.0' '8.0' '9.0' ;}
function comparison-float128x-less-equal-1.4  () { ! mmux_float128x_less_equal '3.3' '1.1' ;}
function comparison-float128x-less-equal-1.5  () { ! mmux_float128x_less_equal '3.3' '9.9' '5.5' ;}
function comparison-float128x-less-equal-1.6  () {   mmux_float128x_less_equal '1.1' '1.1' ;}
function comparison-float128x-less-equal-1.7  () {   mmux_float128x_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128x-equal-absmargin-1.1   () {   mmux_float128x_equal_absmargin '1.0' ;}
function comparison-float128x-equal-absmargin-1.2   () {   mmux_float128x_equal_absmargin '1.0' '1.0' ;}
function comparison-float128x-equal-absmargin-1.3   () {   mmux_float128x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-float128x-equal-absmargin-1.4   () { ! mmux_float128x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-float128x-equal-absmargin-1.5   () {   mmux_float128x_equal_absmargin '-9' '-9' ;}
function comparison-float128x-equal-absmargin-1.6   () { ! mmux_float128x_equal_absmargin '-9' '-4' ;}

function comparison-float128x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128X='0.1'
    mmux_float128x_equal_absmargin '1.0' '1.02'
}
function comparison-float128x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128X='0.1'
    ! mmux_float128x_equal_absmargin '1.0' '1.3'
}
function comparison-float128x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_FLOAT128X='1.0'
    ! mmux_float128x_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-float128x-equal-relepsilon-1.1   () {   mmux_float128x_equal_relepsilon '1.0' ;}
function comparison-float128x-equal-relepsilon-1.2   () {   mmux_float128x_equal_relepsilon '1.0' '1.0' ;}
function comparison-float128x-equal-relepsilon-1.3   () {   mmux_float128x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-float128x-equal-relepsilon-1.4   () { ! mmux_float128x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-float128x-equal-relepsilon-1.5   () {   mmux_float128x_equal_relepsilon '-9' '-9' ;}
function comparison-float128x-equal-relepsilon-1.6   () { ! mmux_float128x_equal_relepsilon '-9' '-4' ;}

function comparison-float128x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_FLOAT128X='0.1'
    mmux_float128x_equal_relepsilon '1.0' '1.02'
}
function comparison-float128x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_FLOAT128X='0.1'
    ! mmux_float128x_equal_relepsilon '1.0' '1.3'
}
function comparison-float128x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_FLOAT128X='0.1'
    ! mmux_float128x_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: decimal32

if test -v mmux_decimal32_SIZEOF
then

function comparison-decimal32-equal-1.1         () {   mmux_decimal32_equal '1.0' ;}
function comparison-decimal32-equal-1.2         () {   mmux_decimal32_equal '1.0' '1.0' ;}
function comparison-decimal32-equal-1.3         () {   mmux_decimal32_equal '1.0' '1.0' '1.0' ;}
function comparison-decimal32-equal-1.4         () { ! mmux_decimal32_equal '9' '1.1' '1.0' ;}
function comparison-decimal32-equal-1.5         () {   mmux_decimal32_equal '-9' '-9' ;}
function comparison-decimal32-equal-1.6         () { ! mmux_decimal32_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-greater-1.1       () {   mmux_decimal32_greater '9.0' ;}
function comparison-decimal32-greater-1.2       () {   mmux_decimal32_greater '9.0' '8.0' ;}
function comparison-decimal32-greater-1.3       () {   mmux_decimal32_greater '9.0' '8.0' '7.0' ;}
function comparison-decimal32-greater-1.4       () { ! mmux_decimal32_greater '1.1' '3.3' ;}
function comparison-decimal32-greater-1.5       () { ! mmux_decimal32_greater '9.9' '3.3' '5.5' ;}
function comparison-decimal32-greater-1.6       () { ! mmux_decimal32_greater '1.1' '1.1' ;}
function comparison-decimal32-greater-1.7       () {   mmux_decimal32_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-less-1.1        ()  {   mmux_decimal32_less '9.0' ;}
function comparison-decimal32-less-1.2        ()  {   mmux_decimal32_less '8.0' '9.0' ;}
function comparison-decimal32-less-1.3        ()  {   mmux_decimal32_less '7.0' '8.0' '9.0' ;}
function comparison-decimal32-less-1.4        ()  { ! mmux_decimal32_less '3.3' '1.1' ;}
function comparison-decimal32-less-1.5        ()  { ! mmux_decimal32_less '3.3' '9.9' '5.5' ;}
function comparison-decimal32-less-1.6        ()  { ! mmux_decimal32_less '1.1' '1.1' ;}
function comparison-decimal32-less-1.7        ()  { ! mmux_decimal32_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-greater-equal-1.1 () {   mmux_decimal32_greater_equal '9.0' ;}
function comparison-decimal32-greater-equal-1.2 () {   mmux_decimal32_greater_equal '9.0' '8.0' ;}
function comparison-decimal32-greater-equal-1.3 () {   mmux_decimal32_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal32-greater-equal-1.4 () { ! mmux_decimal32_greater_equal '1.1' '3.3' ;}
function comparison-decimal32-greater-equal-1.5 () { ! mmux_decimal32_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal32-greater-equal-1.6 () {   mmux_decimal32_greater_equal '1.1' '1.1' ;}
function comparison-decimal32-greater-equal-1.7 () {   mmux_decimal32_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-less-equal-1.1  () {   mmux_decimal32_less_equal '9.0' ;}
function comparison-decimal32-less-equal-1.2  () {   mmux_decimal32_less_equal '8.0' '9.0' ;}
function comparison-decimal32-less-equal-1.3  () {   mmux_decimal32_less_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal32-less-equal-1.4  () { ! mmux_decimal32_less_equal '3.3' '1.1' ;}
function comparison-decimal32-less-equal-1.5  () { ! mmux_decimal32_less_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal32-less-equal-1.6  () {   mmux_decimal32_less_equal '1.1' '1.1' ;}
function comparison-decimal32-less-equal-1.7  () {   mmux_decimal32_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-equal-absmargin-1.1   () {   mmux_decimal32_equal_absmargin '1.0' ;}
function comparison-decimal32-equal-absmargin-1.2   () {   mmux_decimal32_equal_absmargin '1.0' '1.0' ;}
function comparison-decimal32-equal-absmargin-1.3   () {   mmux_decimal32_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-decimal32-equal-absmargin-1.4   () { ! mmux_decimal32_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-decimal32-equal-absmargin-1.5   () {   mmux_decimal32_equal_absmargin '-9' '-9' ;}
function comparison-decimal32-equal-absmargin-1.6   () { ! mmux_decimal32_equal_absmargin '-9' '-4' ;}

function comparison-decimal32-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL32='0.1'
    mmux_decimal32_equal_absmargin '1.0' '1.02'
}
function comparison-decimal32-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL32='0.1'
    ! mmux_decimal32_equal_absmargin '1.0' '1.3'
}
function comparison-decimal32-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL32='1.0'
    ! mmux_decimal32_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-decimal32-equal-relepsilon-1.1   () {   mmux_decimal32_equal_relepsilon '1.0' ;}
function comparison-decimal32-equal-relepsilon-1.2   () {   mmux_decimal32_equal_relepsilon '1.0' '1.0' ;}
function comparison-decimal32-equal-relepsilon-1.3   () {   mmux_decimal32_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-decimal32-equal-relepsilon-1.4   () { ! mmux_decimal32_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-decimal32-equal-relepsilon-1.5   () {   mmux_decimal32_equal_relepsilon '-9' '-9' ;}
function comparison-decimal32-equal-relepsilon-1.6   () { ! mmux_decimal32_equal_relepsilon '-9' '-4' ;}

function comparison-decimal32-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_DECIMAL32='0.1'
    mmux_decimal32_equal_relepsilon '1.0' '1.02'
}
function comparison-decimal32-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_DECIMAL32='0.1'
    ! mmux_decimal32_equal_relepsilon '1.0' '1.3'
}
function comparison-decimal32-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_DECIMAL32='0.1'
    ! mmux_decimal32_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: decimal64

if test -v mmux_decimal64_SIZEOF
then

function comparison-decimal64-equal-1.1         () {   mmux_decimal64_equal '1.0' ;}
function comparison-decimal64-equal-1.2         () {   mmux_decimal64_equal '1.0' '1.0' ;}
function comparison-decimal64-equal-1.3         () {   mmux_decimal64_equal '1.0' '1.0' '1.0' ;}
function comparison-decimal64-equal-1.4         () { ! mmux_decimal64_equal '9' '1.1' '1.0' ;}
function comparison-decimal64-equal-1.5         () {   mmux_decimal64_equal '-9' '-9' ;}
function comparison-decimal64-equal-1.6         () { ! mmux_decimal64_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-greater-1.1       () {   mmux_decimal64_greater '9.0' ;}
function comparison-decimal64-greater-1.2       () {   mmux_decimal64_greater '9.0' '8.0' ;}
function comparison-decimal64-greater-1.3       () {   mmux_decimal64_greater '9.0' '8.0' '7.0' ;}
function comparison-decimal64-greater-1.4       () { ! mmux_decimal64_greater '1.1' '3.3' ;}
function comparison-decimal64-greater-1.5       () { ! mmux_decimal64_greater '9.9' '3.3' '5.5' ;}
function comparison-decimal64-greater-1.6       () { ! mmux_decimal64_greater '1.1' '1.1' ;}
function comparison-decimal64-greater-1.7       () {   mmux_decimal64_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-less-1.1        ()  {   mmux_decimal64_less '9.0' ;}
function comparison-decimal64-less-1.2        ()  {   mmux_decimal64_less '8.0' '9.0' ;}
function comparison-decimal64-less-1.3        ()  {   mmux_decimal64_less '7.0' '8.0' '9.0' ;}
function comparison-decimal64-less-1.4        ()  { ! mmux_decimal64_less '3.3' '1.1' ;}
function comparison-decimal64-less-1.5        ()  { ! mmux_decimal64_less '3.3' '9.9' '5.5' ;}
function comparison-decimal64-less-1.6        ()  { ! mmux_decimal64_less '1.1' '1.1' ;}
function comparison-decimal64-less-1.7        ()  { ! mmux_decimal64_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-greater-equal-1.1 () {   mmux_decimal64_greater_equal '9.0' ;}
function comparison-decimal64-greater-equal-1.2 () {   mmux_decimal64_greater_equal '9.0' '8.0' ;}
function comparison-decimal64-greater-equal-1.3 () {   mmux_decimal64_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal64-greater-equal-1.4 () { ! mmux_decimal64_greater_equal '1.1' '3.3' ;}
function comparison-decimal64-greater-equal-1.5 () { ! mmux_decimal64_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal64-greater-equal-1.6 () {   mmux_decimal64_greater_equal '1.1' '1.1' ;}
function comparison-decimal64-greater-equal-1.7 () {   mmux_decimal64_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-less-equal-1.1  () {   mmux_decimal64_less_equal '9.0' ;}
function comparison-decimal64-less-equal-1.2  () {   mmux_decimal64_less_equal '8.0' '9.0' ;}
function comparison-decimal64-less-equal-1.3  () {   mmux_decimal64_less_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal64-less-equal-1.4  () { ! mmux_decimal64_less_equal '3.3' '1.1' ;}
function comparison-decimal64-less-equal-1.5  () { ! mmux_decimal64_less_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal64-less-equal-1.6  () {   mmux_decimal64_less_equal '1.1' '1.1' ;}
function comparison-decimal64-less-equal-1.7  () {   mmux_decimal64_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-equal-absmargin-1.1   () {   mmux_decimal64_equal_absmargin '1.0' ;}
function comparison-decimal64-equal-absmargin-1.2   () {   mmux_decimal64_equal_absmargin '1.0' '1.0' ;}
function comparison-decimal64-equal-absmargin-1.3   () {   mmux_decimal64_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-decimal64-equal-absmargin-1.4   () { ! mmux_decimal64_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-decimal64-equal-absmargin-1.5   () {   mmux_decimal64_equal_absmargin '-9' '-9' ;}
function comparison-decimal64-equal-absmargin-1.6   () { ! mmux_decimal64_equal_absmargin '-9' '-4' ;}

function comparison-decimal64-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL64='0.1'
    mmux_decimal64_equal_absmargin '1.0' '1.02'
}
function comparison-decimal64-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL64='0.1'
    ! mmux_decimal64_equal_absmargin '1.0' '1.3'
}
function comparison-decimal64-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL64='1.0'
    ! mmux_decimal64_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-decimal64-equal-relepsilon-1.1   () {   mmux_decimal64_equal_relepsilon '1.0' ;}
function comparison-decimal64-equal-relepsilon-1.2   () {   mmux_decimal64_equal_relepsilon '1.0' '1.0' ;}
function comparison-decimal64-equal-relepsilon-1.3   () {   mmux_decimal64_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-decimal64-equal-relepsilon-1.4   () { ! mmux_decimal64_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-decimal64-equal-relepsilon-1.5   () {   mmux_decimal64_equal_relepsilon '-9' '-9' ;}
function comparison-decimal64-equal-relepsilon-1.6   () { ! mmux_decimal64_equal_relepsilon '-9' '-4' ;}

function comparison-decimal64-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_DECIMAL64='0.1'
    mmux_decimal64_equal_relepsilon '1.0' '1.02'
}
function comparison-decimal64-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_DECIMAL64='0.1'
    ! mmux_decimal64_equal_relepsilon '1.0' '1.3'
}
function comparison-decimal64-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_DECIMAL64='0.1'
    ! mmux_decimal64_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: decimal128

if test -v mmux_decimal128_SIZEOF
then

function comparison-decimal128-equal-1.1         () {   mmux_decimal128_equal '1.0' ;}
function comparison-decimal128-equal-1.2         () {   mmux_decimal128_equal '1.0' '1.0' ;}
function comparison-decimal128-equal-1.3         () {   mmux_decimal128_equal '1.0' '1.0' '1.0' ;}
function comparison-decimal128-equal-1.4         () { ! mmux_decimal128_equal '9' '1.1' '1.0' ;}
function comparison-decimal128-equal-1.5         () {   mmux_decimal128_equal '-9' '-9' ;}
function comparison-decimal128-equal-1.6         () { ! mmux_decimal128_equal '-9' '-4' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-greater-1.1       () {   mmux_decimal128_greater '9.0' ;}
function comparison-decimal128-greater-1.2       () {   mmux_decimal128_greater '9.0' '8.0' ;}
function comparison-decimal128-greater-1.3       () {   mmux_decimal128_greater '9.0' '8.0' '7.0' ;}
function comparison-decimal128-greater-1.4       () { ! mmux_decimal128_greater '1.1' '3.3' ;}
function comparison-decimal128-greater-1.5       () { ! mmux_decimal128_greater '9.9' '3.3' '5.5' ;}
function comparison-decimal128-greater-1.6       () { ! mmux_decimal128_greater '1.1' '1.1' ;}
function comparison-decimal128-greater-1.7       () {   mmux_decimal128_greater '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-less-1.1        ()  {   mmux_decimal128_less '9.0' ;}
function comparison-decimal128-less-1.2        ()  {   mmux_decimal128_less '8.0' '9.0' ;}
function comparison-decimal128-less-1.3        ()  {   mmux_decimal128_less '7.0' '8.0' '9.0' ;}
function comparison-decimal128-less-1.4        ()  { ! mmux_decimal128_less '3.3' '1.1' ;}
function comparison-decimal128-less-1.5        ()  { ! mmux_decimal128_less '3.3' '9.9' '5.5' ;}
function comparison-decimal128-less-1.6        ()  { ! mmux_decimal128_less '1.1' '1.1' ;}
function comparison-decimal128-less-1.7        ()  { ! mmux_decimal128_less '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-greater-equal-1.1 () {   mmux_decimal128_greater_equal '9.0' ;}
function comparison-decimal128-greater-equal-1.2 () {   mmux_decimal128_greater_equal '9.0' '8.0' ;}
function comparison-decimal128-greater-equal-1.3 () {   mmux_decimal128_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal128-greater-equal-1.4 () { ! mmux_decimal128_greater_equal '1.1' '3.3' ;}
function comparison-decimal128-greater-equal-1.5 () { ! mmux_decimal128_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal128-greater-equal-1.6 () {   mmux_decimal128_greater_equal '1.1' '1.1' ;}
function comparison-decimal128-greater-equal-1.7 () {   mmux_decimal128_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-less-equal-1.1  () {   mmux_decimal128_less_equal '9.0' ;}
function comparison-decimal128-less-equal-1.2  () {   mmux_decimal128_less_equal '8.0' '9.0' ;}
function comparison-decimal128-less-equal-1.3  () {   mmux_decimal128_less_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal128-less-equal-1.4  () { ! mmux_decimal128_less_equal '3.3' '1.1' ;}
function comparison-decimal128-less-equal-1.5  () { ! mmux_decimal128_less_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal128-less-equal-1.6  () {   mmux_decimal128_less_equal '1.1' '1.1' ;}
function comparison-decimal128-less-equal-1.7  () {   mmux_decimal128_less_equal '-3.3' '-2.2' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-equal-absmargin-1.1   () {   mmux_decimal128_equal_absmargin '1.0' ;}
function comparison-decimal128-equal-absmargin-1.2   () {   mmux_decimal128_equal_absmargin '1.0' '1.0' ;}
function comparison-decimal128-equal-absmargin-1.3   () {   mmux_decimal128_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-decimal128-equal-absmargin-1.4   () { ! mmux_decimal128_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-decimal128-equal-absmargin-1.5   () {   mmux_decimal128_equal_absmargin '-9' '-9' ;}
function comparison-decimal128-equal-absmargin-1.6   () { ! mmux_decimal128_equal_absmargin '-9' '-4' ;}

function comparison-decimal128-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL128='0.1'
    mmux_decimal128_equal_absmargin '1.0' '1.02'
}
function comparison-decimal128-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL128='0.1'
    ! mmux_decimal128_equal_absmargin '1.0' '1.3'
}
function comparison-decimal128-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_DECIMAL128='1.0'
    ! mmux_decimal128_equal_absmargin '1.0' '3.0'
}

### ------------------------------------------------------------------------

function comparison-decimal128-equal-relepsilon-1.1   () {   mmux_decimal128_equal_relepsilon '1.0' ;}
function comparison-decimal128-equal-relepsilon-1.2   () {   mmux_decimal128_equal_relepsilon '1.0' '1.0' ;}
function comparison-decimal128-equal-relepsilon-1.3   () {   mmux_decimal128_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-decimal128-equal-relepsilon-1.4   () { ! mmux_decimal128_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-decimal128-equal-relepsilon-1.5   () {   mmux_decimal128_equal_relepsilon '-9' '-9' ;}
function comparison-decimal128-equal-relepsilon-1.6   () { ! mmux_decimal128_equal_relepsilon '-9' '-4' ;}

function comparison-decimal128-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_DECIMAL128='0.1'
    mmux_decimal128_equal_relepsilon '1.0' '1.02'
}
function comparison-decimal128-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_DECIMAL128='0.1'
    ! mmux_decimal128_equal_relepsilon '1.0' '1.3'
}
function comparison-decimal128-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_DECIMAL128='0.1'
    ! mmux_decimal128_equal_relepsilon '1.0' '3.0'
}

fi


#### type variables: complexf

if test -v mmux_complexf_SIZEOF
then

function comparison-complexf-equal-1.1         () {   mmux_complexf_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf-equal-1.2         () {   mmux_complexf_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf-equal-1.3         () {   mmux_complexf_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf-equal-1.4         () { ! mmux_complexf_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf-equal-1.5         () { ! mmux_complexf_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf-equal-absmargin-1.1   () {   mmux_complexf_equal_absmargin '1.0' ;}
function comparison-complexf-equal-absmargin-1.2   () {   mmux_complexf_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf-equal-absmargin-1.3   () {   mmux_complexf_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf-equal-absmargin-1.4   () { ! mmux_complexf_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf-equal-absmargin-1.5   () {   mmux_complexf_equal_absmargin '-9' '-9' ;}
function comparison-complexf-equal-absmargin-1.6   () { ! mmux_complexf_equal_absmargin '-9' '-4' ;}

function comparison-complexf-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='0.1'
    mmux_complexf_equal_absmargin '1.0' '1.02'
}
function comparison-complexf-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='0.1'
    ! mmux_complexf_equal_absmargin '1.0' '1.3'
}
function comparison-complexf-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='1.0'
    ! mmux_complexf_equal_absmargin '1.0' '3.0'
}

function comparison-complexf-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='(0.1)+i*(0.1)'
    mmux_complexf_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='(0.1)+i*(0.1)'
    ! mmux_complexf_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF='(0.1)+i*(0.1)'
    ! mmux_complexf_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf-equal-relepsilon-1.1   () {   mmux_complexf_equal_relepsilon '1.0' ;}
function comparison-complexf-equal-relepsilon-1.2   () {   mmux_complexf_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf-equal-relepsilon-1.3   () {   mmux_complexf_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf-equal-relepsilon-1.4   () { ! mmux_complexf_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf-equal-relepsilon-1.5   () {   mmux_complexf_equal_relepsilon '-9' '-9' ;}
function comparison-complexf-equal-relepsilon-1.6   () { ! mmux_complexf_equal_relepsilon '-9' '-4' ;}

function comparison-complexf-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='0.1'
    mmux_complexf_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='0.1'
    ! mmux_complexf_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='0.1'
    ! mmux_complexf_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='(0.1)+i*(0.1)'
    mmux_complexf_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='(0.1)+i*(0.1)'
    ! mmux_complexf_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF='(0.1)+i*(0.1)'
    ! mmux_complexf_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexd

if test -v mmux_complexd_SIZEOF
then

function comparison-complexd-equal-1.1         () {   mmux_complexd_equal '(1.2)+i*(3.4)' ;}
function comparison-complexd-equal-1.2         () {   mmux_complexd_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd-equal-1.3         () {   mmux_complexd_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd-equal-1.4         () { ! mmux_complexd_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexd-equal-1.5         () { ! mmux_complexd_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexd-equal-absmargin-1.1   () {   mmux_complexd_equal_absmargin '1.0' ;}
function comparison-complexd-equal-absmargin-1.2   () {   mmux_complexd_equal_absmargin '1.0' '1.0' ;}
function comparison-complexd-equal-absmargin-1.3   () {   mmux_complexd_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexd-equal-absmargin-1.4   () { ! mmux_complexd_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexd-equal-absmargin-1.5   () {   mmux_complexd_equal_absmargin '-9' '-9' ;}
function comparison-complexd-equal-absmargin-1.6   () { ! mmux_complexd_equal_absmargin '-9' '-4' ;}

function comparison-complexd-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='0.1'
    mmux_complexd_equal_absmargin '1.0' '1.02'
}
function comparison-complexd-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='0.1'
    ! mmux_complexd_equal_absmargin '1.0' '1.3'
}
function comparison-complexd-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='1.0'
    ! mmux_complexd_equal_absmargin '1.0' '3.0'
}

function comparison-complexd-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='(0.1)+i*(0.1)'
    mmux_complexd_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='(0.1)+i*(0.1)'
    ! mmux_complexd_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD='(0.1)+i*(0.1)'
    ! mmux_complexd_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexld

if test -v mmux_complexld_SIZEOF
then

function comparison-complexld-equal-1.1         () {   mmux_complexld_equal '(1.2)+i*(3.4)' ;}
function comparison-complexld-equal-1.2         () {   mmux_complexld_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexld-equal-1.3         () {   mmux_complexld_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexld-equal-1.4         () { ! mmux_complexld_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexld-equal-1.5         () { ! mmux_complexld_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexld-equal-absmargin-1.1   () {   mmux_complexld_equal_absmargin '1.0' ;}
function comparison-complexld-equal-absmargin-1.2   () {   mmux_complexld_equal_absmargin '1.0' '1.0' ;}
function comparison-complexld-equal-absmargin-1.3   () {   mmux_complexld_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexld-equal-absmargin-1.4   () { ! mmux_complexld_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexld-equal-absmargin-1.5   () {   mmux_complexld_equal_absmargin '-9' '-9' ;}
function comparison-complexld-equal-absmargin-1.6   () { ! mmux_complexld_equal_absmargin '-9' '-4' ;}

function comparison-complexld-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='0.1'
    mmux_complexld_equal_absmargin '1.0' '1.02'
}
function comparison-complexld-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='0.1'
    ! mmux_complexld_equal_absmargin '1.0' '1.3'
}
function comparison-complexld-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='1.0'
    ! mmux_complexld_equal_absmargin '1.0' '3.0'
}

function comparison-complexld-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='(0.1)+i*(0.1)'
    mmux_complexld_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexld-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='(0.1)+i*(0.1)'
    ! mmux_complexld_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexld-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXLD='(0.1)+i*(0.1)'
    ! mmux_complexld_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf32

if test -v mmux_float32_SIZEOF
then

function comparison-complexf32-equal-1.1         () {   mmux_complexf32_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf32-equal-1.2         () {   mmux_complexf32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf32-equal-1.3         () {   mmux_complexf32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf32-equal-1.4         () { ! mmux_complexf32_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf32-equal-1.5         () { ! mmux_complexf32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf32-equal-absmargin-1.1   () {   mmux_complexf32_equal_absmargin '1.0' ;}
function comparison-complexf32-equal-absmargin-1.2   () {   mmux_complexf32_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf32-equal-absmargin-1.3   () {   mmux_complexf32_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf32-equal-absmargin-1.4   () { ! mmux_complexf32_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf32-equal-absmargin-1.5   () {   mmux_complexf32_equal_absmargin '-9' '-9' ;}
function comparison-complexf32-equal-absmargin-1.6   () { ! mmux_complexf32_equal_absmargin '-9' '-4' ;}

function comparison-complexf32-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='0.1'
    mmux_complexf32_equal_absmargin '1.0' '1.02'
}
function comparison-complexf32-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='0.1'
    ! mmux_complexf32_equal_absmargin '1.0' '1.3'
}
function comparison-complexf32-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='1.0'
    ! mmux_complexf32_equal_absmargin '1.0' '3.0'
}

function comparison-complexf32-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='(0.1)+i*(0.1)'
    mmux_complexf32_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf32-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='(0.1)+i*(0.1)'
    ! mmux_complexf32_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf32-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32='(0.1)+i*(0.1)'
    ! mmux_complexf32_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf32-equal-relepsilon-1.1   () {   mmux_complexf32_equal_relepsilon '1.0' ;}
function comparison-complexf32-equal-relepsilon-1.2   () {   mmux_complexf32_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf32-equal-relepsilon-1.3   () {   mmux_complexf32_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf32-equal-relepsilon-1.4   () { ! mmux_complexf32_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf32-equal-relepsilon-1.5   () {   mmux_complexf32_equal_relepsilon '-9' '-9' ;}
function comparison-complexf32-equal-relepsilon-1.6   () { ! mmux_complexf32_equal_relepsilon '-9' '-4' ;}

function comparison-complexf32-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='0.1'
    mmux_complexf32_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf32-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='0.1'
    ! mmux_complexf32_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf32-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='0.1'
    ! mmux_complexf32_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf32-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='(0.1)+i*(0.1)'
    mmux_complexf32_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf32-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='(0.1)+i*(0.1)'
    ! mmux_complexf32_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf32-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32='(0.1)+i*(0.1)'
    ! mmux_complexf32_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf32x

if test -v mmux_float32x_SIZEOF
then

function comparison-complexf32x-equal-1.1         () {   mmux_complexf32x_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf32x-equal-1.2         () {   mmux_complexf32x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf32x-equal-1.3         () {   mmux_complexf32x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf32x-equal-1.4         () { ! mmux_complexf32x_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf32x-equal-1.5         () { ! mmux_complexf32x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf32x-equal-absmargin-1.1   () {   mmux_complexf32x_equal_absmargin '1.0' ;}
function comparison-complexf32x-equal-absmargin-1.2   () {   mmux_complexf32x_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf32x-equal-absmargin-1.3   () {   mmux_complexf32x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf32x-equal-absmargin-1.4   () { ! mmux_complexf32x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf32x-equal-absmargin-1.5   () {   mmux_complexf32x_equal_absmargin '-9' '-9' ;}
function comparison-complexf32x-equal-absmargin-1.6   () { ! mmux_complexf32x_equal_absmargin '-9' '-4' ;}

function comparison-complexf32x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='0.1'
    mmux_complexf32x_equal_absmargin '1.0' '1.02'
}
function comparison-complexf32x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='0.1'
    ! mmux_complexf32x_equal_absmargin '1.0' '1.3'
}
function comparison-complexf32x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='1.0'
    ! mmux_complexf32x_equal_absmargin '1.0' '3.0'
}

function comparison-complexf32x-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='(0.1)+i*(0.1)'
    mmux_complexf32x_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf32x-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='(0.1)+i*(0.1)'
    ! mmux_complexf32x_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf32x-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF32X='(0.1)+i*(0.1)'
    ! mmux_complexf32x_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf32x-equal-relepsilon-1.1   () {   mmux_complexf32x_equal_relepsilon '1.0' ;}
function comparison-complexf32x-equal-relepsilon-1.2   () {   mmux_complexf32x_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf32x-equal-relepsilon-1.3   () {   mmux_complexf32x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf32x-equal-relepsilon-1.4   () { ! mmux_complexf32x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf32x-equal-relepsilon-1.5   () {   mmux_complexf32x_equal_relepsilon '-9' '-9' ;}
function comparison-complexf32x-equal-relepsilon-1.6   () { ! mmux_complexf32x_equal_relepsilon '-9' '-4' ;}

function comparison-complexf32x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='0.1'
    mmux_complexf32x_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf32x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='0.1'
    ! mmux_complexf32x_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf32x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='0.1'
    ! mmux_complexf32x_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf32x-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='(0.1)+i*(0.1)'
    mmux_complexf32x_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf32x-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='(0.1)+i*(0.1)'
    ! mmux_complexf32x_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf32x-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF32X='(0.1)+i*(0.1)'
    ! mmux_complexf32x_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf64

if test -v mmux_float64_SIZEOF
then

function comparison-complexf64-equal-1.1         () {   mmux_complexf64_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf64-equal-1.2         () {   mmux_complexf64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf64-equal-1.3         () {   mmux_complexf64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf64-equal-1.4         () { ! mmux_complexf64_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf64-equal-1.5         () { ! mmux_complexf64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf64-equal-absmargin-1.1   () {   mmux_complexf64_equal_absmargin '1.0' ;}
function comparison-complexf64-equal-absmargin-1.2   () {   mmux_complexf64_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf64-equal-absmargin-1.3   () {   mmux_complexf64_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf64-equal-absmargin-1.4   () { ! mmux_complexf64_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf64-equal-absmargin-1.5   () {   mmux_complexf64_equal_absmargin '-9' '-9' ;}
function comparison-complexf64-equal-absmargin-1.6   () { ! mmux_complexf64_equal_absmargin '-9' '-4' ;}

function comparison-complexf64-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='0.1'
    mmux_complexf64_equal_absmargin '1.0' '1.02'
}
function comparison-complexf64-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='0.1'
    ! mmux_complexf64_equal_absmargin '1.0' '1.3'
}
function comparison-complexf64-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='1.0'
    ! mmux_complexf64_equal_absmargin '1.0' '3.0'
}

function comparison-complexf64-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='(0.1)+i*(0.1)'
    mmux_complexf64_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf64-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='(0.1)+i*(0.1)'
    ! mmux_complexf64_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf64-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64='(0.1)+i*(0.1)'
    ! mmux_complexf64_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf64-equal-relepsilon-1.1   () {   mmux_complexf64_equal_relepsilon '1.0' ;}
function comparison-complexf64-equal-relepsilon-1.2   () {   mmux_complexf64_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf64-equal-relepsilon-1.3   () {   mmux_complexf64_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf64-equal-relepsilon-1.4   () { ! mmux_complexf64_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf64-equal-relepsilon-1.5   () {   mmux_complexf64_equal_relepsilon '-9' '-9' ;}
function comparison-complexf64-equal-relepsilon-1.6   () { ! mmux_complexf64_equal_relepsilon '-9' '-4' ;}

function comparison-complexf64-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='0.1'
    mmux_complexf64_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf64-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='0.1'
    ! mmux_complexf64_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf64-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='0.1'
    ! mmux_complexf64_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf64-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='(0.1)+i*(0.1)'
    mmux_complexf64_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf64-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='(0.1)+i*(0.1)'
    ! mmux_complexf64_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf64-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64='(0.1)+i*(0.1)'
    ! mmux_complexf64_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf64x

if test -v mmux_float64x_SIZEOF
then

function comparison-complexf64x-equal-1.1         () {   mmux_complexf64x_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf64x-equal-1.2         () {   mmux_complexf64x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf64x-equal-1.3         () {   mmux_complexf64x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf64x-equal-1.4         () { ! mmux_complexf64x_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf64x-equal-1.5         () { ! mmux_complexf64x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf64x-equal-absmargin-1.1   () {   mmux_complexf64x_equal_absmargin '1.0' ;}
function comparison-complexf64x-equal-absmargin-1.2   () {   mmux_complexf64x_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf64x-equal-absmargin-1.3   () {   mmux_complexf64x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf64x-equal-absmargin-1.4   () { ! mmux_complexf64x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf64x-equal-absmargin-1.5   () {   mmux_complexf64x_equal_absmargin '-9' '-9' ;}
function comparison-complexf64x-equal-absmargin-1.6   () { ! mmux_complexf64x_equal_absmargin '-9' '-4' ;}

function comparison-complexf64x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='0.1'
    mmux_complexf64x_equal_absmargin '1.0' '1.02'
}
function comparison-complexf64x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='0.1'
    ! mmux_complexf64x_equal_absmargin '1.0' '1.3'
}
function comparison-complexf64x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='1.0'
    ! mmux_complexf64x_equal_absmargin '1.0' '3.0'
}

function comparison-complexf64x-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='(0.1)+i*(0.1)'
    mmux_complexf64x_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf64x-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='(0.1)+i*(0.1)'
    ! mmux_complexf64x_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf64x-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF64X='(0.1)+i*(0.1)'
    ! mmux_complexf64x_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf64x-equal-relepsilon-1.1   () {   mmux_complexf64x_equal_relepsilon '1.0' ;}
function comparison-complexf64x-equal-relepsilon-1.2   () {   mmux_complexf64x_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf64x-equal-relepsilon-1.3   () {   mmux_complexf64x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf64x-equal-relepsilon-1.4   () { ! mmux_complexf64x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf64x-equal-relepsilon-1.5   () {   mmux_complexf64x_equal_relepsilon '-9' '-9' ;}
function comparison-complexf64x-equal-relepsilon-1.6   () { ! mmux_complexf64x_equal_relepsilon '-9' '-4' ;}

function comparison-complexf64x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='0.1'
    mmux_complexf64x_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf64x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='0.1'
    ! mmux_complexf64x_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf64x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='0.1'
    ! mmux_complexf64x_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf64x-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='(0.1)+i*(0.1)'
    mmux_complexf64x_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf64x-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='(0.1)+i*(0.1)'
    ! mmux_complexf64x_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf64x-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF64X='(0.1)+i*(0.1)'
    ! mmux_complexf64x_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf128

if test -v mmux_float128_SIZEOF
then

function comparison-complexf128-equal-1.1         () {   mmux_complexf128_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf128-equal-1.2         () {   mmux_complexf128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf128-equal-1.3         () {   mmux_complexf128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf128-equal-1.4         () { ! mmux_complexf128_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf128-equal-1.5         () { ! mmux_complexf128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf128-equal-absmargin-1.1   () {   mmux_complexf128_equal_absmargin '1.0' ;}
function comparison-complexf128-equal-absmargin-1.2   () {   mmux_complexf128_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf128-equal-absmargin-1.3   () {   mmux_complexf128_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf128-equal-absmargin-1.4   () { ! mmux_complexf128_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf128-equal-absmargin-1.5   () {   mmux_complexf128_equal_absmargin '-9' '-9' ;}
function comparison-complexf128-equal-absmargin-1.6   () { ! mmux_complexf128_equal_absmargin '-9' '-4' ;}

function comparison-complexf128-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='0.1'
    mmux_complexf128_equal_absmargin '1.0' '1.02'
}
function comparison-complexf128-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='0.1'
    ! mmux_complexf128_equal_absmargin '1.0' '1.3'
}
function comparison-complexf128-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='1.0'
    ! mmux_complexf128_equal_absmargin '1.0' '3.0'
}

function comparison-complexf128-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='(0.1)+i*(0.1)'
    mmux_complexf128_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf128-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='(0.1)+i*(0.1)'
    ! mmux_complexf128_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf128-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128='(0.1)+i*(0.1)'
    ! mmux_complexf128_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf128-equal-relepsilon-1.1   () {   mmux_complexf128_equal_relepsilon '1.0' ;}
function comparison-complexf128-equal-relepsilon-1.2   () {   mmux_complexf128_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf128-equal-relepsilon-1.3   () {   mmux_complexf128_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf128-equal-relepsilon-1.4   () { ! mmux_complexf128_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf128-equal-relepsilon-1.5   () {   mmux_complexf128_equal_relepsilon '-9' '-9' ;}
function comparison-complexf128-equal-relepsilon-1.6   () { ! mmux_complexf128_equal_relepsilon '-9' '-4' ;}

function comparison-complexf128-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='0.1'
    mmux_complexf128_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf128-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='0.1'
    ! mmux_complexf128_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf128-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='0.1'
    ! mmux_complexf128_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf128-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='(0.1)+i*(0.1)'
    mmux_complexf128_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf128-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='(0.1)+i*(0.1)'
    ! mmux_complexf128_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf128-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128='(0.1)+i*(0.1)'
    ! mmux_complexf128_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexf128x

if test -v mmux_float128x_SIZEOF
then

function comparison-complexf128x-equal-1.1         () {   mmux_complexf128x_equal '(1.2)+i*(3.4)' ;}
function comparison-complexf128x-equal-1.2         () {   mmux_complexf128x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf128x-equal-1.3         () {   mmux_complexf128x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexf128x-equal-1.4         () { ! mmux_complexf128x_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexf128x-equal-1.5         () { ! mmux_complexf128x_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexf128x-equal-absmargin-1.1   () {   mmux_complexf128x_equal_absmargin '1.0' ;}
function comparison-complexf128x-equal-absmargin-1.2   () {   mmux_complexf128x_equal_absmargin '1.0' '1.0' ;}
function comparison-complexf128x-equal-absmargin-1.3   () {   mmux_complexf128x_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexf128x-equal-absmargin-1.4   () { ! mmux_complexf128x_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexf128x-equal-absmargin-1.5   () {   mmux_complexf128x_equal_absmargin '-9' '-9' ;}
function comparison-complexf128x-equal-absmargin-1.6   () { ! mmux_complexf128x_equal_absmargin '-9' '-4' ;}

function comparison-complexf128x-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='0.1'
    mmux_complexf128x_equal_absmargin '1.0' '1.02'
}
function comparison-complexf128x-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='0.1'
    ! mmux_complexf128x_equal_absmargin '1.0' '1.3'
}
function comparison-complexf128x-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='1.0'
    ! mmux_complexf128x_equal_absmargin '1.0' '3.0'
}

function comparison-complexf128x-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='(0.1)+i*(0.1)'
    mmux_complexf128x_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf128x-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='(0.1)+i*(0.1)'
    ! mmux_complexf128x_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf128x-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXF128X='(0.1)+i*(0.1)'
    ! mmux_complexf128x_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexf128x-equal-relepsilon-1.1   () {   mmux_complexf128x_equal_relepsilon '1.0' ;}
function comparison-complexf128x-equal-relepsilon-1.2   () {   mmux_complexf128x_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexf128x-equal-relepsilon-1.3   () {   mmux_complexf128x_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexf128x-equal-relepsilon-1.4   () { ! mmux_complexf128x_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexf128x-equal-relepsilon-1.5   () {   mmux_complexf128x_equal_relepsilon '-9' '-9' ;}
function comparison-complexf128x-equal-relepsilon-1.6   () { ! mmux_complexf128x_equal_relepsilon '-9' '-4' ;}

function comparison-complexf128x-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='0.1'
    mmux_complexf128x_equal_relepsilon '1.0' '1.02'
}
function comparison-complexf128x-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='0.1'
    ! mmux_complexf128x_equal_relepsilon '1.0' '1.3'
}
function comparison-complexf128x-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='0.1'
    ! mmux_complexf128x_equal_relepsilon '1.0' '3.0'
}

function comparison-complexf128x-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='(0.1)+i*(0.1)'
    mmux_complexf128x_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexf128x-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='(0.1)+i*(0.1)'
    ! mmux_complexf128x_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexf128x-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXF128X='(0.1)+i*(0.1)'
    ! mmux_complexf128x_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexd32

if test -v mmux_complexd32_SIZEOF
then

function comparison-complexd32-equal-1.1         () {   mmux_complexd32_equal '(1.2)+i*(3.4)' ;}
function comparison-complexd32-equal-1.2         () {   mmux_complexd32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd32-equal-1.3         () {   mmux_complexd32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd32-equal-1.4         () { ! mmux_complexd32_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexd32-equal-1.5         () { ! mmux_complexd32_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexd32-equal-absmargin-1.1   () {   mmux_complexd32_equal_absmargin '1.0' ;}
function comparison-complexd32-equal-absmargin-1.2   () {   mmux_complexd32_equal_absmargin '1.0' '1.0' ;}
function comparison-complexd32-equal-absmargin-1.3   () {   mmux_complexd32_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexd32-equal-absmargin-1.4   () { ! mmux_complexd32_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexd32-equal-absmargin-1.5   () {   mmux_complexd32_equal_absmargin '-9' '-9' ;}
function comparison-complexd32-equal-absmargin-1.6   () { ! mmux_complexd32_equal_absmargin '-9' '-4' ;}

function comparison-complexd32-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='0.1'
    mmux_complexd32_equal_absmargin '1.0' '1.02'
}
function comparison-complexd32-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='0.1'
    ! mmux_complexd32_equal_absmargin '1.0' '1.3'
}
function comparison-complexd32-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='1.0'
    ! mmux_complexd32_equal_absmargin '1.0' '3.0'
}

function comparison-complexd32-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='(0.1)+i*(0.1)'
    mmux_complexd32_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd32-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='(0.1)+i*(0.1)'
    ! mmux_complexd32_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd32-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD32='(0.1)+i*(0.1)'
    ! mmux_complexd32_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexd32-equal-relepsilon-1.1   () {   mmux_complexd32_equal_relepsilon '1.0' ;}
function comparison-complexd32-equal-relepsilon-1.2   () {   mmux_complexd32_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexd32-equal-relepsilon-1.3   () {   mmux_complexd32_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexd32-equal-relepsilon-1.4   () { ! mmux_complexd32_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexd32-equal-relepsilon-1.5   () {   mmux_complexd32_equal_relepsilon '-9' '-9' ;}
function comparison-complexd32-equal-relepsilon-1.6   () { ! mmux_complexd32_equal_relepsilon '-9' '-4' ;}

function comparison-complexd32-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='0.1'
    mmux_complexd32_equal_relepsilon '1.0' '1.02'
}
function comparison-complexd32-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='0.1'
    ! mmux_complexd32_equal_relepsilon '1.0' '1.3'
}
function comparison-complexd32-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='0.1'
    ! mmux_complexd32_equal_relepsilon '1.0' '3.0'
}

function comparison-complexd32-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='(0.1)+i*(0.1)'
    mmux_complexd32_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd32-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='(0.1)+i*(0.1)'
    ! mmux_complexd32_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd32-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD32='(0.1)+i*(0.1)'
    ! mmux_complexd32_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexd64

if test -v mmux_complexd64_SIZEOF
then

function comparison-complexd64-equal-1.1         () {   mmux_complexd64_equal '(1.2)+i*(3.4)' ;}
function comparison-complexd64-equal-1.2         () {   mmux_complexd64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd64-equal-1.3         () {   mmux_complexd64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd64-equal-1.4         () { ! mmux_complexd64_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexd64-equal-1.5         () { ! mmux_complexd64_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexd64-equal-absmargin-1.1   () {   mmux_complexd64_equal_absmargin '1.0' ;}
function comparison-complexd64-equal-absmargin-1.2   () {   mmux_complexd64_equal_absmargin '1.0' '1.0' ;}
function comparison-complexd64-equal-absmargin-1.3   () {   mmux_complexd64_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexd64-equal-absmargin-1.4   () { ! mmux_complexd64_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexd64-equal-absmargin-1.5   () {   mmux_complexd64_equal_absmargin '-9' '-9' ;}
function comparison-complexd64-equal-absmargin-1.6   () { ! mmux_complexd64_equal_absmargin '-9' '-4' ;}

function comparison-complexd64-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='0.1'
    mmux_complexd64_equal_absmargin '1.0' '1.02'
}
function comparison-complexd64-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='0.1'
    ! mmux_complexd64_equal_absmargin '1.0' '1.3'
}
function comparison-complexd64-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='1.0'
    ! mmux_complexd64_equal_absmargin '1.0' '3.0'
}

function comparison-complexd64-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='(0.1)+i*(0.1)'
    mmux_complexd64_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd64-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='(0.1)+i*(0.1)'
    ! mmux_complexd64_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd64-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD64='(0.1)+i*(0.1)'
    ! mmux_complexd64_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexd64-equal-relepsilon-1.1   () {   mmux_complexd64_equal_relepsilon '1.0' ;}
function comparison-complexd64-equal-relepsilon-1.2   () {   mmux_complexd64_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexd64-equal-relepsilon-1.3   () {   mmux_complexd64_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexd64-equal-relepsilon-1.4   () { ! mmux_complexd64_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexd64-equal-relepsilon-1.5   () {   mmux_complexd64_equal_relepsilon '-9' '-9' ;}
function comparison-complexd64-equal-relepsilon-1.6   () { ! mmux_complexd64_equal_relepsilon '-9' '-4' ;}

function comparison-complexd64-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='0.1'
    mmux_complexd64_equal_relepsilon '1.0' '1.02'
}
function comparison-complexd64-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='0.1'
    ! mmux_complexd64_equal_relepsilon '1.0' '1.3'
}
function comparison-complexd64-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='0.1'
    ! mmux_complexd64_equal_relepsilon '1.0' '3.0'
}

function comparison-complexd64-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='(0.1)+i*(0.1)'
    mmux_complexd64_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd64-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='(0.1)+i*(0.1)'
    ! mmux_complexd64_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd64-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD64='(0.1)+i*(0.1)'
    ! mmux_complexd64_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### type variables: complexd128

if test -v mmux_complexd128_SIZEOF
then

function comparison-complexd128-equal-1.1         () {   mmux_complexd128_equal '(1.2)+i*(3.4)' ;}
function comparison-complexd128-equal-1.2         () {   mmux_complexd128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd128-equal-1.3         () {   mmux_complexd128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' ;}
function comparison-complexd128-equal-1.4         () { ! mmux_complexd128_equal '(1.2)+i*(3.4)' '(1.2)+i*(9.9)' ;}
function comparison-complexd128-equal-1.5         () { ! mmux_complexd128_equal '(1.2)+i*(3.4)' '(1.2)+i*(3.4)' '(1.2)+i*(9.9)';}

### ------------------------------------------------------------------------

function comparison-complexd128-equal-absmargin-1.1   () {   mmux_complexd128_equal_absmargin '1.0' ;}
function comparison-complexd128-equal-absmargin-1.2   () {   mmux_complexd128_equal_absmargin '1.0' '1.0' ;}
function comparison-complexd128-equal-absmargin-1.3   () {   mmux_complexd128_equal_absmargin '1.0' '1.0' '1.0' ;}
function comparison-complexd128-equal-absmargin-1.4   () { ! mmux_complexd128_equal_absmargin '9' '1.1' '1.0' ;}
function comparison-complexd128-equal-absmargin-1.5   () {   mmux_complexd128_equal_absmargin '-9' '-9' ;}
function comparison-complexd128-equal-absmargin-1.6   () { ! mmux_complexd128_equal_absmargin '-9' '-4' ;}

function comparison-complexd128-equal-absmargin-2.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='0.1'
    mmux_complexd128_equal_absmargin '1.0' '1.02'
}
function comparison-complexd128-equal-absmargin-2.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='0.1'
    ! mmux_complexd128_equal_absmargin '1.0' '1.3'
}
function comparison-complexd128-equal-absmargin-2.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='1.0'
    ! mmux_complexd128_equal_absmargin '1.0' '3.0'
}

function comparison-complexd128-equal-absmargin-3.1 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='(0.1)+i*(0.1)'
    mmux_complexd128_equal_absmargin '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd128-equal-absmargin-3.2 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='(0.1)+i*(0.1)'
    ! mmux_complexd128_equal_absmargin '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd128-equal-absmargin-3.3 () {
    declare -r ABSOLUTE_MARGIN_COMPLEXD128='(0.1)+i*(0.1)'
    ! mmux_complexd128_equal_absmargin '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

### ------------------------------------------------------------------------

function comparison-complexd128-equal-relepsilon-1.1   () {   mmux_complexd128_equal_relepsilon '1.0' ;}
function comparison-complexd128-equal-relepsilon-1.2   () {   mmux_complexd128_equal_relepsilon '1.0' '1.0' ;}
function comparison-complexd128-equal-relepsilon-1.3   () {   mmux_complexd128_equal_relepsilon '1.0' '1.0' '1.0' ;}
function comparison-complexd128-equal-relepsilon-1.4   () { ! mmux_complexd128_equal_relepsilon '9' '1.1' '1.0' ;}
function comparison-complexd128-equal-relepsilon-1.5   () {   mmux_complexd128_equal_relepsilon '-9' '-9' ;}
function comparison-complexd128-equal-relepsilon-1.6   () { ! mmux_complexd128_equal_relepsilon '-9' '-4' ;}

function comparison-complexd128-equal-relepsilon-2.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='0.1'
    mmux_complexd128_equal_relepsilon '1.0' '1.02'
}
function comparison-complexd128-equal-relepsilon-2.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='0.1'
    ! mmux_complexd128_equal_relepsilon '1.0' '1.3'
}
function comparison-complexd128-equal-relepsilon-2.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='0.1'
    ! mmux_complexd128_equal_relepsilon '1.0' '3.0'
}

function comparison-complexd128-equal-relepsilon-3.1 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='(0.1)+i*(0.1)'
    mmux_complexd128_equal_relepsilon '(1.2)+i*(3.4)' '(1.201)+i*(3.401)'
}
function comparison-complexd128-equal-relepsilon-3.2 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='(0.1)+i*(0.1)'
    ! mmux_complexd128_equal_relepsilon '(1.2)+i*(3.4)' '(1.9)+i*(3.4)'
}
function comparison-complexd128-equal-relepsilon-3.3 () {
    declare -r RELATIVE_EPSILON_COMPLEXD128='(0.1)+i*(0.1)'
    ! mmux_complexd128_equal_relepsilon '(1.2)+i*(3.4)' '(1.2)+i*(3.9)'
}

fi


#### let's go

dotest comparison-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
