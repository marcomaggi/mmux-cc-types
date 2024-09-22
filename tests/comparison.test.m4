#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for comparison builtins
#!# Date: Sep 22, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/comparison.bash ; less tests/comparison.log
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

function comparison-pointer-equal-1.1 () {   mmux_pointer_equal '0x100'			      ;}
function comparison-pointer-equal-1.2 () {   mmux_pointer_equal '0x100' '0x100'		      ;}
function comparison-pointer-equal-1.3 () {   mmux_pointer_equal '0x100' '0x100' '0x100'	      ;}
function comparison-pointer-equal-1.4 () { ! mmux_pointer_equal '0x999' '0x111' '0x102'       ;}

### ------------------------------------------------------------------------

function comparison-pointer-greater-1.1 () {   mmux_pointer_greater '0x900'		      ;}
function comparison-pointer-greater-1.2 () {   mmux_pointer_greater '0x900' '0x800'	      ;}
function comparison-pointer-greater-1.3 () {   mmux_pointer_greater '0x900' '0x800' '0x700'   ;}
function comparison-pointer-greater-1.4 () { ! mmux_pointer_greater '0x111' '0x333' 	      ;}
function comparison-pointer-greater-1.4 () { ! mmux_pointer_greater '0x999' '0x333' '0x555'   ;}


#### let's go

dotest comparison-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
