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
#### helpers

alias mmux_package_return_failure='return 1'
alias mmux_package_return_success='return 0'
function mmux_package_exit_because_error_loading_package () {
    exit 100
}

#page
#### package registry

declare -gA MMUX_BASH_PACKAGES_REGISTRY

function mmux_package_forget_descriptor () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    unset -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME))
}
function mmux_package_register_descriptor_as_provided () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    MMUX_BASH_PACKAGES_REGISTRY[WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)]='provided'
}
function mmux_package_register_descriptor_as_loaded () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    MMUX_BASH_PACKAGES_REGISTRY[WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)]='loaded'
}
function mmux_package_register_descriptor_as_broken () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    MMUX_BASH_PACKAGES_REGISTRY[WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)]='broken'
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
function mmux_package_descriptor_is_registered_as_broken () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR_NAME in call to '$FUNCNAME'"}
    test -v SS(MMUX_BASH_PACKAGES_REGISTRY,WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)) -a \
	 'broken' = WW(MMUX_BASH_PACKAGES_REGISTRY,RR(mmux_p_PACKAGE_DESCRIPTOR_NAME))
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
	    mmux_package_return_failure
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
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    mmux_package_check_packaging_version WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    mmux_package_print_debug_message 'loading package by descriptor: "%s"' WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    if mmux_p_package_check_descriptor_has_builtins_to_enable WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    then
	if ! mmux_p_package_check_descriptor_has_shared_library WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	then
	    mmux_package_print_error_message 'package descriptor "%s" has builtins but no shared library specification' \
					     WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_register_descriptor_as_broken WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_return_failure
	fi
	if ! mmux_p_package_enable_builtins WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	then
	    mmux_package_register_descriptor_as_broken WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_return_failure
	fi
    fi

    if ! mmux_package_run_descriptor_after_loading_hook WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    then
	mmux_package_register_descriptor_as_broken WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	mmux_package_return_failure
    fi

    mmux_package_register_descriptor_as_loaded WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
}
function mmux_p_package_check_descriptor_has_builtins_to_enable () {
    declare -n mmux_p_PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    test -v SS(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_0) -a -n QQ(mmux_p_PACKAGE_DESCRIPTOR,BUILTIN_0)
}
function mmux_p_package_check_descriptor_has_shared_library () {
    declare -n mmux_p_PACKAGE_DESCRIPTOR=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    test -v SS(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY) -a -n QQ(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY)
}

function mmux_p_package_enable_builtins () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    declare mmux_p_BUILTIN_NAME mmux_p_KEY
    declare -i mmux_p_IDX

    for ((mmux_p_IDX=0; ; ++mmux_p_IDX))
    do
	mmux_p_KEY=BUILTIN_$mmux_p_IDX
	if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,WW(mmux_p_KEY))
	then
	    mmux_p_BUILTIN_NAME=RR(mmux_p_PACKAGE_DESCRIPTOR,WW(mmux_p_KEY))
	    if mmux_package_debug_mode_is_enabled
	    then
		if ! mmux_package_string_is_identifier WW(mmux_p_BUILTIN_NAME)
		then
		    mmux_package_print_error_message 'invalid builtin name: "%s"' WW(mmux_p_BUILTIN_NAME)
		    continue
		fi
	    fi
	    if mmux_package_ignore_enable_builtin_errors_is_enabled
	    then
		if enable -f QQ(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY) WW(mmux_p_BUILTIN_NAME) &>/dev/null
		then SS(mmux_p_PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$mmux_p_IDX)=RR(mmux_p_BUILTIN_NAME)
		fi
	    else
		if enable -f QQ(mmux_p_PACKAGE_DESCRIPTOR,SHARED_LIBRARY) WW(mmux_p_BUILTIN_NAME)
		then SS(mmux_p_PACKAGE_DESCRIPTOR,ENABLED_BUILTIN_$mmux_p_IDX)=RR(mmux_p_BUILTIN_NAME)
		else mmux_package_return_failure
		fi
	    fi
	else break
	fi
    done
    mmux_package_return_success
}

function mmux_package_run_descriptor_after_loading_hook () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)
    then
	declare -n mmux_p_AFTER_LOADING_HOOK=SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_AFTER_LOADING_HOOK)

	mmux_package_print_debug_message 'evaluating after-loading hook: "%s"' WW(mmux_p_AFTER_LOADING_HOOK)
	if WW(mmux_p_AFTER_LOADING_HOOK)
	then mmux_package_register_descriptor_as_loaded WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	else
	    mmux_package_register_descriptor_as_broken WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_print_verbose_message 'failed after-loading hook: "%s"' WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_return_failure
	fi
    fi
}

function mmux_package_enable_ignore_enable_builtin_errors () {
    function mmux_package_ignore_enable_builtin_errors_is_enabled () { true; }
}
function mmux_package_disable_ignore_enable_builtin_errors () {
    function mmux_package_ignore_enable_builtin_errors_is_enabled () { false; }
}

#page
#### unloading

function mmux_package_unload_by_descriptor () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    mmux_package_check_packaging_version WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    mmux_package_print_debug_message 'unloading package by descriptor: "%s"' WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    if ! mmux_package_run_descriptor_before_unloading_hook WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
    then mmux_package_return_failure
    fi

    {
	declare BUILTIN_NAME KEY
	declare -i IDX

	for ((IDX=0; ; ++IDX))
	do
	    KEY=ENABLED_BUILTIN_$IDX
	    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,WW(KEY))
	    then
		BUILTIN_NAME=RR(mmux_p_PACKAGE_DESCRIPTOR,WW(KEY))
		enable -d WW(BUILTIN_NAME)
		unset -v SS(mmux_p_PACKAGE_DESCRIPTOR,WW(KEY))
	    else break
	    fi
	done
    }
}
function mmux_package_run_descriptor_before_unloading_hook () {
    declare -r mmux_p_PACKAGE_DESCRIPTOR_NAME=${1:?"missing parameter 1 PACKAGE_DESCRIPTOR in call to '$FUNCNAME'"}
    declare -n mmux_p_PACKAGE_DESCRIPTOR=RR(mmux_p_PACKAGE_DESCRIPTOR_NAME)

    if test -v SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)
    then
	declare -n mmux_p_BEFORE_UNLOADING_HOOK=SS(mmux_p_PACKAGE_DESCRIPTOR,PACKAGE_BEFORE_UNLOADING_HOOK)

	mmux_package_print_debug_message 'evaluating before-unloading hook: "%s"' WW(mmux_p_BEFORE_UNLOADING_HOOK)
	if WW(mmux_p_BEFORE_UNLOADING_HOOK)
	then mmux_package_register_descriptor_as_loaded WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	else
	    mmux_package_register_descriptor_as_broken WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_print_verbose_message 'failed before-unloading hook: "%s"' WW(mmux_p_PACKAGE_DESCRIPTOR_NAME)
	    mmux_package_return_failure
	fi
    fi
}

#page
#### data validation functions

function mmux_package_string_is_identifier () {
    declare -r STRING=$1
    declare -r REX='^[a-zA-Z0-9_][a-zA-Z0-9_\.\+\-]*$'

    if test -z QQ(STRING)
    then mmux_package_return_failure
    elif [[ WW(STRING) =~ RR(REX) ]]
    then mmux_package_return_success
    else mmux_package_return_failure
    fi
}
function mmux_package_string_is_shell_library_filename () {
    declare -r STRING=$1
    declare -r REX='^lib[a-zA-Z0-9_][a-zA-Z0-9_\.\+\-]*\.bash$'

    if test -z QQ(STRING)
    then mmux_package_return_failure
    elif [[ WW(STRING) =~ RR(REX) ]]
    then mmux_package_return_success
    else mmux_package_return_failure
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
function mmux_package_print_warning_message () {
    declare -r TEMPLATE=${1:?"missing parameter 1 TEMPLATE in call to '$FUNCNAME'"}
    shift 1

    {
	printf 'MMUX Package Manager: warning: '
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
#### more helpers

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

#page
#### let's go

mmux_package_disable_verbose_mode
mmux_package_disable_debug_mode
mmux_package_enable_load_when_provide
mmux_package_disable_ignore_enable_builtin_errors
mmux_package_provide_by_descriptor MMUX_BASH_PACKAGES_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End:
