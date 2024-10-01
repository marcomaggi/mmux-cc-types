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
# Lesser General Public  License as published by  the Free Software Foundation, either  version 3 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the  GNU Lesser General Public License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#

#page
function mmux_bash_pointers_library_load () {
    # NOTE These  variables are not  read-only; I felt  in the past  that making them  read-only was
    # safer;  but making  them read-only  prevents unsetting  them, which  is needed  to unload  the
    # library.  Given  that if  you can load  this library,  you can make  much damage  even without
    # mutating these  variables: I have  settled on accepting that  they are not  read-only.  (Marco
    # Maggi; Sep 12, 2024)
    #
    declare -g MMUX_BASH_POINTERS_LIBRARY=libmmux-bash-pointers.so
    declare -g MMUX_BASH_POINTERS_CURRENT=mmux_bash_pointers_VERSION_INTERFACE_CURRENT
    declare -g MMUX_BASH_POINTERS_REVISION=mmux_bash_pointers_VERSION_INTERFACE_REVISION
    declare -g MMUX_BASH_POINTERS_AGE=mmux_bash_pointers_VERSION_INTERFACE_AGE

    declare -ra SIGNED_INTEGER_STEMS=(schar sshort sint slong sllong sint8 sint16 sint32 sint64 ssize \
					    sintmax sintptr ptrdiff off uid gid wchar)
    declare -ra UNSIGNED_INTEGER_STEMS=(uchar ushort uint ulong ullong uint8 uint16 uint32 uint64 usize \
					      uintmax uintptr mode pid wint)
    declare -ra INTEGER_STEMS=("${SIGNED_INTEGER_STEMS[@]}" "${UNSIGNED_INTEGER_STEMS[@]}")

    declare -ra REAL_FLOAT_STEMS=(float double ldouble float32 float64 float128 float32x float64x float128x \
					decimal32 decimal64 decimal128)
    declare -ra COMPLEX_FLOAT_STEMS=(complexf complexd complexld complexf32 complexf64 complexf128 \
					      complexf32x complexf64x complexf128x \
					      complexd32 complexd64 complexd128)
    declare -ra FLOAT_STEMS=("${REAL_FLOAT_STEMS[@]}" "${COMPLEX_FLOAT_STEMS[@]}")

    declare -ga MMUX_BASH_POINTERS_REAL_STEMS=('pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_COMPLEX_STEMS=("${COMPLEX_FLOAT_STEMS[@]}")
    declare -ga MMUX_BASH_POINTERS_STEMS=("${MMUX_BASH_POINTERS_REAL_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}")

    declare -ra LIBC_BUILTINS=(malloc realloc calloc free memset memcpy memmove strerror errno_to_string \
				      open close read write pread pwrite lseek dup dup2)

    # The identifier of every defined builtin is stored in this array.
    declare -ga MMUX_BASH_POINTERS_DEFINED_BUILTINS
    # The identifier of every defined alias is stored in this array.
    declare -ga MMUX_BASH_POINTERS_DEFINED_ALIASES

    # Given an exact integer, in base 10, representing the ASCII code of a character: the element at
    # that index in this array is the character itself.
    #
    # NOTE Is it ugly to do the conversion this way?  I do not care.  (Marco Maggi; Sep 12, 2024)
    #
    declare -ga MMUX_BASH_POINTERS_ASCII_TABLE=($'\x00' $'\x01' $'\x02' $'\x03' $'\x04' $'\x05' $'\x06' $'\x07' $'\x08' $'\x09' $'\x0a' $'\x0b' $'\x0c' $'\x0d' $'\x0e' $'\x0f' $'\x10' $'\x11' $'\x12' $'\x13' $'\x14' $'\x15' $'\x16' $'\x17' $'\x18' $'\x19' $'\x1a' $'\x1b' $'\x1c' $'\x1d' $'\x1e' $'\x1f' $'\x20' $'\x21' $'\x22' $'\x23' $'\x24' $'\x25' $'\x26' $'\x27' $'\x28' $'\x29' $'\x2a' $'\x2b' $'\x2c' $'\x2d' $'\x2e' $'\x2f' $'\x30' $'\x31' $'\x32' $'\x33' $'\x34' $'\x35' $'\x36' $'\x37' $'\x38' $'\x39' $'\x3a' $'\x3b' $'\x3c' $'\x3d' $'\x3e' $'\x3f' $'\x40' $'\x41' $'\x42' $'\x43' $'\x44' $'\x45' $'\x46' $'\x47' $'\x48' $'\x49' $'\x4a' $'\x4b' $'\x4c' $'\x4d' $'\x4e' $'\x4f' $'\x50' $'\x51' $'\x52' $'\x53' $'\x54' $'\x55' $'\x56' $'\x57' $'\x58' $'\x59' $'\x5a' $'\x5b' $'\x5c' $'\x5d' $'\x5e' $'\x5f' $'\x60' $'\x61' $'\x62' $'\x63' $'\x64' $'\x65' $'\x66' $'\x67' $'\x68' $'\x69' $'\x6a' $'\x6b' $'\x6c' $'\x6d' $'\x6e' $'\x6f' $'\x70' $'\x71' $'\x72' $'\x73' $'\x74' $'\x75' $'\x76' $'\x77' $'\x78' $'\x79' $'\x7a' $'\x7b' $'\x7c' $'\x7d' $'\x7e' $'\x7f' $'\x80' $'\x81' $'\x82' $'\x83' $'\x84' $'\x85' $'\x86' $'\x87' $'\x88' $'\x89' $'\x8a' $'\x8b' $'\x8c' $'\x8d' $'\x8e' $'\x8f' $'\x90' $'\x91' $'\x92' $'\x93' $'\x94' $'\x95' $'\x96' $'\x97' $'\x98' $'\x99' $'\x9a' $'\x9b' $'\x9c' $'\x9d' $'\x9e' $'\x9f' $'\xa0' $'\xa1' $'\xa2' $'\xa3' $'\xa4' $'\xa5' $'\xa6' $'\xa7' $'\xa8' $'\xa9' $'\xaa' $'\xab' $'\xac' $'\xad' $'\xae' $'\xaf' $'\xb0' $'\xb1' $'\xb2' $'\xb3' $'\xb4' $'\xb5' $'\xb6' $'\xb7' $'\xb8' $'\xb9' $'\xba' $'\xbb' $'\xbc' $'\xbd' $'\xbe' $'\xbf' $'\xc0' $'\xc1' $'\xc2' $'\xc3' $'\xc4' $'\xc5' $'\xc6' $'\xc7' $'\xc8' $'\xc9' $'\xca' $'\xcb' $'\xcc' $'\xcd' $'\xce' $'\xcf' $'\xd0' $'\xd1' $'\xd2' $'\xd3' $'\xd4' $'\xd5' $'\xd6' $'\xd7' $'\xd8' $'\xd9' $'\xda' $'\xdb' $'\xdc' $'\xdd' $'\xde' $'\xdf' $'\xe0' $'\xe1' $'\xe2' $'\xe3' $'\xe4' $'\xe5' $'\xe6' $'\xe7' $'\xe8' $'\xe9' $'\xea' $'\xeb' $'\xec' $'\xed' $'\xee' $'\xef' $'\xf0' $'\xf1' $'\xf2' $'\xf3' $'\xf4' $'\xf5' $'\xf6' $'\xf7' $'\xf8' $'\xf9' $'\xfa' $'\xfb' $'\xfc' $'\xfd' $'\xfe' $'\xff')

    mmux_bash_pointers_library_define_builtin 'mmux_bash_pointers_library_init'

    # This initialises the library.
    if mmux_bash_pointers_library_init
    then
	declare -i IDX JDX
	declare NAME ALIAS ITEM STEM

	for ITEM in "${LIBC_BUILTINS[@]}"
	do
	    printf -v NAME 'mmux_libc_%s' "$ITEM"
	    mmux_bash_pointers_library_define_builtin "$NAME"
	done

	for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
	do
	    printf -v NAME 'mmux_%s_pointer_set' "$STEM"
	    mmux_bash_pointers_library_define_builtin "$NAME"

	    printf -v NAME 'mmux_%s_array_set'   "$STEM"
	    mmux_bash_pointers_library_define_builtin "$NAME"

	    printf -v NAME 'mmux_%s_pointer_ref' "$STEM"
	    mmux_bash_pointers_library_define_builtin "$NAME"

	    printf -v NAME 'mmux_%s_array_ref' "$STEM"
	    mmux_bash_pointers_library_define_builtin "$NAME"
	done

	# Arithmetics builtins.
	{
	    mmux_bash_pointers_library_define_builtin 'mmux_pointer_add'

	    for STEM in "${INTEGER_STEMS[@]}"
	    do
		for ITEM in add sub mul div mod neg inv incr decr
		do
		    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done

	    for STEM in "${FLOAT_STEMS[@]}"
	    do
		for ITEM in add sub mul div neg inv
		do
		    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done

	    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
	    do
		for ITEM in make_rectangular real_part imag_part abs arg conj
		do
		    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done
	}

	# Bitwise builtins.
	{
	    for STEM in 'pointer' "${INTEGER_STEMS[@]}"
	    do
		for ITEM in and or xor not shl shr
		do
		    printf -v NAME 'mmux_%s_bitwise_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done
	}

	# Predicates builtins.
	{
	    for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
	    do
		printf -v NAME 'mmux_string_is_%s' "$STEM"
		mmux_bash_pointers_library_define_builtin "$NAME"
	    done

	    for STEM in 'pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}"
	    do
		for ITEM in zero positive negative non_positive non_negative nan infinite
		do
		    printf -v NAME  'mmux_%s_is_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done

	    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
	    do
		for ITEM in zero nan infinite
		do
		    printf -v NAME 'mmux_%s_is_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done
	}

	# Comparison builtins.
	{
	    for STEM in 'pointer' "${INTEGER_STEMS[@]}"
	    do
		for ITEM in equal greater lesser greater_equal lesser_equal
		do
		    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done

	    for STEM in "${REAL_FLOAT_STEMS[@]}"
	    do
		for ITEM in equal greater lesser greater_equal lesser_equal equal_absmargin equal_relepsilon
		do
		    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done

	    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
	    do
		for ITEM in equal equal_absmargin equal_relepsilon
		do
		    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done
	}

	# Output format selection.
	{
	    for STEM in "${REAL_FLOAT_STEMS[@]}"
	    do
		printf -v NAME 'mmux_%s_set_format' "$STEM"
		mmux_bash_pointers_library_define_builtin "$NAME"
	    done
	}
    fi
}

#page
function mmux_bash_pointers_library_unload () {
    declare STEM NAME

    mmux_bash_pointers_library_undefine_all_builtins

    unset -v \
	  MMUX_BASH_POINTERS_LIBRARY \
	  MMUX_BASH_POINTERS_CURRENT \
	  MMUX_BASH_POINTERS_REVISION \
	  MMUX_BASH_POINTERS_AGE \
	  MMUX_BASH_POINTERS_DEFINED_BUILTINS \
	  MMUX_BASH_POINTERS_DEFINED_ALIASES \
	  MMUX_BASH_POINTERS_ASCII_TABLE \
	  MMUX_BASH_POINTERS_REAL_STEMS \
	  MMUX_BASH_POINTERS_COMPLEX_STEMS \
	  MMUX_BASH_POINTERS_STEMS

    for STEM in "${MMUX_BASH_POINTERS_REAL_STEMS[@]}"
    do
	printf -v NAME 'mmux_libc_SIZEOF_%s' "$STEM"
	unset  -v "$NAME"
	printf -v NAME 'mmux_libc_MAX_%s' "$STEM"
	unset  -v "$NAME"
	printf -v NAME 'mmux_libc_MIN_%s' "$STEM"
	unset  -v "$NAME"
    done

    for STEM in "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}"
    do
	printf -v NAME 'mmux_libc_SIZEOF_%s' "$STEM"
	unset  -v "$NAME"
    done
}

#page
#### defining and undefining builtins and aliases

function mmux_bash_pointers_library_define_builtin () {
    declare BUILTIN_NAME=${1:?"missing parameter BULITIN_NAME in call to '$FUNCNAME'"}
    declare ALIAS_NAME=$2
    MMUX_BASH_POINTERS_DEFINED_BUILTINS[${#MMUX_BASH_POINTERS_DEFINED_BUILTINS[@]}]=${BUILTIN_NAME:?}

    enable -f "${MMUX_BASH_POINTERS_LIBRARY:?}" "${BUILTIN_NAME:?}"
    if test -n "$ALIAS_NAME"
    then
	alias "${ALIAS_NAME:?}"="${BUILTIN_NAME:?}"
	MMUX_BASH_POINTERS_DEFINED_ALIASES[${#MMUX_BASH_POINTERS_DEFINED_ALIASES[@]}]=${ALIAS_NAME:?}
    fi
}
function mmux_bash_pointers_library_undefine_all_builtins () {
    declare -i IDX

    for ((IDX=0; IDX < ${#MMUX_BASH_POINTERS_DEFINED_BUILTINS[@]}; ++IDX))
    do enable -d "${MMUX_BASH_POINTERS_DEFINED_BUILTINS[$IDX]}"
    done

    for ((IDX=0; IDX < ${#MMUX_BASH_POINTERS_DEFINED_ALIASES[@]}; ++IDX))
    do unalias "${MMUX_BASH_POINTERS_DEFINED_ALIASES[$IDX]}"
    done
}

#page
#### let's go

mmux_bash_pointers_library_load

#page
#### utilities
#
# NOTE  For reasons  of honest  ignorance on  my part:  I do  not know  why I  have to  define these
# functions after  I have loaded the  library.  If I  do not do it:  an error is raised  because the
# "pointer-" builtins are seen as undefined.  (Marco Maggi; Sep 12, 2024)
#

function mmux-bash-pointers-array-from-memory () {
    declare -rn ARRY=${1:?"missing target index array name parameter to '$FUNCNAME'"}
    declare -r  POINTER=${2:?"missing source memory pointer parameter to '$FUNCNAME'"}
    declare -ri NUMBER_OF_BYTES=${3:?"missing how many bytes to copy parameter to '$FUNCNAME'"}
    declare -i  IDX BYTE

    for ((IDX=0; IDX < $NUMBER_OF_BYTES; ++IDX))
    do
	mmux_uint8_pointer_ref BYTE $POINTER $IDX
	ARRY[$IDX]=$BYTE
    done
}
function mmux-bash-pointers-memory-from-array () {
    declare -r  POINTER=${1:?"missing target memory pointer parameter to '$FUNCNAME'"}
    declare -rn ARRY=${2:?"missing source index array name parameter to '$FUNCNAME'"}
    declare -ri NUMBER_OF_BYTES=${3:?"missing how many bytes to copy parameter to '$FUNCNAME'"}
    declare -i  IDX

    for ((IDX=0; IDX < $NUMBER_OF_BYTES; ++IDX))
    do mmux_uint8_pointer_set $POINTER $IDX "${ARRY[$IDX]}"
    done
}

### ------------------------------------------------------------------------

function mmux-bash-pointers-string-from-memory () {
    declare -rn STRING=${1:?"missing target string name parameter to '$FUNCNAME'"}
    declare -r  POINTER=${2:?"missing source memory pointer parameter to '$FUNCNAME'"}
    declare -ri NUMBER_OF_BYTES=${3:?"missing how many bytes to copy parameter to '$FUNCNAME'"}
    declare -i  IDX BYTE
    declare CHAR

    for ((IDX=0; IDX < $NUMBER_OF_BYTES; ++IDX))
    do
	mmux_uint8_pointer_ref BYTE $POINTER $IDX
	STRING+=${MMUX_BASH_POINTERS_ASCII_TABLE[$BYTE]}
    done
}
function mmux-bash-pointers-memory-from-string () {
    declare -r  POINTER=${1:?"missing target memory pointer parameter to '$FUNCNAME'"}
    declare -r  STRING=${2:?"missing source string name parameter to '$FUNCNAME'"}
    declare -ri NUMBER_OF_BYTES=${3:?"missing how many bytes to copy parameter to '$FUNCNAME'"}
    declare -i  IDX CHAR

    for ((IDX=0; IDX < $NUMBER_OF_BYTES; ++IDX))
    do
	printf -v CHAR '%d' "'${STRING:$IDX:1}"
	mmux_uint8_pointer_set $POINTER $IDX "$CHAR"
    done
}

### end of file
# Local Variables:
# mode: sh
# End:
