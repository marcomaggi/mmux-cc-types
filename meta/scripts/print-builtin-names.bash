#!/bin/bash
#
# Part of: MMUX Bash Pointers
# Contents: core library
# Date: Oct 12, 2024
#
# Abstract
#
#	Run this script to output a list of builtin names.
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

declare -ra SIGNED_INTEGER_STEMS=(schar sshort sint slong sllong
				  sint8 sint16 sint32 sint64 ssize
				  sintmax sintptr ptrdiff off uid gid wchar)
declare -ra UNSIGNED_INTEGER_STEMS=(uchar ushort uint ulong ullong
				    uint8 uint16 uint32 uint64 usize
				    uintmax uintptr mode pid wint)
declare -ra INTEGER_STEMS=("${SIGNED_INTEGER_STEMS[@]}" "${UNSIGNED_INTEGER_STEMS[@]}")

declare -ra REAL_FLOAT_STEMS=(float double ldouble
			      float32 float64 float128
			      float32x float64x float128x
			      decimal32 decimal64 decimal128)
declare -ra COMPLEX_FLOAT_STEMS=(complexf complexd complexld
				 complexf32 complexf64 complexf128
				 complexf32x complexf64x complexf128x
				 complexd32 complexd64 complexd128)
declare -ra FLOAT_STEMS=("${REAL_FLOAT_STEMS[@]}" "${COMPLEX_FLOAT_STEMS[@]}")

declare -ga MMUX_BASH_POINTERS_REAL_STEMS=('pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}")
declare -ga MMUX_BASH_POINTERS_COMPLEX_STEMS=("${COMPLEX_FLOAT_STEMS[@]}")
declare -ga MMUX_BASH_POINTERS_STEMS=("${MMUX_BASH_POINTERS_REAL_STEMS[@]}" "${MMUX_BASH_POINTERS_COMPLEX_STEMS[@]}")

declare -ra LIBC_BUILTINS=(malloc realloc calloc free
			   memset memcpy memccpy memmove memcmp memchr memrchr
			   strerror errno_to_string
			   open close read write pread pwrite lseek dup dup2 fcntl ioctl
			   strlen strcpy strncpy strdup stpcpy strcat strncat strcmp strncmp strcoll strxfrm
			   strchr strrchr strstr strcasestr strspn strcspn strpbrk strtok
			   link linkat symlink readlink realpath)

declare -ra MATH_REAL_BUILTINS=(sin cos tan asin acos atan atan2
				sinh cosh tanh asinh acosh atanh
				exp exp2 exp10 log log10 log2 logb
				pow sqrt cbrt hypot expm1 log1p
				erf erfc lgamma tgamma j0 j1 jn y0 y1 yn)

declare -ra MATH_COMPLEX_BUILTINS=(sin cos tan asin acos atan
				   sinh cosh tanh asinh acosh atanh
				   exp log log10 pow sqrt)

### ------------------------------------------------------------------------

declare -i IDX=

function print_builtin_name () {
    declare NAME=${1:?"missing parameter 1 name of bulitin in call to '$FUNCNAME'"}

    printf 'MMUX_BASH_POINTERS_PACKAGE[BUILTIN_%d]=%s\n' ${IDX:?} "${NAME:?}"
    let ++IDX
}

print_builtin_name 'mmux_bash_pointers_library_init'


declare -i IDX JDX
declare NAME ALIAS ITEM STEM

# Standard C Library stuff.
{
    for ITEM in "${LIBC_BUILTINS[@]}"
    do
	printf -v NAME 'mmux_libc_%s' "$ITEM"
	print_builtin_name "$NAME"
    done

    for NAME in mmux_pointer_from_bash_string mmux_pointer_to_bash_string
    do print_builtin_name "$NAME"
    done
}

for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
do
    printf -v NAME 'mmux_%s_pointer_set' "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_array_set'   "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_pointer_ref' "$STEM"
    print_builtin_name "$NAME"

    printf -v NAME 'mmux_%s_array_ref' "$STEM"
    print_builtin_name "$NAME"
done

# Arithmetics builtins.
{
    print_builtin_name 'mmux_pointer_add'
    print_builtin_name 'mmux_pointer_diff'

    for STEM in "${INTEGER_STEMS[@]}"
    do
	for ITEM in add sub mul div mod neg inv incr decr abs
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in add sub mul div neg inv abs
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in add sub mul div neg inv abs make_rectangular real_part imag_part arg conj
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
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
	    print_builtin_name "$NAME"
	done
    done
}

# Predicates builtins.
{
    for STEM in "${MMUX_BASH_POINTERS_STEMS[@]}"
    do
	printf -v NAME 'mmux_string_is_%s' "$STEM"
	print_builtin_name "$NAME"
    done

    for STEM in 'pointer' "${INTEGER_STEMS[@]}" "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in zero positive negative non_positive non_negative nan infinite
	do
	    printf -v NAME  'mmux_%s_is_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in zero nan infinite
	do
	    printf -v NAME 'mmux_%s_is_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Comparison builtins.
{
    for STEM in 'pointer' "${INTEGER_STEMS[@]}"
    do
	for ITEM in equal greater less greater_equal less_equal min max
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in equal greater less greater_equal less_equal equal_absmargin equal_relepsilon min max
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in equal equal_absmargin equal_relepsilon
	do
	    printf -v NAME  'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Output format selection.
{
    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in set_format ref_format reformat
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in reformat
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

# Mathematics builtins.
{
    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in "${MATH_REAL_BUILTINS[@]}"
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${COMPLEX_FLOAT_STEMS[@]}"
    do
	for ITEM in "${MATH_COMPLEX_BUILTINS[@]}"
	do
	    printf -v NAME 'mmux_%s_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done

    for STEM in "${REAL_FLOAT_STEMS[@]}"
    do
	for ITEM in E LOG2E LOG10E LN2 LN10 PI PI_2 PI_4 1_PI 2_PI 2_SQRTPI SQRT2 SQRT1_2
	do
	    printf -v NAME 'mmux_%s_constant_%s' "$STEM" "$ITEM"
	    print_builtin_name "$NAME"
	done
    done
}

### ------------------------------------------------------------------------

# The environment variable "CONFIG_H_FILE" is exported by the makefile.
#
function have_cfunc () {
    declare -r CFUNCNAME=${1:?}
    declare -r UPCASE_CFUNCNAME=${CFUNCNAME^^}
    declare -r SYMBOL_TEMPLATE='HAVE_%s'
    declare -r RESULT_TEMPLATE='#define HAVE_%s 1'
    declare SYMBOL RESULT LINE

    printf -v SYMBOL "$SYMBOL_TEMPLATE" "${UPCASE_CFUNCNAME}"
    printf -v RESULT "$RESULT_TEMPLATE" "${UPCASE_CFUNCNAME}"

    LINE=$(grep "$SYMBOL" "$CONFIG_H_FILE" )
    if test "$LINE" = "$RESULT"
    then return 0
    else return 1
    fi
}

# Builtin wrapping C language functions that may not be available.
{
    for ITEM in mempcpy strnlen strndup stpncpy strcasecmp strncasecmp strverscmp \
			rawmemchr memmem strchrnul basename dirname canonicalize_file_name
    do
	if have_cfunc "$ITEM"
	then
	    printf '%s: present: %s\n' "$0" "$ITEM" >&2
	    printf -v NAME 'mmux_libc_%s' "$ITEM"
	    print_builtin_name "$NAME"
	else printf '%s: missing: %s\n' "$0" "$ITEM" >&2
	fi
    done
}

### end of file
# Local Variables:
# mode: sh
# End:
