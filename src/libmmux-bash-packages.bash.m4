#
# Part of: MMUX Bash Pointers
# Contents: GNU Bash packages management
# Date: Oct 11, 2024
#
# Abstract
#
#	This library implements a package management API.
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
#### loading and unloading packages

function mmux_package_load_from_descriptor () {
    declare -n PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare BUILTIN_NAME
    declare -i IDX

    mmux_package_check_packaging_version QQ(1)
    mmux_package_print_debug_message 'loading library from descriptor: "%s"' QQ(1)

    # Check if there  are builtins to enable; if there  are: there must also be a  shared library to
    # enabled them from.
    if test -v SS(PACKAGE_DESCRIPTOR,BUILTIN_0) -a -n QQ(PACKAGE_DESCRIPTOR,BUILTIN_0)
    then
	if ! test -v SS(PACKAGE_DESCRIPTOR,SHARED_LIBRARY) -a -n QQ(PACKAGE_DESCRIPTOR,SHARED_LIBRARY)
	then
	    mmux_package_print_error_message 'package descriptor "%s" has builtins but no shared library specification' QQ(1)
	    mmux_package_exit_because_error_loading_package
	fi
    fi

    for ((IDX=0; ; ++IDX))
    do
	if test -v SS(PACKAGE_DESCRIPTOR,BUILTIN_$IDX)
	then
	    BUILTIN_NAME=RR(PACKAGE_DESCRIPTOR,BUILTIN_$IDX)
	    if mmux_package_debug_mode_is_on
	    then
		if ! mmux_package_string_is_identifier QQ(BUILTIN_NAME)
		then
		    mmux_package_print_error_message 'invalid builtin name: "%s"' QQ(BUILTIN_NAME)
		    break
		fi
	    fi
	    enable -f QQ(PACKAGE_DESCRIPTOR,SHARED_LIBRARY) WW(BUILTIN_NAME)
	    PACKAGE_DESCRIPTOR[ENABLED_BUILTIN_$IDX]=RR(BUILTIN_NAME)
	else break
	fi
    done

    #mbfl_array_dump PACKAGE_DESCRIPTOR PACKAGE_DESCRIPTOR

    if test -n QQ(PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)
    then
	mmux_package_print_debug_message 'evaluating after loading hook: "%s"' QQ(PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)
	RR(PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)
    fi
}
function mmux_package_unload_from_descriptor () {
    declare -n PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}

    mmux_package_check_packaging_version QQ(1)

    if test -v SS(PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)
    then RR(PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)
    fi

    {
	declare BUILTIN_NAME
	declare -i IDX

	for ((IDX=0; ; ++IDX))
	do
	    if test -v SS(PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
	    then
		BUILTIN_NAME=RR(PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
		enable -d WW(BUILTIN_NAME)
		unset -v SS(PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
	    else break
	    fi
	done
    }
}

#page
#### helpers

function mmux_package_check_packaging_version () {
    declare -n PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}

    if ! test -v  SS(PACKAGE_DESCRIPTOR,PACKAGING_VERSION)	\
	 -a '0' = QQ(PACKAGE_DESCRIPTOR,PACKAGING_VERSION)
    then
	mmux_package_print_error_message 'invalid package descriptor, or wrong packaging version: "%s"' QQ(1)
	mmux_package_exit_because_error_loading_package
    fi
}
function mmux_package_string_is_identifier () {
    declare -r STRING=$1
    declare -r REX='^[a-zA-Z0-9_][a-zA-Z0-9_\.\+\-]*$'

    if test -z QQ(STRING)
    then return 1
    elif [[ WW(STRING) =~ RR(REX) ]]
    then return 0
    else return 1
    fi
}
function mmux_package_print_error_message () {
    declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
    shift 1

    {
	printf 'MMUX Package Manager: error: '
	printf QQ(TEMPLATE) "$@"
	printf '\n'
    } >&2
}
function mmux_package_debug_mode_is_on () {
    test -v MMUX_BASH_PACKAGES_DEBUG -a QQ(MMUX_BASH_PACKAGES_DEBUG) = 'true'
}
function mmux_package_print_debug_message () {
    if mmux_package_debug_mode_is_on
    then
	declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
	shift 1
	{
	    printf 'MMUX Package Manager: debug: '
	    printf QQ(TEMPLATE) "$@"
	    printf '\n'
	} >&2
    fi
}
function mmux_package_exit_because_error_loading_package () {
    exit 100
}

### end of file
# Local Variables:
# mode: sh
# End:
