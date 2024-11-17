#
# Part of: MMUX Bash Pointers
# Contents: core library
# Date: Sep  9, 2024
#
# Abstract
#
#	This library  must be  sourced from an  interactive shell  or from a  script.  It  loads the
#	shared library and enables the implemented builtins.
#
#	The Bash builtin "enable" will search the shared library file in the usual places, including
#	the directories from "LD_LIBRARY_PATH".
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU
# General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# General Public License for more details.
#
# You should  have received a copy  of the GNU General  Public License along with  this program.  If
# not, see <http://www.gnu.org/licenses/>.
#

#page
#### package descriptor

mmux_package_require_by_descriptor MMUX_BASH_PACKAGES_PACKAGE 0

declare -gA MMUX_BASH_POINTERS_PACKAGE=([PACKAGING_VERSION]='0'
					[PACKAGE_NAME]='MMUX Bash Pointers'
					[SEMANTIC_VERSION]='mmux_bash_pointers_SEMANTIC_VERSION'
					[INTERFACE_VERSION_CURRENT]='mmux_bash_pointers_VERSION_INTERFACE_CURRENT'
					[INTERFACE_VERSION_REVISION]='mmux_bash_pointers_VERSION_INTERFACE_REVISION'
					[INTERFACE_VERSION_AGE]='mmux_bash_pointers_VERSION_INTERFACE_AGE'
					[SHARED_LIBRARY]='libmmux-bash-pointers.so'
					[SHELL_LIBRARY]='libmmux-bash-pointers.bash'
					[PACKAGE_AFTER_LOADING_HOOK]='mmux_bash_pointers_library_after_loading_hook'
					[PACKAGE_BEFORE_UNLOADING_HOOK]='mmux_bash_pointers_library_before_unloading_hook')

m4_include([[[mmux-bash-pointers-builtin-definitions.bash]]])

#page
#### after loading hook: begin

function mmux_bash_pointers_library_after_loading_hook () {
    declare -ga MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS=(schar sshort sint slong sllong sint8 sint16 sint32 sint64 ssize \
							       sintmax sintptr ptrdiff off uid gid wchar)
    declare -ga MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS=(uchar ushort uint ulong ullong uint8 uint16 uint32 uint64 usize \
								 uintmax uintptr mode pid wint)
    declare -ga MMUX_BASH_POINTERS_INTEGER_STEMS=("${MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS[@]}" \
						      "${MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS[@]}")

    declare -ga MMUX_BASH_POINTERS_REAL_FLOAT_STEMS=(float double ldouble float32 float64 float128 float32x float64x float128x \
							   decimal32 decimal64 decimal128)
    declare -ga MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS=(complexf complexd complexld complexf32 complexf64 complexf128 \
								 complexf32x complexf64x complexf128x \
								 complexd32 complexd64 complexd128)
    declare -ga MMUX_BASH_POINTERS_FLOAT_STEMS=("${MMUX_BASH_POINTERS_REAL_FLOAT_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_REAL_STEMS=('pointer' "${MMUX_BASH_POINTERS_INTEGER_STEMS[@]}" "${MMUX_BASH_POINTERS_REAL_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_COMPLEX_STEMS=("${MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_STEMS=("${MMUX_BASH_POINTERS_REAL_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}")


    mmux_bash_pointers_library_init

#page
#### after loading hook: utilities
#
# NOTE  For reasons  of honest  ignorance on  my part:  I do  not know  why I  have to  define these
# functions after I have loaded  the shared library.  If I do not do it:  an error is raised because
# the "mmux_*_pointer_" builtins are seen as undefined.  (Marco Maggi; Sep 12, 2024)
#

function mmux_index_array_from_memory () {
    declare -rn mmux_p_ARRY=PP(1, target index array name)
    declare -r  mmux_p_POINTER=PP(2, source memory pointer)
    declare -ri mmux_p_NUMBER_OF_OCTETS=PP(3, how many octets to copy)
    declare -i  mmux_p_IDX mmux_p_OCTET

    for ((mmux_p_IDX=0; mmux_p_IDX < mmux_p_NUMBER_OF_OCTETS; ++mmux_p_IDX))
    do
	mmux_uint8_pointer_ref mmux_p_OCTET WW(mmux_p_POINTER) RR(mmux_p_IDX)
	mmux_p_ARRY[RR(mmux_p_IDX)]=WW(mmux_p_OCTET)
    done
}
function mmux_index_array_to_memory () {
    declare -r  mmux_p_POINTER=PP(1, target memory pointer)
    declare -rn mmux_p_ARRY=PP(2, source index array name)
    declare -ri mmux_p_NUMBER_OF_OCTETS=PP(3, how many octets to copy)
    declare -i  mmux_p_IDX

    for ((mmux_p_IDX=0; mmux_p_IDX < mmux_p_NUMBER_OF_OCTETS; ++mmux_p_IDX))
    do mmux_uint8_pointer_set WW(mmux_p_POINTER) RR(mmux_p_IDX) "${mmux_p_ARRY[RR(mmux_p_IDX)]}"
    done
}

#page
#### after loading hook: misc functions

function mmux_bash_pointers_builtin_p () {
    declare NAME=${1:?"missing mandatory parameter NAME in call to '$FUNCNAME'"}

    test 'builtin' = "$(type -t $NAME)"
}

#page
#### after loading hook: end

}

#page
#### before unloading hook

function mmux_bash_pointers_library_before_unloading_hook () {
    unset -v \
	  MMUX_BASH_POINTERS_SIGNED_INTEGER_STEMS	\
	  MMUX_BASH_POINTERS_UNSIGNED_INTEGER_STEMS	\
	  MMUX_BASH_POINTERS_INTEGER_STEMS		\
	  MMUX_BASH_POINTERS_REAL_FLOAT_STEMS		\
	  MMUX_BASH_POINTERS_COMPLEX_FLOAT_STEMS	\
	  MMUX_BASH_POINTERS_FLOAT_STEMS		\
	  MMUX_BASH_POINTERS_REAL_STEMS			\
	  MMUX_BASH_POINTERS_COMPLEX_STEMS		\
	  MMUX_BASH_POINTERS_STEMS

    unset -f \
	  mmux_index_array_from_memory				\
	  mmux_index_array_to_memory				\
	  mmux_bash_pointers_builtin_p				\
	  mmux_bash_pointers_library_after_loading_hook		\
	  mmux_bash_pointers_library_before_unloading_hook
}

#page
#### let's go

mmux_package_provide_by_descriptor MMUX_BASH_POINTERS_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End:
