#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for C language types support
#!# Date: Sep 17, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/types.bash ; less tests/types.log
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

function mbfl_string_is_integer_number () {
    # We want to accept an empty parameter and return unsuccessfully when given.
    mbfl_optional_parameter(ADDRESS, 1)
    local -r REX='^[+-]?[0-9]+$'

    if [[ $ADDRESS =~ $REX ]]
    then return 0
    else return 1
    fi
}

dotest-set-debug


#### tests for real numbers

for STEM in "${MMUX_BASH_POINTERS_REAL_STEMS[@]}"
do
    UPPER_STEM=$(mbfl_string_toupper WW(STEM))

    eval "if test -v mmux_libc_SIZEOF_${UPPER_STEM} ; then
function types-sizeof-${STEM}-1.1 () {
    dotest-debug mmux_libc_SIZEOF_${UPPER_STEM}=\"\$mmux_libc_SIZEOF_${UPPER_STEM}\"
    test -v mmux_libc_SIZEOF_${UPPER_STEM} && mmux_string_is_uint \"\$mmux_libc_SIZEOF_${UPPER_STEM}\"
}
function types-maximum-${STEM}-1.2 () {
    dotest-debug mmux_libc_MAX_${UPPER_STEM}=\\\"\$mmux_libc_MAX_${UPPER_STEM}\\\"
    test -v mmux_libc_MAX_${UPPER_STEM} && mmux_string_is_${STEM} \"\$mmux_libc_MAX_${UPPER_STEM}\"
}
function types-maximum-${STEM}-1.3 () {
    dotest-debug mmux_libc_MIN_${UPPER_STEM}=\\\"\$mmux_libc_MIN_${UPPER_STEM}\\\"
    test -v mmux_libc_MIN_${UPPER_STEM} && mmux_string_is_${STEM} \"\$mmux_libc_MIN_${UPPER_STEM}\"
}
fi"
done


#### tests for complex numbers

for STEM in "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}"
do
    UPPER_STEM=$(mbfl_string_toupper WW(STEM))

    eval "if test -v mmux_libc_SIZEOF_${UPPER_STEM} ; then
function types-sizeof-${STEM}-1.1 () {
    dotest-debug mmux_libc_SIZEOF_${UPPER_STEM}=\"\$mmux_libc_SIZEOF_${UPPER_STEM}\"
    test -v mmux_libc_SIZEOF_${UPPER_STEM} && mmux_string_is_uint \"\$mmux_libc_SIZEOF_${UPPER_STEM}\"
}
fi"
done


#### let's go

function types-unload-library () {
    mmux_bash_pointers_library_unload
}

dotest types-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
