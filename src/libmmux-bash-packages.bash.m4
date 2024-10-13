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
#### package descriptor

declare -gA MMUX_BASH_PACKAGES_PACKAGE=([PACKAGING_VERSION]='0'
					[PACKAGE_NAME]='MMUX Bash Packages'
					[SEMANTIC_VERSION]='mmux_bash_pointers_SEMANTIC_VERSION'
					[INTERFACE_VERSION_CURRENT]='0'
					[INTERFACE_VERSION_REVISION]='0'
					[INTERFACE_VERSION_AGE]='0'
					[SHELL_LIBRARY]='libmmux-bash-packages.bash')

#page
#### package registry

declare -gA MMUX_BASH_PACKAGES_REGISTRY

function mmux_package_register_descriptor_as_provided () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    MMUX_BASH_PACKAGES_REGISTRY[WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)]='provided'
}
function mmux_package_register_descriptor_as_loaded () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    MMUX_BASH_PACKAGES_REGISTRY[WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)]='loaded'
}
function mmux_package_forget_descriptor () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    unset -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME))
}
function mmux_package_descriptor_is_registered () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    test -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME))
}
function mmux_package_descriptor_is_registered_as_provided () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    test -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)) -a \
	 'provided' = WW(MMUX_BASH_PACKAGES_REGISTRY,RR(mmux_p_PACKAGE_DESCRIPTOR_NAME))
}
function mmux_package_descriptor_is_registered_as_loaded () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    test -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)) -a \
	 'loaded' = WW(MMUX_BASH_PACKAGES_REGISTRY,RR(mmux_p_PACKAGE_DESCRIPTOR_NAME))
}

#page
#### providing a package

function mmux_package_provide_by_descriptor () {
    declare -r PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}

    mmux_package_check_packaging_version WW(PACKAGE_DESCRIPTOR_NAME)
    mmux_package_print_debug_message 'providing package: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)

    # Register the new descriptor.
    {
	if mmux_package_descriptor_is_registered WW(PACKAGE_DESCRIPTOR_NAME)
	then
	    mmux_package_print_warning_message 'attempting to provide an already provided package: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)
	    return 1
	else mmux_package_register_descriptor_as_provided WW(PACKAGE_DESCRIPTOR_NAME)
	fi
    }

    # If requested load the package right now.
    {
	if mmux_package_load_when_provide_is_enabled
	then mmux_package_load_by_descriptor WW(PACKAGE_DESCRIPTOR_NAME)
	fi
    }
}
function mmux_package_enable_load_when_provide () {
    function mmux_package_load_when_provide_is_enabled () { true; }
}
function mmux_package_disable_load_when_provide () {
    function mmux_package_load_when_provide_is_enabled () { false; }
}

#page
#### loading packages

function mmux_package_load_by_descriptor () {
    declare -r PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(PACKAGE_DESCRIPTOR_NAME)

    mmux_package_check_packaging_version WW(PACKAGE_DESCRIPTOR_NAME)
    mmux_package_print_debug_message 'loading package by descriptor: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)

    # Check if there  are builtins to enable; if there  are: there must also be a  shared library to
    # enabled them from.
    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_0) -a -n QQ(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_0)
    then
	if ! test -v SS(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY) -a -n QQ(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY)
	then
	    mmux_package_print_error_message 'package descriptor "%s" has builtins but no shared library specification' \
					     WW(PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_exit_because_error_loading_package
	fi
    fi

    {
	declare BUILTIN_NAME
	declare -i IDX

	for ((IDX=0; ; ++IDX))
	do
	    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_$IDX)
	    then
		BUILTIN_NAME=RR(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_$IDX)
		if mmux_package_debug_mode_is_enabled
		then
		    if ! mmux_package_string_is_identifier WW(BUILTIN_NAME)
		    then
			mmux_package_print_error_message 'invalid builtin name: "%s"' WW(BUILTIN_NAME)
			break
		    fi
		fi
		enable -f QQ(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY) WW(BUILTIN_NAME)
		mmux_p_PACKAGE_DESCRIPTOR[ENABLED_BUILTIN_$IDX]=RR(BUILTIN_NAME)
	    else break
	    fi
	done
    }

    if ! mmux_package_run_descriptor_after_loading_hook WW(PACKAGE_DESCRIPTOR_NAME)
    then return 1
    fi

    mmux_package_register_descriptor_as_loaded WW(PACKAGE_DESCRIPTOR_NAME)
}
function mmux_package_run_descriptor_after_loading_hook () {
    declare -r PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(PACKAGE_DESCRIPTOR_NAME)

    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)
    then
	declare -n mmux_p_AFTER_LOADING_HOOK=SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)

	mmux_package_print_debug_message 'evaluating after loading hook: "%s"' WW(mmux_p_AFTER_LOADING_HOOK)
	if ! WW(mmux_p_AFTER_LOADING_HOOK)
	then
	    mmux_package_print_verbose_message 'failed package after loading hook: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)
	    return 1
	fi
    fi
}

#page
#### unloading

function mmux_package_unload_by_descriptor () {
    declare -r PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(PACKAGE_DESCRIPTOR_NAME)

    mmux_package_check_packaging_version WW(PACKAGE_DESCRIPTOR_NAME)
    mmux_package_print_debug_message 'unloading package by descriptor: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)

    if ! mmux_package_run_descriptor_before_unloading_hook WW(PACKAGE_DESCRIPTOR_NAME)
    then return 1
    fi

    {
	declare BUILTIN_NAME
	declare -i IDX

	for ((IDX=0; ; ++IDX))
	do
	    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
	    then
		BUILTIN_NAME=RR(mmux_p_PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
		enable -d WW(BUILTIN_NAME)
		unset -v SS(mmux_p_PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$IDX)
	    else break
	    fi
	done
    }
}
function mmux_package_run_descriptor_before_unloading_hook () {
    declare -r PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(PACKAGE_DESCRIPTOR_NAME)

    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)
    then
	declare -n mmux_p_BEFORE_UNLOADING_HOOK=SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)

	mmux_package_print_debug_message 'evaluating after loading hook: "%s"' WW(mmux_p_BEFORE_UNLOADING_HOOK)
	if ! WW(mmux_p_BEFORE_UNLOADING_HOOK)
	then
	    mmux_package_print_verbose_message 'failed package before unloading hook: "%s"' WW(PACKAGE_DESCRIPTOR_NAME)
	    return 1
	fi
    fi
}

#page
#### data validation functions

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
function mmux_package_string_is_shell_library_filename () {
    declare -r STRING=$1
    declare -r REX='^lib[a-zA-Z0-9_][a-zA-Z0-9_\.\+\-]*\.bash$'

    if test -z QQ(STRING)
    then return 1
    elif [[ WW(STRING) =~ RR(REX) ]]
    then return 0
    else return 1
    fi
}

#page
#### printing messages

function mmux_package_print_error_message () {
    declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
    shift 1

    {
	printf 'MMUX Package Manager: error: '
	printf QQ(TEMPLATE) "$@"
	printf '\n'
    } >&2
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

### ------------------------------------------------------------------------

function mmux_package_enable_verbose_mode () {
    function mmux_package_verbose_mode_is_enabled () { true; }
}
function mmux_package_disable_verbose_mode () {
    function mmux_package_verbose_mode_is_enabled () { false; }
}
function mmux_package_print_verbose_message () {
    if mmux_package_verbose_mode_is_enabled
    then
	declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
	shift 1
	{
	    printf 'MMUX Bash Package: '
	    printf QQ(TEMPLATE) "$@"
	    printf '\n'
	} >&2
    fi
}

### ------------------------------------------------------------------------

function mmux_package_enable_debug_mode () {
    function mmux_package_debug_mode_is_enabled () { true; }
}
function mmux_package_disable_debug_mode () {
    function mmux_package_debug_mode_is_enabled () { false; }
}
function mmux_package_print_debug_message () {
    if mmux_package_debug_mode_is_enabled
    then
	declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
	shift 1
	{
	    printf 'MMUX Bash Package: debug: '
	    printf QQ(TEMPLATE) "$@"
	    printf '\n'
	} >&2
    fi
}

#page
#### helpers

# Return  true  if  a  package  descriptor  declares itself  as  adhering  to  MMUX  Bash  Packaging
# Infrastructure version 0; otherwise exit with error status.
#
function mmux_package_check_packaging_version () {
    declare -n mmux_p_PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}

    if ! test -v  SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGING_VERSION)	\
	 -a '0' = RR(mmux_p_PACKAGE_DESCRIPTOR,PACKAGING_VERSION)
    then
	mmux_package_print_error_message 'invalid package descriptor, or wrong packaging version: "%s"' WW(1)
	mmux_package_exit_because_error_loading_package
    fi
}
function mmux_package_exit_because_error_loading_package () {
    exit 100
}

#page
#### let's go

mmux_package_disable_verbose_mode
mmux_package_disable_debug_mode
mmux_package_enable_load_when_provide
mmux_package_provide_by_descriptor MMUX_BASH_PACKAGES_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End:
