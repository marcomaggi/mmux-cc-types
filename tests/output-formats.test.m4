#!#
#!# Part of: MMUX Bash Pointers
#!# Contents: tests for output-format builtins
#!# Date: Sep 30, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/output-formats.test ; less tests/output-formats.log
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


#### type variables: float

function output-formats-float-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float_add ROP WW(OP)
    mmux_float_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    # This is a "float" number, it has limited precision.
    #                        0123456789
    declare -r EXPECTED_ROP='123.456787'

    mbfl_location_enter
    {
	if mmux_float_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float_set_format WW(OLD_FORMAT)"
	fi
	mmux_float_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float_set_format WW(OLD_FORMAT)"
	fi
	mmux_float_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: double

function output-formats-double-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_double_add ROP WW(OP)
    mmux_double_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-double-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_double_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_double_set_format WW(OLD_FORMAT)"
	fi
	mmux_double_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-double-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_double_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_double_set_format WW(OLD_FORMAT)"
	fi
	mmux_double_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}


#### type variables: ldouble

if test -v mmux_libc_SIZEOF_LDOUBLE
then

function output-formats-ldouble-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_ldouble_add ROP WW(OP)
    mmux_ldouble_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-ldouble-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_ldouble_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_ldouble_set_format WW(OLD_FORMAT)"
	fi
	mmux_ldouble_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-ldouble-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_ldouble_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_ldouble_set_format WW(OLD_FORMAT)"
	fi
	mmux_ldouble_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float32

if test -v mmux_libc_SIZEOF_FLOAT32
then

function output-formats-float32-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float32_add ROP WW(OP)
    mmux_float32_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float32-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456787'

    mbfl_location_enter
    {
	if mmux_float32_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float32_set_format WW(OLD_FORMAT)"
	fi
	mmux_float32_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float32-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float32_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float32_set_format WW(OLD_FORMAT)"
	fi
	mmux_float32_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float64

if test -v mmux_libc_SIZEOF_FLOAT64
then

function output-formats-float64-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float64_add ROP WW(OP)
    mmux_float64_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float64-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_float64_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float64_set_format WW(OLD_FORMAT)"
	fi
	mmux_float64_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float64-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float64_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float64_set_format WW(OLD_FORMAT)"
	fi
	mmux_float64_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float128

if test -v mmux_libc_SIZEOF_FLOAT128
then

function output-formats-float128-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float128_add ROP WW(OP)
    mmux_float128_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float128-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_float128_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float128_set_format WW(OLD_FORMAT)"
	fi
	mmux_float128_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float128-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float128_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float128_set_format WW(OLD_FORMAT)"
	fi
	mmux_float128_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float32x

if test -v mmux_libc_SIZEOF_FLOAT32X
then

function output-formats-float32x-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float32x_add ROP WW(OP)
    mmux_float32x_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float32x-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_float32x_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float32x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float32x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float32x-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float32x_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float32x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float32x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float64x

if test -v mmux_libc_SIZEOF_FLOAT64X
then

function output-formats-float64x-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float64x_add ROP WW(OP)
    mmux_float64x_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float64x-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_float64x_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float64x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float64x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float64x-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float64x_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float64x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float64x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: float128x

if test -v mmux_libc_SIZEOF_FLOAT128X
then

function output-formats-float128x-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_float128x_add ROP WW(OP)
    mmux_float128x_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float128x-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_float128x_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_float128x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float128x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-float128x-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_float128x_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_float128x_set_format WW(OLD_FORMAT)"
	fi
	mmux_float128x_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: decimal32

if test -v mmux_libc_SIZEOF_DECIMAL32
then

function output-formats-decimal32-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.456800'

    mmux_decimal32_add ROP WW(OP)
    mmux_decimal32_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal32-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456800'

    mbfl_location_enter
    {
	if mmux_decimal32_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal32_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal32_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal32-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_decimal32_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal32_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal32_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: decimal64

if test -v mmux_libc_SIZEOF_DECIMAL64
then

function output-formats-decimal64-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_decimal64_add ROP WW(OP)
    mmux_decimal64_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal64-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_decimal64_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal64_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal64_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal64-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_decimal64_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal64_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal64_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: decimal128

if test -v mmux_libc_SIZEOF_DECIMAL128
then

function output-formats-decimal128-1.1 () {
    declare ROP OP='123.4567890'
    declare -r EXPECTED_ROP='123.4567890'

    mmux_decimal128_add ROP WW(OP)
    mmux_decimal128_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal128-1.2 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        0123456789
    declare -r EXPECTED_ROP='123.456789'

    mbfl_location_enter
    {
	if mmux_decimal128_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal128_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal128_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-decimal128-1.3 () {
    declare ROP OP='123.4567890' OLD_FORMAT
    #                        012345
    declare -r EXPECTED_ROP='123.46'

    mbfl_location_enter
    {
	if mmux_decimal128_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_decimal128_set_format WW(OLD_FORMAT)"
	fi
	mmux_decimal128_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}

fi


#### type variables: complexd

function output-formats-complexd-1.1 () {
    declare ROP OP='(123.4567890)+i*(789.0123456)' OLD_FORMAT
    declare -r EXPECTED_ROP='(123.4567890)+i*(789.0123456)'

    mmux_complexd_add ROP WW(OP)
    mmux_complexd_equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-complexd-1.2 () {
    declare ROP OP='(123.4567890)+i*(789.0123456)' OLD_FORMAT
    declare -r EXPECTED_ROP='(123.456789)+i*(789.012346)'

    mbfl_location_enter
    {
	if mmux_double_set_format '%f' OLD_FORMAT
	then mbfl_location_handler "mmux_double_set_format WW(OLD_FORMAT)"
	fi
	mmux_complexd_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}
function output-formats-complexd-1.3 () {
    declare ROP OP='(123.4567890)+i*(789.0123456)' OLD_FORMAT
    declare -r EXPECTED_ROP='(123.46)+i*(789.01)'

    mbfl_location_enter
    {
	if mmux_double_set_format '%.2f' OLD_FORMAT
	then mbfl_location_handler "mmux_double_set_format WW(OLD_FORMAT)"
	fi
	mmux_complexd_add ROP WW(OP)
    }
    mbfl_location_leave

    dotest-equal WW(EXPECTED_ROP) WW(ROP)
}



#### let's go

dotest output-formats-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
