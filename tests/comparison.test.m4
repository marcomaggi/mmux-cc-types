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

source "$MMUX_LIBRARY"


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

function comparison-pointer-lesser-1.1        ()  {   mmux_pointer_lesser '0x900'		      ;}
function comparison-pointer-lesser-1.2        ()  {   mmux_pointer_lesser '0x800' '0x900'	      ;}
function comparison-pointer-lesser-1.3        ()  {   mmux_pointer_lesser '0x700' '0x800' '0x900'     ;}
function comparison-pointer-lesser-1.4        ()  { ! mmux_pointer_lesser '0x333' '0x111' 	      ;}
function comparison-pointer-lesser-1.5        ()  { ! mmux_pointer_lesser '0x333' '0x999' '0x555'     ;}
function comparison-pointer-lesser-1.6        ()  { ! mmux_pointer_lesser '0x111' '0x111' 	      ;}

### ------------------------------------------------------------------------

function comparison-pointer-greater-equal-1.1 () {   mmux_pointer_greater_equal '0x900'			      ;}
function comparison-pointer-greater-equal-1.2 () {   mmux_pointer_greater_equal '0x900' '0x800'		      ;}
function comparison-pointer-greater-equal-1.3 () {   mmux_pointer_greater_equal '0x900' '0x800' '0x700'	      ;}
function comparison-pointer-greater-equal-1.4 () { ! mmux_pointer_greater_equal '0x111' '0x333' 	      ;}
function comparison-pointer-greater-equal-1.5 () { ! mmux_pointer_greater_equal '0x999' '0x333' '0x555'	      ;}
function comparison-pointer-greater-equal-1.6 () {   mmux_pointer_greater_equal '0x111' '0x111' 	      ;}

### ------------------------------------------------------------------------

function comparison-pointer-lesser-equal-1.1  () {   mmux_pointer_lesser_equal '0x900'			      ;}
function comparison-pointer-lesser-equal-1.2  () {   mmux_pointer_lesser_equal '0x800' '0x900'		      ;}
function comparison-pointer-lesser-equal-1.3  () {   mmux_pointer_lesser_equal '0x700' '0x800' '0x900'	      ;}
function comparison-pointer-lesser-equal-1.4  () { ! mmux_pointer_lesser_equal '0x333' '0x111'		      ;}
function comparison-pointer-lesser-equal-1.5  () { ! mmux_pointer_lesser_equal '0x333' '0x999' '0x555'	      ;}
function comparison-pointer-lesser-equal-1.6  () {   mmux_pointer_lesser_equal '0x111' '0x111'		      ;}


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

function comparison-schar-lesser-1.1        ()  {   mmux_schar_lesser '90' ;}
function comparison-schar-lesser-1.2        ()  {   mmux_schar_lesser '80' '90' ;}
function comparison-schar-lesser-1.3        ()  {   mmux_schar_lesser '70' '80' '90' ;}
function comparison-schar-lesser-1.4        ()  { ! mmux_schar_lesser '33' '11' ;}
function comparison-schar-lesser-1.5        ()  { ! mmux_schar_lesser '33' '99' '55' ;}
function comparison-schar-lesser-1.6        ()  { ! mmux_schar_lesser '11' '11' ;}
function comparison-schar-lesser-1.7        ()  { ! mmux_schar_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-schar-greater-equal-1.1 () {   mmux_schar_greater_equal '90' ;}
function comparison-schar-greater-equal-1.2 () {   mmux_schar_greater_equal '90' '80' ;}
function comparison-schar-greater-equal-1.3 () {   mmux_schar_greater_equal '90' '80' '70' ;}
function comparison-schar-greater-equal-1.4 () { ! mmux_schar_greater_equal '11' '33' ;}
function comparison-schar-greater-equal-1.5 () { ! mmux_schar_greater_equal '99' '33' '55' ;}
function comparison-schar-greater-equal-1.6 () {   mmux_schar_greater_equal '11' '11' ;}
function comparison-schar-greater-equal-1.7 () {   mmux_schar_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-schar-lesser-equal-1.1  () {   mmux_schar_lesser_equal '90' ;}
function comparison-schar-lesser-equal-1.2  () {   mmux_schar_lesser_equal '80' '90' ;}
function comparison-schar-lesser-equal-1.3  () {   mmux_schar_lesser_equal '70' '80' '90' ;}
function comparison-schar-lesser-equal-1.4  () { ! mmux_schar_lesser_equal '33' '11' ;}
function comparison-schar-lesser-equal-1.5  () { ! mmux_schar_lesser_equal '33' '99' '55' ;}
function comparison-schar-lesser-equal-1.6  () {   mmux_schar_lesser_equal '11' '11' ;}
function comparison-schar-lesser-equal-1.7  () {   mmux_schar_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uchar-lesser-1.1        ()  {   mmux_uchar_lesser '90' ;}
function comparison-uchar-lesser-1.2        ()  {   mmux_uchar_lesser '80' '90' ;}
function comparison-uchar-lesser-1.3        ()  {   mmux_uchar_lesser '70' '80' '90' ;}
function comparison-uchar-lesser-1.4        ()  { ! mmux_uchar_lesser '33' '11' ;}
function comparison-uchar-lesser-1.5        ()  { ! mmux_uchar_lesser '33' '99' '55' ;}
function comparison-uchar-lesser-1.6        ()  { ! mmux_uchar_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uchar-greater-equal-1.1 () {   mmux_uchar_greater_equal '90' ;}
function comparison-uchar-greater-equal-1.2 () {   mmux_uchar_greater_equal '90' '80' ;}
function comparison-uchar-greater-equal-1.3 () {   mmux_uchar_greater_equal '90' '80' '70' ;}
function comparison-uchar-greater-equal-1.4 () { ! mmux_uchar_greater_equal '11' '33' ;}
function comparison-uchar-greater-equal-1.5 () { ! mmux_uchar_greater_equal '99' '33' '55' ;}
function comparison-uchar-greater-equal-1.6 () {   mmux_uchar_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uchar-lesser-equal-1.1  () {   mmux_uchar_lesser_equal '90' ;}
function comparison-uchar-lesser-equal-1.2  () {   mmux_uchar_lesser_equal '80' '90' ;}
function comparison-uchar-lesser-equal-1.3  () {   mmux_uchar_lesser_equal '70' '80' '90' ;}
function comparison-uchar-lesser-equal-1.4  () { ! mmux_uchar_lesser_equal '33' '11' ;}
function comparison-uchar-lesser-equal-1.5  () { ! mmux_uchar_lesser_equal '33' '99' '55' ;}
function comparison-uchar-lesser-equal-1.6  () {   mmux_uchar_lesser_equal '11' '11' ;}


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

function comparison-sshort-lesser-1.1        ()  {   mmux_sshort_lesser '90' ;}
function comparison-sshort-lesser-1.2        ()  {   mmux_sshort_lesser '80' '90' ;}
function comparison-sshort-lesser-1.3        ()  {   mmux_sshort_lesser '70' '80' '90' ;}
function comparison-sshort-lesser-1.4        ()  { ! mmux_sshort_lesser '33' '11' ;}
function comparison-sshort-lesser-1.5        ()  { ! mmux_sshort_lesser '33' '99' '55' ;}
function comparison-sshort-lesser-1.6        ()  { ! mmux_sshort_lesser '11' '11' ;}
function comparison-sshort-lesser-1.7        ()  { ! mmux_sshort_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sshort-greater-equal-1.1 () {   mmux_sshort_greater_equal '90' ;}
function comparison-sshort-greater-equal-1.2 () {   mmux_sshort_greater_equal '90' '80' ;}
function comparison-sshort-greater-equal-1.3 () {   mmux_sshort_greater_equal '90' '80' '70' ;}
function comparison-sshort-greater-equal-1.4 () { ! mmux_sshort_greater_equal '11' '33' ;}
function comparison-sshort-greater-equal-1.5 () { ! mmux_sshort_greater_equal '99' '33' '55' ;}
function comparison-sshort-greater-equal-1.6 () {   mmux_sshort_greater_equal '11' '11' ;}
function comparison-sshort-greater-equal-1.7 () {   mmux_sshort_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sshort-lesser-equal-1.1  () {   mmux_sshort_lesser_equal '90' ;}
function comparison-sshort-lesser-equal-1.2  () {   mmux_sshort_lesser_equal '80' '90' ;}
function comparison-sshort-lesser-equal-1.3  () {   mmux_sshort_lesser_equal '70' '80' '90' ;}
function comparison-sshort-lesser-equal-1.4  () { ! mmux_sshort_lesser_equal '33' '11' ;}
function comparison-sshort-lesser-equal-1.5  () { ! mmux_sshort_lesser_equal '33' '99' '55' ;}
function comparison-sshort-lesser-equal-1.6  () {   mmux_sshort_lesser_equal '11' '11' ;}
function comparison-sshort-lesser-equal-1.7  () {   mmux_sshort_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-ushort-lesser-1.1        ()  {   mmux_ushort_lesser '90' ;}
function comparison-ushort-lesser-1.2        ()  {   mmux_ushort_lesser '80' '90' ;}
function comparison-ushort-lesser-1.3        ()  {   mmux_ushort_lesser '70' '80' '90' ;}
function comparison-ushort-lesser-1.4        ()  { ! mmux_ushort_lesser '33' '11' ;}
function comparison-ushort-lesser-1.5        ()  { ! mmux_ushort_lesser '33' '99' '55' ;}
function comparison-ushort-lesser-1.6        ()  { ! mmux_ushort_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ushort-greater-equal-1.1 () {   mmux_ushort_greater_equal '90' ;}
function comparison-ushort-greater-equal-1.2 () {   mmux_ushort_greater_equal '90' '80' ;}
function comparison-ushort-greater-equal-1.3 () {   mmux_ushort_greater_equal '90' '80' '70' ;}
function comparison-ushort-greater-equal-1.4 () { ! mmux_ushort_greater_equal '11' '33' ;}
function comparison-ushort-greater-equal-1.5 () { ! mmux_ushort_greater_equal '99' '33' '55' ;}
function comparison-ushort-greater-equal-1.6 () {   mmux_ushort_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ushort-lesser-equal-1.1  () {   mmux_ushort_lesser_equal '90' ;}
function comparison-ushort-lesser-equal-1.2  () {   mmux_ushort_lesser_equal '80' '90' ;}
function comparison-ushort-lesser-equal-1.3  () {   mmux_ushort_lesser_equal '70' '80' '90' ;}
function comparison-ushort-lesser-equal-1.4  () { ! mmux_ushort_lesser_equal '33' '11' ;}
function comparison-ushort-lesser-equal-1.5  () { ! mmux_ushort_lesser_equal '33' '99' '55' ;}
function comparison-ushort-lesser-equal-1.6  () {   mmux_ushort_lesser_equal '11' '11' ;}


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

function comparison-sint-lesser-1.1        ()  {   mmux_sint_lesser '90' ;}
function comparison-sint-lesser-1.2        ()  {   mmux_sint_lesser '80' '90' ;}
function comparison-sint-lesser-1.3        ()  {   mmux_sint_lesser '70' '80' '90' ;}
function comparison-sint-lesser-1.4        ()  { ! mmux_sint_lesser '33' '11' ;}
function comparison-sint-lesser-1.5        ()  { ! mmux_sint_lesser '33' '99' '55' ;}
function comparison-sint-lesser-1.6        ()  { ! mmux_sint_lesser '11' '11' ;}
function comparison-sint-lesser-1.7        ()  { ! mmux_sint_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint-greater-equal-1.1 () {   mmux_sint_greater_equal '90' ;}
function comparison-sint-greater-equal-1.2 () {   mmux_sint_greater_equal '90' '80' ;}
function comparison-sint-greater-equal-1.3 () {   mmux_sint_greater_equal '90' '80' '70' ;}
function comparison-sint-greater-equal-1.4 () { ! mmux_sint_greater_equal '11' '33' ;}
function comparison-sint-greater-equal-1.5 () { ! mmux_sint_greater_equal '99' '33' '55' ;}
function comparison-sint-greater-equal-1.6 () {   mmux_sint_greater_equal '11' '11' ;}
function comparison-sint-greater-equal-1.7 () {   mmux_sint_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint-lesser-equal-1.1  () {   mmux_sint_lesser_equal '90' ;}
function comparison-sint-lesser-equal-1.2  () {   mmux_sint_lesser_equal '80' '90' ;}
function comparison-sint-lesser-equal-1.3  () {   mmux_sint_lesser_equal '70' '80' '90' ;}
function comparison-sint-lesser-equal-1.4  () { ! mmux_sint_lesser_equal '33' '11' ;}
function comparison-sint-lesser-equal-1.5  () { ! mmux_sint_lesser_equal '33' '99' '55' ;}
function comparison-sint-lesser-equal-1.6  () {   mmux_sint_lesser_equal '11' '11' ;}
function comparison-sint-lesser-equal-1.7  () {   mmux_sint_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uint-lesser-1.1        ()  {   mmux_uint_lesser '90' ;}
function comparison-uint-lesser-1.2        ()  {   mmux_uint_lesser '80' '90' ;}
function comparison-uint-lesser-1.3        ()  {   mmux_uint_lesser '70' '80' '90' ;}
function comparison-uint-lesser-1.4        ()  { ! mmux_uint_lesser '33' '11' ;}
function comparison-uint-lesser-1.5        ()  { ! mmux_uint_lesser '33' '99' '55' ;}
function comparison-uint-lesser-1.6        ()  { ! mmux_uint_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint-greater-equal-1.1 () {   mmux_uint_greater_equal '90' ;}
function comparison-uint-greater-equal-1.2 () {   mmux_uint_greater_equal '90' '80' ;}
function comparison-uint-greater-equal-1.3 () {   mmux_uint_greater_equal '90' '80' '70' ;}
function comparison-uint-greater-equal-1.4 () { ! mmux_uint_greater_equal '11' '33' ;}
function comparison-uint-greater-equal-1.5 () { ! mmux_uint_greater_equal '99' '33' '55' ;}
function comparison-uint-greater-equal-1.6 () {   mmux_uint_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint-lesser-equal-1.1  () {   mmux_uint_lesser_equal '90' ;}
function comparison-uint-lesser-equal-1.2  () {   mmux_uint_lesser_equal '80' '90' ;}
function comparison-uint-lesser-equal-1.3  () {   mmux_uint_lesser_equal '70' '80' '90' ;}
function comparison-uint-lesser-equal-1.4  () { ! mmux_uint_lesser_equal '33' '11' ;}
function comparison-uint-lesser-equal-1.5  () { ! mmux_uint_lesser_equal '33' '99' '55' ;}
function comparison-uint-lesser-equal-1.6  () {   mmux_uint_lesser_equal '11' '11' ;}


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

function comparison-slong-lesser-1.1        ()  {   mmux_slong_lesser '90' ;}
function comparison-slong-lesser-1.2        ()  {   mmux_slong_lesser '80' '90' ;}
function comparison-slong-lesser-1.3        ()  {   mmux_slong_lesser '70' '80' '90' ;}
function comparison-slong-lesser-1.4        ()  { ! mmux_slong_lesser '33' '11' ;}
function comparison-slong-lesser-1.5        ()  { ! mmux_slong_lesser '33' '99' '55' ;}
function comparison-slong-lesser-1.6        ()  { ! mmux_slong_lesser '11' '11' ;}
function comparison-slong-lesser-1.7        ()  { ! mmux_slong_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-slong-greater-equal-1.1 () {   mmux_slong_greater_equal '90' ;}
function comparison-slong-greater-equal-1.2 () {   mmux_slong_greater_equal '90' '80' ;}
function comparison-slong-greater-equal-1.3 () {   mmux_slong_greater_equal '90' '80' '70' ;}
function comparison-slong-greater-equal-1.4 () { ! mmux_slong_greater_equal '11' '33' ;}
function comparison-slong-greater-equal-1.5 () { ! mmux_slong_greater_equal '99' '33' '55' ;}
function comparison-slong-greater-equal-1.6 () {   mmux_slong_greater_equal '11' '11' ;}
function comparison-slong-greater-equal-1.7 () {   mmux_slong_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-slong-lesser-equal-1.1  () {   mmux_slong_lesser_equal '90' ;}
function comparison-slong-lesser-equal-1.2  () {   mmux_slong_lesser_equal '80' '90' ;}
function comparison-slong-lesser-equal-1.3  () {   mmux_slong_lesser_equal '70' '80' '90' ;}
function comparison-slong-lesser-equal-1.4  () { ! mmux_slong_lesser_equal '33' '11' ;}
function comparison-slong-lesser-equal-1.5  () { ! mmux_slong_lesser_equal '33' '99' '55' ;}
function comparison-slong-lesser-equal-1.6  () {   mmux_slong_lesser_equal '11' '11' ;}
function comparison-slong-lesser-equal-1.7  () {   mmux_slong_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-ulong-lesser-1.1        ()  {   mmux_ulong_lesser '90' ;}
function comparison-ulong-lesser-1.2        ()  {   mmux_ulong_lesser '80' '90' ;}
function comparison-ulong-lesser-1.3        ()  {   mmux_ulong_lesser '70' '80' '90' ;}
function comparison-ulong-lesser-1.4        ()  { ! mmux_ulong_lesser '33' '11' ;}
function comparison-ulong-lesser-1.5        ()  { ! mmux_ulong_lesser '33' '99' '55' ;}
function comparison-ulong-lesser-1.6        ()  { ! mmux_ulong_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ulong-greater-equal-1.1 () {   mmux_ulong_greater_equal '90' ;}
function comparison-ulong-greater-equal-1.2 () {   mmux_ulong_greater_equal '90' '80' ;}
function comparison-ulong-greater-equal-1.3 () {   mmux_ulong_greater_equal '90' '80' '70' ;}
function comparison-ulong-greater-equal-1.4 () { ! mmux_ulong_greater_equal '11' '33' ;}
function comparison-ulong-greater-equal-1.5 () { ! mmux_ulong_greater_equal '99' '33' '55' ;}
function comparison-ulong-greater-equal-1.6 () {   mmux_ulong_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ulong-lesser-equal-1.1  () {   mmux_ulong_lesser_equal '90' ;}
function comparison-ulong-lesser-equal-1.2  () {   mmux_ulong_lesser_equal '80' '90' ;}
function comparison-ulong-lesser-equal-1.3  () {   mmux_ulong_lesser_equal '70' '80' '90' ;}
function comparison-ulong-lesser-equal-1.4  () { ! mmux_ulong_lesser_equal '33' '11' ;}
function comparison-ulong-lesser-equal-1.5  () { ! mmux_ulong_lesser_equal '33' '99' '55' ;}
function comparison-ulong-lesser-equal-1.6  () {   mmux_ulong_lesser_equal '11' '11' ;}


#### type variables: sllong

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

function comparison-sllong-lesser-1.1        ()  {   mmux_sllong_lesser '90' ;}
function comparison-sllong-lesser-1.2        ()  {   mmux_sllong_lesser '80' '90' ;}
function comparison-sllong-lesser-1.3        ()  {   mmux_sllong_lesser '70' '80' '90' ;}
function comparison-sllong-lesser-1.4        ()  { ! mmux_sllong_lesser '33' '11' ;}
function comparison-sllong-lesser-1.5        ()  { ! mmux_sllong_lesser '33' '99' '55' ;}
function comparison-sllong-lesser-1.6        ()  { ! mmux_sllong_lesser '11' '11' ;}
function comparison-sllong-lesser-1.7        ()  { ! mmux_sllong_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sllong-greater-equal-1.1 () {   mmux_sllong_greater_equal '90' ;}
function comparison-sllong-greater-equal-1.2 () {   mmux_sllong_greater_equal '90' '80' ;}
function comparison-sllong-greater-equal-1.3 () {   mmux_sllong_greater_equal '90' '80' '70' ;}
function comparison-sllong-greater-equal-1.4 () { ! mmux_sllong_greater_equal '11' '33' ;}
function comparison-sllong-greater-equal-1.5 () { ! mmux_sllong_greater_equal '99' '33' '55' ;}
function comparison-sllong-greater-equal-1.6 () {   mmux_sllong_greater_equal '11' '11' ;}
function comparison-sllong-greater-equal-1.7 () {   mmux_sllong_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sllong-lesser-equal-1.1  () {   mmux_sllong_lesser_equal '90' ;}
function comparison-sllong-lesser-equal-1.2  () {   mmux_sllong_lesser_equal '80' '90' ;}
function comparison-sllong-lesser-equal-1.3  () {   mmux_sllong_lesser_equal '70' '80' '90' ;}
function comparison-sllong-lesser-equal-1.4  () { ! mmux_sllong_lesser_equal '33' '11' ;}
function comparison-sllong-lesser-equal-1.5  () { ! mmux_sllong_lesser_equal '33' '99' '55' ;}
function comparison-sllong-lesser-equal-1.6  () {   mmux_sllong_lesser_equal '11' '11' ;}
function comparison-sllong-lesser-equal-1.7  () {   mmux_sllong_lesser_equal '-33' '-22' '-22' ;}


#### type variables: ullong

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

function comparison-ullong-lesser-1.1        ()  {   mmux_ullong_lesser '90' ;}
function comparison-ullong-lesser-1.2        ()  {   mmux_ullong_lesser '80' '90' ;}
function comparison-ullong-lesser-1.3        ()  {   mmux_ullong_lesser '70' '80' '90' ;}
function comparison-ullong-lesser-1.4        ()  { ! mmux_ullong_lesser '33' '11' ;}
function comparison-ullong-lesser-1.5        ()  { ! mmux_ullong_lesser '33' '99' '55' ;}
function comparison-ullong-lesser-1.6        ()  { ! mmux_ullong_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ullong-greater-equal-1.1 () {   mmux_ullong_greater_equal '90' ;}
function comparison-ullong-greater-equal-1.2 () {   mmux_ullong_greater_equal '90' '80' ;}
function comparison-ullong-greater-equal-1.3 () {   mmux_ullong_greater_equal '90' '80' '70' ;}
function comparison-ullong-greater-equal-1.4 () { ! mmux_ullong_greater_equal '11' '33' ;}
function comparison-ullong-greater-equal-1.5 () { ! mmux_ullong_greater_equal '99' '33' '55' ;}
function comparison-ullong-greater-equal-1.6 () {   mmux_ullong_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-ullong-lesser-equal-1.1  () {   mmux_ullong_lesser_equal '90' ;}
function comparison-ullong-lesser-equal-1.2  () {   mmux_ullong_lesser_equal '80' '90' ;}
function comparison-ullong-lesser-equal-1.3  () {   mmux_ullong_lesser_equal '70' '80' '90' ;}
function comparison-ullong-lesser-equal-1.4  () { ! mmux_ullong_lesser_equal '33' '11' ;}
function comparison-ullong-lesser-equal-1.5  () { ! mmux_ullong_lesser_equal '33' '99' '55' ;}
function comparison-ullong-lesser-equal-1.6  () {   mmux_ullong_lesser_equal '11' '11' ;}


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

function comparison-sint8-lesser-1.1        ()  {   mmux_sint8_lesser '90' ;}
function comparison-sint8-lesser-1.2        ()  {   mmux_sint8_lesser '80' '90' ;}
function comparison-sint8-lesser-1.3        ()  {   mmux_sint8_lesser '70' '80' '90' ;}
function comparison-sint8-lesser-1.4        ()  { ! mmux_sint8_lesser '33' '11' ;}
function comparison-sint8-lesser-1.5        ()  { ! mmux_sint8_lesser '33' '99' '55' ;}
function comparison-sint8-lesser-1.6        ()  { ! mmux_sint8_lesser '11' '11' ;}
function comparison-sint8-lesser-1.7        ()  { ! mmux_sint8_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint8-greater-equal-1.1 () {   mmux_sint8_greater_equal '90' ;}
function comparison-sint8-greater-equal-1.2 () {   mmux_sint8_greater_equal '90' '80' ;}
function comparison-sint8-greater-equal-1.3 () {   mmux_sint8_greater_equal '90' '80' '70' ;}
function comparison-sint8-greater-equal-1.4 () { ! mmux_sint8_greater_equal '11' '33' ;}
function comparison-sint8-greater-equal-1.5 () { ! mmux_sint8_greater_equal '99' '33' '55' ;}
function comparison-sint8-greater-equal-1.6 () {   mmux_sint8_greater_equal '11' '11' ;}
function comparison-sint8-greater-equal-1.7 () {   mmux_sint8_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint8-lesser-equal-1.1  () {   mmux_sint8_lesser_equal '90' ;}
function comparison-sint8-lesser-equal-1.2  () {   mmux_sint8_lesser_equal '80' '90' ;}
function comparison-sint8-lesser-equal-1.3  () {   mmux_sint8_lesser_equal '70' '80' '90' ;}
function comparison-sint8-lesser-equal-1.4  () { ! mmux_sint8_lesser_equal '33' '11' ;}
function comparison-sint8-lesser-equal-1.5  () { ! mmux_sint8_lesser_equal '33' '99' '55' ;}
function comparison-sint8-lesser-equal-1.6  () {   mmux_sint8_lesser_equal '11' '11' ;}
function comparison-sint8-lesser-equal-1.7  () {   mmux_sint8_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uint8-lesser-1.1        ()  {   mmux_uint8_lesser '90' ;}
function comparison-uint8-lesser-1.2        ()  {   mmux_uint8_lesser '80' '90' ;}
function comparison-uint8-lesser-1.3        ()  {   mmux_uint8_lesser '70' '80' '90' ;}
function comparison-uint8-lesser-1.4        ()  { ! mmux_uint8_lesser '33' '11' ;}
function comparison-uint8-lesser-1.5        ()  { ! mmux_uint8_lesser '33' '99' '55' ;}
function comparison-uint8-lesser-1.6        ()  { ! mmux_uint8_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint8-greater-equal-1.1 () {   mmux_uint8_greater_equal '90' ;}
function comparison-uint8-greater-equal-1.2 () {   mmux_uint8_greater_equal '90' '80' ;}
function comparison-uint8-greater-equal-1.3 () {   mmux_uint8_greater_equal '90' '80' '70' ;}
function comparison-uint8-greater-equal-1.4 () { ! mmux_uint8_greater_equal '11' '33' ;}
function comparison-uint8-greater-equal-1.5 () { ! mmux_uint8_greater_equal '99' '33' '55' ;}
function comparison-uint8-greater-equal-1.6 () {   mmux_uint8_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint8-lesser-equal-1.1  () {   mmux_uint8_lesser_equal '90' ;}
function comparison-uint8-lesser-equal-1.2  () {   mmux_uint8_lesser_equal '80' '90' ;}
function comparison-uint8-lesser-equal-1.3  () {   mmux_uint8_lesser_equal '70' '80' '90' ;}
function comparison-uint8-lesser-equal-1.4  () { ! mmux_uint8_lesser_equal '33' '11' ;}
function comparison-uint8-lesser-equal-1.5  () { ! mmux_uint8_lesser_equal '33' '99' '55' ;}
function comparison-uint8-lesser-equal-1.6  () {   mmux_uint8_lesser_equal '11' '11' ;}


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

function comparison-sint16-lesser-1.1        ()  {   mmux_sint16_lesser '90' ;}
function comparison-sint16-lesser-1.2        ()  {   mmux_sint16_lesser '80' '90' ;}
function comparison-sint16-lesser-1.3        ()  {   mmux_sint16_lesser '70' '80' '90' ;}
function comparison-sint16-lesser-1.4        ()  { ! mmux_sint16_lesser '33' '11' ;}
function comparison-sint16-lesser-1.5        ()  { ! mmux_sint16_lesser '33' '99' '55' ;}
function comparison-sint16-lesser-1.6        ()  { ! mmux_sint16_lesser '11' '11' ;}
function comparison-sint16-lesser-1.7        ()  { ! mmux_sint16_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint16-greater-equal-1.1 () {   mmux_sint16_greater_equal '90' ;}
function comparison-sint16-greater-equal-1.2 () {   mmux_sint16_greater_equal '90' '80' ;}
function comparison-sint16-greater-equal-1.3 () {   mmux_sint16_greater_equal '90' '80' '70' ;}
function comparison-sint16-greater-equal-1.4 () { ! mmux_sint16_greater_equal '11' '33' ;}
function comparison-sint16-greater-equal-1.5 () { ! mmux_sint16_greater_equal '99' '33' '55' ;}
function comparison-sint16-greater-equal-1.6 () {   mmux_sint16_greater_equal '11' '11' ;}
function comparison-sint16-greater-equal-1.7 () {   mmux_sint16_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint16-lesser-equal-1.1  () {   mmux_sint16_lesser_equal '90' ;}
function comparison-sint16-lesser-equal-1.2  () {   mmux_sint16_lesser_equal '80' '90' ;}
function comparison-sint16-lesser-equal-1.3  () {   mmux_sint16_lesser_equal '70' '80' '90' ;}
function comparison-sint16-lesser-equal-1.4  () { ! mmux_sint16_lesser_equal '33' '11' ;}
function comparison-sint16-lesser-equal-1.5  () { ! mmux_sint16_lesser_equal '33' '99' '55' ;}
function comparison-sint16-lesser-equal-1.6  () {   mmux_sint16_lesser_equal '11' '11' ;}
function comparison-sint16-lesser-equal-1.7  () {   mmux_sint16_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uint16-lesser-1.1        ()  {   mmux_uint16_lesser '90' ;}
function comparison-uint16-lesser-1.2        ()  {   mmux_uint16_lesser '80' '90' ;}
function comparison-uint16-lesser-1.3        ()  {   mmux_uint16_lesser '70' '80' '90' ;}
function comparison-uint16-lesser-1.4        ()  { ! mmux_uint16_lesser '33' '11' ;}
function comparison-uint16-lesser-1.5        ()  { ! mmux_uint16_lesser '33' '99' '55' ;}
function comparison-uint16-lesser-1.6        ()  { ! mmux_uint16_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint16-greater-equal-1.1 () {   mmux_uint16_greater_equal '90' ;}
function comparison-uint16-greater-equal-1.2 () {   mmux_uint16_greater_equal '90' '80' ;}
function comparison-uint16-greater-equal-1.3 () {   mmux_uint16_greater_equal '90' '80' '70' ;}
function comparison-uint16-greater-equal-1.4 () { ! mmux_uint16_greater_equal '11' '33' ;}
function comparison-uint16-greater-equal-1.5 () { ! mmux_uint16_greater_equal '99' '33' '55' ;}
function comparison-uint16-greater-equal-1.6 () {   mmux_uint16_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint16-lesser-equal-1.1  () {   mmux_uint16_lesser_equal '90' ;}
function comparison-uint16-lesser-equal-1.2  () {   mmux_uint16_lesser_equal '80' '90' ;}
function comparison-uint16-lesser-equal-1.3  () {   mmux_uint16_lesser_equal '70' '80' '90' ;}
function comparison-uint16-lesser-equal-1.4  () { ! mmux_uint16_lesser_equal '33' '11' ;}
function comparison-uint16-lesser-equal-1.5  () { ! mmux_uint16_lesser_equal '33' '99' '55' ;}
function comparison-uint16-lesser-equal-1.6  () {   mmux_uint16_lesser_equal '11' '11' ;}


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

function comparison-sint32-lesser-1.1        ()  {   mmux_sint32_lesser '90' ;}
function comparison-sint32-lesser-1.2        ()  {   mmux_sint32_lesser '80' '90' ;}
function comparison-sint32-lesser-1.3        ()  {   mmux_sint32_lesser '70' '80' '90' ;}
function comparison-sint32-lesser-1.4        ()  { ! mmux_sint32_lesser '33' '11' ;}
function comparison-sint32-lesser-1.5        ()  { ! mmux_sint32_lesser '33' '99' '55' ;}
function comparison-sint32-lesser-1.6        ()  { ! mmux_sint32_lesser '11' '11' ;}
function comparison-sint32-lesser-1.7        ()  { ! mmux_sint32_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint32-greater-equal-1.1 () {   mmux_sint32_greater_equal '90' ;}
function comparison-sint32-greater-equal-1.2 () {   mmux_sint32_greater_equal '90' '80' ;}
function comparison-sint32-greater-equal-1.3 () {   mmux_sint32_greater_equal '90' '80' '70' ;}
function comparison-sint32-greater-equal-1.4 () { ! mmux_sint32_greater_equal '11' '33' ;}
function comparison-sint32-greater-equal-1.5 () { ! mmux_sint32_greater_equal '99' '33' '55' ;}
function comparison-sint32-greater-equal-1.6 () {   mmux_sint32_greater_equal '11' '11' ;}
function comparison-sint32-greater-equal-1.7 () {   mmux_sint32_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint32-lesser-equal-1.1  () {   mmux_sint32_lesser_equal '90' ;}
function comparison-sint32-lesser-equal-1.2  () {   mmux_sint32_lesser_equal '80' '90' ;}
function comparison-sint32-lesser-equal-1.3  () {   mmux_sint32_lesser_equal '70' '80' '90' ;}
function comparison-sint32-lesser-equal-1.4  () { ! mmux_sint32_lesser_equal '33' '11' ;}
function comparison-sint32-lesser-equal-1.5  () { ! mmux_sint32_lesser_equal '33' '99' '55' ;}
function comparison-sint32-lesser-equal-1.6  () {   mmux_sint32_lesser_equal '11' '11' ;}
function comparison-sint32-lesser-equal-1.7  () {   mmux_sint32_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uint32-lesser-1.1        ()  {   mmux_uint32_lesser '90' ;}
function comparison-uint32-lesser-1.2        ()  {   mmux_uint32_lesser '80' '90' ;}
function comparison-uint32-lesser-1.3        ()  {   mmux_uint32_lesser '70' '80' '90' ;}
function comparison-uint32-lesser-1.4        ()  { ! mmux_uint32_lesser '33' '11' ;}
function comparison-uint32-lesser-1.5        ()  { ! mmux_uint32_lesser '33' '99' '55' ;}
function comparison-uint32-lesser-1.6        ()  { ! mmux_uint32_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint32-greater-equal-1.1 () {   mmux_uint32_greater_equal '90' ;}
function comparison-uint32-greater-equal-1.2 () {   mmux_uint32_greater_equal '90' '80' ;}
function comparison-uint32-greater-equal-1.3 () {   mmux_uint32_greater_equal '90' '80' '70' ;}
function comparison-uint32-greater-equal-1.4 () { ! mmux_uint32_greater_equal '11' '33' ;}
function comparison-uint32-greater-equal-1.5 () { ! mmux_uint32_greater_equal '99' '33' '55' ;}
function comparison-uint32-greater-equal-1.6 () {   mmux_uint32_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint32-lesser-equal-1.1  () {   mmux_uint32_lesser_equal '90' ;}
function comparison-uint32-lesser-equal-1.2  () {   mmux_uint32_lesser_equal '80' '90' ;}
function comparison-uint32-lesser-equal-1.3  () {   mmux_uint32_lesser_equal '70' '80' '90' ;}
function comparison-uint32-lesser-equal-1.4  () { ! mmux_uint32_lesser_equal '33' '11' ;}
function comparison-uint32-lesser-equal-1.5  () { ! mmux_uint32_lesser_equal '33' '99' '55' ;}
function comparison-uint32-lesser-equal-1.6  () {   mmux_uint32_lesser_equal '11' '11' ;}


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

function comparison-sint64-lesser-1.1        ()  {   mmux_sint64_lesser '90' ;}
function comparison-sint64-lesser-1.2        ()  {   mmux_sint64_lesser '80' '90' ;}
function comparison-sint64-lesser-1.3        ()  {   mmux_sint64_lesser '70' '80' '90' ;}
function comparison-sint64-lesser-1.4        ()  { ! mmux_sint64_lesser '33' '11' ;}
function comparison-sint64-lesser-1.5        ()  { ! mmux_sint64_lesser '33' '99' '55' ;}
function comparison-sint64-lesser-1.6        ()  { ! mmux_sint64_lesser '11' '11' ;}
function comparison-sint64-lesser-1.7        ()  { ! mmux_sint64_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sint64-greater-equal-1.1 () {   mmux_sint64_greater_equal '90' ;}
function comparison-sint64-greater-equal-1.2 () {   mmux_sint64_greater_equal '90' '80' ;}
function comparison-sint64-greater-equal-1.3 () {   mmux_sint64_greater_equal '90' '80' '70' ;}
function comparison-sint64-greater-equal-1.4 () { ! mmux_sint64_greater_equal '11' '33' ;}
function comparison-sint64-greater-equal-1.5 () { ! mmux_sint64_greater_equal '99' '33' '55' ;}
function comparison-sint64-greater-equal-1.6 () {   mmux_sint64_greater_equal '11' '11' ;}
function comparison-sint64-greater-equal-1.7 () {   mmux_sint64_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sint64-lesser-equal-1.1  () {   mmux_sint64_lesser_equal '90' ;}
function comparison-sint64-lesser-equal-1.2  () {   mmux_sint64_lesser_equal '80' '90' ;}
function comparison-sint64-lesser-equal-1.3  () {   mmux_sint64_lesser_equal '70' '80' '90' ;}
function comparison-sint64-lesser-equal-1.4  () { ! mmux_sint64_lesser_equal '33' '11' ;}
function comparison-sint64-lesser-equal-1.5  () { ! mmux_sint64_lesser_equal '33' '99' '55' ;}
function comparison-sint64-lesser-equal-1.6  () {   mmux_sint64_lesser_equal '11' '11' ;}
function comparison-sint64-lesser-equal-1.7  () {   mmux_sint64_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uint64-lesser-1.1        ()  {   mmux_uint64_lesser '90' ;}
function comparison-uint64-lesser-1.2        ()  {   mmux_uint64_lesser '80' '90' ;}
function comparison-uint64-lesser-1.3        ()  {   mmux_uint64_lesser '70' '80' '90' ;}
function comparison-uint64-lesser-1.4        ()  { ! mmux_uint64_lesser '33' '11' ;}
function comparison-uint64-lesser-1.5        ()  { ! mmux_uint64_lesser '33' '99' '55' ;}
function comparison-uint64-lesser-1.6        ()  { ! mmux_uint64_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint64-greater-equal-1.1 () {   mmux_uint64_greater_equal '90' ;}
function comparison-uint64-greater-equal-1.2 () {   mmux_uint64_greater_equal '90' '80' ;}
function comparison-uint64-greater-equal-1.3 () {   mmux_uint64_greater_equal '90' '80' '70' ;}
function comparison-uint64-greater-equal-1.4 () { ! mmux_uint64_greater_equal '11' '33' ;}
function comparison-uint64-greater-equal-1.5 () { ! mmux_uint64_greater_equal '99' '33' '55' ;}
function comparison-uint64-greater-equal-1.6 () {   mmux_uint64_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uint64-lesser-equal-1.1  () {   mmux_uint64_lesser_equal '90' ;}
function comparison-uint64-lesser-equal-1.2  () {   mmux_uint64_lesser_equal '80' '90' ;}
function comparison-uint64-lesser-equal-1.3  () {   mmux_uint64_lesser_equal '70' '80' '90' ;}
function comparison-uint64-lesser-equal-1.4  () { ! mmux_uint64_lesser_equal '33' '11' ;}
function comparison-uint64-lesser-equal-1.5  () { ! mmux_uint64_lesser_equal '33' '99' '55' ;}
function comparison-uint64-lesser-equal-1.6  () {   mmux_uint64_lesser_equal '11' '11' ;}


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

function comparison-sintmax-lesser-1.1        ()  {   mmux_sintmax_lesser '90' ;}
function comparison-sintmax-lesser-1.2        ()  {   mmux_sintmax_lesser '80' '90' ;}
function comparison-sintmax-lesser-1.3        ()  {   mmux_sintmax_lesser '70' '80' '90' ;}
function comparison-sintmax-lesser-1.4        ()  { ! mmux_sintmax_lesser '33' '11' ;}
function comparison-sintmax-lesser-1.5        ()  { ! mmux_sintmax_lesser '33' '99' '55' ;}
function comparison-sintmax-lesser-1.6        ()  { ! mmux_sintmax_lesser '11' '11' ;}
function comparison-sintmax-lesser-1.7        ()  { ! mmux_sintmax_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-greater-equal-1.1 () {   mmux_sintmax_greater_equal '90' ;}
function comparison-sintmax-greater-equal-1.2 () {   mmux_sintmax_greater_equal '90' '80' ;}
function comparison-sintmax-greater-equal-1.3 () {   mmux_sintmax_greater_equal '90' '80' '70' ;}
function comparison-sintmax-greater-equal-1.4 () { ! mmux_sintmax_greater_equal '11' '33' ;}
function comparison-sintmax-greater-equal-1.5 () { ! mmux_sintmax_greater_equal '99' '33' '55' ;}
function comparison-sintmax-greater-equal-1.6 () {   mmux_sintmax_greater_equal '11' '11' ;}
function comparison-sintmax-greater-equal-1.7 () {   mmux_sintmax_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sintmax-lesser-equal-1.1  () {   mmux_sintmax_lesser_equal '90' ;}
function comparison-sintmax-lesser-equal-1.2  () {   mmux_sintmax_lesser_equal '80' '90' ;}
function comparison-sintmax-lesser-equal-1.3  () {   mmux_sintmax_lesser_equal '70' '80' '90' ;}
function comparison-sintmax-lesser-equal-1.4  () { ! mmux_sintmax_lesser_equal '33' '11' ;}
function comparison-sintmax-lesser-equal-1.5  () { ! mmux_sintmax_lesser_equal '33' '99' '55' ;}
function comparison-sintmax-lesser-equal-1.6  () {   mmux_sintmax_lesser_equal '11' '11' ;}
function comparison-sintmax-lesser-equal-1.7  () {   mmux_sintmax_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uintmax-lesser-1.1        ()  {   mmux_uintmax_lesser '90' ;}
function comparison-uintmax-lesser-1.2        ()  {   mmux_uintmax_lesser '80' '90' ;}
function comparison-uintmax-lesser-1.3        ()  {   mmux_uintmax_lesser '70' '80' '90' ;}
function comparison-uintmax-lesser-1.4        ()  { ! mmux_uintmax_lesser '33' '11' ;}
function comparison-uintmax-lesser-1.5        ()  { ! mmux_uintmax_lesser '33' '99' '55' ;}
function comparison-uintmax-lesser-1.6        ()  { ! mmux_uintmax_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-greater-equal-1.1 () {   mmux_uintmax_greater_equal '90' ;}
function comparison-uintmax-greater-equal-1.2 () {   mmux_uintmax_greater_equal '90' '80' ;}
function comparison-uintmax-greater-equal-1.3 () {   mmux_uintmax_greater_equal '90' '80' '70' ;}
function comparison-uintmax-greater-equal-1.4 () { ! mmux_uintmax_greater_equal '11' '33' ;}
function comparison-uintmax-greater-equal-1.5 () { ! mmux_uintmax_greater_equal '99' '33' '55' ;}
function comparison-uintmax-greater-equal-1.6 () {   mmux_uintmax_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintmax-lesser-equal-1.1  () {   mmux_uintmax_lesser_equal '90' ;}
function comparison-uintmax-lesser-equal-1.2  () {   mmux_uintmax_lesser_equal '80' '90' ;}
function comparison-uintmax-lesser-equal-1.3  () {   mmux_uintmax_lesser_equal '70' '80' '90' ;}
function comparison-uintmax-lesser-equal-1.4  () { ! mmux_uintmax_lesser_equal '33' '11' ;}
function comparison-uintmax-lesser-equal-1.5  () { ! mmux_uintmax_lesser_equal '33' '99' '55' ;}
function comparison-uintmax-lesser-equal-1.6  () {   mmux_uintmax_lesser_equal '11' '11' ;}


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

function comparison-sintptr-lesser-1.1        ()  {   mmux_sintptr_lesser '90' ;}
function comparison-sintptr-lesser-1.2        ()  {   mmux_sintptr_lesser '80' '90' ;}
function comparison-sintptr-lesser-1.3        ()  {   mmux_sintptr_lesser '70' '80' '90' ;}
function comparison-sintptr-lesser-1.4        ()  { ! mmux_sintptr_lesser '33' '11' ;}
function comparison-sintptr-lesser-1.5        ()  { ! mmux_sintptr_lesser '33' '99' '55' ;}
function comparison-sintptr-lesser-1.6        ()  { ! mmux_sintptr_lesser '11' '11' ;}
function comparison-sintptr-lesser-1.7        ()  { ! mmux_sintptr_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-greater-equal-1.1 () {   mmux_sintptr_greater_equal '90' ;}
function comparison-sintptr-greater-equal-1.2 () {   mmux_sintptr_greater_equal '90' '80' ;}
function comparison-sintptr-greater-equal-1.3 () {   mmux_sintptr_greater_equal '90' '80' '70' ;}
function comparison-sintptr-greater-equal-1.4 () { ! mmux_sintptr_greater_equal '11' '33' ;}
function comparison-sintptr-greater-equal-1.5 () { ! mmux_sintptr_greater_equal '99' '33' '55' ;}
function comparison-sintptr-greater-equal-1.6 () {   mmux_sintptr_greater_equal '11' '11' ;}
function comparison-sintptr-greater-equal-1.7 () {   mmux_sintptr_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-sintptr-lesser-equal-1.1  () {   mmux_sintptr_lesser_equal '90' ;}
function comparison-sintptr-lesser-equal-1.2  () {   mmux_sintptr_lesser_equal '80' '90' ;}
function comparison-sintptr-lesser-equal-1.3  () {   mmux_sintptr_lesser_equal '70' '80' '90' ;}
function comparison-sintptr-lesser-equal-1.4  () { ! mmux_sintptr_lesser_equal '33' '11' ;}
function comparison-sintptr-lesser-equal-1.5  () { ! mmux_sintptr_lesser_equal '33' '99' '55' ;}
function comparison-sintptr-lesser-equal-1.6  () {   mmux_sintptr_lesser_equal '11' '11' ;}
function comparison-sintptr-lesser-equal-1.7  () {   mmux_sintptr_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uintptr-lesser-1.1        ()  {   mmux_uintptr_lesser '90' ;}
function comparison-uintptr-lesser-1.2        ()  {   mmux_uintptr_lesser '80' '90' ;}
function comparison-uintptr-lesser-1.3        ()  {   mmux_uintptr_lesser '70' '80' '90' ;}
function comparison-uintptr-lesser-1.4        ()  { ! mmux_uintptr_lesser '33' '11' ;}
function comparison-uintptr-lesser-1.5        ()  { ! mmux_uintptr_lesser '33' '99' '55' ;}
function comparison-uintptr-lesser-1.6        ()  { ! mmux_uintptr_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-greater-equal-1.1 () {   mmux_uintptr_greater_equal '90' ;}
function comparison-uintptr-greater-equal-1.2 () {   mmux_uintptr_greater_equal '90' '80' ;}
function comparison-uintptr-greater-equal-1.3 () {   mmux_uintptr_greater_equal '90' '80' '70' ;}
function comparison-uintptr-greater-equal-1.4 () { ! mmux_uintptr_greater_equal '11' '33' ;}
function comparison-uintptr-greater-equal-1.5 () { ! mmux_uintptr_greater_equal '99' '33' '55' ;}
function comparison-uintptr-greater-equal-1.6 () {   mmux_uintptr_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uintptr-lesser-equal-1.1  () {   mmux_uintptr_lesser_equal '90' ;}
function comparison-uintptr-lesser-equal-1.2  () {   mmux_uintptr_lesser_equal '80' '90' ;}
function comparison-uintptr-lesser-equal-1.3  () {   mmux_uintptr_lesser_equal '70' '80' '90' ;}
function comparison-uintptr-lesser-equal-1.4  () { ! mmux_uintptr_lesser_equal '33' '11' ;}
function comparison-uintptr-lesser-equal-1.5  () { ! mmux_uintptr_lesser_equal '33' '99' '55' ;}
function comparison-uintptr-lesser-equal-1.6  () {   mmux_uintptr_lesser_equal '11' '11' ;}


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

function comparison-ssize-lesser-1.1        ()  {   mmux_ssize_lesser '90' ;}
function comparison-ssize-lesser-1.2        ()  {   mmux_ssize_lesser '80' '90' ;}
function comparison-ssize-lesser-1.3        ()  {   mmux_ssize_lesser '70' '80' '90' ;}
function comparison-ssize-lesser-1.4        ()  { ! mmux_ssize_lesser '33' '11' ;}
function comparison-ssize-lesser-1.5        ()  { ! mmux_ssize_lesser '33' '99' '55' ;}
function comparison-ssize-lesser-1.6        ()  { ! mmux_ssize_lesser '11' '11' ;}
function comparison-ssize-lesser-1.7        ()  { ! mmux_ssize_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ssize-greater-equal-1.1 () {   mmux_ssize_greater_equal '90' ;}
function comparison-ssize-greater-equal-1.2 () {   mmux_ssize_greater_equal '90' '80' ;}
function comparison-ssize-greater-equal-1.3 () {   mmux_ssize_greater_equal '90' '80' '70' ;}
function comparison-ssize-greater-equal-1.4 () { ! mmux_ssize_greater_equal '11' '33' ;}
function comparison-ssize-greater-equal-1.5 () { ! mmux_ssize_greater_equal '99' '33' '55' ;}
function comparison-ssize-greater-equal-1.6 () {   mmux_ssize_greater_equal '11' '11' ;}
function comparison-ssize-greater-equal-1.7 () {   mmux_ssize_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-ssize-lesser-equal-1.1  () {   mmux_ssize_lesser_equal '90' ;}
function comparison-ssize-lesser-equal-1.2  () {   mmux_ssize_lesser_equal '80' '90' ;}
function comparison-ssize-lesser-equal-1.3  () {   mmux_ssize_lesser_equal '70' '80' '90' ;}
function comparison-ssize-lesser-equal-1.4  () { ! mmux_ssize_lesser_equal '33' '11' ;}
function comparison-ssize-lesser-equal-1.5  () { ! mmux_ssize_lesser_equal '33' '99' '55' ;}
function comparison-ssize-lesser-equal-1.6  () {   mmux_ssize_lesser_equal '11' '11' ;}
function comparison-ssize-lesser-equal-1.7  () {   mmux_ssize_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-usize-lesser-1.1        ()  {   mmux_usize_lesser '90' ;}
function comparison-usize-lesser-1.2        ()  {   mmux_usize_lesser '80' '90' ;}
function comparison-usize-lesser-1.3        ()  {   mmux_usize_lesser '70' '80' '90' ;}
function comparison-usize-lesser-1.4        ()  { ! mmux_usize_lesser '33' '11' ;}
function comparison-usize-lesser-1.5        ()  { ! mmux_usize_lesser '33' '99' '55' ;}
function comparison-usize-lesser-1.6        ()  { ! mmux_usize_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-usize-greater-equal-1.1 () {   mmux_usize_greater_equal '90' ;}
function comparison-usize-greater-equal-1.2 () {   mmux_usize_greater_equal '90' '80' ;}
function comparison-usize-greater-equal-1.3 () {   mmux_usize_greater_equal '90' '80' '70' ;}
function comparison-usize-greater-equal-1.4 () { ! mmux_usize_greater_equal '11' '33' ;}
function comparison-usize-greater-equal-1.5 () { ! mmux_usize_greater_equal '99' '33' '55' ;}
function comparison-usize-greater-equal-1.6 () {   mmux_usize_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-usize-lesser-equal-1.1  () {   mmux_usize_lesser_equal '90' ;}
function comparison-usize-lesser-equal-1.2  () {   mmux_usize_lesser_equal '80' '90' ;}
function comparison-usize-lesser-equal-1.3  () {   mmux_usize_lesser_equal '70' '80' '90' ;}
function comparison-usize-lesser-equal-1.4  () { ! mmux_usize_lesser_equal '33' '11' ;}
function comparison-usize-lesser-equal-1.5  () { ! mmux_usize_lesser_equal '33' '99' '55' ;}
function comparison-usize-lesser-equal-1.6  () {   mmux_usize_lesser_equal '11' '11' ;}


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

function comparison-ptrdiff-lesser-1.1        ()  {   mmux_ptrdiff_lesser '90' ;}
function comparison-ptrdiff-lesser-1.2        ()  {   mmux_ptrdiff_lesser '80' '90' ;}
function comparison-ptrdiff-lesser-1.3        ()  {   mmux_ptrdiff_lesser '70' '80' '90' ;}
function comparison-ptrdiff-lesser-1.4        ()  { ! mmux_ptrdiff_lesser '33' '11' ;}
function comparison-ptrdiff-lesser-1.5        ()  { ! mmux_ptrdiff_lesser '33' '99' '55' ;}
function comparison-ptrdiff-lesser-1.6        ()  { ! mmux_ptrdiff_lesser '11' '11' ;}
function comparison-ptrdiff-lesser-1.7        ()  { ! mmux_ptrdiff_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-greater-equal-1.1 () {   mmux_ptrdiff_greater_equal '90' ;}
function comparison-ptrdiff-greater-equal-1.2 () {   mmux_ptrdiff_greater_equal '90' '80' ;}
function comparison-ptrdiff-greater-equal-1.3 () {   mmux_ptrdiff_greater_equal '90' '80' '70' ;}
function comparison-ptrdiff-greater-equal-1.4 () { ! mmux_ptrdiff_greater_equal '11' '33' ;}
function comparison-ptrdiff-greater-equal-1.5 () { ! mmux_ptrdiff_greater_equal '99' '33' '55' ;}
function comparison-ptrdiff-greater-equal-1.6 () {   mmux_ptrdiff_greater_equal '11' '11' ;}
function comparison-ptrdiff-greater-equal-1.7 () {   mmux_ptrdiff_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-ptrdiff-lesser-equal-1.1  () {   mmux_ptrdiff_lesser_equal '90' ;}
function comparison-ptrdiff-lesser-equal-1.2  () {   mmux_ptrdiff_lesser_equal '80' '90' ;}
function comparison-ptrdiff-lesser-equal-1.3  () {   mmux_ptrdiff_lesser_equal '70' '80' '90' ;}
function comparison-ptrdiff-lesser-equal-1.4  () { ! mmux_ptrdiff_lesser_equal '33' '11' ;}
function comparison-ptrdiff-lesser-equal-1.5  () { ! mmux_ptrdiff_lesser_equal '33' '99' '55' ;}
function comparison-ptrdiff-lesser-equal-1.6  () {   mmux_ptrdiff_lesser_equal '11' '11' ;}
function comparison-ptrdiff-lesser-equal-1.7  () {   mmux_ptrdiff_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-off-lesser-1.1        ()  {   mmux_off_lesser '90' ;}
function comparison-off-lesser-1.2        ()  {   mmux_off_lesser '80' '90' ;}
function comparison-off-lesser-1.3        ()  {   mmux_off_lesser '70' '80' '90' ;}
function comparison-off-lesser-1.4        ()  { ! mmux_off_lesser '33' '11' ;}
function comparison-off-lesser-1.5        ()  { ! mmux_off_lesser '33' '99' '55' ;}
function comparison-off-lesser-1.6        ()  { ! mmux_off_lesser '11' '11' ;}
function comparison-off-lesser-1.7        ()  { ! mmux_off_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-off-greater-equal-1.1 () {   mmux_off_greater_equal '90' ;}
function comparison-off-greater-equal-1.2 () {   mmux_off_greater_equal '90' '80' ;}
function comparison-off-greater-equal-1.3 () {   mmux_off_greater_equal '90' '80' '70' ;}
function comparison-off-greater-equal-1.4 () { ! mmux_off_greater_equal '11' '33' ;}
function comparison-off-greater-equal-1.5 () { ! mmux_off_greater_equal '99' '33' '55' ;}
function comparison-off-greater-equal-1.6 () {   mmux_off_greater_equal '11' '11' ;}
function comparison-off-greater-equal-1.7 () {   mmux_off_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-off-lesser-equal-1.1  () {   mmux_off_lesser_equal '90' ;}
function comparison-off-lesser-equal-1.2  () {   mmux_off_lesser_equal '80' '90' ;}
function comparison-off-lesser-equal-1.3  () {   mmux_off_lesser_equal '70' '80' '90' ;}
function comparison-off-lesser-equal-1.4  () { ! mmux_off_lesser_equal '33' '11' ;}
function comparison-off-lesser-equal-1.5  () { ! mmux_off_lesser_equal '33' '99' '55' ;}
function comparison-off-lesser-equal-1.6  () {   mmux_off_lesser_equal '11' '11' ;}
function comparison-off-lesser-equal-1.7  () {   mmux_off_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-mode-lesser-1.1        ()  {   mmux_mode_lesser '90' ;}
function comparison-mode-lesser-1.2        ()  {   mmux_mode_lesser '80' '90' ;}
function comparison-mode-lesser-1.3        ()  {   mmux_mode_lesser '70' '80' '90' ;}
function comparison-mode-lesser-1.4        ()  { ! mmux_mode_lesser '33' '11' ;}
function comparison-mode-lesser-1.5        ()  { ! mmux_mode_lesser '33' '99' '55' ;}
function comparison-mode-lesser-1.6        ()  { ! mmux_mode_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-mode-greater-equal-1.1 () {   mmux_mode_greater_equal '90' ;}
function comparison-mode-greater-equal-1.2 () {   mmux_mode_greater_equal '90' '80' ;}
function comparison-mode-greater-equal-1.3 () {   mmux_mode_greater_equal '90' '80' '70' ;}
function comparison-mode-greater-equal-1.4 () { ! mmux_mode_greater_equal '11' '33' ;}
function comparison-mode-greater-equal-1.5 () { ! mmux_mode_greater_equal '99' '33' '55' ;}
function comparison-mode-greater-equal-1.6 () {   mmux_mode_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-mode-lesser-equal-1.1  () {   mmux_mode_lesser_equal '90' ;}
function comparison-mode-lesser-equal-1.2  () {   mmux_mode_lesser_equal '80' '90' ;}
function comparison-mode-lesser-equal-1.3  () {   mmux_mode_lesser_equal '70' '80' '90' ;}
function comparison-mode-lesser-equal-1.4  () { ! mmux_mode_lesser_equal '33' '11' ;}
function comparison-mode-lesser-equal-1.5  () { ! mmux_mode_lesser_equal '33' '99' '55' ;}
function comparison-mode-lesser-equal-1.6  () {   mmux_mode_lesser_equal '11' '11' ;}


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

function comparison-pid-lesser-1.1        ()  {   mmux_pid_lesser '90' ;}
function comparison-pid-lesser-1.2        ()  {   mmux_pid_lesser '80' '90' ;}
function comparison-pid-lesser-1.3        ()  {   mmux_pid_lesser '70' '80' '90' ;}
function comparison-pid-lesser-1.4        ()  { ! mmux_pid_lesser '33' '11' ;}
function comparison-pid-lesser-1.5        ()  { ! mmux_pid_lesser '33' '99' '55' ;}
function comparison-pid-lesser-1.6        ()  { ! mmux_pid_lesser '11' '11' ;}
function comparison-pid-lesser-1.7        ()  { ! mmux_pid_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-pid-greater-equal-1.1 () {   mmux_pid_greater_equal '90' ;}
function comparison-pid-greater-equal-1.2 () {   mmux_pid_greater_equal '90' '80' ;}
function comparison-pid-greater-equal-1.3 () {   mmux_pid_greater_equal '90' '80' '70' ;}
function comparison-pid-greater-equal-1.4 () { ! mmux_pid_greater_equal '11' '33' ;}
function comparison-pid-greater-equal-1.5 () { ! mmux_pid_greater_equal '99' '33' '55' ;}
function comparison-pid-greater-equal-1.6 () {   mmux_pid_greater_equal '11' '11' ;}
function comparison-pid-greater-equal-1.7 () {   mmux_pid_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-pid-lesser-equal-1.1  () {   mmux_pid_lesser_equal '90' ;}
function comparison-pid-lesser-equal-1.2  () {   mmux_pid_lesser_equal '80' '90' ;}
function comparison-pid-lesser-equal-1.3  () {   mmux_pid_lesser_equal '70' '80' '90' ;}
function comparison-pid-lesser-equal-1.4  () { ! mmux_pid_lesser_equal '33' '11' ;}
function comparison-pid-lesser-equal-1.5  () { ! mmux_pid_lesser_equal '33' '99' '55' ;}
function comparison-pid-lesser-equal-1.6  () {   mmux_pid_lesser_equal '11' '11' ;}
function comparison-pid-lesser-equal-1.7  () {   mmux_pid_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-uid-lesser-1.1        ()  {   mmux_uid_lesser '90' ;}
function comparison-uid-lesser-1.2        ()  {   mmux_uid_lesser '80' '90' ;}
function comparison-uid-lesser-1.3        ()  {   mmux_uid_lesser '70' '80' '90' ;}
function comparison-uid-lesser-1.4        ()  { ! mmux_uid_lesser '33' '11' ;}
function comparison-uid-lesser-1.5        ()  { ! mmux_uid_lesser '33' '99' '55' ;}
function comparison-uid-lesser-1.6        ()  { ! mmux_uid_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uid-greater-equal-1.1 () {   mmux_uid_greater_equal '90' ;}
function comparison-uid-greater-equal-1.2 () {   mmux_uid_greater_equal '90' '80' ;}
function comparison-uid-greater-equal-1.3 () {   mmux_uid_greater_equal '90' '80' '70' ;}
function comparison-uid-greater-equal-1.4 () { ! mmux_uid_greater_equal '11' '33' ;}
function comparison-uid-greater-equal-1.5 () { ! mmux_uid_greater_equal '99' '33' '55' ;}
function comparison-uid-greater-equal-1.6 () {   mmux_uid_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-uid-lesser-equal-1.1  () {   mmux_uid_lesser_equal '90' ;}
function comparison-uid-lesser-equal-1.2  () {   mmux_uid_lesser_equal '80' '90' ;}
function comparison-uid-lesser-equal-1.3  () {   mmux_uid_lesser_equal '70' '80' '90' ;}
function comparison-uid-lesser-equal-1.4  () { ! mmux_uid_lesser_equal '33' '11' ;}
function comparison-uid-lesser-equal-1.5  () { ! mmux_uid_lesser_equal '33' '99' '55' ;}
function comparison-uid-lesser-equal-1.6  () {   mmux_uid_lesser_equal '11' '11' ;}


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

function comparison-gid-lesser-1.1        ()  {   mmux_gid_lesser '90' ;}
function comparison-gid-lesser-1.2        ()  {   mmux_gid_lesser '80' '90' ;}
function comparison-gid-lesser-1.3        ()  {   mmux_gid_lesser '70' '80' '90' ;}
function comparison-gid-lesser-1.4        ()  { ! mmux_gid_lesser '33' '11' ;}
function comparison-gid-lesser-1.5        ()  { ! mmux_gid_lesser '33' '99' '55' ;}
function comparison-gid-lesser-1.6        ()  { ! mmux_gid_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-gid-greater-equal-1.1 () {   mmux_gid_greater_equal '90' ;}
function comparison-gid-greater-equal-1.2 () {   mmux_gid_greater_equal '90' '80' ;}
function comparison-gid-greater-equal-1.3 () {   mmux_gid_greater_equal '90' '80' '70' ;}
function comparison-gid-greater-equal-1.4 () { ! mmux_gid_greater_equal '11' '33' ;}
function comparison-gid-greater-equal-1.5 () { ! mmux_gid_greater_equal '99' '33' '55' ;}
function comparison-gid-greater-equal-1.6 () {   mmux_gid_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-gid-lesser-equal-1.1  () {   mmux_gid_lesser_equal '90' ;}
function comparison-gid-lesser-equal-1.2  () {   mmux_gid_lesser_equal '80' '90' ;}
function comparison-gid-lesser-equal-1.3  () {   mmux_gid_lesser_equal '70' '80' '90' ;}
function comparison-gid-lesser-equal-1.4  () { ! mmux_gid_lesser_equal '33' '11' ;}
function comparison-gid-lesser-equal-1.5  () { ! mmux_gid_lesser_equal '33' '99' '55' ;}
function comparison-gid-lesser-equal-1.6  () {   mmux_gid_lesser_equal '11' '11' ;}


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

function comparison-wchar-lesser-1.1        ()  {   mmux_wchar_lesser '90' ;}
function comparison-wchar-lesser-1.2        ()  {   mmux_wchar_lesser '80' '90' ;}
function comparison-wchar-lesser-1.3        ()  {   mmux_wchar_lesser '70' '80' '90' ;}
function comparison-wchar-lesser-1.4        ()  { ! mmux_wchar_lesser '33' '11' ;}
function comparison-wchar-lesser-1.5        ()  { ! mmux_wchar_lesser '33' '99' '55' ;}
function comparison-wchar-lesser-1.6        ()  { ! mmux_wchar_lesser '11' '11' ;}
function comparison-wchar-lesser-1.7        ()  { ! mmux_wchar_lesser '-11' '-22' ;}

### ------------------------------------------------------------------------

function comparison-wchar-greater-equal-1.1 () {   mmux_wchar_greater_equal '90' ;}
function comparison-wchar-greater-equal-1.2 () {   mmux_wchar_greater_equal '90' '80' ;}
function comparison-wchar-greater-equal-1.3 () {   mmux_wchar_greater_equal '90' '80' '70' ;}
function comparison-wchar-greater-equal-1.4 () { ! mmux_wchar_greater_equal '11' '33' ;}
function comparison-wchar-greater-equal-1.5 () { ! mmux_wchar_greater_equal '99' '33' '55' ;}
function comparison-wchar-greater-equal-1.6 () {   mmux_wchar_greater_equal '11' '11' ;}
function comparison-wchar-greater-equal-1.7 () {   mmux_wchar_greater_equal '-22' '-33' '-33' ;}

### ------------------------------------------------------------------------

function comparison-wchar-lesser-equal-1.1  () {   mmux_wchar_lesser_equal '90' ;}
function comparison-wchar-lesser-equal-1.2  () {   mmux_wchar_lesser_equal '80' '90' ;}
function comparison-wchar-lesser-equal-1.3  () {   mmux_wchar_lesser_equal '70' '80' '90' ;}
function comparison-wchar-lesser-equal-1.4  () { ! mmux_wchar_lesser_equal '33' '11' ;}
function comparison-wchar-lesser-equal-1.5  () { ! mmux_wchar_lesser_equal '33' '99' '55' ;}
function comparison-wchar-lesser-equal-1.6  () {   mmux_wchar_lesser_equal '11' '11' ;}
function comparison-wchar-lesser-equal-1.7  () {   mmux_wchar_lesser_equal '-33' '-22' '-22' ;}


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

function comparison-wint-lesser-1.1        ()  {   mmux_wint_lesser '90' ;}
function comparison-wint-lesser-1.2        ()  {   mmux_wint_lesser '80' '90' ;}
function comparison-wint-lesser-1.3        ()  {   mmux_wint_lesser '70' '80' '90' ;}
function comparison-wint-lesser-1.4        ()  { ! mmux_wint_lesser '33' '11' ;}
function comparison-wint-lesser-1.5        ()  { ! mmux_wint_lesser '33' '99' '55' ;}
function comparison-wint-lesser-1.6        ()  { ! mmux_wint_lesser '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-wint-greater-equal-1.1 () {   mmux_wint_greater_equal '90' ;}
function comparison-wint-greater-equal-1.2 () {   mmux_wint_greater_equal '90' '80' ;}
function comparison-wint-greater-equal-1.3 () {   mmux_wint_greater_equal '90' '80' '70' ;}
function comparison-wint-greater-equal-1.4 () { ! mmux_wint_greater_equal '11' '33' ;}
function comparison-wint-greater-equal-1.5 () { ! mmux_wint_greater_equal '99' '33' '55' ;}
function comparison-wint-greater-equal-1.6 () {   mmux_wint_greater_equal '11' '11' ;}

### ------------------------------------------------------------------------

function comparison-wint-lesser-equal-1.1  () {   mmux_wint_lesser_equal '90' ;}
function comparison-wint-lesser-equal-1.2  () {   mmux_wint_lesser_equal '80' '90' ;}
function comparison-wint-lesser-equal-1.3  () {   mmux_wint_lesser_equal '70' '80' '90' ;}
function comparison-wint-lesser-equal-1.4  () { ! mmux_wint_lesser_equal '33' '11' ;}
function comparison-wint-lesser-equal-1.5  () { ! mmux_wint_lesser_equal '33' '99' '55' ;}
function comparison-wint-lesser-equal-1.6  () {   mmux_wint_lesser_equal '11' '11' ;}


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

function comparison-float-lesser-1.1        ()  {   mmux_float_lesser '9.0' ;}
function comparison-float-lesser-1.2        ()  {   mmux_float_lesser '8.0' '9.0' ;}
function comparison-float-lesser-1.3        ()  {   mmux_float_lesser '7.0' '8.0' '9.0' ;}
function comparison-float-lesser-1.4        ()  { ! mmux_float_lesser '3.3' '1.1' ;}
function comparison-float-lesser-1.5        ()  { ! mmux_float_lesser '3.3' '9.9' '5.5' ;}
function comparison-float-lesser-1.6        ()  { ! mmux_float_lesser '1.1' '1.1' ;}
function comparison-float-lesser-1.7        ()  { ! mmux_float_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float-greater-equal-1.1 () {   mmux_float_greater_equal '9.0' ;}
function comparison-float-greater-equal-1.2 () {   mmux_float_greater_equal '9.0' '8.0' ;}
function comparison-float-greater-equal-1.3 () {   mmux_float_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float-greater-equal-1.4 () { ! mmux_float_greater_equal '1.1' '3.3' ;}
function comparison-float-greater-equal-1.5 () { ! mmux_float_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float-greater-equal-1.6 () {   mmux_float_greater_equal '1.1' '1.1' ;}
function comparison-float-greater-equal-1.7 () {   mmux_float_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float-lesser-equal-1.1  () {   mmux_float_lesser_equal '9.0' ;}
function comparison-float-lesser-equal-1.2  () {   mmux_float_lesser_equal '8.0' '9.0' ;}
function comparison-float-lesser-equal-1.3  () {   mmux_float_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float-lesser-equal-1.4  () { ! mmux_float_lesser_equal '3.3' '1.1' ;}
function comparison-float-lesser-equal-1.5  () { ! mmux_float_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float-lesser-equal-1.6  () {   mmux_float_lesser_equal '1.1' '1.1' ;}
function comparison-float-lesser-equal-1.7  () {   mmux_float_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-double-lesser-1.1        ()  {   mmux_double_lesser '9.0' ;}
function comparison-double-lesser-1.2        ()  {   mmux_double_lesser '8.0' '9.0' ;}
function comparison-double-lesser-1.3        ()  {   mmux_double_lesser '7.0' '8.0' '9.0' ;}
function comparison-double-lesser-1.4        ()  { ! mmux_double_lesser '3.3' '1.1' ;}
function comparison-double-lesser-1.5        ()  { ! mmux_double_lesser '3.3' '9.9' '5.5' ;}
function comparison-double-lesser-1.6        ()  { ! mmux_double_lesser '1.1' '1.1' ;}
function comparison-double-lesser-1.7        ()  { ! mmux_double_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-double-greater-equal-1.1 () {   mmux_double_greater_equal '9.0' ;}
function comparison-double-greater-equal-1.2 () {   mmux_double_greater_equal '9.0' '8.0' ;}
function comparison-double-greater-equal-1.3 () {   mmux_double_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-double-greater-equal-1.4 () { ! mmux_double_greater_equal '1.1' '3.3' ;}
function comparison-double-greater-equal-1.5 () { ! mmux_double_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-double-greater-equal-1.6 () {   mmux_double_greater_equal '1.1' '1.1' ;}
function comparison-double-greater-equal-1.7 () {   mmux_double_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-double-lesser-equal-1.1  () {   mmux_double_lesser_equal '9.0' ;}
function comparison-double-lesser-equal-1.2  () {   mmux_double_lesser_equal '8.0' '9.0' ;}
function comparison-double-lesser-equal-1.3  () {   mmux_double_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-double-lesser-equal-1.4  () { ! mmux_double_lesser_equal '3.3' '1.1' ;}
function comparison-double-lesser-equal-1.5  () { ! mmux_double_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-double-lesser-equal-1.6  () {   mmux_double_lesser_equal '1.1' '1.1' ;}
function comparison-double-lesser-equal-1.7  () {   mmux_double_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-ldouble-lesser-1.1        ()  {   mmux_ldouble_lesser '9.0' ;}
function comparison-ldouble-lesser-1.2        ()  {   mmux_ldouble_lesser '8.0' '9.0' ;}
function comparison-ldouble-lesser-1.3        ()  {   mmux_ldouble_lesser '7.0' '8.0' '9.0' ;}
function comparison-ldouble-lesser-1.4        ()  { ! mmux_ldouble_lesser '3.3' '1.1' ;}
function comparison-ldouble-lesser-1.5        ()  { ! mmux_ldouble_lesser '3.3' '9.9' '5.5' ;}
function comparison-ldouble-lesser-1.6        ()  { ! mmux_ldouble_lesser '1.1' '1.1' ;}
function comparison-ldouble-lesser-1.7        ()  { ! mmux_ldouble_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-greater-equal-1.1 () {   mmux_ldouble_greater_equal '9.0' ;}
function comparison-ldouble-greater-equal-1.2 () {   mmux_ldouble_greater_equal '9.0' '8.0' ;}
function comparison-ldouble-greater-equal-1.3 () {   mmux_ldouble_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-ldouble-greater-equal-1.4 () { ! mmux_ldouble_greater_equal '1.1' '3.3' ;}
function comparison-ldouble-greater-equal-1.5 () { ! mmux_ldouble_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-ldouble-greater-equal-1.6 () {   mmux_ldouble_greater_equal '1.1' '1.1' ;}
function comparison-ldouble-greater-equal-1.7 () {   mmux_ldouble_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-ldouble-lesser-equal-1.1  () {   mmux_ldouble_lesser_equal '9.0' ;}
function comparison-ldouble-lesser-equal-1.2  () {   mmux_ldouble_lesser_equal '8.0' '9.0' ;}
function comparison-ldouble-lesser-equal-1.3  () {   mmux_ldouble_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-ldouble-lesser-equal-1.4  () { ! mmux_ldouble_lesser_equal '3.3' '1.1' ;}
function comparison-ldouble-lesser-equal-1.5  () { ! mmux_ldouble_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-ldouble-lesser-equal-1.6  () {   mmux_ldouble_lesser_equal '1.1' '1.1' ;}
function comparison-ldouble-lesser-equal-1.7  () {   mmux_ldouble_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float32-lesser-1.1        ()  {   mmux_float32_lesser '9.0' ;}
function comparison-float32-lesser-1.2        ()  {   mmux_float32_lesser '8.0' '9.0' ;}
function comparison-float32-lesser-1.3        ()  {   mmux_float32_lesser '7.0' '8.0' '9.0' ;}
function comparison-float32-lesser-1.4        ()  { ! mmux_float32_lesser '3.3' '1.1' ;}
function comparison-float32-lesser-1.5        ()  { ! mmux_float32_lesser '3.3' '9.9' '5.5' ;}
function comparison-float32-lesser-1.6        ()  { ! mmux_float32_lesser '1.1' '1.1' ;}
function comparison-float32-lesser-1.7        ()  { ! mmux_float32_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32-greater-equal-1.1 () {   mmux_float32_greater_equal '9.0' ;}
function comparison-float32-greater-equal-1.2 () {   mmux_float32_greater_equal '9.0' '8.0' ;}
function comparison-float32-greater-equal-1.3 () {   mmux_float32_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float32-greater-equal-1.4 () { ! mmux_float32_greater_equal '1.1' '3.3' ;}
function comparison-float32-greater-equal-1.5 () { ! mmux_float32_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float32-greater-equal-1.6 () {   mmux_float32_greater_equal '1.1' '1.1' ;}
function comparison-float32-greater-equal-1.7 () {   mmux_float32_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float32-lesser-equal-1.1  () {   mmux_float32_lesser_equal '9.0' ;}
function comparison-float32-lesser-equal-1.2  () {   mmux_float32_lesser_equal '8.0' '9.0' ;}
function comparison-float32-lesser-equal-1.3  () {   mmux_float32_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float32-lesser-equal-1.4  () { ! mmux_float32_lesser_equal '3.3' '1.1' ;}
function comparison-float32-lesser-equal-1.5  () { ! mmux_float32_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float32-lesser-equal-1.6  () {   mmux_float32_lesser_equal '1.1' '1.1' ;}
function comparison-float32-lesser-equal-1.7  () {   mmux_float32_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float64-lesser-1.1        ()  {   mmux_float64_lesser '9.0' ;}
function comparison-float64-lesser-1.2        ()  {   mmux_float64_lesser '8.0' '9.0' ;}
function comparison-float64-lesser-1.3        ()  {   mmux_float64_lesser '7.0' '8.0' '9.0' ;}
function comparison-float64-lesser-1.4        ()  { ! mmux_float64_lesser '3.3' '1.1' ;}
function comparison-float64-lesser-1.5        ()  { ! mmux_float64_lesser '3.3' '9.9' '5.5' ;}
function comparison-float64-lesser-1.6        ()  { ! mmux_float64_lesser '1.1' '1.1' ;}
function comparison-float64-lesser-1.7        ()  { ! mmux_float64_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64-greater-equal-1.1 () {   mmux_float64_greater_equal '9.0' ;}
function comparison-float64-greater-equal-1.2 () {   mmux_float64_greater_equal '9.0' '8.0' ;}
function comparison-float64-greater-equal-1.3 () {   mmux_float64_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float64-greater-equal-1.4 () { ! mmux_float64_greater_equal '1.1' '3.3' ;}
function comparison-float64-greater-equal-1.5 () { ! mmux_float64_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float64-greater-equal-1.6 () {   mmux_float64_greater_equal '1.1' '1.1' ;}
function comparison-float64-greater-equal-1.7 () {   mmux_float64_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float64-lesser-equal-1.1  () {   mmux_float64_lesser_equal '9.0' ;}
function comparison-float64-lesser-equal-1.2  () {   mmux_float64_lesser_equal '8.0' '9.0' ;}
function comparison-float64-lesser-equal-1.3  () {   mmux_float64_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float64-lesser-equal-1.4  () { ! mmux_float64_lesser_equal '3.3' '1.1' ;}
function comparison-float64-lesser-equal-1.5  () { ! mmux_float64_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float64-lesser-equal-1.6  () {   mmux_float64_lesser_equal '1.1' '1.1' ;}
function comparison-float64-lesser-equal-1.7  () {   mmux_float64_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float128-lesser-1.1        ()  {   mmux_float128_lesser '9.0' ;}
function comparison-float128-lesser-1.2        ()  {   mmux_float128_lesser '8.0' '9.0' ;}
function comparison-float128-lesser-1.3        ()  {   mmux_float128_lesser '7.0' '8.0' '9.0' ;}
function comparison-float128-lesser-1.4        ()  { ! mmux_float128_lesser '3.3' '1.1' ;}
function comparison-float128-lesser-1.5        ()  { ! mmux_float128_lesser '3.3' '9.9' '5.5' ;}
function comparison-float128-lesser-1.6        ()  { ! mmux_float128_lesser '1.1' '1.1' ;}
function comparison-float128-lesser-1.7        ()  { ! mmux_float128_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128-greater-equal-1.1 () {   mmux_float128_greater_equal '9.0' ;}
function comparison-float128-greater-equal-1.2 () {   mmux_float128_greater_equal '9.0' '8.0' ;}
function comparison-float128-greater-equal-1.3 () {   mmux_float128_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float128-greater-equal-1.4 () { ! mmux_float128_greater_equal '1.1' '3.3' ;}
function comparison-float128-greater-equal-1.5 () { ! mmux_float128_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float128-greater-equal-1.6 () {   mmux_float128_greater_equal '1.1' '1.1' ;}
function comparison-float128-greater-equal-1.7 () {   mmux_float128_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float128-lesser-equal-1.1  () {   mmux_float128_lesser_equal '9.0' ;}
function comparison-float128-lesser-equal-1.2  () {   mmux_float128_lesser_equal '8.0' '9.0' ;}
function comparison-float128-lesser-equal-1.3  () {   mmux_float128_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float128-lesser-equal-1.4  () { ! mmux_float128_lesser_equal '3.3' '1.1' ;}
function comparison-float128-lesser-equal-1.5  () { ! mmux_float128_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float128-lesser-equal-1.6  () {   mmux_float128_lesser_equal '1.1' '1.1' ;}
function comparison-float128-lesser-equal-1.7  () {   mmux_float128_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float32x-lesser-1.1        ()  {   mmux_float32x_lesser '9.0' ;}
function comparison-float32x-lesser-1.2        ()  {   mmux_float32x_lesser '8.0' '9.0' ;}
function comparison-float32x-lesser-1.3        ()  {   mmux_float32x_lesser '7.0' '8.0' '9.0' ;}
function comparison-float32x-lesser-1.4        ()  { ! mmux_float32x_lesser '3.3' '1.1' ;}
function comparison-float32x-lesser-1.5        ()  { ! mmux_float32x_lesser '3.3' '9.9' '5.5' ;}
function comparison-float32x-lesser-1.6        ()  { ! mmux_float32x_lesser '1.1' '1.1' ;}
function comparison-float32x-lesser-1.7        ()  { ! mmux_float32x_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float32x-greater-equal-1.1 () {   mmux_float32x_greater_equal '9.0' ;}
function comparison-float32x-greater-equal-1.2 () {   mmux_float32x_greater_equal '9.0' '8.0' ;}
function comparison-float32x-greater-equal-1.3 () {   mmux_float32x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float32x-greater-equal-1.4 () { ! mmux_float32x_greater_equal '1.1' '3.3' ;}
function comparison-float32x-greater-equal-1.5 () { ! mmux_float32x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float32x-greater-equal-1.6 () {   mmux_float32x_greater_equal '1.1' '1.1' ;}
function comparison-float32x-greater-equal-1.7 () {   mmux_float32x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float32x-lesser-equal-1.1  () {   mmux_float32x_lesser_equal '9.0' ;}
function comparison-float32x-lesser-equal-1.2  () {   mmux_float32x_lesser_equal '8.0' '9.0' ;}
function comparison-float32x-lesser-equal-1.3  () {   mmux_float32x_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float32x-lesser-equal-1.4  () { ! mmux_float32x_lesser_equal '3.3' '1.1' ;}
function comparison-float32x-lesser-equal-1.5  () { ! mmux_float32x_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float32x-lesser-equal-1.6  () {   mmux_float32x_lesser_equal '1.1' '1.1' ;}
function comparison-float32x-lesser-equal-1.7  () {   mmux_float32x_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float64x-lesser-1.1        ()  {   mmux_float64x_lesser '9.0' ;}
function comparison-float64x-lesser-1.2        ()  {   mmux_float64x_lesser '8.0' '9.0' ;}
function comparison-float64x-lesser-1.3        ()  {   mmux_float64x_lesser '7.0' '8.0' '9.0' ;}
function comparison-float64x-lesser-1.4        ()  { ! mmux_float64x_lesser '3.3' '1.1' ;}
function comparison-float64x-lesser-1.5        ()  { ! mmux_float64x_lesser '3.3' '9.9' '5.5' ;}
function comparison-float64x-lesser-1.6        ()  { ! mmux_float64x_lesser '1.1' '1.1' ;}
function comparison-float64x-lesser-1.7        ()  { ! mmux_float64x_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float64x-greater-equal-1.1 () {   mmux_float64x_greater_equal '9.0' ;}
function comparison-float64x-greater-equal-1.2 () {   mmux_float64x_greater_equal '9.0' '8.0' ;}
function comparison-float64x-greater-equal-1.3 () {   mmux_float64x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float64x-greater-equal-1.4 () { ! mmux_float64x_greater_equal '1.1' '3.3' ;}
function comparison-float64x-greater-equal-1.5 () { ! mmux_float64x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float64x-greater-equal-1.6 () {   mmux_float64x_greater_equal '1.1' '1.1' ;}
function comparison-float64x-greater-equal-1.7 () {   mmux_float64x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float64x-lesser-equal-1.1  () {   mmux_float64x_lesser_equal '9.0' ;}
function comparison-float64x-lesser-equal-1.2  () {   mmux_float64x_lesser_equal '8.0' '9.0' ;}
function comparison-float64x-lesser-equal-1.3  () {   mmux_float64x_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float64x-lesser-equal-1.4  () { ! mmux_float64x_lesser_equal '3.3' '1.1' ;}
function comparison-float64x-lesser-equal-1.5  () { ! mmux_float64x_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float64x-lesser-equal-1.6  () {   mmux_float64x_lesser_equal '1.1' '1.1' ;}
function comparison-float64x-lesser-equal-1.7  () {   mmux_float64x_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-float128x-lesser-1.1        ()  {   mmux_float128x_lesser '9.0' ;}
function comparison-float128x-lesser-1.2        ()  {   mmux_float128x_lesser '8.0' '9.0' ;}
function comparison-float128x-lesser-1.3        ()  {   mmux_float128x_lesser '7.0' '8.0' '9.0' ;}
function comparison-float128x-lesser-1.4        ()  { ! mmux_float128x_lesser '3.3' '1.1' ;}
function comparison-float128x-lesser-1.5        ()  { ! mmux_float128x_lesser '3.3' '9.9' '5.5' ;}
function comparison-float128x-lesser-1.6        ()  { ! mmux_float128x_lesser '1.1' '1.1' ;}
function comparison-float128x-lesser-1.7        ()  { ! mmux_float128x_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-float128x-greater-equal-1.1 () {   mmux_float128x_greater_equal '9.0' ;}
function comparison-float128x-greater-equal-1.2 () {   mmux_float128x_greater_equal '9.0' '8.0' ;}
function comparison-float128x-greater-equal-1.3 () {   mmux_float128x_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-float128x-greater-equal-1.4 () { ! mmux_float128x_greater_equal '1.1' '3.3' ;}
function comparison-float128x-greater-equal-1.5 () { ! mmux_float128x_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-float128x-greater-equal-1.6 () {   mmux_float128x_greater_equal '1.1' '1.1' ;}
function comparison-float128x-greater-equal-1.7 () {   mmux_float128x_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-float128x-lesser-equal-1.1  () {   mmux_float128x_lesser_equal '9.0' ;}
function comparison-float128x-lesser-equal-1.2  () {   mmux_float128x_lesser_equal '8.0' '9.0' ;}
function comparison-float128x-lesser-equal-1.3  () {   mmux_float128x_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-float128x-lesser-equal-1.4  () { ! mmux_float128x_lesser_equal '3.3' '1.1' ;}
function comparison-float128x-lesser-equal-1.5  () { ! mmux_float128x_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-float128x-lesser-equal-1.6  () {   mmux_float128x_lesser_equal '1.1' '1.1' ;}
function comparison-float128x-lesser-equal-1.7  () {   mmux_float128x_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-decimal32-lesser-1.1        ()  {   mmux_decimal32_lesser '9.0' ;}
function comparison-decimal32-lesser-1.2        ()  {   mmux_decimal32_lesser '8.0' '9.0' ;}
function comparison-decimal32-lesser-1.3        ()  {   mmux_decimal32_lesser '7.0' '8.0' '9.0' ;}
function comparison-decimal32-lesser-1.4        ()  { ! mmux_decimal32_lesser '3.3' '1.1' ;}
function comparison-decimal32-lesser-1.5        ()  { ! mmux_decimal32_lesser '3.3' '9.9' '5.5' ;}
function comparison-decimal32-lesser-1.6        ()  { ! mmux_decimal32_lesser '1.1' '1.1' ;}
function comparison-decimal32-lesser-1.7        ()  { ! mmux_decimal32_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-greater-equal-1.1 () {   mmux_decimal32_greater_equal '9.0' ;}
function comparison-decimal32-greater-equal-1.2 () {   mmux_decimal32_greater_equal '9.0' '8.0' ;}
function comparison-decimal32-greater-equal-1.3 () {   mmux_decimal32_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal32-greater-equal-1.4 () { ! mmux_decimal32_greater_equal '1.1' '3.3' ;}
function comparison-decimal32-greater-equal-1.5 () { ! mmux_decimal32_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal32-greater-equal-1.6 () {   mmux_decimal32_greater_equal '1.1' '1.1' ;}
function comparison-decimal32-greater-equal-1.7 () {   mmux_decimal32_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal32-lesser-equal-1.1  () {   mmux_decimal32_lesser_equal '9.0' ;}
function comparison-decimal32-lesser-equal-1.2  () {   mmux_decimal32_lesser_equal '8.0' '9.0' ;}
function comparison-decimal32-lesser-equal-1.3  () {   mmux_decimal32_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal32-lesser-equal-1.4  () { ! mmux_decimal32_lesser_equal '3.3' '1.1' ;}
function comparison-decimal32-lesser-equal-1.5  () { ! mmux_decimal32_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal32-lesser-equal-1.6  () {   mmux_decimal32_lesser_equal '1.1' '1.1' ;}
function comparison-decimal32-lesser-equal-1.7  () {   mmux_decimal32_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-decimal64-lesser-1.1        ()  {   mmux_decimal64_lesser '9.0' ;}
function comparison-decimal64-lesser-1.2        ()  {   mmux_decimal64_lesser '8.0' '9.0' ;}
function comparison-decimal64-lesser-1.3        ()  {   mmux_decimal64_lesser '7.0' '8.0' '9.0' ;}
function comparison-decimal64-lesser-1.4        ()  { ! mmux_decimal64_lesser '3.3' '1.1' ;}
function comparison-decimal64-lesser-1.5        ()  { ! mmux_decimal64_lesser '3.3' '9.9' '5.5' ;}
function comparison-decimal64-lesser-1.6        ()  { ! mmux_decimal64_lesser '1.1' '1.1' ;}
function comparison-decimal64-lesser-1.7        ()  { ! mmux_decimal64_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-greater-equal-1.1 () {   mmux_decimal64_greater_equal '9.0' ;}
function comparison-decimal64-greater-equal-1.2 () {   mmux_decimal64_greater_equal '9.0' '8.0' ;}
function comparison-decimal64-greater-equal-1.3 () {   mmux_decimal64_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal64-greater-equal-1.4 () { ! mmux_decimal64_greater_equal '1.1' '3.3' ;}
function comparison-decimal64-greater-equal-1.5 () { ! mmux_decimal64_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal64-greater-equal-1.6 () {   mmux_decimal64_greater_equal '1.1' '1.1' ;}
function comparison-decimal64-greater-equal-1.7 () {   mmux_decimal64_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal64-lesser-equal-1.1  () {   mmux_decimal64_lesser_equal '9.0' ;}
function comparison-decimal64-lesser-equal-1.2  () {   mmux_decimal64_lesser_equal '8.0' '9.0' ;}
function comparison-decimal64-lesser-equal-1.3  () {   mmux_decimal64_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal64-lesser-equal-1.4  () { ! mmux_decimal64_lesser_equal '3.3' '1.1' ;}
function comparison-decimal64-lesser-equal-1.5  () { ! mmux_decimal64_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal64-lesser-equal-1.6  () {   mmux_decimal64_lesser_equal '1.1' '1.1' ;}
function comparison-decimal64-lesser-equal-1.7  () {   mmux_decimal64_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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

function comparison-decimal128-lesser-1.1        ()  {   mmux_decimal128_lesser '9.0' ;}
function comparison-decimal128-lesser-1.2        ()  {   mmux_decimal128_lesser '8.0' '9.0' ;}
function comparison-decimal128-lesser-1.3        ()  {   mmux_decimal128_lesser '7.0' '8.0' '9.0' ;}
function comparison-decimal128-lesser-1.4        ()  { ! mmux_decimal128_lesser '3.3' '1.1' ;}
function comparison-decimal128-lesser-1.5        ()  { ! mmux_decimal128_lesser '3.3' '9.9' '5.5' ;}
function comparison-decimal128-lesser-1.6        ()  { ! mmux_decimal128_lesser '1.1' '1.1' ;}
function comparison-decimal128-lesser-1.7        ()  { ! mmux_decimal128_lesser '-1.1' '-2.2' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-greater-equal-1.1 () {   mmux_decimal128_greater_equal '9.0' ;}
function comparison-decimal128-greater-equal-1.2 () {   mmux_decimal128_greater_equal '9.0' '8.0' ;}
function comparison-decimal128-greater-equal-1.3 () {   mmux_decimal128_greater_equal '9.0' '8.0' '7.0' ;}
function comparison-decimal128-greater-equal-1.4 () { ! mmux_decimal128_greater_equal '1.1' '3.3' ;}
function comparison-decimal128-greater-equal-1.5 () { ! mmux_decimal128_greater_equal '9.9' '3.3' '5.5' ;}
function comparison-decimal128-greater-equal-1.6 () {   mmux_decimal128_greater_equal '1.1' '1.1' ;}
function comparison-decimal128-greater-equal-1.7 () {   mmux_decimal128_greater_equal '-2.2' '-3.3' '-3.3' ;}

### ------------------------------------------------------------------------

function comparison-decimal128-lesser-equal-1.1  () {   mmux_decimal128_lesser_equal '9.0' ;}
function comparison-decimal128-lesser-equal-1.2  () {   mmux_decimal128_lesser_equal '8.0' '9.0' ;}
function comparison-decimal128-lesser-equal-1.3  () {   mmux_decimal128_lesser_equal '7.0' '8.0' '9.0' ;}
function comparison-decimal128-lesser-equal-1.4  () { ! mmux_decimal128_lesser_equal '3.3' '1.1' ;}
function comparison-decimal128-lesser-equal-1.5  () { ! mmux_decimal128_lesser_equal '3.3' '9.9' '5.5' ;}
function comparison-decimal128-lesser-equal-1.6  () {   mmux_decimal128_lesser_equal '1.1' '1.1' ;}
function comparison-decimal128-lesser-equal-1.7  () {   mmux_decimal128_lesser_equal '-3.3' '-2.2' '-2.2' ;}

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


#### type variables: complexd

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
