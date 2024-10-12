#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for C language types support
#!# Date: Sep 17, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/types.test ; less tests/types.log
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

dotest-set-debug


#### tests for real numbers

for STEM in "${MMUX_BASH_POINTERS_REAL_STEMS[@]}"
do
    eval "if test -v mmux_${STEM}_SIZEOF ; then
function types-sizeof-${STEM}-1.1 () {
    dotest-debug mmux_${STEM}_SIZEOF=\"\${mmux_${STEM}_SIZEOF:?}\"
    test -v mmux_${STEM}_SIZEOF && mmux_string_is_uint \"\${mmux_${STEM}_SIZEOF:?}\"
}
function types-maximum-${STEM}-1.2 () {
    dotest-debug mmux_${STEM}_MAX=\\\"\${mmux_${STEM}_MAX:?}\\\"
    test -v mmux_${STEM}_MAX && mmux_string_is_${STEM} \"\${mmux_${STEM}_MAX:?}\"
}
function types-maximum-${STEM}-1.3 () {
    dotest-debug mmux_${STEM}_MIN=\\\"\${mmux_${STEM}_MIN:?}\\\"
    test -v mmux_${STEM}_MIN && mmux_string_is_${STEM} \"\${mmux_${STEM}_MIN:?}\"
}
fi"
done


#### tests for complex numbers

for STEM in "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}"
do
    eval "if test -v mmux_${STEM}_SIZEOF ; then
function types-sizeof-${STEM}-1.1 () {
    dotest-debug mmux_${STEM}_SIZEOF=\"\$mmux_${STEM}_SIZEOF\"
    test -v mmux_${STEM}_SIZEOF && mmux_string_is_uint \"\$mmux_${STEM}_SIZEOF\"
}
fi"
done


#### let's go

function types-unload-library () {
    mmux_package_unload_from_descriptor MMUX_BASH_POINTERS_PACKAGE
}

dotest types-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
