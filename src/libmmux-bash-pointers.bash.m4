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

    declare -ra STEMS=(pointer schar uchar sshort ushort sint uint slong ulong sllong ullong float double ldouble complex sint8 uint8 sint16 uint16 sint32 uint32 sint64 uint64 ssize usize sintmax uintmax sintptr uintptr ptrdiff mode off pid uid gid wchar wint)
    declare -ra INTEGER_STEMS=(pointer schar uchar sshort ushort sint uint slong ulong sllong ullong sint8 uint8 sint16 uint16 sint32 uint32 sint64 uint64 ssize usize sintmax uintmax sintptr uintptr ptrdiff mode off pid uid gid wchar wint)
    declare -ra FLOAT_STEMS=(float double ldouble complex)
    declare -ra LIBC_BUILTINS=(malloc realloc calloc free memset memcpy memmove strerror)
    declare -ra INTEGER_ARITHMETICS_OPS=(add sub mul div mod neg)
    declare -ra FLOAT_ARITHMETICS_OPS=(add sub mul div neg)
    declare -ra BITWISE_OPS=(and or xor not shl shr)

    # The identifier of every defined builtin is stored in this array.
    declare -ga MMUX_BASH_POINTERS_DEFINED_BUILTINS
    # The identifier of every defined alias is stored in this array.
    declare -ga MMUX_BASH_POINTERS_DEFINED_ALIASES

    # Given an exact integer, in base 10, representing the ASCII code of a character: the element at
    # that index in this array is the character itself.
    #
    # NOTE Is it ugly to do the conversion this way?  I do not care.  (Marco Maggi; Sep 12, 2024)
    #
    declare -gra MMUX_BASH_POINTERS_ASCII_TABLE=($'\x00' $'\x01' $'\x02' $'\x03' $'\x04' $'\x05' $'\x06' $'\x07' $'\x08' $'\x09' $'\x0a' $'\x0b' $'\x0c' $'\x0d' $'\x0e' $'\x0f' $'\x10' $'\x11' $'\x12' $'\x13' $'\x14' $'\x15' $'\x16' $'\x17' $'\x18' $'\x19' $'\x1a' $'\x1b' $'\x1c' $'\x1d' $'\x1e' $'\x1f' $'\x20' $'\x21' $'\x22' $'\x23' $'\x24' $'\x25' $'\x26' $'\x27' $'\x28' $'\x29' $'\x2a' $'\x2b' $'\x2c' $'\x2d' $'\x2e' $'\x2f' $'\x30' $'\x31' $'\x32' $'\x33' $'\x34' $'\x35' $'\x36' $'\x37' $'\x38' $'\x39' $'\x3a' $'\x3b' $'\x3c' $'\x3d' $'\x3e' $'\x3f' $'\x40' $'\x41' $'\x42' $'\x43' $'\x44' $'\x45' $'\x46' $'\x47' $'\x48' $'\x49' $'\x4a' $'\x4b' $'\x4c' $'\x4d' $'\x4e' $'\x4f' $'\x50' $'\x51' $'\x52' $'\x53' $'\x54' $'\x55' $'\x56' $'\x57' $'\x58' $'\x59' $'\x5a' $'\x5b' $'\x5c' $'\x5d' $'\x5e' $'\x5f' $'\x60' $'\x61' $'\x62' $'\x63' $'\x64' $'\x65' $'\x66' $'\x67' $'\x68' $'\x69' $'\x6a' $'\x6b' $'\x6c' $'\x6d' $'\x6e' $'\x6f' $'\x70' $'\x71' $'\x72' $'\x73' $'\x74' $'\x75' $'\x76' $'\x77' $'\x78' $'\x79' $'\x7a' $'\x7b' $'\x7c' $'\x7d' $'\x7e' $'\x7f' $'\x80' $'\x81' $'\x82' $'\x83' $'\x84' $'\x85' $'\x86' $'\x87' $'\x88' $'\x89' $'\x8a' $'\x8b' $'\x8c' $'\x8d' $'\x8e' $'\x8f' $'\x90' $'\x91' $'\x92' $'\x93' $'\x94' $'\x95' $'\x96' $'\x97' $'\x98' $'\x99' $'\x9a' $'\x9b' $'\x9c' $'\x9d' $'\x9e' $'\x9f' $'\xa0' $'\xa1' $'\xa2' $'\xa3' $'\xa4' $'\xa5' $'\xa6' $'\xa7' $'\xa8' $'\xa9' $'\xaa' $'\xab' $'\xac' $'\xad' $'\xae' $'\xaf' $'\xb0' $'\xb1' $'\xb2' $'\xb3' $'\xb4' $'\xb5' $'\xb6' $'\xb7' $'\xb8' $'\xb9' $'\xba' $'\xbb' $'\xbc' $'\xbd' $'\xbe' $'\xbf' $'\xc0' $'\xc1' $'\xc2' $'\xc3' $'\xc4' $'\xc5' $'\xc6' $'\xc7' $'\xc8' $'\xc9' $'\xca' $'\xcb' $'\xcc' $'\xcd' $'\xce' $'\xcf' $'\xd0' $'\xd1' $'\xd2' $'\xd3' $'\xd4' $'\xd5' $'\xd6' $'\xd7' $'\xd8' $'\xd9' $'\xda' $'\xdb' $'\xdc' $'\xdd' $'\xde' $'\xdf' $'\xe0' $'\xe1' $'\xe2' $'\xe3' $'\xe4' $'\xe5' $'\xe6' $'\xe7' $'\xe8' $'\xe9' $'\xea' $'\xeb' $'\xec' $'\xed' $'\xee' $'\xef' $'\xf0' $'\xf1' $'\xf2' $'\xf3' $'\xf4' $'\xf5' $'\xf6' $'\xf7' $'\xf8' $'\xf9' $'\xfa' $'\xfb' $'\xfc' $'\xfd' $'\xfe' $'\xff')

    mmux_bash_pointers_library_define_builtin 'mmux_bash_pointers_library_init'
    mmux_bash_pointers_library_define_builtin 'mmux_bash_pointers_errno_to_string' 'mmux-bash-pointers-errno-to-string'

    # This initialises the library.
    if mmux_bash_pointers_library_init
    then
	declare -i IDX JDX
	declare NAME ALIAS ITEM STEM

	for ((IDX=0; IDX < ${#LIBC_BUILTINS[@]}; ++IDX))
	do
	    printf -v NAME  'mmux_bash_pointers_%s' "${LIBC_BUILTINS[$IDX]}"
	    printf -v ALIAS 'libc_%s'               "${LIBC_BUILTINS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"
	done

	for ((IDX=0; IDX < ${#STEMS[@]}; ++IDX))
	do
	    printf -v NAME  'mmux_bash_pointers_pointer_set_%s' "${STEMS[$IDX]}"
	    printf -v ALIAS 'pointer-set-%s'                    "${STEMS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"

	    printf -v NAME  'mmux_bash_pointers_array_set_%s'   "${STEMS[$IDX]}"
	    printf -v ALIAS 'array-set-%s'                      "${STEMS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"

	    printf -v NAME  'mmux_bash_pointers_pointer_ref_%s' "${STEMS[$IDX]}"
	    printf -v ALIAS 'pointer-ref-%s'                    "${STEMS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"

	    printf -v NAME  'mmux_bash_pointers_array_ref_%s'   "${STEMS[$IDX]}"
	    printf -v ALIAS 'array-ref-%s'                      "${STEMS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"

	    printf -v NAME  'mmux_bash_pointers_%s_p'		"${STEMS[$IDX]}"
	    printf -v ALIAS 'libc_%s_p'                         "${STEMS[$IDX]}"
	    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"
	done

	# Arithmetics builtins.
	{
	    enable -f "$MMUX_BASH_POINTERS_LIBRARY" 'mmux_bash_pointers_arithmetics_add_pointer'
	    alias 'arithmetics-add-pointer'='mmux_bash_pointers_arithmetics_add_pointer'

	    # Here  we  start from  1,  so  we  skip "pointer"  which  does  not implement  all  the
	    # arithmetics operations.
	    for ((IDX=1; IDX < ${#INTEGER_STEMS[@]}; ++IDX))
	    do
		for ((JDX=0; JDX < ${#INTEGER_ARITHMETICS_OPS[@]}; ++JDX))
		do
		    printf -v NAME  'mmux_bash_pointers_arithmetics_%s_%s' "${INTEGER_ARITHMETICS_OPS[$JDX]}" "${INTEGER_STEMS[$IDX]}"
		    printf -v ALIAS 'arithmetics-%s-%s'                    "${INTEGER_ARITHMETICS_OPS[$JDX]}" "${INTEGER_STEMS[$IDX]}"
		    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"
		done
	    done

	    for ((IDX=0; IDX < ${#FLOAT_STEMS[@]}; ++IDX))
	    do
		for ((JDX=0; JDX < ${#FLOAT_ARITHMETICS_OPS[@]}; ++JDX))
		do
		    printf -v NAME  'mmux_bash_pointers_arithmetics_%s_%s' "${FLOAT_ARITHMETICS_OPS[$JDX]}" "${FLOAT_STEMS[$IDX]}"
		    printf -v ALIAS 'arithmetics-%s-%s'                    "${FLOAT_ARITHMETICS_OPS[$JDX]}" "${FLOAT_STEMS[$IDX]}"
		    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"
		done
	    done
	}

	# Bitwise builtins.
	{
	    for ((IDX=0; IDX < ${#INTEGER_STEMS[@]}; ++IDX))
	    do
		for ((JDX=0; JDX < ${#BITWISE_OPS[@]}; ++JDX))
		do
		    printf -v NAME  'mmux_bash_pointers_bitwise_%s_%s' "${BITWISE_OPS[$JDX]}" "${INTEGER_STEMS[$IDX]}"
		    printf -v ALIAS 'bitwise-%s-%s'                    "${BITWISE_OPS[$JDX]}" "${INTEGER_STEMS[$IDX]}"
		    mmux_bash_pointers_library_define_builtin "$NAME" "$ALIAS"
		done
	    done
	}

	# Predicates builtins.
	{
	    for ((IDX=0; IDX < ${#STEMS[@]}; ++IDX))
	    do
		for ITEM in zero positive negative non_positive non_negative nan infinite
		do
		    printf -v NAME  'mmux_%s_is_%s' "${STEMS[$IDX]}" "$ITEM"
		    mmux_bash_pointers_library_define_builtin "$NAME"
		done
	    done
	}
    fi
}

#page
function mmux_bash_pointers_library_unload () {
    mmux_bash_pointers_library_undefine_all_builtins

    unset -v \
	  MMUX_BASH_POINTERS_LIBRARY \
	  MMUX_BASH_POINTERS_CURRENT \
	  MMUX_BASH_POINTERS_REVISION \
	  MMUX_BASH_POINTERS_AGE \
	  MMUX_BASH_POINTERS_DEFINED_BUILTINS \
	  MMUX_BASH_POINTERS_DEFINED_ALIASES \
	  MMUX_BASH_POINTERS_ASCII_TABLE

    # FIXME  For a  perfect cleanup  we should  also unset  the global  variables defined  by the  C
    # language library  initialisation builtin,  like "libc_SIZEOF_POINTER"  and all  those.  (Marco
    # Maggi; Sep 12, 2024)
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
	pointer-ref-uint8 BYTE $POINTER $IDX
	ARRY[$IDX]=$BYTE
    done
}
function mmux-bash-pointers-memory-from-array () {
    declare -r  POINTER=${1:?"missing target memory pointer parameter to '$FUNCNAME'"}
    declare -rn ARRY=${2:?"missing source index array name parameter to '$FUNCNAME'"}
    declare -ri NUMBER_OF_BYTES=${3:?"missing how many bytes to copy parameter to '$FUNCNAME'"}
    declare -i  IDX

    for ((IDX=0; IDX < $NUMBER_OF_BYTES; ++IDX))
    do pointer-set-uint8 $POINTER $IDX "${ARRY[$IDX]}"
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
	pointer-ref-uint8 BYTE $POINTER $IDX
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
	pointer-set-uint8 $POINTER $IDX "$CHAR"
    done
}

### end of file
# Local Variables:
# mode: sh
# End:
